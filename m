Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6251D70D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 13:50:35 +0200 (CEST)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmwTh-0004Sh-E3
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 07:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmwQd-0002KU-Jh
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:47:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:31816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmwQa-0008KR-1T
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651837636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yilwTR+1kWyyUvLDlj/r4gDsYioy2urpeSLRDjc7FSw=;
 b=O9VmxorYJXLF8ipzy7ApkexVuSULOXXjx0OD2Ix9sJ16b8Hm/9a5RjPc2YuNNeo+0VKsp6
 d66eBLEIWJBWgLPY18GBCQXs4dWTw0m24xLqthnC/Ew2O0M8aLb4gH6+1k5N/oVKOfETY9
 +A4tktOf0/RD6kFH9B6amxeM+sWAGWU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-9lA5KmkENNGpGUXa75gclA-1; Fri, 06 May 2022 07:47:15 -0400
X-MC-Unique: 9lA5KmkENNGpGUXa75gclA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 473DA2999B4A
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 11:47:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28A6F9E75;
 Fri,  6 May 2022 11:47:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	ldoktor@redhat.com
Subject: [PATCH 1/2] thread-pool: optimize scheduling of completion bottom half
Date: Fri,  6 May 2022 07:47:10 -0400
Message-Id: <20220506114711.1398662-2-pbonzini@redhat.com>
In-Reply-To: <20220506114711.1398662-1-pbonzini@redhat.com>
References: <20220506114711.1398662-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The completion bottom half was scheduled within the pool->lock
critical section.  That actually results in worse performance,
because the worker thread can run its own small critical section
and go to sleep before the bottom half starts running.

Note that this simple change does not produce an improvement without
changing the thread pool QemuSemaphore to a condition variable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index d763cea505..7e9e2c178b 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -108,9 +108,8 @@ static void *worker_thread(void *opaque)
         smp_wmb();
         req->state = THREAD_DONE;
 
-        qemu_mutex_lock(&pool->lock);
-
         qemu_bh_schedule(pool->completion_bh);
+        qemu_mutex_lock(&pool->lock);
     }
 
     pool->cur_threads--;
-- 
2.31.1



