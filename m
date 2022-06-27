Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC255B495
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 02:22:57 +0200 (CEST)
Received: from localhost ([::1]:53194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5cWm-0002oD-Q9
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 20:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTn-0007S8-83; Sun, 26 Jun 2022 20:19:51 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTl-0000bY-EN; Sun, 26 Jun 2022 20:19:50 -0400
Received: by mail-pg1-x536.google.com with SMTP id 184so7572928pga.12;
 Sun, 26 Jun 2022 17:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjF8k+hpX9AH/ezNK0riUGjUD2YIMsd6gzdiqYDfMl4=;
 b=K60n/ISh5jnq1nVfSZAJaHifkSb6dh6g/51QWzYFpkRO1l3XogY8aWlXLnuZseCkSI
 ImiEALIcBdTGUtZ5QfK0/FashQyztba8Ol5N07zHcJZDgVhCoVD28ChjV1docIOlqaO8
 pBCHmBqu9Bd92A2UOB3qnDqDWjmuqwXZ0wU0v8pPekt0QzGEefi3JAUGfHNc/1TzcEuy
 x/lOLsj4JRi/tzXLE2vw8+lxvEMFCNdG+bm/DUARALgA80I99yGofDLXyRG4H8d4FMn+
 ZMTj+EIh/ke1i5PwP+ypwz+d9QUk0whcjDf8UMTd794K843Fyr7mWlKmyeqH5NDmCG9R
 A0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjF8k+hpX9AH/ezNK0riUGjUD2YIMsd6gzdiqYDfMl4=;
 b=Wm1P4mEcfQeiH7Z9tPRJsYHZRb96sktdAc/hJOGvSRYVRvsyLzLbMfHtzQUWzH1Yro
 AUXsjkmPz0vCvgmctPljYietY6/OlTlcWL4HeIWKpj8vfYBzhgfRTSa6XMD1DnQUQJi5
 cHZ7t/nsqpRVtYao8RrZ2wbEIt08b+AJ8m39WCsaf7feKK1IlGm7okOlXh4Mecx2e0jS
 BMTpxi0HSyvYJOfK8uGbZN1Eb0s63m+KNWT50vM/oQU9At6waVHC5PYKvCuvj6ub7XRy
 8ttcBpEMKuJLUskDNg11XRF1exw2jA99z3Og0adS2aHdCYM8m6Sw1rQ4oW3eY61azuRR
 tP1A==
X-Gm-Message-State: AJIora/TlNI8jfGU23C3vf8WqXr/LvyTwwD0EIWW3SUfYJb4Mcpt9LId
 8mw+wOd3+IIZZ4/m1pL3SMm9YPK3lFWvNw==
X-Google-Smtp-Source: AGRyM1u+diJWiow1AS132ZiauRTjF4RNyschmMIWDqqg8AuteNWo5t3MqaI48rLW78zSwwslITsw6w==
X-Received: by 2002:a63:3d85:0:b0:40c:f690:d759 with SMTP id
 k127-20020a633d85000000b0040cf690d759mr10005791pga.343.1656289186665; 
 Sun, 26 Jun 2022 17:19:46 -0700 (PDT)
Received: from fedora.. ([106.84.130.34]) by smtp.gmail.com with ESMTPSA id
 e11-20020a6558cb000000b00408b89e4282sm5715294pgu.47.2022.06.26.17.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 17:19:46 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v3 2/5] qemu-io: add zoned block device operations.
Date: Mon, 27 Jun 2022 08:19:14 +0800
Message-Id: <20220627001917.9417-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627001917.9417-1-faithilikerun@gmail.com>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

---
 block/io.c               |  21 +++++++
 include/block/block-io.h |  13 +++++
 qemu-io-cmds.c           | 121 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+)

diff --git a/block/io.c b/block/io.c
index 789e6373d5..656a1b7271 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3258,6 +3258,27 @@ out:
     return co.ret;
 }
 
