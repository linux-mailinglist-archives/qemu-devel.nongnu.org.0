Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DD94FEBF9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 02:53:02 +0200 (CEST)
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neRFk-0004pC-Qj
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 20:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1neRDF-0003Zb-Tp
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 20:50:27 -0400
Received: from mail-dm6nam12on2087.outbound.protection.outlook.com
 ([40.107.243.87]:30159 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1neRDA-0005n8-LI
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 20:50:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMNqZdHcxHAFlSONsjCd6m1w6+OCpVZK4qh1gE+kI9H28sXzIV8VsUY6TQTUIy0WTsgUq4xDkHgUjwB2haiLcC1tEZY6T4/XA3QXiBmLKH3HkKLg+RS/Y7W2TMhEzjzYk0oviDrAlG67buZqG8Gs3lXp15kBI058atEeVkl7cQTJFGYp85GuaCQPobE0WqD5GbGs3bbyemycPTrbQkFXFXlM8ue3WchCSE267gEtMxssmRwqDt6c9r3frwYGVQ764p0TfBDRmqwfqR4AVD79JBEBDqUxZV3H/7MVh8M+0wUaZ0IrzFHM4m6dspUDzGxA/TFOBX18iffBksq9kC/mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9QKgvlGcyQwIMun2Ud2JuL8uZgoEVZuZ9Efil7982Q=;
 b=byYeoI+u34E2SQKZqT47QSDdFxeg5kd4nHy8B80gqdP10oLosWQDntdrx1OiW3qb35MSnpuErAJCmsCbKLZYlJj6+yNUlWFiHryKAFFfbgkJeKRIqHPr9Qhms6A3jpwk0Dk7JFXN/hP7TAg1HI2aPXfNfY3K5Xhp42Dg/OMJ/AqDXtyjBD6BPoKtkgGmtDOeusLfNKUh8ytSW40lVw7kLjrpFnfaWRTTYkmwVxROOme0m5x8hsPd4vAGScNg7/NP7eDaRd83G1OcPfaJYUrMADMaz8huVb63Ub5X+8VRMy+rFHi1nB3nCupmeO7Q94osypXAQa9cENN2O+ewTbcAdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9QKgvlGcyQwIMun2Ud2JuL8uZgoEVZuZ9Efil7982Q=;
 b=YMETZQhl5N0OsR6ohLKyxisK352pvp8+GFUju12/cCIIsaltX6CPsiAHfVFgWYNUBdUrN0dVrHcUyuEh8UlIXyadKekX+kpCI/vgV6vDF3nSK9ShyvyAHQ+/N6lOhUmf90jx1EegN4FzmEDzJIfUMIRDmo12HL3hRpSvRvCRSZM=
Received: from DM6PR02CA0072.namprd02.prod.outlook.com (2603:10b6:5:177::49)
 by MWHPR1201MB0015.namprd12.prod.outlook.com (2603:10b6:300:df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 00:45:15 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::93) by DM6PR02CA0072.outlook.office365.com
 (2603:10b6:5:177::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Wed, 13 Apr 2022 00:45:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 00:45:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 12 Apr
 2022 19:45:14 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.0.0-rc4 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Tue, 12 Apr 2022 19:44:56 -0500
Message-ID: <164981069655.421503.5359017463823038503@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29f42370-1b6d-4d4d-a140-08da1ce6dfca
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0015:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0015E14E602C5917B5BDAF9995EC9@MWHPR1201MB0015.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VaDXVd7gHqVPzx+K+EmzoNSK1WhXGdMn1o/3Rmjk/urgQZN6qoAqKTvIOHgHQPtfktLLMgY9rpFgKtfJSKD3zOvazpD0344/jHNy/K1QgQGB8OFoZAiv7xBC9hCk63kp2gcKoSWAEsr54xhf/CW6puuKF3zXnvrIvfrkocFHQD+qgDTlvNo3XMaxI+10K7P/3uNWcQYX4UN0UR17DAcrocz8a0YLP6/UYYK3FEJWlGqXaZ3xUMaup1oWi2eKDQsrKLHt0sHfTaluCUlPpSxo+PfB8W6WxLKpOjBi5EdWacZR2+vsgkG8Np9EbsOKkASgC7YXQTRwuHgBZyrEnJsjIpFQ8xmAKf2yFIOJI/5IqSVAT+WqHbt1QP1ZX0VQHZTHqzLTIg/TX33kUWt+stoqGulXdBBkz6NtzvPzdcBtlzFfpePXIf3GqW8AfSdKX31q8ino4W7iGJxJpH0546v6m9m7gwYlHie+QXx7IMteNdCM3dLNzjsBPjTodCeOLF36L7QG3C5YReGrqMffEac5p4qUn+4EUVXdsKt2OCXeWD0Xibx3SeCqm0tUyGSqrT/0zaZTCCBpIFg5Y9A58uzbq13++OS8Mslna98DrH5LFxrmUCev570hm4gZvB9Ad4c4VjLjExU3eaHXLCX0n6sSTXUDf+l2wnY4z9R6Le4TxeSO1oXjNn9zypIBpS1yQ+i0q0QDFY6KT7xGV6rVoToqtzD54iEdp5R4L3PpJCzeZqIcW/QjX7YmvBgrpZU/no2QpBOxlLg7h2IxA+zUc6R/GZA1ZtSxE+1JZ9IO0v3JMuqBI9mpamuQYQ+0l7BCgSscnK6C96DOwUx36DTk3BG8xw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70206006)(5660300002)(966005)(44832011)(26005)(40460700003)(8676002)(2616005)(508600001)(86362001)(4326008)(2906002)(186003)(426003)(70586007)(16526019)(356005)(6666004)(8936002)(36860700001)(6916009)(82310400005)(47076005)(81166007)(336012)(36756003)(316002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 00:45:14.7907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f42370-1b6d-4d4d-a140-08da1ce6dfca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0015
Received-SPF: softfail client-ip=40.107.243.87;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
fifth release candidate for the QEMU 7.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.0.0-rc4.tar.xz
  http://download.qemu-project.org/qemu-7.0.0-rc4.tar.xz.sig

A note from the maintainer:

  rc4 contains three fixes for late-breaking security bugs. The plan
  is to make the final 7.0 release in a week's time on the 19th April,
  with no further changes, unless we discover some last-minute
  catastrophic problem.

You can help improve the quality of the QEMU 7.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.0

Please add entries to the ChangeLog for the 7.0 release below:

  http://wiki.qemu.org/ChangeLog/7.0

Thank you to everyone involved!

Changes since rc3:

81c7ed41a1: Update version for v7.0.0-rc4 release (Peter Maydell)
4bf58c7213: virtio-iommu: use-after-free fix (Wentao Liang)
fa892e9abb: ui/cursor: fix integer overflow in cursor_alloc (CVE-2021-4206)=
 (Mauro Matteo Cascella)
9569f5cb5b: display/qxl-render: fix race condition in qxl_cursor (CVE-2021-=
4207) (Mauro Matteo Cascella)

