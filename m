Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17C68EB9D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgsJ-00072r-5x; Wed, 08 Feb 2023 04:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsG-00071p-QJ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:20 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsE-0005Jh-24
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:20 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3189MokR029603; Wed, 8 Feb 2023 01:36:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=sLUuOHma4/ZROnAv3Dval8LKsi5Df+gvEXQLryvDd1k=;
 b=Cnqstbs7ojOogdB28Xs2CaS+ZG5TY4+tGWIYmd2652lzfqW+Zi7ysGFujSlqm2yaBUT5
 y2wEds3obiwayO46z7QrGcFoBwYQ7lvOrgNywoxi/UA/HAQ/ZEl4FQAi/MaBxZvSeres
 l5dr4RMAYNpl2le9UE7V0wE1SU1EcdsCkHomR7Kf4H5zukuwuThBQYCtKtBuVLuiFAbv
 Ay8jV7Lnp3YMzKb7JZqErnCOcoR/yMxe5pnY/VH/4+WQqfXvUSgV1033Uz5NcdeH7KuA
 eQ4kX7Rc8GxssPOz5JJuL6n3aXE5mEXNt5lnnIzCwfFT4gK+wQt6BO1nfIgwyX+jti88 zw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhm5husuf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 01:36:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c15CSgELvrFVKj7x7vj2o8ash/lGGiRax/1Ixvevn2ckyhXPe3gwcNb9kmtsmlbxprXdf5138p6kIkBNoCggqOIa2BLu37S9iGn91fZVqu5l5d22bHJVoQQYuQOLB/rMydEEca+pnU1zSF7ny6HCLKlHF9enLXrEguX0LLM5TZLMvM/gkAPTVngZVSfD6UX6omDgkDhedMcU1MeD8p9/Qp81IjSFeZ8BoZqgHLxehmAOMiixFuGHHCZPowZSjAEff92RVD0sBKAMi1ALPSk/DETaBCfm70a7Fwzs7U1ZaAGashWeLGh7y6MdMyaZs/8UA22hMR1Xqvgb2ghsvvVohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLUuOHma4/ZROnAv3Dval8LKsi5Df+gvEXQLryvDd1k=;
 b=b/tpdDQZTwUfVX9/YhROWS2/kpe1AxVBlcx11Z/plKG9SW7URu3tdrswz2bMKTy7E7arQvWG6ksQGSkA12AI5KgxtAr8AOjxPAWGUkoxoxbdkAFDo8WweR49asysK8JfBnEjE54fl2H9FHBE2iicuujeOmuSdF0VmChxvPoq7EhP2VYH5bY+JwFUi1NK8lxf9nYOm7dPCPXkIbhq3hFxFFeQNhpDuUEyBSyNnN50nB0IR0yvI6O/l9tAQwfHUDVy/pLtH48HB7CjJj5yjKLR6EIeVP0AAYnzR/i3sF/8wzCXyuYM69RWRRQcs3FoEDYTijn+IQ0wQR7MLFoYdOO6Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLUuOHma4/ZROnAv3Dval8LKsi5Df+gvEXQLryvDd1k=;
 b=qaXOWpV3g3qXBEywKfhVNAxKZJKL68ne0Tm5F1qd6Mj+8L9kUTSprRcSJpwsjVz9I8JRLZ2gNZzNTmtF6tL2NV3zimAtCt2+OhE4hSimLZFq2bHH6cInSQ/CO2KMXAnblqPyQYLXrgpI0PYb0Av3VnP7cuNFRUSyUZuSEmzZwymut8WETAf5LL4hH6cL+IOzG54FngvVGh1DTgJURM9y1PvraAWb/GMW4wwMZ1fUa2gZDxyEzcuAsar1tTblIexmG0bjBnt/j9J51upiGB88z3XOanOvFFDagJvVHuvmMYNmGPiWUFEflxrZEaE/sMttyOkWvKXqWGct4vV1QZ2sbQ==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CH0PR02MB8180.namprd02.prod.outlook.com (2603:10b6:610:f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 09:36:15 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 09:36:15 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v2 6/6] migration: Established connection for listener sockets
 on the dest interface
