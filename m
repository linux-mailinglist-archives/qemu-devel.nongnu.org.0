Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D7646779
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 04:08:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p37Fw-0004qx-UQ; Wed, 07 Dec 2022 22:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1p37Fu-0004qo-IN
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 22:07:26 -0500
Received: from mail-bn8nam04on2052.outbound.protection.outlook.com
 ([40.107.100.52] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1p37Fr-00025M-Qg
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 22:07:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjS3xWJf3x7oS9nB34HtsW0xFFxDT5Fhl/VOIxx4LrgM5aiWVZgs+DFe5vfeQaTVpGyOCyXn8CDVlYeaNrvMvntvMs0LHsOncjzpCX9gt4fqFkhi++ICPU2gG7DEzDPxtDBKMJZoh4RusHqQoZSF6+EaUHZvvRhpE3r0V+qf6O1q2JUG4rHvOTo7rzHiBEeG/QpMnpP230bscMW6/TAMvH/VCd/w2L/3OfFs/MQ1D+aMaUAl2NRG3xdG+8Sx7c9+54AtB3M1X2xbfN8QUTPC4gGo5ap8LxPm4CkVIbu4G8kGVjd2ON7sazDxP9QjJBttVJoRTBxCwSzfIrKCNs2P7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZE1CFN01MHYO4FQG4qbRQ8dF/T3Migg6liT5wg4xnM=;
 b=LigSx1ZUb7DfDVulq+TxEXon1XE7lKme9uWquiBHc62BebAUSfvc/FcEth3vBJbr0Dq/EAOVkfCEVomybnc+lXdKWTXyo2kRJz1qczfxBx76y9XblUyv3zTj4bwK5P4WbQbM7CKHldBbp125GLCrZQfWf1lGVfihZGLwMenrm+dR/zwSJ8UpZQtXZKkm72ZTJQSaAdVYAJvBmVtCEPjeKL9S7q8te6ocThvihQmXQEyJZ/uvjnNKZ38VyHQYe1CFQIVylVrig55E3WNb/R/9g9H+W3atftpTsktGxcIKKQKUf2ZrTtibb3ZYZiE7ofGbQTulS/Ul81Lx+rBixHeR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZE1CFN01MHYO4FQG4qbRQ8dF/T3Migg6liT5wg4xnM=;
 b=L/hbAlACTS51q3pRUjMR8rZpDPtVOpZKtvwYFWJxfo1Umf6XesBqPdU7p9MDdIQJ7QAUHpgIDsNPjvuJKcAK5TBaWTxc1dwR67jJ232w2dHq3KiFA8VLvddKJS9lfclvvvlWum7JT08BzzxEmXRo4ZKDvyKtcglMd1sHzclrLyM=
Received: from BN0PR04CA0098.namprd04.prod.outlook.com (2603:10b6:408:ec::13)
 by DM4PR12MB5391.namprd12.prod.outlook.com (2603:10b6:5:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 03:02:15 +0000
Received: from BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::64) by BN0PR04CA0098.outlook.office365.com
 (2603:10b6:408:ec::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Thu, 8 Dec 2022 03:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT070.mail.protection.outlook.com (10.13.177.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.16 via Frontend Transport; Thu, 8 Dec 2022 03:02:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 21:02:14 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.2.0-rc4 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <stefanha@gmail.com>
Date: Wed, 7 Dec 2022 21:01:59 -0600
Message-ID: <167046851977.45693.17767561239680772014@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT070:EE_|DM4PR12MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: bc694387-190d-4068-7147-08dad8c89c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/PWBUGgwDup0Bk2hOCxvU3tbU/ZJvqy50cELeL4qJRxa4M1zrda+M5X0Vsi9E+8H9CFHH5CjfUciY1jnVErcPROor38olqwAlHzuQ/CbTCKrdQRGwmra4GqlJaqkO39zG/aRTfbn2+lWdqPffvpA9AcKuS7CnIdqjmV8ZryYvjAuaEMYIu5eKRZqQzA7FVKelJ1ldo0TwEtfCe/VKOPKLlUu3MB6OQzoi8R1PIGKcYn3Q+zL+mgKaBVvEKqEKcnpcyoyxXrNAc9kyAP2FJaq8rwT677hKI1v/ba1xLBdETvyjk9SSAcHZwcQenzkjPnjpp9rj9xfc+hSM+AG5AEG+bhlf0wavV2EPUKkYcAa3GDPP+0NZCVH5WYXwcrSf5SwhaxitfV2JgSOTvUW7VeNYyAzNuNqqTJA7BYyXEgMQYLYCTSOKXsEA2tFOpB67c0aYGhH5nuJYuAoWAkE0+6+0om880KR8gRydOdILUpZZvcc7JoHClxtNhqSDJogfotRwdSpHbyXx3axPNuebxUFf9ATIaa1vRXkb3e72ld1Hoed46lNo88y+bMoSiCNIveqLrArH+wSW7RQxFpicCWhT9l+yS2u/oTxMzDjG2NgwF6uFfHMRPBXqqag0teO9m1a4XyJjdIwPYz+fk+osYefE1f9KHTNFwwPXAdyIdATC60KvUJRRN01TmH7Y7tu3qFNPvk7Fh5G45YQjJF4G6cqVjUJGSijKXHBK3+8P+gqhePoUQazd0AjCcl9WMKir6rGu9p3aUKFFWs3ysO+5k/xFzilULwQS8H5ibrSj/5s9eYn4szXi9eYduYoqRnvmt9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(82740400003)(40480700001)(356005)(81166007)(86362001)(36756003)(40460700003)(316002)(6666004)(478600001)(6916009)(966005)(83380400001)(44832011)(8936002)(41300700001)(4326008)(70206006)(5660300002)(8676002)(70586007)(36860700001)(2616005)(47076005)(426003)(66574015)(82310400005)(2906002)(26005)(336012)(16526019)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 03:02:14.8629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc694387-190d-4068-7147-08dad8c89c04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5391
Received-SPF: softfail client-ip=40.107.100.52;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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
fifth and final planned release candidate for the QEMU 7.2 release. This
release is meant for testing purposes and should not be used in a
production environment.

  http://download.qemu-project.org/qemu-7.2.0-rc4.tar.xz
  http://download.qemu-project.org/qemu-7.2.0-rc4.tar.xz.sig

You can help improve the quality of the QEMU 7.2 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/7#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.2

Please add entries to the ChangeLog for the 7.2 release below:

  http://wiki.qemu.org/ChangeLog/7.2

Thank you to everyone involved!

Changes since rc3:

ea3a008d2d: Update VERSION for v7.2.0-rc4 (Stefan Hajnoczi)
edc93f455f: Revert "hw/loongarch/virt: Add cfi01 pflash device" (Song Gao)
c1966f515d: hw/display/next-fb: Fix comment typo (Evgeny Ermakov)
21be74a9a5: target/s390x/tcg: Fix and improve the SACF instruction (Thomas =
Huth)
0f0a9e4e5c: tests/qtest/migration-test: Fix unlink error and memory leaks (=
Thomas Huth)
14dccc8ea6: hw/loongarch/virt: Add cfi01 pflash device (Xiaojuan Yang)
8218c048be: target/i386: Always completely initialize TranslateFault (Richa=
rd Henderson)
38e65936a8: target/i386: allow MMX instructions with CR4.OSFXSR=3D0 (Paolo =
Bonzini)
83f56ac321: hw/nvme: remove copy bh scheduling (Klaus Jensen)
818b9b8f5e: hw/nvme: fix aio cancel in dsm (Klaus Jensen)
36a251c346: hw/nvme: fix aio cancel in zone reset (Klaus Jensen)
3dbc1708ea: hw/nvme: fix aio cancel in flush (Klaus Jensen)
433c71e494: hw/nvme: fix aio cancel in format (Klaus Jensen)
4987e5bf2e: include/hw: VM state takes precedence in virtio_device_should_s=
tart (Alex Benn=C3=A9e)
71e076a07d: hw/virtio: generalise CHR_EVENT_CLOSED handling (Alex Benn=C3=
=A9e)
060f4a9440: hw/virtio: add started_vu status field to vhost-user-gpio (Alex=
 Benn=C3=A9e)
4daa5054c5: vhost: enable vrings in vhost_dev_start() for vhost-user device=
s (Stefano Garzarella)
523e40022f: tests/qtests: override "force-legacy" for gpio virtio-mmio test=
s (Alex Benn=C3=A9e)

