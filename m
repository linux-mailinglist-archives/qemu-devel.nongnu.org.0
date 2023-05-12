Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97546700A63
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:34:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTpO-0007tk-Ao; Fri, 12 May 2023 10:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpI-0007rA-Cq
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:00 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpG-0002bW-95
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:32:56 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C9Pmi5017311; Fri, 12 May 2023 07:32:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=4byoTQHgW9p8E0ZdfBu9N/IDzwaj3mwLPK1b8AllrFU=;
 b=wFjdlxyXpKtLWid+L8PJRtMgMICGTjp9CfpnPc+jgrQXzs6lritDj3mp3a6ksSg6vNhd
 JHTLzOZ/l7mXLiQyilZJwZB2LCJw5J/kazLmD2w6vuJKdKHpHdfsFQZG1+/OR34cgmhN
 xPUDj8YEuKN2jsdbD8fBzLf1Pw0U0e/Tal/NHFUIejkgiIRwWaeD9116IQtTP05DEOY/
 PUevsysVlQF12y7YGDZL+XpGRC/zbZQk92fZs/YkEoancoBy1H/rClJOLwPqi6UoyrmZ
 nCy/iIA79YEcwQZLy/QaSzG7tEdkbfAL7Cxwt5bQPJTP8KYOFlQr+G2snSkJKhL3LBNT NA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf7vv9x1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 07:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFMOV2jY8vcXywuZl0+abWc4PRsGABKF+iodJjYrN9K+xVGEZ1iNt5ZQ1VIUDPPOsNvvEV3qSrqmgj9fvCdrOq/y0jlZLqOP1ivTiaToCz+HTWB09us50V1jwOfnrrvD9IPoZBfDc43FLQikcpWghUvvbX+b3b9uEhvZRqm5ZQZXfiGz9QdX6lnjUvlU3LPBAXnl76rTNq59vzyD5ztXLl/46PdxfLXL7r59Gcvk7Ag91af6I1xZZJh8DmeECL+ACYHUpzXbbsywkzWgp7bWoMFSPisxuGvAzXrKYyD7Clsm4UsxO8Orz+KE6dNkXCzdN5od/ZO3sAcZrF5LCqiHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4byoTQHgW9p8E0ZdfBu9N/IDzwaj3mwLPK1b8AllrFU=;
 b=Sz2i+VAVLloQmzW8CkKYWoWImcy41zHquvy/zJSoR8GCW993hzVWzJTZWwukw5sMcKSRUKK8nwhlnOlVc5U1iJn7ztk1jWA8ON6FO34Zi7EZOxeSl0HElsxULoJYrFd7gt/yg2bwOyCi9uIByb6Sl9j5DUxXGPk3/4xD4wFpZ1sQEb14TUabmLeEGnzb9AIvAdqFv3qsYW1DZ+6ScWV7rUIHuB0BuTtkkKKyB50yWuQc2OfCwWU7E4GZ43xEB0o+WliGroQHNeKEHsn+p/qZqrnH6zfPPmrp1yfzqx6PAUrSmNWretW6tAGiReCvvssBwYktfrd8FfzDnWFBttrWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4byoTQHgW9p8E0ZdfBu9N/IDzwaj3mwLPK1b8AllrFU=;
 b=nDZBPV49tOVSl6S7+bSsXZlqlZmhsXiNuybMLdIMtHYENMwS87V9N6qDQAX8yGFxXElr8TZDrOmuAMvWOLrXr36Le9yTGDFMFH/lWaZMNmGgbRDjivYry1XISGzHdTS+4SQUXl3IdWFdevUsJ200xxC1LWS/6ghRQ9YTjhdsPBobK8uaiZQeZflf2S2vXkYpX1et9AVDHaDb16BtPvSH9N/Ov7YgNKxW1n/QQ40/SvhlAr89BVkyFRCVIdFXMRuN3pCpB6l53JcD1oXP9fTYyNDdJPL6z3f3jBcewWBoBTbLuBeoaoGLXNK1s3iI0/APz5NL+QrY5CFs/ynYOXIgvg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA2PR02MB7657.namprd02.prod.outlook.com (2603:10b6:806:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 14:32:50 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 14:32:50 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v4 3/8] migration: converts socket backend to accept
 MigrateAddress struct
