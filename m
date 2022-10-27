Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3A60FC57
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:51:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo55C-0002Yo-VY; Thu, 27 Oct 2022 11:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo55A-0002XM-SR; Thu, 27 Oct 2022 11:46:12 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo557-0001Dy-W2; Thu, 27 Oct 2022 11:46:12 -0400
Received: by mail-pj1-x102a.google.com with SMTP id pb15so1918585pjb.5;
 Thu, 27 Oct 2022 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UDRne5xZbwbkxQ2/0o7lRb66oYqvDKMKGME0yjIxmY=;
 b=aaseu7VSizMYRU+Bskc+V9aR4X64cKShNyiMB/GMYJDwyeYEx+2U0vovJFXVrLVeeo
 Isa1R+ZQ1aWhMpMUtGdiCGYM/sW4M5Y+Q6TkXfmbqiL15L0kt06TxHw87XtqXtyDQOOB
 RKkuMGgoGnWZyzms+XbxiyXrVVDNk/zH8pyqHmo+or+2Gz1gcV7+4KLrlutfwK9kisnI
 o6WhiPHBvnbHFEh6qJzA8an/PYFObhit/LmGSKs9Z4AiEMeN0totVGfVXbAxO8deDb63
 tU1eyDPZ7PYSIMKNK/9ptRr2i7uxA3r/mqgDfFhUsKUJkPTrrIT3GTNMuhqtArEH7ijI
 vnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4UDRne5xZbwbkxQ2/0o7lRb66oYqvDKMKGME0yjIxmY=;
 b=uqx9N7jpdKhsQofSS3Mqnm+8cFsRNx9Gm+TApfP8ibDAvfP29FLGbyA+0S5RQ8HnhB
 W45OzeuCqqtSOPKOhp5/JA2GW8GH1o+q9bg8S97kKuvM7yvNQuQ7Kfweq/gft9HAIEa9
 Fyfl3SHnwk8Da3ZOf8+Ga9bHb8+XgWcEokntF+JXakRdgEHb6c+rW5pGIngClZhXhBxB
 4fv3Gx5S2o4dsRwAozSX8QN6moSoIf+VMlVzzqaDZyezONCVcj0HVEYYbc0HeYQujX5m
 mldTc0n4dkYedHNVa2J54wofdqbncVGY0dO33O3u0U9hakYBQw/RfFTJvLQDAarjBV/E
 GB8g==
X-Gm-Message-State: ACrzQf004coHUP0sOwcQ56OfEB1Le9CFfGdRG2w5skWrV2yHdRZiLn6y
 EEuzL1vycWmqYVcPcph9N3rJZ9wKHaGZdb7j
X-Google-Smtp-Source: AMsMyM6kITwWHFIIo9O4L7QDb6nChZS81ar+I5Vw6Ji+MoiNKGDxcIBzzA9pLecTZVzN+GSxPIi1Ow==
X-Received: by 2002:a17:902:ce12:b0:17a:3e76:8568 with SMTP id
 k18-20020a170902ce1200b0017a3e768568mr50106984plg.11.1666885566759; 
 Thu, 27 Oct 2022 08:46:06 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 q9-20020a63d609000000b004405c6eb962sm1232801pgg.4.2022.10.27.08.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:46:06 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Eric Blake <eblake@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v13 6/8] qemu-iotests: test new zone operations
Date: Thu, 27 Oct 2022 23:45:02 +0800
Message-Id: <20221027154504.20684-7-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027154504.20684-1-faithilikerun@gmail.com>
References: <20221027154504.20684-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102a.google.com
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

We have added new block layer APIs of zoned block devices. Test it as
follows: Run each zone operation on a newly created null_blk device
and see whether the logs show the correct zone information. By:
$ ./tests/qemu-iotests/tests/zoned.sh

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/qemu-iotests/tests/zoned.out | 53 ++++++++++++++++++
 tests/qemu-iotests/tests/zoned.sh  | 86 ++++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/tests/zoned.out
new file mode 100644
index 0000000000..0c8f96deb9
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.out
@@ -0,0 +1,53 @@
+QA output created by zoned.sh
+Testing a null_blk device:
+Simple cases: if the operations work
+(1) report the first zone:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
+
+report the first 10 zones
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: 2]
+start: 0x100000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:1, [type: 2]
+start: 0x180000, len 0x80000, cap 0x80000, wptr 0x180000, zcond:1, [type: 2]
+start: 0x200000, len 0x80000, cap 0x80000, wptr 0x200000, zcond:1, [type: 2]
+start: 0x280000, len 0x80000, cap 0x80000, wptr 0x280000, zcond:1, [type: 2]
+start: 0x300000, len 0x80000, cap 0x80000, wptr 0x300000, zcond:1, [type: 2]
+start: 0x380000, len 0x80000, cap 0x80000, wptr 0x380000, zcond:1, [type: 2]
+start: 0x400000, len 0x80000, cap 0x80000, wptr 0x400000, zcond:1, [type: 2]
+start: 0x480000, len 0x80000, cap 0x80000, wptr 0x480000, zcond:1, [type: 2]
+
+report the last zone:
+start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:1, [type: 2]
+
+
+(2) opening the first zone
+report after:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:3, [type: 2]
+
+opening the second zone
+report after:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:3, [type: 2]
+
+opening the last zone
+report after:
+start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:3, [type: 2]
+
+
+(3) closing the first zone
+report after:
+start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
+
+closing the last zone
+report after:
+start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:1, [type: 2]
+
+
+(4) finishing the second zone
+After finishing a zone:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:14, [type: 2]
+
+
+(5) resetting the second zone
+After resetting a zone:
+start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: 2]
+*** done
diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
new file mode 100755
index 0000000000..fced0194c5
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.sh
@@ -0,0 +1,86 @@
+#!/usr/bin/env bash
+#
+# Test zone management operations.
+#
+
+seq="$(basename $0)"
+echo "QA output created by $seq"
+status=1 # failure is the default!
+
+_cleanup()
+{
+  _cleanup_test_img
+  sudo rmmod null_blk
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.qemu
+
+# This test only runs on Linux hosts with raw image files.
+_supported_fmt raw
+_supported_proto file
+_supported_os Linux
+
+QEMU_IO="build/qemu-io"
+IMG="--image-opts -n driver=zoned_host_device,filename=/dev/nullb0"
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+echo "Testing a null_blk device:"
+echo "case 1: if the operations work"
+sudo modprobe null_blk nr_devices=1 zoned=1
+
+echo "(1) report the first zone:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "report the first 10 zones"
+sudo $QEMU_IO $IMG -c "zrp 0 10"
+echo
+echo "report the last zone:"
+sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2" # 0x3e70000000 / 512 = 0x1f380000
+echo
+echo
+echo "(2) opening the first zone"
+sudo $QEMU_IO $IMG -c "zo 0 268435456"  # 268435456 / 512 = 524288
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "opening the second zone"
+sudo $QEMU_IO $IMG -c "zo 268435456 268435456" #
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo "opening the last zone"
+sudo $QEMU_IO $IMG -c "zo 0x3e70000000 268435456"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2"
+echo
+echo
+echo "(3) closing the first zone"
+sudo $QEMU_IO $IMG -c "zc 0 268435456"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "closing the last zone"
+sudo $QEMU_IO $IMG -c "zc 0x3e70000000 268435456"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2"
+echo
+echo
+echo "(4) finishing the second zone"
+sudo $QEMU_IO $IMG -c "zf 268435456 268435456"
+echo "After finishing a zone:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo
+echo "(5) resetting the second zone"
+sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
+echo "After resetting a zone:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
-- 
2.38.1


