Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7E5433A11
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:18:48 +0200 (CEST)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqt5-0000DU-B2
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq7Q-0004jq-RY; Tue, 19 Oct 2021 10:29:34 -0400
Received: from mail-dm6nam08on2078.outbound.protection.outlook.com
 ([40.107.102.78]:40472 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq7J-0006Zw-3z; Tue, 19 Oct 2021 10:29:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3Nd8YXVDdfVthAyEGwyGQLTSuvDOWqhO7v788OcPMz3V512Pd0FKd+bfAsF1Dst3WDY5xeH20M++20c0RvDSVisqTIHzB3Svg4oVbNk5uEcYC8YDJwSx7uEYK59IvSVQFpVqN03tzhhaBAxEJ0YjCP6Ve54CeA25yRlXEusgMSTMEqp9ujqbZWO1SnKWRwztKJu9bIYmNH1UPQiraiLbmYv50Ug0l9Nac5UxR2bH3pyergHILS9omBySLFwUDzDFdnzWZi5hGXCmrjXag9Z+v2P3AyvhFa95NIg7H1n5LTifNw56HBzCiR+KND2cS3XY2d/9Oz9saoNEbp98m3yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uljkpOr6+O+fjuZVPYJNezscSDyKjQ8AyZv22gYS4FY=;
 b=KbBHl7Y/hFrPGech8OT1vWPSWiQO56ZBj2SWPPkgaJJG28YWqXKd/CjdExMM9doJcD8yRNoDrWCFbIvjiTL1y+9lLu5TpZYms7GgEOSrYiqcu7obkd0ab/pqcdM/+czLsJcCVOyFWqPwtqbmv3vyHE4vBcW9ZMwdXKq0HTfdwaLFtztu+BvcPp2CSLmotfKq3jiDsoRZpxGwjFxKUIOEl4dE2tYAKDH2uhVd2uwBVTwcR3H3sQF7jHMBYd40lFhwvLYnzaCr01+ZVBYDdlGWy/VLhKuigOzg6a+8FVOtQQkIJ4mItVNJMViqy+0Jb/u/juwDLQlRB2ivshV4NfyUCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uljkpOr6+O+fjuZVPYJNezscSDyKjQ8AyZv22gYS4FY=;
 b=HYA+qyBifGyIV+wfms9hYE2Jc0ydNTZJDiEMsr8+hb4zA/E8ovu4InX4xWdvIO7FVtDja5Dj3AYboSs870mdS/OmTxbIjZM17bV6VZpB53fJ04ITbE7IrVfXa/xhD6vr2R0VbAmHElW9lrYTbDbcE/efDXIegYaZEK/2rgfMK7M=
Received: from DM5PR20CA0006.namprd20.prod.outlook.com (2603:10b6:3:93::16) by
 DM5PR12MB2470.namprd12.prod.outlook.com (2603:10b6:4:b4::39) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Tue, 19 Oct 2021 14:29:20 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:93:cafe::78) by DM5PR20CA0006.outlook.office365.com
 (2603:10b6:3:93::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:29:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:29:20 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:29:19 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>
Subject: [PATCH 46/64] audio: Never send migration section
Date: Tue, 19 Oct 2021 09:09:26 -0500
Message-ID: <20211019140944.152419-47-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 44c50592-e1b1-4f8b-7c32-08d9930cd6b7
X-MS-TrafficTypeDiagnostic: DM5PR12MB2470:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24708AF8D34AD95D2FC1392395BD9@DM5PR12MB2470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9q+6pyUzczp50fO6FbQHd96572ujzIHQfqflDu+BNUKiOfp3lZN6bkDCiBzWUPButVqMHFnQln04GRsTEmhUzU8VY3CoNYnP57DXdayVyuiQjLJhYWQrGMvsFOaGopwPX0UJF4R/OF3iQWeqKMGRpP6FY3BSo5iPS38cQXRZST0zXPPCLGqOOSKjDNc7r/Qnp3s0T2uykJBFeMVKkABZJ/Gjx9nUgsI2hAVkPZfmDfMdPlkx6/vCI3V9ZAtfxLdxeF/4jvIbTlAzVJVQf1MeUTP9XMXn4ngibUQve8/z+oO1sA2+nY9udhyY8TtpjjKMXpnTfq2/JBV7WeVdNvf9jDgCySn/7sy72Gvd4x0gTCS3eaiwp3YnNvxaag/nyGq8/1wOynemejZ/lCuuzGGCCzHwH5B3UNpnJLi0DL+dj6y0hbzQjrDphj7TNaUgGxT6swuSS6/yTMGoETT2PKSk/M0JemZ7IOJzB9UluqAYiJ3w5U38EJ06rSbjeyUu7/IwCAVVBAjBni7sehEdiASkogTdDgJbjT3pXadX0LX0uz69/4pFcl2J5kFxiptTkpy94qse6BWqmW04yv/wfDEjkjXxKLxq+1kYqvobc4eRddgz5QNeYw9GdsLRhNm5j7e7fTQ5XBJmpb1xPsOjWvT5Pl43TGksGvE2TKgQeU4dVgZFbIAmSgbiM17Ka2bEjLkdE4PDPrDs5pMwtTq+GC1nb1XESA/wlGI6+rrRGLmUuvk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(86362001)(54906003)(316002)(6666004)(4326008)(1076003)(8676002)(36860700001)(8936002)(44832011)(16526019)(2906002)(36756003)(356005)(70586007)(70206006)(508600001)(26005)(186003)(81166007)(47076005)(6916009)(426003)(336012)(5660300002)(2616005)(82310400003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:29:20.0136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c50592-e1b1-4f8b-7c32-08d9930cd6b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2470
Received-SPF: softfail client-ip=40.107.102.78;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The audio migration vmstate is empty, and always has been; we can't
just remove it though because an old qemu might send it us.
Changes with -audiodev now mean it's sometimes created when it didn't
used to be, and can confuse migration to old qemu.

Change it so that vmstate_audio is never sent; if it's received it
should still be accepted, and old qemu's shouldn't be too upset if it's
missing.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210809170956.78536-1-dgilbert@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit da77adbaf619c4d170cb42d769145ad1803fbad9)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 audio/audio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/audio/audio.c b/audio/audio.c
index 534278edfe..fa724ea8e0 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1621,10 +1621,20 @@ void audio_cleanup(void)
     }
 }
 
+static bool vmstate_audio_needed(void *opaque)
+{
+    /*
+     * Never needed, this vmstate only exists in case
+     * an old qemu sends it to us.
+     */
+    return false;
+}
+
 static const VMStateDescription vmstate_audio = {
     .name = "audio",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = vmstate_audio_needed,
     .fields = (VMStateField[]) {
         VMSTATE_END_OF_LIST()
     }
-- 
2.25.1


