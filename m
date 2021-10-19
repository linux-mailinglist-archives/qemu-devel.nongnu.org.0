Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20757433954
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:55:30 +0200 (CEST)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqWX-0002pI-5R
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpwr-0005fJ-GE; Tue, 19 Oct 2021 10:18:38 -0400
Received: from mail-bn8nam12on2052.outbound.protection.outlook.com
 ([40.107.237.52]:16832 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpwp-0004Kl-Kl; Tue, 19 Oct 2021 10:18:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLXLvt+Qu0WZTHVVyKAVe1GBFzAp9W+6A3XlkK9so8Q8PCRZfWjpeoddMDlvHy1YjV6yPyJuhrG68lcYKtiLo9hNLUv4L2JIkJocl/Nxqv2ewwgYyq8re8RrDbfKKrgV1L/DJFJPSGjKFWaNLSDgQpFh86MekF1aSWjpI6/PJHwDWeqjhaAXtGqZyI931pmSUYIYy9hHB3Heg9UH3SilwRxvkFDLG/fsyg89MkKY0xepJtK/BRdf2auS2fGIZoBRbQ9Zn+uUJKztm8SpLqxYSMsFlsyR+rL1zXBk1HKn+hyOoo1X7oyybwSLJIJ+WoW0I1/JBcTbZNNzPdLYwjpFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaQ0/BBSpxduWqYnTZ27k28+dTANkTw5nOEptjxvD+g=;
 b=JQLkWZQUr0rBKTPLPF1Tfw5unqSlh8ibncTzCCKekT53qFeONlqZn5X1JEWtxfMWPEYvmz0eU9yqoGACm91WXBEWDlFx0pQLe1LUqj8roD04AMsfg4oVkE1DWonCzHQnXqPo8P4GzDb3cVjyzV7bStaQ8/3tRDzc6ozj1VyjHcsGcYvPd7W4YBjmeneM+7NybuQ+E8Y8VyaOYVqxt5Qfb2RL4aq5OXoov0NZOW7Tctd1CLEMxIJs2WLV3V8z1MmzS/3OLTejYoHKreIhqDYJDMI3Cp9wiTFRZq4NTiY/oEgrUS84iXGby9vnOfnfvKsdIilq+UfYTWhQHJlW5rNCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaQ0/BBSpxduWqYnTZ27k28+dTANkTw5nOEptjxvD+g=;
 b=JMeOk6au3yPam0004pG+Z4We9kf1s/a6EHjtcgqQorLE8W2Euaj1t6hGxuEmIFoAyRx6bnZBoicBY2LHuel56WXfDXN7GbrrGvjPvusn2ORuUoSIV+AJvR8lJ+iNjk1/nF65dH7reVo+i8Q+tvULqITdyHBeOE60HLtLlTPl+No=
Received: from BN1PR12CA0019.namprd12.prod.outlook.com (2603:10b6:408:e1::24)
 by BL0PR12MB2530.namprd12.prod.outlook.com (2603:10b6:207:43::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 14:18:32 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::aa) by BN1PR12CA0019.outlook.office365.com
 (2603:10b6:408:e1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:18:32 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:18:31 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 20/64] esp: only set ESP_RSEQ at the start of the select
 sequence
Date: Tue, 19 Oct 2021 09:09:00 -0500
Message-ID: <20211019140944.152419-21-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: dfa417cc-516d-40c7-df0e-08d9930b549c
X-MS-TrafficTypeDiagnostic: BL0PR12MB2530:
X-Microsoft-Antispam-PRVS: <BL0PR12MB253007B48BDF0A69D1C1941295BD9@BL0PR12MB2530.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jsM5G7ZYhYuctPr5CEOCziM/iXfR/gW3xwJYNkP/biygrXu854z04C85YkQCfdVV4wLpxUESG/5UYSXv7SgqOE7a3vXjgLGAR7fN/xz16Ou6C6LdL4j/KACFMlpxvP9SCl809Y3oPjWuvaqyMZShL0Z8SBNMHDMYw2r5AKeJWJ14ygYqieqqrkhvQFPhZwKJG/hxqmy0213zHNcOR3nP90j9ZEb76ORaFWzVTtma83zVddnw/VEujoJiyFvZkKBpZ5AnDpLTHvR4CsbDz9cu8hVfVeMyl/BVpauBL+Q+96MEkpt9Rsn9KCRrkfwhFv4GQN2voisbr1MYzfKYyTLBbWaWPiKEfWkwkwGmFFN7KZzYaLYxInK5u82tL94oeXzfzDJxVnpwpIHYrr2H1bnzlcfqKD2jWXberpXmmNdvEphXhKZOlGZZxtjiWrOzfZMayuax3BbZAITet+DfYgB9n0YP8ocoSU/PIJNgw4zVJ0KVxot17xfAT2Dfw2/mA7Zz0BCZGf3KEH48zybdT0xT/3XfviVo+/ynQ+4bskkr/cgQVbRs6i9ihTbaHJPwaKs5SumKBBVN6iFnV4ypOISsq1hTWGWjpjRxP40kFXBfln7td1jkqEORHCzul6ApkL9Mw4aMWz/6ga+CGMi+Td+WAS1VDGyXs+dH4iDYP2p0sd5pwG0TygsYmQWyzFeFWPV03A1plAr2QI5oIoRhey2CLq6qYYNsiwoSwI8/goUFlR8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36756003)(83380400001)(82310400003)(36860700001)(81166007)(356005)(47076005)(86362001)(1076003)(6666004)(70586007)(2616005)(426003)(44832011)(70206006)(5660300002)(336012)(186003)(8676002)(16526019)(8936002)(4326008)(26005)(54906003)(6916009)(508600001)(316002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:18:32.2706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa417cc-516d-40c7-df0e-08d9930b549c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2530
Received-SPF: softfail client-ip=40.107.237.52;
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

When processing a command to select a target and send a CDB, the ESP device
maintains a sequence step register so that if an error occurs the host can
determine which part of the selection/CDB submission sequence failed.

The old Linux 2.6 driver is really pedantic here: it checks the sequence step
register even if a command succeeds and complains loudly on the console if the
sequence step register doesn't match the expected bus phase and interrupt flags.

This reason this mismatch occurs is because the ESP emulation currently doesn't
update the bus phase until the next TI (Transfer Information) command and so the
cleared sequence step register is considered invalid for the stale bus phase.

Normally this isn't an issue as the host only checks the sequence step register
if an error occurs but the old Linux 2.6 driver does this in several places
causing a large stream of "esp0: STEP_ASEL for tgt 0" messages to appear on the
console during the boot process.

Fix this by not clearing the sequence step register when reading the interrupt
register and clearing the DMA status, so the guest sees a valid sequence step
and bus phase combination at the end of the command phase. No other change is
required since the sequence step register is correctly updated throughout the
selection/CDB submission sequence once one of the select commands is issued.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 1b9e48a5bd ("esp: implement non-DMA transfers in PDMA mode")
Message-Id: <20210518212511.21688-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit af947a3d853a235943681a00f07f3081f5143cc3)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/scsi/esp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 000e45a624..18d4d56392 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -481,7 +481,6 @@ static void esp_dma_done(ESPState *s)
 {
     s->rregs[ESP_RSTAT] |= STAT_TC;
     s->rregs[ESP_RINTR] |= INTR_BS;
-    s->rregs[ESP_RSEQ] = 0;
     s->rregs[ESP_RFLAGS] = 0;
     esp_set_tc(s, 0);
     esp_raise_irq(s);
@@ -917,7 +916,15 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
         val = s->rregs[ESP_RINTR];
         s->rregs[ESP_RINTR] = 0;
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
-        s->rregs[ESP_RSEQ] = SEQ_0;
+        /*
+         * According to the datasheet ESP_RSEQ should be cleared, but as the
+         * emulation currently defers information transfers to the next TI
+         * command leave it for now so that pedantic guests such as the old
+         * Linux 2.6 driver see the correct flags before the next SCSI phase
+         * transition.
+         *
+         * s->rregs[ESP_RSEQ] = SEQ_0;
+         */
         esp_lower_irq(s);
         break;
     case ESP_TCHI:
-- 
2.25.1


