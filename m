Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDAC6A0FCA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:53:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhi-00072u-PT; Thu, 23 Feb 2023 13:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhV-0006u8-Vr
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhU-0003Cl-1Z
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXGuWY5GcYB0GoeELyWGeMtMA4Nwy98ast6Owuep290=;
 b=JL9yM3uwaVEc01jYs1J04AbbZjr70goftx5IuNyJnYmP7tYdG+xZrKaEemSSHDaqzVg9Tf
 LqlDB7CtsBOFxNTbvlazZaj8Vmz9LcHZ8CAHq2eeyqh08hmSQDxPAkn0jo8QDP4JwgY+Xp
 7C0XM4sGuMVTeYs1TJAP0t2GB5kbUeo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-aKp906-INCiGWj6frYF_aQ-1; Thu, 23 Feb 2023 13:52:14 -0500
X-MC-Unique: aKp906-INCiGWj6frYF_aQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B71DA86C14B;
 Thu, 23 Feb 2023 18:52:13 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F1191121314;
 Thu, 23 Feb 2023 18:52:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 24/29] scsi: protect req->aiocb with AioContext lock
Date: Thu, 23 Feb 2023 19:51:41 +0100
Message-Id: <20230223185146.306454-25-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Hajnoczi <stefanha@redhat.com>

If requests are being processed in the IOThread when a SCSIDevice is
unplugged, scsi_device_purge_requests() -> scsi_req_cancel_async() races
with I/O completion callbacks. Both threads load and store req->aiocb.
This can lead to assert(r->req.aiocb == NULL) failures and undefined
behavior.

Protect r->req.aiocb with the AioContext lock to prevent the race.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230221212218.1378734-2-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/scsi/scsi-disk.c    | 23 ++++++++++++++++-------
 hw/scsi/scsi-generic.c | 11 ++++++-----
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index d4e360850f..115584f8b9 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -273,9 +273,11 @@ static void scsi_aio_complete(void *opaque, int ret)
     SCSIDiskReq *r = (SCSIDiskReq *)opaque;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
 
+    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
+
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
-    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
+
     if (scsi_disk_req_check_error(r, ret, true)) {
         goto done;
     }
@@ -357,10 +359,11 @@ static void scsi_dma_complete(void *opaque, int ret)
     SCSIDiskReq *r = (SCSIDiskReq *)opaque;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
 
+    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
+
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
     if (ret < 0) {
         block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
     } else {
@@ -393,10 +396,11 @@ static void scsi_read_complete(void *opaque, int ret)
     SCSIDiskReq *r = (SCSIDiskReq *)opaque;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
 
+    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
+
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
     if (ret < 0) {
         block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
     } else {
@@ -446,10 +450,11 @@ static void scsi_do_read_cb(void *opaque, int ret)
     SCSIDiskReq *r = (SCSIDiskReq *)opaque;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
 
+    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
+
     assert (r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
     if (ret < 0) {
         block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
     } else {
@@ -530,10 +535,11 @@ static void scsi_write_complete(void * opaque, int ret)
     SCSIDiskReq *r = (SCSIDiskReq *)opaque;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
 
+    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
+
     assert (r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
     if (ret < 0) {
         block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
     } else {
@@ -1737,10 +1743,11 @@ static void scsi_unmap_complete(void *opaque, int ret)
     SCSIDiskReq *r = data->r;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
 
+    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
+
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
     if (scsi_disk_req_check_error(r, ret, true)) {
         scsi_req_unref(&r->req);
         g_free(data);
@@ -1816,9 +1823,11 @@ static void scsi_write_same_complete(void *opaque, int ret)
     SCSIDiskReq *r = data->r;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
 
+    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
+
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
-    aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
+
     if (scsi_disk_req_check_error(r, ret, true)) {
         goto done;
     }
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 92cce20a4d..ac9fa662b4 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -111,10 +111,11 @@ static void scsi_command_complete(void *opaque, int ret)
     SCSIGenericReq *r = (SCSIGenericReq *)opaque;
     SCSIDevice *s = r->req.dev;
 
+    aio_context_acquire(blk_get_aio_context(s->conf.blk));
+
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->conf.blk));
     scsi_command_complete_noio(r, ret);
     aio_context_release(blk_get_aio_context(s->conf.blk));
 }
@@ -269,11 +270,11 @@ static void scsi_read_complete(void * opaque, int ret)
     SCSIDevice *s = r->req.dev;
     int len;
 
+    aio_context_acquire(blk_get_aio_context(s->conf.blk));
+
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->conf.blk));
-
     if (ret || r->req.io_canceled) {
         scsi_command_complete_noio(r, ret);
         goto done;
@@ -386,11 +387,11 @@ static void scsi_write_complete(void * opaque, int ret)
 
     trace_scsi_generic_write_complete(ret);
 
+    aio_context_acquire(blk_get_aio_context(s->conf.blk));
+
     assert(r->req.aiocb != NULL);
     r->req.aiocb = NULL;
 
-    aio_context_acquire(blk_get_aio_context(s->conf.blk));
-
     if (ret || r->req.io_canceled) {
         scsi_command_complete_noio(r, ret);
         goto done;
-- 
2.39.2


