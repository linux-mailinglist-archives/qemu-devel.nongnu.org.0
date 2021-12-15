Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD0E474F65
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:39:44 +0100 (CET)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIKd-00031f-EK
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:39:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHtU-0002uw-Nv; Tue, 14 Dec 2021 19:11:42 -0500
Received: from mail-dm6nam11on2046.outbound.protection.outlook.com
 ([40.107.223.46]:5984 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHtM-0005fy-HF; Tue, 14 Dec 2021 19:11:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DimdPShWFVshfoC9vhAgs2NlWaghjzqzu7P8xAccbenRoruPdcjjwW+lKRaytTJ8SJIpViFPtzsIxcZKdFNGI1OEGvlya++PbASIhyE9RuhCUYut18grM/QgNTslxY909q0DcojR89zfAhhJTTxqkwFO6XN4J1y5yTdQF0cBXvUhy++4uP/LJOljbY0d5UxNWfIWK5SHuuF/XlRfeupVw/VlmZKaIPRehr20tYS5qu6Ta+nugGhco354gP3/Drmho3742zHe9dMt8LtNVOhKgnffOyVc4Nu9ZSLicV5oQWsOiPvQtHGeVI+hqbF6CreTo35+soEWU9vQxHJbcOZmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwxovqaTRYl9CpleMQy5WtqMwM62WmUna1KfC6QdglE=;
 b=iC0hxtd/Cmb6FVa8EMgEbu057BjB9i4560o9FHzxrccklkfHgqFa/c8eVPW3Do4WiMEZwgWHCx2i9t4NXuwOCD1mz46wmoE5kzovwkM/c52qID7FdFyD1GLAv6NmboJp5wrgEbvQPKmrE8aGRS9hhLznhTtQBAF+t3RNCFYA6ut9oI6gDlfhf1iNYl9tRkwf8bh92LNxm1waIJPc7CPZez4h7CLJcsztadpppsmTOCOh6IRbWzL5udRJBn3jNQyUcdriEYPm5GycDoPdsn9tDJYaoWzcNvM1L8ug1YkkqS4BBLvJqJD9stRVNIOnczfGmftgcggkvAwku7CNo/vN8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwxovqaTRYl9CpleMQy5WtqMwM62WmUna1KfC6QdglE=;
 b=Vqllg5GEQha6Yy+sv39dLCO0BAdq50LFBsDa/DmYEeWFkINyT/QYXcGci/U/slWXr7PPyTnLYQWwmpF8ZkVAhKu5PuqCMg6Oqwj/k6DTa+ROackJMwAvcsieCjUac+OAf1SsWDLc6lNyQveT5aUmTeU35txG+6rwyN58IBtyZCo=
Received: from DM6PR05CA0052.namprd05.prod.outlook.com (2603:10b6:5:335::21)
 by BN8PR12MB3075.namprd12.prod.outlook.com (2603:10b6:408:67::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:11:26 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::6c) by DM6PR05CA0052.outlook.office365.com
 (2603:10b6:5:335::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:11:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:11:25 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 30/47] target-i386: mmu: fix handling of noncanonical virtual
 addresses
Date: Tue, 14 Dec 2021 18:01:08 -0600
Message-ID: <20211215000125.378126-31-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5520e330-628c-47e8-ac5d-08d9bf5f6f35
X-MS-TrafficTypeDiagnostic: BN8PR12MB3075:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB307503AB2BD0A4B560A426E095769@BN8PR12MB3075.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCHLE0x4qcjtAX4Mq5m9d+SyLCuRGynevbVoRLBpyReSxOZXBM6vZl44E580jVniRA0dP+7HWmyFeFlaL5tgepkYNfzUCyYqrA5UwNMOFQwzNqbvnIZKX99P46YqzC+l/i/2zAakwP6GYcmINbR41P7aosA55gaBtHk/u2ERvn7e08MusdUgw4M/akE4f/tqNbV2eguCl3G34nvL5muRRNLcHYaPjmL0Fgxkrbrx5SazZu3/h7ipgVJLH4GhmaJ1h1RDKH5duSh+8rlvKiN1bem1NhczzAF7KMJMo9ms7Qnu06eQT2k+LCOPeMj3meHK6po0xa0JIsZ8GObiLIUNbdAfPANY23EIITu/SQsiG3d3+Pydm/UkjTt+fEbC/W571NSjm12mCOcjHQHEuG8Vi5EAcfV9lJVs7AC/2f1rmaITAwwCxPy29CCBPfdE9tnoEtzmv5b0SZMlZx+TAntBSb6Q0hs6rEWLy6Q6a1QuZoQG0QXl/cPG6wzN5LeD93yh49/E5XMKaahpsWLLrz6v/PgpgHDJvCf4fKBcNzMDg+js40+yTwlHvtUEF1g59d2r88ADxvl7T7aSngfhjOeKzhgW/bt7fbvwzJRhFmSPizajV3eURRY8Kf1kMMH5gbU1Y+z/zy4hTEwx0mEJblmUz8sLmj989RDfS/mabKBn+3ELkEBFym0A9N9HI6U7X+q++jgTUWBgXiUABAFizz66mKmbUMZWqvS0AQXbYX6gUXi3e9zJrwCcEKTYkfqoTywP/Vr7pgMk00bzxNC78TvKuRJb/YPI0rcxqSrmqDMtMIY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(508600001)(5660300002)(316002)(1076003)(8676002)(81166007)(70206006)(83380400001)(2616005)(6666004)(70586007)(54906003)(186003)(16526019)(6916009)(36860700001)(26005)(356005)(336012)(8936002)(86362001)(44832011)(47076005)(426003)(4326008)(40460700001)(2906002)(36756003)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:11:25.5254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5520e330-628c-47e8-ac5d-08d9bf5f6f35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3075
Received-SPF: softfail client-ip=40.107.223.46;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Paolo Bonzini <pbonzini@redhat.com>

mmu_translate is supposed to return an error code for page faults; it is
not able to handle other exceptions.  The #GP case for noncanonical
virtual addresses is not handled correctly, and incorrectly raised as
a page fault with error code 1.  Since it cannot happen for nested
page tables, move it directly to handle_mmu_fault, even before the
invocation of mmu_translate.

Fixes: #676
Fixes: 661ff4879e ("target/i386: extract mmu_translate", 2021-05-11)
Cc: qemu-stable@nongnu.org
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit b04dc92e013d55c9ac8082caefff45dcfb1310e7)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 2dea4a248e..9fb59058ef 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -94,15 +94,6 @@ static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_f
             bool la57 = pg_mode & PG_MODE_LA57;
             uint64_t pml5e_addr, pml5e;
             uint64_t pml4e_addr, pml4e;
-            int32_t sext;
-
-            /* test virtual address sign extension */
-            sext = la57 ? (int64_t)addr >> 56 : (int64_t)addr >> 47;
-            if (get_hphys_func && sext != 0 && sext != -1) {
-                env->error_code = 0;
-                cs->exception_index = EXCP0D_GPF;
-                return 1;
-            }
 
             if (la57) {
                 pml5e_addr = ((cr3 & ~0xfff) +
@@ -423,6 +414,18 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         page_size = 4096;
     } else {
         pg_mode = get_pg_mode(env);
+        if (pg_mode & PG_MODE_LMA) {
+            int32_t sext;
+
+            /* test virtual address sign extension */
+            sext = (int64_t)addr >> (pg_mode & PG_MODE_LA57 ? 56 : 47);
+            if (sext != 0 && sext != -1) {
+                env->error_code = 0;
+                cs->exception_index = EXCP0D_GPF;
+                return 1;
+            }
+        }
+
         error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], is_write1,
                                    mmu_idx, pg_mode,
                                    &paddr, &page_size, &prot);
-- 
2.25.1


