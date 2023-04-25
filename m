Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B156EE6C4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:33:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMWw-0006x4-OR; Tue, 25 Apr 2023 13:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWW-0006hB-BQ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWT-0004CI-75
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kY9Yt91C+b257xJEoV3GPBV5xbcoCkYeEh9HSE5uPoI=;
 b=XFPZOnFcVj2mtDN5eZPD1euPQjV4br0PG3XJilyShDSW/Ur1nFTRRJjLIbibvVI8daSgUM
 +FeHNV3vcLsEDjg/4fbqs66jOvspaPRAvVbDAE24BOj977VPC7lO6YIbLL4MXIB9NmIVgL
 JHCuA5cSlK++hcjOwkcGN/aGr6qErp0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-B0E5Kck_PvKXhQLcDYPbvg-1; Tue, 25 Apr 2023 13:32:08 -0400
X-MC-Unique: B0E5Kck_PvKXhQLcDYPbvg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 254C7A0F392;
 Tue, 25 Apr 2023 17:32:08 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29F8C492B0F;
 Tue, 25 Apr 2023 17:32:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 03/20] block: bdrv/blk_co_unref() for calls in coroutine
 context
Date: Tue, 25 Apr 2023 19:31:41 +0200
Message-Id: <20230425173158.574203-4-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These functions must not be called in coroutine context, because they
need write access to the graph.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h          |  3 ++-
 include/sysemu/block-backend-global-state.h |  5 ++++-
 block.c                                     |  2 +-
 block/crypto.c                              |  6 +++---
 block/parallels.c                           |  6 +++---
 block/qcow.c                                |  6 +++---
 block/qcow2.c                               | 14 +++++++-------
 block/qed.c                                 |  6 +++---
 block/vdi.c                                 |  6 +++---
 block/vhdx.c                                |  6 +++---
 block/vmdk.c                                | 18 +++++++++---------
 block/vpc.c                                 |  6 +++---
 12 files changed, 44 insertions(+), 40 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 2c312cc774..ec3ddb17a8 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -218,7 +218,8 @@ void bdrv_img_create(const char *filename, const char *fmt,
                      bool quiet, Error **errp);
 
 void bdrv_ref(BlockDriverState *bs);
-void bdrv_unref(BlockDriverState *bs);
+void no_coroutine_fn bdrv_unref(BlockDriverState *bs);
+void coroutine_fn no_co_wrapper bdrv_co_unref(BlockDriverState *bs);
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child);
 BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BlockDriverState *child_bs,
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 2b6d27db7c..fa83f9389c 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -42,7 +42,10 @@ blk_co_new_open(const char *filename, const char *reference, QDict *options,
 
 int blk_get_refcnt(BlockBackend *blk);
 void blk_ref(BlockBackend *blk);
-void blk_unref(BlockBackend *blk);
+
+void no_coroutine_fn blk_unref(BlockBackend *blk);
+void coroutine_fn no_co_wrapper blk_co_unref(BlockBackend *blk);
+
 void blk_remove_all_bs(void);
 BlockBackend *blk_by_name(const char *name);
 BlockBackend *blk_next(BlockBackend *blk);
diff --git a/block.c b/block.c
index 5ec1a3897e..20d5ee0959 100644
--- a/block.c
+++ b/block.c
@@ -680,7 +680,7 @@ int coroutine_fn bdrv_co_create_opts_simple(BlockDriver *drv,
 
     ret = 0;
 out:
-    blk_unref(blk);
+    blk_co_unref(blk);
     return ret;
 }
 
diff --git a/block/crypto.c b/block/crypto.c
index ca67289187..8fd3ad0054 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -355,7 +355,7 @@ block_crypto_co_create_generic(BlockDriverState *bs, int64_t size,
     ret = 0;
  cleanup:
     qcrypto_block_free(crypto);
-    blk_unref(blk);
+    blk_co_unref(blk);
     return ret;
 }
 
@@ -661,7 +661,7 @@ block_crypto_co_create_luks(BlockdevCreateOptions *create_options, Error **errp)
 
     ret = 0;
 fail:
-    bdrv_unref(bs);
+    bdrv_co_unref(bs);
     return ret;
 }
 
@@ -730,7 +730,7 @@ fail:
         bdrv_co_delete_file_noerr(bs);
     }
 
