Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A216F0AB9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:22:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps5JR-0007zE-I6; Thu, 27 Apr 2023 13:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5JO-0007ys-UR; Thu, 27 Apr 2023 13:21:43 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5JJ-0007SJ-NT; Thu, 27 Apr 2023 13:21:42 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1a920d484bdso68669855ad.1; 
 Thu, 27 Apr 2023 10:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682616095; x=1685208095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1c0sfqfBQALkwLl03dvFSnDNE5/8ZWsJGfmKl5eHJY=;
 b=ekLgshXtRMhvbKiBIJvvghALEzekVLJr0x++GHVNahlIBxv8u957ByJiRyIVhTy2Wz
 FHZxpDqslMJZjKAWZx02dJOAiDTSPKqx2P2jv6u6qkPwhge+TjNke7JGRHGBxDkm6nxz
 3gkzgLZeIDlhq2bg5RkI4SOou/2vwJDOWC1TxjD0kqaH/bLSClR1FWC5v6KJa3+y3tBd
 EiZEoIkIJKuzc4BwD+smvPfIX9IGog+eYsZ3aLUY6TmA9ULLsSgFGNCUCo/wqePxaFyt
 epDInIthOx9Wfr6giyUW51g6vgG1EXD/G2c7ZQKN4S6ZW/716eNahGD/cl3Xsi2O5IC9
 Wcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682616095; x=1685208095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1c0sfqfBQALkwLl03dvFSnDNE5/8ZWsJGfmKl5eHJY=;
 b=R+2Zp2o+Sbap/c9GCRLJ7DyBv/JAkQqPwSLFPC0fN55ki2URRh75kfdduIasVE1oQQ
 uYHOwHTT9EzkPkiiJ83A+2VM7J/RHDhWQObJUQF3QvgBv6pW7FTemQlPIfWJaiqd1qIg
 uCXU4HOgNXQ016Z++KbRCizS7NI50pRTzPXrn1fNUFwXvc8LZP2Vl6u5bsJStNgAacLW
 WZVDvIpFI3n9D8Eg4aNHDHNsvxkogU9moG8smByjh3k+X9tNdMoiAVH09Fn4zwaXJhLv
 GDqopSMayOq5R/kQbqywej0HysJKFWDHUNveBPmNjZddp+3JyfHj1vRNeXeIBOznj/dY
 b2hQ==
X-Gm-Message-State: AC+VfDwxsswLCOZ6/+7lmg+oqcKMc/kx9yo2X1cwE4TfIZAon1nTuPT0
 6MsgmMfzllX2hvWvSFF+R1yqEasva7foNVoYEX8=
X-Google-Smtp-Source: ACHHUZ6hDNIsnj0OoPm+vYUxrTDz1Mwju6fVdiOrOfntFg2WRFpWi6NRap2Uil8k5omlYHRSJDJ4UA==
X-Received: by 2002:a17:903:200c:b0:1a9:8ddd:8215 with SMTP id
 s12-20020a170903200c00b001a98ddd8215mr1766773pla.4.1682616094210; 
 Thu, 27 Apr 2023 10:21:34 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.101]) by smtp.gmail.com with ESMTPSA id
 p1-20020a170902a40100b001a95c7742bbsm8878578plq.9.2023.04.27.10.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:21:33 -0700 (PDT)
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
 Sam Li <faithilikerun@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [PATCH v19 8/8] docs/zoned-storage: add zoned device documentation
Date: Fri, 28 Apr 2023 01:20:19 +0800
Message-Id: <20230427172019.3345-9-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172019.3345-1-faithilikerun@gmail.com>
References: <20230427172019.3345-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x635.google.com
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

Add the documentation about the zoned device support to virtio-blk
emulation.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20230324090605.28361-9-faithilikerun@gmail.com
[Add index-api.rst to fix "zoned-storage.rst:document isn't included in
any toctree" error.
--Stefan]
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/devel/index-api.rst               |  1 +
 docs/devel/zoned-storage.rst           | 43 ++++++++++++++++++++++++++
 docs/system/qemu-block-drivers.rst.inc |  6 ++++
 3 files changed, 50 insertions(+)
 create mode 100644 docs/devel/zoned-storage.rst

diff --git a/docs/devel/index-api.rst b/docs/devel/index-api.rst
index 60c0d7459d..7108821746 100644
--- a/docs/devel/index-api.rst
+++ b/docs/devel/index-api.rst
@@ -12,3 +12,4 @@ generated from in-code annotations to function prototypes.
    memory
    modules
    ui
+   zoned-storage
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
2.40.0


