Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FB460FC44
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:48:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo55T-0002g4-9p; Thu, 27 Oct 2022 11:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo55Q-0002d8-1z; Thu, 27 Oct 2022 11:46:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo55L-0001LQ-L0; Thu, 27 Oct 2022 11:46:27 -0400
Received: by mail-pl1-x629.google.com with SMTP id c2so1899571plz.11;
 Thu, 27 Oct 2022 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5xermXZz2dzDd2OOV3cCqQeQVqHekRDRYxUpyHfIJKs=;
 b=Xd7yLwxhtgzcSNfwIK5R9WTI1lqeut8pN80SGWV08iMsUql2cHF1IVsgG1sQjKKElu
 1xFXwJYkGtxfz4AqJTH+VST0wrPWuNs3fcaso9iOL8dNkEnXyATqDo3owyLwN1F1u8Od
 G1ltiR7RzvcOv/xVESbBRU+YajjHvNuQ2Q1ocZpryYQuH3DgjIdGxsVvKgCD8ZxE9QVU
 N9/VhW8aKFxB4XA7FVefW5Ti8vZ4TDVqL/hNmTbKAVbdpc91YD0wnFdaZkfd9kVWwEkY
 cgmK6ERZ5Hv9uQ5Zn9HRXsdAIk4j0OZuPQ+2WPzx6242qxSvOihFlCEfY+4z2GqHfkUS
 z66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5xermXZz2dzDd2OOV3cCqQeQVqHekRDRYxUpyHfIJKs=;
 b=A6i/StWBfHZNWpKas3QDCVKS4RSnrZ5Xw0dIrONsEiKeAuck2nPLDzyEuKinzZ0i+C
 WSdzo4UgSiKsw+ONNFeIbh8iwIXf5VaJ5p0RqefWxQQhZyn+B0S3d5a5dM+MeRAuvdNR
 JAYGYXBPKCcEVD4Xlr+br9o9vEWXFOhKa31EDi05nBKsKBSpqZuZOGNw5cr8p1IeeKov
 4fBwolxHKuNqx+zGkeYGqPH0Wjp+WU9dDY6qOQh6L198Iri7+VgYLuo7QLywB8wOaKxK
 vsBuupD6ikAiLf9YasmqH/yVxJD0czZ3BXUlzz+B5ATjWMzuszJLyAV8tArEOaBjB1w8
 b5Zw==
X-Gm-Message-State: ACrzQf3apK8SpGkkslWnGOhr3z5B4cPoEel+dSZ0xUwNCU7eSSTvlmhg
 XxEiViiQeTLOR6ATHt0CiQf8znHut/D3/Khf
X-Google-Smtp-Source: AMsMyM4QmPSDSSr/4fY7PUF3+EwRFnpnu/RGA5tVjjPMCcse6PJ5URqOL3B6gR47YC+ceJB0yga8gA==
X-Received: by 2002:a17:90a:4b02:b0:212:f63f:6deb with SMTP id
 g2-20020a17090a4b0200b00212f63f6debmr10951913pjh.241.1666885581421; 
 Thu, 27 Oct 2022 08:46:21 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 q9-20020a63d609000000b004405c6eb962sm1232801pgg.4.2022.10.27.08.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:46:21 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Eric Blake <eblake@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v13 8/8] docs/zoned-storage: add zoned device documentation
Date: Thu, 27 Oct 2022 23:45:04 +0800
Message-Id: <20221027154504.20684-9-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027154504.20684-1-faithilikerun@gmail.com>
References: <20221027154504.20684-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x629.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