Date: Wed,  8 Feb 2023 09:36:00 +0000
Message-Id: <20230208093600.242665-7-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230208093600.242665-1-het.gala@nutanix.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|CH0PR02MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e90214-2f2c-4c64-f330-08db09b7ec07
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLxngGr157XHKwVl4EmI5eIfar6e0H62s0qq5hWy2o+0HiFvb7nTsUc0vSBjZbb3m9hocQ4p2ppmuJ+5cOn9l+unUgOe2o8TJmLhUh8iHw3K72MuQmU34xfpD+ZLlOTyZwpoRDnsWMx/b8iEyyBsqZLrPt4TK8BXU4zplWOxhFSe5tMDcpJJpHgQyDDBJGVPhfFEpvoVltE0UeHTNukgoD+GWsKOpXJ8tDjolOJ1DMdBG9BVuzM3TfCOpcQGCGGurnhaEOlDRdzZ7z5LLxz9AYUi5jsCJHem/eP5MZ2eq+CgVRnfmjEj4D7ENee0hIv6dvFP7nrRHsx609JZ/5ho4NdzppEGlorlfwMBsMO2MlB4l2qdKt+TxqkQqk7YTUyAN5g9sebMWOzXLmnzts2rojN+uRYCtu0yEam48hayxazKDIABN45GPUnXdlVu1p8scoAGI0qTWx0qYg0Wau0toORZBSBUmkMITwdThW3CTM7eGi85XT6xU1/YCMR3Fy81Mn8p1hlMgq3eg9OWAVnd0+BkIqtJColhQpI7nmGYSy0XwIZa8XD3Wqewhl/U529rtcYFXf0hzr5n3N2vLqv0iau+6o9X4NtmJSn5YagOmrJqeA80W0fmgaXxEyI+jaRDla8YZuLsnfSrgLyU6u/4XQR4exglkRkI9qL9WtBc+c/RvSoXOS/eof7HEUE8Da4PJiT99p32dac5L3e+42G+OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199018)(36756003)(86362001)(2906002)(41300700001)(5660300002)(8936002)(44832011)(38100700002)(83380400001)(38350700002)(6486002)(52116002)(478600001)(6512007)(186003)(26005)(316002)(66556008)(8676002)(6916009)(107886003)(6666004)(66476007)(66946007)(1076003)(6506007)(4326008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4EDRtX3mpmn0sYVTQD8tUDbu+KL3PhwoRDyClFFcvx1mZJq7idJbO/r9ODFY?=
 =?us-ascii?Q?dkViUI+T95VaS7Drs/tD3P0/t11w2IDjXP0nORGQXBV18bhXsu5z6wsbrxy7?=
 =?us-ascii?Q?4GedkcR8YuAzbhmKRKVZM09gRvdXgjtYWmDT/QpvIwKoIYdY6aaizOXkSYK4?=
 =?us-ascii?Q?ZQhOHZ4frZ3R2tz08G6UEUt4I5IZFoCLO9KzCmBPlvIydfzwrdEiaCAYCyqo?=
 =?us-ascii?Q?1ZFYb9TxFFXaz2X1iIZU+yM30XP7uHByZj9z+wqK7pAoCL/+Z9N0io5w3SEw?=
 =?us-ascii?Q?5ItPkNG+u25ploVCoERvSCvuDBYs5zeYVIOKMwYWu0giRnQZg+gw2cUMs0ZL?=
 =?us-ascii?Q?Gpl0dR/MzHZNbOy0r2Ncs5Zdqj9KPcfOwz1WLeQeqguRyJdzkpRkEaFKjEqX?=
 =?us-ascii?Q?AkY42MPn9Aq8S0WDOX0Ib0iV95s5OAkqlUPEEph1bZE4BzUIz3sDmJgcBrM2?=
 =?us-ascii?Q?+BFEtqSdjQlr9P3UBCExSF2ruaYMRNkxKcNLZhvZeqkgEkzePyMXsqOhSl6l?=
 =?us-ascii?Q?JorAKpYDW+5E7Cmgtr/CnQzgsjilVniREcd7pkBWotKbOMhv6180s7WC2W4p?=
 =?us-ascii?Q?a2lxoLU1rzciaAA7Ss1WiUxCqFV9mp5XywC6UtUMQWIdCBzfmsN9ljJ7KCx8?=
 =?us-ascii?Q?uEzFQbi4jxbC9cgS9QVqvXjpHNM+9bQyFMthDSww7iQ7GiBL4rQCPl4bjyEY?=
 =?us-ascii?Q?eQcWGUzHFoORSefVW2uR9wIUbuIa2mKPbAflnihnh1M+/3vybNeTS57DkDBj?=
 =?us-ascii?Q?Gi32KQ7FCR1erO5LxEv+SowHYbI7l8Ff6IgAvFhJT435KFQ4e6WNuDFV4cnf?=
 =?us-ascii?Q?3TCYQOsk2TvawtvKDmbuJ7fLXoH9YcxD4OxzZDbKxyaiKBMsrrwbXf+ktkCK?=
 =?us-ascii?Q?yP/n0UgDMQUtpt9+v5tBqWef2mPzglKSJefKAzzpiQ/bpBY1kK9uVZEXMtNj?=
 =?us-ascii?Q?KoYvN8UGdxpoU/r0Pz+yWw8YzHqv39P/RtTijG8zEiY02uGreV51QDrX8nQg?=
 =?us-ascii?Q?rFh/F/fhQeNMbSyw4FiCdqVc2ZfhAkF0D9q3YbLQMip0ZEmB6SENZ7eG8Ndz?=
 =?us-ascii?Q?zv+wsC44BObHs9dzomoW3ZhnT6sK7VVmrfy+5LrGCXxYmEvta7aV49rXTGzJ?=
 =?us-ascii?Q?r/RqNB4WHYoEjludSCWir5pUKzswhE2cTNcufv4US9airMVRO1MlwHXiqbJG?=
 =?us-ascii?Q?RsQQ3UiWOUgRMalWns//lBKr4KWtrLSn0lfAuBZcMsBdYnvTAg4eNu/BFP+H?=
 =?us-ascii?Q?8j8zH63ara9UP4kLD1NKlb6powG7fnUZCpin+YpqXgJWkla50iEvkT5rp5iA?=
 =?us-ascii?Q?2/DOkay/M0lPOBm4SR/KR4OcHqJTkej3ynfoGxz3ZvmHQpRvAlF4P32qUfjD?=
 =?us-ascii?Q?KW8m426tUaYPD7Nq5DBxwdg2QBL41UEmBt+dqxh9KK2matRs2UBrJqj+27mX?=
 =?us-ascii?Q?QVBNmPoR3YxvtxTHPB/9qE7WCkxckXE8njwho/DfvORNEV0nKfglyjaa80qi?=
 =?us-ascii?Q?D/BLtromXVvXtNkuQztBEA0MyzpcRqZY3HeYxMjkUHBO2s9rmOL9enNPUzU5?=
 =?us-ascii?Q?W99WVrrqykCZJ/Nz7i7SsZvyV0CK9XjkQeqEugpjI/vHksBY+AgNTfu1XRl4?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e90214-2f2c-4c64-f330-08db09b7ec07
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:36:14.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIfZc0t0Ft0xmSns0t+kUhwCFNJdi9LOPzawnXLX2vGQKCqYXtT2jKhp3wu676xfvkweCFBtk2OkLBW5/zjoFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8180
X-Proofpoint-GUID: jTbuH-tuEb6l5pZkkhPy1Kud-9YUNjMx
X-Proofpoint-ORIG-GUID: jTbuH-tuEb6l5pZkkhPy1Kud-9YUNjMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_03,2023-02-08_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Modified 'migrate-incoming' QAPI design supports MigrateChannel parameters.
This well-defined struct replaces uri string to prevent multiple encodings.
(uri paramter is kept for backward compatibility).

socket_start_incoming_migration() has been deprecated  and
socket_start_incoming_migration_internal() name has been replaced with
socket_outgoing_migration().
qemu_uri_parsing() has been used to populate the migration parameters in
MigrateChannel struct.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/exec.c      |  7 +++---
 migration/exec.h      |  2 +-
 migration/migration.c | 51 +++++++++++++++++++++++++++++--------------
 migration/rdma.c      |  9 +++++---
 migration/rdma.h      |  2 +-
 migration/socket.c    | 16 ++------------
 migration/socket.h    |  2 +-
 7 files changed, 50 insertions(+), 39 deletions(-)

diff --git a/migration/exec.c b/migration/exec.c
index 4fa9819792..8506ad7f18 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -77,12 +77,13 @@ static gboolean exec_accept_incoming_migration(QIOChannel *ioc,
     return G_SOURCE_REMOVE;
 }
 
-void exec_start_incoming_migration(const char *command, Error **errp)
+void exec_start_incoming_migration(strList *command, Error **errp)
 {
     QIOChannel *ioc;
-    const char *argv[] = { "/bin/sh", "-c", command, NULL };
+    const char *argv[4];
+    init_exec_array(command, argv, errp);
 
-    trace_migration_exec_incoming(command);
+    trace_migration_exec_incoming(argv[2]);
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
                                                     O_RDWR,
                                                     errp));
