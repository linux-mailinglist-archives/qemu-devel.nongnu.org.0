Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D108B50F62A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:55:38 +0200 (CEST)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njGyv-0001nz-Hi
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGux-0006uY-Ja
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGur-0000dN-SK
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAF+iXN/P5vG3kfcg8FnN98Snqyu8MB1Oeu77oXegUk=;
 b=fkZK145glStlEdyXxtiGDuAlMOHmaBSLkFWier0L6pFnNhMMHbz5dg+rXGv7x4oLl2ubE0
 5+xYOlaxrww+t5ZG8uoCup97c6qwnfn5aErv21yz6k+Lq8a06QkdNfdNOy28uxWrIaYtNC
 PWv9MNK8N1zshlwyi4235aj0LZtP5RM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-wbAyKP0ZNyyN_Q2epr6AaQ-1; Tue, 26 Apr 2022 04:51:18 -0400
X-MC-Unique: wbAyKP0ZNyyN_Q2epr6AaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2391811E7A;
 Tue, 26 Apr 2022 08:51:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADF8340D282C;
 Tue, 26 Apr 2022 08:51:17 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 1/8] aio_wait_kick: add missing memory barrier
Date: Tue, 26 Apr 2022 04:51:07 -0400
Message-Id: <20220426085114.199647-2-eesposit@redhat.com>
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems that aio_wait_kick always required a memory barrier
or atomic operation in the caller, but almost nobody actually
took care of doing it.

Let's put the barrier in the function instead.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 util/aio-wait.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/aio-wait.c b/util/aio-wait.c
index bdb3d3af22..c0a343ac87 100644
--- a/util/aio-wait.c
+++ b/util/aio-wait.c
@@ -35,7 +35,8 @@ static void dummy_bh_cb(void *opaque)
 
 void aio_wait_kick(void)
 {
-    /* The barrier (or an atomic op) is in the caller.  */
+    smp_mb();
+
     if (qatomic_read(&global_aio_wait.num_waiters)) {
         aio_bh_schedule_oneshot(qemu_get_aio_context(), dummy_bh_cb, NULL);
     }
-- 
2.31.1


