Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE10F474EDF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:07:31 +0100 (CET)
Received: from localhost ([::1]:58522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHpS-0003bT-QU
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:07:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHm9-00017l-9T; Tue, 14 Dec 2021 19:04:07 -0500
Received: from mail-co1nam11on2071.outbound.protection.outlook.com
 ([40.107.220.71]:45344 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHlu-0004ij-8w; Tue, 14 Dec 2021 19:04:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STy6WLNnrf10Yipk4A9OkzuhaAopzWvcl8pTJKSMiyvq7ciLbsEa+AYhAGASbhxgqrN2/xFWSph6FHoXb5/WwRIy8BGzCyyWIbavUc9bFmJG5iGTiy+V3Sd0TSmAbmOIJEQw3GMyubp4d2wMoTiI7rQJKROeBUTZzS7oYhVYsRxIrEnuqaJqq4sv7BPW16F11pw2dEguXSc7OopoA/ixaQnSdrk0wNC+RtUkL6Xi4qwK5hBTeyXXBgo56yRLz9jRUp6TX6wqB9ab3LF7cVnCO8Q9f7grVmDZok3tBVMr45yCjm5UQKyTRpYpgnSd7z7s7By2xHuZmQCKrZ5RSjHJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZiTzW4YTXNSuYVmYcjN5F6TNh8honjBn7jl6qSBPCk=;
 b=ZCJhJK8+JWZOHwUuwcPbykHnl/yeBlCw89Tb53T8xtboD1Jve78UsGg73O6RCK2P7RQVkqqiHzJjUME2JpmzZkMCtGd5BVhaBfGNcL1vzbfWMXvzyuXLXzZP7o24ylKPHCV41TJMAuZe/qJDYNJMyc82k8q3EwxFOqbaZ1EAdiSTqAc2FGrfg+oNtDqGDkcAOF3uzmWOT3b3N/rKqkeUjaknDUH3Q4OlwgOoknN4NO67sS/8bJRUJLWfJeYfwOkvYBv95jJoEn7W99fdyU9n9qBQrHJOZz3kSG3dGGgufjsOX7tv6HqaBQEfZwugk78wc9khUoXRhEVo22/swHAzow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZiTzW4YTXNSuYVmYcjN5F6TNh8honjBn7jl6qSBPCk=;
 b=3J6ocqGaAchAs3liKYYxOGpmfSkhi0/DEnauUunb4tQC9rn2YXnEQRMWbPp/UqeZvVxqcMjhyDoMm81pYVKX45OWsNmo2h2PsUsPTwdq9qgnWPDTYyaxCAFLnAw5cgNXYuOHScdU1Digq+VExcHfsEy5Lu1gqpU0rgMfy3eh0H4=
Received: from CO2PR18CA0061.namprd18.prod.outlook.com (2603:10b6:104:2::29)
 by BN6PR1201MB0130.namprd12.prod.outlook.com (2603:10b6:405:59::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 00:03:46 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::ba) by CO2PR18CA0061.outlook.office365.com
 (2603:10b6:104:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15 via Frontend
 Transport; Wed, 15 Dec 2021 00:03:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:03:45 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:03:44 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Richard
 Henderson <richard.henderson@linaro.org>, Sven Schnelle
 <svens@stackframe.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 10/47] hw/display/artist: Fix bug in coordinate extraction in
 artist_vram_read() and artist_vram_write()
Date: Tue, 14 Dec 2021 18:00:48 -0600
Message-ID: <20211215000125.378126-11-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a41851e7-9f91-4fc6-238c-08d9bf5e5cbc
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0130:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0130200A2F2337C24DCA3B0295769@BN6PR1201MB0130.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSMJyZLyasT4P5qPn8OAM23HFTLsw0Eu7cBdBwdsRANqS0Ag3Q/pCGBtdytMkGxXyPUBpwOeRkbrC9cnE6723NraHAzFLZPkQfI5llszx9porZHfpMqI7JuJ3Lb2az1mEwSi6E/7xsQP1IcnBVyNIASCvNo/09X5tqqqwemfZP3JC6/fqBfw2SvKgkGA3kdvfpgRPZi+x4lr4fe/qio9RhijZUHkqIgaQ317bCOmcWXs0HZe94Ty56x4jzWmUoDhvEJ+Kow3Ef5EsgKgPONb9GGhLwUdtRoMar9d54p3Jimo8ZymoUYjr3Wfwy2Qye+i+5gp1bcgTC1soo7+zKS5hsPjHovsGZg5qx2WXEdFO3xRPtp5O8e+yV6lQ4rosx655xyA67rlKhJNK1nMTTwO2g8m0wO+xbg/1ppazewCUrk5ABQOoWCHyuEu0U0wNVaeRQO/ntuUjViGif4JEypi0CfP9S61BD/R+3vzAul3gA62d93XXLo5G8nR2MJ3stUqJ3k2UtRxW7u13md3ux+s/xtEFLRsdS99nlYV5Y6z9oe4l3shyRl1Z8GA40DCqfGyuyuGwyKwMZVCFjPOQrftqDoERR6cnCkGFJkuEyXbuBHcTC5BP89JSL+vaFO5vHMdmPwc2rwy+jrIlWFHe81ALPAIZIfTJBwucqIn1if37W2WcAhviXiDI3gE7jTKkvfksFwyN6KVwL5RQKMl9rR0KudJYjMCMXsVd2gaP3nKja/aG+Ug6nQLQxp0XG8kvtPg5trRfEcSrRGkSbgbDsytyvSWMLtC3UXmDPVezDpy1kc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(86362001)(81166007)(36756003)(5660300002)(316002)(356005)(6916009)(54906003)(47076005)(8936002)(186003)(44832011)(16526019)(82310400004)(2906002)(26005)(40460700001)(508600001)(336012)(426003)(70586007)(83380400001)(8676002)(4326008)(70206006)(36860700001)(2616005)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:03:45.1582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a41851e7-9f91-4fc6-238c-08d9bf5e5cbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0130
Received-SPF: softfail client-ip=40.107.220.71;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

From: Helge Deller <deller@gmx.de>

The CDE desktop on HP-UX 10 shows wrongly rendered pixels when the local screen
menu is closed. This bug was introduced by commit c7050f3f167b
("hw/display/artist: Refactor x/y coordination extraction") which converted the
coordinate extraction in artist_vram_read() and artist_vram_write() to use the
ADDR_TO_X and ADDR_TO_Y macros, but forgot to right-shift the address by 2 as
it was done before.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: c7050f3f167b ("hw/display/artist: Refactor x/y coordination extraction")
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Sven Schnelle <svens@stackframe.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YK1aPb8keur9W7h2@ls3530>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit 01f750f5fef1afd8f6abc0548910f87d473e26d5)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/display/artist.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index aa7bd594aa..21b7fd1b44 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1170,8 +1170,8 @@ static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
     }
 
     buf = vram_write_buffer(s);
-    posy = ADDR_TO_Y(addr);
-    posx = ADDR_TO_X(addr);
+    posy = ADDR_TO_Y(addr >> 2);
+    posx = ADDR_TO_X(addr >> 2);
 
     if (!buf->size) {
         return;
@@ -1232,8 +1232,8 @@ static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size)
         return 0;
     }
 
-    posy = ADDR_TO_Y(addr);
-    posx = ADDR_TO_X(addr);
+    posy = ADDR_TO_Y(addr >> 2);
+    posx = ADDR_TO_X(addr >> 2);
 
     if (posy > buf->height || posx > buf->width) {
         return 0;
-- 
2.25.1


