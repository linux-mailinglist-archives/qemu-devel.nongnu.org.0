Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACF43F3B6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 02:09:40 +0200 (CEST)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgFSl-0000zb-1e
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 20:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mgFPA-0008OL-2P; Thu, 28 Oct 2021 20:05:59 -0400
Received: from mail-dm6nam12on2049.outbound.protection.outlook.com
 ([40.107.243.49]:37152 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mgFP4-0007x6-Ut; Thu, 28 Oct 2021 20:05:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6Rk5h3LxSo2LSWQd/LqhtcljmNxjPdCFH/bdQfgtbq9+b0vl5uJ/yGDaq/F+W48/ibMTEIZk6X7UfWdvSFMp58TBalsSbbmXeVEEk4cNhavUxc0NM6LecBTEPU6O+RVw1hGggmCewc2LeSEto+NGN3aoKcNy2QGCJjYz29ney1VuJU9vLl8PK6NCKr6+eTyyVwRHVDcdsVhuKOQZ2jL3RwXF8lbJcPWvubbZU8g7aCztAXYq6vj342XhYChJAIHJr5CZrzBSn2GW0xrty7z7vGNNjf7oKUExZbDNeCddk73k+HlECI6OvujuwXh6M7DCDshZiYQoAfqjxpG8I/sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/+oHsLwqYZBYQ17ak9HtzsNkIkAlIaVY5OfvFBvvaE=;
 b=ftARePEq4itAxpb6E3PTRnpSH127db8WVes5OuymhteugcjeM6Nadgw+ebtJa5WEZA+mvwqw7jZzo4qnSpLQMCY5S+Ju3cUl/f4c5GIUgEdRMSinyuZIk8n+HDS+eck+z60JgToFfaDaxBIV/9q2AAv8VuIhNGzIhRcuxO8s01jNzNWYdgHYmw5950OH/UuCjfUb7I16A1l77DXFcdLrNb6vPI7wXz5YMojq3EFNnC2rybZifZR+fSrtjTwUlhMgluQ1xBgoN3V5R54IgLJFo6VI84qPplgORY4jBaA7UJAftV51gM3eFhMkpmfs84YJULmAxJ+2u9DtzwX6DxFDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/+oHsLwqYZBYQ17ak9HtzsNkIkAlIaVY5OfvFBvvaE=;
 b=eQkoP1/vhG9JOEYhDOZmNqpwdNJhpmDONCc7Nax9yATw2PZgZXnrWqZF6i4JCAhvSSBUcx3urBplCV7k9uftRSa9RA4zsmK6YtoWnCPaGPIPyMhjpXT7fPEHwsLJ2aAJOAWWfzSs7Zoa5i0EfBPqYyfK5cNVx+g6RWbD73EiAqA=
Received: from DM3PR03CA0016.namprd03.prod.outlook.com (2603:10b6:0:50::26) by
 BYAPR12MB2632.namprd12.prod.outlook.com (2603:10b6:a03:6c::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Fri, 29 Oct 2021 00:05:46 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::c) by DM3PR03CA0016.outlook.office365.com
 (2603:10b6:0:50::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Fri, 29 Oct 2021 00:05:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 00:05:45 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Thu, 28 Oct
 2021 19:05:44 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.0.1 Stable released
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>
Date: Thu, 28 Oct 2021 19:05:26 -0500
Message-ID: <163546592688.142643.8435881866490327810@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abf35fbc-27b5-416f-4eba-08d99a6fdb1e
X-MS-TrafficTypeDiagnostic: BYAPR12MB2632:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2632F9C0C163062E827F69DA95879@BYAPR12MB2632.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JjFPwxM1pfzqbMLjZQyAfz8FT27R9LVoFxyF37hyQLKheXyvSXMVz5z8gaBW+YAW6XkIDSRJ8EjtnG8/LN8rC9XazsiOcJQgngPvtdhXI5HBlUniaoxwZXObwvZXEAtla5UzlEaYwnpqu9kJRA2HIcK6DYYAftmsiNmJReO1AhjKBJhr058CtmZEon6PR3gXocWFouhlzwCc6m4anks8yMld13KnK0bsdN+s3WUukrOgAxghviyUFpY4ewHSmLU3POZp1wGLRyyXASlhb7cZ16LaexUrQWI1O6Yomomk8/CdfoWlVUa0OrgXggU3UujV19X+S5eWuthN19GutAn3+OSRrbM3MSlnlkrLdkhqk0iQefZd1ccdpUr2/5/dHJFOiJPdsWASRs90/Kpz90hcydVwDYPjNCiGgD9ylvtf+6un64dbziSaMUQQvd/5ULUJAeWM6Kvf5JYBL8Fe9pdmMSRDbU0CmdkTbgp/4gJweYZWV/1DrAfZrh7DUaQUPil18g1lCOQ7HQMK85w9thf+g3RAn/tMnwfS+9/uSVRT6CeNvrPkllopLQBTnEtlLhrWJeGH2erUmy72bIuH9sWVLsYndBsRhGKuiRApd4wmKhjmbCEgTdC90JSEK3PStyNpCf5QhDA/FfmQOGPsy8K1jEXbZACTsXfzJqAOxIp1snKuMADadq06kOAq89C7JhX2CrYyWJRNj1qf2RF3wb61r1NY08WTYXtNYIZ/hgYuxn5uIi0k+lI0CxJveC3HTkEWPmcy8MXfPogpAQkVCV5CF/zmKFwnt1VCV0rpiC7F7cQCob6HhWUsxEwDVudA1C/4
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(4326008)(450100002)(2906002)(186003)(86362001)(70206006)(82310400003)(83380400001)(70586007)(5660300002)(36860700001)(6916009)(44832011)(81166007)(47076005)(16526019)(316002)(356005)(36756003)(8676002)(2616005)(336012)(26005)(508600001)(6666004)(426003)(8936002)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 00:05:45.6820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abf35fbc-27b5-416f-4eba-08d99a6fdb1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2632
Received-SPF: softfail client-ip=40.107.243.49;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

I am pleased to announce that the QEMU v6.0.1 stable release is now
available.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

v6.0.1 is now tagged in the official qemu.git repository, and the
stable-6.0 branch has been updated accordingly:

  https://git.qemu.org/?p=3Dqemu.git;a=3Dshortlog;h=3Drefs/heads/stable-6.0

This update contains general fixes for various architectures/subsystems,
including the following CVE fixes:

    MPTSAS (CVE-2021-3392)
    RDMA (CVE-2021-3582, CVE-2021-3607, CVE-2021-3608)
    USB/UAS (CVE-2021-3527, CVE-2021-3713)
    vhost-user-gpu (CVE-2021-3544, CVE-2021-3545, CVE-2021-3546)
    virtio-net (CVE-2021-3748)

Please see the changelog for additional details and update accordingly.

Thank you to everyone involved!

CHANGELOG:

9654e55a74: Update version for 6.0.1 release (Michael Roth)
db882c5c18: Partially revert "build: -no-pie is no functional linker flag" =
(Jessica Clarke)
62a012b0f4: hw/display/artist: Fix bug in coordinate extraction in artist_v=
ram_read() and artist_vram_write() (Helge Deller)
487a0956a1: libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr (D=
avid Hildenbrand)
c18bc855ad: vhost-user: fix duplicated notifier MR init (Xueming Li)
27c6f20d9d: pvrdma: Fix the ring init error flow (CVE-2021-3608) (Marcel Ap=
felbaum)
46d3c9e9f5: pvrdma: Ensure correct input on ring init (CVE-2021-3607) (Marc=
el Apfelbaum)
d25db58213: hw/rdma: Fix possible mremap overflow in the pvrdma device (CVE=
-2021-3582) (Marcel Apfelbaum)
4787501893: vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset' (CVE-20=
21-3546) (Li Qiang)
07daff4a9a: vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backi=
ng' (CVE-2021-3544) (Li Qiang)
4dda63d7ed: vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref' (=
CVE-2021-3544) (Li Qiang)
457053998d: vhost-user-gpu: fix memory leak while calling 'vg_resource_unre=
f' (CVE-2021-3544) (Li Qiang)
6ae68dfd10: vhost-user-gpu: fix memory leak in vg_resource_attach_backing (=
CVE-2021-3544) (Li Qiang)
c5300b8a94: vhost-user-gpu: fix resource leak in 'vg_resource_create_2d' (C=
VE-2021-3544) (Li Qiang)
168299eb7d: vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_i=
nfo (CVE-2021-3545) (Li Qiang)
e204dca909: usb: limit combined packets to 1 MiB (CVE-2021-3527) (Gerd Hoff=
mann)
606f618b3c: usb/redir: avoid dynamic stack allocation (CVE-2021-3527) (Gerd=
 Hoffmann)