-    bdrv_unref(bs);
+    bdrv_co_unref(bs);
     qapi_free_QCryptoBlockCreateOptions(create_opts);
     qobject_unref(cryptoopts);
     return ret;
diff --git a/block/parallels.c b/block/parallels.c
index 013684801a..b49c35929e 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -613,8 +613,8 @@ static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
 
     ret = 0;
 out:
-    blk_unref(blk);
-    bdrv_unref(bs);
+    blk_co_unref(blk);
+    bdrv_co_unref(bs);
     return ret;
 
 exit:
@@ -691,7 +691,7 @@ parallels_co_create_opts(BlockDriver *drv, const char *filename,
 
 done:
     qobject_unref(qdict);
-    bdrv_unref(bs);
+    bdrv_co_unref(bs);
     qapi_free_BlockdevCreateOptions(create_options);
     return ret;
 }
diff --git a/block/qcow.c b/block/qcow.c
index 490e4f819e..a0c701f578 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -915,8 +915,8 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
     g_free(tmp);
     ret = 0;
 exit:
-    blk_unref(qcow_blk);
-    bdrv_unref(bs);
+    blk_co_unref(qcow_blk);
+    bdrv_co_unref(bs);
     qcrypto_block_free(crypto);
     return ret;
 }
@@ -1015,7 +1015,7 @@ qcow_co_create_opts(BlockDriver *drv, const char *filename,
 fail:
     g_free(backing_fmt);
     qobject_unref(qdict);
-    bdrv_unref(bs);
+    bdrv_co_unref(bs);
     qapi_free_BlockdevCreateOptions(create_options);
     return ret;
 }
diff --git a/block/qcow2.c b/block/qcow2.c
index 94cf59af8b..01742b3ebe 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3705,7 +3705,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         goto out;
     }
 
-    blk_unref(blk);
+    blk_co_unref(blk);
     blk = NULL;
 
     /*
@@ -3785,7 +3785,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         }
     }
 
-    blk_unref(blk);
+    blk_co_unref(blk);
     blk = NULL;
 
     /* Reopen the image without BDRV_O_NO_FLUSH to flush it before returning.
@@ -3810,9 +3810,9 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
 
     ret = 0;
 out:
-    blk_unref(blk);
-    bdrv_unref(bs);
-    bdrv_unref(data_bs);
+    blk_co_unref(blk);
+    bdrv_co_unref(bs);
+    bdrv_co_unref(data_bs);
     return ret;
 }
 
@@ -3943,8 +3943,8 @@ finish:
     }
 
     qobject_unref(qdict);
-    bdrv_unref(bs);
-    bdrv_unref(data_bs);
+    bdrv_co_unref(bs);
+    bdrv_co_unref(data_bs);
     qapi_free_BlockdevCreateOptions(create_options);
     return ret;
 }
diff --git a/block/qed.c b/block/qed.c
index 0705a7b4e2..aff2a2076e 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -748,8 +748,8 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCreateOptions *opts,
     ret = 0; /* success */
 out:
     g_free(l1_table);
-    blk_unref(blk);
-    bdrv_unref(bs);
+    blk_co_unref(blk);
+    bdrv_co_unref(bs);
     return ret;
 }
 
@@ -819,7 +819,7 @@ bdrv_qed_co_create_opts(BlockDriver *drv, const char *filename,
 
 fail:
     qobject_unref(qdict);
-    bdrv_unref(bs);
+    bdrv_co_unref(bs);
     qapi_free_BlockdevCreateOptions(create_options);
     return ret;
 }
diff --git a/block/vdi.c b/block/vdi.c
index f2434d6153..08331d2dd7 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -886,8 +886,8 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
 
     ret = 0;
 exit:
-    blk_unref(blk);
-    bdrv_unref(bs_file);
+    blk_co_unref(blk);
+    bdrv_co_unref(bs_file);
     g_free(bmap);
     return ret;
 }
@@ -975,7 +975,7 @@ vdi_co_create_opts(BlockDriver *drv, const char *filename,
 done:
     qobject_unref(qdict);
     qapi_free_BlockdevCreateOptions(create_options);
-    bdrv_unref(bs_file);
+    bdrv_co_unref(bs_file);
     return ret;
 }
 
