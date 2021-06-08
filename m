Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356073A040F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:25:50 +0200 (CEST)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhMD-0002t6-8T
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lqhKT-0001fn-Vv
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:24:02 -0400
Received: from mail-dm6nam12on2059.outbound.protection.outlook.com
 ([40.107.243.59]:25503 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lqhKQ-0004uT-Ix
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:24:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emto2GdBhB5Tx5fuMANIBmDxk3vKeVrZjADv91F7hKYkAp/zYIAafLB1jxvriox/io7rAHWu5tFrQiRXBrOgyfmhKk+RqShA5i8slsjZlq8uzUvpjLmsZW8Oag8XBG2jj99hBa2SwrcpHTdqeruBUvdpIrHIe4oYJx/emOGFM+W4/FPDXf1wi4kfVinZBfHQfF5zWnp7yqSvECW2Llvprlce2Hpbv2KcZt8WhJuse3ucwfsotktk7JJry4UPU+7c9gaqohUZiztOPkuSeCc8WZfXNTu4fAkuuXoRDdL+Ij0CdPv0RphBImnjaNeDYi6iN6NxWiq6fRLLqhnjl2T/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzEme3giCpexzeyGhJ5zZhTNaWQ/blLTzszOic5RX2k=;
 b=BjBUFAUJbjXDO1Bals9tfcOxk2rwQaAT6rcUFhEYjHh3PqY6WVsXqVm1d9KCyqwJQK4tz47PlX3FtgfUh19N6ieM1CR7YW6cgBJrIleeIpqMLlBlGeYy7IgVjz8H09J2VIyUHPY6/pRm8nDLkj8lEl8PHoJgcKrrg1n2goHAVWueNqSBKuGAKVdZoBiGIFkE+q1mynoBDO7W0KVSr6J5diWwTgsFV7HQ2pD1lVAUw9TrpsHtUCO4giHhbXBk3SszYd2/fTlWih8Lf4LsVGSLyrS68UVZFU11MhXL+i4M6/FGy/3Gszu1ps+EaA6SzGh3byG+OuuNFkPg723LDfmQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzEme3giCpexzeyGhJ5zZhTNaWQ/blLTzszOic5RX2k=;
 b=Zl8ZUnhtVf7WE5UG7L0uhqeIJOtlOwVAqIOo9x7IyAzRDzT1XPtUgBPo9R7h2+2kOhpwrjh1a0LkwxAGlTjckuJkeiBVn2tcJgT1+jiuUP46Q5CDz8giBLlQ/pVarQtcxINTv+5CyeSwbdzPIgstEuHNXDCiKkv5P5ApQeVHGWgoVFosoM4xfZNmrXhq2a1m3P2sPcI0VR4KCBLtyUaFPJKxn1TQlbjvsa5KEQU1IHKqeq+n31HP7yU7C1dq1pUBupCd5ruoqyFg+B9MwRq2URHc63JvzLVfNN/eifPHFulVT4wZgYzuwcmYXrhY84nErY71pC06DX1IWLE2HLhYBQ==
Received: from BN9PR03CA0436.namprd03.prod.outlook.com (2603:10b6:408:113::21)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 19:08:50 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::2e) by BN9PR03CA0436.outlook.office365.com
 (2603:10b6:408:113::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Tue, 8 Jun 2021 19:08:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 19:08:50 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 19:08:50 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 19:08:49 +0000
Received: from kwankhede-dev.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 19:08:47 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v1 1/1] vfio/migration: Correct device state from vmstate
 change for savevm case.
Date: Wed, 9 Jun 2021 00:07:21 +0530
Message-ID: <1623177441-27496-1-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a84a8b-e166-4f50-a18c-08d92ab0d9c8
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-Microsoft-Antispam-PRVS: <BL0PR12MB245164764391510ACFC7B4F6DC379@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2031ir+FGBnkY4RFQzdnJviPT4/xdNBl11k84/zaDrOxmv25vr+qxkXupUgqT3F86NIbEpUgrRUKDSXyZ13xKCHACgFfP8g36scgbBFH+dRReX9vy/1AYY61iCYuIbL9YXo3xWRcv8oUTeSsNWZRpjnT8A8FAoDuSHusmqwBy3ggXgJx43cUCIkQUvpEZj1d9hWku2n/YpMS1Qco1CZ58kdB7f3Vb16oW9JcFlen9o+B5XAIeSkX4eCxjsbxbwljKPyT3gYk8JGXeJbrZVzvfoY3S6wNdMu2C/oUlGCzLoRAMHayG1TrcpsEKOnKkUfRgzL9TNvxwJ+ThOCrWCMdBmvTLDZNc65RvSv7oAE2Fc7KPzuSFet8pc7yOgeenVSlPL23y0pSj72LDv2WoQfN3PU2mBQFYQmQ4jEKmqN3WIiEaGDN/M1WrZe3DJfo9+V2kJh+C5xJsVuZ4YhZiKy3gIwf/4YDehIF1VnVhgJWhhwEChQcg2Dm3gWnGSpdHrEJo2W8xCo/etz30IXrv1iv0JJQLjhSKHzvPm74FCIXftceVrfmubekQfvtMdO3g03xJ4naV5UIH/zt6bO2o20M/7Eg2OxJB6gzu/3KLIqLAR6mkumPfm6QctUr/vPPLHXushcHoD8q7uvGJIhruYmIQQJoV5Ec77/1QNzJOhx5aU=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(36840700001)(186003)(26005)(36756003)(86362001)(82740400003)(356005)(83380400001)(7636003)(36906005)(82310400003)(110136005)(316002)(54906003)(36860700001)(47076005)(2906002)(336012)(5660300002)(478600001)(2616005)(4326008)(8936002)(107886003)(426003)(70206006)(70586007)(8676002)(7696005)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 19:08:50.4244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a84a8b-e166-4f50-a18c-08d92ab0d9c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
Received-SPF: softfail client-ip=40.107.243.59;
 envelope-from=kwankhede@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: cjia@nvidia.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, dnigam@nvidia.com, targupta@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set _SAVING flag for device state from vmstate change handler when it gets
called from savevm.

Currently State transition savevm/suspend is seen as:
    _RUNNING -> _STOP -> Stop-and-copy -> _STOP

State transition savevm/suspend should be:
    _RUNNING -> Stop-and-copy -> _STOP

State transition from _RUNNING to _STOP occurs from vfio_vmstate_change()
where when vmstate changes from running to !running, _RUNNING flag is reset
but at the same time when vfio_vmstate_change() is called for
RUN_STATE_SAVE_VM, _SAVING bit should be set.

Reported by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 hw/vfio/migration.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 384576cfc051..33242b2313b9 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -725,7 +725,16 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
          * _RUNNING bit
          */
         mask = ~VFIO_DEVICE_STATE_RUNNING;
-        value = 0;
+
+        /*
+         * When VM state transition to stop for savevm command, device should
+         * start saving data.
+         */
+        if (state == RUN_STATE_SAVE_VM) {
+            value = VFIO_DEVICE_STATE_SAVING;
+        } else {
+            value = 0;
+        }
     }
 
     ret = vfio_migration_set_state(vbasedev, mask, value);
-- 
2.7.0