Date: Fri, 12 May 2023 14:32:35 +0000
Message-Id: <20230512143240.192504-4-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230512143240.192504-1-het.gala@nutanix.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SA2PR02MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 6273225a-0d36-46f7-117f-08db52f5c36a
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dScOlUlfopojwkY0EnkvoTY3inPBBFonLsy/8jKRJzii7kJW4+OeCoSf3Wc5tURl6IqMPxawto4YJbODGcL3x7fej7G8qT5bGf/o6Bx8Y0k0tGM025s+9rKpEKpewUF9hImy1exxfgBLkI1f959LyX7iyPZcyomuteJm4CLcZJRE1gA5EW3LDFeKKepdkCmPRzDkHKE7w9p0DB3/Ouhu09J0LVFxuKPcEinpNJsuxr+c8ueKMIb2SEiYtm5MuUy+DmMfQAdRTQRBWcxDM4rSAfUp/0gIOnVrA/P8udKP056VJ7XFkyBqItadDhwHA2aS/jM4JPNUyMLEFhyqmd/6FI6jQNlqAHFL9X3ZNB7EdOrWOkpiLaJtcmAGoQBicDf7Lhn3DXz/uPB66xzmtJpNJJjVHzAJW4OU5zQ6qfdojIgtmP2pQoc3TkTjH1FN3U624JVwXNqhvNXjaWuDjkpWLQ2ORyHIywLswliM56FjoVL2Ypf1pokhR+uK+dPieQE9c6n6bd1TFI+0eSJ89ODtmD51y1lpSRnNhQmysSU4LdROpOTOQp0CRyThpx0Wmk9hIfk1TplJAhmqpjyBHt9GiRwrSePqRbpfo7TLoRt6TD0tdNFDGEU65bRCwJOD88Ms
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(36756003)(38100700002)(38350700002)(186003)(26005)(1076003)(6512007)(6506007)(107886003)(2906002)(2616005)(83380400001)(86362001)(41300700001)(6666004)(6486002)(52116002)(66946007)(6916009)(4326008)(316002)(66556008)(66476007)(478600001)(5660300002)(44832011)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yTreaZj8oQFt4R3LgY7ZIMl87SLyvFhxejoQqLUtMK4jZgCCBSo3BVut/EUf?=
 =?us-ascii?Q?NiDaiWsTWBHe0QhdLCs10Pn3TS/mX5Pm+EiYHFqyf2n2LEdou07Q3ZLE272T?=
 =?us-ascii?Q?auGhL83wnEid9JqMJbaL2R25RUCzBaE4TZW4qad4tLjDk4HLXaIp7pKhRRVn?=
 =?us-ascii?Q?wfTRkSbVGI3ZbAP2KvHFK3T+R3Sq/slCzBJU/gVRubiWKp24ocZZksD+b49R?=
 =?us-ascii?Q?3UZjv+uNyFx8PsQWfiJblHQkSxeiMf0BcriJjXHRMSz6VaifTwr2hesWRr5U?=
 =?us-ascii?Q?n3pgKIzMKxRrS7H0OQwLbjwdy8GSNcTJLZXdvufEhQ2Jwtd0mqkfB7bQ2GlV?=
 =?us-ascii?Q?jmk1mvOBJQCL2k9ojwAv3glliEnqNXy1vZ0t2WtVdKwmzgNZ2rsnd53AvtAg?=
 =?us-ascii?Q?r7FOWkQ5Qb1B4RJAJSA+PPRE01XUCemp3Lohub8Ht5iF3XfA/g6Ea7IHfeUA?=
 =?us-ascii?Q?E+sAp2FGYkJ4pQt7NnKzFf2hUDBZ3q8xlBqtXVf2VG7A2UZnZmggzG2XxdTA?=
 =?us-ascii?Q?0gCE5iOjvBVFDGtvknxSjrmHtYcjqD8mn6skG2vUEe8kr5Cy/Zi8Ir5Lf6bo?=
 =?us-ascii?Q?h071MFzKRULdz7vc9pqo3ejrucHS2zRJAA8B8yl9qcnvX6VlzDxhM+qFzuDi?=
 =?us-ascii?Q?alC6Ww4yfBZ7D1Kv/nxArnMwb6CkmXTDfHl3IseXXtQsgd6uP+CZIa/Tc20V?=
 =?us-ascii?Q?fvbyswldZOtUe6iv8+3ba5YtywDpLU+wQRgHsopzuEFuP/YcGpY3hASQ9PkN?=
 =?us-ascii?Q?iZYhgBo6lTPp0lEuq8NmTt2tk3FpXP/QgOKgeeTM20zzqFmg9avcA1aohc7R?=
 =?us-ascii?Q?ZzpuOhHWPUoihXi7TmNmKdcff+N2itxzgtHL2tcLypQVD6IWolCi97d04/am?=
 =?us-ascii?Q?KqPlm/nV4BqMvYoskOKes/GUdBtYddrvqidQ9zlPNOW7SAmK8es2v/QOWlfw?=
 =?us-ascii?Q?buuncajTKWH68/w6pQfg2WKDONTpVBani9+KKfQjXDqCzSek01H0xMvHlHW+?=
 =?us-ascii?Q?jKqOhy/Acj4xyPeh8GZKmnedJrpsKVEeekpiWELrgTzMpfajKMOLmPHQixdh?=
 =?us-ascii?Q?3MS0GUm9UStRaQWoZ76DDqSRUSgijcvjJO9Syxv4+CpEssVfaESDRy7ptVKY?=
 =?us-ascii?Q?7xMEYE4ainMiSrguOU6TDmP+1FDTdGoLVf4I+zIYK2nJmZp+uVdgvY0qHzKI?=
 =?us-ascii?Q?fntrKnudbK/P5QL4KvZfLm1zNN5+8QI+kw9/ylpW+ZCJ8I9esy2HdbplUi2d?=
 =?us-ascii?Q?7XpkgAMyLS23NTJjh/xo5ZyUx5YxfjuuKJtJpcpMTcbapjAoaYTko5vXCfsd?=
 =?us-ascii?Q?Ufz5CjQlxs3SpaifVLM1xY4YaadQLZRVxSJUQh6JsyGN5PrR058TXLsJK0zt?=
 =?us-ascii?Q?RCao07oNTMyCEoYGsfWQw3waUhouV1BP9b+HF+7jxQvocrrTDIVkDGSarATF?=
 =?us-ascii?Q?ffXp1vcVOZaB/zQ27FcwvcRyKTQNN1mceaZIA/ukcOplR/YCVL/CrzDTHhoO?=
 =?us-ascii?Q?W70AhT97JiQ7rdIG5b4Xn7vQUiQAhOPjKzRZy13Q1z7UAarH/iXEeIVwgGUU?=
 =?us-ascii?Q?EgjAl2Zr6a8nOAELRuxTOyBlIxrMm0aHXqiE/rMbDBW+G6vYx8H7u3R9elnR?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6273225a-0d36-46f7-117f-08db52f5c36a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:32:50.4077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g38xsVKZWQNIChBVvHzz8o1ZOhX7OvWrGjhzXW8A657aOfGPUBIVX4LcDAsKEFzlrUvqD8uBMRvJNhpvXPWcpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7657
