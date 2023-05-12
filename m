Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D99700A5D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:34:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTpN-0007ti-Qc; Fri, 12 May 2023 10:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpH-0007qd-PZ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:32:55 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpE-0002b6-Nx
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:32:55 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CDMYCK023351; Fri, 12 May 2023 07:32:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=N3CyYJTrOs5js3/oO8ouqvtCB1P/3C/fDCKDz9etPGQ=;
 b=xZnYMuF3eNQbAmz6yH4kvh23AFJlK4r9+LVurnT4Q6koYPfOjQUQnr7X5b5B2ulCteyf
 7crtL9w3ImQf/6RkcRBbfPanYc0bVg2d4jqwHKNT+AYpfTOFEwI449wLzzaBIDrZtoqp
 2jGJH8GCWqs+9m7FH7RrCXyfZOXvk3nI9wFp63SMHZi1AQ9mCvwPUW2bvFPO+lGkgoTU
 AHq+3WX8+qndDe+GCICUrDotNbx37ZMyxC67Dq4VmqBhaMVn5x6tJzqp0Q3zpnQ46DA7
 EzoNLAc8bpRQ9ruyLF4j1Kc0IOoea75P84MIweStsy5twW1VjFT5EWbU8QyXMolRlsA3 PQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf7a9rdy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 07:32:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZOEroN96UoBYsanX8S+QEChYjV+gwK5pxoARC6kc6vMWFn6UwrUruQP6GVFBtVtvzqN8Uvi4CfrGk/99Vnd2sFVTt8J9QBsXPr3cLxpkp5+LLv7224PGTXS7IAvGbgPQ86yMj+tBVrG1eG1PQDXgtGBu6RxraAsrhu+UcBB9OUJP3mP7dRfzy0qCgMCXDzB7QQUtW56EmqxFOGMDXX3hy1woa+64bxguNmLe27u1A3cuJr6WxhO78E2k/Zri2PvyrSzGr+Q/A7Y1wfdrPdNTpmUvWM0RCjhvzxYb2vPhVTulMBFGYd37bobHXtMHH9o6xj42GUamphDa6VcpBmbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3CyYJTrOs5js3/oO8ouqvtCB1P/3C/fDCKDz9etPGQ=;
 b=jWHfAYpy9WDhg/8mSUSyTAJQ0xnosIV5Qsi5543yjU7+xuV4s56VsJfjoHgXvp98SjApTIYBlp2FavfBhrEoH40Ql2PGGtkDltPBSIJXuwab9GqcHqOGZAPrdap+zVxBrgxlGvufdPG97A+vbDIPgEZCk2DndQP75Xm7UiaJrF19m+MPBWG+bFVon2mOm9m+jMJ9HciBoqFo4pusLEmIHC46a/r6Rgu3wuFMgzch/uFeNigTGw78ReF7qMX7rToQwCGArAezh2CfpBcaa+Mbs26W2Mo6inYxUzcjpLZv1iMXiWJqaptofprnsScBPHIikfK/+wtAezwL+gHN7DF4uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3CyYJTrOs5js3/oO8ouqvtCB1P/3C/fDCKDz9etPGQ=;
 b=nv1INIAdLknSuELwWpEiSMRGj3cEFeFZPUUNNu5zdks2jT97UalE7LGfmcMgrscL5CAFqUZSKmSXLoN38EhkVt/TX75YDIRB7YKSXy7dcVEKnmpP2ILD/5wYfuHJUtR0YrMAVVg8EDMqSL96wdg9iaBgbe3ryMiLhKeUYuDToDjp6VJOUUGrp/AA6rwbyThOZEvoHpKysw5CKBxiVpws/LQdAq/cUS+y9Dzs4tOvr5xdcbb3tXLAt5INmCMCErHA2yFM4EgbZnYFsYCJKzR6ok+p0Cg6nrmV6skAnjmQSsW9JgvfT5knaUjp1QZG41iEFhejLWfXepmJrO5WfoFcJw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA2PR02MB7657.namprd02.prod.outlook.com (2603:10b6:806:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 14:32:49 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 14:32:48 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v4 2/8] migration: Converts uri parameter into
 'MigrateAddress' struct
