Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D098C5A3008
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 21:33:53 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRf5U-0006e7-Fu
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 15:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oRf3d-000589-S7
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 15:31:58 -0400
Received: from mail-dm6nam10on2062c.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62c]:51296
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oRf3X-0006de-FP
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 15:31:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvmPzPVCrQ1NZMlBX0Rvwkww4Noy3qMRP8zM0qJRROfWUOdNeO3dcyGR/NHuu5WgI/hqxN+IR2a7SYtaipLKMXXyZDH9BdtY3TOHzbMEryCG7rBDZGmDiRr9vwDxnwt+7Ofb/wlpftUM5dNMxESz+UgTdkiJV7y21EdeXz1GMkmdawRV04AztT2oFToe4V8YPxRAnEP9uMOdg9yZEwxDL/CZHqZ6fzeaR8VatlCX7ZRVxJAXZOON7LgPZGsb4y/3gTmR1p4JXdTUDvUrEhjCkoOjTIXRWmlXNAXGsdB0wTqco6ENLmILDYMNWA9bajoFCS0b9k8PSAZQjxXpkIrH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WrJhvJ3U5vciObRPhdrERE71rsB/0wjLpd4NXjRFv0=;
 b=NPK10qXb17zx8ZsqvTaIE2Ov4DZQ8v3nc0TmmmOAtaI5+xW5lVGq1aRyvc3I2us5Xs92XWqBB8HqjV10oJFA2fosfwbt3qe1x7IftQ3rn/wwIJR3n8mafQw5D4DSNsw/uKix0y7Eq1SsKKElubmQZcPtH60HaagsQk872OXZcrXFbB6Whj+Y+YikCpmGHEFPkddYFgChQRzznPnnpcwxoisyHJympYFMaE2xYpLYKHNesf2HmU+5nXl7qL2qNg3zFMVhooNgfffET+CarowJiys88Q+hy9/QwmFlMGmnX0eAHRtt+25LuhIq1Gn26vXx4x2LYz5oRYBuhcfbIzx9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WrJhvJ3U5vciObRPhdrERE71rsB/0wjLpd4NXjRFv0=;
 b=PWmlQU1wnL12j3PnwtTaeIzoY5Nry9EulZLaZSlC8kBoQ8uwBge61omHaDZb11WTbvqtrq2epuw9QJPYhy/JLDNn1hezp8cuiAPSRLEUyyHi7Brt3QWtm0FL4X1C3r4MSgX6bvSM0aGbnKWe+EDkq2wAuV48BJgRyTzdtwF5jL8=
