Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765156F6015
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 22:32:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puJ8r-0004xF-So; Wed, 03 May 2023 16:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1puJ8n-0004wf-Gm
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:31:57 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1puJ8l-0001RP-Rc
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:31:57 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343IsOBa015193; Wed, 3 May 2023 13:31:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=xc7DWYYslH2Qs0K0nFo0g1QNa3cWsZDTA/RREDRcS0E=;
 b=TDh4LNM6LUjVSvqSDBSyMIFVRf2GVcgz2U8tkZiJ4OueSMlzhFFIF8tu3Swz+A2NtieC
 0XvDxX1sPPF/2zAOZfjOYI/U9K3sq4m8fZqdM4iiBjouN8Fjx0KCf6b/AyHhkFPnLfTy
 zwYxEwBSDOXgltdwsk0TSrah4RwkVaDo/SIqynVqCyltipjHV2T+vCQk5/Fe2OHIlcsv
 zRQzpCx/MhWW9H4Lr9J9P7koP4TVc58bHkzUnmY32GRJvT8WdC/SMgk0ZOgQzjn1qD+d
 Z1eduZTwbHKWUguatMyaoAfqLIZES39/zgNCqOWq/NM2zt7N9vgdW1LF3pXdSO9exEgh Xg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3q8y5b0xg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 13:31:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWFi8i2rJrWLBCFEy8bSzTW3dgkgmZIf7/bRo95ZuoJre13+aukO05w9HiheieFEPgAQrsmjMDBx+4NRg9KF6cLxFA39vWFnHy708w+uSFuXm451jV8tq97MsqXvGHgpPAW8AZAbcwohjQN1ayHkp87UmGHYDg1E0LruCbRM1Hs+nqZN7sHb4GuG+h+EtkjHsj3Ab4YAcX5tQemGUY1dQ7vtobiBJCQtDJgN6frtlpNQ/sDAOTLJBHci4lRJ3yNDubx42ZAjmELtKJYfoRbjN1B2JoS5/1Upwyj5DrAqhrgCHuoqamwah/0xIA6mt+3VzsLAqlfqhpj9JDwp590Y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc7DWYYslH2Qs0K0nFo0g1QNa3cWsZDTA/RREDRcS0E=;
 b=LTxmTdFrOmKg+0a5EE78M9AR1f6+GiWVjozrMIMUX1nopsVKQE7NiM7X5v2A7PTjgkKLNaRH0cstSNW6Vta3gor0IoYygfqdS2YOwtT/UXjNXGQX2mPYU/miXTMg8njTQPU2ZSz/qeDmEjq2BpFY3JzPToVDSBgbOJwzVSKmwSTp1CTcQigZ+SVjto44r2ZPocueVM/O77HGL18SFd3tG7s8pNWNz85UGWiAiK3X5grQNlCp+XMndnw06bQDxhyO/d5jCfzpmcp+zY2C9qILtANep3vfUfW4E1t+8L5zBlLc5huCKhPCnBSBbewA9zKYrfsFPMdRRf1MDcfsp46khA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xc7DWYYslH2Qs0K0nFo0g1QNa3cWsZDTA/RREDRcS0E=;
 b=XugETlaknAu8kuVwdb6ei2E1edBDNSFfNhHpGC1I1sE0Y3+fn7hzVZidtAYq4QflqFuteWVfdMhh2bWznj8tfyI88FIOcOV4M7loEjI1EeC+CXJUFrTwLovjmhM/ZH2WFoYJEF20PK2m+Gp7xRTU0ospJ02fT0tLrdWHUzjXxXKf7jaU8jT8IVHaasUZaJRC/Ky8dOiOgErGZjz3SamIytW4A7r0yamUK6Bn+0e2pXrqQf4gj1rEHoKuz1m0yBDyjeKuCmz6sm/4CMWHnt8fuEJDMiZRTHCNyWiXyyWPElPkAPc7RSGHet70tyToAnSYtZUeotboMUMhX0fEnJfyKw==
