Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF7650868
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 09:09:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7BCa-0006NA-Mi; Mon, 19 Dec 2022 03:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BCY-0006KV-Ae; Mon, 19 Dec 2022 03:08:46 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BCP-0001K1-KH; Mon, 19 Dec 2022 03:08:46 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so12172206pjr.3; 
 Mon, 19 Dec 2022 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5xermXZz2dzDd2OOV3cCqQeQVqHekRDRYxUpyHfIJKs=;
 b=ls2kbyhW8KzLpiZhbhICPF/Q3NWSsoxXUWxRE1b1lO3feFpnb0JQedydJikW7btx9c
 g53l1+q4RdExtQcBJEdavVEJQI3HWM8x5P2Fa0/M/l6+kFuov/8i31xPLNI+88ou1k1L
 ARfj/2tut7qZV/ARf8cDtMMqaQPLeGKLmSiklLqiuaWVxkgMhfmv7Avi6yQI44mrvcKU
 yDbj0Gc+2fQDbeq+Fm1KDKrKGEKzWwg5z8vQcIq8hTq/ZzmZ8gCcUwf3ulFCCTeEPNVK
 ZzAzMBYNATMHkb57fikG/vq7pEbDaZyvCkXf8A/D/K8wooJw5Mz34S59V8fHpsrd8Rs+
 FTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5xermXZz2dzDd2OOV3cCqQeQVqHekRDRYxUpyHfIJKs=;
 b=qbSR1djKJ5B8iTFKy5saki55ZvHri90WLYALIPrGEangngL3l8yI9dfC7qExonkn4f
 me7AOCD+D8+mm/qVYXAIngtffJhPX0zUXPtBBe+MG19DTf8W3HbB7vsJCAa/bDVDD50w
 +rUc+LnDeCSBuDmbMH0R1AbW5xHs7Ei1wVoAqS/28HiDsaZMJpSk77H2iAHGyM/SRUa+
 1HUi4v8QolguZuhes3EgFVAjnHFJ9IQuk9Hfunrjjqyt0PL62jeu6bzcE0aQTghtCf7J
 gg7Q8gWKDFbzmjEZOWD6UFkG2fksWgFKe0LqN3nTz6VxCIky6yKR5zGmzDVqVX7dNTSv
 Weuw==
X-Gm-Message-State: AFqh2koMbz4ifEmdqLP6ZnLevm/mkIF3L/pxHSoelGXLM8LuLnyOUOUd
 IrSjTXOdjqmEktxYxXQC1gx7V9yGllwPGM7u
X-Google-Smtp-Source: AMrXdXsqetDcAZbc93AMvEm7FL3Suy39StGipumtvDGy9DTlUxmfP15vYNcRPH7daLYsnXXBT2E5zQ==
X-Received: by 2002:a17:90a:7f82:b0:223:8395:aa87 with SMTP id
 m2-20020a17090a7f8200b002238395aa87mr13719185pjl.26.1671437315386; 
 Mon, 19 Dec 2022 00:08:35 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 nu6-20020a17090b1b0600b002191a64b5d5sm8824155pjb.18.2022.12.19.00.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 00:08:34 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, hreitz@redhat.com, kwolf@redhat.com, dmitry.fomichev@wdc.com,
 pbonzini@redhat.com, damien.lemoal@opensource.wdc.com, fam@euphon.net,
 thuth@redhat.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 berrange@redhat.com, eblake@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v14 8/8] docs/zoned-storage: add zoned device documentation
Date: Mon, 19 Dec 2022 16:07:52 +0800
Message-Id: <20221219080752.10476-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1030.google.com
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
index 0000000000..03e52efe2e
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
+$ path/to/qemu-io --image-opts -n driver=zoned_host_device,filename=/dev/nullb0
+-c "zrp offset nr_zones"
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
2.38.1


