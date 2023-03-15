Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7356BA557
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 03:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcHBT-0004My-Fh; Tue, 14 Mar 2023 22:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pcHBP-0004Mb-PY
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 22:48:07 -0400
Received: from mail-bn8nam12on2080.outbound.protection.outlook.com
 ([40.107.237.80] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pcHBL-0007nL-T3
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 22:48:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3ueYTb+JNE97GfcFs/f66KxKkEuVDCyjtOvyU04K0KCXHMMGpAM3pgC4O0bSOAbMMV0NR8wkmt1wshbzNxk21TWiXz+A0c3Ztgy3P6lr6X55X6U4XvkZmA4fQVUGf0FAJJ64dmkMpIX18TtL6mah8hHw6rru6jeI9s0zQ5zAGJzeTxEVgCmovJajvb9BAV+0VBje2yMn1D3bjZ4TgmUFKZExqKmM/VSvA255r/G07BFEW/iJwxdo6TXvlfXQ1ERgP4EQ0EXix3IFYvtjbh9Js4rc68Wp5ZKtU9h0lAhumbc++aXmI/Avz5gSuXF0i9Va1eU2p09NgT6DOJtqT3gkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXRq3thNq+a0VHt+seiANcdcppO7wlaBC8lQMdxlFak=;
 b=lA7W5AwQ01+TudjIknCuqDNJG6K1uFw8ouFvFhSlNByZf93wPPWfKDa/JaOTdoXnFGs770BZy9ITtTYkq1dopGd5NjHSskD84C/zcFjI7JIme0PnvDQXDLE6sG46bMFUq90I0ex0Y4/OG2XtDEnVnDePJz6mG9qE3PazpG9w86qfLdNPHLH4lb87yhhbb0eck+EYoQ4toyxWUbdtWUcrt8SK8bpG8jtnwzjVPdM53l+Sn6M8v5lM+pqXs+FQTyCp+2IWUFTKgxJFwdqTcafqKJJgTonv2z8VrYJ1nH2V1/FJMvcfCQ23hI3n5VL4yzt0k6GvKgrhTLRS0wjWev8aqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXRq3thNq+a0VHt+seiANcdcppO7wlaBC8lQMdxlFak=;
 b=JguwEAF+etLXGx7FhtIAXkCmTa1oPtXdiTBtyRZBRhHoSwZtKCO9ZFSTf90jmBc+gUTeLv3nsC769pyEhqrBTeAChK4URamHKvVKcWDWLBwbeDeisiJvMAeIvM2eK7WKRgkLfYfNV+Ggq7l0fRRhvL8y3ZmIl49bLdcAd3cWgA4=
Received: from DM6PR07CA0104.namprd07.prod.outlook.com (2603:10b6:5:330::30)
 by CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 02:42:57 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:330:cafe::62) by DM6PR07CA0104.outlook.office365.com
 (2603:10b6:5:330::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Wed, 15 Mar 2023 02:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Wed, 15 Mar 2023 02:42:56 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Mar
 2023 21:42:56 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 8.0.0-rc0 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 21:41:42 -0500
Message-ID: <167884810272.1489828.13839404132668350154@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|CH0PR12MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: bca1cad0-6dd0-4b8b-c61f-08db24fefbc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQ1cxLFkyUT/l/7h8DroaliuVGTrJULrcmxFM9ZOpNp/+ftL0deSnS5AuR/rmKBtjnJptzdCVdAiiapD7MG5VyNpO/jr80oSLYlZaarL/uWkI5GUSTrGYJFKy4iM8bHaJXOGBG9C6pl1LPdEipKBaoNoBO5ciYQ9Crwow47Mtwt1dq+MoLQvr6fwtnt4GOQm+cTBlFymWtkQuxCdjIE10c4tAfulOr55HUFY34CKG0vnRDnCxXoH5FEAMdecUdNwbqH7oFOchFT07/NvXiGtod+mc4iL8yBMeFUiHmruhZ2aVK94Datz63ub/1HJDsdiQr5AwgFHAYTLGVdwERW8He7RlJajaS07RVlcm1yNSyNpxq/XzfF/KxGTFPMiLzNvPVqdRjbOTK6nFNh5PsnUdC+bcExTP4uwNdppEZ4mC3Uw/IBMKKMdDO2/hF6sphX9JJOkHoqCE/ZpxNSfnUiI4jPdSWfit4mQIuo7xc0Yc7YQNK0g2N/BQEgYc1xRiIX0ifautQPeNY1JSgEfiIm6Yh7h6SSwpYQTV6+8BS41kL35r1hyHVaieZjj5jsgXfXO7L6gaN0wHLqhJvWXNLRyup8avtg7ADP1RSNLNSD9iAOgRhxUyRKV9+/2jLcNfUIksRn6+2T4asAaVFAnEi3t0xpFDKAgJkD7bU07FpnjEmC/zewYem70dFqPBptqGhBWpA1RmYrg7TjHOn0YB+cPczdRGXSdjVVdMqWixxtfN1lAQw6GCZKfDx4MeQgNnq5IgPPUZ0eKS8e40R3ocF6QdQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199018)(36840700001)(40470700004)(46966006)(26005)(36756003)(6666004)(82310400005)(966005)(426003)(70586007)(336012)(70206006)(36860700001)(40460700003)(478600001)(81166007)(4326008)(6916009)(8676002)(47076005)(5660300002)(82740400003)(316002)(16526019)(40480700001)(83380400001)(4744005)(86362001)(44832011)(2906002)(186003)(2616005)(41300700001)(8936002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 02:42:56.6677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca1cad0-6dd0-4b8b-c61f-08db24fefbc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5089
Received-SPF: softfail client-ip=40.107.237.80;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
first release candidate for the QEMU 8.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu.org/qemu-8.0.0-rc0.tar.xz
  http://download.qemu.org/qemu-8.0.0-rc0.tar.xz.sig

You can help improve the quality of the QEMU 8.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/8#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/8.0

Please add entries to the ChangeLog for the 8.0 release below:

  http://wiki.qemu.org/ChangeLog/8.0

Thank you to everyone involved!