Date: Fri, 12 May 2023 14:32:34 +0000
Message-Id: <20230512143240.192504-3-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: 85e68baa-08df-490c-6f5f-08db52f5c280
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +AHiXQo840pZvSU3tNIHnK9X45pYOAdBHqPhNdftFehubV5zKoUHR2KcEGBttcn9NJ5+53YWVBDod/1HxJLnoWwubtMXl+eOzjIqVklB8af36fFqmpq+q2ll3ZzIVeOBGN+CbIMJycFsgt8iZFnG0vUTJKxH0mNTJk6xFwfpJ5kQRu+NFKmEkZZKqm8liMfszAKXUUqeDKbE5mic9cI3udpQsFe80OTUGVhQyUopni7DSCPzRFMypiI+Ao5wNSXbRP0n30m0qEAIft1Uymj33Ja8VOFkhMxzO/oBC2f58bqj3x+T+tA/V2VfJm0pRQA0978tSwBeFQTIl8214479rotD3IMSPoPDi3AQuIXsobkPgdx2K6u6H/eT/esErtagXx5CbfMrCU98mAfFYtA6ifV2CUL1gDaI1XqQmW9aWlrdE2s3Owo5ZGp8Rxk2iOBXvvUrJVOVkWRYz616raYoEDJeQVPU+XlZ12a4USJXtk8F62dHfdN9MKdEfq2sIsXiebPoSVjIMILPMsdGtkizVjJXLZqi+OfAejWpZri3sIkzXZlN6CT8RkSIOStSVpiVNAm5FA60fERQaEskpUDEQeaYzvBRvrVjuGV5Zrm2y4GfA3LvGU41z5Vl2SIUxYIB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(36756003)(38100700002)(38350700002)(186003)(26005)(1076003)(6512007)(6506007)(107886003)(2906002)(2616005)(83380400001)(86362001)(41300700001)(6666004)(6486002)(52116002)(66946007)(6916009)(4326008)(316002)(66556008)(66476007)(478600001)(5660300002)(44832011)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uGzYZ/HUGQukeyznPhch3kPRzLko9x99OCR8qK2P9WNOn7o6xwDs3bu6Bs+i?=
 =?us-ascii?Q?buEaRAYlh3897DL7TrYDJ7jHHRMQ0c62dRKfUJvCgD04f0Fi2xVUEuhDbard?=
 =?us-ascii?Q?/foeCDBC1x1bnhlwPfYZ7G6k8uJM/wAOJQkx+4m3rOXoWufawJkyaA3cmeGm?=
 =?us-ascii?Q?NqF9S09fUFKuE+SGf2N4saO2+MmBdJ09wCpUT2d48cgBuKhyuGtfHyI58Pqw?=
 =?us-ascii?Q?Qi2bxDGQMvYu+qvGSsuUMZDYTwbgfPS+xyQBp9zldT+S58Bi4h89tbHBZIs9?=
 =?us-ascii?Q?YWGXmc5XUWjQswS1VRkvDOUKabXOQB5PX834v8gTd4icSIXdjr01+7VUqmqj?=
 =?us-ascii?Q?hfABl3rOICrUOJ8nmZHCfKgN3WGi/qZro7nn6OvQl3cCtYLNsbw/Zcyywb4R?=
 =?us-ascii?Q?99Gd72KsrkCQWTNu60G7MfmX9pis5R+bpoXBrfP0mr/m8A0w6wMnfcxbeyei?=
 =?us-ascii?Q?yLhoVNZb19C05LbYqdA4GzOEE9WFe4eOPym1DmHvOVflIO+XPnYJPjl2wlqd?=
 =?us-ascii?Q?piflH6aPpSDA5MTvq9IxsB4Yday3eqOKp+Xv82TsBM8RIm1B/mbV+JTzpSyB?=
 =?us-ascii?Q?54h4LGlnGcaoMZ+N0or5nRMKAEIM10gsxpuWuH12DhSUmMisXaqDuDUFz+1p?=
 =?us-ascii?Q?b2Lz2uFaS1wSvkTYNXUGkihKzABR+RKHyP/BsLdFjNjHbAsIgkeempq2dI1X?=
 =?us-ascii?Q?dJTGvCu5lmCTapJ1ImOKXdd0mkT1Lxei/Rsig3CwQnGgIyctRSy7JltwJGir?=
 =?us-ascii?Q?EO5XyQabKIDFH6/V4HjZHQW34ZosaCMh5HU5byJBq8WAQcluDu2dVSjrbh8A?=
 =?us-ascii?Q?caGpZhs0P1L15JGF85wJQCdRZ0WSVQgwXppWKTCsrSu4VbR0um5OokYwNPJV?=
 =?us-ascii?Q?D1s9SOvKIoOCHKrFhDRMUOiP9cj67YlLrhsvJFBJk/9TinW1FSBLQkHHG0Ih?=
 =?us-ascii?Q?+kWaKN2ul2fwqPr2gaLxcT5fcVfeKrl1wbhA+szD6239ecfoBO5QaIEo3HXP?=
 =?us-ascii?Q?+wd37tt1W/22d2sDuXznrddcL4jSzaU7M0MVGeF414YPE/E51BRUupe1k+2k?=
 =?us-ascii?Q?1frKxtjPAAvlYpBgZMgZf62YxcLT3JyyZuCqzzb5x5FTP6sAV6KlFqT0gzPa?=
 =?us-ascii?Q?Cwzqs4ml3UIgAGGblSUevJb47sT0Jn8VZDj2p1KbcUdWFI2O3wSfQkm9VvuN?=
 =?us-ascii?Q?EX3zQFvOglBjDe3mWki9X7sDC8CntYP/yNQJs+L2bnn3U5PX1OvU1qQDEB0G?=
 =?us-ascii?Q?EkkhD9nKnFbVXYaTi3LXkBkkbT+XMASDV0uf+Xyn6vNxoj8P1yW9wprCcPUc?=
 =?us-ascii?Q?uqmZPLxyvGHiFDIn0jz949S43E5ZsqIT1tLxoWgGC8l87Ydlb0q3ivrzi5PD?=
 =?us-ascii?Q?x/nlYW3mcLqOj7t7zhA7nn1RG1VkRLR4OHXW9DIYUCc6VR3HjHd1ZojY8kgl?=
 =?us-ascii?Q?v0sHeg758rYgZgiQ+5oggitvDLWge7Yz87b/z5D2EZc5XvvjlDuaqNo3THP2?=
 =?us-ascii?Q?b0X5sufq+dgQ78L3oqRJL8EaTR5spHOPKuOMdUZJPac7jRmmgpiN8xRkJym4?=
 =?us-ascii?Q?zatTcExv3Q5GDdDwG62mm8EJ4V1d6QZWVmGdgSThHXIiXF62gqg94WO1OD24?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e68baa-08df-490c-6f5f-08db52f5c280
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:32:48.8542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHJH3JHMJHpqSumtrj7NXnu/rwgpJ/wr5I0iFZpGWSdbInpScOsr9diaddMXfX473UAeO398cY/6/+o+t6oaGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7657
X-Proofpoint-GUID: P2XlSL68VSiLa3uHCN7EG3X9zVrzjY-R
X-Proofpoint-ORIG-GUID: P2XlSL68VSiLa3uHCN7EG3X9zVrzjY-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
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

