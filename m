Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24926F9EDD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 06:57:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvsv3-0001DF-Qu; Mon, 08 May 2023 00:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsv2-0001D1-2d; Mon, 08 May 2023 00:56:16 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsv0-0005aD-AQ; Mon, 08 May 2023 00:56:15 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ab01bf474aso30249185ad.1; 
 Sun, 07 May 2023 21:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683521772; x=1686113772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwSvm8h+wUZyKdwpWuwbWauyBmol2X4X5Cr48k6rmec=;
 b=e3dEXF6Bt/zDlbvdN9XZs2d4AuStOnpdjRs9Xx3OBHFndcVGe4lsJkYKdzr/Dpwd/l
 c8wKzFv5GrckDws8eJgv0TOW9I6g3ekTepOkxsSnPyj6GaSHkAb8y5Qgp3NzYLPVI5Vz
 7kAp+H8JoDTOoWHCZtqi0wZZzdQMkQH/lB3ybtAJnxPzaDk1ONID4zL6kQnIj0ckuKVr
 xI65Y68/MHTgfkPihJGg6wJzb0dikzGZ55kNZCtF0TxQRaIp8gBrGvk+0fXz2H3L3uxy
 XS2OaeAEPbwOta5JWA11MBCO6uzGTPTEyfVrXRWNyvQDhttzTBD3Uoex1PP44ihgteJZ
 sUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683521772; x=1686113772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JwSvm8h+wUZyKdwpWuwbWauyBmol2X4X5Cr48k6rmec=;
 b=Psw+m7O9et0jjyFVyoTNzVt/5JDuLE7aG6+mHbieI1XKCDa4ViN9dfbSSSkZHz7wYL
 tokXCrJ6g2LHYZbZFSKDzWygcBL2ZB/DwJrRtII1zqlypWTARxqyBCdOsoFKcuY6pbGU
 Wd+FCqcV0wEPKwo9JPewXAWNe5H95tyD03YkWUZlPSeLAkaZzfu1Zrz2CZz1ybxXizen
 a0BeFpVSw4HIZ/Bkvgr7Hd8sgwhDw7o/gNupuHUaRPF0G+37JLkOJjvcKWx/dUpwz+aw
 slTGjGdtZCUZbg6uL7brtCNE5YeEyNebjSCLaN46ZQQwTLmG+bQMJ3y0cBPa9aiclhId
 070A==
X-Gm-Message-State: AC+VfDwN14wwO3DKalwmc7BHCWKK16W7v6yKf6KXDdRdHdhjt6bERBEI
 tjYWSGwKCwg7facfLPRNVeq4HtpvlSbg6s99
X-Google-Smtp-Source: ACHHUZ5FR2ojiLN7JGOFrKxMzdzNDPTzHqwo84tN2VIxREXNx4tO5/SMKHt0/IGbMd7Z3WDHvQ36YA==
X-Received: by 2002:a17:903:248:b0:1aa:e631:9f7f with SMTP id
 j8-20020a170903024800b001aae6319f7fmr10252543plh.41.1683521771547; 
 Sun, 07 May 2023 21:56:11 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a1709028e8c00b0019ef86c2574sm6007112plb.270.2023.05.07.21.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 21:56:10 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, dmitry.fomichev@wdc.com,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 dlemoal@kernel.org, hare@suse.de,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v20 6/8] iotests: test new zone operations
Date: Mon,  8 May 2023 12:55:31 +0800
Message-Id: <20230508045533.175575-7-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508045533.175575-1-faithilikerun@gmail.com>
References: <20230508045533.175575-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The new block layer APIs of zoned block devices can be tested by:
$ tests/qemu-iotests/check zoned
Run each zone operation on a newly created null_blk device
and see whether it outputs the same zone information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20230324090605.28361-7-faithilikerun@gmail.com
[Adjust commit message prefix as suggested by Philippe Mathieu-Daudé
<philmd@linaro.org>.
--Stefan]
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/qemu-iotests/tests/zoned     | 89 ++++++++++++++++++++++++++++++
 tests/qemu-iotests/tests/zoned.out | 53 ++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/zoned
 create mode 100644 tests/qemu-iotests/tests/zoned.out

diff --git a/tests/qemu-iotests/tests/zoned b/tests/qemu-iotests/tests/zoned
new file mode 100755
index 0000000000..56f60616b5
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned
@@ -0,0 +1,89 @@
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
+  sudo -n rmmod null_blk
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ../common.rc
+. ../common.filter
+. ../common.qemu
+
+# This test only runs on Linux hosts with raw image files.
+_supported_fmt raw
+_supported_proto file
+_supported_os Linux
+
+sudo -n true || \
+    _notrun 'Password-less sudo required'
+
+IMG="--image-opts -n driver=host_device,filename=/dev/nullb0"
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+echo "Testing a null_blk device:"
+echo "case 1: if the operations work"
+sudo -n modprobe null_blk nr_devices=1 zoned=1
+sudo -n chmod 0666 /dev/nullb0
+
+echo "(1) report the first zone:"
+$QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "report the first 10 zones"
+$QEMU_IO $IMG -c "zrp 0 10"
+echo
+echo "report the last zone:"
+$QEMU_IO $IMG -c "zrp 0x3e70000000 2" # 0x3e70000000 / 512 = 0x1f380000
+echo
+echo
+echo "(2) opening the first zone"
+$QEMU_IO $IMG -c "zo 0 268435456"  # 268435456 / 512 = 524288
+echo "report after:"
+$QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "opening the second zone"
+$QEMU_IO $IMG -c "zo 268435456 268435456" #
+echo "report after:"
+$QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo "opening the last zone"
+$QEMU_IO $IMG -c "zo 0x3e70000000 268435456"
+echo "report after:"
+$QEMU_IO $IMG -c "zrp 0x3e70000000 2"
+echo
+echo
+echo "(3) closing the first zone"
+$QEMU_IO $IMG -c "zc 0 268435456"
+echo "report after:"
+$QEMU_IO $IMG -c "zrp 0 1"
+echo
+echo "closing the last zone"
+$QEMU_IO $IMG -c "zc 0x3e70000000 268435456"
+echo "report after:"
+$QEMU_IO $IMG -c "zrp 0x3e70000000 2"
+echo
+echo
+echo "(4) finishing the second zone"
+$QEMU_IO $IMG -c "zf 268435456 268435456"
+echo "After finishing a zone:"
+$QEMU_IO $IMG -c "zrp 268435456 1"
+echo
+echo
+echo "(5) resetting the second zone"
+$QEMU_IO $IMG -c "zrs 268435456 268435456"
+echo "After resetting a zone:"
+$QEMU_IO $IMG -c "zrp 268435456 1"
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/tests/zoned.out
new file mode 100644
index 0000000000..b2d061da49
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.out
@@ -0,0 +1,53 @@
+QA output created by zoned
+Testing a null_blk device:
+case 1: if the operations work
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
-- 
2.40.0


