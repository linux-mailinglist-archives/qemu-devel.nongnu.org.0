Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DBA433A96
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:34:34 +0200 (CEST)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcr8L-0001vm-OY
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq8m-0006K3-Pd; Tue, 19 Oct 2021 10:30:56 -0400
Received: from mail-dm6nam10on2085.outbound.protection.outlook.com
 ([40.107.93.85]:29921 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq8f-0000OQ-Qr; Tue, 19 Oct 2021 10:30:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPFqi692ZyMADkIB4Jio9aKRKlPWJEmwz/ExOJnzvUXCM0gmTkKjG+2FT9cRBar1sQp9pe2/FMA+ACTShCrYQ7dkt2sZ6NZE1lZ2Z729cU9BI+KYWfzgs66ru1of2t2/u1P4jDFFdvi/dYD410MaC62q49Tyrw+04GPuVYjPjDEubjHwQ5PHVQUtioaurRawWnj43vpoQDuyH91HxK6I4InRPHs7XrLKEwKx5EbXc9Q678ZjFH2GTYNFSmHxDsXDuNZzjQuoeHNZlRfFmYTlkq2JQapCpZ0TiZJ9t/EoscGZwQqBXdJcELvy0hN+RgvD7/9BNW2DjkjmMlaysHcgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZIrhaFdJZdSx7RYkqBvhwTlOz2n+Yw5GTHhzt5OxCs=;
 b=RQaFbFJfPY7M6hUZ0csiifLpAPV9ox+p/763L0r9fdhQSFQx/j3fScl9PSWwpw4vGyCOQh4xPilROIdR+n+qEe2lWwU9RUnOrqtW0XNC/dadG7gd+VWqUEPaoYjdtwLwb/8+iuftL32l/sllpb64b1UndROzkSLmRZumFjMiI/ceSqPllSpfBefdOT3/wDrNsCYlX3IzUJYa2VOzpxW7EKSgtQMPGMaaRhNR28AgyrYfpcsYM8PkBG4/Y0A2m4J5FX1P8QWkF770o1n6ZUsRFdEAjXbcKzlo9y0rW47dck49uYO/jVvEnK1iwZ/ON7lcr+wsN4ZXjtqfgBKU1Y/e8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZIrhaFdJZdSx7RYkqBvhwTlOz2n+Yw5GTHhzt5OxCs=;
 b=Iu2NIGi7ZxSy0Qt3mA2ouWvatq2vFCRcQLD26Z8cklxt2DQIfJuu2iOBjKrG5YbQG+qKqCkiOkg/fRbzeRrmuGUYNa9BHSNlc9sEleGF/I5hdrThzlBGWmxyMI/2Sbze55r6J/FoDFULY1uwg/gIZRViAxLw18b00YrXrbn+6pk=
Received: from DS7PR03CA0228.namprd03.prod.outlook.com (2603:10b6:5:3ba::23)
 by BL1PR12MB5336.namprd12.prod.outlook.com (2603:10b6:208:314::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:30:46 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::18) by DS7PR03CA0228.outlook.office365.com
 (2603:10b6:5:3ba::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:30:46 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:30:45 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 50/64] hmp: Unbreak "change vnc"
Date: Tue, 19 Oct 2021 09:09:30 -0500
Message-ID: <20211019140944.152419-51-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3e336e1-671d-4b50-5d6d-08d9930d0a07
X-MS-TrafficTypeDiagnostic: BL1PR12MB5336:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53365559E768638819FAC0D995BD9@BL1PR12MB5336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5Up6rV6Z5XSpYocj5wfEDKeDhj7gFjTjP/lxy5MnaUCzz9QcpZpteaAygl3rv69ANJvomedKt1/c83hzV0eZJw8smn+YuuTzjBHJCLpNbYI+g7jXxcn07wzOK+613VNZi5F2gGJmALR+wtE3vjTelhBJfi9Q5bAfEfjoG5UmGeW9fNGU+JuRAZ02GMDfBKS1IDsy4zerOY7FLjc66MzhcW8kH0wKIDFTmVQIqq2J0RuYud909vWXz6TX71ZOTncxaxLSLT8GWh+haBQAGAQ0FTWcyFEZU0heyhkpZBgIVfRKPM5QfEqLd1QVfFfbGkNkVwU1xUDVDTZWxLOhahioZIg8rMMCBjm9Bh+iGi/B6B5o/lhLE57szIHEJENvoql+3jqKFlaBU16xeKQQceq1Vd3vSv2KXHEJzwnk6+K14jSGTr684Eb1NMMpP3ZRjUW+JkXve/Nqh02uMHSYhJ/YklxsQcWOdwYKsRuHfvkPQxd//nvSXvEbQcGWaSWhYM79avt0y9lNucmL9T8dasUHAQxCqsdNEBFM4mcOizbpMcuCvj7AUSHtVMPshA2v1t84JQpgUhSfpcrrFNKucYV0jZ28zHEpy+RbRQJ3cPOSEzbV9t4VvxZqVEN2w2sfdqM0NKXHqH8oHkFpp83UwrOIE4V8Gt5PoEA4u9i6/cB/VyGKV3B+X/EOpNmDx2Dd7EcezkEJtNZqJPJX6r1+XpdVpj3GYuH14+vh4+ay2ohVUs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(44832011)(86362001)(6666004)(70586007)(70206006)(47076005)(81166007)(8936002)(426003)(26005)(16526019)(8676002)(36756003)(186003)(508600001)(356005)(2616005)(54906003)(6916009)(36860700001)(82310400003)(336012)(4326008)(316002)(5660300002)(2906002)(1076003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:30:46.0939 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e336e1-671d-4b50-5d6d-08d9930d0a07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5336
Received-SPF: softfail client-ip=40.107.93.85;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

From: Markus Armbruster <armbru@redhat.com>

HMP command "change vnc" can take the password as argument, or prompt
for it:

    (qemu) change vnc password 123
    (qemu) change vnc password
    Password: ***
    (qemu)

This regressed in commit cfb5387a1d "hmp: remove "change vnc TARGET"
command", v6.0.0.

    (qemu) change vnc passwd 123
    Password: ***
    (qemu) change vnc passwd
    (qemu)

The latter passes NULL to qmp_change_vnc_password(), which is a no-no.
Looks like it puts the display into "password required, but none set"
state.

The logic error is easy to miss in review, but testing should've
caught it.

Fix the obvious way.

Fixes: cfb5387a1de2acda23fb5c97d2378b9e7ddf8025
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210909081219.308065-2-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
(cherry picked from commit 6193344f9337f8b76cd44ce94a32c9900d907d35)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index cc15d9b6ee..384cd186fa 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1492,7 +1492,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
         }
         if (strcmp(target, "passwd") == 0 ||
             strcmp(target, "password") == 0) {
-            if (arg) {
+            if (!arg) {
                 MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
                 monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
                 return;
-- 
2.25.1