diff --git a/migration/exec.h b/migration/exec.h
index 5b39ba6cbb..5335f7c24a 100644
--- a/migration/exec.h
+++ b/migration/exec.h
@@ -21,7 +21,7 @@
 #define QEMU_MIGRATION_EXEC_H
 void init_exec_array(strList *command, const char *argv[], Error **errp);
 
-void exec_start_incoming_migration(const char *host_port, Error **errp);
+void exec_start_incoming_migration(strList *host_port, Error **errp);
 
 void exec_start_outgoing_migration(MigrationState *s, strList *host_port,
                                    Error **errp);
diff --git a/migration/migration.c b/migration/migration.c
index e22ce2dd15..639d727393 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -528,27 +528,46 @@ static bool migrate_uri_parse(const char *uri,
     return true;
 }
 
-static void qemu_start_incoming_migration(const char *uri, Error **errp)
+static void qemu_start_incoming_migration(const char *uri,
+                                          MigrateChannel *channel,
+                                          Error **errp)
 {
-    const char *p = NULL;
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
+
+    /*
+     * Having preliminary checks for uri and channel
+     */
+    if (uri && channel) {
+        error_setg(errp, "uri and channels options should be used "
+                          "mutually exclusive");
+        return;
+    } else if (uri && !migrate_uri_parse(uri, &channel, errp)) {
+        error_setg(errp, "Error parsing uri");
+        return;
+    }
 
     migrate_protocol_allow_multi_channels(false); /* reset it anyway */
+    addrs = channel->addr;
+    saddr = QAPI_CLONE(SocketAddress, channel->addr->u.socket.socket_type);
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
-    if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL) ||
-        strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multi_channels(true);
-        socket_start_incoming_migration(p ? p : uri, errp);
+    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
+        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
+            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
+            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
+            migrate_protocol_allow_multi_channels(true);
+            socket_start_incoming_migration(saddr, errp);
+        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
+            fd_start_incoming_migration(saddr->u.fd.str, errp);
+        }
 #ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_incoming_migration(p, errp);
