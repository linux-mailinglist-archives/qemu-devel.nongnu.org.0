Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C437E6F0ABB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:22:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps5J7-00079N-Dt; Thu, 27 Apr 2023 13:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5J4-00076u-On; Thu, 27 Apr 2023 13:21:22 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5J2-0007PJ-Uj; Thu, 27 Apr 2023 13:21:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-51b6d0b9430so6577168a12.2; 
 Thu, 27 Apr 2023 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682616079; x=1685208079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwSvm8h+wUZyKdwpWuwbWauyBmol2X4X5Cr48k6rmec=;
 b=UQQX1LEdZVntjooiY5d+CC2PjIOR7mXVz4ZQnq+a2He9Pz2qKt/krvrMrARbwwWbjA
 mQwW5j9ALmqAnOmGB18YVdWgrxT4KXcxzigiEZ2DJfnZ85bvbeLkyZnVWuwESEIiEo+X
 AaTPK/0TeWj6fjCv56zi5ewx1mMe9q6icwySApjCRLuX18SqRkrbJkGQ8ijSB/LuE35Y
 UHaBAIGmDtfqZthIO4I6daSHlBJ4wEO8RdRLCI9dtnspeQrxRVb05AIdbyNeoNrAK7Ab
 2YzunGs6CFgD/garOGqhdsKGKJPp4r8nLyy+hwEODlbxP/+GnHL9uyQ0vnLnKBBYAK+e
 il8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682616079; x=1685208079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JwSvm8h+wUZyKdwpWuwbWauyBmol2X4X5Cr48k6rmec=;
 b=gWgDXgIMtS/9jzEavfhR4dsLwuL3lP3zLeLshJvMR1z00oM662em+0E2JfqVM050aq
 Xppq6fZ0FdFaavy+chbzoTUNFYJxuI9AbWPhNH/bSvLKAQgzA1DrCnOnVFPplOIf5YVK
 FD5M5Yl7v+/Pc6Tb2FgJ4vmJO/Ce60lGQ7rG+tgjfdwY+MO9C/7ezBeiRkhiL6/SwuMA
 +Gd1hRsOxjPTm1ik+hsvrGfp64nUKWIUcLr+JdkwwROIHh9BhEnVhQpCa8F0ZXXFkcSK
 zjO5oRC3hEohCMvLVHhBF75gpBRt4GufFDjmPAmP4ibeTSXhOZFZBdc/0ZxyzWSLMUxE
 qSGQ==
X-Gm-Message-State: AC+VfDzOYjnkLHorfaFYHGXVa1o8285dt8PmxGfRUru1hieW+zheXVUi
 KXMps7Hz6kFF7gu4l52YEyAt4A0breWas7wzItI=
X-Google-Smtp-Source: ACHHUZ7q0kPjm+53tE336aSOxFBp2fC12E6msNd+/j9hvZDjikw5Sf+OEtMQoxjcXjrZ19q+A7+03Q==
X-Received: by 2002:a17:902:c712:b0:1a5:2621:34cd with SMTP id
 p18-20020a170902c71200b001a5262134cdmr1811362plp.39.1682616078298; 
 Thu, 27 Apr 2023 10:21:18 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.101]) by smtp.gmail.com with ESMTPSA id
 p1-20020a170902a40100b001a95c7742bbsm8878578plq.9.2023.04.27.10.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:21:17 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, dlemoal@kernel.org, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 stefanha@redhat.com, dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v19 6/8] iotests: test new zone operations
Date: Fri, 28 Apr 2023 01:20:17 +0800
Message-Id: <20230427172019.3345-7-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172019.3345-1-faithilikerun@gmail.com>
References: <20230427172019.3345-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x52a.google.com
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


