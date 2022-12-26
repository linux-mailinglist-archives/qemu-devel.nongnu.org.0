Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9494A656026
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 06:35:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9g7n-0003wH-P5; Mon, 26 Dec 2022 00:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7l-0003vv-FO
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:09 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7j-0001AS-AT
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:09 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BPImvYt013223; Sun, 25 Dec 2022 21:34:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=sptYFKhHmB5as2mzr5juLcCnIJK9/aLv7spbz6tV11Q=;
 b=yh1tC1PRhtn/nzFeeZfj0N2hIkLkpFsoV9pGAzAK/GyjqJz9YwjtqHF389nvqteep+5r
 B0P3XgY00YAnsIbKC8QUAt0q7MzpYLYo6M5Q8LqkyAZ/9HHTUNewkVSk+U96EVMRY1nN
 X8FywLcYdBEMgYNodk0LqB1xHyFzsR2LScfoF31p4thqc8BmXH4h5kMX6ivx1kvTbypS
 /Y1xkIrPh2qyUVL0uoIVa/VThR2YHUJ7DTZHPZZRhGy1kymsAbPxXovvzjQzzmu8tzlD
 gdhYw/6Gr1iy+fVAWsFz7i6GgttjarB1KW2ydlVHH6/mLTgt3F712ONWikiXbtpcXptI sQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mp1cnuc0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Dec 2022 21:34:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce9K4cindqvdXQDjN4ZDR0Wl5JkSZdlfA4JcT62Z/BgNftMOlwG2a1TkJS5yYpvkiEqhwPYWQhu1Xg699VFaH5Um3t5dFM/Hc+8bkXrI6wSnBYb9JA6vqyTWJrGxC5Ogsi+MMKTh47BqtB3NTemds08fpSeH24MqBzZUAmRXFnROqNrRtzI9Q5GfQV9s5+cbqK3BuZTVmY/6iVHVzb54Ilspb0WQKE+szL4uGjq2SvIJFlFC3DPrymoRJzQMfzxj80NXYDOGq4oii7xF6L0trZwdSnLYcQpukflAhhEgCS8gJ0rtK7nXD/RSHyf/pYU29iM9GPhGdMdXqcReNQ4bTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sptYFKhHmB5as2mzr5juLcCnIJK9/aLv7spbz6tV11Q=;
 b=g6SGP4gcKnjs1PnS2TrJRzRbJcEWISBpx4BLEGxn54QxoxkBfTu5f1G0wA7SmoPkjyX61v6ZGcwbGtmdviYkZOmzP1kIERkdU33Vm86JCgB91BcRMu3qgVZnXurXcPCmnfME2RQjMtpPAuNBHF5nr6LjfMftO7AD1A/OU62Epu6ifvRp58mU8KR07CroOyywMI7lBXv92opgVNC3WYTXmkd+FYN2y6cno649ObFqNY8FZp8OIY0Og0NiK29308TLZ51vKQtJs6p+cKdXTPeA7rxuMcPqnXHg57iGhLVWi013m33P3hBU7s6w4AwGd06iXMWLlOt/Jikd4rnqeuYX1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sptYFKhHmB5as2mzr5juLcCnIJK9/aLv7spbz6tV11Q=;
 b=BgEjD8XmIW+49wB3+eEbwCdAVbNJje/bkqpKD6JGmqJwwQdw2g56z+yh7vUPjCjxPbyeZOXQSB/efr3MyFyuAb5oOeqlcJyQ8SUQywnVr0HOxVIBzaNI01M7BAgq5lgg9QauLOjWJsjcR5ca7z00F9PCYYa0y7bhX9yxnxD6a1LvqwVw7G4TzZBEgJaHxcS0tsSXvkQXhc5N8HSxCTCEqu838UdnPA6PQ40ZNPCkPVEl8NnuKQfSyvzccm58DtD/g3ytHMmEH7u50Y6ZJBV5/HEGE6xrN+WLTAee0ppn5AglpLqsUim9AFHBE5D/zSyCJ0F3uEzR99+YnADefyqIHw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH0PR02MB7655.namprd02.prod.outlook.com (2603:10b6:510:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 05:34:04 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3%6]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 05:34:04 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Author Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: [PATCH 5/5] migration: Established connection for listener sockets on
 the dest interface
