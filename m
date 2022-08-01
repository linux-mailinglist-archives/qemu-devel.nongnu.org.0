Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD2586256
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:42:14 +0200 (CEST)
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKRh-0006up-DN
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKKA-0004KW-79; Sun, 31 Jul 2022 21:34:37 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKK8-0000gh-Eo; Sun, 31 Jul 2022 21:34:25 -0400
Received: by mail-pg1-x52f.google.com with SMTP id bh13so8438439pgb.4;
 Sun, 31 Jul 2022 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Hrlr6S+WvZdp1hgKCfvKtMNgcntTY7LzWpVGjqF3Nv4=;
 b=c0riUX4U2ykMAsnLE8B+j5rIk0CHv/diMupF2mbYG5o/YGWIEXPCqWwmDTtvbzZ96M
 flLJv3/zmC/eyQ++Q0kARESsRVH9EPPc4tF5k7Lt7pnoUwBh4JEJ3D183uyq/zoJ8Jml
 I8rLCQ4bX1bSVZACen8KhUOpjqWOVV3FXlwZVV+2xFKTLlmpPPDfxtphhsHFCkEFLZZr
 D31eL9cAAYS58TUix71ViN0+Y6gWIqVjLLVFVb5seHoiTm04quCKy11w/oeXQZ5+inUy
 B+d71kuteKNz0zTfEQyRE63jZBPfrsCkEImKFKUIUJnelm92CEO/CtMQHmrvs/ZZzTs/
 A1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Hrlr6S+WvZdp1hgKCfvKtMNgcntTY7LzWpVGjqF3Nv4=;
 b=uotr3DLfsnLTVhj6EYmSrT2r/vWjmPRLuVDYBuPMoLJFwjntFfhsqG1DmAcAhICY3l
 /BwjSbuVZQzTg4fgYAPcuKxuJueDcZ0oaDLPif8pHBVIZzxtLHQacIF4VNYqQplck3cy
 djVxkp5Apgrmka855XVNDhV+FvpHDvhPtbgxmA87AN21/WOEtGn0CEMtHWbnmgwkH4Np
 5dMzUwzWaD/qv1hQ9PAtWGK1hcQ0lzQDwkUeGjB/Eor+52CokqSuRIknPPgjTZXIOovN
 tc7H61QuTzpaS0ua+S7ifQ7BUHs+XZP2JIB0FmDfyX8td436/MrIcQu9aEXP1PEkDKEU
 ryQg==
X-Gm-Message-State: ACgBeo0/7AuRpqxixkNV6VjmZfN23cRQBBN2BUJp0RV4JRYZxaGV71+0
 gHmiZ/TgIsb9g7dUQ32R7cHhilZG5h3GRAFu
X-Google-Smtp-Source: AA6agR7a6TXgOyiFfV1C0IIJqkmx945cTM1yoa5NbYzpA91T4cLD9yrywKBiMWp4z50/DF1D7U8/9A==
X-Received: by 2002:aa7:960a:0:b0:52d:862b:55a7 with SMTP id
 q10-20020aa7960a000000b0052d862b55a7mr1808254pfg.19.1659317662723; 
 Sun, 31 Jul 2022 18:34:22 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 l1-20020a17090a384100b001f31e91200asm7941377pjf.44.2022.07.31.18.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:34:22 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 10/11] qemu-iotests: test new zone operations
Date: Mon,  1 Aug 2022 09:34:16 +0800
Message-Id: <20220801013416.10786-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x52f.google.com
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


