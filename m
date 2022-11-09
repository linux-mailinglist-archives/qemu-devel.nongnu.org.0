Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF8262314A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:20:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoiz-0004fv-Ep; Wed, 09 Nov 2022 12:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1osoix-0004fG-8Y
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:18:51 -0500
Received: from mail-dm6nam11on20604.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::604]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1osoik-0005Tn-4J
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:18:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcZoHNv4rLpveG6WYPMLNocpUQ1au3HoKsXBZmKEC+K7Mw1G/YgPZlMS6jwAngNIJ82aoKlQmI3pC1pP7njJGWDK4pwHJrekUzjYRfshS1DUr2YbsyKX2BSA50U63qJ2uv2rXvYYyV6Rb/8YH1MhEILKndAIbd+3nM1tmlzV0MMLHsicZ1WBrr3BUtksnRBv33oEmox05mqf+y0zf/c1cGfa7WV9Zg1Ph33sLauqPzGVxuw3eioUYvXR+152L+740aavHTBLb5MjoIhamBgwFuP5tZwk2I5y/4xwIWuTKvWdO70c0ukTpYd8w+C4UJyFQfuU1YKC96KixRSivQ3P8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9Ev+LyKwfy5Y+ePpAJ3OZmlHz9IZMYMpVFSQX2ouLY=;
 b=gTCx/idJc8FJy1Joj885SKcC9aRuxL68fPaGpxaqL4PO3rfzRVSuH9BAhYao7+ZV9aqi6TEtwsIXnHNEC43oxgg1a3U8wX2HYEtS8zVXFoIgCT7x1rnbNAvCQ2wWcmrPCBOP4q78AYRnQavKneSdPpwDJuxxnf/ctfViYNWmrSYMl1QCHm7HC6fqd6TJK1mVTENIN0xgCI/FzZqCkUmCTSLD1ZhMtlz/xsZb+OnGim9lwpTsq797T9NsiBedMA3WBztiVkxnQ3LECBXFaMq+cFTkJxtQ+23KeSna0IdEiuhPCJCh5m05/60QxZXNqbeVRxutogH28pY5k3AoDuF3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9Ev+LyKwfy5Y+ePpAJ3OZmlHz9IZMYMpVFSQX2ouLY=;
 b=o28K+pPeaOPoJh43jZKdz/1cetRZBP754WhrPIgkyhhOcsIO72/diV60JKkMzb2hbZlHZ6JHWgOioQW6xqXQ7drZWHJCb9WnuL5Ot3KFERahSuPvM8jeiio+up0mpoaTO9r4Z7RJZy1LSmZ0HP7151QiX8SDelTru5UblXIX/rs=
Received: from DS7PR03CA0171.namprd03.prod.outlook.com (2603:10b6:5:3b2::26)
 by PH8PR12MB7159.namprd12.prod.outlook.com (2603:10b6:510:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 17:13:31 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::3d) by DS7PR03CA0171.outlook.office365.com
 (2603:10b6:5:3b2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 17:13:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 17:13:30 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 11:13:30 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 7.2.0-rc0 is now available
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <stefanha@gmail.com>
Date: Wed, 9 Nov 2022 11:12:45 -0600
Message-ID: <166801396551.1184933.14277873527447433168@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT023:EE_|PH8PR12MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 828fd0d6-d854-4d62-63db-08dac275b9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rbqC2CO0rzYmo6PsDTAPEeelqubkDx+BysvfYZRH1BxgV6QaXd5G8eLtnXXaO+adRDksNVQcSxpBjNl7QijyD8eyBPcQfX7iQ16+IR+3E7JcaiOxInhlb/BHSzNbLQgZiX5m4wNO0hAfzUINjcpW0IvbnW7LmDu+bVfyRap7Obt6UsAIKvPKDqKwF7Pu7Mw1oFrhNc6v6xhrJwpQo0ROm3BXBWT7hniXv5dMNUOobvgy1GJuR0A4kLbhPyzI6rpx8ZOl78ySRJe5nT9b2LhqPBNLXoJK8JyXrOx6uMozGtOzZBjgzt/OQxxeMEP+tCIE1BUO9Eb01MI6xysaQgobT4YSu5ZqzX90fPKnqxTWDdWD8qIOaADFHRMtIb6bsBvdbFRnK3DUl9+JR36FgBRFhEfgH66P0lBJkIXJ8tfCUrEEwRxx5ywiIAblkFBQWCYlXj/EVE8KA92xFiqBZceSb6D16CCNrZN3q17ESLed2j02+iy494Kg/hM9AYmrcACUUa7OmnNRizsaDh5OrAkUt3w1QPuyiuVySMck2Mw/OyapeWjdzpjXHvx9nmTX7d5oypK0sayIaL0b/qHmU7quDCQjJ9zlKovzoS/zCE1ANHQZVNRZYyHBB2Co48eDYIs2aok0lkWclvy446pv6NxvUU7croCTWpYwiwy+UPxIQ0iLtxOXLohq7zl0f+XJEU/fVXpopywUmWoJOTRfH+ZNh++7FtPwYTRF8cNjXJY4wv/3sUKcPkEdgkZdPn7yRhzLp2fk6fTKsAAMvFNe/uM1Q7DBiziclD91cDlwDTfHz1HgZq0bTTurkZFYgWlMdszBgLIeLxDOUQkZS+2P+Va33w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(4744005)(70206006)(316002)(6916009)(36756003)(70586007)(82310400005)(4326008)(8676002)(82740400003)(36860700001)(356005)(83380400001)(966005)(478600001)(41300700001)(6666004)(40480700001)(16526019)(81166007)(336012)(186003)(47076005)(8936002)(5660300002)(26005)(44832011)(426003)(2616005)(40460700003)(86362001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 17:13:30.9576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 828fd0d6-d854-4d62-63db-08dac275b9ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7159
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::604;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
first release candidate for the QEMU 7.2 release. This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-7.2.0-rc0.tar.xz
  http://download.qemu-project.org/qemu-7.2.0-rc0.tar.xz.sig

You can help improve the quality of the QEMU 7.2 release by testing this
release and reporting bugs using our GitLab issue tracker:

  https://gitlab.com/qemu-project/qemu/-/milestones/7#tab-issues

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/7.2

Please add entries to the ChangeLog for the 7.2 release below:

  http://wiki.qemu.org/ChangeLog/7.2

Thank you to everyone involved!