diff --git a/block/vhdx.c b/block/vhdx.c
index 81420722a1..00777da91a 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2053,8 +2053,8 @@ static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
 
     ret = 0;
 delete_and_exit:
-    blk_unref(blk);
-    bdrv_unref(bs);
+    blk_co_unref(blk);
+    bdrv_co_unref(bs);
     g_free(creator);
     return ret;
 }
@@ -2144,7 +2144,7 @@ vhdx_co_create_opts(BlockDriver *drv, const char *filename,
 
 fail:
     qobject_unref(qdict);
-    bdrv_unref(bs);
+    bdrv_co_unref(bs);
     qapi_free_BlockdevCreateOptions(create_options);
     return ret;
 }
diff --git a/block/vmdk.c b/block/vmdk.c
index 3f8c731e32..11b553ef25 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2306,7 +2306,7 @@ exit:
         if (pbb) {
             *pbb = blk;
         } else {
-            blk_unref(blk);
+            blk_co_unref(blk);
             blk = NULL;
         }
     }
@@ -2516,12 +2516,12 @@ vmdk_co_do_create(int64_t size,
         if (strcmp(blk_bs(backing)->drv->format_name, "vmdk")) {
             error_setg(errp, "Invalid backing file format: %s. Must be vmdk",
                        blk_bs(backing)->drv->format_name);
-            blk_unref(backing);
+            blk_co_unref(backing);
             ret = -EINVAL;
             goto exit;
         }
         ret = vmdk_read_cid(blk_bs(backing), 0, &parent_cid);
-        blk_unref(backing);
+        blk_co_unref(backing);
         if (ret) {
             error_setg(errp, "Failed to read parent CID");
             goto exit;
@@ -2542,14 +2542,14 @@ vmdk_co_do_create(int64_t size,
                              blk_bs(extent_blk)->filename);
         created_size += cur_size;
         extent_idx++;
-        blk_unref(extent_blk);
+        blk_co_unref(extent_blk);
     }
 
     /* Check whether we got excess extents */
     extent_blk = extent_fn(-1, extent_idx, flat, split, compress, zeroed_grain,
                            opaque, NULL);
     if (extent_blk) {
-        blk_unref(extent_blk);
+        blk_co_unref(extent_blk);
         error_setg(errp, "List of extents contains unused extents");
         ret = -EINVAL;
         goto exit;
@@ -2590,7 +2590,7 @@ vmdk_co_do_create(int64_t size,
     ret = 0;
 exit:
     if (blk) {
-        blk_unref(blk);
+        blk_co_unref(blk);
     }
     g_free(desc);
     g_free(parent_desc_line);
@@ -2641,7 +2641,7 @@ vmdk_co_create_opts_cb(int64_t size, int idx, bool flat, bool split,
                            errp)) {
         goto exit;
     }
-    bdrv_unref(bs);
+    bdrv_co_unref(bs);
 exit:
     g_free(ext_filename);
     return blk;
@@ -2797,12 +2797,12 @@ static BlockBackend * coroutine_fn vmdk_co_create_cb(int64_t size, int idx,
         return NULL;
     }
     blk_set_allow_write_beyond_eof(blk, true);
-    bdrv_unref(bs);
+    bdrv_co_unref(bs);
 
     if (size != -1) {
         ret = vmdk_init_extent(blk, size, flat, compress, zeroed_grain, errp);
         if (ret) {
-            blk_unref(blk);
+            blk_co_unref(blk);
             blk = NULL;
         }
     }
diff --git a/block/vpc.c b/block/vpc.c
index b89b0ff8e2..07ddda5b99 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1082,8 +1082,8 @@ static int coroutine_fn vpc_co_create(BlockdevCreateOptions *opts,
     }
 
 out:
-    blk_unref(blk);
-    bdrv_unref(bs);
+    blk_co_unref(blk);
+    bdrv_co_unref(bs);
     return ret;
 }
 
@@ -1162,7 +1162,7 @@ vpc_co_create_opts(BlockDriver *drv, const char *filename,
 
 fail:
     qobject_unref(qdict);
-    bdrv_unref(bs);
+    bdrv_co_unref(bs);
     qapi_free_BlockdevCreateOptions(create_options);
     return ret;
 }
-- 
2.40.0