36403e8788: uas: add stream number sanity checks. (Gerd Hoffmann)
5a964fe8d9: virtio-mem-pci: Fix memory leak when creating MEMORY_DEVICE_SIZ=
E_CHANGE event (David Hildenbrand)
f22c225e23: hmp: Unbreak "change vnc" (Markus Armbruster)
916372e48f: qemu-nbd: Change default cache mode to writeback (Nir Soffer)
5881d76ff4: virtio-net: fix use after unmap/free for sg (Jason Wang)
2ae61d81a5: target/arm: Don't skip M-profile reset entirely in user mode (P=
eter Maydell)
4fca33b4be: audio: Never send migration section (Dr. David Alan Gilbert)
978c11b013: hw/sd/sdcard: Fix assertion accessing out-of-range addresses wi=
th CMD30 (Philippe Mathieu-Daud=C3=A9)
21611dd0a5: hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PR=
OT (Philippe Mathieu-Daud=C3=A9)
4d3cfb2f6b: hw/net/can: sja1000 fix buff2frame_bas and buff2frame_pel when =
dlc is out of std CAN 8 bytes (Pavel Pisa)
7999d5b12f: virtio-balloon: don't start free page hinting if postcopy is po=
ssible (David Hildenbrand)
6576f6ab87: hw/nvme: fix pin-based interrupt behavior (again) (Klaus Jensen)
bef905cd8a: hw/nvme: fix missing check for PMR capability (Klaus Jensen)
aa99651295: hw/block/nvme: align with existing style (Gollu Appalanaidu)
765ed56e76: tests: acpi: pc: update expected DSDT blobs (Igor Mammedov)
b989641145: acpi: pc: revert back to v5.2 PCI slot enumeration (Igor Mammed=
ov)
e23fe27ed9: tests: acpi: prepare for changing DSDT tables (Igor Mammedov)
22de6752c1: yank: Unregister function when using TLS migration (Leonardo Br=
as)
747fd3cb13: crypto: Make QCryptoTLSCreds* structures private (Philippe Math=
ieu-Daud=C3=A9)
43844c2fb2: ui/vnc: Use qcrypto_tls_creds_check_endpoint() (Philippe Mathie=
u-Daud=C3=A9)
a1c966bdf4: migration/tls: Use qcrypto_tls_creds_check_endpoint() (Philippe=
 Mathieu-Daud=C3=A9)