Received: from MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::33)
 by BYAPR12MB3063.namprd12.prod.outlook.com (2603:10b6:a03:d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Fri, 26 Aug
 2022 19:26:44 +0000
Received: from CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::cd) by MW4P222CA0028.outlook.office365.com
 (2603:10b6:303:114::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Fri, 26 Aug 2022 19:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT086.mail.protection.outlook.com (10.13.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Fri, 26 Aug 2022 19:26:44 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 26 Aug
 2022 14:26:42 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.1.0-rc4 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>
Date: Fri, 26 Aug 2022 14:26:28 -0500
Message-ID: <166154198813.34397.1644369933185627310@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c276af31-ca73-4239-7363-08da8798e93d
X-MS-TrafficTypeDiagnostic: BYAPR12MB3063:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3hwHtwX4akICQUKxeqBsCGnB4pfnatQqDy9nVrXxtWJPE+gOAR6TPar/P8gT5Cjgc6pMmGhaGQP8H5UryPtPPX1oJWHR+u3jAHjJKQZOu5w9KsEg1lAZyRsmKs1H5fcYidu/D1Kdm7FBO/YJCoL4P6OAnUUbum6FsOpTyNozlUFFfIXpUf9W/lqBhcgpmvAjmW8Lc0BA4q+CNHbENX/veJTfrunaS1Utqkpa9OzSkQPlEkUJ14BPu3b7TBcl90cc5bprmUt0NhnCjJNe94VrBF1JtR0y3Txz9oBx0YoP/G3uSR8aNjaqu/qIu82fHQy+YldTGpfEoOpDdn9bRGZPUmqBKbH1IXx2ZIx8h1xPyD/+quGy2nZ7V9QQL8s9jqBXP/kJCwt+vRDj7CFJN074bMi68uOnQqk7CNs661aWombc4QxuJpuTikB+z1s1eNefQuIcldvaiS7Zgj82TrtbniI0OQGBllnGjrB8dV6Ix+ITF3+cWtp9nrEM0a0fxVar4Dr5p00lyH8NUdykZkMF7ZO1Edj2TbajCnMjjKOiCfyusdFNZhr4Bl0GQtGZpvYGuyUmDPutPKpsJNzHbMD2Ghd0MnLO5TlfxetFASgKJ2Ivgwii4ejozmDCh7OEUMvO/2FMcbHOPu5J+7Ig1RxhW9W4nFJtQvf1ik7SbQmi8nWIOa49j7X6H6WymKmNIW36TegMXJlSI0lTXoTG/w3WjLCcjIcT4dCKoIPZanvsmwrrCPqyrFHAG0DfUIkNTDRWyQQQ5DoOZW+04ix9Byz1QKVKFRds4aEYZpdrJvEluZ5bqVA9UgaXAE7Rjtxior7H0CDYOUe1Tw5NmW4fgJzGzse9/MkajT2CFaidnRjmjIN6r8c7OIH9eTNP2KoD2GWt
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(40470700004)(46966006)(40460700003)(8676002)(16526019)(186003)(70586007)(5660300002)(336012)(8936002)(44832011)(82740400003)(4326008)(70206006)(82310400005)(36756003)(966005)(478600001)(2616005)(6916009)(2906002)(41300700001)(86362001)(356005)(26005)(81166007)(426003)(316002)(36860700001)(66574015)(83380400001)(40480700001)(6666004)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 19:26:44.2368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c276af31-ca73-4239-7363-08da8798e93d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3063
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62c;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
fifth release candidate for the QEMU 7.1 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.1.0-rc4.tar.xz
  http://download.qemu-project.org/qemu-7.1.0-rc4.tar.xz.sig

You can help improve the quality of the QEMU 7.1 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.1

Please add entries to the ChangeLog for the 7.1 release below:

  http://wiki.qemu.org/ChangeLog/7.1

Thank you to everyone involved!

Changes since rc3:

9a99f964b1: Update version for v7.1.0-rc4 release (Richard Henderson)
5af2b0f6ea: qemu-options: try and clarify preferred block semantics (Alex B=
enn=C3=A9e)
00269477c2: tests/qtest/migration-test: Remove duplicated test_postcopy fro=
m the test plan (Thomas Huth)
41adc59640: tests/migration/i386: Speed up the i386 migration test (when us=
ing TCG) (Thomas Huth)
c398c76187: tests/migration/aarch64: Speed up the aarch64 migration test (T=
homas Huth)
e25636a12a: tests/qtest/migration-test: Only wait for serial output where m=
igration succeeds (Thomas Huth)
48acf68cfe: tests/avocado: push default timeout to QemuBaseTest (Alex Benn=
=C3=A9e)
51e15194b0: scsi-generic: Fix emulated block limits VPD page (Kevin Wolf)
6fab0c182d: target/hppa: Fix proberi instruction emulation for linux-user (=
Helge Deller)
976a55c0fe: Revert "linux-user: un-parent OBJECT(cpu) when closing thread" =
(Richard Henderson)
a9197ad210: kvm: fix segfault with query-stats-schemas and -M none (Paolo B=
onzini)
88738ea40b: ui/console: fix qemu_console_resize() regression (Marc-Andr=C3=
=A9 Lureau)
f0caba4475: build-sys: disable vhost-user-gpu if !opengl (Marc-Andr=C3=A9 L=
ureau)
2748583211: dbus-vmstate: Restrict error checks to registered proxies in db=
us_get_proxies (Priyankar Jain)
9afb4177d6: virtio-pci: don't touch pci on virtio reset (Michael S. Tsirkin)
888fbaaf02: tests: acpi: silence applesmc warning about invalid key (Igor M=
ammedov)
4f41b4e445: hw/cxl: Correctly handle variable sized mailbox input payloads.=
 (Jonathan Cameron)
66a2356485: hw/cxl: Fix Get LSA input payload size which should be 8 bytes.=
 (Jonathan Cameron)
29d1fbc6c6: hw/cxl: Add stub write function for RO MemoryRegionOps entries.=
 (Jonathan Cameron)
d2289b524e: hw/cxl: Fix wrong query of target ports (Jonathan Cameron)
a99fbb003b: hw/cxl: Fix memory leak in error paths (Jonathan Cameron)
3824e25db1: x86: disable rng seeding via setup_data (Gerd Hoffmann)
643a943554: hw/virtio: fix vhost_user_read tracepoint (Alex Benn=C3=A9e)
5a9d5f09b1: hw/virtio: handle un-configured shutdown in virtio-pci (Alex Be=
nn=C3=A9e)
f20400ed0d: hw/virtio: gracefully handle unset vhost_dev vdev (Alex Benn=C3=
=A9e)
9a4b6a63ae: virtio-scsi: fix race in virtio_scsi_dataplane_start() (Stefan =
Hajnoczi)

