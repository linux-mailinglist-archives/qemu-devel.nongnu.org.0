Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19DA3E0097
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:56:55 +0200 (CEST)
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFW2-00057X-LU
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFUD-0002Uy-RX
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:55:01 -0400
Received: from mail-dm6nam10on2079.outbound.protection.outlook.com
 ([40.107.93.79]:38049 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFUB-0001tX-I0
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:55:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AItZxgyMA+O664lHz0/r4Foa+NnYWsp4xs/ymXQwrv/pBDfsic8/hsRrIEfdVKs3wAsO3BVMrlFVkJA8mZlsn4MtX+2Cn0Imw/T+d0qQEHZ3TFTpxWmoA8AqBWAmiBlLmOyaOxa6Qd+++VKfpggO+StZn6/p1QOLf9oXzDFY/CdZ/l1t2pWzd4g6gcl07aY0FLD49ToL/0IpJgfgwBJyjiDbs9XztO2Jhu6uh9dse8FdqDXVvi0oh5y2nY4wFvYJnEf9wBgHDxC0gnTAL4wn1RLBLtXjROf0FrNbrz382U5reVkCRCdihF4Z1LEGSecX8yXV2jClhBXDh+f7E4MMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIRBBS2neT7f6cOKwwZEM563fZ7gbVmuQ2sr7H3ZONM=;
 b=JYbV3txiNm7fDzgQpBXHHS3g0RBhOVaMQH3ZabrO7BqT4JYALzigMhk4UydQhrPqiG9V6Y42zELcGygzucyd4gb5zYYVp/wB4XD8SDKkshB86W/nE7Jl0Q9MEAV8NpT8DzHSFvEl7zcxuCZFmPjBO3x7FGt3yq9GnrRKPlCRpqjm2Bv9YUp2/hqjRRb7Bj/JKuxgzWL7bGLtH1d3CoVMKpkgGWzme/YTcezRaKO9QBh3bwDqDRO1kAHSqxK0Qx+3QgcOi7/1L2lu+FgpkP3uVNZvReqk0f9QB6dDYAsOPhFYYAsS8FYClMAlTPCkRd2Vt1D+cwo0qR+nfy6FtrfW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIRBBS2neT7f6cOKwwZEM563fZ7gbVmuQ2sr7H3ZONM=;
 b=v6IIwQEe2RFgIgjDgKnBCxl1HgUUt10Re4tlx+fKIG40h8zCJBR3OohnVzdYapkVt4FoHWo5Y3MC2N7D57vd38a906Oo3FwiJXiEJTjcyt184djkL+dh2nrMRhOcYNOecsRrxu/VqUriXtvFTvuJSTtOHbd38Dkd9X8bMPGPvfA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 11:54:57 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:54:57 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 03/14] migration.json: add AMD SEV specific migration
 parameters
