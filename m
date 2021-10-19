Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5032F433878
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:34:25 +0200 (CEST)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqC8-0000mQ-DR
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcptR-0008BI-Vl; Tue, 19 Oct 2021 10:15:06 -0400
Received: from mail-co1nam11on2075.outbound.protection.outlook.com
 ([40.107.220.75]:21600 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcptO-0007EQ-61; Tue, 19 Oct 2021 10:15:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dlbz/yaBmmW5USz5QbsCCsIadkYXXYKE0P8lCfN4DlUw0RO6q4OFaksLcYqyH3RcO6krII1xcRglmQPDnT/Agrp4I1jh5GQlkNsHu2he2VqmKhmDMPzmO5hIjFgyE2i8tJsYhJxEYKtUWDJ8zGFxHWfxk1n/fOi0GY/oIEiYTfHIO0MNMZSGbF4T45qsZkYBFos6uRkjt9X/GETsMTPInT/T9kVoxRishZJRvZjmgqFwk59brC87BV2h9r4r6Zv+8Nigg4q4mGkDL+hxYejyXNRa0fS9qa9KTjHDDs/xPNLZuy2rHq606ekSZlp9VtaXnpVFsvshL9EiZZQLalgfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozRr/sTyXyUoSPjDRF4tS64odxPhJdAWyjQLug0joak=;
 b=blAZ5sYPRIv9UuHbRjLFNF9QKoSNbxTdKSeZgBB7ZZaPkcrQipVVlsyoygEMdOwJP5cO7UraGT3mQKqppZSlIAy3nOoQjbNzvM1DS4sCI1gjUNSX3S7a/NocQ5d2L7JlTBSp60pwgxQoKyd/22AE9WzjA8RkArk6Y8f96Nyvp8mX90SMds7ZdDL1SvXQlMw86+x57C7GWzLkWetQpG28b6nslKegNfpAr6fSlCwrtb4jFGZXshvOS67tURHyW10MuH5XK/y16Ltsz3chqSXPzuZjkJIuYVsRLEAgXBqA2uLXxm/OpR0ttp7vDKWHEfQIadP7raqSE7ZabSt9MxyPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozRr/sTyXyUoSPjDRF4tS64odxPhJdAWyjQLug0joak=;
 b=Y3CA6UklsRLuqAAA8JDL+q8ZL6BLNoQHZH6eBX1KTcZ2UqCq39clQ2fIqRbK6R9FE7G3Ch1aj9K64IHJBVKM0wNYDprUmq7BV5IGy1r/wyeBiYF/8EoXWX8MhZvMTYGsSS70lshp4Nea6wAb8FzpflkP4a8Sp4Ya2O7A5n+wEzA=
Received: from DM5PR20CA0040.namprd20.prod.outlook.com (2603:10b6:3:13d::26)
 by MN2PR12MB3087.namprd12.prod.outlook.com (2603:10b6:208:d2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:14:58 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::5e) by DM5PR20CA0040.outlook.office365.com
 (2603:10b6:3:13d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:14:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:14:57 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:14:55 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>
Subject: [PATCH 00/64] Patch Round-up for stable 6.0.1, freeze on 2021-10-26
Date: Tue, 19 Oct 2021 09:08:40 -0500
Message-ID: <20211019140944.152419-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb6b1142-78d8-4de5-bfae-08d9930ad4e1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3087:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3087128154E627D0EDA377AA95BD9@MN2PR12MB3087.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZxFqWWA2bqbtFmKGAMQd+i4pgHVof72K6FXI2VAaN26T8y3RAKYZqs3soTJOtYLv0FmyR5WCMvtbe2XrATOyhBS7j5HNayGVvvroNf6G4ujD5lLV4ZFONrSakgI27gwxv4JwJOGX0Hq2zsX45iE19QvCIOoiIl9B7E9FH4+B6Hz2NZG8S9YFEaC1AHiqkzA/f9kYbYDlngWRZ114IzWXgr1mOjbs3CBzIU+alQ8SG/mBFgPpwVcPgQP9/FWbHIG5ZzrkqFXLhhNBEnAUml/Nz1Sael7+sxsvyrw+V9SJQTZbN7p/0m24sMs0iEfS7RRRKOpqWDUoS+tIKJ/eaqDP66LTqFTYVzJb41BeVIMG2jtGOHtqprQCuE9E+qYxPkEc+CmmuUU0IPoRBdwRMvN/d+LpsfU4N/XsDmsnA1zKFkdJWwSM+Ko4DCJqp1n0mR4UN5KGch3exX1SeVnDqWsX7f2JKyw2zUNYH6hPIsJn3KYHTUIQ1YTEqSIMlG+kw6iPZYM4A7s39Fq02CwNnsjboj7yUEijBNADbXCB9FER2jxufRzsSvaYbbWL2Bs+pV7yoPgxSDrCNMZ8tefgTM+bJXyfV7Ey/skJy3PrNKj3mQRonMLjVSisk+VJisFa+WKWZBMRueCGdb2kvHT5cIhe1R4PcReQtIlWtzFHUj1tRvtW+EfgNZ9zC3l7YIGrO/dp4Qqc/C1EhT0oKA5be7hh9u94LmjIVqCojrww1drylgHPzllpQzPXw4qXMU8cN1FN0mllm6WZcaP5aG/9eUUbfLRH+6QyiOEl2sXzmS+8gTtfi9Y1bHKWtDTH8fmXWZq
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(81166007)(2616005)(6666004)(356005)(47076005)(6916009)(4326008)(83380400001)(426003)(5660300002)(966005)(8676002)(508600001)(450100002)(36756003)(86362001)(16526019)(336012)(26005)(186003)(44832011)(36860700001)(1076003)(2906002)(70206006)(82310400003)(8936002)(316002)(70586007)(4001150100001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:14:57.9276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6b1142-78d8-4de5-bfae-08d9930ad4e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3087
Received-SPF: softfail client-ip=40.107.220.75;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Hi everyone,

The following new patches are queued for QEMU stable v6.0.1:

  https://gitlab.com/qemu-project/qemu/-/commits/stable-6.0-staging/

Patch freeze is 2021-10-26, and the release is planned for 2021-10-28:

  https://wiki.qemu.org/Planning/6.0

Please respond here or CC qemu-stable@nongnu.org on any additional patches
you think should (or shouldn't) be included in the release.

Thanks!

----------------------------------------------------------------
David Hildenbrand (2):
      virtio-balloon: don't start free page hinting if postcopy is possible
      virtio-mem-pci: Fix memory leak when creating MEMORY_DEVICE_SIZE_CHANGE event

Dr. David Alan Gilbert (1):
      audio: Never send migration section

Gerd Hoffmann (3):
      uas: add stream number sanity checks.
      usb/redir: avoid dynamic stack allocation (CVE-2021-3527)
      usb: limit combined packets to 1 MiB (CVE-2021-3527)

Giuseppe Musacchio (1):
      target/ppc: Fix load endianness for lxvwsx/lxvdsx

Gollu Appalanaidu (1):
      hw/block/nvme: align with existing style

Greg Kurz (1):
      docs/system: Document the removal of "compat" property for POWER CPUs

Igor Mammedov (3):
      tests: acpi: prepare for changing DSDT tables
      acpi: pc: revert back to v5.2 PCI slot enumeration
      tests: acpi: pc: update expected DSDT blobs

Jason Wang (2):
      vhost-vdpa: don't initialize backend_features
      virtio-net: fix use after unmap/free for sg

Kevin Wolf (1):
      hmp: Fix loadvm to resume the VM on success instead of failure

Klaus Jensen (2):
      hw/nvme: fix missing check for PMR capability
      hw/nvme: fix pin-based interrupt behavior (again)

Kunkun Jiang (1):
      vfio: Fix unregister SaveVMHandler in vfio_migration_finalize

Leonardo Bras (1):
      yank: Unregister function when using TLS migration

Li Qiang (7):
      vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info (CVE-2021-3545)
      vhost-user-gpu: fix resource leak in 'vg_resource_create_2d' (CVE-2021-3544)
      vhost-user-gpu: fix memory leak in vg_resource_attach_backing (CVE-2021-3544)
      vhost-user-gpu: fix memory leak while calling 'vg_resource_unref' (CVE-2021-3544)
      vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref' (CVE-2021-3544)
      vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing' (CVE-2021-3544)
      vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset' (CVE-2021-3546)

Li Zhijian (1):
      migration/rdma: Fix cm_event used before being initialized

Marcel Apfelbaum (3):
      hw/rdma: Fix possible mremap overflow in the pvrdma device (CVE-2021-3582)
      pvrdma: Ensure correct input on ring init (CVE-2021-3607)
      pvrdma: Fix the ring init error flow (CVE-2021-3608)

Mark Cave-Ayland (2):
      esp: only assert INTR_DC interrupt flag if selection fails
      esp: only set ESP_RSEQ at the start of the select sequence

Markus Armbruster (1):
      hmp: Unbreak "change vnc"

Max Filippov (1):
      target/xtensa: fix access ring in l32ex

Nir Soffer (1):
      qemu-nbd: Change default cache mode to writeback

Paolo Bonzini (7):
      vl: allow not specifying size in -m when using -M memory-backend
      qemu-option: support accept-any QemuOptsList in qemu_opts_absorb_qdict
      qemu-config: load modules when instantiating option groups
      qemu-config: parse configuration files to a QDict
      vl: plumb keyval-based options into -readconfig
      vl: plug -object back into -readconfig
      configure: fix detection of gdbus-codegen

Pavel Pisa (1):
      hw/net/can: sja1000 fix buff2frame_bas and buff2frame_pel when dlc is out of std CAN 8 bytes

Peng Liang (1):
      runstate: Initialize Error * to NULL

Peter Maydell (1):
      target/arm: Don't skip M-profile reset entirely in user mode

Philippe Mathieu-Daudé (11):
      hw/pci-host/q35: Ignore write of reserved PCIEXBAR LENGTH field
      block/nvme: Fix VFIO_MAP_DMA failed: No space left on device
      crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() helper
      block/nbd: Use qcrypto_tls_creds_check_endpoint()
      qemu-nbd: Use qcrypto_tls_creds_check_endpoint()
      chardev/socket: Use qcrypto_tls_creds_check_endpoint()
      migration/tls: Use qcrypto_tls_creds_check_endpoint()
      ui/vnc: Use qcrypto_tls_creds_check_endpoint()
      crypto: Make QCryptoTLSCreds* structures private
      hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT
      hw/sd/sdcard: Fix assertion accessing out-of-range addresses with CMD30

Richard Henderson (4):
      linux-user/aarch64: Enable hwcap for RND, BTI, and MTE
      target/i386: Exit tb after wrmsr
      tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
      tcg: Allocate sufficient storage in temp_allocate_frame

Stefan Hajnoczi (1):
      sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog

Stefan Reiter (1):
      monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB

Zenghui Yu (1):
      multi-process: Initialize variables declared with g_auto*

Zhenzhong Duan (1):
      vl: Fix an assert failure in error path

 audio/audio.c                           |  10 +++
 block/nbd.c                             |   6 +-
 block/nvme.c                            |  22 ++++++
 blockdev-nbd.c                          |   6 +-
 chardev/char-socket.c                   |  18 ++---
 configure                               |   4 +-
 contrib/vhost-user-gpu/vhost-user-gpu.c |   7 ++
 contrib/vhost-user-gpu/virgl.c          |  17 ++++-
 crypto/tls-cipher-suites.c              |   7 ++
 crypto/tlscreds.c                       |  12 +++
 crypto/tlscredsanon.c                   |   2 +
 crypto/tlscredspriv.h                   |  45 +++++++++++
 crypto/tlscredspsk.c                    |   2 +
 crypto/tlscredsx509.c                   |   1 +
 crypto/tlssession.c                     |   1 +
 docs/system/removed-features.rst        |   6 ++
 docs/tools/qemu-nbd.rst                 |   6 +-
 hw/block/nvme-ns.c                      |   2 +-
 hw/block/nvme.c                         |  89 ++++++++++++++--------
 hw/block/nvme.h                         |   1 +
 hw/i386/acpi-build.c                    |   9 ++-
 hw/net/can/can_sja1000.c                |   8 ++
 hw/net/virtio-net.c                     |  39 ++++++++--
 hw/pci-host/q35.c                       |   3 +
 hw/rdma/vmw/pvrdma_cmd.c                |   7 ++
 hw/rdma/vmw/pvrdma_dev_ring.c           |   2 +-
 hw/rdma/vmw/pvrdma_main.c               |   5 ++
 hw/remote/memory.c                      |   5 +-
 hw/remote/proxy.c                       |   3 +-
 hw/scsi/esp.c                           |  13 +++-
 hw/sd/sd.c                              |   9 ++-
 hw/usb/combined-packet.c                |   4 +-
 hw/usb/dev-uas.c                        |  11 +++
 hw/usb/redirect.c                       |   6 +-
 hw/vfio/migration.c                     |   1 +
 hw/virtio/vhost-vdpa.c                  |   3 -
 hw/virtio/virtio-balloon.c              |  13 ++++
 hw/virtio/virtio-mem-pci.c              |   7 +-
 include/block/nvme.h                    |  10 +--
 include/block/qdict.h                   |   2 -
 include/crypto/tls-cipher-suites.h      |   6 --
 include/crypto/tlscreds.h               |  30 ++++----
 include/crypto/tlscredsanon.h           |  12 ---
 include/crypto/tlscredspsk.h            |  12 ---
 include/crypto/tlscredsx509.h           |  10 ---
 include/qapi/qmp/qdict.h                |   3 +
 include/qemu/config-file.h              |   7 +-
 linux-user/elfload.c                    |  13 ++++
 migration/channel.c                     |  26 ++++---
 migration/multifd.c                     |   3 +-
 migration/qemu-file-channel.c           |   4 +-
 migration/rdma.c                        |   1 -
 migration/tls.c                         |   6 +-
 monitor/hmp-cmds.c                      |   4 +-
 monitor/qmp.c                           |  40 +++++-----
 qemu-nbd.c                              |  25 +++---
 softmmu/runstate.c                      |   2 +-
 softmmu/vl.c                            | 130 +++++++++++++++++++++++---------
 stubs/meson.build                       |   1 +
 stubs/module-opts.c                     |   6 ++
 target/arm/cpu.c                        |  19 +++++
 target/i386/tcg/translate.c             |   2 +
 target/ppc/translate/vsx-impl.c.inc     |   4 +-
 target/xtensa/translate.c               |   2 +-
 tcg/sparc/tcg-target.c.inc              |  16 ++--
 tcg/tcg.c                               |  40 +++++++---
 tests/data/acpi/pc/DSDT                 | Bin 6002 -> 6002 bytes
 tests/data/acpi/pc/DSDT.acpihmat        | Bin 7327 -> 7327 bytes
 tests/data/acpi/pc/DSDT.bridge          | Bin 8668 -> 8668 bytes
 tests/data/acpi/pc/DSDT.cphp            | Bin 6466 -> 6466 bytes
 tests/data/acpi/pc/DSDT.dimmpxm         | Bin 7656 -> 7656 bytes
 tests/data/acpi/pc/DSDT.hpbridge        | Bin 5969 -> 5969 bytes
 tests/data/acpi/pc/DSDT.ipmikcs         | Bin 6074 -> 6074 bytes
 tests/data/acpi/pc/DSDT.memhp           | Bin 7361 -> 7361 bytes
 tests/data/acpi/pc/DSDT.nohpet          | Bin 5860 -> 5860 bytes
 tests/data/acpi/pc/DSDT.numamem         | Bin 6008 -> 6008 bytes
 ui/vnc.c                                |   7 +-
 util/qemu-config.c                      |  99 ++++++++++++++++--------
 util/qemu-option.c                      |   3 +-
 util/qemu-sockets.c                     |  29 +++++--
 80 files changed, 685 insertions(+), 301 deletions(-)
 create mode 100644 stubs/module-opts.c



