Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FBC203A73
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 17:15:07 +0200 (CEST)
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnOA5-0005jK-Cn
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 11:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jnO6p-0000BK-4Z
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 11:11:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38596
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jnO6k-00060P-BT
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 11:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592838697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7REDxmh3fNeouy7lNhFw+K1ulOsaVH94F15egehUhgc=;
 b=EgB+kDOBhxUL8q2uUAinS3Yo+bbMeolPYLVsney+4OGVy7YLmpZu5EE2WkgK4ib1bJsmCM
 aGmBxXIqzrr3FU4qFJfKWZ4Y4mi4SPeWFnFp5tUMXw13I6RGFD3cZRFuKdoQjskRXQ1xbT
 Ge32AAPkKU6D1UbduyTBd+l9uRoHI0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-WLNleyd-O8OFgVliBKN2wA-1; Mon, 22 Jun 2020 11:11:25 -0400
X-MC-Unique: WLNleyd-O8OFgVliBKN2wA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF1DD1083E85;
 Mon, 22 Jun 2020 15:11:24 +0000 (UTC)
Received: from localhost (ovpn-114-85.ams2.redhat.com [10.36.114.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5899F1C8;
 Mon, 22 Jun 2020 15:11:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/18] block/crypto: implement the encryption key management
Date: Mon, 22 Jun 2020 17:10:51 +0200
Message-Id: <20200622151059.921191-11-mreitz@redhat.com>
In-Reply-To: <20200622151059.921191-1-mreitz@redhat.com>
References: <20200622151059.921191-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

This implements the encryption key management using the generic code in
qcrypto layer and exposes it to the user via qemu-img

This code adds another 'write_func' because the initialization
write_func works directly on the underlying file, and amend
works on instance of luks device.

This commit also adds a 'hack/workaround' I and Kevin Wolf (thanks)
made to make the driver both support write sharing (to avoid breaking the users),
and be safe against concurrent  metadata update (the keyslots)

Eventually the write sharing for luks driver will be deprecated
and removed together with this hack.

The hack is that we ask (as a format driver) for BLK_PERM_CONSISTENT_READ
and then when we want to update the keys, we unshare that permission.
So if someone else has the image open, even readonly, encryption
key update will fail gracefully.

Also thanks to Daniel Berrange for the idea of
unsharing read, rather that write permission which allows
to avoid cases when the other user had opened the image read-only.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200608094030.670121-8-mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/crypto.h |  34 +++++++++++++
 block/crypto.c | 130 +++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 161 insertions(+), 3 deletions(-)

diff --git a/block/crypto.h b/block/crypto.h
index 06e044c9be..c72c3dec61 100644
--- a/block/crypto.h
+++ b/block/crypto.h
@@ -41,6 +41,11 @@
 #define BLOCK_CRYPTO_OPT_LUKS_IVGEN_HASH_ALG "ivgen-hash-alg"
 #define BLOCK_CRYPTO_OPT_LUKS_HASH_ALG "hash-alg"
 #define BLOCK_CRYPTO_OPT_LUKS_ITER_TIME "iter-time"
+#define BLOCK_CRYPTO_OPT_LUKS_KEYSLOT "keyslot"
+#define BLOCK_CRYPTO_OPT_LUKS_STATE "state"
+#define BLOCK_CRYPTO_OPT_LUKS_OLD_SECRET "old-secret"
+#define BLOCK_CRYPTO_OPT_LUKS_NEW_SECRET "new-secret"
+
 
 #define BLOCK_CRYPTO_OPT_DEF_LUKS_KEY_SECRET(prefix)                    \
     BLOCK_CRYPTO_OPT_DEF_KEY_SECRET(prefix,                             \
@@ -88,6 +93,35 @@
         .help = "Time to spend in PBKDF in milliseconds",     \
     }
 
+#define BLOCK_CRYPTO_OPT_DEF_LUKS_STATE(prefix)                           \
+    {                                                                     \
+        .name = prefix BLOCK_CRYPTO_OPT_LUKS_STATE,                       \
+        .type = QEMU_OPT_STRING,                                          \
+        .help = "Select new state of affected keyslots (active/inactive)",\
+    }
+
+#define BLOCK_CRYPTO_OPT_DEF_LUKS_KEYSLOT(prefix)              \
+    {                                                          \
+        .name = prefix BLOCK_CRYPTO_OPT_LUKS_KEYSLOT,          \
+        .type = QEMU_OPT_NUMBER,                               \
+        .help = "Select a single keyslot to modify explicitly",\
+    }
+
+#define BLOCK_CRYPTO_OPT_DEF_LUKS_OLD_SECRET(prefix)            \
+    {                                                           \
+        .name = prefix BLOCK_CRYPTO_OPT_LUKS_OLD_SECRET,        \
+        .type = QEMU_OPT_STRING,                                \
+        .help = "Select all keyslots that match this password", \
+    }
+
+#define BLOCK_CRYPTO_OPT_DEF_LUKS_NEW_SECRET(prefix)            \
+    {                                                           \
+        .name = prefix BLOCK_CRYPTO_OPT_LUKS_NEW_SECRET,        \
+        .type = QEMU_OPT_STRING,                                \
+        .help = "New secret to set in the matching keyslots. "  \
+                "Empty string to erase",                        \
+    }
+
 QCryptoBlockCreateOptions *
 block_crypto_create_opts_init(QDict *opts, Error **errp);
 
diff --git a/block/crypto.c b/block/crypto.c
index 1960b47ceb..b9c40e6922 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -37,6 +37,7 @@ typedef struct BlockCrypto BlockCrypto;
 
 struct BlockCrypto {
     QCryptoBlock *block;
+    bool updating_keys;
 };
 
 
@@ -71,6 +72,24 @@ static ssize_t block_crypto_read_func(QCryptoBlock *block,
     return ret;
 }
 
+static ssize_t block_crypto_write_func(QCryptoBlock *block,
+                                       size_t offset,
+                                       const uint8_t *buf,
+                                       size_t buflen,
+                                       void *opaque,
+                                       Error **errp)
+{
+    BlockDriverState *bs = opaque;
+    ssize_t ret;
+
+    ret = bdrv_pwrite(bs->file, offset, buf, buflen);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Could not write encryption header");
+        return ret;
+    }
+    return ret;
+}
+
 
 struct BlockCryptoCreateData {
     BlockBackend *blk;
@@ -166,6 +185,19 @@ static QemuOptsList block_crypto_create_opts_luks = {
 };
 
 
+static QemuOptsList block_crypto_amend_opts_luks = {
+    .name = "crypto",
+    .head = QTAILQ_HEAD_INITIALIZER(block_crypto_create_opts_luks.head),
+    .desc = {
+        BLOCK_CRYPTO_OPT_DEF_LUKS_STATE(""),
+        BLOCK_CRYPTO_OPT_DEF_LUKS_KEYSLOT(""),
+        BLOCK_CRYPTO_OPT_DEF_LUKS_OLD_SECRET(""),
+        BLOCK_CRYPTO_OPT_DEF_LUKS_NEW_SECRET(""),
+        BLOCK_CRYPTO_OPT_DEF_LUKS_ITER_TIME(""),
+        { /* end of list */ }
+    },
+};
+
 QCryptoBlockOpenOptions *
 block_crypto_open_opts_init(QDict *opts, Error **errp)
 {
@@ -758,6 +790,98 @@ block_crypto_get_specific_info_luks(BlockDriverState *bs, Error **errp)
     return spec_info;
 }
 
+static int
+block_crypto_amend_options_luks(BlockDriverState *bs,
+                                QemuOpts *opts,
+                                BlockDriverAmendStatusCB *status_cb,
+                                void *cb_opaque,
+                                bool force,
+                                Error **errp)
+{
+    BlockCrypto *crypto = bs->opaque;
+    QDict *cryptoopts = NULL;
+    QCryptoBlockAmendOptions *amend_options = NULL;
+    int ret;
+
+    assert(crypto);
+    assert(crypto->block);
+    crypto->updating_keys = true;
+
+    ret = bdrv_child_refresh_perms(bs, bs->file, errp);
+    if (ret < 0) {
+        goto cleanup;
+    }
+
+    cryptoopts = qemu_opts_to_qdict(opts, NULL);
+    qdict_put_str(cryptoopts, "format", "luks");
+    amend_options = block_crypto_amend_opts_init(cryptoopts, errp);
+    if (!amend_options) {
+        ret = -EINVAL;
+        goto cleanup;
+    }
+
+    ret = qcrypto_block_amend_options(crypto->block,
+                                      block_crypto_read_func,
+                                      block_crypto_write_func,
+                                      bs,
+                                      amend_options,
+                                      force,
+                                      errp);
+cleanup:
+    crypto->updating_keys = false;
+    bdrv_child_refresh_perms(bs, bs->file, errp);
+    qapi_free_QCryptoBlockAmendOptions(amend_options);
+    qobject_unref(cryptoopts);
+    return ret;
+}
+
+
+static void
+block_crypto_child_perms(BlockDriverState *bs, BdrvChild *c,
+                         const BdrvChildRole role,
+                         BlockReopenQueue *reopen_queue,
+                         uint64_t perm, uint64_t shared,
+                         uint64_t *nperm, uint64_t *nshared)
+{
+
+    BlockCrypto *crypto = bs->opaque;
+
+    bdrv_default_perms(bs, c, role, reopen_queue, perm, shared, nperm, nshared);
+
+    /*
+     * For backward compatibility, manually share the write
+     * and resize permission
+     */
+    *nshared |= (BLK_PERM_WRITE | BLK_PERM_RESIZE);
+    /*
+     * Since we are not fully a format driver, don't always request
+     * the read/resize permission but only when explicitly
+     * requested
+     */
+    *nperm &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
+    *nperm |= perm & (BLK_PERM_WRITE | BLK_PERM_RESIZE);
+
+    /*
+     * This driver doesn't modify LUKS metadata except
+     * when updating the encryption slots.
+     * Thus unlike a proper format driver we don't ask for
+     * shared write/read permission. However we need it
+     * when we are updating the keys, to ensure that only we
+     * have access to the device.
+     *
+     * Encryption update will set the crypto->updating_keys
+     * during that period and refresh permissions
+     *
+     */
+    if (crypto->updating_keys) {
+        /* need exclusive write access for header update */
+        *nperm |= BLK_PERM_WRITE;
+        /* unshare read and write permission */
+        *nshared &= ~(BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE);
+    }
+}
+
+
 static const char *const block_crypto_strong_runtime_opts[] = {
     BLOCK_CRYPTO_OPT_LUKS_KEY_SECRET,
 
@@ -770,13 +894,12 @@ static BlockDriver bdrv_crypto_luks = {
     .bdrv_probe         = block_crypto_probe_luks,
     .bdrv_open          = block_crypto_open_luks,
     .bdrv_close         = block_crypto_close,
-    /* This driver doesn't modify LUKS metadata except when creating image.
-     * Allow share-rw=on as a special case. */
-    .bdrv_child_perm    = bdrv_default_perms,
+    .bdrv_child_perm    = block_crypto_child_perms,
     .bdrv_co_create     = block_crypto_co_create_luks,
     .bdrv_co_create_opts = block_crypto_co_create_opts_luks,
     .bdrv_co_truncate   = block_crypto_co_truncate,
     .create_opts        = &block_crypto_create_opts_luks,
+    .amend_opts         = &block_crypto_amend_opts_luks,
 
     .bdrv_reopen_prepare = block_crypto_reopen_prepare,
     .bdrv_refresh_limits = block_crypto_refresh_limits,
@@ -786,6 +909,7 @@ static BlockDriver bdrv_crypto_luks = {
     .bdrv_measure       = block_crypto_measure,
     .bdrv_get_info      = block_crypto_get_info_luks,
     .bdrv_get_specific_info = block_crypto_get_specific_info_luks,
+    .bdrv_amend_options = block_crypto_amend_options_luks,
 
     .is_format          = true,
 
-- 
2.26.2


