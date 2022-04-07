Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C574F759A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 08:07:39 +0200 (CEST)
Received: from localhost ([::1]:51972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncLIw-0006sm-IN
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 02:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1ncLDT-0004yE-Rd
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 02:02:02 -0400
Received: from mail-mw2nam08on2082.outbound.protection.outlook.com
 ([40.107.101.82]:4961 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1ncLDL-0002ML-Ny
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 02:01:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTb9N7JLihVjjzaugprnsXskX4R87B4aS4uWfyvPgZR0Rw9mIwHzK4t+G1AKI1kQCtbWX3b7vdssAYAT9b2wX50fPiGwd92w+/hdse/FG8sss/Y3EUsjdU+r6UjlezSViY3pDfWzAy59M8xlBmgpAjUO77k7uy+RKNcoS9CpfXtJeYbWNL9BwOpWJUGduJMoyYJFaW64RONHK3jIyP6OPC+68MQWhtBp+0CgdjKks7kFjBjL0hKbLPwOqvuTvouZikPv9aXmZJ9SQIfjNFs51FsAG443qrS9LUfR2tGeyv2P9PlPjw9agatKZrKNqmlG0RfKPNyUiiYugFJoPIeW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JYN0VCEH5/39mp0vuZx31DhY8fVv+Rf0G9zoAzDSJ0=;
 b=hmSxlX5ZA85nfaGocjq7AATAjcpC8nacoR4sYA0yCRQs0sZG/mLPO8/r2a/oDrtr3FuPuRUYmFwBxx4mlcl7hAKhumolSNAoNTf5Cocv0JZUzrATNtedReeixtg0VwxxSOj/o0A9FBVLaKzFvoll/o8jZBE8DyR9WFT+6TeXb9ExP90dctsDmKE7dCHrdV5peMPHgawAspZRLHoYDGM7VsahYm3azwuBcIc26Ov0guqtbhZZKBehrw1tVBuqsy4GD89NBOA/rxUpIyAoFTgxrde/ex0tx4ILAaluKhuDZi/Py5EnD0zgZsYVAPgVgVzHxekOLVc+raTHvHmueVlBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JYN0VCEH5/39mp0vuZx31DhY8fVv+Rf0G9zoAzDSJ0=;
 b=sdDo1ijIkZmUBAvHqhxbJpakAGcUO3zTf3HOco1PkE+tayzbmUoio3Mn2xJQ7a3adSqfU76QZrHJF3HmI9HehFrabt8avGRjhjm8RhLzB0ID3nJCBbz+227boax6QMFvCyQTDGuG9AQ79b/UzkUvSsTqxpeKff5XxWzmTNr2JEg=
Received: from MW4PR04CA0248.namprd04.prod.outlook.com (2603:10b6:303:88::13)
 by BL0PR12MB2578.namprd12.prod.outlook.com (2603:10b6:207:49::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 05:56:45 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::e1) by MW4PR04CA0248.outlook.office365.com
 (2603:10b6:303:88::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22 via Frontend
 Transport; Thu, 7 Apr 2022 05:56:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Thu, 7 Apr 2022 05:56:43 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 7 Apr
 2022 00:56:43 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.0.0-rc3 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2022 00:56:27 -0500
Message-ID: <164931098765.111780.13146739533608672442@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f75a46b5-2924-4be7-5b9e-08da185b64de
X-MS-TrafficTypeDiagnostic: BL0PR12MB2578:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB25787CD4F2C74153D4CFCE9395E69@BL0PR12MB2578.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rnzuLDTQbOg8OCXy3tGYtL70ht4EmikVdQmweXCUXH5ha3b6d+S/TvIAxSx09miM95qwuQGd/jUYOE4lNhSLS+q/euJVUuusbLvuA2jbNJDIBU1aBak5RmL/gdolDbuYg1/z2ir7MhCV9xmeiAhwjBBRpOX+yYBuDJ4QVoWtuY8WRq5EqeO3x5AD3c8rTn8LwrJ+Pg7NTtkMOOpEmaPEHdJapx+N9hVLn4RcNA13Ewy8HWjQzsQ2bUcYMTtfpOoxREBTHxXdIY6MtEuiy8GJw0rpyQ+FBLeXHWPX2uhlRhEEjDc92yxMwPQOgaNpkKhy4EBnInOgKBreXsEqiV6Tv4NANqBDndd6zyzD3m9hynbNPUvg1X31tFgWOylxtZHdZhU6qt90RMVDNcdBKNYugT1fF2QG1qn2UxUAHTxHDsVk3BdTljUGG/DVKHWfVa82wfW8kk+3Vk+eTNE+0CN+og8XQWuta+9kP09Ht7vlY1s+mUd1MNP5tAhWKZtapGxX7f6zDey1tTfNa1D8lFP/jSZLYFwqkWiWSxERMhw51GFU4ZmYP++TUV1l6zJ6uUMquNaOZY0hQnj/t6lwJEywgM2oZt9HgNvZGykoHRsXAGE62U+0+4tOB2d1WlnEg43LbvNdRpr3fEUhmcMslN+n80orLKrT5Hdgb3rXDK07Iy6NvD0EYScjij7CW9mEUrmySBrlKYRPyiQYrrfdPlg+ilp4ZLwaoGhcN/ZejRTonRNbmxKgj3+jFe7gLz5G3Q8D1hHCzWO/hsSawF2v0m5sm88uZ8bL8l3sI8uHw0vOgXcj/C1C5qifkDj+3H2nPR/wujo/P42nS2FHf59Fgq7PLQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(186003)(508600001)(966005)(82310400005)(6916009)(6666004)(8936002)(5660300002)(26005)(44832011)(2616005)(2906002)(16526019)(47076005)(4326008)(8676002)(70206006)(426003)(336012)(316002)(70586007)(356005)(40460700003)(86362001)(36860700001)(83380400001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 05:56:43.7856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f75a46b5-2924-4be7-5b9e-08da185b64de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
Received-SPF: softfail client-ip=40.107.101.82;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
fourth release candidate for the QEMU 7.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.0.0-rc3.tar.xz
  http://download.qemu-project.org/qemu-7.0.0-rc3.tar.xz.sig

A note from the maintainer:

  As usual, if we find no release-critical issues in the next week,
  we'll release 7.0.0 on the 12th April with no further changes. If
  something does come up, we'll do an rc4 on the 12th and plan to
  do the final release on the 19th April.

You can help improve the quality of the QEMU 7.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.0

Please add entries to the ChangeLog for the 7.0 release below:

  http://wiki.qemu.org/ChangeLog/7.0

Thank you to everyone involved!

Changes since rc2:

95a3fcc748: Update version for v7.0.0-rc3 release (Peter Maydell
a83c284490: acpi: fix acpi_index migration (Dr. David Alan Gilbert
8230f3389c: qapi: Fix calc-dirty-rate example (Markus Armbruster
7c90031d80: qapi: fix example of query-memdev command (Victor Toso
28c1ec60aa: qapi: fix example of query-cpus-fast command (Victor Toso
6352c81b24: qapi: fix example of trace-event-get-state command (Victor Toso
51ec294d8e: qapi: fix example of query-colo-status command (Victor Toso
c7f4a0fc78: qapi: fix example of query-vnc command (Victor Toso
74dd52e556: qapi: fix example of query-spice command (Victor Toso
016b835949: qapi: fix example of query-named-block-nodes command (Victor To=
so
227a762bef: qapi: fix examples: replay-break and replay-seek (Victor Toso
9a9d101c5b: qapi: fix example of netdev_add command (Victor Toso
776a6a32b4: docs/system/i386: Add measurement calculation details to amd-me=
mory-encryption (Dov Murik
7bd16378bb: qga/vss-win32: fix compilation with clang++ (Helge Konetzka
fae4fad5b4: coverity: update model for latest tools (Paolo Bonzini
80b952bb69: docs/system/devices/can.rst: correct links to CTU CAN FD IP cor=
e documentation. (Pavel Pisa
2e9ce53200: xlnx-bbram: hw/nvram: Fix uninitialized Error * (Tong Ho
0798da8df9: linux-user/ppc: Narrow type of ccr in save_user_regs (Richard H=
enderson
7e5157696b: ppc/pnv: Fix number of registers in the PCIe controller on POWE=
R9 (Frederic Barrat
ef95a24494: hw/ppc: free env->tb_env in spapr_unrealize_vcpu() (Daniel Henr=
ique Barboza
a5b1e1ab66: target/arm: Don't use DISAS_NORETURN in STXP !HAVE_CMPXCHG128 c=
odegen (Peter Maydell
034e050dbd: MAINTAINERS: change Fred Konrad's email address (Frederic Konrad
6c05a866cf: target/arm: Determine final stage 2 output PA space based on or=
iginal IPA (Idan Horowitz
bcd7a8cf38: target/arm: Take VSTCR.SW, VTCR.NSW into account in final stage=
 2 walk (Idan Horowitz
d3b2d19111: target/arm: Check VSTCR.SW when assigning the stage 2 output PA=
 space (Idan Horowitz
0da067f2a8: target/arm: Fix MTE access checks for disabled SEL2 (Idan Horow=
itz
e32aaa5a19: trace: fix compilation with lttng-ust >=3D 2.13 (Marc-Andr=C3=
=A9 Lureau
a136d17590: 9p: move P9_XATTR_SIZE_MAX from 9p.h to 9p.c (Will Cohen
54c9b19421: meson.build: Fix dependency of page-vary-common.c to config-poi=
son.h (Thomas Huth
fc6e0d0f2d: target/s390x: Fix determination of overflow condition code afte=
r subtraction (Bruno Haible
5a2e67a691: target/s390x: Fix determination of overflow condition code afte=
r addition (Bruno Haible
e7c2d7436e: misc: Fixes MAINTAINERS's path .github/workflows/lockdown.yml (=
Yonggang Luo
8ff8ac6329: target/riscv: rvv: Add missing early exit condition for whole r=
egister load/store (Yueh-Ting (eop) Chen
5242ef887d: target/riscv: Avoid leaking "no translation" TLB entries (Palme=
r Dabbelt
04cca669b2: tests/lcitool: Do not use a hard-coded /usr/bin/python3 as pyth=
on interpreter (Thomas Huth
ef4ff56cf3: vhost-vdpa: fix typo in a comment (Stefano Garzarella
b49202151c: target/sh4: Remove old README.sh4 file (Thomas Huth
b1f4b9b832: linux-user/sh4/termbits: Silence warning about TIOCSER_TEMT dou=
ble definition (Thomas Huth
7ceee3a19b: tcg/aarch64: Use 'ull' suffix to force 64-bit constant (Richard=
 Henderson
4375cf9868: qapi: fix example of dump-guest-memory (Victor Toso
69bd6cb829: qapi: fix example of ACPI_DEVICE_OST event (Victor Toso
aecba61786: qapi: ui examples: add missing @websocket member (Victor Toso
05df03cfd3: qapi: fix example of MEMORY_FAILURE (Victor Toso
1c4ec79114: qapi: run-state examples: add missing @timestamp (Victor Toso
d219119fe3: qapi: fix examples: SHUTDOWN and RESET events (Victor Toso
121c25b077: qapi: fix example of FAILOVER_NEGOTIATED event (Victor Toso
0df5e9a301: qapi: fix example of UNPLUG_PRIMARY event (Victor Toso
dba673b9ab: qapi: fix example of MEMORY_DEVICE_SIZE_CHANGE event (Victor To=
so
077a5b1ec3: qapi: fix example of DUMP_COMPLETED event (Victor Toso
2c29d9b04b: qapi: fix example of BLOCK_JOB_PENDING event (Victor Toso
39e8bb223e: qapi: fix example of BLOCK_IO_ERROR event (Victor Toso
abbf04731f: qapi: fix example of BLOCK_IMAGE_CORRUPTED event (Victor Toso
97cd74f772: qapi: BlockExportRemoveMode: move comments to TODO (Victor Toso
bf37d537e6: schemas: add missing vim modeline (Victor Toso