+int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
+                        int64_t len, int64_t *nr_zones,
+                        BlockZoneDescriptor *zones)
+{
+    if (!bs->drv->bdrv_co_zone_report) {
+        return -ENOTSUP;
+    }
+
+    return bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zones);
+}
+
+int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
+        int64_t offset, int64_t len)
+{
+    if (!bs->drv->bdrv_co_zone_mgmt) {
+        return -ENOTSUP;
+    }
+
+    return bs->drv->bdrv_co_zone_mgmt(bs, op, offset, len);
+}
+
 void *qemu_blockalign(BlockDriverState *bs, size_t size)
 {
     IO_CODE();
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 62c84f0519..c85c174579 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 /* Ensure contents are flushed to disk.  */
 int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
 
+/* Report zone information of zone block device. */
+int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                     int64_t len, int64_t *nr_zones,
+                                     BlockZoneDescriptor *zones);
+int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, zone_op op,
+        int64_t offset, int64_t len);
+
 int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
@@ -290,6 +297,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 int generated_co_wrapper
 bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
+int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t offset,
+                                         int64_t len, int64_t *nr_zones,
+                                         BlockZoneDescriptor *zones);
+int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, enum zone_op op,
+        int64_t offset, int64_t len);
+
 /**
  * bdrv_parent_drained_begin_single:
  *
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 2f0d8ac25a..3f2592b9f5 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1706,6 +1706,122 @@ static const cmdinfo_t flush_cmd = {
     .oneline    = "flush all in-core file state to disk",
 };
 
+static int zone_report_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, len, nr_zones;
+    int i = 0;
+
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ++optind;
+    nr_zones = cvtnum(argv[optind]);
+
+    g_autofree BlockZoneDescriptor *zones = g_new(BlockZoneDescriptor, nr_zones);
+    ret = blk_zone_report(blk, offset, len, &nr_zones, zones);
+    while (i < nr_zones) {
+        fprintf(stdout, "start: 0x%lx, len 0x%lx, cap 0x%lx, wptr 0x%lx, "
+                        "zcond:%u, [type: %u]\n",
+                zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
+                zones[i].cond, zones[i].type);
+        ++i;
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_report_cmd = {
+        .name = "zone_report",
+        .altname = "f",
+        .cfunc = zone_report_f,
+        .argmin = 3,
+        .argmax = 3,
+        .args = "offset [offset..] len [len..] number [num..]",
+        .oneline = "report a number of zones",
+};
+
+static int zone_open_f(BlockBackend *blk, int argc, char **argv)
+{
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    return blk_zone_mgmt(blk, zone_open, offset, len);
+}
+
+static const cmdinfo_t zone_open_cmd = {
+        .name = "zone_open",
+        .altname = "f",
+        .cfunc = zone_open_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset [offset..] len [len..]",
+        .oneline = "explicit open a range of zones in zone block device",
+};
+
+static int zone_close_f(BlockBackend *blk, int argc, char **argv)
+{
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    return blk_zone_mgmt(blk, zone_close, offset, len);
+}
+
+static const cmdinfo_t zone_close_cmd = {
+        .name = "zone_close",
+        .altname = "f",
+        .cfunc = zone_close_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset [offset..] len [len..]",
+        .oneline = "close a range of zones in zone block device",
+};
+
+static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
+{
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    return blk_zone_mgmt(blk, zone_finish, offset, len);
+}
+
+static const cmdinfo_t zone_finish_cmd = {
+        .name = "zone_finish",
+        .altname = "f",
+        .cfunc = zone_finish_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset [offset..] len [len..]",
+        .oneline = "finish a range of zones in zone block device",
+};
+
+static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
+{
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    return blk_zone_mgmt(blk, zone_reset, offset, len);
+}
+
+static const cmdinfo_t zone_reset_cmd = {
+        .name = "zone_reset",
+        .altname = "f",
+        .cfunc = zone_reset_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset [offset..] len [len..]",
+        .oneline = "reset a zone write pointer in zone block device",
+};
+
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv);
 static const cmdinfo_t truncate_cmd = {
     .name       = "truncate",
@@ -2498,6 +2614,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
     qemuio_add_command(&aio_write_cmd);
     qemuio_add_command(&aio_flush_cmd);
     qemuio_add_command(&flush_cmd);
+    qemuio_add_command(&zone_report_cmd);
+    qemuio_add_command(&zone_open_cmd);
+    qemuio_add_command(&zone_close_cmd);
+    qemuio_add_command(&zone_finish_cmd);
+    qemuio_add_command(&zone_reset_cmd);
     qemuio_add_command(&truncate_cmd);
     qemuio_add_command(&length_cmd);
     qemuio_add_command(&info_cmd);
-- 
2.35.3