X-Proofpoint-ORIG-GUID: Opc0S_bmm_AWNJ9GhI0P0hbb01GE6_Cr
X-Proofpoint-GUID: Opc0S_bmm_AWNJ9GhI0P0hbb01GE6_Cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Socket transport backend for 'migrate'/'migrate-incoming' QAPIs accept
new wire protocol of MigrateAddress struct.

It is achived by parsing 'uri' string and storing migration parameters
required for socket connection into well defined SocketAddress struct.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/exec.c      |  4 ++--
 migration/exec.h      |  4 ++++
 migration/migration.c | 44 +++++++++++++++++++++++++++++++------------
 migration/socket.c    | 34 +++++----------------------------
 migration/socket.h    |  7 ++++---
 5 files changed, 47 insertions(+), 46 deletions(-)

diff --git a/migration/exec.c b/migration/exec.c
index 2bf882bbe1..c4a3293246 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -27,7 +27,6 @@
 #include "qemu/cutils.h"
 
 #ifdef WIN32
-const char *exec_get_cmd_path(void);
 const char *exec_get_cmd_path(void)
 {
     g_autofree char *detected_path = g_new(char, MAX_PATH);
@@ -40,7 +39,8 @@ const char *exec_get_cmd_path(void)
 }
 #endif
 
-void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
+void exec_start_outgoing_migration(MigrationState *s, const char *command,
+                                   Error **errp)
 {
     QIOChannel *ioc;
 
diff --git a/migration/exec.h b/migration/exec.h
index b210ffde7a..736cd71028 100644
--- a/migration/exec.h
+++ b/migration/exec.h
@@ -19,6 +19,10 @@
 
 #ifndef QEMU_MIGRATION_EXEC_H
 #define QEMU_MIGRATION_EXEC_H
+
+#ifdef WIN32
+const char *exec_get_cmd_path(void);
+#endif
 void exec_start_incoming_migration(const char *host_port, Error **errp);
 
 void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
diff --git a/migration/migration.c b/migration/migration.c
index a7e4e286aa..61f52d2f90 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -421,7 +421,11 @@ static bool migrate_uri_parse(const char *uri,
 
     if (strstart(uri, "exec:", NULL)) {
         addrs->transport = MIGRATE_TRANSPORT_EXEC;
+#ifdef WIN32
+        QAPI_LIST_APPEND(tail, g_strdup(exec_get_cmd_path()));
+#else
         QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
+#endif
         QAPI_LIST_APPEND(tail, g_strdup("-c"));
         QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
     } else if (strstart(uri, "rdma:", NULL) &&
@@ -450,8 +454,10 @@ static bool migrate_uri_parse(const char *uri,
 
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
+    Error *local_err = NULL;
     const char *p = NULL;
     MigrateAddress *channel = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr;
 
     /* URI is not suitable for migration? */
     if (!migration_channels_and_uri_compatible(uri, errp)) {
@@ -463,23 +469,32 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
         goto out;
     }
 
+    saddr = &channel->u.socket;
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
-    if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL) ||
-        strstart(uri, "vsock:", NULL)) {
-        socket_start_incoming_migration(p ? p : uri, errp);
+    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {
+        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
+            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
+            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
+            socket_start_incoming_migration(saddr, &local_err);
+        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
+            fd_start_incoming_migration(saddr->u.fd.str, &local_err);
+        }
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
         rdma_start_incoming_migration(p, errp);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
         exec_start_incoming_migration(p, errp);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_incoming_migration(p, errp);
     } else {
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
 
+    if (local_err) {
+        qapi_free_SocketAddress(saddr);
+        error_propagate(errp, local_err);
+        return;
+    }
+
 out:
     qapi_free_MigrateAddress(channel);
 }
@@ -1688,6 +1703,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     MigrationState *s = migrate_get_current();
     const char *p = NULL;
     MigrateAddress *channel = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr;
 
     /* URI is not suitable for migration? */
     if (!migration_channels_and_uri_compatible(uri, errp)) {
@@ -1711,18 +1727,21 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
     }
 
-    if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL) ||
-        strstart(uri, "vsock:", NULL)) {
-        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
+    saddr = &channel->u.socket;
+    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {
+        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
+            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
+            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
+            socket_start_outgoing_migration(s, saddr, &local_err);
+        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
+            fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
+        }
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
         rdma_start_outgoing_migration(s, p, &local_err);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
         exec_start_outgoing_migration(s, p, &local_err);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_outgoing_migration(s, p, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -1739,6 +1758,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         }
+        qapi_free_SocketAddress(saddr);
         migrate_fd_error(s, local_err);
         error_propagate(errp, local_err);
         return;
diff --git a/migration/socket.c b/migration/socket.c
index 1b6f5baefb..8e7430b266 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -108,10 +108,9 @@ out:
     object_unref(OBJECT(sioc));
 }
 
