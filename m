Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA625F96C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:29:17 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFKm-0007to-HR
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2j-0003HE-La
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:37 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48967
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2g-00086J-3U
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rk2QaRiJmw5h+M2V6PWhMz+WeirjZDkXJnaWFTU3fRM=;
 b=XDjSSkH2ItZZvz3nuIazfDFtSVJPqdlyzwQp0vNE4fexiJ+Z17YHjeS4BNTG/RJOAnzLoh
 YsgGbTRzTE2mX+uBZ9MLVuT6fihYqCenTpz20JEaIIGuOghVOFQLvULJBoaZ/VfHygUSx5
 h2HqaLPzvLAIok71eG1tFFl1DpAN0RM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-VHCRdV_DPtWXTlAbItP0Gg-1; Mon, 07 Sep 2020 07:10:30 -0400
X-MC-Unique: VHCRdV_DPtWXTlAbItP0Gg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12E191084C88;
 Mon,  7 Sep 2020 11:10:29 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DFAD9CBA;
 Mon,  7 Sep 2020 11:10:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 34/64] block: Iterate over children in refresh_limits
Date: Mon,  7 Sep 2020 13:09:06 +0200
Message-Id: <20200907110936.261684-35-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:05:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Instead of looking at just bs->file and bs->backing, we should look at
all children that could end up receiving forwarded requests.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/block/io.c b/block/io.c
index 8d777cd0ec..9a1b5c732c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -135,6 +135,8 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
 void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BlockDriver *drv = bs->drv;
+    BdrvChild *c;
+    bool have_limits;
     Error *local_err = NULL;
 
     memset(&bs->bl, 0, sizeof(bs->bl));
@@ -149,14 +151,21 @@ void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
                                 drv->bdrv_co_preadv_part) ? 1 : 512;
 
     /* Take some limits from the children as a default */
-    if (bs->file) {
-        bdrv_refresh_limits(bs->file->bs, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
+    have_limits = false;
+    QLIST_FOREACH(c, &bs->children, next) {
+        if (c->role & (BDRV_CHILD_DATA | BDRV_CHILD_FILTERED | BDRV_CHILD_COW))
+        {
+            bdrv_refresh_limits(c->bs, &local_err);
+            if (local_err) {
+                error_propagate(errp, local_err);
+                return;
+            }
+            bdrv_merge_limits(&bs->bl, &c->bs->bl);
+            have_limits = true;
         }
-        bdrv_merge_limits(&bs->bl, &bs->file->bs->bl);
-    } else {
+    }
+
+    if (!have_limits) {
         bs->bl.min_mem_alignment = 512;
         bs->bl.opt_mem_alignment = qemu_real_host_page_size;
 
@@ -164,15 +173,6 @@ void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
         bs->bl.max_iov = IOV_MAX;
     }
 
-    if (bs->backing) {
-        bdrv_refresh_limits(bs->backing->bs, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
-        bdrv_merge_limits(&bs->bl, &bs->backing->bs->bl);
-    }
-
     /* Then let the driver override it */
     if (drv->bdrv_refresh_limits) {
         drv->bdrv_refresh_limits(bs, errp);
-- 
2.25.4


