Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27A758A809
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:28:37 +0200 (CEST)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJshB-0003Bg-0D
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsEC-0003bK-Ju; Fri, 05 Aug 2022 03:58:40 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsE9-0001z1-BC; Fri, 05 Aug 2022 03:58:40 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 17so1647056pfy.0;
 Fri, 05 Aug 2022 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=c6dPTlYyPvubG8TXDDFuABwGKU2xBmZWlbheVh8goN4=;
 b=R9ghnCu40uRtCESpO4mp7PqFJcA3TVOEdixGk/lNgoZFNNkAL6qa18dulgGKls4VoU
 7226iy56fVqMr71htIjJKOX2iWftbNb/NKvDorFb7//JJ8Z8u5EZAwKTFcrC+iuYmwRy
 XH2nZTJtz65TUPrLC1TYOUAqDdaKROexehR59LF+RMLeEFLQSFiiQlKMyQy9uvcPxitV
 2m5ML0vpXx0lXb+JqI7hlaHrpxkJNadHe7aYvAvidtaccIY1OslEn1H7M71tZ7rEGBl7
 vfWVZfQPqs85ke/LPaWxcIJSmNHNmg/5tMTw6PRdUwaVHxagjVLstqYTk1UuWechMZkm
 sxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=c6dPTlYyPvubG8TXDDFuABwGKU2xBmZWlbheVh8goN4=;
 b=EIwpEOSS0/jAwaKlhg3mZdfP7k7MlwJ53C6yWC7H6ndNiytYTUKpo17EkwVdZBYjlj
 uEnNtaR7R6zDPYXj1Zeddv9s2s7YF4cZ8HxM5zodGfJfLrNQCJnm4Cuh24iHDxw6iTwK
 ZTey0xrUDEeXAaW4SbVHYAqiVjCM0BOxmUyxVF0delhdZh1gr6CFmK6ApMRKPtvbCmAy
 gOQ7s1zjd4V1pNPyiRIJaJicVVnWFYy/H+JTRzBa3N9bh1ALM7JLYtFH4jzL7VXv9T/0
 69q4jf0e6ZPB+kbc/cKtODwNRUV2Z8+nMKCwYNldg51hQB9i5vxoi0pbnSm/ymIFBhbA
 8FQQ==
X-Gm-Message-State: ACgBeo2qffmbBwneuwOgiEuJPURSeMuxW1HGcloybQsDUlA//3l4kU3k
 Quev++onRRnfS0xstdRvyaCUIZ80Y8ZFsw==
X-Google-Smtp-Source: AA6agR6gLdZMpMGCaVBbSbzOftpp/UrLX+WUWdzPoVeZtxjwZkpdfjLXx8rgYiQEXahJbHRnjJBZWA==
X-Received: by 2002:a63:d90b:0:b0:41a:ff05:4808 with SMTP id
 r11-20020a63d90b000000b0041aff054808mr4918827pgg.159.1659686315563; 
 Fri, 05 Aug 2022 00:58:35 -0700 (PDT)
Received: from roots.. ([106.84.130.246]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0016ee708350bsm2418564plg.14.2022.08.05.00.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:58:35 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hare@suse.de, Stefan Hajnoczi <stefanha@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 7/8] qemu-iotests: test new zone operations
Date: Fri,  5 Aug 2022 15:57:50 +0800
Message-Id: <20220805075751.77499-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805075751.77499-1-faithilikerun@gmail.com>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42a.google.com
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

