Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B61600067
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 17:08:47 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok5Fu-00087e-EP
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 11:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok54l-0006hD-Fy; Sun, 16 Oct 2022 10:57:15 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok54V-0005pI-RQ; Sun, 16 Oct 2022 10:57:15 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e129so8401400pgc.9;
 Sun, 16 Oct 2022 07:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5ROe/6pTdT6ggp2DEMKOLrGXATh9/GWMPMvYbOEH10=;
 b=l+gS9tBOQaN8MHQApT9Mo1LaTqvO06wqQCTPeB0RH5HHzCOb+Q+/0uSIK2Rx9kvTiN
 B5trW5DY1sWGg0CboLGZWvu7Nu138PTjAw3KI3IHKr9Gj5e9SHoAkp//gvH5b5liuclG
 RzN1nrx2CpXxxpnWLJFd7z/wpbD4luCegGNgDgGwREO93ES9CGAk6dPqys08XvhKbinT
 wGn04Oz0oSrFvjpiHmBU6C2w8nBqzakQQt+CuqxW7SV7+P+3e1U1i3YUJ1ofLtjiW3bl
 TMlKcxmTRsIEWUsUg7k1NXgKwktRDEZK7sFz4Dl1xjYiAKpSNDCFmQ9VnKF72xV6cy7s
 hZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5ROe/6pTdT6ggp2DEMKOLrGXATh9/GWMPMvYbOEH10=;
 b=j1FSmGcAJU7EMasrnbxd14dHaTEZwoylhrW4p0efhMU+DqPD9hKPj8+2jUjjHoh/1/
 kCGf79z6Np32mAjMwidKobutG3DCTRzkXdjOAYxsDvTdXJUph7iEPWodO5VppJ/wlW8a
 OME3WxfKGOEYGnqHYuqkdeyRh2c6bPeGgTtrmgMg3JGIxiDYJ6Ciy5EoJ0lH8lDqMoz6
 PkuAdqfQMfwl8CKqhi2n82dc2fmuyGeF1jL5B5xLw7wnBpM+DpLX6iy0DSCG6JejilUo
 ax/pTTtoRrSK+1cWguYT2nKHdjjFQlYKmOBl16h9SkFJeGdw53rASnAz66k8uCdPPK3l
 nYzA==
X-Gm-Message-State: ACrzQf2iK+egpvXr3MR1zVqCSS4F1bakN+ybxvhGEgVLxtZOqO7DdyMl
 3A0YUnGMD4Bd6/BoMggP2SxRW6xFesuH7Q==
X-Google-Smtp-Source: AMsMyM4IUqRtKjk+iiE4FWQSOKK2Fp5H/t5b5lOoyzQrTxGr01ANmJsbvxrbYvQjEuTFGFBVd1mNKA==
X-Received: by 2002:a05:6a00:124d:b0:566:8645:dad2 with SMTP id
 u13-20020a056a00124d00b005668645dad2mr8081519pfi.5.1665932217641; 
 Sun, 16 Oct 2022 07:56:57 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 75-20020a62154e000000b00562a8150c08sm5070380pfv.168.2022.10.16.07.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 07:56:57 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, dmitry.fomichev@wdc.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v4 3/3] qemu-iotests: test zone append operation
Date: Sun, 16 Oct 2022 22:56:26 +0800
Message-Id: <20221016145626.171838-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016145626.171838-1-faithilikerun@gmail.com>
References: <20221016145626.171838-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tests is mainly a helper to indicate append writes in block layer
behaves as expected.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 qemu-io-cmds.c                     | 63 ++++++++++++++++++++++++++++++
 tests/qemu-iotests/tests/zoned.out |  7 ++++
 tests/qemu-iotests/tests/zoned.sh  |  9 +++++
 3 files changed, 79 insertions(+)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index c1b28ea108..ca92291a44 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1856,6 +1856,68 @@ static const cmdinfo_t zone_reset_cmd = {
     .oneline = "reset a zone write pointer in zone block device",
 };
 
+static int do_aio_zone_append(BlockBackend *blk, QEMUIOVector *qiov,
+                              int64_t *offset, int flags, int *total)
+{
+    int async_ret = NOT_DONE;
+
+    blk_aio_zone_append(blk, offset, qiov, flags, aio_rw_done, &async_ret);
+    while (async_ret == NOT_DONE) {
+        main_loop_wait(false);
+    }
+
+    *total = qiov->size;
+    return async_ret < 0 ? async_ret : 1;
+}
+
+static int zone_append_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int flags = 0;
+    int total = 0;
+    int64_t offset;
+    char *buf;
+    int nr_iov;
+    int pattern = 0xcd;
+    QEMUIOVector qiov;
+
+    if (optind > argc - 2) {
+        return -EINVAL;
+    }
+    optind++;
+    offset = cvtnum(argv[optind]);
+    if (offset < 0) {
+        print_cvtnum_err(offset, argv[optind]);
+        return offset;
+    }
+    optind++;
+    nr_iov = argc - optind;
+    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern);
+    if (buf == NULL) {
+        return -EINVAL;
+    }
+    ret = do_aio_zone_append(blk, &qiov, &offset, flags, &total);
+    if (ret < 0) {
+        printf("zone append failed: %s\n", strerror(-ret));
+        goto out;
+    }
+
+    out:
+    qemu_iovec_destroy(&qiov);
+    qemu_io_free(buf);
+    return ret;
+}
+
+static const cmdinfo_t zone_append_cmd = {
+    .name = "zone_append",
+    .altname = "zap",
+    .cfunc = zone_append_f,
+    .argmin = 3,
+    .argmax = 3,
+    .args = "offset len [len..]",
+    .oneline = "append write a number of bytes at a specified offset",
+};
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv);
 static const cmdinfo_t truncate_cmd = {
     .name       = "truncate",
@@ -2653,6 +2715,7 @@ static void __attribute((constructor)) init_qemuio_commands(void)
     qemuio_add_command(&zone_close_cmd);
     qemuio_add_command(&zone_finish_cmd);
     qemuio_add_command(&zone_reset_cmd);
+    qemuio_add_command(&zone_append_cmd);
     qemuio_add_command(&truncate_cmd);
     qemuio_add_command(&length_cmd);
     qemuio_add_command(&info_cmd);
diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/tests/zoned.out
index 0c8f96deb9..b3b139b4ec 100644
--- a/tests/qemu-iotests/tests/zoned.out
+++ b/tests/qemu-iotests/tests/zoned.out
@@ -50,4 +50,11 @@ start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:14, [type: 2]
 (5) resetting the second zone
 After resetting a zone:
 start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: 2]
+
+
+(6) append write
+After appending the first zone:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x18, zcond:2, [type: 2]
+After appending the second zone:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80018, zcond:2, [type: 2]
 *** done
diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
index fced0194c5..888711eef2 100755
--- a/tests/qemu-iotests/tests/zoned.sh
+++ b/tests/qemu-iotests/tests/zoned.sh
@@ -79,6 +79,15 @@ echo "(5) resetting the second zone"
 sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
 echo "After resetting a zone:"
 sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo
+echo "(6) append write" # physical block size of the device is 4096
+sudo $QEMU_IO $IMG -c "zap 0 0x1000 0x2000"
+echo "After appending the first zone:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+sudo $QEMU_IO $IMG -c "zap 268435456 0x1000 0x2000"
+echo "After appending the second zone:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
 
 # success, all done
 echo "*** done"
-- 
2.37.3


