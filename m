Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F96B5B4447
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 07:35:18 +0200 (CEST)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWt9A-0000kH-QG
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 01:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt3V-0002xu-4o; Sat, 10 Sep 2022 01:29:25 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt3T-0004qS-0m; Sat, 10 Sep 2022 01:29:24 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f24so3649920plr.1;
 Fri, 09 Sep 2022 22:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BFPxl3nAGF1rBBCyjnFCSTHHYUfwTOepHasYOlesocs=;
 b=TxqlioPqylUedUAcHybaQxUM1WTbi3l7GuJJasambQ8FcEB/UfA6PKG0Ey8okeIVhA
 DqkAtcsmf12dQhDLtPCjd739Bu9fvQBLMWiMbSRSWEY3Vyr+5EJluFGCQDnFhxT/8JqO
 3GA5w2LUznXYRbKNhHulT6UP8t+inaesdK+xmg8GuMsUxrQb5zDMn6se2MsJ/DuXcHir
 wS2DZQmRJ93swu/z7mzUMa1XoZp0wlqY8BmyB+rZWjYAnYA/ZGuaPX5Q4nOL7xA9AC76
 rzI6F0PK1HAKREL3l5QpM/iKS2RzpwNHkyvsIP5kPJVKezSrPf8Xy4hZfKYjEpw7whZ0
 LGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BFPxl3nAGF1rBBCyjnFCSTHHYUfwTOepHasYOlesocs=;
 b=J2pwzQlYIlEgPVQbTD83TC9I/jfZF1IUfkLsZ/z5EGFVIAHSHdpW2pSMlWaleOg+fm
 74H4JMpHoulBZzD/bSpdTErqPqBegdl4O/HbI6aOzsXKkGIwV1k09upZgF8NvU2oWlcj
 Qkgv7kR2J2qCUMA0hW5uQyiwui4DF4LB0Fyqn6BS5UAS4ykIByxZiyg67UZTwlEhI03G
 yoQdAt9PIWguPie0qxnJrWN0d5K72K8ahKirdXCokxAvwSqG7qxSRtgm1hPUhHDbemIU
 4KNwo2700tNbX5WpXTmWtSfk6TIzyq6PN9YJHQc8aBRlGtsviCpq8GmaSuq/oC9Km9Ja
 6MyQ==
X-Gm-Message-State: ACgBeo0QtHlRAEcnERwJEo9S3DvObZcDWygtEvpumTMUVFiR8CcJuEH7
 QRr7BEcnDrfTrqvz1Oy3sZUPoWticaqaw1Cj
X-Google-Smtp-Source: AA6agR7iNHjln9Jjq5onrNpIBRerig6eOu0gS6cr34m73X4Zl0mR5Ph2XOFicXD1F550rXRG9PWD+A==
X-Received: by 2002:a17:902:f545:b0:178:12e5:9efa with SMTP id
 h5-20020a170902f54500b0017812e59efamr3875736plf.100.1662787760682; 
 Fri, 09 Sep 2022 22:29:20 -0700 (PDT)
Received: from roots.. ([183.221.93.83]) by smtp.gmail.com with ESMTPSA id
 y6-20020aa793c6000000b00540d75197e5sm731994pff.47.2022.09.09.22.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 22:29:20 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 7/7] docs/zoned-storage: add zoned device documentation
Date: Sat, 10 Sep 2022 13:27:59 +0800
Message-Id: <20220910052759.27517-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220910052759.27517-1-faithilikerun@gmail.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62a.google.com
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
2.37.3