We have added new block layer APIs of zoned block devices. Test it with:
Create a null_blk device, run each zone operation on it and see
whether reporting right zone information.

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
index 0000000000..d09be2ffcd
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.out
@@ -0,0 +1,53 @@
+QA output created by zoned.sh
+Testing a null_blk device:
+Simple cases: if the operations work
+(1) report the first zone:
+start: 0x0, len 0x80000, cap 0x80000,wptr 0x0, zcond:1, [type: 2]
+
+report the first 10 zones
+start: 0x0, len 0x80000, cap 0x80000,wptr 0x0, zcond:1, [type: 2]
+start: 0x80000, len 0x80000, cap 0x80000,wptr 0x80000, zcond:1, [type: 2]
+start: 0x100000, len 0x80000, cap 0x80000,wptr 0x100000, zcond:1, [type: 2]
+start: 0x180000, len 0x80000, cap 0x80000,wptr 0x180000, zcond:1, [type: 2]
+start: 0x200000, len 0x80000, cap 0x80000,wptr 0x200000, zcond:1, [type: 2]
+start: 0x280000, len 0x80000, cap 0x80000,wptr 0x280000, zcond:1, [type: 2]
+start: 0x300000, len 0x80000, cap 0x80000,wptr 0x300000, zcond:1, [type: 2]
+start: 0x380000, len 0x80000, cap 0x80000,wptr 0x380000, zcond:1, [type: 2]
+start: 0x400000, len 0x80000, cap 0x80000,wptr 0x400000, zcond:1, [type: 2]
+start: 0x480000, len 0x80000, cap 0x80000,wptr 0x480000, zcond:1, [type: 2]
+
+report the last zone:
+start: 0x1f380000, len 0x80000, cap 0x80000,wptr 0x1f380000, zcond:1, [type: 2]
+
+
+(2) opening the first zone
+report after:
+start: 0x0, len 0x80000, cap 0x80000,wptr 0x0, zcond:3, [type: 2]
+
+opening the second zone
+report after:
+start: 0x80000, len 0x80000, cap 0x80000,wptr 0x80000, zcond:3, [type: 2]
+
+opening the last zone
+report after:
+start: 0x1f380000, len 0x80000, cap 0x80000,wptr 0x1f380000, zcond:3, [type: 2]
+
+
+(3) closing the first zone
+report after:
+start: 0x0, len 0x80000, cap 0x80000,wptr 0x0, zcond:1, [type: 2]
+
+closing the last zone
+report after:
+start: 0x1f380000, len 0x80000, cap 0x80000,wptr 0x1f380000, zcond:1, [type: 2]
+
+
+(4) finishing the second zone
+After finishing a zone:
+start: 0x80000, len 0x80000, cap 0x80000,wptr 0x100000, zcond:14, [type: 2]
+
+
+(5) resetting the second zone
+After resetting a zone:
+start: 0x80000, len 0x80000, cap 0x80000,wptr 0x80000, zcond:1, [type: 2]
+*** done
diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
new file mode 100755
index 0000000000..db68aa88d4
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
+IMG="--image-opts driver=zoned_host_device,filename=/dev/nullb0"
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+echo "Testing a null_blk device:"
+echo "Simple cases: if the operations work"
+sudo modprobe null_blk nr_devices=1 zoned=1
+
+echo "(1) report the first zone:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "report the first 10 zones"
+sudo $QEMU_IO $IMG -c "zrp 0 10"
+echo
+echo "report the last zone:"
+sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2"
+echo
+echo
+echo "(2) opening the first zone"
+sudo $QEMU_IO $IMG -c "zo 0 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "opening the second zone"
+sudo $QEMU_IO $IMG -c "zo 524288 0x80000" # 524288 is the zone sector size
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1" # 268435456 / 512 = 524288
+echo
+echo "opening the last zone"
+sudo $QEMU_IO $IMG -c "zo 0x1f380000 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2"
+echo
+echo
+echo "(3) closing the first zone"
+sudo $QEMU_IO $IMG -c "zc 0 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "closing the last zone"
+sudo $QEMU_IO $IMG -c "zc 0x1f380000 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2"
+echo
+echo
+echo "(4) finishing the second zone"
+sudo $QEMU_IO $IMG -c "zf 524288 0x80000"
+echo "After finishing a zone:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo
+
+echo "(5) resetting the second zone"
+sudo $QEMU_IO $IMG -c "zrs 524288 0x80000"
+echo "After resetting a zone:"
+sudo $QEMU_IO $IMG -c "zrp 268435456 1"
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
-- 
2.37.1


