Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A145E58A811
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:32:26 +0200 (CEST)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJskr-0006Da-5F
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsEG-0003nn-1Z; Fri, 05 Aug 2022 03:58:44 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsEE-0001zk-6u; Fri, 05 Aug 2022 03:58:43 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso7539526pjf.5; 
 Fri, 05 Aug 2022 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=y37nrXKQuzvNQncPc/5KLvokW86ReypQKlztAtxsyvs=;
 b=l+zKIWq5O0/N4rmUVb/VL5vcJPAFBMzkT4gcRmJ0nTQiM5ytQwytpsjmAlUc6algLr
 /JypLxXAg+vCzjiQEEEg5oh1G2YCJB1s//rKal62YEZY4Qa290xsOjTYfeLK/93QA2EG
 xbgsHl88B3N0iwKos27PIatDXU/zlHYgNB6DTDZEmNzvbXbq1TjNjoZ2xDrAqontsUtF
 iYfGluOn+/CFPUwuTpj++DXax1WY6kafGtB/vFQ6bKbO9labOnvapK2ixz98n85kN/2u
 Qw4B7+DxC9qY7bQNizAEEHdMYng/EGrHMA+TtPGzAdomKN1NH9w91VQK7NsLc/3H65vg
 swcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=y37nrXKQuzvNQncPc/5KLvokW86ReypQKlztAtxsyvs=;
 b=s0oyuzp87SNzNUrOluyQqm7nJeUTFMa/i7k8hT4Vg1xohFjAQ1MvfnrJyCK/7BQN31
 CbKbLU3dqRSt9hQi+fJsihjQubq3Fw1FqF+VVFN8VCh6n0ydpXptHuHwldnvuC6oagkc
 rfr7aLAQTG7O7l3CiXqCVRCVKk4rSL4cISipZdhu8RQRmhGSsl4n3JCx09gYoP14n6SS
 I1eXYOPflsGNyoTmUk3/8ZzUntBYbCK8NUd92Rc4Q4i6gJQNYMj+ICxOAW3hLCJ9iTQU
 TsBjOa4q6gOBpd/MyP43l8JelQzSxLXusxtVZnp7IEQBbtZjo6miOx1OJ73ZmUym50DZ
 Un2A==
X-Gm-Message-State: ACgBeo31T/YpNPrDzg4YUs+ZwsMXuPGT6Bt/OMpdLD7ozQUP8MN6/wRv
 tmu/ZSTyj73EmE37IZS8Wk3JifoKVHvVPQ==
X-Google-Smtp-Source: AA6agR7aSZT5IX0ReFc2sDTh4eZsm0Rzv4bMqhpSauXFwmXtviOASKAN7V53zlLXVWUgkEOkyrlQTg==
X-Received: by 2002:a17:90b:3144:b0:1f5:829e:cd49 with SMTP id
 ip4-20020a17090b314400b001f5829ecd49mr3634814pjb.80.1659686320404; 
 Fri, 05 Aug 2022 00:58:40 -0700 (PDT)
Received: from roots.. ([106.84.130.246]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0016ee708350bsm2418564plg.14.2022.08.05.00.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:58:40 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hare@suse.de, Stefan Hajnoczi <stefanha@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 8/8] docs/zoned-storage: add zoned device documentation
Date: Fri,  5 Aug 2022 15:57:51 +0800
Message-Id: <20220805075751.77499-9-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805075751.77499-1-faithilikerun@gmail.com>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102f.google.com
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
 docs/devel/zoned-storage.rst           | 41 ++++++++++++++++++++++++++
 docs/system/qemu-block-drivers.rst.inc |  6 ++++
 2 files changed, 47 insertions(+)
 create mode 100644 docs/devel/zoned-storage.rst

diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
new file mode 100644
index 0000000000..c3f1e477ac
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
+The block device information is resided inside BlockDriverState. QEMU uses
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


