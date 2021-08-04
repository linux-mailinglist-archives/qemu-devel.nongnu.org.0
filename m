Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ECB3E00C8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 14:03:55 +0200 (CEST)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFco-0003hp-Eu
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 08:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFXH-0002oU-FJ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:58:11 -0400
Received: from mail-bn1nam07on2088.outbound.protection.outlook.com
 ([40.107.212.88]:25757 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFXF-0003IL-If
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:58:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuuW3ITzyghFynVIgUaDHol9jzuM6yRCLkX5nmJWMOFVDI8RYSowdHLxxNQoN3H87heTS+yb8d25wfPdbSozNRd1JkiM5C9uZYarTFgrI8cAv8g8unqYqwo1aEDhHRUdNJwNCoYvjmDpTclGYM058qMOzpIv0wK/ZmtsIXDiweJzUAtGvtPKQ49DxLDzL54hlFK9eHAc62HQHBoC1nplBXS94cM1FinAEh16VzxdLfAv7YM1wcW87GFtEJ8zERK6t1XaA3CDHWnSjcZs/qSn8uMwa9hN0QuOQlF0bbkvaZLwRDT8itLXLtlfHtcmJObxxgVeRu+afEkhuqSrVWrheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQkXQR33rvAkPOce5W2DQeDRhjdlYpZtX+cCtep9zmU=;
 b=cQcldLTI5UWXpcwVj+UT+jaT+CnuoAsfBzlcVYVbMdw1IJB7Izvda2Cg7sfPoHooPM+tP4eRpqKFca3qx+EDyZHXDIBUPQ/S0DaslKh1dyntX+70gQ73sZkHz9IzbN5SVid2WdQj4EpAt7syi8z3sUBtz59FieSsfMgg+O1aBPfF9W+fo0HsBEZw23ALZz2hDexKFM5AgJgoOeF1CLwMDaeHTr1ukw2yVKvex/Rl8Msvcp7VgADbUlQ/f23vg8JOiRewRduttH0oJRAjcN4wdr7ML8E2lKUELqRp+2mcqtPON4NhS0kCBylXUJ3QqLW9gqAWamACcfgPKLsZtpEE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQkXQR33rvAkPOce5W2DQeDRhjdlYpZtX+cCtep9zmU=;
 b=S1wSGeHzEjyo2N4XeINTriJHiUMFwTkEg7X6qs87b53JJ7RbdRjuuHazd/C3iF9eFHYXZGVVoEWX8BSqxZXZMM8YY1ef1SEdIz3MAvQiZ9LsHpIFXUdj79K21KbV1+YcLGX3fh6icXm9YCADbgC7aTjUC/NmYVGJJnvBfUL/fZc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 11:58:06 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:58:06 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 10/14] migration: add support to migrate shared regions list
