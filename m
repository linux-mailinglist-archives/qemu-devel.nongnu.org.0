Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD13C8EC1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 21:48:52 +0200 (CEST)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ksF-0002V3-VE
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 15:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tianrui-wei@outlook.com>)
 id 1m3kqI-0000FU-QB; Wed, 14 Jul 2021 15:46:50 -0400
Received: from mail-me3aus01olkn2181.outbound.protection.outlook.com
 ([40.92.63.181]:57665 helo=AUS01-ME3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tianrui-wei@outlook.com>)
 id 1m3kqG-00021S-42; Wed, 14 Jul 2021 15:46:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAC+ak2tq3Ej2mD8D/CNt3SZHlzzMUJFm5AWJFU7E6ujXeTfbvPwxW9uTxWMOBZdPARZ8ZMLdWMaWlSMbyXR5GZZj7MTVnqlsICAOQJ9rq6OvBgYE59bEViFj4gWOZEB1dOxR+UAfcG8srOiUnKnt0ltdjcTcPzXVLDZIadXvtb44JiLlygi4uwpV97nMjYKs6zpIyUJHHx3Bl4sPt2xNCDesVptI9Ozr3jYs5pYW0R3Tiw0U3yGzFZ/MST/ULvaSIABoF8IN54YmJtJHb2mDEXCC/PnMLj1AtMCW/2G/gKnYn1kMGRVvjirXWWOJh1YkI35Sflea67mDP7cIu7IcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQGKadhcWWzL1Me5oFZqBSyzOX+yN1qjqYxAgQB/o84=;
 b=bUiGy8olh9fdrMDdNzUzCGMLewhFQd2hQXGvW5YfzWBQy4FH/HcquMj+LZwQ4eKpHlrBJgFMH7EOdLFTHJXGNRGgJlHLgTb47zKKWdq0HeHzf5/4vubvuguz0F/bTwDSiz6hX0G5wvX16e4PX+3rUGni1CDO8URr3XNBowZOZmT0CnGXHKvLnjS2scRAMH02T8CkfKeVVxqUpw3d23xepXwJr53mJXtrsHQavCGT4Xp4RZyKm9JahCAjyI2knLGkQLg/48bGfCVrBSSytqtgjKGGpuBA/RbcRUyoK+fLwqILte0xVDFOLgi4FzVP6V5COSwIrk5ulJWlYGCkV9KLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQGKadhcWWzL1Me5oFZqBSyzOX+yN1qjqYxAgQB/o84=;
 b=C9CKWaY9P7iIKWfwZgbn//vHV1+0NdCKYuWSueZwhr2UW83PtSNE/rsu61T0Sp+VoyFoG6D3d+ZUnV5YQXpkpUQshMFkcJo3vuD7HLChrhTEESO4Z6GP5bjYbtd6O8yIKKUgi5gKCiYVty+pTlX6u5+UbhfyDHpfcQgOu76UBHR/+/dDL7Eot3EEmS5R+pAGWEcx4UpAnzAf1uOuDV9/su1Syax+UZx+MIGx2yCzmWhDcHz0eQ9Am7YGyzIr29SaC0vp2ApxEyN6MmwHc/TSFHXZfKs1HsOlqrGK3u3klRre4lloHiotBTVBziIpAh+NPa14z5dZwAm9A7zlZpMPIA==
