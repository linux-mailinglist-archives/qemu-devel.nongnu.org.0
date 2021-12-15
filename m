Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D303474EEE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:13:26 +0100 (CET)
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHvB-000471-L7
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHnL-00020B-6z; Tue, 14 Dec 2021 19:05:24 -0500
Received: from mail-bn8nam12on2081.outbound.protection.outlook.com
 ([40.107.237.81]:16743 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHnF-0004qs-Di; Tue, 14 Dec 2021 19:05:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pklm5/wBi1r0N16OmTi5wZejhTmQi7G859sZCE1sBKGpc3nF3EwPY0ORSeglV2AU+4dkwdNz/Ut0NYW0/auGaUTuxPcZzL4Rtw/S3vx32GVrKz4c49pkVfOS28RTw4xjdyWqmpvxcI1ps08csaAz6+Hj5x5ZT4r4tH1KfSNyGD4TND5jsGn7B0AfbYq/c72+bNO5banYACu8VFUDgmVsSjA9pfbf8onyFj9f6s8LjVDMkLn7UkKIswUUbMbSc6gu1pSFdPuOLmeI+eehTvwvnS3QgyrG0IB+5lsVecFs7/mRlJvl5sRtV63MxXPugXPoS/fRUISU5t376Ve/8RXDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeaOXCnm9IgN1WtX3R7sq3RUXWdT/zLa7akmq3V8HnY=;
 b=dnQBiTCdgL8NrQpp6E9FPWKT4yQFMv08PSwQgw0nF/JkGEYw3KAbzzeQVQSyQoD670q9T11bYYqhCosRX5iGzYAek2ECotxHQO9aKA7/o9diVAo4Q3G2wM9HfMJLpbVOi5jCYQ1EqcDLJAr88zyj4rYmkKQe5cg42AHb3oop+pIgCBZOya/knN4RHzXxW4elU1dk3MjAX8wUxWexeF0EQuonTptIfknmRbDZJqEkvKgX2WRmGdM9LgSyITNrIEHmzDFa1+ovcQm6M5AffSehYFLlk5/oJ8CHbrvolG4oXCaGpeKokcibzTFq9Ej7D1maeGgIOpLlw0v/hVgA1Pn8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeaOXCnm9IgN1WtX3R7sq3RUXWdT/zLa7akmq3V8HnY=;
 b=ttnZ+xJTc/5uzJBIhT94ICVv9EpK7PIPm9kmiiNqNJN0GsQ4Cr52IX/k3vGJ4RU0zH9fMiBCQ8d6fayy45aA6Ek7e1pi+CMLIW2RURnMNdOn/gwmjlalxqwN/2Do97xzLsLmWnmIYewrOHc/40B0ID4lzihcvjuwMcV+V1yiukk=
Received: from MW4PR03CA0040.namprd03.prod.outlook.com (2603:10b6:303:8e::15)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 00:05:08 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::e5) by MW4PR03CA0040.outlook.office365.com
 (2603:10b6:303:8e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15 via Frontend
 Transport; Wed, 15 Dec 2021 00:05:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:05:08 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:05:07 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 13/47] plugins/execlog: removed unintended "s" at the end of
 log lines.
Date: Tue, 14 Dec 2021 18:00:51 -0600
Message-ID: <20211215000125.378126-14-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6444326d-ac21-4420-fa7e-08d9bf5e8e29
X-MS-TrafficTypeDiagnostic: BY5PR12MB4210:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4210F203054D93A442F690C295769@BY5PR12MB4210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:41;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FWy5oQwQhpwhGc3e/exN1Hfr01wkfYqRbn4s/gC3jLA4S87B9k7LRkE4qiC9tWpJnv+LWLUWFVnMO4H9OPDvZju0zQ0QvL2xV/zcZJ8MVIDqQOXUoZtDjGjkinEbjEzZUVH7HZr9SbOs2LczRF5TmX50G7R7/wN9IubcvTEGlHDe2+3RzcqTR77nd4Jz+xGI+ERUO0qk2bSKtO1Q5ws7K7MRCLqtnjrRduxWgiVdNIyPkeWCvnMzemxtqlGLDz1VNh1DVC2qvoEyAWOBPMPfx10Yhr1pUsQsIGn0O2OuCw4XaBwJyo9UYyccM4SloZduLPz0ikF8kLvtK2iWYmWD6LHqNx50uyOasxE8AriXscT9ssD7juiZ+Rm7LT1JOc0JPSmdg0Diyqmn8+ku2st3OQ3ltq9T+8+5K9RENS1PoGcDYCFW+8ow9GxxBuV6LRQ9yJDTdf7Vnsi3+5VQQHhzSA84UHwt5jMoeJVVL+Fj4AFiJohEqpkqxs1rhegIp++3xRdbI+Ohq8stSqrVpW+qvdagZ7DCWr3M2b38l0SQbjD/X7efpbmO68cSqaEiZ/oI7gfSgeys1LAWyJA1hc+UEBfzG7SqUyDe9zbgy4VLHZESCr/XX2CqYd9z4GTm5PAkWcfIqCsSTN1OtW2dlh1uoN2oFlYHV6011mc2T//b/Ok4rAm48WKQbbEuKCqG80AmEBRYr7u/i55dx3VTZk2Sh+sd4TLZ7wiRYmMvxJ2t9KBJKtI8wh04uzK8V52WFd/lgTrl4i07PiiCWS1DGHuQR3G5SX9uGsd3qk25mYm31vg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(36860700001)(5660300002)(4326008)(508600001)(8676002)(47076005)(316002)(4744005)(44832011)(81166007)(2616005)(6666004)(66574015)(70586007)(426003)(1076003)(26005)(336012)(16526019)(186003)(40460700001)(36756003)(54906003)(83380400001)(8936002)(2906002)(70206006)(6916009)(86362001)(356005)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:05:08.1045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6444326d-ac21-4420-fa7e-08d9bf5e8e29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210
Received-SPF: softfail client-ip=40.107.237.81;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210803151428.125323-1-ma.mandourr@gmail.com>
Message-Id: <20210806141015.2487502-2-alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
(cherry picked from commit b40310616d2bd550279dd22b05483c3c613a00ff)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 contrib/plugins/execlog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 2de9f0d7d4..a5275dcc15 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -67,7 +67,7 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
     /* Print previous instruction in cache */
     if (s->len) {
         qemu_plugin_outs(s->str);
-        qemu_plugin_outs("s\n");
+        qemu_plugin_outs("\n");
     }
 
     /* Store new instruction in cache */
-- 
2.25.1


