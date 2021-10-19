Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B080433A63
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:29:53 +0200 (CEST)
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcr3o-0003wy-Fb
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqAq-0000vI-6V; Tue, 19 Oct 2021 10:33:04 -0400
Received: from mail-mw2nam10on2042.outbound.protection.outlook.com
 ([40.107.94.42]:36193 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqAm-0004uC-Eg; Tue, 19 Oct 2021 10:33:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nT02M09Q8Wxv+VLN2JrTnCoepgOJTzDvOtObGYCnQ7yLK1SFK4VZ2izNMGVsa1KNgXXFxlS78L4Td1lXrHklFUSdJCDASpTiKWzjG/KLyVxdxMrjHi91KsxqBzx6ikRV0yy/AhdLSfaWrG5JMkPeJpFzfURUQ5B0mHcEdxaco2DeZwdk17h2CjRz7/hl4RZiF17OyGqEx68GEzc0xTHzqerQmJ6ZhNlKWYpjOlAFaZfXx68j7011EhTR1gG1JhtSaHm+iKjFRwOoeLcL28a+WbsLkJVPxL0a9WID+DgH1ubAETU3Vr7LCsSFp7E9ToF0Hk78wT8dkXU4NcD9B1AWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aBVWEplFenlVU1Ww3LZqYlzRO4FDBKV4jnsPArWDHI=;
 b=RJ1SHMJP4JL3tB2fPyab2KOY42UAoMUhgA9tbcObj/Ll3mSFLRIjt+egtHZXvhnyLGylZt1VgnZNS8iriN9TB4+nZJT/4y7UwX/BXI64wadqxbQqhfOONmnnHTf1zr6trYJbdUwOrTqYQuzR79MyK2qDAG3QaB0EmmHJ/+reTOkevZ1lil/Oag1ZwUWVpT1GYkHydkCBcXKf0PBT5EyWR63LNsmAA2Vl6z1n15aJHr2fsuoY/JIJOXMSVQ2SKddOnY+jTQNlJsWMfh2iD1bxpMcfDYO8bBccRPX1gVI+2GuCsQQbBSdbFj2KlZqgLp8/iKcTeddd6SfyeLTzWnw5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aBVWEplFenlVU1Ww3LZqYlzRO4FDBKV4jnsPArWDHI=;
 b=GGKvaObOwox7ppdo5NFaSMJZIxYa2+P+CwnJFfpjUQtJDqiOUqvDw+kj3Ol7+X6yOTznYDoH0HJO5R7MjGjTwCRKFHtZE5t9dGBaqmymnRV46sAsRTNhwsfq/MmC13OvwpndChsMMmcdcTfSPHI/s1hL1GS6gco0lMMp0lvEAhI=
Received: from DS7PR03CA0194.namprd03.prod.outlook.com (2603:10b6:5:3b6::19)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 14:32:56 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::87) by DS7PR03CA0194.outlook.office365.com
 (2603:10b6:5:3b6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:32:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:32:56 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:32:55 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>
Subject: [PATCH 55/64] vhost-user-gpu: fix memory disclosure in
 virgl_cmd_get_capset_info (CVE-2021-3545)
Date: Tue, 19 Oct 2021 09:09:35 -0500
Message-ID: <20211019140944.152419-56-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2d78705e-b8b6-4cd2-8aef-08d9930d5787
X-MS-TrafficTypeDiagnostic: SA0PR12MB4381:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4381EA90FD346AE6C66A306795BD9@SA0PR12MB4381.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZvNPd+WtHUDnqidVf99SK4srKxtrh3WFD/+1jZ2wufVhc2aI6QP2Tri2laarZxvs/4g42+hnRiK7bUkl8oOmq8jyBPyklS4hJkNx0EyaXbbpds/iark+K9bhQo4mwqZJ+HM85vzpniWdUKGBgl6Z9to4oI6KEVOH0oMMdHZH4nz9xRkYP5qrvK/vjOIW/fIDvKJLiL8Lua7dXzTmVLRgsRtt1EjdkP86i2bH45+uAftEs4e35E8SCS1w1VCXA6egxy16+uF2GI03fStqSNovW3BxCTYHjtAoNkz4/Z1CK3Rj8jiADATmyg1OcGDWBcVB3+rw30VBjBRldTEwkXV/NmaYem6HRuXUOCfF3Oe1gYbyQt9HzPw6MzqEor3rXVBEwrpuoCB80imLCWu7MplgIj2xB9XW2VVN0Nv74D9WJGbdP1Th1gevtSx9SXFr6tECX3ouoZsBp0ryZ6GksRcmYMzii2qG35lWIk72xx5EE+rpF2NPfojHTrqTQVtYeOlbtMXF5NIWaf5yML/R59WQHbv3DiWBah+1WMfPyGnkwhLXZ6OCK4l/2kKhmNYdVeQ56JBvpveB3CUOCe8XB3RSEFdl7EaXDajfQBIrRloLJJBwz/Hz8wnFBPeSAV69n+rc8Tt+S5cqu9ZG73oHXp30FvnO5WwDXj2lbrDFESE2s//6opVfNCmAYkdpueJ/gR68TFQfzG3Lc3jvJ1jXUYz8OpCHhcSmd2/y1W7OVJ+SZCc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36756003)(6916009)(82310400003)(86362001)(8936002)(5660300002)(54906003)(336012)(8676002)(2616005)(1076003)(426003)(26005)(6666004)(47076005)(16526019)(186003)(508600001)(4326008)(36860700001)(44832011)(2906002)(70586007)(70206006)(316002)(356005)(81166007)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:32:56.1254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d78705e-b8b6-4cd2-8aef-08d9930d5787
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
Received-SPF: softfail client-ip=40.107.94.42;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

Otherwise some of the 'resp' will be leaked to guest.

Fixes: CVE-2021-3545
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 42a8dadc74 ("virtio-gpu: fix information leak
in getting capset info dispatch")

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-2-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit 121841b25d72d13f8cad554363138c360f1250ea)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 contrib/vhost-user-gpu/virgl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 9e6660c7ab..6a332d601f 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -128,6 +128,7 @@ virgl_cmd_get_capset_info(VuGpu *g,
 
     VUGPU_FILL_CMD(info);
 
+    memset(&resp, 0, sizeof(resp));
     if (info.capset_index == 0) {
         resp.capset_id = VIRTIO_GPU_CAPSET_VIRGL;
         virgl_renderer_get_cap_set(resp.capset_id,
-- 
2.25.1


