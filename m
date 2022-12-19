Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3A365091E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:10:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7C9N-0002nC-OM; Mon, 19 Dec 2022 04:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7C94-0002lB-Lx; Mon, 19 Dec 2022 04:09:14 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7C8x-00039p-Np; Mon, 19 Dec 2022 04:09:09 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso13387618pjb.1; 
 Mon, 19 Dec 2022 01:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Zq3UkSSAPV+9OTs6RiJJEH+JGX14vLpJWQ/edJzAZQ=;
 b=HWcldaeSzS6DeYaaWU+6lzROdAgu+HLvpS0GecnykNq/o9Oc/83vLQQKtC75O9jJdQ
 HCdxA9g4jkIqaVBKoaw3YFWC/p7ZmA3ETVvcTcxU2yjY+5z28/6nz4hXrwS4spkh4GNK
 7HpR+FJCWk8c8N+i5MnaYEpG21o+2SUiO59ssJ0ELCQF80+Yf8I4L9tY9dSHhL9OeMHN
 UJIY1WM4GoQndhsLP6BLag+UZS6aB9nEv3SH91Z9FvvO2eKMe+/FzvS4psz5gamGQXgZ
 S9PAzhZEz8DLRxwrx4ifpR0NJuyZUsJpUCVUaTOGQl+vqydClnkd11NWHwuqoIxXWYNj
 0sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Zq3UkSSAPV+9OTs6RiJJEH+JGX14vLpJWQ/edJzAZQ=;
 b=0dAdnL4UXIwpCkf512fozCCItpcPmY4gDlQa5mIc9QE2qF20RiHCSLSW0Jyr8MDsvV
 1gzsZkon5lBs94oSIXYkv5Wm4v+TJLH4RLvlbKlUOOVPLObVSR38W72wDUCi0jMIVtsf
 SSH7oUMBmAPF8jIi+zRjZ4HpwJX3v1PTceT/LoUcH0Mvk/ODH9TFoPxMmK1tuBfEBw4O
 PRL0OT10cCpv10e5pPvfvogNUw/VfP/M0XvTXXv5DFaP9ISC7YgSz3ARP1M5Vv7EqsVS
 SqILuHFcaEPkiBWnjOmhrb4erYd3+27NezKdKL7+rUsLCSnwwv755TzsBVFzBJdazm7u
 1bVA==
X-Gm-Message-State: AFqh2kq9n+E63BAbt0yXBpcL0u7hPN8HqGxXjTU/cMQaAxlZC6w9wMnb
 YXBLQv4xsyAoQ1HlYyU7WEH6fFSe1DfOhaeq
X-Google-Smtp-Source: AMrXdXsMWO4BtntrvMX7tbvkDO19AtSCxX+28lV4yHQ4J/0nfF/w0wRlW/5iZvpkaYRVJat0a2wsfQ==
X-Received: by 2002:a17:90b:4b0a:b0:223:4785:1458 with SMTP id
 lx10-20020a17090b4b0a00b0022347851458mr16778455pjb.45.1671440945059; 
 Mon, 19 Dec 2022 01:09:05 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b002187a4dd830sm8658487pjb.46.2022.12.19.01.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 01:09:04 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, hare@suse.de,
 Eric Blake <eblake@redhat.com>, dmitry.fomichev@wdc.com,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [RFC 1/2] block: add configs for the zoned format driver
Date: Mon, 19 Dec 2022 17:08:39 +0800
Message-Id: <20221219090840.20388-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219090840.20388-1-faithilikerun@gmail.com>
References: <20221219090840.20388-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102e.google.com
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

To configure a zoned format driver, it has following arguments:
device size, zoned model, zone size, number of conventional zones,
number of sequential zones, max append sectors, max open zones,
and max_active_zones.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/meson.build                |  1 +
 include/block/block_int-common.h |  7 +++++
 qapi/block-core.json             | 44 +++++++++++++++++++++++++++++---
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 90011a2805..ab83d0f644 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -44,6 +44,7 @@ block_ss.add(files(
   'vmdk.c',
   'vpc.c',
   'write-threshold.c',
+  'zoned.c',
 ), zstd, zlib, gnutls)
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 4ae595849e..be9f6e1c03 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -61,6 +61,13 @@
 #define BLOCK_OPT_DATA_FILE_RAW     "data_file_raw"
 #define BLOCK_OPT_COMPRESSION_TYPE  "compression_type"
 #define BLOCK_OPT_EXTL2             "extended_l2"
