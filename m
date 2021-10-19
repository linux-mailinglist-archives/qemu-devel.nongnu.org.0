Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1CC433889
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:40:27 +0200 (CEST)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqHx-00045T-Au
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpxb-0006Vl-JC; Tue, 19 Oct 2021 10:19:23 -0400
Received: from mail-co1nam11on2078.outbound.protection.outlook.com
 ([40.107.220.78]:31111 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpxZ-0007Iv-QI; Tue, 19 Oct 2021 10:19:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu0UFXAKeRyu6Fzg1y0YkXbhgYeI7NI+j8Qek+EB6RXfEfcSB2NuhIsvSM+sQK8kkia2nPVFXllFuDn3VO6XO5/E1oSqDXm0SOb8/6Xe9ULS9RpL3JuDUQP+x67WZX7m+Cr1FXeHzrCUax40d1xyzHQS0b4wnukyoMbu0rGNNsksFhX9R7cWKbjbe1cRfp4Upn2+efwhyyzECaxhmOfb5RtuVEGCuJt162mWr/9b6J835e322GIvTT5camsyw3erLgFqollTyF5edhQdsTELUAgt5rPY9aYYf7rB5lU8V/d5zlZp3C/UxtSg0C2Pz74++tepWILqqAtIpUY1JDo8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qvm+WTZxBklVEpa3EcdNOEoK1luKUzTamkmYTZ0bRTI=;
 b=L8WCzGxQrQs8XAzX04kFx+QixjGsHmdAzmnAC6cGgn8cwjNbUbEbAJT9/UYO+YZW6/wOlRJzJrfBj5uAKhnpbsiFKvGmRcdneWjW/uQaoUdc8R/qFVMO0v1MHhnCF46MV7hOuOsUpQ2g8QltldLSz5sRfMoRGgoPCReWjZOgKx1b4ni69co33vMO3HISQM2+HklqowEiwqO1nZTVfKTdpzkr/Onwp/jak/a7n44G2bcOVW6LsK4YW93PDpkoKL0iGbUOmEGwi8bV91Eq2aFgf2/pM9o2SZA/bxK7hFqVVb4XO7J6X03ACb2XaDy/d0s/sZovKQmbTJ/L6TtEH9TyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=nongnu.org
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qvm+WTZxBklVEpa3EcdNOEoK1luKUzTamkmYTZ0bRTI=;
 b=1wFUYjLRs//hdzWj0iIGYlTQJede16dDCHhClJo3el/mQ8grPhtr5u5m+GxTiSR6kQsnnsRpvmFpfaol5+lpJ0+fR3tZT4+Yks39aLyNnv3uKj2Tnu0NLZ8bq0YlpbfLBotXcnT+S/igj04iJWoOG5Ke/CesZQfQr1IFHqHSMhs=
Received: from BN9PR03CA0185.namprd03.prod.outlook.com (2603:10b6:408:f9::10)
 by DM6PR12MB3273.namprd12.prod.outlook.com (2603:10b6:5:188::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:19:17 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::e9) by BN9PR03CA0185.outlook.office365.com
 (2603:10b6:408:f9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Tue, 19 Oct 2021 14:19:17 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not
 signed) header.d=none;nongnu.org; dmarc=temperror action=none
 header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:19:15 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:19:15 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Peng Liang <liangpeng10@huawei.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH 21/64] runstate: Initialize Error * to NULL
Date: Tue, 19 Oct 2021 09:09:01 -0500
Message-ID: <20211019140944.152419-22-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 39654c23-5816-40c8-9c73-08d9930b6e8e
X-MS-TrafficTypeDiagnostic: DM6PR12MB3273:
X-Microsoft-Antispam-PRVS: <DM6PR12MB32736E57A2017CC5BAF1657995BD9@DM6PR12MB3273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cecWAaXx1VTO4FGTRzuNidC2bb1gFLI0WwChyuHkniWjmjfhev9A/9m7EbFt6YeamA1SpfpoQHAEBOa8L2mHAKcCkFuH4yBJELPMjRo5+rOhGHej5YTLr/Ox6CaTQiKV1eQwUV/GYvUhtrR66MPN7dUIdOIu1Kkfgw2iuoHefn5sYlaNiv6bWqgWXd9zSWQC74vc3vD+QbDnUBwt1s5QGfzdgm1zpEaCtlsyv6hgI5oCK3o4zC0Qb5/tV317hPOa62mIaP6EPEtcKZuzUPpPGCIJKnaa3a+Crv4ZstElB8U5bQ7gwUsyXIZnnm9qfizHQ/zbW+yXBLj0uvyViCb8SP/vyl7AGIuVn5oEfz59ltWnQngP8eR/CBAiQS9Ncz0vnZiKaZPLITsru8OM5ODrVUDn+jVr2YluSP9IC9ky+4uiwVcUZCtBHBzELRMaqZGxBc47GUQwGPKdAxXYuILvb3EZfkofGwjA+6vuK+EbCGk4xhCiUvq296+zNBLhSda/Xt7OzHDee4tCWnPeW+Grwge7ns7eVt0k6vx3ejyDqXZS9uuUdr5bQGB86uA0yIwP1U7XwT6zhdTQ4UCJC8ElCPqKN2tnNRLpRxoyPpcLg5BOOnZHRlQ+nrKE6a2iFyLuPOVpjMpZHNNT2IuIrPPAG/ACSmOaECuALwZGWSQjZGsud7ELSR21xoFIC2ZqBOnKjEruKYn8qJunHbLnLdngFK+DWfiVCSAgwXPS2HNhL7w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(4326008)(86362001)(4744005)(83380400001)(16526019)(81166007)(82310400003)(186003)(36860700001)(6666004)(508600001)(44832011)(8936002)(70586007)(356005)(8676002)(63370400001)(63350400001)(54906003)(426003)(336012)(5660300002)(6916009)(2906002)(316002)(47076005)(70206006)(1076003)(2616005)(36756003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:19:15.7969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39654c23-5816-40c8-9c73-08d9930b6e8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3273
Received-SPF: softfail client-ip=40.107.220.78;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Peng Liang <liangpeng10@huawei.com>

Based on the description of error_setg(), the local variable err in
qemu_init_subsystems() should be initialized to NULL.

Fixes: efd7ab22fb ("vl: extract qemu_init_subsystems")
Cc: qemu-stable@nongnu.org
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
Message-Id: <20210610131729.3906565-1-liangpeng10@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 6e1da3d305499d3907f3c7f6638243e2e09b5085)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 softmmu/runstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index ce8977c6a2..54713100c2 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -746,7 +746,7 @@ static void qemu_run_exit_notifiers(void)
 
 void qemu_init_subsystems(void)
 {
-    Error *err;
+    Error *err = NULL;
 
     os_set_line_buffering();
 
-- 
2.25.1


