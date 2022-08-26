Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D655A2C6D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:39:17 +0200 (CEST)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcMW-0006Om-5Q
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRcIq-00039w-EK; Fri, 26 Aug 2022 12:35:42 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRcIn-00032x-PN; Fri, 26 Aug 2022 12:35:27 -0400
Received: by mail-pf1-x435.google.com with SMTP id p185so2011409pfb.13;
 Fri, 26 Aug 2022 09:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=5doS47fMTfezRlPemM1W4MLLTwXtSTvzKDCb5D1w3n8=;
 b=VkiKrNgMvrHfengNYIDuiZTG+hepfgiu7YF/VwnW89dbl1jCSZ4obId9Q/3vU5B2fh
 EKT6mxPhExzrMC+6KSmz6zZ2H1kIAQWq/xcb49Isc0qHyuvbpLwMpJyUBX67jgcqwT+q
 ziMpRcoCECtT84Que1NJS405t52Lx/xBJWAcHcN3x9KONT2ooDclYuC8V7V98+GhD5zM
 0sclvJJnFzn6LN+x/VFfOXCtd/rEdmRlNA4jjeernXpNPVjonch5QfC8UjWK2zfbWIl3
 eVhjBEXcvb7nAPlnixD8QPH1Hem+m+Kjv01cHNXTya9zLPVn5aFE31lbD4BJY3OYLd5Z
 N6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=5doS47fMTfezRlPemM1W4MLLTwXtSTvzKDCb5D1w3n8=;
 b=xL14X7aie72Q9Qv4k1tx2/temv62PheNiCKGCPqEcWmHWYloxr7tZZgnnzE5+GDvOf
 AcifGTX4MlKj1Z3PmCgCoyPS45J85dXpdl2GLjy7xRwYLOihC/JFUHG1fjgzC2H5kSTo
 aA9bZe0Xe3lZ6h4dNdSaYtChyxpbzn40MAq1ZAAvKaIEmUXLIHXDpn2jOxKh6DO4fS3s
 M4hkJzNM0XKVRob6v0cCnhmohWeSMqgECHEcZHLeft8DEwT25qF3u6+49eSsmYVIY/Sp
 WlaPJ6rcg8nRybeqPz6U1+075KAfnowhYDqfTX2p34SiPNo5474EOanA4OJBAozg7oD/
 00Lw==
X-Gm-Message-State: ACgBeo1Eq+xtirmdMwjys2s161DmaBT0kzKnMoQeb0Gfe7AV0Ghg4qAT
 dTyq9Iw/g5EUHPe0gF2a69fcgRKbIlWuoA==
X-Google-Smtp-Source: AA6agR6KwK21A8awRxASniHqgsIJ2OebRjLKCzNdnTdSZ5tFHAqKY3XbGWsFpr+cRtrrlAV1uvJlJA==
X-Received: by 2002:a05:6a00:1aca:b0:52f:55f8:c3ec with SMTP id
 f10-20020a056a001aca00b0052f55f8c3ecmr4509188pfv.25.1661531722990; 
 Fri, 26 Aug 2022 09:35:22 -0700 (PDT)
Received: from roots.. ([106.84.135.2]) by smtp.gmail.com with ESMTPSA id
 l23-20020a17090a599700b001fb6b179ecdsm1871851pji.38.2022.08.26.09.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 09:35:22 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, damien.lemoal@opensource.wdc.com,
 Dmitry.Fomichev@wdc.com, hare@suse.de, qemu-block@nongnu.org,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com, fam@euphon.net,
 kwolf@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v8 6/7] qemu-iotests: test new zone operations
Date: Sat, 27 Aug 2022 00:35:10 +0800
Message-Id: <20220826163510.9351-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x435.google.com
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
index 0000000000..d158db09c8
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
2.37.2


