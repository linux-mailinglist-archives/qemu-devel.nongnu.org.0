Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2495F96D5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:33:55 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohic6-0001d8-4H
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiR6-0003Aw-J4; Sun, 09 Oct 2022 22:22:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQr-0006MW-9o; Sun, 09 Oct 2022 22:22:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso11895175pjf.2; 
 Sun, 09 Oct 2022 19:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M31EW5S6vG1yBLEmkW0Pm4rG7QGT7vbmcxx33vJeyFw=;
 b=B9FQLaYI3DIUI2B6fw8lJkoJ5AeP7vyV4el9LGpd/ogc5iAZFWNPOX5QGmyGwMs2Y8
 b7YbawwaI5q6KOZ2V518U+BgI9RzOBQerwPn3goZeDmJZzHByDVC7Z8qx8a6hif1Jtoa
 88j2GfX8XvDIqhsMHmk0i7EykDWGXT1Ro4yUR7ZG7+bvkmCnCg72nQP5AP66tcgu0G1d
 v8gzzLcjw4fPUImrEuIF1gL6/NDkj3fUIEig/Azo+Db/VxHKz3B8iDOUvZ+O4JEmI8Df
 13t2AoXFRuvbinWZWIRcAfZiBcJeFWc68NEjZTiFalKG3RzpN8w4csQsIeI1+C3wb1dz
 TJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M31EW5S6vG1yBLEmkW0Pm4rG7QGT7vbmcxx33vJeyFw=;
 b=fAamLkvhN1OxAGYR5TjotVkVljwQe2rO14T/JgWUy/6gyyCpatbdDO21B3X8SLWGet
 QUh0Zf9ooovkH/xNtoTvSBddyIgoi+pQxQWUVLI+RT1rysQR2N0xefHO5pU2GoIE8aUY
 vDGmfW3IUwjW5swN/H/wvhN9p+JNGjYfpRJYnxUVNK7g0+FYWgWvF5+R3BD+C1yX6DRl
 rlT6T4FVcE5CDAu5NN+Dt6Gw67KlUSajL8PQbpvyR+jDP98zr0ujDkNirDLb80okmarJ
 g8f25AQcLMBBJCd+gvYh0WORMiPZu2M6PTeFtmgRkPj8txAa7rhNXLXt0IL4OVkGeWKf
 gz+w==
X-Gm-Message-State: ACrzQf1L9y9eneSc87RU5m2eIjuxnE0WaIo8PhVn4SXMGvJQOCQLRCxK
 zC1fp9aq2PPVgI61UH5A+wOh7EK/Ov1F5r+amMY=
X-Google-Smtp-Source: AMsMyM6w6PUgdARhmCctdFYLHCtAaH+7VXKbYfhZucXrJna1LLb2P5j15ju5SeYnONGRTgrhCgL+kg==
X-Received: by 2002:a17:90b:4b88:b0:20a:cbb0:3c86 with SMTP id
 lr8-20020a17090b4b8800b0020acbb03c86mr27985881pjb.207.1665368534940; 
 Sun, 09 Oct 2022 19:22:14 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 l12-20020a170902f68c00b00178323e689fsm5372740plg.171.2022.10.09.19.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:22:14 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 hare@suse.de, damien.lemoal@opensource.wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 7/7] docs/zoned-storage: add zoned device documentation
Date: Mon, 10 Oct 2022 10:21:16 +0800
Message-Id: <20221010022116.41942-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010022116.41942-1-faithilikerun@gmail.com>
References: <20221010022116.41942-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 docs/devel/zoned-storage.rst           | 40 ++++++++++++++++++++++++++
 docs/system/qemu-block-drivers.rst.inc |  6 ++++
 2 files changed, 46 insertions(+)
 create mode 100644 docs/devel/zoned-storage.rst

diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
new file mode 100644
index 0000000000..deaa4ce99b
--- /dev/null
+++ b/docs/devel/zoned-storage.rst
@@ -0,0 +1,40 @@
+=============
+zoned-storage
+=============
+
+Zoned Block Devices (ZBDs) devide the LBA space into block regions called zones
+that are larger than the LBA size. They can only allow sequential writes, which
+can reduce write amplification in SSDs, and potentially lead to higher
+throughput and increased capacity. More details about ZBDs can be found at:
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
2.37.3


