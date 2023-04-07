Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F36DA9F8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 10:19:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkhII-0002Y2-97; Fri, 07 Apr 2023 04:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhIE-0002XJ-KY; Fri, 07 Apr 2023 04:17:58 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhIC-0006rq-J9; Fri, 07 Apr 2023 04:17:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id ix20so39508298plb.3;
 Fri, 07 Apr 2023 01:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680855475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hMgWCguzRYpDVHAJaMrHcwUlCI7lXgwjUP1BNHLpMtU=;
 b=UQ1a8nXSvbwmdpbThBQy4A3oSE6Wut0QBrCchr/CDphnf26F45PtbW6Kofcu8Hmfgm
 av0Lj3k8UiblL2nNDHi/AFnle79ki6hCjOEHq7GK/YfH42s4r5EVAwwK3O8hLIU6PpWV
 EuzVItV6E144X0M3EM/QZZu76ELm/fSedBqsenHdzQYHhLtGZPN0hRtfNfx68bdVRCjl
 Fb0s6EN19rLILYEidTWF6V4hF9LV8OwCJDSuQu10FhNmCuTWtzyUrXTMmLhM8mH66WSo
 9c4k0TZQtc8EQiwz7hswhC7X6HS/8It2QjR1Qd9dA3sgYrMZ1qTkXt/H+RyHOJoAoEJ6
 HU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680855475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hMgWCguzRYpDVHAJaMrHcwUlCI7lXgwjUP1BNHLpMtU=;
 b=wLTZg/3S7eIb8XrjShKzPRLMt3zmiDYr+3Jz5AG3F0NVedqnoyyiP/MHruthxtdMaQ
 Mc6qJBjRCZYohnAPTAVtIIxdYHysLu9mD1ROTCLHXfs/ImaPs5LXXmGE0VHCbvoClN2o
 4JAHgsUr89qi5tMGftFULSVMXzcjeo8VziYC/XYyk2kf2A5rLG4lzac3YeoREN00vf1H
 pZ8mPVKfepP7OMgmS1o65M0exn0BNBamO9cP6kgUhBLzqbbwQRo3gSZHOTyKfAZDZ3u7
 rVWZcRhOIfjaXfPTOJ7O55MHsTp4memNg5kiYJMfdmNn05cgltDSJdRSiJZony7FUzZJ
 fyEA==
X-Gm-Message-State: AAQBX9fxpUgXAvvHpSgDY0fb5VQG+mzUOlcULDxHisBSNHgPr85ZeBtw
 7zGwS0H+9CpxW7BAiR/rNHgHUw+WkntZYSZ+
X-Google-Smtp-Source: AKy350aHoGl+1jMtQ2J13o3cwV20KWDa8iiSuszhtIhpVq7HklUQDH+5mDlmlm+D7Q4o7Z70IrNdbQ==
X-Received: by 2002:a17:90a:1fcd:b0:236:a3c2:168a with SMTP id
 z13-20020a17090a1fcd00b00236a3c2168amr1665909pjz.33.1680855474803; 
 Fri, 07 Apr 2023 01:17:54 -0700 (PDT)
Received: from fedlinux.. ([106.84.131.166]) by smtp.gmail.com with ESMTPSA id
 jh19-20020a170903329300b00199193e5ea1sm2484890plb.61.2023.04.07.01.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 01:17:54 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 3/4] qemu-iotests: test zone append operation
Date: Fri,  7 Apr 2023 16:16:56 +0800
Message-Id: <20230407081657.17947-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407081657.17947-1-faithilikerun@gmail.com>
References: <20230407081657.17947-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62a.google.com
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

The patch tests zone append writes by reporting the zone wp after
the completion of the call. "zap -p" option can print the sector
offset value after completion, which should be the start sector
where the append write begins.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qemu-io-cmds.c                     | 75 ++++++++++++++++++++++++++++++
 tests/qemu-iotests/tests/zoned     | 16 +++++++
 tests/qemu-iotests/tests/zoned.out | 16 +++++++
 3 files changed, 107 insertions(+)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index f35ea627d7..3f75d2f5a6 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1874,6 +1874,80 @@ static const cmdinfo_t zone_reset_cmd = {
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
+    bool pflag = false;
+    int flags = 0;
+    int total = 0;
+    int64_t offset;
+    char *buf;
+    int c, nr_iov;
+    int pattern = 0xcd;
+    QEMUIOVector qiov;
+
+    if (optind > argc - 3) {
+        return -EINVAL;
+    }
+
+    if ((c = getopt(argc, argv, "p")) != -1) {
+        pflag = true;
+    }
+
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
+    if (pflag) {
+        printf("After zap done, the append sector is 0x%" PRIx64 "\n",
+               tosector(offset));
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
+    .argmax = 4,
+    .args = "offset len [len..]",
+    .oneline = "append write a number of bytes at a specified offset",
+};
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv);
 static const cmdinfo_t truncate_cmd = {
     .name       = "truncate",
@@ -2672,6 +2746,7 @@ static void __attribute((constructor)) init_qemuio_commands(void)
     qemuio_add_command(&zone_close_cmd);
     qemuio_add_command(&zone_finish_cmd);
     qemuio_add_command(&zone_reset_cmd);
+    qemuio_add_command(&zone_append_cmd);
     qemuio_add_command(&truncate_cmd);
     qemuio_add_command(&length_cmd);
     qemuio_add_command(&info_cmd);
diff --git a/tests/qemu-iotests/tests/zoned b/tests/qemu-iotests/tests/zoned
index 56f60616b5..3d23ce9cc1 100755
--- a/tests/qemu-iotests/tests/zoned
+++ b/tests/qemu-iotests/tests/zoned
@@ -82,6 +82,22 @@ echo "(5) resetting the second zone"
 $QEMU_IO $IMG -c "zrs 268435456 268435456"
 echo "After resetting a zone:"
 $QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo
+echo "(6) append write" # the physical block size of the device is 4096
+$QEMU_IO $IMG -c "zrp 0 1"
+$QEMU_IO $IMG -c "zap -p 0 0x1000 0x2000"
+echo "After appending the first zone firstly:"
+$QEMU_IO $IMG -c "zrp 0 1"
+$QEMU_IO $IMG -c "zap -p 0 0x1000 0x2000"
+echo "After appending the first zone secondly:"
+$QEMU_IO $IMG -c "zrp 0 1"
+$QEMU_IO $IMG -c "zap -p 268435456 0x1000 0x2000"
+echo "After appending the second zone firstly:"
+$QEMU_IO $IMG -c "zrp 268435456 1"
+$QEMU_IO $IMG -c "zap -p 268435456 0x1000 0x2000"
+echo "After appending the second zone secondly:"
+$QEMU_IO $IMG -c "zrp 268435456 1"
 
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/tests/zoned.out
index b2d061da49..fe53ba4744 100644
--- a/tests/qemu-iotests/tests/zoned.out
+++ b/tests/qemu-iotests/tests/zoned.out
@@ -50,4 +50,20 @@ start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:14, [type: 2]
 (5) resetting the second zone
 After resetting a zone:
 start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: 2]
+
+
+(6) append write
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
+After zap done, the append sector is 0x0
+After appending the first zone firstly:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x18, zcond:2, [type: 2]
+After zap done, the append sector is 0x18
+After appending the first zone secondly:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x30, zcond:2, [type: 2]
+After zap done, the append sector is 0x80000
+After appending the second zone firstly:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80018, zcond:2, [type: 2]
+After zap done, the append sector is 0x80018
+After appending the second zone secondly:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80030, zcond:2, [type: 2]
 *** done
-- 
2.39.2


