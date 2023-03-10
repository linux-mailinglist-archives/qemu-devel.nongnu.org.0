Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D866B3C4B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:33:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa29-0007YR-CI; Fri, 10 Mar 2023 05:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paa26-0007V7-F3; Fri, 10 Mar 2023 05:31:31 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paa23-0004Fm-5P; Fri, 10 Mar 2023 05:31:30 -0500
Received: by mail-pj1-x1030.google.com with SMTP id x34so4943099pjj.0;
 Fri, 10 Mar 2023 02:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678444285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VmozOyNwlvVr9QpT2aLte3LztUZpKB3jmOhQWmpI8Qk=;
 b=eys/4G1dIqBhRO2MlyMngcSvaPkYA4bL0sKxvOiQw7uS43uHJh4vtdU4MLz+nc24st
 d3/nNHoAR/uBq+HOYwZ6IKC+hWbV801kbnDD/R/Fqmk6/+H4wEx1QO0GoRRl2DRXGpNf
 XVWGNIVnPE7riAZrikH1tvRURLuADAlW6zPZ5tfxzBdqRC4qbl3/j43KnvfXJvFt/QAr
 AT/rNfGnYnGmA7/ndG3SzXDu5IL1iSpXZar4pikti1Xno/4DShGY252e+OJ4VLzKrU5c
 guZVvckjCMF6cntBUOUG6aOwnsn/S7OKT6rG4Wn8dJpYX1KD+DThPehSiyXa5LpJx7yN
 yOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VmozOyNwlvVr9QpT2aLte3LztUZpKB3jmOhQWmpI8Qk=;
 b=0YNod08GCIqls/sRJ/BcDfghrP1sP9vSEC7Om0aP3jt+vH6TFfFTlz5CYRAiGurevM
 UNT3e2VBqL6/3mHfuPo7MRKKEcOE7387lfdx8KhTFXHnsOXRpNWrl9dg3FjqI8Ikl4Vm
 /FCHdwiMwYwpDhRIbW3NNKXLD5D50lj4rxmnuJwMRHzMaCeDweYjIttGqhyUYd24d+mY
 xSzNIyfQxzZLufWuFUsw/Ly2Yzhz8kGSHlBnMfeYBDfCdLABjmygLgfecDD/BtkrphA5
 crzTM2rUa8xGeBuE0VEHronp1hRKVdkEODFR4uh8ZWzAcRU3yL5G3cpVQt5YYPhtiAZW
 ysWw==
X-Gm-Message-State: AO0yUKUqPydUoB0GjSRM4gvrFFdFwz5R1zu9kUHRZVz/sKeOf8vfdg37
 2+VJ/6xe4P+fx3HoCjDIeddoqMqqhDB0+GQ4j1A=
X-Google-Smtp-Source: AK7set8DwP9MewXwfFlLkSjpzSUQqkWLh+LrhOSb/dNrSk9q1g18qNCDa9/lbTmwemGcBB1DAInpQg==
X-Received: by 2002:a17:90b:17c4:b0:234:e0c:caaa with SMTP id
 me4-20020a17090b17c400b002340e0ccaaamr26061822pjb.6.1678444284786; 
 Fri, 10 Mar 2023 02:31:24 -0800 (PST)
Received: from fedlinux.. ([106.84.129.9]) by smtp.gmail.com with ESMTPSA id
 ke15-20020a170903340f00b0019a96d3b456sm1146930plb.44.2023.03.10.02.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:24 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org, stefanha@redhat.com,
 hare@suse.de, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 3/4] qemu-iotests: test zone append operation
Date: Fri, 10 Mar 2023 18:31:05 +0800
Message-Id: <20230310103106.62124-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103106.62124-1-faithilikerun@gmail.com>
References: <20230310103106.62124-1-faithilikerun@gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This tests is mainly a helper to indicate append writes in block layer
behaves as expected.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 qemu-io-cmds.c                     | 65 ++++++++++++++++++++++++++++++
 tests/qemu-iotests/tests/zoned.out |  7 ++++
 tests/qemu-iotests/tests/zoned.sh  |  9 +++++
 3 files changed, 81 insertions(+)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index f35ea627d7..4159f41ab9 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1874,6 +1874,70 @@ static const cmdinfo_t zone_reset_cmd = {
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
+    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern,
+                       flags & BDRV_REQ_REGISTERED_BUF);
+    if (buf == NULL) {
+        return -EINVAL;
+    }
+    ret = do_aio_zone_append(blk, &qiov, &offset, flags, &total);
+    if (ret < 0) {
+        printf("zone append failed: %s\n", strerror(-ret));
+        goto out;
+    }
+
+out:
+    qemu_io_free(blk, buf, qiov.size,
+                 flags & BDRV_REQ_REGISTERED_BUF);
+    qemu_iovec_destroy(&qiov);
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
@@ -2672,6 +2736,7 @@ static void __attribute((constructor)) init_qemuio_commands(void)
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
index 9d7c15dde6..6c3ded6c4c 100755
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
2.39.2


