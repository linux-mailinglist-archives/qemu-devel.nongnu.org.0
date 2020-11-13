Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765352B1EF3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 16:42:37 +0100 (CET)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbDg-0008TN-Iv
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 10:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdbCI-0007sZ-W3
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:41:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdbCE-0003Vu-VG
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605282065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=alDwN/oL//UNytbhS/m/B1K2vBFS4KhuF6edG9owQQY=;
 b=e98mfW1is7c7ArR+LXPitmLFEQPlX7wqzZLFYA2+1+rIjhX2apib/OZdUzxAiWAGt6h9YZ
 kLaCUAOCbb/2DVkX+3AYDsCpxUmu0ItbtFbVpaEsBEYFv7CwLhdyzEnVKLPwBWSGhnAICF
 O7rsb/5v44nJoDFRoXMZVuyd5Nx+VLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-79WJPKePPKagjaD9V3wdfQ-1; Fri, 13 Nov 2020 10:41:03 -0500
X-MC-Unique: 79WJPKePPKagjaD9V3wdfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D58F89CC05;
 Fri, 13 Nov 2020 15:41:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7413F5D9F1;
 Fri, 13 Nov 2020 15:41:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] io_uring: do not use pointer after free
Date: Fri, 13 Nov 2020 10:41:02 -0500
Message-Id: <20201113154102.1460459-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though only the pointer value is only printed, it is untidy
and Coverity complains.

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 037af09471..00a3ee9fb8 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -425,6 +425,6 @@ LuringState *luring_init(Error **errp)
 void luring_cleanup(LuringState *s)
 {
     io_uring_queue_exit(&s->ring);
-    g_free(s);
     trace_luring_cleanup_state(s);
+    g_free(s);
 }
-- 
2.26.2