This patch introduces code that can parse 'uri' string parameter and
spit out 'MigrateAddress' struct. All the required migration parameters
are stored in the struct.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c | 63 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0ee07802a5..a7e4e286aa 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -64,6 +64,7 @@
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
 #include "options.h"
+#include "qemu/sockets.h"
 
 static NotifierList migration_state_notifiers =
     NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
@@ -408,13 +409,58 @@ void migrate_add_address(SocketAddress *address)
                       QAPI_CLONE(SocketAddress, address));
 }
 
+static bool migrate_uri_parse(const char *uri,
+                              MigrateAddress **channel,
+                              Error **errp)
+{
+    Error *local_err = NULL;
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr;
+    InetSocketAddress *isock = &addrs->u.rdma;
+    strList **tail = &addrs->u.exec.args;
+
+    if (strstart(uri, "exec:", NULL)) {
+        addrs->transport = MIGRATE_TRANSPORT_EXEC;
+        QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
+        QAPI_LIST_APPEND(tail, g_strdup("-c"));
+        QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
+    } else if (strstart(uri, "rdma:", NULL) &&
+               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
+        addrs->transport = MIGRATE_TRANSPORT_RDMA;
+    } else if (strstart(uri, "tcp:", NULL) ||
+                strstart(uri, "unix:", NULL) ||
+                strstart(uri, "vsock:", NULL) ||
+                strstart(uri, "fd:", NULL)) {
+        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
+        saddr = socket_parse(uri, &local_err);
+        addrs->u.socket = *saddr;
+    }
+
+    if (local_err) {
+        qapi_free_MigrateAddress(addrs);
+        qapi_free_SocketAddress(saddr);
+        qapi_free_InetSocketAddress(isock);
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    *channel = addrs;
+    return true;
+}
+
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
+    MigrateAddress *channel = g_new0(MigrateAddress, 1);
 
     /* URI is not suitable for migration? */
     if (!migration_channels_and_uri_compatible(uri, errp)) {
-        return;
+        goto out;
+    }
+
+    if (uri && !migrate_uri_parse(uri, &channel, errp)) {
+        error_setg(errp, "Error parsing uri");
+        goto out;
     }
 
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
@@ -433,6 +479,9 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
     } else {
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
+
+out:
+    qapi_free_MigrateAddress(channel);
 }
 
 static void process_incoming_migration_bh(void *opaque)
@@ -1638,10 +1687,16 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
     const char *p = NULL;
+    MigrateAddress *channel = g_new0(MigrateAddress, 1);
 
     /* URI is not suitable for migration? */
     if (!migration_channels_and_uri_compatible(uri, errp)) {
-        return;
+        goto out;
+    }
+
+    if (!migrate_uri_parse(uri, &channel, &local_err)) {
+        error_setg(errp, "Error parsing uri");
+        goto out;
     }
 
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
@@ -1688,6 +1743,10 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         error_propagate(errp, local_err);
         return;
     }
+
+out:
+    qapi_free_MigrateAddress(channel);
+    return;
 }
 
 void qmp_migrate_cancel(Error **errp)
-- 
2.22.3


