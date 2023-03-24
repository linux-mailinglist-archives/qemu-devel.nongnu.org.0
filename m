Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7356C8195
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfdOn-0002kq-VV; Fri, 24 Mar 2023 05:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdOi-0002k7-BB; Fri, 24 Mar 2023 05:07:44 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdOZ-0000Uy-Dn; Fri, 24 Mar 2023 05:07:44 -0400
Received: by mail-pl1-x634.google.com with SMTP id o2so1267325plg.4;
 Fri, 24 Mar 2023 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679648828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4E8gndD2asyocPN155ZzqxwgK2K7nT15tzIEILi0sRQ=;
 b=GT2ltPkJq1916pNnzea+ORGP6EH4UlqGjlUDvpYBDhxGzO6Xe12TGDlOcj2M0wE5j4
 vkLb3ylJqWg2VuCKRcHf3mvGveKBxXsJQdk+KL84RTFlvpnV+3fCmxMeFeRLH/wg9/XZ
 ean2AI4H1z6aqQhtjJpasfSpUrcsji9tvTbxTRGeQHgw5P0at68Iu6uK7hJpcqyP0eKt
 XEAhwlwYN42XijnyNIwmN+sDVj7G1Pk2oy0sybl8qI6X8u0gAqMP46E7Ra40tJ8Ht6n7
 XFnay3NahDFl6sngUFzG+vuIUp0yENqoMI0Uq13NUtZeOEAnQbUWHnVxiotmeRbAbj0v
 Vz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679648828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4E8gndD2asyocPN155ZzqxwgK2K7nT15tzIEILi0sRQ=;
 b=Yb1UuSN+AN6U1KtCAkEvCUKTgcX+3lT3l04NQ5lHw6RB7yfO3cDfYj8JVLvm19IvVs
 iFrNFzNVIx1WIAdq7uystT+xgtdsihBD3BJOPrCLfcpkROTvjDT5RmdY44ow4XEpo206
 TeiY/xnI06QsPXs5tu4T2xeWkaJqDZ7WzJ4pGSLmPmPRBS9kEBml0zPrJNrisQYI/9eR
 Ec23CAmnUx9AmgN0yJkHj7E1fDZjjdIDrzuKL5CU5hkDw7/2wuyxEK4R6q0lDIYBO32c
 a5aoJ9cZy/H28GswsLvqLcea+gzLsMjTOM6R3Y2Vc1FN3E77x+/+CxlJXDhqlnkqBUp5
 6V1Q==
X-Gm-Message-State: AAQBX9daEYmMfmisQMXcEgcfS6Bxe2SQmlassupsS2UDfAPNPZ0kHKwZ
 Ocj4FgJffmvym95GE/pi15aQqHcSGHwbYKTT
X-Google-Smtp-Source: AKy350bhNJzLKMjENLBsb5Vp6/wS24FVCWWHaWebbT8D/hztM1g7nplE5QtCQWmDpqKMk6CjVMFT/A==
X-Received: by 2002:a17:902:f550:b0:1a1:d70f:7114 with SMTP id
 h16-20020a170902f55000b001a1d70f7114mr2557951plf.14.1679648827455; 
 Fri, 24 Mar 2023 02:07:07 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 u4-20020a170902b28400b001a06b33923bsm13722350plr.164.2023.03.24.02.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:07:07 -0700 (PDT)
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
Subject: [PATCH v18 8/8] docs/zoned-storage: add zoned device documentation
Date: Fri, 24 Mar 2023 17:06:05 +0800
Message-Id: <20230324090605.28361-9-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324090605.28361-1-faithilikerun@gmail.com>
References: <20230324090605.28361-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x634.google.com
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

Add the documentation about the zoned device support to virtio-blk
emulation.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 docs/devel/zoned-storage.rst           | 43 ++++++++++++++++++++++++++
 docs/system/qemu-block-drivers.rst.inc |  6 ++++
 2 files changed, 49 insertions(+)
 create mode 100644 docs/devel/zoned-storage.rst

diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
new file mode 100644
index 0000000000..6a36133e51
--- /dev/null
+++ b/docs/devel/zoned-storage.rst
@@ -0,0 +1,43 @@
+=============
+zoned-storage
+=============
+
+Zoned Block Devices (ZBDs) divide the LBA space into block regions called zones
+that are larger than the LBA size. They can only allow sequential writes, which
+can reduce write amplification in SSDs, and potentially lead to higher
+throughput and increased capacity. More details about ZBDs can be found at:
+
+https://zonedstorage.io/docs/introduction/zoned-storage
+
+1. Block layer APIs for zoned storage
+-------------------------------------
+QEMU block layer supports three zoned storage models:
+- BLK_Z_HM: The host-managed zoned model only allows sequential writes access
+to zones. It supports ZBD-specific I/O commands that can be used by a host to
+manage the zones of a device.
+- BLK_Z_HA: The host-aware zoned model allows random write operations in
+zones, making it backward compatible with regular block devices.
+- BLK_Z_NONE: The non-zoned model has no zones support. It includes both
+regular and drive-managed ZBD devices. ZBD-specific I/O commands are not
+supported.
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
+For example, to test zone_report on a null_blk device using qemu-io is:
+$ path/to/qemu-io --image-opts -n driver=host_device,filename=/dev/nullb0
+-c "zrp offset nr_zones"
diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index dfe5d2293d..105cb9679c 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -430,6 +430,12 @@ Hard disks
   you may corrupt your host data (use the ``-snapshot`` command
   line option or modify the device permissions accordingly).
 
+Zoned block devices
+  Zoned block devices can be passed through to the guest if the emulated storage
+  controller supports zoned storage. Use ``--blockdev host_device,
+  node-name=drive0,filename=/dev/nullb0,cache.direct=on`` to pass through
+  ``/dev/nullb0`` as ``drive0``.
+
 Windows
 ^^^^^^^
 
-- 
2.39.2


