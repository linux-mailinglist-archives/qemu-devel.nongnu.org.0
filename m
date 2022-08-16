Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41315952E9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:47:19 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNqMA-0005UT-SO
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1Z-0006Ez-C9; Tue, 16 Aug 2022 02:26:01 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1X-0003dm-Cr; Tue, 16 Aug 2022 02:26:00 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso568207pjk.0; 
 Mon, 15 Aug 2022 23:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=LR986ojhUARUop8jfo7ruxBtsc8WmLIQeeugiixceKA=;
 b=Lmzd/m9abN23+bEg6o2tXMtbX4nEkWIG/0WVIv+9kvwz5QeWSDPvexT29XV9wDrmru
 yQSXX7MvLtuWfbCkUlKV8MGs5WRAORL7FpoFB2QFlgRlU/dDkLRvgqzB5GACA45+H/hW
 AndjRGZr4jJh2p9Olz4d0gS1cr7H+5aRXhjCPBR2tTC7ea/jJFyslnscrobWToQlGh3f
 ltkFK2ej0M+SC9wqfaZ/YGUbIDTK5iwN6WVOnJji1gOomT9nisuSZ+f7/IygMAe000JP
 7NpVGaKT559n6D/emFvPzIKLBWk7W6FHSFPjUXFnSQUJQmrKmb9VLxBZM9vzhBqyUa9b
 vVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=LR986ojhUARUop8jfo7ruxBtsc8WmLIQeeugiixceKA=;
 b=U0AaBFnYIw5Ay7BhBGE81TAx8SGsDCx2eiAa1x0tZVM9f0OZmBJ3O++DIUFwpluPE+
 +aUe38+F4rbnCHHXyPiYK2fzYRaYaepZX+6lSdxegcqUMR4ntO7DQ4HrfFR0yZoCodNA
 hFbbVRzyCxOO4BTQhSOFBvDp3mJAB3TqbuAEFm+Ix3wCibuIKfigeurqRZnYuLSS84h0
 Gyl3yCafKn3DS87seQ0fNQBF+1/v4MBRULkvHHz3M1xcBs6CPXAO+kUfial/oZegyZaR
 R2eHx0/5+Aeo4uWvUPZAqgOjXsDG57i4jaxC2FDf1nbLBbjSL0SmWqv7MpxpLSkN+rkx
 GRYQ==
X-Gm-Message-State: ACgBeo2+I2ro7qz1kewNd4+nzqftdDSfUp5dkfnRbQHvK5oEAGRyOsUa
 Z4iKWtBa7524Cq+ZB+azGaWk/lJkJix/KA==
X-Google-Smtp-Source: AA6agR7gffjW5qF/OZRY42jPBYq6Rhrj/bRgYgncSC7ZVd8H1qeIqH6JhbMC+XZOtArVvPVTP1DQ6A==
X-Received: by 2002:a17:90b:33cb:b0:1f4:f635:93f8 with SMTP id
 lk11-20020a17090b33cb00b001f4f63593f8mr32885998pjb.74.1660631157472; 
 Mon, 15 Aug 2022 23:25:57 -0700 (PDT)
Received: from roots.. ([106.84.129.185]) by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b0016f1c1f50f4sm8082868pln.235.2022.08.15.23.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 23:25:57 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 damien.lemoal@opensource.wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 8/8] docs/zoned-storage: add zoned device documentation
Date: Tue, 16 Aug 2022 14:25:22 +0800
Message-Id: <20220816062522.85714-9-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816062522.85714-1-faithilikerun@gmail.com>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102e.google.com
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

Add the documentation about the zoned device support to virtio-blk
emulation.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/devel/zoned-storage.rst           | 41 ++++++++++++++++++++++++++
 docs/system/qemu-block-drivers.rst.inc |  6 ++++
 2 files changed, 47 insertions(+)
 create mode 100644 docs/devel/zoned-storage.rst

diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
new file mode 100644
index 0000000000..ead2d149cc
--- /dev/null
+++ b/docs/devel/zoned-storage.rst
@@ -0,0 +1,41 @@
+=============
+zoned-storage
+=============
+
+Zoned Block Devices (ZBDs) devide the LBA space into block regions called zones
+that are larger than the LBA size. It can only allow sequential writes, which
+reduces write amplification in SSDs, leading to higher throughput and increased
+capacity. More details about ZBDs can be found at:
+
+https://zonedstorage.io/docs/introduction/zoned-storage
+
+1. Block layer APIs for zoned storage
+-------------------------------------
+QEMU block layer has three zoned storage model:
+- BLK_Z_HM: This model only allows sequential writes access. It supports a set
+of ZBD-specific I/O request that used by the host to manage device zones.
+- BLK_Z_HA: It deals with both sequential writes and random writes access.
+- BLK_Z_NONE: Regular block devices and drive-managed ZBDs are treated as
+non-zoned devices.
+
+The block device information resides inside BlockDriverState. QEMU uses
+BlockLimits struct(BlockDriverState::bl) that is continuously accessed by the
+block layer while processing I/O requests. A BlockBackend has a root pointer to
+a BlockDriverState graph(for example, raw format on top of file-posix). The
+zoned storage information can be propagated from the leaf BlockDriverState all
+the way up to the BlockBackend. If the zoned storage model in file-posix is
+set to BLK_Z_HM, then block drivers will declare support for zoned host device.
+
+The block layer APIs support commands needed for zoned storage devices,
+including report zones, four zone operations, and zone append.
+
+2. Emulating zoned storage controllers
+--------------------------------------
+When the BlockBackend's BlockLimits model reports a zoned storage device, users
+like the virtio-blk emulation or the qemu-io-cmds.c utility can use block layer
+APIs for zoned storage emulation or testing.
+
+For example, the command line for zone report testing a null_blk device of
+qemu-io-cmds.c is:
+$ path/to/qemu-io --image-opts driver=zoned_host_device,filename=/dev/nullb0 -c
+"zrp offset nr_zones"
diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index dfe5d2293d..0b97227fd9 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -430,6 +430,12 @@ Hard disks
   you may corrupt your host data (use the ``-snapshot`` command
   line option or modify the device permissions accordingly).
 
+Zoned block devices
+  Zoned block devices can be passed through to the guest if the emulated storage
+  controller supports zoned storage. Use ``--blockdev zoned_host_device,
+  node-name=drive0,filename=/dev/nullb0`` to pass through ``/dev/nullb0``
+  as ``drive0``.
+
 Windows
 ^^^^^^^
 
-- 
2.37.1