0a7e2c99f9: chardev/socket: Use qcrypto_tls_creds_check_endpoint() (Philipp=
e Mathieu-Daud=C3=A9)
8d5c255a25: qemu-nbd: Use qcrypto_tls_creds_check_endpoint() (Philippe Math=
ieu-Daud=C3=A9)
738ff4bf07: block/nbd: Use qcrypto_tls_creds_check_endpoint() (Philippe Mat=
hieu-Daud=C3=A9)
7e84d58e8b: crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() h=
elper (Philippe Mathieu-Daud=C3=A9)
072a8d3693: block/nvme: Fix VFIO_MAP_DMA failed: No space left on device (P=
hilippe Mathieu-Daud=C3=A9)
0a579d4389: hw/pci-host/q35: Ignore write of reserved PCIEXBAR LENGTH field=
 (Philippe Mathieu-Daud=C3=A9)
059ad82f38: tcg: Allocate sufficient storage in temp_allocate_frame (Richar=
d Henderson)
1a0a1c4964: tcg/sparc: Fix temp_allocate_frame vs sparc stack bias (Richard=
 Henderson)
cdb8a71e2e: vl: Fix an assert failure in error path (Zhenzhong Duan)
5b55370e28: vfio: Fix unregister SaveVMHandler in vfio_migration_finalize (=
Kunkun Jiang)
d1000ee07b: runstate: Initialize Error * to NULL (Peng Liang)
b6f5c02f5f: esp: only set ESP_RSEQ at the start of the select sequence (Mar=
k Cave-Ayland)
44e5878ce3: esp: only assert INTR_DC interrupt flag if selection fails (Mar=
k Cave-Ayland)
8d719825d9: vhost-vdpa: don't initialize backend_features (Jason Wang)
ad8c49081a: configure: fix detection of gdbus-codegen (Paolo Bonzini)
fcfe1509a1: hmp: Fix loadvm to resume the VM on success instead of failure =
(Kevin Wolf)
9b0ee423a1: sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog (Stefa=
n Hajnoczi)
5b96b36a61: vl: plug -object back into -readconfig (Paolo Bonzini)
c675ba821c: vl: plumb keyval-based options into -readconfig (Paolo Bonzini)
203f0ba144: qemu-config: parse configuration files to a QDict (Paolo Bonzin=
i)
701ff59cc4: qemu-config: load modules when instantiating option groups (Pao=
lo Bonzini)
4e1eef8611: qemu-option: support accept-any QemuOptsList in qemu_opts_absor=
b_qdict (Paolo Bonzini)
ab33188125: target/xtensa: fix access ring in l32ex (Max Filippov)
b20eff3ba4: vl: allow not specifying size in -m when using -M memory-backen=
d (Paolo Bonzini)
59ac5e6d61: target/ppc: Fix load endianness for lxvwsx/lxvdsx (Giuseppe Mus=
acchio)
e2258e5279: target/i386: Exit tb after wrmsr (Richard Henderson)
fdf58b451b: migration/rdma: Fix cm_event used before being initialized (Li =
Zhijian)
318b076356: monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB (Stefan R=
eiter)
c1d1c0b4c3: docs/system: Document the removal of "compat" property for POWE=
R CPUs (Greg Kurz)
5d0c78455e: linux-user/aarch64: Enable hwcap for RND, BTI, and MTE (Richard=
 Henderson)
1513997aa2: multi-process: Initialize variables declared with g_auto* (Zeng=
hui Yu)