-static void
-socket_start_outgoing_migration_internal(MigrationState *s,
-                                         SocketAddress *saddr,
-                                         Error **errp)
+void socket_start_outgoing_migration(MigrationState *s,
+                                     SocketAddress *saddr,
+                                     Error **errp)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
     struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
@@ -135,18 +134,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
                                      NULL);
 }
 
-void socket_start_outgoing_migration(MigrationState *s,
-                                     const char *str,
-                                     Error **errp)
-{
-    Error *err = NULL;
-    SocketAddress *saddr = socket_parse(str, &err);
-    if (!err) {
-        socket_start_outgoing_migration_internal(s, saddr, &err);
-    }
-    error_propagate(errp, err);
-}
-
 static void socket_accept_incoming_migration(QIONetListener *listener,
                                              QIOChannelSocket *cioc,
                                              gpointer opaque)
@@ -172,9 +159,8 @@ socket_incoming_migration_end(void *opaque)
     object_unref(OBJECT(listener));
 }
 
-static void
-socket_start_incoming_migration_internal(SocketAddress *saddr,
-                                         Error **errp)
+void socket_start_incoming_migration(SocketAddress *saddr,
+                                     Error **errp)
 {
     QIONetListener *listener = qio_net_listener_new();
     MigrationIncomingState *mis = migration_incoming_get_current();
@@ -213,13 +199,3 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
     }
 }
 
-void socket_start_incoming_migration(const char *str, Error **errp)
-{
-    Error *err = NULL;
-    SocketAddress *saddr = socket_parse(str, &err);
-    if (!err) {
-        socket_start_incoming_migration_internal(saddr, &err);
-    }
-    qapi_free_SocketAddress(saddr);
-    error_propagate(errp, err);
-}
diff --git a/migration/socket.h b/migration/socket.h
index dc54df4e6c..5e4c33b8ea 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -19,13 +19,14 @@
 
 #include "io/channel.h"
 #include "io/task.h"
+#include "qemu/sockets.h"
 
 void socket_send_channel_create(QIOTaskFunc f, void *data);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
 int socket_send_channel_destroy(QIOChannel *send);
 
-void socket_start_incoming_migration(const char *str, Error **errp);
+void socket_start_incoming_migration(SocketAddress *saddr, Error **errp);
 
-void socket_start_outgoing_migration(MigrationState *s, const char *str,
-                                     Error **errp);
+void socket_start_outgoing_migration(MigrationState *s,
+                                     SocketAddress *saddr, Error **errp);
 #endif
-- 
2.22.3


