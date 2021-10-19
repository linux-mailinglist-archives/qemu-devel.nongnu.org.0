Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2AD43394D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:53:13 +0200 (CEST)
Received: from localhost ([::1]:50154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqUK-0005ci-Hz
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpwV-0004ZO-Uu; Tue, 19 Oct 2021 10:18:15 -0400
Received: from mail-co1nam11on2084.outbound.protection.outlook.com
 ([40.107.220.84]:65504 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpwU-0003Oz-3G; Tue, 19 Oct 2021 10:18:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZjS5e5P9YYM3NutgiFTi8o7Pg59SMoHXYXWLFsqeSqx1gvvQ7A9/TE9dH3RUialBpdozUo93Y6PXXIr/lXCzNvCrnroQeF8Etd/hi0TuJcUp2W6yuYPAkQ5D1U1j5+JY7svEP/p+oxQE36yic+cV2+CtfigsKgu0TtQ0BO5DGJ/ovajwEjo91GJNVdQohVaBILyDTgpzwCoVg1vtB7RILcKfNhtGVKxuk71mC53lcwJkpW7DXPPfNxVg7h2Bv4g3frSujPG+KZHvgFFDRUJxkHkkhltuZw+biG0iCAWtpBkCQcA3+864ygw3lUajajtQd+zFdtsNCZ66CB8V0E2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxX+XCVj8u3x0NeUYhSTfYkoc3vQdZ+21NIskXmUjGY=;
 b=fibj+f1khLHrdrO9rHO5vlwk3FOAhAr38OtLxQCJ7Pr9timTzR6a19loiOTyPBL/2vmv5sRH1uOSMEUPulUSuQze3zohkfjbkzpPwE7ofnNsR5KOYPhMS5DSA6Aw7h1kVXOi4+A+MN+tT0LOAA8De+BhscgEQDI4hYMn8MJO0KJU4xOh5OzELlyhkTszBE0uMH5fXjF/6dEATH0kqxV5Pjq45HJshqfbmeZkZYk8rAmlaRBjKwS9kx8//GxgltKEOjcJ54ShJ3tfmG0gc0U9CA9bXNicWsB8S0yw8kRUPPptrfIBbF3jaLnEVcgEEcBuzNsHP0P+d2NQndKMcQGzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxX+XCVj8u3x0NeUYhSTfYkoc3vQdZ+21NIskXmUjGY=;
 b=kCHie/v0rAcThBMQ+F3jgMAbfij6yl+kofRBt5MHbKBePkxa7GYxRMASetho2wwkYfOgV/9qnj3EXVC4BjJVI4IBD6fjXtphxkTiduG6whHYU6t9vzZCEjAOnqZjesLdyLEHB6bvXJy/C527GdoGQhOq9zSd045UvOWaWqVVPbs=
Received: from BN9PR03CA0606.namprd03.prod.outlook.com (2603:10b6:408:106::11)
 by MN2PR12MB4583.namprd12.prod.outlook.com (2603:10b6:208:26e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 14:18:10 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::fb) by BN9PR03CA0606.outlook.office365.com
 (2603:10b6:408:106::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 14:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:18:10 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:18:09 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 19/64] esp: only assert INTR_DC interrupt flag if selection
 fails
Date: Tue, 19 Oct 2021 09:08:59 -0500
Message-ID: <20211019140944.152419-20-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1242a516-1103-43ab-7cf0-08d9930b4798
X-MS-TrafficTypeDiagnostic: MN2PR12MB4583:
X-Microsoft-Antispam-PRVS: <MN2PR12MB458307D9331C214D4C4DFDAC95BD9@MN2PR12MB4583.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:82;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYQwgjFZOgF6Zb+dQdZ5IVyen7vrFvwj/2JgqUfbqxHGTFrzrvh2PYyGxN+vRMn+uXJ8RmcJ+kkOhhD0eWxVeBHA5cEV3JdNx5Txa0Qon9BdwSymmREyiMpFWp81B3GEiEcNmRUtGnr5DUI/raLHtWz3dm/YxfYVEG2fK0LW1FGLjNNOKHhyCsy8Q2gdzbWpDyKab0Lj50mhEfjoQAFbLeIhyIGeD/W39jYEMrhWicKn0x8uju5xdPX3sMfDszpYiStRx2q7OpTn5F0UiXlXW1A7L2RF7szK5L0EK9/m5n3NCKD7qUkUUoWjHyXnjpdp850P/tsnPPAqnLoCB8LCRIrJDSZD4J2Eghq0PRgT7cxnTrlzT9xvFJtYmgCWekjPPqL2KzfuCJmpMXffIHkNcKnjuZOsCNQQjSbVV0Nd+UlHuGgZNfWVrkPGXjN3COYssOaZw2FPtT4LmOdPKhfuSySrFoLdFcJNpI04NQCNI5IkJAY8gKWpybZ0Mk+ARTHdVnBnUgUPG7ixZH8UdGqLCOghibbejIuyAVGHXDEUMEzN9JNsFJG+SB6wFhOLFlb850iNwn/iBNViLDwiGlRRGffhvVHJ2XeLxOZ1lp1JoCMB4ovI2/fhTCOkvmeK64Y/r5tQuoQcY8ADC9q/pf2rttMs+z8FIJa76B9vFhB8PTZ8EI6yWt33Zk5m0kM+LfZgQozWOYlYzIXQvg+a0Kp5A0vd6PPPOQXV4VnoY52Lozw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(356005)(186003)(16526019)(54906003)(26005)(44832011)(70586007)(70206006)(336012)(2616005)(83380400001)(316002)(508600001)(47076005)(81166007)(36860700001)(426003)(5660300002)(4326008)(4744005)(2906002)(8936002)(86362001)(8676002)(6666004)(36756003)(6916009)(82310400003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:18:10.4310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1242a516-1103-43ab-7cf0-08d9930b4798
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4583
Received-SPF: softfail client-ip=40.107.220.84;
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The datasheet sequence tables confirm that when a target selection fails, only
the INTR_DC interrupt flag should be asserted.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: cf47a41e05 ("esp: latch individual bits in ESP_RINTR register")
Message-Id: <20210518212511.21688-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit cf1a7a9b3721544aaa3e43d111eb383c30d71a62)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/scsi/esp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index b668acef82..000e45a624 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -213,7 +213,7 @@ static int esp_select(ESPState *s)
     if (!s->current_dev) {
         /* No such drive */
         s->rregs[ESP_RSTAT] = 0;
-        s->rregs[ESP_RINTR] |= INTR_DC;
+        s->rregs[ESP_RINTR] = INTR_DC;
         s->rregs[ESP_RSEQ] = SEQ_0;
         esp_raise_irq(s);
         return -1;
-- 
2.25.1


