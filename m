Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF24DA8CC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 04:14:05 +0100 (CET)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUK6t-0005Bt-UH
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 23:14:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nUK5D-0004Tw-Kk
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:12:19 -0400
Received: from mail-dm6nam10on2088.outbound.protection.outlook.com
 ([40.107.93.88]:26401 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1nUK5A-0008SA-Fx
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:12:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIrIkmsJQEHPYw7wmeMwdnKJcpk0UC4xKJeOPG4aQrw+mAB4ZA6dBwX49be6pqHCYAnbNBFkz3IU/4e2F0fv/Nhjz5cfiTEZyM6fW1B8WgpiakHziG2Pll5TifU7Qv0/deeSRx9fewPKcRqXbjJradGlNFr1emvI3CbHxEEHvEF69EUAP0aI7Z2tx1Wc5US0ckn7fqOS3nE6RjvbeyeotHn+SbxWdHhCAxazQDuyYp7yxGOzEIAkHuzVtOQ4TNRQ6H6iqqTJxcZgHeqEFS2BpgQaGKDM2kPd7i6X0N6cNOllB9jjbRuX+H+UmX8TAKCSWaMp1GrCAHmip5mhe3FUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZCSuPG25fP3tQJRsRRuxOWkudCkDzTpYXkF4jKl7rM=;
 b=LUGVct+A7V0WPOeUnJxm6Fs9HFXwsARg5au+xhMyi1r9hR+ByMTJ0sAMOm7QLAMuRZcyx2Ze67TD0Rmrp26GOj1Ie0ejfmjZoNdJotajD+/iurPT8H3hTjotsE9lOFtkubkz0S0P+nzCmlmrJDj3a4s1cJ+Q/ec4SgoHB9smzp6bWp9gT8yaIHm4D8ZDn1t3Xvf+GRPJbzhIZiyYd491DmplBqFQGNjfZSM5PZPW099GLxbB9WjxSyqtg6sjwKf8h2OrvFiYGEJW2ruqhFFUr48dPIyCtV/3js6BFhQcYGXtC80S8p0t0ImqRQSQzAZqjljeq53oXSVxJ10eSbiakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZCSuPG25fP3tQJRsRRuxOWkudCkDzTpYXkF4jKl7rM=;
 b=tHELM7n2aLaEOYiYRRV3sOAsVMDGyQk+Rq/NvvxeklESohg5X1hyDPHnc/+yxyRnIkUG2/6D/B/L+wSRW4cs4l+xeKC1FyNnRMw7VHqZyHTf6iRuZEkpUTiCUtM9KSGHVzPHR1mL3vExuZxJ5+iKEa5QQm9hmmLGuD8B3f3nnXM=
Received: from MW4PR03CA0129.namprd03.prod.outlook.com (2603:10b6:303:8c::14)
 by PH7PR12MB5593.namprd12.prod.outlook.com (2603:10b6:510:133::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Wed, 16 Mar
 2022 03:07:11 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::c8) by MW4PR03CA0129.outlook.office365.com
 (2603:10b6:303:8c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28 via Frontend
 Transport; Wed, 16 Mar 2022 03:07:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Wed, 16 Mar 2022 03:07:10 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 15 Mar
 2022 22:07:08 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.0.0-rc0 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 22:06:51 -0500
Message-ID: <164740001134.10934.8549007364327416795@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c567073d-de4e-453d-c6e9-08da06fa0fcb
X-MS-TrafficTypeDiagnostic: PH7PR12MB5593:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB55939F659517E8670284522D95119@PH7PR12MB5593.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJrdmcycfKyrHMZHwvWnuoKOk8WAjxVkKShIRPCDZKGc/MDJqk+QyffujQZPJbu7adlexLNy746nNwLZhXP8giDTiEfZzZvpU6hIFXbmU1dI9jNcUeUGLvogOZINZEFIqMmcZ0UFum4BF9AL2QZY6qdy0StDmxxRSn04glD3Xi76YtdSdHfObBpEmCbchAh8CEpoKAkxu9CMEuJcX0XusX5Qv6bAaOnLB/3FM7K9LapQUeepe5JTyz55su5rPitwNbO9YNFp4p7r28I6PRrXwLhP6enN4hc46+UWvtaKUFDRfpPspG/svmWwuQAL1Sap4WmO2wXMiO7kXv9MWCfDUigHROPFM9RS9oruqILj3f6LFdEOWcwi99y8PWm1k9rt11pfjFEYEQxRQwv7A5NAxrF59B8J9Q/lkRc4C2pr8h9jpRCdFQt0OfjBX+5Nvfx4rPeTGOy9k9KsJLC3dI04ACUSbqsPwtZQnjlBX53BWwAQ5W1zxB583iPXPsYufaCQCtcZY5ZLM/jjJjhNyI5iFeH+JXNhZr1DOOWHaKZR+KVRnb4GBJuXu6Y7grxV3jtYZ97ScjsjM5+Hoc4PAyiyVSmA6pf9TXYNF6TD53mdur5AGIRb+63oJwG8RDp/ScIEBL3Z+LAQ4rSwqyF4jFTX3/EQuUSB2xhdjA0C57kJSKuuWL3AdExsnrUks/fKZKibsfLVEg9yb53eaiwn6p8FsLw2zP6cImV3/AIYah3BcSk0rCoSLmDplL8RhYP5WXgcGOt3Qz/BoMIh+f8OLfsHWtv4rTnr890YxE5xvKtxdHs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(44832011)(36756003)(16526019)(8676002)(8936002)(186003)(2906002)(26005)(2616005)(336012)(83380400001)(5660300002)(426003)(508600001)(6666004)(70586007)(4326008)(70206006)(47076005)(81166007)(356005)(86362001)(36860700001)(966005)(40460700003)(316002)(4744005)(6916009)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 03:07:10.1075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c567073d-de4e-453d-c6e9-08da06fa0fcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5593
Received-SPF: softfail client-ip=40.107.93.88;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
first release candidate for the QEMU 7.0 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.0.0-rc0.tar.xz
  http://download.qemu-project.org/qemu-7.0.0-rc0.tar.xz.sig

You can help improve the quality of the QEMU 7.0 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.0

Please add entries to the ChangeLog for the 7.0 release below:

  http://wiki.qemu.org/ChangeLog/7.0

Thank you to everyone involved!

