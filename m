Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4C6F9ED9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 06:57:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvsvE-0001FJ-0L; Mon, 08 May 2023 00:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsvB-0001El-Kw; Mon, 08 May 2023 00:56:25 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsv9-0005dL-Nm; Mon, 08 May 2023 00:56:25 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aaec6f189cso27015365ad.3; 
 Sun, 07 May 2023 21:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683521781; x=1686113781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1c0sfqfBQALkwLl03dvFSnDNE5/8ZWsJGfmKl5eHJY=;
 b=RAc+TsH87GSfr7w/nXlbpaB8mvBDUd6zEBDm84Ll8L7ZtWSMfzExotaoObF8QhDbPL
 iXcbjVoo6iwSr/U585m9bFgJv56ecCwUg/deSpNn3/qEy8WtIThVpIyPsDE/oJdw4I6V
 fc29h/sh5QNiObZH6TZb0HoCeaM+amEN9eLhTivnpB/zsJYlSB007cANMYtgcTomCb9y
 dOds6uJa8/E9Tb5Z1vmk8K4IRYXUr69I7eqZHGQ2mu8el31FQK32uxNgkRQ8I2Piovhb
 utMXlfT6GjjcynfZJ8vy6dPqbsIJp43bO4iPA9Iq6706tLV+Y1Lsp2LaGomiL2ri+Np9
 6ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683521781; x=1686113781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1c0sfqfBQALkwLl03dvFSnDNE5/8ZWsJGfmKl5eHJY=;
 b=VP/Prns3kEz5mH7dP307UurnOXXjiTLD8XX6nZWi7OK6/enm1Ydm8FWQJikPw4vl6v
 iR15DkYh6ZKF7C8kn217VFxv1YUF0GJXCSshtXiJOzbAUYk8q/e91V74L2L0RDzueBLz
 /j2aVgKd33/zjCUspqU7EIUT7eo9YI0VEZQwTIFsS65Uyqb1h3uylSiq8Ct8LwnkYJdO
 RIzZthtgeAtzH6hK8l11EeWh8msPGUOb+BRbb9zlRAyHEgtuJKNqe1dk+xRiafzPt14i
 3okd09eqwuQF9sIndJem6/XJ5Snk/myFOpwrj8sqkIAtyrlGGEscHGsPRewh9A/bHRVS
 97xA==
X-Gm-Message-State: AC+VfDwOXjszu1ENC2aVEVVVJlZA+S4E31yDCRznKpRb2VtaMaBZUWdW
 JD44bueFDQBIQVijBpKYcBzXer7reuMq8Bvb
X-Google-Smtp-Source: ACHHUZ5E14dOCkWJHohL9DAxZ5B+AZo81it/f9PimGNClj3aECMMqI9y+WWU5bLrbHwf18nr5TZJHA==
X-Received: by 2002:a17:902:e786:b0:1ac:7543:bcdf with SMTP id
 cp6-20020a170902e78600b001ac7543bcdfmr2606871plb.31.1683521781245; 
 Sun, 07 May 2023 21:56:21 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a1709028e8c00b0019ef86c2574sm6007112plb.270.2023.05.07.21.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 21:56:20 -0700 (PDT)
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
 Sam Li <faithilikerun@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [PATCH v20 8/8] docs/zoned-storage: add zoned device documentation
Date: Mon,  8 May 2023 12:55:33 +0800
Message-Id: <20230508045533.175575-9-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508045533.175575-1-faithilikerun@gmail.com>
References: <20230508045533.175575-1-faithilikerun@gmail.com>
MIME-Version: 1.0
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


