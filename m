Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138162D5BE2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:35:43 +0100 (CET)
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knM6g-00061v-3a
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1knLXs-0001ma-LE
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:59:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1knLXl-0003ny-SR
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607605177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5f3C9upXcRtl4Y0TQCia9ogi+eO0XGOmvOojP5JgiY=;
 b=apmXReUbJfP4OeAYYBvp/A3vtBIfvLEy4I8tA9ZHAj/TF1EdDVcHbed+S7Lh/SK97xWviW
 TKL87gEe75nl2EXOLXzopk6DvCfpCCrMLc2ALrt15ZVf65bWVVuY5abYLxH1r7+dBe5cF2
 kTcF91PKuN9tbPkVVYk7nA6AUbmHMZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-R4hJjw9WNAanqQpqrN6V3Q-1; Thu, 10 Dec 2020 07:59:35 -0500
X-MC-Unique: R4hJjw9WNAanqQpqrN6V3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B0C618C8C05;
 Thu, 10 Dec 2020 12:59:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A26EC5D6BA;
 Thu, 10 Dec 2020 12:59:32 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] scsi: fix device removal race vs IO restart callback on
 resume
Date: Thu, 10 Dec 2020 14:59:29 +0200
Message-Id: <20201210125929.1136390-2-mlevitsk@redhat.com>
In-Reply-To: <20201210125929.1136390-1-mlevitsk@redhat.com>
References: <20201210125929.1136390-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is (mostly theoretical) race between removal of a scsi device and
scsi_dma_restart_bh.

It used to be easier to hit this race prior to my / Paulo's patch series
that added rcu to scsi bus device handling code, but IMHO this race
should still be possible to hit, at least in theory.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1854811

Fix it anyway with a patch that was proposed by Paulo in the above bugzilla.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/scsi/scsi-bus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index b901e701f0..edb5c3492a 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -170,6 +170,8 @@ static void scsi_dma_restart_bh(void *opaque)
         scsi_req_unref(req);
     }
     aio_context_release(blk_get_aio_context(s->conf.blk));
+    /* Drop the reference that was acquired in scsi_dma_restart_cb */
+    object_unref(OBJECT(s));
 }
 
 void scsi_req_retry(SCSIRequest *req)
@@ -188,6 +190,8 @@ static void scsi_dma_restart_cb(void *opaque, int running, RunState state)
     }
     if (!s->bh) {
         AioContext *ctx = blk_get_aio_context(s->conf.blk);
+        /* The reference is dropped in scsi_dma_restart_bh.*/
+        object_ref(OBJECT(s));
         s->bh = aio_bh_new(ctx, scsi_dma_restart_bh, s);
         qemu_bh_schedule(s->bh);
     }
-- 
2.26.2


