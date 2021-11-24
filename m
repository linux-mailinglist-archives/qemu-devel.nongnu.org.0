Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5A45B4B3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 07:56:05 +0100 (CET)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmCK-0007pW-Go
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 01:56:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm1d-0004JO-Dn
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm1b-0004or-QW
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+41GWae3KMa4ZB6JMvkRRagDFX0ABWMXEkiM8aS7PJQ=;
 b=EwnLhCmVu3PSca2tQLZq+yKHFR0KOsjMXHzM3V5+yDKzQrcDeBgC6LAt/oRIy+S3F6836t
 JAFVB/f2S3miU8NIxYP+mzJBPSQrPT2Woqqwl5UCJd31TDB5w1nIWjV26HwgE6pY7vKZmw
 V/a9WNMNv++e2dKwhmPu+OtJVQ1kY2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-RqHj9SjkMMGRmzpWpNqwsw-1; Wed, 24 Nov 2021 01:44:58 -0500
X-MC-Unique: RqHj9SjkMMGRmzpWpNqwsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D84601DDE3;
 Wed, 24 Nov 2021 06:44:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 757B460843;
 Wed, 24 Nov 2021 06:44:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 05/31] block-backend: special comments for blk_set/get_perm
 due to fuse
Date: Wed, 24 Nov 2021 01:43:52 -0500
Message-Id: <20211124064418.3120601-6-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fuse logic can be classified as I/O, so there is no BQL held
during its execution. And yet, it uses blk_{get/set}_perm
functions, that are classified as BQL and clearly require
the BQL lock. Since there is no easy solution for this,
add a couple of TODOs and FIXME in the relevant sections of the
code.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c | 10 ++++++++++
 block/export/fuse.c   | 16 ++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 1f0bda578e..7a4b50a8f0 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -888,6 +888,11 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
                  Error **errp)
 {
     int ret;
+    /*
+     * FIXME: blk_{get/set}_perm should be always called under
+     * BQL, but it is not the case right now (see block/export/fuse.c)
+     */
+    /* assert(qemu_in_main_thread()); */
 
     if (blk->root && !blk->disable_perm) {
         ret = bdrv_child_try_set_perm(blk->root, perm, shared_perm, errp);
@@ -904,6 +909,11 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
 
 void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
 {
+    /*
+     * FIXME: blk_{get/set}_perm should be always called under
+     * BQL, but it is not the case right now (see block/export/fuse.c)
+     */
+    /* assert(qemu_in_main_thread()); */
     *perm = blk->perm;
     *shared_perm = blk->shared_perm;
 }
diff --git a/block/export/fuse.c b/block/export/fuse.c
index 823c126d23..7ceb8d783b 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -89,7 +89,10 @@ static int fuse_export_create(BlockExport *blk_exp,
     /* For growable exports, take the RESIZE permission */
     if (args->growable) {
         uint64_t blk_perm, blk_shared_perm;
-
+        /*
+         * FIXME: blk_{get/set}_perm should not be here, as permissions
+         * should be modified only under BQL and here we are not!
+         */
         blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
 
         ret = blk_set_perm(exp->common.blk, blk_perm | BLK_PERM_RESIZE,
@@ -400,6 +403,11 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
 
     /* Growable exports have a permanent RESIZE permission */
     if (!exp->growable) {
+
+        /*
+         * FIXME: blk_{get/set}_perm should not be here, as permissions
+         * should be modified only under BQL and here we are not!
+         */
         blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
 
         ret = blk_set_perm(exp->common.blk, blk_perm | BLK_PERM_RESIZE,
@@ -413,7 +421,11 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
                        truncate_flags, NULL);
 
     if (!exp->growable) {
-        /* Must succeed, because we are only giving up the RESIZE permission */
+        /*
+         * Must succeed, because we are only giving up the RESIZE permission.
+         * FIXME: blk_{get/set}_perm should not be here, as permissions
+         * should be modified only under BQL and here we are not!
+         */
         blk_set_perm(exp->common.blk, blk_perm, blk_shared_perm, &error_abort);
     }
 
-- 
2.27.0