Date: Wed,  4 Aug 2021 11:57:55 +0000
Message-Id: <9236f522e48b67fe7136de7620276f7dc193be37.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:806:28::15) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SA9PR13CA0160.namprd13.prod.outlook.com (2603:10b6:806:28::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.8 via Frontend Transport; Wed, 4 Aug 2021 11:58:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3ff111b-16ad-412e-6e8d-08d9573f1ea7
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB254266370F075DA7D10D4A5B8EF19@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /KwNUuftsnHBZQcIsp8fMFglWdmj+3S6YPCyrUegIAB1gQHuJ7JSHPWAq+joLowfFc2CXtDATQQepGvpNLVuaYIfLgusLNfYyOyrRV3diy89Uz4sEFBWYdAYhWLpEppY5/J6dtOe0F3khBHXOxlEu/YHsaUFg5wpyU1OUHXTiRtU/pfUO+OoDweH8C7WzBA8rYCzQ6KYt/RwGF1aEoz5h5xWrg5yI99mftMZlMARcsMhplxMPwTdUYWmKEs9P6FOFUuPv2fc/Wg5ErAAX0XQYTl5B1v2rIypYec8jQIffpXhmEKySwxLumNnCsO3B/gzJnHwNGBhCIXhqUvmjJ1gFsZNm106VQ393BdqBZgHmn9R1izMu/i0c8yIVVqAdZwekU/CDOQRpj0C8cgeqin2QyWisssuOk2ZY2aWIR4WW3VaExssaN3k2uMCWFk8lDwthXM0GxknR/eAq5nF9csRdDdVU9CwI8jiLCucJiCfeykCxDvPRh+XH9K4Xbquhkrclk5qng7OnG5ixUYs26kyzMN4rMAk0/0sI9TGBaV4x6XNPsxuYW1DznI4ApXpR37CJvnzH5ipqAnjAeKIBlCF/sA/xiOCpnl4j0G/iGh7r/kcei6cqBuEestMnRRuKDBtQhWoVtgzCZDzys2KnKCV4j5HQDm4nQa0XX5DI+xDI9XJl+CX73xFS5oocUZKVhGhnI2CBhsW1QOu42Z7EA6yRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(4326008)(66946007)(316002)(2906002)(2616005)(956004)(36756003)(86362001)(6666004)(8936002)(38350700002)(26005)(6916009)(38100700002)(478600001)(5660300002)(8676002)(6486002)(66476007)(66556008)(186003)(7696005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ue+nvJeNcsAjtwQmSDzvwCCwEqzwqFQFLgTfHLv165Ai9QsDBWzEcU3FhheV?=
 =?us-ascii?Q?QSmjRCpasqaejTSj6jO8snjGrl6R5WUM8Xd0db/Q8upW1EsDEyPSnnFfLYGc?=
 =?us-ascii?Q?JANS/Ao9YU81Ks+y1SD1quq2LMreAINwCKYc6FsHtn48U7BoFhNUPc3kMkiq?=
 =?us-ascii?Q?c62P5cbv/vSJ2Mm3dZM3nOiIKd3YM+ATv4yuonOPyA7K8Hf4D4kmNAjPQDs8?=
 =?us-ascii?Q?XHZz6+1OkMIaHKUjVfObLEw/0wDChEaKD5wYCvaldSIyFLce8XW0/6k/TdY4?=
 =?us-ascii?Q?lqUO5uKWXRnuVtQmmZNiUczNF4ukvTGPP5NQUQVLh/wkNOANr5OHCXzhY72+?=
 =?us-ascii?Q?lxwwG2ZsGDZ+FWnPy8ly+QB4EPEDoCNrtKZYcddAjIzLaANsvOu4Lh2V0301?=
 =?us-ascii?Q?jQJz2ftiIn9NfLr8gUgAfGAZpcn5pMrfuIL7Qv/FUnTu0gdQ/vdxnOQvdp5j?=
 =?us-ascii?Q?IPEs2YlKXf/h7gWd/iMGehi2wksuhNdv3lHbUciOIywgYC4ouVPEQDDEt2Bj?=
 =?us-ascii?Q?fWgbVyFNLZIZahAoeepJNU94tRjq+pd/5CZtCio0H1vgyxzg8giTw51fnJxN?=
 =?us-ascii?Q?9dYfL3wmJd4TQgu230s0HW0DYAn7e+R6LfYUjXYgwRP5Gr7NL5+C98sZWd7O?=
 =?us-ascii?Q?Oyi/o7ImmQc/BSFhCm/bh8RMT/r/9r4eu+qv+1j2djnwDLTpSIKyMv1eq/K9?=
 =?us-ascii?Q?oP5LN+IX5ww4RjCg2WZDsxpHsY9ZwNznxuXsxmUcqMJupM8ihlh4GwrtxAdU?=
 =?us-ascii?Q?gW++igZel5WnAOoCw71UCzjGLoXft1KOScH0Yb1TWwEPCARgKSTTZ50i2586?=
 =?us-ascii?Q?2BLb1VJ/pctqxHsABljO/8YYItKXdGb3Z5FFq098YqvjrwQzmn9OzViDbuN4?=
 =?us-ascii?Q?EOZgvZ3kkbsaMClP+c3I9VOVVUpH4zziWwRux0FPfTxS7CVQNd+8sazGJgwh?=
 =?us-ascii?Q?FMFwA2YkWAdUBzAOtu/sJVwukIPh3fy8KibJnOExJn/T+BJm+52qI2ajKHVl?=
 =?us-ascii?Q?Ff2uWkrnshTZLtTXF//iojF+L9Ue4nwkKRvWXyErNEPUF7nMz611DWomjfrv?=
 =?us-ascii?Q?JxcagR1CCYjqXLusZqwzXN68sPR0NrU3d3U7UoXyXPqujRodmiuJ/eFvvEbp?=
 =?us-ascii?Q?mjtPATtYkvF71oi5VeMfOed4inrVyEHKt58jq3IbpWwkB3vIjTI95wWl67fd?=
 =?us-ascii?Q?Kmm1IRnug0HEIZeakAf4KstkJzwZOEwjn4Fp2/hPMJj9pByHiPfDrINHQgD2?=
 =?us-ascii?Q?EnaILtkLvlDhokQs7gmjdXZc2LpoTBCUZWLsKCJY9dVcEzoGVF0gPIKGrW/B?=
 =?us-ascii?Q?ej5k9egkFqC2R9YoYrU44lfy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ff111b-16ad-412e-6e8d-08d9573f1ea7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:58:06.2319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MINr8RdS4k2hdim26eT/zHyJenVi329Gy1WHYgJzXIeYIrk6xL8X6ZN8c17Udun4cm4He1+TYsOHFeLbvj+P4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
Received-SPF: softfail client-ip=40.107.212.88;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brijesh Singh <brijesh.singh@amd.com>

When memory encryption is enabled, the hypervisor maintains a shared
regions list which is referred by hypervisor during migration to check
if page is private or shared. This list is built during the VM bootup and
must be migrated to the target host so that hypervisor on target host can
use it for future migration.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/sysemu/sev.h |  2 ++
 target/i386/sev.c    | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 3b913518c0..118ee66406 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -32,5 +32,7 @@ void sev_es_set_reset_vector(CPUState *cpu);
 int sev_remove_shared_regions_list(unsigned long gfn_start,
                                    unsigned long gfn_end);
 int sev_add_shared_regions_list(unsigned long gfn_start, unsigned long gfn_end);
+int sev_save_outgoing_shared_regions_list(QEMUFile *f);
+int sev_load_incoming_shared_regions_list(QEMUFile *f);
 
 #endif
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 6d44b7ad21..789051f7b4 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -135,10 +135,15 @@ static const char *const sev_fw_errlist[] = {
 
 #define SEV_FW_BLOB_MAX_SIZE            0x4000          /* 16KB */
 
+#define SHARED_REGION_LIST_CONT     0x1
+#define SHARED_REGION_LIST_END      0x2
+
 static struct ConfidentialGuestMemoryEncryptionOps sev_memory_encryption_ops = {
     .save_setup = sev_save_setup,
     .save_outgoing_page = sev_save_outgoing_page,
     .load_incoming_page = sev_load_incoming_page,
+    .save_outgoing_shared_regions_list = sev_save_outgoing_shared_regions_list,
+    .load_incoming_shared_regions_list = sev_load_incoming_shared_regions_list,
 };
 
 static int
@@ -1604,6 +1609,44 @@ int sev_add_shared_regions_list(unsigned long start, unsigned long end)
     return 1;
 }
 
+int sev_save_outgoing_shared_regions_list(QEMUFile *f)
+{
+    SevGuestState *s = sev_guest;
+    struct shared_region *pos;
+
+    QTAILQ_FOREACH(pos, &s->shared_regions_list, list) {
+        qemu_put_be32(f, SHARED_REGION_LIST_CONT);
+        qemu_put_be32(f, pos->gfn_start);
+        qemu_put_be32(f, pos->gfn_end);
+    }
+
+    qemu_put_be32(f, SHARED_REGION_LIST_END);
+    return 0;
+}
+
+int sev_load_incoming_shared_regions_list(QEMUFile *f)
+{
+    SevGuestState *s = sev_guest;
+    struct shared_region *shrd_region;
+    int status;
+
+    status = qemu_get_be32(f);
+    while (status == SHARED_REGION_LIST_CONT) {
+
+        shrd_region = g_malloc0(sizeof(*shrd_region));
+        if (!shrd_region) {
+            return 0;
+        }
+        shrd_region->gfn_start = qemu_get_be32(f);
+        shrd_region->gfn_end = qemu_get_be32(f);
+
+        QTAILQ_INSERT_TAIL(&s->shared_regions_list, shrd_region, list);
+
+        status = qemu_get_be32(f);
+    }
+    return 0;
+}
+
 static void
 sev_register_types(void)
 {
-- 
2.17.1


