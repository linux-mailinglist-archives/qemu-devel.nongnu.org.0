Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30B76CCF2D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 03:02:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phKBh-0000Ub-VM; Tue, 28 Mar 2023 21:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1phKBf-0000U1-O9
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 21:01:15 -0400
Received: from mail-mw2nam12on2076.outbound.protection.outlook.com
 ([40.107.244.76] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1phKBb-0005e1-F9
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 21:01:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nr3VsLYU6CWXXyu5+AN/XDoLrAqu/j79990YrFtOEBIC2UF4Gp/ogzXHslycY3ZvjpE3/WaBHfi8Zavlj6suxjCbS654eZI7mgcpp+QrWPOIVpYuUJ4nHnrpkBzC5CvXq2LKYrzh8DZMDI0s41lSxc9AUFrOeRiseUEn43dwH/j0dtqHiUp6VGPXHrKZU64hA43h657IlbcwovGyRif7SlAIJSmokS/YLR5rMHplq8zhULQaAh4qt7ofysIzczkuoibD8HIHgNwcp8ulwrOFNBRlHbnhT9zpNArIUblTG+iLy/32vtD+XgBU4ifusOYaTVBaa/ZiGiJwDfBRj/V9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlF60AgL1OwVeO9usEXjULIj+l4EvjKy6GRJkcyg7nQ=;
 b=FTy+hzTc+odUUBD/zZ6LSGbSWyE2eHTm5M8r6QUE0Nr/3OmF0fp4heoKBlIO6bl95jJJucA86xVFz7rPw2sOxJB/VYDE1I9FS/KevV2ZRZ30ZDrb0t0wI6Sa0DN1LxPgiELzADaTHIQSo/fEMc4jSwoMcKIOD9Gjnr+kXZ9kbQx0ZnRwqVMP5SdR81R4Jvq+lUtHGxnsEwp8N7jwexNo1oV+Vdlt32Uw8TrUOVJ9VHB+4UwLeMBzj7LOo85DysqbPltlp2XECo27hBdbIKhQK1qIRrmZyJO8PKdIdvZmbFzeor5cxoCchJK/P+tlWHvuKsyYRaWd3AxfeUMFJ7n53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlF60AgL1OwVeO9usEXjULIj+l4EvjKy6GRJkcyg7nQ=;
 b=mc1p0KmRIGmCiSgn1eTa/P++5rTZzYCxD4WHvz4OpISeJCJYCs3DT5tMcOke6y8RYR1+zdJWeSKu46NfZ0vUXAXBJi5vJPmAM4Pb3vhow1WZbXDMJLshYVsRBnyMFubOngDN/S6nKKExzeHrA8Vv9FwWwMhE9FAgMg6gs/yVAFs=
Received: from DM6PR02CA0139.namprd02.prod.outlook.com (2603:10b6:5:332::6) by
 SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.33; Wed, 29 Mar 2023 00:56:02 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:332:cafe::90) by DM6PR02CA0139.outlook.office365.com
 (2603:10b6:5:332::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Wed, 29 Mar 2023 00:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Wed, 29 Mar 2023 00:56:01 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 28 Mar
 2023 19:56:01 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 8.0.0-rc2 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 19:55:41 -0500
Message-ID: <168005134166.17868.16000937138643937647@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|SA0PR12MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f5c46c-364e-4910-da8c-08db2ff05e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /plNVhKDR7UWKX/dbvb/hiMRyIh8EPtKo8joZgTLkzLGmSBYY6IKYcMT69drJfLFpt7fPbh6i2WXYiSe6tZFHuzWb5Kjj4/aiY9ngsmVyzGuOnzofNqir6/lu6oHqCn7lshMgxtceaxL5Odp3R7lZR43dNKuy8n1QWkOzSKR/y8SrT7HRxHLSaFX7ppjFu+Li2yxjlPZwZSJbvb6wrbHt3XI6r8XJCElEfJ0g75yhhlTmsqm+ZcMLWV8gjxah6DHTNB38c4sypUhrxKhyBqQI2yD4lIq3Xn0dGbBV57wP2UC5eoOXUuOz41CGNzfibV4Vl3uMNP8KZvbVvg65a8vYszhjP1ECpEi9xEqvbyGELycpIl1dCnTCFKrRu00abjuMiFV5ky/IFV/gVGVyZWCT8Ev9E9NgejUcBlj4w30MRG8tE/FidVub8KBCPM8gYW41ldKKJtz2IfK5bKbuFNhEazFA/ad6NgYffmYcXxDldRHpIbSGup81L9J/cTOyW6BbmjZm8mkIdf98+BXPAViJvfVg7v/rJ/bfDyFag4vuDm5RRKHM3UxylL6NePM7H/mhCl5wAp7ndE/pC/VsvqUJ1Lex7iYWQgRr7bpkDDW49Hej5OaDyRE0dvE5Xit+vRfgSpg4Agp2PpQbC9oo6a2C1UO2UqT7E+mkZ7KBH3Eq1AZixRFHiKS3TrX2syYoGFislz6vGbGINyntgG2m+BAv81yV/4PCs1oxTmLm2+3MGb5qQ50ulc9/bYcx/NtZYNbnDLf1aubTrPtShStj7E7IA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(82310400005)(40460700003)(44832011)(966005)(70206006)(6916009)(36756003)(8676002)(316002)(70586007)(41300700001)(36860700001)(82740400003)(5660300002)(4326008)(478600001)(40480700001)(8936002)(356005)(186003)(2616005)(16526019)(6666004)(26005)(86362001)(81166007)(83380400001)(426003)(66574015)(336012)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 00:56:01.8505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f5c46c-364e-4910-da8c-08db2ff05e07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496
Received-SPF: softfail client-ip=40.107.244.76;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
third release candidate for the QEMU 8.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu.org/qemu-8.0.0-rc2.tar.xz
  http://download.qemu.org/qemu-8.0.0-rc2.tar.xz.sig

You can help improve the quality of the QEMU 8.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/8#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/8.0

Please add entries to the ChangeLog for the 8.0 release below:

  http://wiki.qemu.org/ChangeLog/8.0

Thank you to everyone involved!

Changes since rc1:

d37158bb24: Update version for v8.0.0-rc2 release (Peter Maydell)
46e3b237c5: target/arm/gdbstub: Only advertise M-profile features if TCG av=
ailable (Philippe Mathieu-Daud=C3=A9)
fba7c3b788: igb: respect VMVIR and VMOLR for VLAN (Sriram Yagnaraman)
7581baed88: igb: implement VF Tx and Rx stats (Sriram Yagnaraman)
3c2e0a6853: igb: respect E1000_VMOLR_RSSE (Sriram Yagnaraman)
5f12d70304: igb: check oversized packets for VMDq (Sriram Yagnaraman)
3269ebb3e0: igb: implement VFRE and VFTE registers (Sriram Yagnaraman)
1c1e649761: igb: add ICR_RXDW (Sriram Yagnaraman)
2e68546a43: igb: handle PF/VF reset properly (Sriram Yagnaraman)
e860ef1568: MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer (Sriram Ya=
gnaraman)
2a5f744ef2: hw/net/net_tx_pkt: Align l3_hdr (Akihiko Odaki)
4cf3a63849: hw/net/net_tx_pkt: Ignore ECN bit (Akihiko Odaki)
f4fdaf009c: igb: Fix DMA requester specification for Tx packet (Akihiko Oda=
ki)
212f7b1dac: igb: Save more Tx states (Akihiko Odaki)
ca2a091802: hw/nvme: fix missing DNR on compare failure (Klaus Jensen)
9b4f01812f: hw/nvme: Change alignment in dma functions for nvme_blk_* (Mate=
usz Kozlowski)
d8fbf9aa85: block/export: Fix graph locking in blk_get_geometry() call (Kev=
in Wolf)
e62da98527: aio-posix: fix race between epoll upgrade and aio_set_fd_handle=
r() (Stefan Hajnoczi)
2957dc40a2: block/export: only acquire AioContext once for vhost_user_serve=
r_stop() (Stefan Hajnoczi)
bd2cd4a441: nbd/server: push pending frames after sending reply (Florian We=
stphal)
670d8c6ebf: hw/xenpv: Initialize Xen backend operations (David Woodhouse)
8635a3a153: Revert "docs/about/deprecated: Deprecate 32-bit arm hosts for s=
ystem emulation" (Thomas Huth)
da80f11efe: cirrus-ci: Remove MSYS2 jobs duplicated with gitlab-ci (Philipp=
e Mathieu-Daud=C3=A9)
8f03c08506: gitlab-ci: Cover SPICE in the MSYS2 job (Philippe Mathieu-Daud=
=C3=A9)
7b1bde9560: ui/spice: fix compilation on win32 (Marc-Andr=C3=A9 Lureau)
07e4804fcd: target/ppc: Fix helper_pminsn() prototype (C=C3=A9dric Le Goate=
r)
f79283fdb8: target/s390x: Fix float_comp_to_cc() prototype (C=C3=A9dric Le =
Goater)
d091b5b442: hw/block: replace TABs with space (Yeqi Fu)
0030b244a7: hw/ide: replace TABs with space (Yeqi Fu)
f75e4f2234: accel/xen: Fix DM state change notification in dm_restrict mode=
 (David Woodhouse)
0fcd574b02: qga/vss-win32: fix warning for clang++-15 (Pierrick Bouvier)
e35b9a2e81: qtests: avoid printing comments before g_test_init() (Daniel P.=
 Berrang=C3=A9)
6205a70b92: contrib/gitdm: add group map for AMD (Alex Benn=C3=A9e)
3556c1034d: contrib/gitdm: add more individual contributors (Alex Benn=C3=
=A9e)
bfa2e7aacb: contrib/gitdm: add revng to domain map (Alex Benn=C3=A9e)
111fc86241: contrib/gitdm: add Alibaba to the domain-map (Alex Benn=C3=A9e)
8bc9e104b7: contrib/gitdm: add Amazon to the domain map (Alex Benn=C3=A9e)
b89b72de16: contrib/gitdm: Add SYRMIA to the domain map (Alex Benn=C3=A9e)
e00c621bba: contrib/gitdm: Add ASPEED Technology to the domain map (Alex Be=
nn=C3=A9e)
0d01a2f8a4: iotests: remove the check-block.sh script (Daniel P. Berrang=C3=
=A9)
51ab5f8bd7: iotests: register each I/O test separately with meson (Daniel P=
. Berrang=C3=A9)
5ba7db0938: iotests: always use a unique sub-directory per test (Daniel P. =
Berrang=C3=A9)
cb845eaa88: iotests: connect stdin to /dev/null when running tests (Daniel =
P. Berrang=C3=A9)
6e5792a1f6: iotests: print TAP protocol version when reporting tests (Danie=
l P. Berrang=C3=A9)
663755b022: iotests: strip subdir path when listing tests (Daniel P. Berran=
g=C3=A9)
a9e21786da: iotests: allow test discovery before building (Daniel P. Berran=
g=C3=A9)
0c8076b024: iotests: explicitly pass source/build dir to 'check' command (D=
aniel P. Berrang=C3=A9)
85b983485b: tests/vm: custom openbsd partitioning to increase /home space (=
Daniel P. Berrang=C3=A9)
3b67f43cf3: tests/vm: skip X11 in openbsd installation (Daniel P. Berrang=
=C3=A9)
507271d468: include/qemu/plugin: Inline qemu_plugin_disable_mem_helpers (Ri=
chard Henderson)
aa4cf6eb82: include/qemu: Split out plugin-event.h (Richard Henderson)
720ace24ae: *: Add missing includes of qemu/plugin.h (Richard Henderson)
cc37d98bfb: *: Add missing includes of qemu/error-report.h (Richard Henders=
on)
e8956e0c6c: include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT (Richard Henders=
on)
10588491c1: tcg: Drop plugin_gen_disable_mem_helpers from tcg_gen_exit_tb (=
Richard Henderson)
e04660afef: tcg: Clear plugin_mem_cbs on TB exit (Richard Henderson)
fb3af2d182: tests/avocado: don't use tags to define drive (Alex Benn=C3=A9e)
6f6ca067d2: tests/tcg: add some help output for running individual tests (A=
lex Benn=C3=A9e)
32ba75adc0: include/qemu: add documentation for memory callbacks (Alex Benn=
=C3=A9e)
dbe9a9cdbb: gitlab: update centos-8-stream job (Alex Benn=C3=A9e)
82790dfefc: scripts/ci: update gitlab-runner playbook to handle CentOS (Ale=
x Benn=C3=A9e)
6df250e181: scripts/ci: add libslirp-devel to build-environment (Alex Benn=
=C3=A9e)
55154c5785: tests/docker: all add DOCKER_BUILDKIT to RUNC environment (Alex=
 Benn=C3=A9e)
9f95111474: tests/avocado: re-factor igb test to avoid timeouts (Alex Benn=
=C3=A9e)
80232dba16: tests/avocado: probe for multi-process support before running t=
est (Alex Benn=C3=A9e)
136b6085f1: tests/avocado: update AArch64 tests to Alpine 3.17.2 (Marcin Ju=
szkiewicz)

