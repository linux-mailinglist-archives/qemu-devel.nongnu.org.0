Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E926C8123
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:24:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfdYW-0003e2-Hh; Fri, 24 Mar 2023 05:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdYS-0003do-99; Fri, 24 Mar 2023 05:17:48 -0400
Received: from mail-yw1-f173.google.com ([209.85.128.173])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdYE-0003bj-CN; Fri, 24 Mar 2023 05:17:46 -0400
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5416b0ab0ecso22380097b3.6; 
 Fri, 24 Mar 2023 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679649443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=geY8LGrCMu8PY/GxXW+B7nE/o8TAlnSufOSc9fM8cWo=;
 b=i6VTcY92ggmEA7wsn1FbMbVcyD06RAysh8CjNLov1d/WUZ9SuzHAfIOtY/lsblHts/
 21FBunPUHqxDIPwWBNx8AEgADifn5AyiVI4vYQHfxvNqNpnZetM7hZDEc7e6lBkLsSNV
 YveZK+y5yMVAj5qA0EUTq59g2Ad5yKP8MM9RqzqUHO8O/9GTiHf1ZNHBd9kcDFxLXndY
 etjmLM1J/WmH0aKULyGugzor1r2iuQ6tkMQDNKr9+FYntr29LZ8UtG5rRH3GaeMRFisa
 W73vpFAg5W98AwlJEdvRlkK49eQP3+h5keurFljPxtj0pcGEFi8XkOL3BofaqrJyYUTv
 /eKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679649443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=geY8LGrCMu8PY/GxXW+B7nE/o8TAlnSufOSc9fM8cWo=;
 b=zlDdY7TDc7544t34Osu3X9ta9WbVf3eTqdzfHYLAZAn072qLPW0OdbUhGqd8KDVKV1
 0U25NNfSWOPXMDt9ExvGO+E4adSpei8Z2dDayo7PZgPg7ZeE4Cwoar+M6MdCv+SFFQSQ
 QVku8Mn6nFi8ngEeccjDPGK2d2eEtUUW177ByFxTRGBnzfbsNiSTBbNLY6q2nOpbEyoY
 MKJyVmaJaEtH2rk79IiYyT6KV8ovSDbEbJFOcC7t+/MotkPyk4BmssSu+S9kKBW9jZNo
 Hep+1z5PgtdAOpOODgxZry4VvS8bFRBrvANjBVE+IYQlHiuKqS/JvcmWp6wNg+3zRiE8
 J2RA==
X-Gm-Message-State: AAQBX9fkfn0xPvxyovWQH4lYWBgUcTtYLNZ42sdhhCmNXGtviGLMvYVe
 3+gkgV9PZhg4bgmCeV3YgvJKFOf8xBj/8peH
X-Google-Smtp-Source: AKy350afQM4/VP1iKIWNM6po9RfWj9a5OogwJKNFKSxWsnoCAw3nAMmiLTECyigRoKpl+X8OpVhUyg==
X-Received: by 2002:a17:903:189:b0:1a1:bede:5e34 with SMTP id
 z9-20020a170903018900b001a1bede5e34mr2202827plg.3.1679648813901; 
 Fri, 24 Mar 2023 02:06:53 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 u4-20020a170902b28400b001a06b33923bsm13722350plr.164.2023.03.24.02.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:06:53 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hare@suse.de,
 damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v18 6/8] qemu-iotests: test new zone operations
Date: Fri, 24 Mar 2023 17:06:03 +0800
Message-Id: <20230324090605.28361-7-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324090605.28361-1-faithilikerun@gmail.com>
References: <20230324090605.28361-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.173;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-f173.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The new block layer APIs of zoned block devices can be tested by:
$ tests/qemu-iotests/check zoned
Run each zone operation on a newly created null_blk device
and see whether it outputs the same zone information.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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
2.39.2


