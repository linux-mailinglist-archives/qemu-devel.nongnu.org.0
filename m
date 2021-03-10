Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A13433402F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:20:19 +0100 (CET)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzhA-0007rH-CP
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lJzfl-0006yw-G3; Wed, 10 Mar 2021 09:18:49 -0500
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lJzfe-0001So-0W; Wed, 10 Mar 2021 09:18:49 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615385881; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=NQTCji3jkoNH/R3flnOSfGKjhkzG9VAIyKnZ9NrLLyj0dREfv6pFZfRiUoQBL1cVF2VTlZsvEcZSgvYEwP0a9DW5a4eQS03kssDKcBsaPx590M9wZPS6/+zwJ3711Gzm88P2mNqHhknQ8u2ZkZds22mtvDdDTT3PsrSkzLgLNGc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; 
 t=1615385881; h=Cc:Date:From:Message-ID:Subject:To; 
 bh=R840Cuiu4lRFU+jSqXu6NNwz2iJjNYonZROvTGhd3Io=; 
 b=faGUBBxoHCDlv6ki8KH9U6t53QuZoTjmAQZZQ7InT6h1XGOVC/1VniWhcznK7G4qOlSBUGoAMkQKag04o8v50JZPH5l9F6plOotzfSmhwLIiYERYlc2rAhFrA4R+zrUKdefbD4eOeha/wyN0YURhUNXPCA8aI9sSUMoUUT1y/L4=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615385881; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=R840Cuiu4lRFU+jSqXu6NNwz2iJjNYonZROvTGhd3Io=;
 b=AcdjeD1CRaZuH/Fwj15El6VVvi1MQyhRIT7aDZrIWFoi9ycLcBbl0wbLmHOaZZkq
 5ALuoF3nh1SgcmZ+WXLRlD9wgpJwH/aHv3FbmmvzPhuNuvbSDjozreB7YPI9LdF+rN4
 qmvbeSMNgO+39qwSacmm11WAC7Z+GoHlpjW/jvbg=
Received: from localhost (54.239.6.187 [54.239.6.187]) by mx.zoho.com.cn
 with SMTPS id 1615385879689183.37648067238467;
 Wed, 10 Mar 2021 22:17:59 +0800 (CST)
From: fam@euphon.net
To: qemu-devel@nongnu.org
Subject: [PATCH] block: Introduce zero-co:// and zero-aio://
Date: Wed, 10 Mar 2021 14:17:52 +0000
Message-Id: <20210310141752.5113-1-fam@euphon.net>
X-Mailer: git-send-email 2.17.1
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fam Zheng <famzheng@amazon.com>

null-co:// has a read-zeroes=off default, when used to in security
analysis, this can cause false positives because the driver doesn't
write to the read buffer.

null-co:// has the highest possible performance as a block driver, so
let's keep it that way. This patch introduces zero-co:// and
zero-aio://, largely similar with null-*://, but have read-zeroes=on by
default, so it's more suitable in cases than null-co://.

Signed-off-by: Fam Zheng <fam@euphon.net>
---
 block/null.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/block/null.c b/block/null.c
index cc9b1d4ea7..5de97e8fda 100644
--- a/block/null.c
+++ b/block/null.c
@@ -76,6 +76,30 @@ static void null_aio_parse_filename(const char *filename, QDict *options,
     }
 }
 
+static void zero_co_parse_filename(const char *filename, QDict *options,
+                                   Error **errp)
+{
+    /* This functions only exists so that a zero-co:// filename is accepted
+     * with the zero-co driver. */
+    if (strcmp(filename, "zero-co://")) {
+        error_setg(errp, "The only allowed filename for this driver is "
+                         "'zero-co://'");
+        return;
+    }
+}
+
+static void zero_aio_parse_filename(const char *filename, QDict *options,
+                                    Error **errp)
+{
+    /* This functions only exists so that a zero-aio:// filename is accepted
+     * with the zero-aio driver. */
+    if (strcmp(filename, "zero-aio://")) {
+        error_setg(errp, "The only allowed filename for this driver is "
+                         "'zero-aio://'");
+        return;
+    }
+}
+
 static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
                           Error **errp)
 {
@@ -99,6 +123,29 @@ static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
     return ret;
 }
 
+static int zero_file_open(BlockDriverState *bs, QDict *options, int flags,
+                          Error **errp)
+{
+    QemuOpts *opts;
+    BDRVNullState *s = bs->opaque;
+    int ret = 0;
+
+    opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
+    qemu_opts_absorb_qdict(opts, options, &error_abort);
+    s->length =
+        qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 1 << 30);
+    s->latency_ns =
+        qemu_opt_get_number(opts, NULL_OPT_LATENCY, 0);
+    if (s->latency_ns < 0) {
+        error_setg(errp, "latency-ns is invalid");
+        ret = -EINVAL;
+    }
+    s->read_zeroes = true;
+    qemu_opts_del(opts);
+    bs->supported_write_flags = BDRV_REQ_FUA;
+    return ret;
+}
+
 static int64_t null_getlength(BlockDriverState *bs)
 {
     BDRVNullState *s = bs->opaque;
@@ -316,10 +363,54 @@ static BlockDriver bdrv_null_aio = {
     .strong_runtime_opts    = null_strong_runtime_opts,
 };
 
+static BlockDriver bdrv_zero_co = {
+    .format_name            = "zero-co",
+    .protocol_name          = "zero-co",
+    .instance_size          = sizeof(BDRVNullState),
+
+    .bdrv_file_open         = zero_file_open,
+    .bdrv_parse_filename    = zero_co_parse_filename,
+    .bdrv_getlength         = null_getlength,
+    .bdrv_get_allocated_file_size = null_allocated_file_size,
+
+    .bdrv_co_preadv         = null_co_preadv,
+    .bdrv_co_pwritev        = null_co_pwritev,
+    .bdrv_co_flush_to_disk  = null_co_flush,
+    .bdrv_reopen_prepare    = null_reopen_prepare,
+
+    .bdrv_co_block_status   = null_co_block_status,
+
+    .bdrv_refresh_filename  = null_refresh_filename,
+    .strong_runtime_opts    = null_strong_runtime_opts,
+};
+
+static BlockDriver bdrv_zero_aio = {
+    .format_name            = "zero-aio",
+    .protocol_name          = "zero-aio",
+    .instance_size          = sizeof(BDRVNullState),
+
+    .bdrv_file_open         = zero_file_open,
+    .bdrv_parse_filename    = zero_aio_parse_filename,
+    .bdrv_getlength         = null_getlength,
+    .bdrv_get_allocated_file_size = null_allocated_file_size,
+
+    .bdrv_aio_preadv        = null_aio_preadv,
+    .bdrv_aio_pwritev       = null_aio_pwritev,
+    .bdrv_aio_flush         = null_aio_flush,
+    .bdrv_reopen_prepare    = null_reopen_prepare,
+
+    .bdrv_co_block_status   = null_co_block_status,
+
+    .bdrv_refresh_filename  = null_refresh_filename,
+    .strong_runtime_opts    = null_strong_runtime_opts,
+};
+
 static void bdrv_null_init(void)
 {
     bdrv_register(&bdrv_null_co);
     bdrv_register(&bdrv_null_aio);
+    bdrv_register(&bdrv_zero_co);
+    bdrv_register(&bdrv_zero_aio);
 }
 
 block_init(bdrv_null_init);
-- 
2.17.1