Date: Wed,  4 Aug 2021 11:54:43 +0000
Message-Id: <d6a23bde6b6e10162282e6ea3b4f94ed331f4b3f.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::16) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SA9P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 11:54:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88dd88e8-9b3c-4a77-2ea1-08d9573eae09
X-MS-TrafficTypeDiagnostic: SA0PR12MB4413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4413A70189FEFDE6C5242C5B8EF19@SA0PR12MB4413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ErlT9m1YSWpMAXzRm2hGaJ5fkXQ5S//u73NDHBla9SJz2PourAxmHlL3s36bJnkcKD8JEIHeBk5fbQlpcLk/Q3wjEsi5kn0VlUmTuiHASNGVRXTTylbF7rlvfnyHbCF26T2yKT2+IkJG9aT2Rgsr/nlSIFU5U2wyRbNLVEQ9mG7iL3DxcwFvc6PbZ9hY+0r2qmk1YwP7B5ZQDd/FKyzDNu8oGff4WuBReSgsy4CMHIwMjUzvqwP3rNGDbeE28fv1jGfK+m6p7IwH9+vIFu1eXlS8ihsildaPgNKKlv1Ul6twh81pGv0C0+Ict2j0kZnKiEu3kaBoNdc7rksIa8Yz/VqP4bWMSlSZXnmENn/YONcGAUhB8r4Apjl+4MPv3GK7P2z64gEpzLSoxkECiQeSov6CsQb4his11G1S6w+FFktNjweSqAraaULEiqz0ccsBrTzBeFETaqRXaJDWeP5G8uI68ob+70mzYDS2R6SokVQEyQojKMczv5F+6Qo35MK5M4hkHyqwZwvb78LjggHJtQdFmpnfBX0ydKW0cN3qZAglgYsCMxiItxyCi3JWI/lZ7I4zNC0HyzJif0QOyik0Re2YmRsDfHFmmgykHIte/TPx+d7Txhx28Fim+ubY4EG894kfLgeHnMxQpOJAZKaml7rn+eyIhzPY4oFDfpHJtgtMXf5mD2ghVJYAf/YDxTkiU8gwtzM3thcirGiiSFmxSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(36756003)(38350700002)(2906002)(6486002)(8676002)(38100700002)(86362001)(5660300002)(478600001)(52116002)(7696005)(316002)(83380400001)(66946007)(2616005)(4326008)(186003)(6666004)(6916009)(26005)(66476007)(8936002)(66556008)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GV6KIKBw/aNJQR0BxqhdGXt8bY7b1WXVPAnXMnGRZ/CInkmaUK2q5kJ04jPy?=
 =?us-ascii?Q?YQsuhKEqJBzF0RancA5uRKepTZPp21tr7n2CDhimkF04+W8V89lEre/dpw+S?=
 =?us-ascii?Q?w/61p1Phbt0Ojs93PUFBCCUUPVUs8IXf8DdIiv4z2ZrQMRv2WBORFnjn0JFJ?=
 =?us-ascii?Q?dcShsXKB+9vW8ymPPNJKWAyV8juW37KSmsycWStpiPtEn1xiB7RSJnTV3H+3?=
 =?us-ascii?Q?vi2JucDkj0WpWI//b7tg3njZelkJ6DHcWTroAEErT3VRfYjzRVAUIEvweist?=
 =?us-ascii?Q?o8IsacbVz2UH6peLBqwPFypdt1aVih1nhuNJog5LsqNKfu0Lkw9sIq3KpsLA?=
 =?us-ascii?Q?bLjaj2gv8hSX2TVIis1qnNwliWa6Krp7pTPYgvackEK1t6KGyk8ybCbMaW2d?=
 =?us-ascii?Q?dvf15lKm6ANSv6of9vtp+VziiO4+f/9mp8FykVIPxakN/MAHLFSHAL++YMf/?=
 =?us-ascii?Q?4A8fcHak7MmcE27IC6z0wedUPpd8iaYVdE44wLw8dGetji0MVr4KbWCgboC3?=
 =?us-ascii?Q?KD/Gc7+xkuKpU2v7nbRPdEzw4VBCZsA785cA+F1pnNryPn1ZwHE8rDqPTQj2?=
 =?us-ascii?Q?Sl/HdsgyWj6RW3txEr0tWvv05IMw8eX+LwrwvTjsGWcx+2I+HTiY0ePAdVq4?=
 =?us-ascii?Q?yx/6aXxmP06sxu/qledVeCGXorc8PKJo0nGZ0Q16/26pN0SdXdsfmmpYER2l?=
 =?us-ascii?Q?AaYJgY4G7FTNsBrnP2SlFl/dQVKK0vUg6d3ImQs7EmH1IUOmdXj5SSgTTnU/?=
 =?us-ascii?Q?YXHZnJw+cY2RQb7C3bUpEpVvgkqGpW9P7WyEtLDtEv3WvKLSyuggPJOUubAt?=
 =?us-ascii?Q?CBqaVZxQBmbE6cf4YhxtKzwwLoq8EFJ9kJ9k8QuaL7BehYwH98lRMQKU/+Ex?=
 =?us-ascii?Q?BGeyBFeKzhr0fxaypgfouJ3pdZCZTaprn45D16qwUbJ28G2JKMawHs08r/iN?=
 =?us-ascii?Q?eSTe1d/RysNC3snzicxHNQd3/TOHSXdGzL1Z9559wRL6JeTVoY/88BGwY2P9?=
 =?us-ascii?Q?Qlgclsoh3fqN/fNwJAbH1QkxX7SJyGmXu9CgK8voQ/x4sVkq42QiXF1EgoMW?=
 =?us-ascii?Q?PwDi/krAA+efdXXLA8H5cWdt5wf7i4YLR7aWm0aAdp0ozDRn0mnmcVYrlT+1?=
 =?us-ascii?Q?4m9wyxRRh1nRfAP0v6VnF/kBHvnsSEhfQyf0ez93ktijVSgWPbxjRiZu33AI?=
 =?us-ascii?Q?/1th9U9HJfMCOSiZssjVFk29Ncn+3J8m89tog1yuucDj6osYpR0KD5G1siln?=
 =?us-ascii?Q?ewR2AQ1b1qGrJAXYro9yUNjs3Jw1eE1zR9ymecnS9qjv8aSjLzQCWlFHTA7k?=
 =?us-ascii?Q?5E2QIUX9vXHg4gU89psCO3/F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dd88e8-9b3c-4a77-2ea1-08d9573eae09
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:54:57.0441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IER4pg1wdKQywFFPWYcyQrkYKMYZAlZ5W5AS7ClasmlIqAFqmkhIGLuG54JiNj4BZpBIp+b8AYpge3QMxoFGbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
Received-SPF: softfail client-ip=40.107.93.79;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

