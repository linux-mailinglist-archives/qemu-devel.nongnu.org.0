Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C088C60FC75
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:55:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5Bl-0001rK-Ij; Thu, 27 Oct 2022 11:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5Bd-0001Ap-B2; Thu, 27 Oct 2022 11:52:53 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5Bb-0002KX-Kj; Thu, 27 Oct 2022 11:52:53 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso1829306pjc.5; 
 Thu, 27 Oct 2022 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntInf4eetSWILts6vn1/3KGiFebuP+yikSpSQrr01a8=;
 b=b6hZAED4S0WNE8nnAzBkjsVSfjr0k+3iCWr4d7iPNrlZo1dMjccNAkRU1K29Ftfu5W
 s0H1kgeGDOCJFyj4eKEoIp0/uncRlsiljbRZni2ROjrvuwsdXczcCO8ugBCBslSgXVUZ
 BlKMLtBnhDOvQYE2w4uVvq7axm+sSyeSDCCtE7UQ8MCp1DOelJi33UVGajNa06Y4Ns9v
 vNNBglLVJweDvDBLucIZubR7Xd7YgcrtTp4N1Rd5c3roDM0RRumOUJVTBQRjC0wVZq3b
 Db2DsHT5Di01gNz8RlPd6xbUTrAonSGfOifjqjeHIbwRIxfkRIMIb6hsrVTPIMk+ZLi/
 cHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ntInf4eetSWILts6vn1/3KGiFebuP+yikSpSQrr01a8=;
 b=BMEZgyQmh1DwF8T9+VPXdepeCv6RxcE6HbD5vzm4b+Nu/EeanG54069uthiZtjyCye
 +PxKqSmSku/aibsIuJlZY0rgHFCVJkLqomVNHxn0JEJXxXjL68mRtQ8NCYd4LLzt5+m2
 JZOjFG1RXz4At3eNlyo2T+iAz0NBvdDqbfRuIqIo/bhYxy1mJByILpwzbh8x7IA+ZCP6
 1xTlrp/TrwAqiYRW2frGgOfoTiwwxQN5hDs3AbpEeOVVQirQhn825+ZeMwRZ3z9Mdbw7
 AyVCfwI27LcIoN8G8B4W5jXFSuwAvLrYY4MzwXQnFTiGjHZokpZzrbipHXLWKkax5LgH
 APDQ==
X-Gm-Message-State: ACrzQf1d+2NrJhqsj0znXhA90Y5VUx/abO9F1bzp+kUBWTsz6WtdXojD
 jSV/mMKrOkglXwEvlszvDuL0Qp6ZrlHfGyO3
X-Google-Smtp-Source: AMsMyM57GrBP/ObgAnGIdQFzWa4zWvzph1xgS8uQc99u7KkhGtXKYTU8N6fRDDM6aACcdg0/S2Pj8g==
X-Received: by 2002:a17:90b:305:b0:213:8a6:8bb4 with SMTP id
 ay5-20020a17090b030500b0021308a68bb4mr11106724pjb.33.1666885969259; 
 Thu, 27 Oct 2022 08:52:49 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 f21-20020a623815000000b0056c058ab000sm1327744pfa.155.2022.10.27.08.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:52:48 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Julia Suvorova <jusual@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v5 3/4] qemu-iotests: test zone append operation
Date: Thu, 27 Oct 2022 23:52:14 +0800
Message-Id: <20221027155215.21374-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027155215.21374-1-faithilikerun@gmail.com>
References: <20221027155215.21374-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This tests is mainly a helper to indicate append writes in block layer
behaves as expected.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 qemu-io-cmds.c                     | 63 ++++++++++++++++++++++++++++++
 tests/qemu-iotests/tests/zoned.out |  7 ++++
 tests/qemu-iotests/tests/zoned.sh  |  9 +++++
 3 files changed, 79 insertions(+)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 3a3bad77c3..abf433f0ad 100644
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
2.38.1


