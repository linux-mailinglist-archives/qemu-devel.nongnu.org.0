Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E569433867
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:29:03 +0200 (CEST)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcq6w-0002AL-7r
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpvU-0002Fo-7v; Tue, 19 Oct 2021 10:17:12 -0400
Received: from mail-dm6nam12on2050.outbound.protection.outlook.com
 ([40.107.243.50]:52064 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpvR-0002i9-6T; Tue, 19 Oct 2021 10:17:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miK/QNaJANum0BtxRS7qvwVcw6HGqIHoX4nHM/eg7ezFHS2YRBI0XKXhCaBTzs5vuWYPB7/mxYk+JmBjYpjFI0oiP/L6adLgYZJdAUxxhZmh15K9k4XwJm3gWx+o65jvSEC+u34AItf5uzDPCJdKlT4mYW6Z2cycUZyvymhSUjJInrZvKuyUsh9youFXtkNBJtFNXjPKdeqpxxa9qJzMxti+DtXh5PDXaY7YbROrywxhuhUQPW8L7oL5bFLyoAkb0C+1m9QK18BGg3qjbbrruQ/pjv+ckYd4P7ZpmC3f7cImhYzBHAJp4f5ZXDSTdkuKBPrLqiRyU4KkHCK6S/WBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN/8C9/co98L5Ube2j+iRDc/uFKYem4+llU8MT754sk=;
 b=BrTmSbScKN+YYXp9YAPmDhnUs5JUe0BCzwa8fyGssuY2A0k6pRROWYyGDvbqCeeHBvD1H8EsFJESwya/8tH8AislepxI314fXgZYlbMW06Ze5s5hbrRVCrQovbUwide4z36xN5/Ig/UCXDDa7jbDF1gZtH7WhDd7WBm9k4KT16uIlWe892JYTRpBoj9OW3v7zdQiYxYZMU07sTLraQT5Wkpk0WPpPWnKYbFsoMPPWj/er203W5ks9Lohseg6IbsHTMu6QhIU+5NSrkGja83BkFqWjvzeE4WolMWMc3b69lXKyffIvAmcsC2KwYxYNcXsOQfV/nW23xtwqCAIhZ8dRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN/8C9/co98L5Ube2j+iRDc/uFKYem4+llU8MT754sk=;
 b=aL8Ej4PLQnEGPUkkOp//Ub3Ep93Yk5D3jud7RKFXhqPpEpt8bI7EMkMjaQGUThGOJHejqunWYU0/C5oz7xoloplDaqRLtfYJOz+6o3L8wsFMYvdP71RT98cdyuUUZ0wb0qfBSZarx4xfLhAeEx7KtdTWeQMLxH1xqGVgcdDkaPs=
Received: from BN8PR03CA0015.namprd03.prod.outlook.com (2603:10b6:408:94::28)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:17:06 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::65) by BN8PR03CA0015.outlook.office365.com
 (2603:10b6:408:94::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:17:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:17:04 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:17:03 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, Yanhui Ma
 <yama@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH 16/64] hmp: Fix loadvm to resume the VM on success instead of
 failure
Date: Tue, 19 Oct 2021 09:08:56 -0500
Message-ID: <20211019140944.152419-17-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72ac4018-5e6f-4c5a-c506-08d9930b206a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4415:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4415292F888B584F8BDF31F695BD9@SA0PR12MB4415.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4FRWPb6R9WxjB+bBfIBMP+pzxh3w+epOPOk94148qxPXuRJo6WMviUFjMI2drIrw/BFN6WdCNWleaDC43MimeL7MJuSsfUAgaaCFLyqpM2R54j05uTE7lKgZkH2NQiO3/8LXdA51lasH/3BeDo2+atlV2Gv7NIpi2YQlv8nN9HBpTL9CJ6hd+wESiTIPt+MS6v39KDIG3BdPbr8QK05qO1cF+oEUQ2KESa8w50zg01LLmVdIxr+w5Vx44SX9tnq5sCdfXxzd1xVA1zjZmWaz16tci7STmOSG6Mrax9YbGo5H1aH6+WIIZnodh+7cNZ3jFZYZAC/HsUfhwcuj357CH7rY1CovDmiqn88rEkDOg8oKMuq4Xrzsef/wEt7/kij5dAtjw5BxyvhI+HLt+UCSVVgHV2FmCTjZDL6uhrKcPpy/0dTeQEvl0aiD9msJULbZjr7wq5zErA3w/XC5+oZvMkRqnK2Xy8CIy2QtuykzGZrdbjI4OE4msWv9KITuO7VKL5T3s8SXXuvjo67AJ+TsQFhEYUeGMNr5wUlDOJd0QMMbUlpZM0WFr7//AEn5f3C4XLWOmnbE+5yvNaeBjP0aghWYiOASiyUTzdDWnedEvJqqdKXp84qwbbtA81StMXkRMHQnw/+h9a7FNt360pqcOuyEr/OtIViN62+fBH/LH83T+m05CsJqy+2iI00zADoOwD/qdBBLPrguqKYB8eD2BSlsXw933xKgWblf/BWebtk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(86362001)(426003)(70206006)(36756003)(6916009)(82310400003)(2616005)(26005)(316002)(16526019)(81166007)(4326008)(1076003)(2906002)(8936002)(36860700001)(47076005)(186003)(356005)(70586007)(83380400001)(6666004)(5660300002)(508600001)(8676002)(54906003)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:17:04.6987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ac4018-5e6f-4c5a-c506-08d9930b206a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415
Received-SPF: softfail client-ip=40.107.243.50;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

From: Kevin Wolf <kwolf@redhat.com>

Commit f61fe11aa6f broke hmp_loadvm() by adding an incorrect negation
when converting from 0/-errno return values to a bool value. The result
is that loadvm resumes the VM now if it failed and keeps it stopped if
it failed. Fix it to restore the old behaviour and do it the other way
around.

Fixes: f61fe11aa6f7f8f0ffe4ddaa56a8108f3ab57854
Cc: qemu-stable@nongnu.org
Reported-by: Yanhui Ma <yama@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210511163151.45167-1-kwolf@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
(cherry picked from commit c53cd04e70641fdf9410aac40c617d074047b3e1)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0ad5b77477..cc15d9b6ee 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1133,7 +1133,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict)
 
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    if (!load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
+    if (load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
         vm_start();
     }
     hmp_handle_error(mon, err);
-- 
2.25.1