AMD SEV migration flow requires that target machine's public Diffie-Hellman
key (PDH) and certificate chain must be passed before initiating the guest
migration. User can use QMP 'migrate-set-parameters' to pass the certificate
chain. The certificate chain will be used while creating the outgoing
encryption context.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 migration/migration.c | 61 +++++++++++++++++++++++++++++++++++++++++++
 monitor/hmp-cmds.c    | 18 +++++++++++++
 qapi/migration.json   | 40 +++++++++++++++++++++++++---
 3 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 041b8451a6..daea3ecd04 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -907,6 +907,12 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->announce_rounds = s->parameters.announce_rounds;
     params->has_announce_step = true;
     params->announce_step = s->parameters.announce_step;
+    params->has_sev_pdh = true;
+    params->sev_pdh = g_strdup(s->parameters.sev_pdh);
+    params->has_sev_plat_cert = true;
+    params->sev_plat_cert = g_strdup(s->parameters.sev_plat_cert);
+    params->has_sev_amd_cert = true;
+    params->sev_amd_cert = g_strdup(s->parameters.sev_amd_cert);
 
     if (s->parameters.has_block_bitmap_mapping) {
         params->has_block_bitmap_mapping = true;
@@ -1563,6 +1569,18 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
         dest->has_block_bitmap_mapping = true;
         dest->block_bitmap_mapping = params->block_bitmap_mapping;
     }
+    if (params->has_sev_pdh) {
+        assert(params->sev_pdh->type == QTYPE_QSTRING);
+        dest->sev_pdh = g_strdup(params->sev_pdh->u.s);
+    }
+    if (params->has_sev_plat_cert) {
+        assert(params->sev_plat_cert->type == QTYPE_QSTRING);
+        dest->sev_plat_cert = g_strdup(params->sev_plat_cert->u.s);
+    }
+    if (params->has_sev_amd_cert) {
+        assert(params->sev_amd_cert->type == QTYPE_QSTRING);
+        dest->sev_amd_cert = g_strdup(params->sev_amd_cert->u.s);
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1685,6 +1703,21 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
             QAPI_CLONE(BitmapMigrationNodeAliasList,
                        params->block_bitmap_mapping);
     }
+    if (params->has_sev_pdh) {
+        g_free(s->parameters.sev_pdh);
+        assert(params->sev_pdh->type == QTYPE_QSTRING);
+        s->parameters.sev_pdh = g_strdup(params->sev_pdh->u.s);
+    }
+    if (params->has_sev_plat_cert) {
+        g_free(s->parameters.sev_plat_cert);
+        assert(params->sev_plat_cert->type == QTYPE_QSTRING);
+        s->parameters.sev_plat_cert = g_strdup(params->sev_plat_cert->u.s);
+    }
+    if (params->has_sev_amd_cert) {
+        g_free(s->parameters.sev_amd_cert);
+        assert(params->sev_amd_cert->type == QTYPE_QSTRING);
+        s->parameters.sev_amd_cert = g_strdup(params->sev_amd_cert->u.s);
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -1705,6 +1738,27 @@ void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
         params->tls_hostname->type = QTYPE_QSTRING;
         params->tls_hostname->u.s = strdup("");
     }
+    /* TODO Rewrite "" to null instead */
+    if (params->has_sev_pdh
+        && params->sev_pdh->type == QTYPE_QNULL) {
+        qobject_unref(params->sev_pdh->u.n);
+        params->sev_pdh->type = QTYPE_QSTRING;
+        params->sev_pdh->u.s = strdup("");
+    }
+    /* TODO Rewrite "" to null instead */
+    if (params->has_sev_plat_cert
+        && params->sev_plat_cert->type == QTYPE_QNULL) {
+        qobject_unref(params->sev_plat_cert->u.n);
+        params->sev_plat_cert->type = QTYPE_QSTRING;
+        params->sev_plat_cert->u.s = strdup("");
+    }
+    /* TODO Rewrite "" to null instead */
+    if (params->has_sev_amd_cert
+        && params->sev_amd_cert->type == QTYPE_QNULL) {
+        qobject_unref(params->sev_amd_cert->u.n);
+        params->sev_amd_cert->type = QTYPE_QSTRING;
+        params->sev_amd_cert->u.s = strdup("");
+    }
 
     migrate_params_test_apply(params, &tmp);
 