Received: from BYAPR02MB4806.namprd02.prod.outlook.com (2603:10b6:a03:42::30)
 by SA0PR02MB7321.namprd02.prod.outlook.com (2603:10b6:806:e4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 20:31:52 +0000
Received: from BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0]) by BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 20:31:52 +0000
From: "tejus.gk" <tejus.gk@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 "tejus.gk" <tejus.gk@nutanix.com>
Subject: [RFC 1/1] migration: Update error description whenever migration fails
Date: Wed,  3 May 2023 20:31:16 +0000
Message-Id: <20230503203116.42429-2-tejus.gk@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230503203116.42429-1-tejus.gk@nutanix.com>
References: <20230503203116.42429-1-tejus.gk@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::31) To BYAPR02MB4806.namprd02.prod.outlook.com
 (2603:10b6:a03:42::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4806:EE_|SA0PR02MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a4cf85-94f6-4ba6-860d-08db4c156e04
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhVdwd6CnC16sHaqXICJOxwa+q7+fvk8vqMu/ojEiQHEvAlSCwUWZ879dX0cCnA6GnJXhb+8qYZ+0+CJKHTxHOylLJjjetR9WH74iGAVTIfMKRHic6Hj5W9YtHpTaOsb3N/mfFt3QIJuZi/VhBkjl5KTAy5vjHY+1h7Ym27W8w0PjAm4c7f968S9j7iM6oLnrA/fO8sQRf6vV4Pt2UjqkZwsTht4VJXrrvy3xCwFJQ6mdIdyEQbzHtKGjE2lWPh0fWff37SWUTsV6yBg4f8vIeyVn3zVNDXk26DXSo0IdREFQBR+osf++Mrchot0kPysAe9GqsPVP8EZjNSfwfsUc9Mn0W/6CdfCgGzkktNum9UqhfCWhzJa708wu4niQ2PKZl85pErDAc2AvsKbLYNYUVv/7qBDAAOjUBhQbL0B+6COic7n71aoRXHrZkIfRTMAHm9ceyWFRuUpbYC6h/p5uL37NQW8o+MMWbATefB44Xghb/AfMPQdh/wLnz0kuV6p8ldGWCl73ywCyQUmFA2j66b5b01gEMBCBtKKVbrmP7hUtaakwhXoQNzvcU0kRQVFYRAZ/jH3y+2gS/QlC+bonTPDid1kTFILuK+3vnifdEx+9ZbLHiPP4P5Hkb9IJVtQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4806.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(66476007)(2616005)(26005)(6506007)(1076003)(186003)(6512007)(316002)(66946007)(6916009)(66556008)(4326008)(41300700001)(8676002)(107886003)(38100700002)(38350700002)(8936002)(5660300002)(6666004)(6486002)(52116002)(86362001)(478600001)(15650500001)(36756003)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bgqC1H88xHQJDEdQ0VRuvfNhsZbMHlMaudoEPxHzhPlwRirWYR1iZLQMcyIz?=
 =?us-ascii?Q?yRJKV5+d3m934bnJMyoKAVbtTe+lNEXA/XzfULZEpgiu5jewEIFiar369yfF?=
 =?us-ascii?Q?4ZKXpEa9Lbfgn8qsR5MCcw8V50wDDY8mQIbDVpNIItoA8O/CISkq2GVlZiwO?=
 =?us-ascii?Q?yIUlTN/UtYtqoUldAI4Kq0dkD52oJDzD/xu6KyTC5//i39NCd+EaTED36CRk?=
 =?us-ascii?Q?e5fAefMmm0oDB8+Drryn5RtvjxcC+Zbnxd0tPuoMtK4EEXkVr7Jxm8M3xowj?=
 =?us-ascii?Q?ccivaoql0r4IYTc6jrszB4keUpi9bzclSN4XaCB1FmgvMNVaHC/FgCL3ZZbL?=
 =?us-ascii?Q?o888ZdQmwOzbJgo4MKPNz3eMRmHbZsq/ZDJBc7mNFuiKyS47sbr+X8e2R1TA?=
 =?us-ascii?Q?Zjf7dyMCYTJ9NQFpeQXA/aZZsj/BZeekjOmbsmNHWBQ11ITiL9hipAHqxyyU?=
 =?us-ascii?Q?dWwHL9xFUm6kplqDXarI+rkchCSB9Q/st5xKGCD1nhocRiBswLra9e7kOwPF?=
 =?us-ascii?Q?/ra3Nnnu46kX2U5rzWhGuO+mmE+pxpWkpCiSwpo5Squ3CC7LaDDfxvX1vwIJ?=
 =?us-ascii?Q?CXf9Fu1JJafvMCXWtetggpBI+1cLdyJXYg08+pSRX9wN4sSQhoffkW35QFQ0?=
 =?us-ascii?Q?tARGJycMdke5kFJYSjaSsOMQol4xtdqoxDQu169INxqHvH1sjO3lFhpC3MGO?=
 =?us-ascii?Q?4fx/rsVeOcgb8JMZ//iERvQRjafHok5gOTRvW59Amvxk/c553dKtUh8FP6zg?=
 =?us-ascii?Q?0Wz/OXThcwm0UJLqOyAWtJpaKiluU9pZeziRECql0IGO9lDdfvDMbvqqDMz7?=
 =?us-ascii?Q?P3/qTJGEw3tTlwnFg+XbVGWMtFVUiGja9FBTxZOYo0Y6Ue27n2M2AnfKXgre?=
 =?us-ascii?Q?KOMB5oHmbif4acxgm5HwrzFuqUBvW+H+tog0LSz7ngWMmg0Ptg2UFKKqT3vo?=
 =?us-ascii?Q?/zOQROKiGqnDxtll0KmZ4dq1ZStUVwVIiSh1O6rkVwLrWQ/TxuCDm8jtNQLD?=
 =?us-ascii?Q?rNu6yJAtJ5puuOA6ySWH/+Ont4ANSmEt3Mf909z4TgdlnxXcsg0M6Ny3Ur7/?=
 =?us-ascii?Q?pQnSFf9Wyfu8ehqBsGzuhuff0KKoNNRCdURv97frFe/xDEncMLaxpaAVDNEx?=
 =?us-ascii?Q?8sptBAveZWUrKIfoMGvGr3IvfU9J9PNBGJOczwMNjT7P99bv+4kpTsE6wY21?=
 =?us-ascii?Q?rMovQI6NJ2/jrWImWqWx6LgGYvMLsXwEWDWYyxndwC4iYZZLdoei13FnecUa?=
 =?us-ascii?Q?wSSaqVyM07cN/G7U40fQEGgpgSCU+Fa0HNWizEHUw41YXFmNF3jFdEDklTJy?=
 =?us-ascii?Q?Jqq6SBcr1CGIxjRfeUPKdCvIlG2zDiZW7CdSIVSUgocWz6PAIKIMVd+oLstL?=
 =?us-ascii?Q?OoGuAPXnwyJaPj3KeVdTQR9AKDMsJbExZioa75VKqMlvjjhdNdysYPvXerS1?=
 =?us-ascii?Q?tED5wcuqk1yMpVe9qgb1Fmd3omh1vovseh/VkdW9BAcxS37MMqCop239KK6w?=
 =?us-ascii?Q?l5WWTK1mL0Urd3yRla1fvNG/xiPPV93xOov4rHdei8hmM6bJrLQwSKVGdHnJ?=
 =?us-ascii?Q?fU82R+EaiiR87crItLr3sbcMECSTdXyn2x/DqMUMcMy7GbLP778oRClpeO+v?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a4cf85-94f6-4ba6-860d-08db4c156e04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4806.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 20:31:52.8264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDGKapGDUzSc+PnM1Dhj4FmgtKOxI/feqmulM2+m71W2qPieKDcOrEUlmdgmDd4WyzU/J+450gXf9n8ygdhZjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7321
X-Proofpoint-ORIG-GUID: gdCg2eAzM1174XMixLCB5wDx_aJqZCx7
X-Proofpoint-GUID: gdCg2eAzM1174XMixLCB5wDx_aJqZCx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_14,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=tejus.gk@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There are places in the code where the migration is marked failed with
MIGRATION_STATUS_FAILED, but the failiure reason is never updated. Hence
libvirt doesn't know why the migration failed when it queries for it.

Signed-off-by: tejus.gk <tejus.gk@nutanix.com>
---
 migration/migration.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index feb5ab7493..0d7d34bf4d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1665,8 +1665,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "uri",
                    "a valid migration protocol");