+    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_incoming_migration(addrs->u.rdma.data, errp);
 #endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_incoming_migration(p, errp);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_incoming_migration(p, errp);
+    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_incoming_migration(addrs->u.exec.data, errp);
     } else {
-        error_setg(errp, "unknown migration protocol: %s", uri);
+        error_setg(errp, "unknown migration protocol: %i", addrs->transport);
     }
 }
 
@@ -2333,7 +2352,7 @@ void qmp_migrate_incoming(const char *uri, MigrateChannel *channel,
         return;
     }
 
-    qemu_start_incoming_migration(uri, &local_err);
+    qemu_start_incoming_migration(uri, channel, &local_err);
 
     if (local_err) {
         yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -2369,7 +2388,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
-    qemu_start_incoming_migration(uri, errp);
+    qemu_start_incoming_migration(uri, NULL, errp);
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/migration/rdma.c b/migration/rdma.c
index 48f49add6f..0225bbaf3c 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3356,12 +3356,15 @@ static int qemu_rdma_accept(RDMAContext *rdma)
         goto err_rdma_dest_wait;
     }
 
+    isock->host = rdma->host;
+    isock->port = (char *)(intptr_t)rdma->port;
+
     /*
      * initialize the RDMAContext for return path for postcopy after first
      * connection request reached.
      */
     if (migrate_postcopy() && !rdma->is_return_path) {
-        rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
+        rdma_return_path = qemu_rdma_data_init(isock, NULL);
         if (rdma_return_path == NULL) {
             rdma_ack_cm_event(cm_event);
             goto err_rdma_dest_wait;
@@ -4093,7 +4096,7 @@ static void rdma_accept_incoming_migration(void *opaque)
     }
 }
 
-void rdma_start_incoming_migration(const char *host_port, Error **errp)
+void rdma_start_incoming_migration(InetSocketAddress *addr, Error **errp)
 {
     int ret;
     RDMAContext *rdma, *rdma_return_path = NULL;
@@ -4107,7 +4110,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
         return;
     }
 
-    rdma = qemu_rdma_data_init(host_port, &local_err);
+    rdma = qemu_rdma_data_init(addr, &local_err);
     if (rdma == NULL) {
         goto err;
     }
diff --git a/migration/rdma.h b/migration/rdma.h
index 8d9978e1a9..40673287a7 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -21,6 +21,6 @@
 void rdma_start_outgoing_migration(void *opaque, InetSocketAddress *addr,
                                    Error **errp);
 
-void rdma_start_incoming_migration(const char *host_port, Error **errp);
+void rdma_start_incoming_migration(InetSocketAddress *addr, Error **errp);
 
 #endif
diff --git a/migration/socket.c b/migration/socket.c
index c751e0bfc1..6469d615d6 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -162,9 +162,8 @@ socket_incoming_migration_end(void *opaque)
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
@@ -202,14 +201,3 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
         qapi_free_SocketAddress(address);
     }
 }
-
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
index 95c9c166ec..4769a2bdf9 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -25,7 +25,7 @@ void socket_send_channel_create(QIOTaskFunc f, void *data);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
 int socket_send_channel_destroy(QIOChannel *send);
 
-void socket_start_incoming_migration(const char *str, Error **errp);
+void socket_start_incoming_migration(SocketAddress *saddr, Error **errp);
 
 void socket_start_outgoing_migration(MigrationState *s, SocketAddress *saddr,
                                      Error **errp);
-- 
2.22.3


