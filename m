Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9930636EA4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 01:01:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxzf8-0002xu-8G; Wed, 23 Nov 2022 19:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oxzf3-0002wD-Vp
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 19:00:14 -0500
Received: from mail-mw2nam10on2052.outbound.protection.outlook.com
 ([40.107.94.52] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oxzey-0000fP-42
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 19:00:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdQpYQcpcK1KOlVDwR4Qf8Hy1osa/m1QBRKeYswxUaucauPAXhn1Xe5dF4aavaSG1EPfyw32J9N1xS0Q1SP70jrbo9KxlNiZ+X589bk+WbqE4Gy179jOVE2Y12ukfOfreZNPFBoK6ailbOFfW7bQt0pS4ajZCAj32xVCJnDV+vnjMT9khSSKxws3xPgT0L4eh8GLsxIuigI7Nw0juXcpTFrqaaT8qRhF+/IBtqzHUq9HDp6eN6ImEeYeBhRBYAZjpabqfKAofZNoGnL3/dMgJTvygYT6Nsk/ifqXL2PANt1S6SB7VeZWUH/vrhBV5KuMbHQ/5qEVeL3cZ2K3zbJ1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwQU9hWnbCPA5vylzFc1gGI3IUGGHHvosKuhByr3YIQ=;
 b=VqzkgaI35z7RAMppU0Fsbw7XfVMedhtv5f2bFpRQZKPNEGrTtB5KI5j9zQB9D8uhiSqbNCP7SLn79lJ5KU36B7GSNvNddnPhyzRZWzpl898Cwr8miaM24aonrhQyfHMusw+sASzC4IT0oqmfQkFLevv+5a4spIupZ2+HiDLTf5+7qTPzBz6DC7pBRJDY4J8tDdO4URfIaJGI744KW+9GH9vuVA3kojOvaS3nJXR2PtaMmXK833MckiTFinr1FYH4cEhDPgGe4HTHxVXNib8bMhHi3u9Tq8Sv4Cqf7hpFo8lep1Qn5VHINgX4MH71waRPcVUEYFdhtGZQJZJKwWrInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwQU9hWnbCPA5vylzFc1gGI3IUGGHHvosKuhByr3YIQ=;
 b=0m1bUqX3qWBbEtN7pBgw+pHrjA5JkCKodlg1P6VzdtKc4H/cWdlk1Bwbk7P52Sdino4d3AP8wGRWdWZxKDJdhaAYI3hbQ0d3LqTFcMCfCrxXNHNv0voAIOvW6rH4L/qUzmmzf3ICYxGmrJ32kHZ2/Z3yAiw5usMz38inaynVrxU=
Received: from MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::30)
 by MN0PR12MB5978.namprd12.prod.outlook.com (2603:10b6:208:37d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Wed, 23 Nov
 2022 23:54:59 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::a9) by MW4P221CA0025.outlook.office365.com
 (2603:10b6:303:8b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18 via Frontend
 Transport; Wed, 23 Nov 2022 23:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 23:54:58 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 17:54:57 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.2.0-rc2 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <stefanha@gmail.com>
Date: Wed, 23 Nov 2022 17:53:22 -0600
Message-ID: <166924760233.617792.9166119568602796975@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|MN0PR12MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: f0546c96-d63a-4868-0c13-08dacdae2104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMcDYbN+nvOdtwTbrbYZgm6eHMF0THJBgpq0AULG4Q3h9fWz5xmbK+7YLTgJ6VTBCslarcCrrDRUpeK6cCcetMPnTxSNqqS7fXfD762ukDOM+/3AtsrZ20hJmLCPDMUwR31p/iAPa50NyhaS1VNAvcSiDLGkW1nE4rRFGMjoITcopu/Mg6Il14TbWuEQfdDKOjmPnJXRemN1KQvZvjIUEXM8Isd9Dza5azCnYLPGOfDr16iHcIsFY3Z4TPjqGQqYGnA5a4MRUwYrX1rUV7EDnGiAYyMUfjDN66T8iUh7VFU7ik8zUG29+JpFnTb6+zGqe+0wTs8avpYXeJjVdt3ydXmG3M8AIsKqZjJArl/kxabww0UGR4Uvg8e0hjXiP9jeS7ZDOx+gR56eFEbrxZZAtzV1J0X6hobeXcNJTfBC7NbAagnCnHSrEnX8nzyfiNhcsQot9sX7PVM1oIaQLU8qkEQ3xyWSKUW9VhLuv975yHjo51VWVYxqdJQmXfFIck+F+QWCkRtmzC0w5u6Io4q4EijbQk5UuUvQkax87jip8YbYE9t/CPtjpYUzJ3HZCDDwWxuonG/f7ycIgtuHdXz8tK4GQqucO9VpetvyO/yedTzMGX1AYDAcCbrWT3VBHZSqEmA1LZOuRHcI0BJuWgjDrNK5P5vSLngvw3+TKLLKNyJysWb1ptpSwKFKuD/prr/xBxeH93U3uPRQCen8fGor6YUiMeA0C/zklXObrJQdgMwzAXZsBHcz8IXQNGLQjtSy10SkQI2FTzqMGDI5eMmkgUKpQprtWVWQ+Da8nIS6ngfrcct3me1cB31xJ7fBvnSF
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(316002)(40460700003)(86362001)(70586007)(478600001)(6916009)(82310400005)(8936002)(36756003)(966005)(47076005)(186003)(336012)(41300700001)(8676002)(36860700001)(16526019)(4326008)(5660300002)(6666004)(70206006)(83380400001)(426003)(66574015)(44832011)(2616005)(2906002)(356005)(81166007)(82740400003)(40480700001)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 23:54:58.6701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0546c96-d63a-4868-0c13-08dacdae2104
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5978
Received-SPF: softfail client-ip=40.107.94.52;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
third release candidate for the QEMU 7.2 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.2.0-rc2.tar.xz
  http://download.qemu-project.org/qemu-7.2.0-rc2.tar.xz.sig

You can help improve the quality of the QEMU 7.2 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/7#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.2

Please add entries to the ChangeLog for the 7.2 release below:

  http://wiki.qemu.org/ChangeLog/7.2

Thank you to everyone involved!

Changes since rc1:

7c09a7f6ae: Update VERSION for v7.2.0-rc2 (Stefan Hajnoczi)
15f8f4671a: target/arm: Use signed quantity to represent VMSAv8-64 translat=
ion level (Ard Biesheuvel)
26ba00cf58: target/arm: Don't do two-stage lookup if stage 2 is disabled (P=
eter Maydell)
4451cc4653: hw/loongarch: Replace the value of uart info with macro (Xiaoju=
an Yang)
e8c8203e55: hw/loongarch: Fix setprop_sized method in fdt rtc node. (Xiaoju=
an Yang)
0208ba74c5: hw/loongarch: Add default stdout uart in fdt (Xiaojuan Yang)
b7c61789e6: virtio: disable error for out of spec queue-enable (Michael S. =
Tsirkin)
04e5bd441a: acpi/tests/avocado/bits: keep the work directory when BITS_DEBU=
G is set in env (Ani Sinha)
c4d4c40c51: tests/avocado: configure acpi-bits to use avocado timeout (John=
 Snow)
