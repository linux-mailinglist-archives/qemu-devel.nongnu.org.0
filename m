Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5A433959
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:57:04 +0200 (CEST)
Received: from localhost ([::1]:33878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqY3-00056W-QR
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq6J-0002r5-F5; Tue, 19 Oct 2021 10:28:23 -0400
Received: from mail-dm6nam12on2060.outbound.protection.outlook.com
 ([40.107.243.60]:30344 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq6G-0004md-HZ; Tue, 19 Oct 2021 10:28:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jw5pAnrXc/xc6nEkcabg0II8sFZfUcugkPcLbLkqnmAEeWRf+LRiHlhy+ouLvE++OkJ1Vsf2WTbCp+XFkHM+0ozHMV+4kqkjF4UC8NGC2gaRDEiPYwk1CbSlksAv8cR5Qq5tP/p5cvhIRxeYaTrf39Mru5MGyaU2XN7ZnYcZC6XbWn0N+Zx4NtVsomGmHDzLm+ljksRlL+RjIhFt33991XY+O5Smqp0/8yHmxWuWntX7OifnhUNJ6bRofGQiXXf8CfmzRbCCBaKterSp9rv4ggvVric8xu6t6x9j9GOsqqDXoxoFfCxnx8+qI3Vl+hJ4ycwLbE3nljy1mo8rAiaWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kH8Em2T1K+uwp9kEoXCOmDNDYh6qB48qTJz4MvA4Ok=;
 b=kajy8o+uz3zNuJKtAGAVu7X0HvIt3j6eteMSTmueB66gGSW5IbeZznvhCkSPl62r3diBrUC/GgRSszeolG5XclfbJDybQ4Oj7BugKElt9Dw9lBaV4TFYiAnn/qIl9bDpXgclL8B2oc43e9WzU1aWu4HrDX8lMHbDdnrJfWcm+pf8FhoZZ2xcIe9LfDD5MeWnCki+vjg8uEH60bryfnf57nmRF9DYjOmDVAGdXoNCtUgHbU874tcR+mWRRMgm7P1rE/RNBd3db9x7Nbvfcz5uIdWwdErtMtQdEUE1LPZbwoW+HgMNXe8mP/lUwfH363tJ8GRxM32D/kkpqWbqiYc6Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kH8Em2T1K+uwp9kEoXCOmDNDYh6qB48qTJz4MvA4Ok=;
 b=Ppyj9Pp2dGzb/kySvAHZQUs8VkK1DyymypAfrs8lLyGjA/7uxtl+0CQmXLqJ/vwC+D1nlW8W/8322ahnX/xJTUkLtaEdQrxZgthYL/fTxXBvq1sP6lErUFp0b22yc7sfbWwfKDltc+i3Y/w2HK6urRXJ45I+SXGHQsGLGVTLHBs=
Received: from DM5PR18CA0067.namprd18.prod.outlook.com (2603:10b6:3:22::29) by
 BN9PR12MB5353.namprd12.prod.outlook.com (2603:10b6:408:102::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 14:28:15 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:22:cafe::47) by DM5PR18CA0067.outlook.office365.com
 (2603:10b6:3:22::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:28:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:28:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:28:12 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Pavel Pisa <pisa@cmp.felk.cvut.cz>, Qiang Ning
 <ningqiang1@huawei.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 43/64] hw/net/can: sja1000 fix buff2frame_bas and
 buff2frame_pel when dlc is out of std CAN 8 bytes
Date: Tue, 19 Oct 2021 09:09:23 -0500
Message-ID: <20211019140944.152419-44-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9c9ddf02-2c35-43ef-2542-08d9930cafc3
X-MS-TrafficTypeDiagnostic: BN9PR12MB5353:
X-Microsoft-Antispam-PRVS: <BN9PR12MB53534DAFCF0678827E8D54CE95BD9@BN9PR12MB5353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:203;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dF3z/atBdUJlj3NKm2zKoGNaQvkJZt0GlFbMbdgKIQMHDk0NulxvxE6dDLOZa19enyWvPeMmIJ1+YCJvG9XoLgo72VemHzLM6xhzqsT/+qyAP/gm/LeBdtYU9LGY5lqis2U3AeH1+HYrzfIwI4Ap28PKQCAzzSs2+g3H1QVqdf0D58hS2pkkXlKK4YEjTHjrQerRE6RJd/5S8yheYtmgEDiV9nHXUUwzCJkmhYeZjgBF/hojYCCqipEwJayxdn2iDMvBWWxxSh0c+nZz+HFe4OXy1DwIBEfAmc8/iFZ8tGDL3AIXuuIYOcUxTbFNJmooOo1QeqkP6P/VFVzZ84EAnVJHmt6dvkVU9TNhxJ8AlYIaZUDnyoWwOVjch4RL+5x5hgBGU01Q5hXSXdBUeniq1jGUrz48r6o/tyXI21TTM8n6T4z7EEBAJyCEQxjbjS9DgaBA47M1O0hdBSAhLDOikiSRDGcd8L4QlZiSpd8itYR7gYeQ3YM2pbOZLmztEmgni/J+WSbharHgt+5HhyPa5FftaMHtU6rpiqgW3gD4CuJ0VAhwsEVWyQdgrWfz8CzBD1ysKZpKNVNrcGZ9maMtO3WnYfw+VVQUb/XZzjmDQprBW/RL4EWeO8pOMYZ4Xd0Yc9O/Q4ISIeciJPTQjuE/VanUQf+0gOVWk205U7SyFU51uEqlDwdHeTpBCPB0jHkNUfvXo7XwQfP4zuKifgkfKRSIXk5g0zD80u8jd2Gpg7A=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(5660300002)(356005)(6666004)(44832011)(4326008)(82310400003)(81166007)(336012)(36860700001)(426003)(2906002)(54906003)(508600001)(26005)(316002)(2616005)(36756003)(86362001)(8676002)(70206006)(70586007)(83380400001)(47076005)(16526019)(1076003)(8936002)(6916009)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:28:14.6518 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9ddf02-2c35-43ef-2542-08d9930cafc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5353
Received-SPF: softfail client-ip=40.107.243.60;
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

From: Pavel Pisa <pisa@cmp.felk.cvut.cz>

Problem reported by openEuler fuzz-sig group.

The buff2frame_bas function (hw\net\can\can_sja1000.c)
infoleak(qemu5.x~qemu6.x) or stack-overflow(qemu 4.x).

Reported-by: Qiang Ning <ningqiang1@huawei.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Signed-off-by: Jason Wang <jasowang@redhat.com>
(cherry picked from commit 11744862f27b9ba6488a247d2fd6bb83d9bc3c8d)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/net/can/can_sja1000.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 42d2f99dfb..34eea684ce 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -275,6 +275,10 @@ static void buff2frame_pel(const uint8_t *buff, qemu_can_frame *frame)
     }
     frame->can_dlc = buff[0] & 0x0f;
 
+    if (frame->can_dlc > 8) {
+        frame->can_dlc = 8;
+    }
+
     if (buff[0] & 0x80) { /* Extended */
         frame->can_id |= QEMU_CAN_EFF_FLAG;
         frame->can_id |= buff[1] << 21; /* ID.28~ID.21 */
@@ -311,6 +315,10 @@ static void buff2frame_bas(const uint8_t *buff, qemu_can_frame *frame)
     }
     frame->can_dlc = buff[1] & 0x0f;
 
+    if (frame->can_dlc > 8) {
+        frame->can_dlc = 8;
+    }
+
     for (i = 0; i < frame->can_dlc; i++) {
         frame->data[i] = buff[2 + i];
     }
-- 
2.25.1