+#define BLOCK_OPT_Z_TYPE            "zoned"
+#define BLOCK_OPT_Z_ZSIZE           "zone_size"
+#define BLOCK_OPT_Z_NR_COV          "zone_nr_conv"
+#define BLOCK_OPT_Z_NR_SEQ          "zone_nr_seq"
+#define BLOCK_OPT_Z_MAS             "max_append_sectors"
+#define BLOCK_OPT_Z_MAZ             "max_active_zones"
+#define BLOCK_OPT_Z_MOZ             "max_open_zones"
 
 #define BLOCK_PROBE_BUF_SIZE        512
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index d86ad0907b..00d9164806 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -363,7 +363,7 @@
 #       0.14 this can be: 'blkdebug', 'bochs', 'cloop', 'cow', 'dmg',
 #       'file', 'file', 'ftp', 'ftps', 'host_cdrom', 'host_device',
 #       'http', 'https', 'luks', 'nbd', 'parallels', 'qcow',
-#       'qcow2', 'raw', 'vdi', 'vmdk', 'vpc', 'vvfat'
+#       'qcow2', 'raw', 'vdi', 'vmdk', 'vpc', 'vvfat', 'zoned'
 #       2.2: 'archipelago' added, 'cow' dropped
 #       2.3: 'host_floppy' deprecated
 #       2.5: 'host_floppy' dropped
@@ -2958,7 +2958,7 @@
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme',
             { 'name': 'nvme-io_uring', 'if': 'CONFIG_BLKIO' },
             'parallels', 'preallocate', 'qcow', 'qcow2', 'qed', 'quorum',
-            'raw', 'rbd',
+            'raw', 'rbd', 'zoned',
             { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
             'ssh', 'throttle', 'vdi', 'vhdx',
             { 'name': 'virtio-blk-vfio-pci', 'if': 'CONFIG_BLKIO' },
@@ -4227,6 +4227,20 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*offset': 'int', '*size': 'int' } }
 
+##
+# @BlockdevOptionsZoned:
+#
+# Driver specific block device options for the zoned driver.
+#
+# @offset: position where the block device starts
+# @size: the assumed size of the device
+#
+# Since: 2.9
+##
+{ 'struct': 'BlockdevOptionsZoned',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { '*offset': 'int', '*size': 'int'} }
+
 ##
 # @BlockdevOptionsThrottle:
 #
@@ -4419,6 +4433,7 @@
       'vmdk':       'BlockdevOptionsGenericCOWFormat',
       'vpc':        'BlockdevOptionsGenericFormat',
       'vvfat':      'BlockdevOptionsVVFAT',
+      'zoned':      'BlockdevOptionsZoned',
       'zoned_host_device': { 'type': 'BlockdevOptionsFile',
                              'if': 'CONFIG_BLKZONED' }
   } }
@@ -4980,6 +4995,28 @@
             '*subformat':           'BlockdevVpcSubformat',
             '*force-size':          'bool' } }
 
+##
+# @BlockdevCreateOptionsZoned:
+#
+# Driver specific image creation options for zoned device.
+#
+# @file: Node to create the image format on
+# @size: Size of the virtual disk in bytes
+#
+# Since: 7.2
+##
+{ 'struct': 'BlockdevCreateOptionsZoned',
+  'data': { 'file':                 'BlockdevRef',
+            'size':                 'size',
+            'zone-size':            'size',
+            'zoned':                'int',
+            'zone-nr-conv':           'int',
+            'zone-nr-seq':            'int',
+            'max-open-zones':         'int',
+            'max-active-zones':       'int',
+            'max-append-sectors':     'int'}}
+
+
 ##
 # @BlockdevCreateOptions:
 #
@@ -5007,7 +5044,8 @@
       'vdi':            'BlockdevCreateOptionsVdi',
       'vhdx':           'BlockdevCreateOptionsVhdx',
       'vmdk':           'BlockdevCreateOptionsVmdk',
-      'vpc':            'BlockdevCreateOptionsVpc'
+      'vpc':            'BlockdevCreateOptionsVpc',
+      'zoned':          'BlockdevCreateOptionsZoned'
   } }
 
 ##
-- 
2.38.1


