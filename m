Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98D57101C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:24:52 +0200 (CEST)
Received: from localhost ([::1]:59376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5Zz-0007QY-44
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pk-0000y8-O6; Mon, 11 Jul 2022 22:14:18 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pi-0007xZ-0d; Mon, 11 Jul 2022 22:14:16 -0400
Received: by mail-pg1-x529.google.com with SMTP id bf13so6294562pgb.11;
 Mon, 11 Jul 2022 19:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDjrm0H7uHOnTUuOuooiPn3aOFoherhF8zUE9XmuL88=;
 b=LtIVi7p94WuIQ52U/gPGAa/TFO96Do0KvQOu0d5mWOpAXq0gZyGY/aGAgwsl4NF4Bg
 e7z39ceIYc9hDXYjnz9v8IQX37hNIzgswuSb+9YmXtfnVvzxqFKZhnbKcW6X8kaMyIXP
 jUsiEfZEhB/1HktnX5Cc5AoG94m3+PjvXZireg+GsGzXKGFgnNn91/KyhgxWnSt2oGmL
 BRfGr+ikOHIXk8mxbjjRqzfo0JWfD0LJK3EmBlsPfZMdA13c6XmGXWCEWnvxIjDnSgNp
 TKsoEbGCgbgFtySCHSOcxiL2rGMFW4UNxyvS0B6uuV0CflGzmZ73dqKPBXIcOZ1++TIR
 fgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDjrm0H7uHOnTUuOuooiPn3aOFoherhF8zUE9XmuL88=;
 b=0TbsPVvYz3nT+42gNwi5XGLN4TkmTFX4Lw/5qekBIleOWg3thwyOs3315bQjvD4wls
 qndCgdrCWi8f9NU5o6sA7JKeqhlvfpcxPb646lmER1Qvntw1a7sLTJaM3CGGeuUW4/il
 wh2dLUxlkbmTlKu+vm4skDwyWKH1oWDIDpBw06qUO8PUiIGS2vgGWuAlIXnsvuCZ0iMx
 8VGPuBZplM0RXuvEKHAR2zosVVF/GhUQygVTFdHOBxJRokhTT5QXlszulxSBYW/vfHWG
 XZviTvoMPEkhPWPfkzq5/xaYqRBtdIIxlSjkH5WGvBD1N9nLaezSEnOu8fTXzksZJQ0C
 yycg==
X-Gm-Message-State: AJIora9A7c5J7CpgUR3571uMT2ugzXQBr0xZTy2ym0f10NveDs8H9ixu
 3RFseMVbtZjGSxBpMAsZxFOvx5L+S0K4y7fL
X-Google-Smtp-Source: AGRyM1tpksMFeuWGmUdWJl0St15+/XCB5D+MYNUqTr66K1+3g9SPzqZl8HICOBMAyGaT/7E8CiSbvg==
X-Received: by 2002:a63:ea55:0:b0:412:290c:9694 with SMTP id
 l21-20020a63ea55000000b00412290c9694mr18762569pgk.39.1657592051149; 
 Mon, 11 Jul 2022 19:14:11 -0700 (PDT)
Received: from roots.. ([106.84.131.214]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa79736000000b00528f9597fb3sm5430251pfg.197.2022.07.11.19.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 19:14:10 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 5/9] qemu-iotests: test new zone operations.
Date: Tue, 12 Jul 2022 10:13:41 +0800
Message-Id: <20220712021345.8530-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x529.google.com
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
(1) Create a null_blk device, run each zone operation on it and see
whether reporting right zone information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 tests/qemu-iotests/tests/zoned.sh | 69 +++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
new file mode 100755
index 0000000000..e14a3a420e
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.sh
@@ -0,0 +1,69 @@
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
+echo "Testing a null_blk device"
+echo "Simple cases: if the operations work"
+sudo modprobe null_blk nr_devices=1 zoned=1
+# hidden issues:
+# 1. memory allocation error of "unaligned tcache chunk detected" when the nr_zone=1 in zone report
+# 2. qemu-io: after report 10 zones, the program failed at double free error and exited.
+echo "report the first zone"
+sudo $QEMU_IO $IMG -c "zr 0 0 1"
+echo "report: the first 10 zones"
+sudo $QEMU_IO $IMG -c "zr 0 0 10"
+
+echo "open the first zone"
+sudo $QEMU_IO $IMG -c "zo 0 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zr 0 0 1"
+echo "open the last zone"
+sudo $QEMU_IO $IMG -c "zo 0x3e70000000 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zr 0x3e70000000 0 2"
+
+echo "close the first zone"
+sudo $QEMU_IO $IMG -c "zc 0 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zr 0 0 1"
+echo "close the last zone"
+sudo $QEMU_IO $IMG -c "zc 0x3e70000000 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zr 0x3e70000000 0 2"
+
+
+echo "reset the second zone"
+sudo $QEMU_IO $IMG -c "zrs 0x80000 0x80000"
+echo "After resetting a zone:"
+sudo $QEMU_IO $IMG -c "zr 0x80000 0 5"
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
-- 
2.36.1