+        error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "uri",
+                   "a valid migration protocol");
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
                           MIGRATION_STATUS_FAILED);
+        migrate_set_error(s, local_err);
         block_cleanup_parameters();
         return;
     }
@@ -2059,6 +2062,7 @@ static int postcopy_start(MigrationState *ms)
     int64_t bandwidth = migrate_max_postcopy_bandwidth();
     bool restart_block = false;
     int cur_state = MIGRATION_STATUS_ACTIVE;
+    Error *local_err = NULL;
 
     if (migrate_postcopy_preempt()) {
         migration_wait_main_channel(ms);
@@ -2203,8 +2207,10 @@ static int postcopy_start(MigrationState *ms)
     ret = qemu_file_get_error(ms->to_dst_file);
     if (ret) {
         error_report("postcopy_start: Migration stream errored");
+        error_setg(&local_err, "postcopy_start: Migration stream errored");
         migrate_set_state(&ms->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
                               MIGRATION_STATUS_FAILED);
+        migrate_set_error(ms, local_err);
     }
 
     trace_postcopy_preempt_enabled(migrate_postcopy_preempt());
@@ -3233,7 +3239,9 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     if (migrate_postcopy_ram() || migrate_return_path()) {
         if (open_return_path_on_source(s, !resume)) {
             error_report("Unable to open return-path for postcopy");
+            error_setg(&local_err, "Unable to open return-path");
             migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
+            migrate_set_error(s, local_err);
             migrate_fd_cleanup(s);
             return;
         }
-- 
2.22.3