Date: Mon, 26 Dec 2022 05:33:29 +0000
Message-Id: <20221226053329.157905-6-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221226053329.157905-1-het.gala@nutanix.com>
References: <20221226053329.157905-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH0PR02MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: c19089a2-b6af-4781-b088-08dae702ccc3
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C4gbYe69xj5heLCbKFR9o1IYuH0pPMy8h5wd4ChUQVdcZDzRaqlAlTArXlaJDTG84XSNiuavw1ARR54n/GOhrotI8qAViL8gtsqQiDX3amEWYfK8zeWrH9tolAonz4FWo/RxIlzh+3fQYFxDwes2+G+upPbBom3siUozql+WFqZ9hnxsnZAg2D01FibVnVlx2oJ9Y2AVYRQL0bPC3DjlSgnPR5o+BveVJJSiHdcHjSr4wOi6UKizb3AA1ah4hGQgf5i2Uwy6bc+Q7f+wyVhClRkgn6/4O4KiVuX7kRLwhBHsHLA6i6Dl9SoR45Xiszf3ahKPd3I1k3ofPBlH/9lMNT7cDIJLIa7V7zt2eJ3wHae61gOLaX3/oUeyjHY8Q2ndluQFrtU8G6FEsO6OBd4AxL/s7Es/0ho1Ej2VqVMJ+UN2qlqbgXsvr4xQdnF6Qt453a97SVDyjO5kYl9uXxt0jIGBPJ6wM2Hz12QPeJP7msm30xkwb5sOW4P8ydOZpzmZ71QITtxaDTob7NGmQSh3dwQJPOv88vhC0SCuXdaNNn0s6bIxqN/EZSjJ3oPjYqmeq53yZ5srzN2j1qqKIFrzbvo+aVF5zf/UBBjMxSZOvKeooi8qy0UG1CpO8GBbzTullP/8Ee1c8MRBTYg2rdsniTuk3vSmadVtAdvx0gv5Tq1zoLmV5QgsfYr17KsHHx3F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(396003)(346002)(376002)(366004)(136003)(451199015)(36756003)(86362001)(26005)(6486002)(478600001)(52116002)(6512007)(186003)(107886003)(6666004)(6506007)(8676002)(66556008)(66476007)(5660300002)(66946007)(41300700001)(8936002)(2906002)(6916009)(316002)(44832011)(54906003)(4326008)(38100700002)(38350700002)(1076003)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K7tPWzLJFN44ylumIb2wXXa93418xer1Qr6lvFqC0XQIGcvy0MYoO94Krpd5?=
 =?us-ascii?Q?sRcICNnNMNYYNCiS18dWwvBj990/qZqcLzaR8PCZDiFYIeVJaNfUpMAcxV5S?=
 =?us-ascii?Q?3rt5uLU/L1J6GliMZcke3kgn07fXbKKSxPLQ+if4BftFlDfONO4Aoi9BnMYf?=
 =?us-ascii?Q?POzdk2o9hloCPUJnAgZcS5+9uH+W/7SFd2LqdOS8WIlQ2LuFSO1B7RUXx/DR?=
 =?us-ascii?Q?SQZOkaaCw670G8mnP7XDSLcqqoHsaln708t4BQ5uTS+x4U+A9XYHvIDfeSz8?=
 =?us-ascii?Q?34GKUA9DAvGtv4zGSxSus2SbEONlZsOIePzen/Z7zRBAtY8ZbyuwjEPfrpsJ?=
 =?us-ascii?Q?dLKNUcMb4RUxoksGgm+3t2w2cDUVBAMIMt8hgMqDeG/Azexf8Fb3pk5VyAQV?=
 =?us-ascii?Q?D6g+wzbJYYTAFjYQC4lYtgghqyR/XdoGHiqPYp8xtE60rulfMlyXu6fScJ+6?=
 =?us-ascii?Q?ciqtMlIN5RRPPKq/E8T9b8nku0SuekeJfuUcKuNfyJIB5HXQDyzZ8IvQ45xB?=
 =?us-ascii?Q?HoP0NkGvKR0/JuN0FE4+0jaWlLK7vi+r2eHI5TwAIHpI/RVhTqGxeYg7YetY?=
 =?us-ascii?Q?g0Yh8IPsvPhlubbL/PcvS3tNT8DxzYKQGjBNHJ2V08aPYmp99DOg+diqnaag?=
 =?us-ascii?Q?P/V7KGBK9gJpB+/po51izuVihCwRPh7qjawsmpAWv2rryXWbyySdPk91SLHX?=
 =?us-ascii?Q?KTg8v2/8Fm9TNQi0wIoXpNJd1c5nJRbi7ZJKBVk5w5oA8ozd5A9hOGZ3NQKp?=
 =?us-ascii?Q?yOpimJCDBDGQMWq1rAT5xmC0KNJ6+vCkGVvJOZMD1k6kox+fwLeRLpAR+jAE?=
 =?us-ascii?Q?TCbSjtNcKLp/XyP/d7x3KIYLsxQuvkEN6XxTocSefCRCjKq+93FRIW2W6FOC?=
 =?us-ascii?Q?hSL5v8M9gpHrsYCGjUT6OWfP4aBiXsPL4I9gFnfHEamI/IQHvzX2bDbk3VeY?=
 =?us-ascii?Q?I7QHOyyQYZR/yvOUEaZFhPBPCRrmt5DZjXLEXDzYRROuElEvJzKeQcNSBJlV?=
 =?us-ascii?Q?L0Q4FN9z+FgbGbgCqZaUbSNtwO++q6RDvUioH6Q1eSczBRM+4/6Vi3fWra4j?=
 =?us-ascii?Q?jROD142AWguAWBRjqTwMUXoYvKWzfOSrh9ird6FtoC/zqhVvLm+oRGmXxD0U?=
 =?us-ascii?Q?XMcB2YHArWEBebDYGR0pZbaboK1qSImm4CrD00ZHTpxoBcpnyi/DNK+qtIfe?=
 =?us-ascii?Q?blAb5nQT4+N/O2i5xXXUE9giQ9l+nAP7pYJmxIGC1FqXf1BwJybwxc/OQl5P?=
 =?us-ascii?Q?Jc9BetEcxyZEuPLI2s2AAUtt0ApOyfubUmmOvm61zSL7BNWpKYmlNxFSGw1D?=
 =?us-ascii?Q?R1zwOJ44FNiF5304b6TpCgJb7dnHsTYkRcwPBX5WwimP/qyvrHTb7cZKT/Dm?=
 =?us-ascii?Q?Jsf5w5KMTd//TC3E/iiThbncBPRRlB+wJ5Lwu5EeLaooaqcual+QtvW4GD8w?=
 =?us-ascii?Q?JcKbrn5xjyrWpnX9JVVTtLmXe/fY1LkXvxbA4p7iBpx1x6fdeoiY6aw/O8oc?=
 =?us-ascii?Q?OvU0aM5hoxKAKUCPRMoFE3oKjPVU+fOGxUpRiGQyiXTbhhMbnMS7joY1m8fi?=
 =?us-ascii?Q?zUMyQK1iJ0nbq9FR5tYyfTnIVCOvtmxQg18XXBpDDm37gehk/vfXl1X22PF3?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19089a2-b6af-4781-b088-08dae702ccc3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 05:34:03.9548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GhoFV0TWm5Te8Sm/G1J3UX2IMIfXmutvi4vTkgg+OMgSmW5UH2TmYowPPoXCdeCwT0NqQXDqXAnUSUaaTrNng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7655