Received: from SY4PR01MB6798.ausprd01.prod.outlook.com (2603:10c6:10:137::12)
 by SYBPR01MB4812.ausprd01.prod.outlook.com (2603:10c6:10:5f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 19:46:35 +0000
Received: from SY4PR01MB6798.ausprd01.prod.outlook.com
 ([fe80::a44f:289d:7a25:339b]) by SY4PR01MB6798.ausprd01.prod.outlook.com
 ([fe80::a44f:289d:7a25:339b%4]) with mapi id 15.20.4331.023; Wed, 14 Jul 2021
 19:46:35 +0000
From: Tianrui Wei <tianrui-wei@outlook.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/intc/arm_gicv3: Fix GICv3 redistributor security checking
Date: Thu, 15 Jul 2021 03:46:16 +0800
Message-ID: <SY4PR01MB6798FDE7B97E478254D6B955F6139@SY4PR01MB6798.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [dHh9EQt9tWWHoNPWGQY2mB6E055Y+a5c]
X-ClientProxiedBy: HK0PR03CA0098.apcprd03.prod.outlook.com
 (2603:1096:203:b0::14) To SY4PR01MB6798.ausprd01.prod.outlook.com
 (2603:10c6:10:137::12)
X-Microsoft-Original-Message-ID: <20210714194616.1145207-1-tianrui-wei@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (180.160.46.166) by
 HK0PR03CA0098.apcprd03.prod.outlook.com (2603:1096:203:b0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Wed, 14 Jul 2021 19:46:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da83d54a-b1ff-4785-167a-08d947001672
X-MS-TrafficTypeDiagnostic: SYBPR01MB4812:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pl+UaK9Nx0+iC2GfiVT3NYfKfjwxbmRhDAitFHf2incn/WHsoOniHPPak4e0KIjjqVCryLWfNKoFrIBbVInF+1rTue9fB+NS/1Q910p18k4QyDbtrVPK4fctYckRVQOhVaq+qBF+dz0EK0gFBjN+RGSvr/JXe7BPf5CvANtbsop6j8lmBGWGH03pZgCAmYR0hNw4fdAhKmfBHu+jHSa7uFRPeBXEY7QBS3s+u5nzWqEj6/YWKHu26cwWA3SqPpXlr1ZP8/bGluKHfogvvSBwRYtexh2lsBODV0uefFpjIMiIX84ogWyfyzvOtPzqhXCojBm1dVYXxCh74Oi6QS1WWoQfoDf9TnZffQiSMWyTstRlGnQ0PqaMchgYOd1RcexIoBLmw0jiAgWxA6XK/1s1PdaqAPZ8iMnIC0ifQGFfOYh2w3NS2Xdo86f78oK/Jgdo
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ncou5cGVa276ScpnXBEJF4J8cxPbGYa0wC8X4vXq0F28q17fvKpLYrbFL7NZegEE23PWEnPwsXMrb3hrAEj0Izbw5n2c+kfCpliqTT1Uq65F4mEduGg+G2vOf12cULP5TRuqTiahMTS8Yp0qQLM7VA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da83d54a-b1ff-4785-167a-08d947001672
X-MS-Exchange-CrossTenant-AuthSource: SY4PR01MB6798.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 19:46:35.8394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBPR01MB4812
Received-SPF: pass client-ip=40.92.63.181;
 envelope-from=tianrui-wei@outlook.com;
 helo=AUS01-ME3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: sergey.fedorov@linaro.org, qemu-trivial@nongnu.org,
 shlomo.pongratz@huawei.com, Jonathan Balkind <jbalkind@ucsb.edu>,
 f4bug@amsat.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shannon.zhao@linaro.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For redistributor to send sgi, we must test NSACR bits in secure mode.
However, current implementation inverts the security check, wrongly
skipping this it when the CPU is in secure state, and only carrying out
the check when the CPU is not secure or security is not implemented.
This patch corrects this problem by correcting the inversion of CPU
secure state checking. It has been tested to work with Linux version 5.11
in both aarch64 and arm version of qemu.

According to “Arm Generic Interrupt Controller Architecture
Specification GIC architecture version 3 and version 4,” p. 930, 2008.
Chapter 12, page 530, when there is only one security state implemented,
GICD.CTLR.DS is always 0, thus checking NSACR in non-secure state. When
cpu is in secure state, ns = 0, thus the NSACR check is never performed.

Signed-off-by: Tianrui Wei <tianrui-wei@outlook.com>
Signed-off-by: Jonathan Balkind <jbalkind@ucsb.edu>
Tested-by: Tianrui Wei <tianrui-wei@outlook.com>
---
 hw/intc/arm_gicv3_redist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 53da703ed8..84cfcfd18f 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -564,7 +564,7 @@ void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns)
         return;
     }
 
-    if (ns && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
+    if (!ns && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
         /* If security is enabled we must test the NSACR bits */
         int nsaccess = gicr_ns_access(cs, irq);
 
-- 
2.32.0


