Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA03858625A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:44:20 +0200 (CEST)
Received: from localhost ([::1]:41428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKTj-00031q-Rb
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKKL-0004MR-QI; Sun, 31 Jul 2022 21:34:43 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKKJ-0000hJ-WE; Sun, 31 Jul 2022 21:34:37 -0400
Received: by mail-pf1-x434.google.com with SMTP id w185so9290484pfb.4;
 Sun, 31 Jul 2022 18:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=+Qqm7Xkah4rqyk9vUi8VDm/R3WQUM/ej4Fd0yJ5tItA=;
 b=XrezTm7MiJQZoAAZ6FOuchXs5Imt33Jh+u6MrrTwouUG7/pWf/x7PzR9Dn6eEOPFT9
 nm0o2z2FF7neQ1ecmEteGWyQLULby25fb2f/pzvgodYyOJWiunTd1M8vN3XDwLWJU1Vn
 4J4pwH0/Tgp47D2Bro5gOHOJP7eiqFuqV6QnkRyusAwvKY0ZdXUm0CiQr47TbGmtxVPd
 ijt66u4abIBR/s10s+4aZ4bRhMMYLbszY0mbwuMv1aWxX3O9Y3dMtRI52ZfLlBPNEAXW
 U+1UVJ6WNV9QeD2+9EqRrnBgdIsPfu9Q2mEkTXQTLNorrRqjtGAgJCP+vQf9JSnrl0XC
 cT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=+Qqm7Xkah4rqyk9vUi8VDm/R3WQUM/ej4Fd0yJ5tItA=;
 b=Hu7mYpdjiKM7egvQNsA9d4UcVRvxO9vAAz1YQKcfouZmc0yibHx7DxsRU17IsONhTA
 DLJmy0ieLYHUsRw9RlHGTo8tbHzC7Pqaegnt3mF0A220n2+yL6vpivHuub1IcS1oVbbE
 m9hZthJtbOXxUbWMz4rozfsUV4syH0kRhPFi/4Uo5LZbgXyQLNUR65Z2ZjiCFLE0hqjk
 HptiXEWQJV5xcgy0v+H9uM85pFjiZbyKcRSP7IQTNP7TxfOYYh8b1//N2LHibvxXVG74
 e40qJTsoXr+oE8hg+CzZ/BUh8INhSfIZE1k8B/zhHfTWR0B0pVb8yTF51mbhgaLGd8Fh
 HsHw==
X-Gm-Message-State: AJIora/HuIm9UKBIVgu8kTMdb1y40RdVQcaUoyBdzRq/WX6ZGuJp733i
 XlhxEUSb5obMsdq3oaZVlVgCm3VPQZG4sPy6
X-Google-Smtp-Source: AGRyM1ui8ImMHbQSI2eXcBwdM3OyEqxwdNPprGtCsEAU7ZFtVacvb+IQo4lZWMqxP+cmIFavxKhOrA==
X-Received: by 2002:a63:5653:0:b0:419:ffb6:3ec6 with SMTP id
 g19-20020a635653000000b00419ffb63ec6mr11477847pgm.149.1659317674145; 
 Sun, 31 Jul 2022 18:34:34 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 w196-20020a6282cd000000b0052d689fabbasm1183236pfd.121.2022.07.31.18.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:34:33 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 11/11] docs/zoned-storage: add zoned device documentation
Date: Mon,  1 Aug 2022 09:34:27 +0800
Message-Id: <20220801013427.10811-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x434.google.com
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
---
 docs/devel/zoned-storage.rst           | 68 ++++++++++++++++++++++++++
 docs/system/qemu-block-drivers.rst.inc |  6 +++
 2 files changed, 74 insertions(+)
 create mode 100644 docs/devel/zoned-storage.rst

diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
new file mode 100644
index 0000000000..e62927dceb
--- /dev/null
+++ b/docs/devel/zoned-storage.rst
@@ -0,0 +1,68 @@
+=============
+zoned-storage
+=============
+
+Zoned Block Devices (ZBDs) devide the LBA space to block regions called zones
+that are larger than the LBA size. It can only allow sequential writes, which
+reduces write amplification in SSD, leading to higher throughput and increased
+capacity. More details about ZBDs can be found at:
+
+https://zonedstorage.io/docs/introduction/zoned-storage
+
+zone emulation
+--------------
+In its current status, the virtio-blk device is not aware of ZBDs but the guest
+sees host-managed drives as regular drive that will runs correctly under the
+most common write workloads.
+
+The zoned device support aims to let guests (virtual machines) access zoned
+storage devices on the host (hypervisor) through a virtio-blk device. This
+involves extending QEMU's block layer and virtio-blk emulation code.
+
+If the host supports zoned block devices, it can set VIRTIO_BLK_F_ZONED. Then
+in the guest side, it appears following situations:
+1) If the guest virtio-blk driver sees the VIRTIO_BLK_F_ZONED bit set, then it
+will assume that the zoned characteristics fields of the config space are valid.
+2) If the guest virtio-blk driver sees a zoned model that is NONE, then it is
+known that is a regular block device.
+3) If the guest virtio-blk driver sees a zoned model that is HM(or HA), then it
+is known that is a zoned block device and probes the other zone fields.
+
+On QEMU sides,
+1) The DEFINE PROP BIT macro must be used to declare that the host supports
+zones.
+2) BlockDrivers can declare zoned device support once known the zoned model
+for the block device is not NONE.
+
+zoned storage APIs
+------------------
+
+Zone emulation part extends the block layer APIs and virtio-blk emulation section
+with the minimum set of zoned commands that are necessary to support zoned
+devices. The commands are - Report Zones, four zone operations and Zone Append
+(developing).
+
+testing
+-------
+
+It can be tested on a null_blk device using qemu-io, qemu-iotests or blkzone(8)
+command in the guest os.
+
+1. For example, the command line for zone report using qemu-io is:
+
+$ path/to/qemu-io --image-opts driver=zoned_host_device,filename=/dev/nullb0 -c
+"zrp offset nr_zones"
+
+To enable zoned device in the guest os, the guest kernel must have the virtio-blk
+driver with ZBDs support. The link to such patches for the kernel is:
+
+https://github.com/dmitry-fomichev/virtblk-zbd
+
+Then, add the following options to the QEMU command line:
+-blockdev node-name=drive0,driver=zoned_host_device,filename=/dev/nullb0
+
+After the guest os booting, use blkzone(8) to test zone operations:
+blkzone report -o offset -c nr_zones /dev/vda
+
+2. We can also use the qemu-iotests in ./tests/qemu-iotests/tests/zoned.sh.
+
diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index dfe5d2293d..2a761a4b80 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -430,6 +430,12 @@ Hard disks
   you may corrupt your host data (use the ``-snapshot`` command
   line option or modify the device permissions accordingly).
 
+Zoned block devices
+  Zoned block devices can passed through to the guest if the emulated storage
+  controller supports zoned storage. Use ``--blockdev zoned_host_device,
+  node-name=drive0,filename=/dev/nullb0`` to pass through ``/dev/nullb0``
+  as ``drive0``.
+
 Windows
 ^^^^^^^
 
-- 
2.37.1