@@ -4233,6 +4287,9 @@ static void migration_instance_finalize(Object *obj)
     qemu_mutex_destroy(&ms->qemu_file_lock);
     g_free(params->tls_hostname);
     g_free(params->tls_creds);
+    g_free(params->sev_pdh);
+    g_free(params->sev_plat_cert);
+    g_free(params->sev_amd_cert);
     qemu_sem_destroy(&ms->wait_unplug_sem);
     qemu_sem_destroy(&ms->rate_limit_sem);
     qemu_sem_destroy(&ms->pause_sem);
@@ -4280,6 +4337,10 @@ static void migration_instance_init(Object *obj)
     params->has_announce_rounds = true;
     params->has_announce_step = true;
 
+    params->sev_pdh = g_strdup("");
+    params->sev_plat_cert = g_strdup("");
+    params->sev_amd_cert = g_strdup("");
+
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
     qemu_sem_init(&ms->rp_state.rp_sem, 0);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e00255f7ee..27ca2024bb 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1399,6 +1399,24 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         error_setg(&err, "The block-bitmap-mapping parameter can only be set "
                    "through QMP");
         break;
+    case MIGRATION_PARAMETER_SEV_PDH:
+        p->has_sev_pdh = true;
+        p->sev_pdh = g_new0(StrOrNull, 1);
+        p->sev_pdh->type = QTYPE_QSTRING;
+        visit_type_str(v, param, &p->sev_pdh->u.s, &err);
+        break;
+    case MIGRATION_PARAMETER_SEV_PLAT_CERT:
+        p->has_sev_plat_cert = true;
+        p->sev_plat_cert = g_new0(StrOrNull, 1);
+        p->sev_plat_cert->type = QTYPE_QSTRING;
+        visit_type_str(v, param, &p->sev_plat_cert->u.s, &err);
+        break;
+    case MIGRATION_PARAMETER_SEV_AMD_CERT:
+        p->has_sev_amd_cert = true;
+        p->sev_amd_cert = g_new0(StrOrNull, 1);
+        p->sev_amd_cert->type = QTYPE_QSTRING;
+        visit_type_str(v, param, &p->sev_amd_cert->u.s, &err);
+        break;
     default:
         assert(0);
     }
diff --git a/qapi/migration.json b/qapi/migration.json
index 1124a2dda8..69c615ec4d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -743,6 +743,15 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @sev-pdh: The target host platform diffie-hellman key encoded in base64
+#           (Since 4.2)
+#
+# @sev-plat-cert: The target host platform certificate chain encoded in base64
+#                 (Since 4.2)
+#
+# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
+#                base64 (Since 4.2)
+#
 # Since: 2.4
 ##
 { 'enum': 'MigrationParameter',
@@ -758,7 +767,8 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level' ,'multifd-zstd-level',
-           'block-bitmap-mapping' ] }
+           'block-bitmap-mapping',
+           'sev-pdh', 'sev-plat-cert', 'sev-amd-cert' ] }
 
 ##
 # @MigrateSetParameters:
@@ -903,6 +913,15 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @sev-pdh: The target host platform diffie-hellman key encoded in base64
+#           (Since 4.2)
+#
+# @sev-plat-cert: The target host platform certificate chain encoded in base64
+#                 (Since 4.2)
+#
+# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
+#                base64 (Since 4.2)
+#
 # Since: 2.4
 ##
 # TODO either fuse back into MigrationParameters, or make
@@ -934,7 +953,10 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*sev-pdh':'StrOrNull',
+            '*sev-plat-cert': 'StrOrNull',
+            '*sev-amd-cert' : 'StrOrNull' } }
 
 ##
 # @migrate-set-parameters:
@@ -1099,6 +1121,15 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @sev-pdh: The target host platform diffie-hellman key encoded in base64
+#           (Since 4.2)
+#
+# @sev-plat-cert: The target host platform certificate chain encoded in base64
+#                 (Since 4.2)
+#
+# @sev-amd-cert: AMD certificate chain which include ASK and OCA encoded in
+#                base64 (Since 4.2)
+#
 # Since: 2.4
 ##
 { 'struct': 'MigrationParameters',
@@ -1128,7 +1159,10 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*sev-pdh':'str',
+            '*sev-plat-cert': 'str',
+            '*sev-amd-cert' : 'str'} }
 
 ##
 # @query-migrate-parameters:
-- 
2.17.1


