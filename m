Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E23433A99
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:34:47 +0200 (CEST)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcr8X-00026j-JA
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqB9-0001ef-F6; Tue, 19 Oct 2021 10:33:24 -0400
Received: from mail-co1nam11on2079.outbound.protection.outlook.com
 ([40.107.220.79]:62944 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqB7-0005Op-Pp; Tue, 19 Oct 2021 10:33:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVh/F+kEAVpxGARfuVlWlq/qaGif8AR0U9370Y3F2oxUzsDFzURvH+Ooe3WxHByhBHXB+6TS44yUXRY0hhWu3M1G9vR/DCkOt67r2CUQlKy+vrxzY+mgw/+G9FRo4IxmILy/F9TluTilIL395w35n9yWhBWTlq+qhbxxNjTCQeZ8tUhTVmIpFECOr394AObrsplcYtxVUlZWtZDejo0VvMjc4RiHtpz24t0C/FLPqBZK0YnTy/pMaWODBzutxMpiCmh80WDmcPgz4pzH8ZawMMsc07VI0Js6t5fNxDdO2fhrL0D2P0Ae7/s6OVZGoCk/UYwgnF3qSgMW1jEg8n7KFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHTGhcaBr1JTWcO91JNLF8gFezP5d8kMASZci+5OfOc=;
 b=G61KRM/IhnzWIownKFZn+Hfgazj+7QI4jMU8Ab6mkrCX364/GuY/t12HSAEbQNHK5z1QH5nepeq7gdQKJtz22oKPdyqtBNiKphkkSjsCNaDTgVYaJu135WetaSWwyGXh7U83+dtLw9t4aHuWinPl5S9tEQL7lyK85I0zciX0Mwy0ts44C0vz2Qdkhdhv+3Dl86ZeAzUibDjuZykaIYeJVV8j4yVQTkb14v+nVP8RPd1BHARaBvGEuaACY0Bs8cb6l5DHKlu/xXFH7fqq7lraIHB2A3D/kyOnkx4Pg2d5H2Ew9XXdvm53IwMINvwGVlo8DA/MjJv5VkiTyqUSoF/79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHTGhcaBr1JTWcO91JNLF8gFezP5d8kMASZci+5OfOc=;
 b=3XrQr7AGdc18lsam+3s/bdfEzfoGfqIl7tN1Mfd3dCUIZnkdzKaEeAhF+iHtOAhfzjrbMDiYpcEqseFTWnE2C0B9kW6yugj4DJsO26wXmi/DRAy1IQjtpjRFPaOkxeUW1bfA8Zde9+xoDN5re2cKF1jxdhhokKz33H4w/A5/gNY=
Received: from DM5PR16CA0001.namprd16.prod.outlook.com (2603:10b6:3:c0::11) by
 DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:33:18 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::8e) by DM5PR16CA0001.outlook.office365.com
 (2603:10b6:3:c0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:33:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:33:17 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:33:17 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Li Qiang <liq3ea@163.com>, Prasad J Pandit
 <pjp@fedoraproject.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 56/64] vhost-user-gpu: fix resource leak in
 'vg_resource_create_2d' (CVE-2021-3544)
Date: Tue, 19 Oct 2021 09:09:36 -0500
Message-ID: <20211019140944.152419-57-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3476bc28-2688-4720-c110-08d9930d648f
X-MS-TrafficTypeDiagnostic: DM4PR12MB5182:
X-Microsoft-Antispam-PRVS: <DM4PR12MB518271872062BD26C67DC43B95BD9@DM4PR12MB5182.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMS1UkohUoyh/Fp2XWUhECHyjDhApmsexShl0JGg42NXle2ki/BElFjpKmrza9EQAGMASq9rlJF8x20ccUZVtPIzWDNvOU3I2fd0pOIP/AJaDq+tH8iO4BoOMpssoXjQoI91ZBca9dOTmjs7bB8inzxKBVlyE6kxzH2Dq4R6Vv2p6ISACAwTzljSyq+ljnHs+bMIx7/dYQypaJ0Tss9nc/qg5CiiYTguER+OJRJoA5NkJFwjblmSutqkc1F6zcd8DlY1bE53c8D40qSsC3PQMf96T84BYTzqrFuaEL1mwa0zp+HTHMT6+C8UQ9R1J9H2E7vbR+z6nL8hdHkKu92hclqHMW0wt5lGsEZw4ceGVFqMNpAT0o5CLAAEuFVnItyOmixI/IsavLRrqZNKw9/XZpOt9nC8ry9FNNDfTJRAcRNRho2+KSaakTc1gV6KZmKi46g+6ipU2qPPVn6ZosJ1ozRLPbB4DpVHhr9hwFrJhq/OFuEw5WIN0BiRKyrVSYtKC3IplPihPKwyUcICRPXotu+nGL6fLuTwIAA9LV8uyAJ/QamYA0NzJE5HNUFGxYeoEumRxrGhXcllJqtNEA56rrx6E8Nr4hV/Upr+uSJG/wkTioPzrZc4Cj8nKd3j6/mtUAnbLacUwe8c3pemsReOwJvzvKmdeQDIp8d4/oGNWtmJF4Ccc+xfVFBsobnfSuvFt/LdpFYA+d3AhozlkB3YHqU5I83plopYfqYhrMjfc3s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(26005)(54906003)(5660300002)(8936002)(2906002)(6916009)(82310400003)(36756003)(86362001)(4326008)(316002)(83380400001)(336012)(81166007)(47076005)(8676002)(426003)(70206006)(70586007)(36860700001)(6666004)(16526019)(44832011)(2616005)(186003)(508600001)(356005)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:33:17.9886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3476bc28-2688-4720-c110-08d9930d648f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5182
Received-SPF: softfail client-ip=40.107.220.79;
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

From: Li Qiang <liq3ea@163.com>

Call 'vugbm_buffer_destroy' in error path to avoid resource leak.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-3-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit 86dd8fac2acc366930a5dc08d3fb1b1e816f4e1e)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index f73f292c9f..b5e153d0d6 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -349,6 +349,7 @@ vg_resource_create_2d(VuGpu *g,
         g_critical("%s: resource creation failed %d %d %d",
                    __func__, c2d.resource_id, c2d.width, c2d.height);
         g_free(res);
+        vugbm_buffer_destroy(&res->buffer);
         cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
         return;
     }
-- 
2.25.1