X-Proofpoint-GUID: kMHo1HxO0L1GX5jZ5Q_72rZ0xDAa3hK9
X-Proofpoint-ORIG-GUID: kMHo1HxO0L1GX5jZ5Q_72rZ0xDAa3hK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-26_02,2022-12-23_01,2022-06-22_01
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

From: Author Het Gala <het.gala@nutanix.com>

Modified 'migrate-incoming' QAPI supports MigrateChannel parameters to prevent
multi-level encodings of uri on the destination side.

socket_start_incoming_migration() has been depricated as it's only purpose was
uri parsing.
Renamed socket_outgoing_migration_internal() as socket_start_incoming_migration().
qemu_uri_parsing() is used to populate the new struct from 'uri' string
needed for migration connection. The function will no longer be used once the
'uri' parameter is depricated, as the parameters will already be mapped into
new struct.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c | 48 ++++++++++++++++++++++++++++---------------
 migration/socket.c    | 16 ++-------------
 migration/socket.h    |  2 +-
 3 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 838940fd55..c70fd0ab4f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -520,27 +520,43 @@ static void qemu_uri_parsing(const char *uri,
     }
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
+     * motive here is just to have checks and convert uri into
+     * socketaddress struct
+     */
+    if (uri && channel) {
+        error_setg(errp, "uri and channels options should be used "
+                          "mutually exclusive");
+    } else if (uri) {
+        qemu_uri_parsing(uri, &channel, errp);
+    }
 
     migrate_protocol_allow_multi_channels(false); /* reset it anyway */
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
+        rdma_start_incomng_migration(addrs->u.rdma.rdma_str, errp);
 #endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_incoming_migration(p, errp);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_incoming_migration(p, errp);
+    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_incoming_migration(addrs->u.exec.exec_str, errp);
     } else {
-        error_setg(errp, "unknown migration protocol: %s", uri);
+        error_setg(errp, "unknown migration protocol: %i", addrs->transport);
     }
 }
 
@@ -2256,7 +2272,7 @@ void qmp_migrate_incoming(const char *uri, MigrateChannel *channel,
         return;
     }
 
-    qemu_start_incoming_migration(uri, &local_err);
+    qemu_start_incoming_migration(uri, channel, &local_err);
 
     if (local_err) {
         yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -2292,7 +2308,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
-    qemu_start_incoming_migration(uri, errp);
+    qemu_start_incoming_migration(uri, NULL, errp);
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/migration/socket.c b/migration/socket.c
index ecf98b7e6b..3558821298 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -158,9 +158,8 @@ socket_incoming_migration_end(void *opaque)
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
@@ -198,14 +197,3 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
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