242a58cabe: MAINTAINERS: add mst to list of biosbits maintainers (Ani Sinha)
83afb1409f: tests: acpi: x86: update expected DSDT after moving PRQx fields=
 in _SB scope (Igor Mammedov)
4fd75ce076: acpi: x86: move RPQx field back to _SB scope (Igor Mammedov)
2df30863fa: tests: acpi: whitelist DSDT before moving PRQx to _SB scope (Ig=
or Mammedov)
562a7d23bf: vhost: mask VIRTIO_F_RING_RESET for vhost and vhost-user device=
s (Stefano Garzarella)
5544d33d4b: gitlab: integrate coverage report (Alex Benn=C3=A9e)
f22a80727f: tests/avocado: skip aarch64 cloud TCG tests in CI (Alex Benn=C3=
=A9e)
ba5d1f23f7: tests/avocado: introduce alpine virt test for CI (Alex Benn=C3=
=A9e)
5d25e1e02c: tests/avocado: Raise timeout for boot_linux.py:BootLinuxPPC64.t=
est_pseries_tcg (Peter Maydell)
73ee4c55f7: docs/devel: try and improve the language around patch review (A=
lex Benn=C3=A9e)
ca127fe96d: docs/devel: simplify the minimal checklist (Alex Benn=C3=A9e)
115847f6b0: docs/devel: make language a little less code centric (Alex Benn=
=C3=A9e)
668725ce6b: docs/devel: add a maintainers section to development process (A=
lex Benn=C3=A9e)
e558220df0: tests/docker: allow user to override check target (Alex Benn=C3=
=A9e)
a4b14b46d9: tests/avocado/machine_aspeed.py: Reduce noise on the console fo=
r SDK tests (C=C3=A9dric Le Goater)
47fdc8fb82: Run docker probe only if docker or podman are available (Stefan=
 Weil)
6d71357a3b: rtl8139: honor large send MSS value (Stefan Hajnoczi)
c74831a02c: rtl8139: keep Tx command mode 0 and 1 separate (Stefan Hajnoczi)
bd142b2391: rtl8139: avoid clobbering tx descriptor bits (Stefan Hajnoczi)
312b71abce: target/arm: Limit LPA2 effective output address when TCR.DS =3D=
=3D 0 (Ard Biesheuvel)
c4462523ff: tests/avocado/boot_linux.py: Bump aarch64 virt test timeout to =
720s (Peter Maydell)
3d5af538a4: hw/intc: add implementation of GICD_IIDR to Arm GIC (Alex Benn=
=C3=A9e)
69e7e60d01: hw/intc: clean-up access to GIC multi-byte registers (Alex Benn=
=C3=A9e)
93e2da36ed: hw/sd: Fix sun4i allwinner-sdhost for U-Boot (Strahinja Jankovi=
c)
b5280437a7: migration: Block migration comment or code is wrong (Juan Quint=
ela)
6f39c90b86: migration: Disable multifd explicitly with compression (Peter X=
u)
cedb70eafb: migration: Use non-atomic ops for clear log bitmap (Peter Xu)
afed4273b5: migration: Disallow postcopy preempt to be used with compress (=
Peter Xu)
f5816b5c86: migration: Fix race on qemu_file_shutdown() (Peter Xu)
4934a5dd7c: migration: Fix possible infinite loop of ram save process (Pete=
r Xu)
4cc47b4395: migration/multifd/zero-copy: Create helper function for flushin=
g (Leonardo Bras)
a216ec85b7: migration/channel-block: fix return value for qio_channel_block=
_{readv,writev} (Fiona Ebner)
06639f8ff5: chardev/char-win-stdio: Pass Ctrl+C to guest with a multiplexed=
 monitor (Bin Meng)
049b4ad669: target/ppc: Fix build warnings when building with 'disable-tcg'=
 (Vaibhav Jain)
1b7a07c441: acpi/tests/avocado/bits: some misc fixes (Ani Sinha)
c70fe3b148: ci: replace x86_64 macos-11 with aarch64 macos-12 (Daniel P. Be=
rrang=C3=A9)
be5df2edb5: docs/system/s390x: Document the "loadparm" machine property (Th=
omas Huth)
44ee69ea16: s390x: Fix spelling errors (Thomas Huth)

