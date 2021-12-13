Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAA24730A8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:34:52 +0100 (CET)
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnLn-0006wJ-8c
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:34:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK8-00043X-Hx; Mon, 13 Dec 2021 10:33:08 -0500
Received: from [2a01:111:f400:7d00::703] (port=2464
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK7-0000jw-3o; Mon, 13 Dec 2021 10:33:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqUT18VsPFh/E134FX6glcgo9hoKLlzXZJDM3o/hYRG2FiM9pweQ1QL3JcLgcO8CilbColbll49efzEtqtu4utc8YAUNK5ZQ/s5Ej1c1Eo1IMOWQSbTqiQaSxo4ET3lzDzSxXeJAMUWX/hvIPeLbxU5YT6F+S23CayzOWpiaxdlxGfz+FICg0vbCLKBBGOjSvKD3Njcm4AJqJElhgSjrXwF1xQku5+a1TATsrzVS3sXF737X069jopS/IIW3PzEORTD7NHt52yDjlkC7b23Hr+1GFP/jtQWLrbaJWeUj5tfXcd8eo/a8ojMsk0L+pbDs52YUcu49G5c6TIW7iR5m3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/XQBzvuOj+2z0KHJakJs/0955lq43qqA+KruNrLMnk=;
 b=AcSsWkj9GE2OIFZoFo91QJUJSTi9ampfa0rGEiOo9GFs0/81NGJE/W+6msr+gOjB5anWO6RtwuQM34D3cTH8bkk0xmagPYmvAAQURFg7paCZMc5M3k9pPta3mczAmh+0fAw5QXzxcDBsoGj3yII6r7d+5Ofg6K/tKsOroYVHaag3n1Yl/fzfX2toLvkutdwA5un87Dkzq0UqF1yhVzH/QdD8BVy583Uhh4dD8FfQHn7vAFGsNZjKXHO03oDnhWM2/+Rc+hcQbB6wHreaJtvw5uldKhL76TGzYn+ENLrbxGR3Unq/3ObIQBOc/cu1VO+IenAxH+RhsaBOLAT+MmT90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/XQBzvuOj+2z0KHJakJs/0955lq43qqA+KruNrLMnk=;
 b=mPGLZkObrbCSVNjfigK/yT1xAy2ILqCcOVrqyBsR3HhHftUyS7+Sc31qcurMnK9oIjaO3dCpDgyK8XdVxdkspqeT9qBbw7sZK6ciFS+kd15LFjY/OAPb2S86/tZq9eZNOv+w6Qn3Q3tzMBsEKRre+eriYDoctUIk/XLpzpARZXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM5PR0802MB2516.eurprd08.prod.outlook.com (2603:10a6:203:a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 15:32:52 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 15:32:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v4 3/7] nbd/client-connection: improve error message of
 cancelled attempt
Date: Mon, 13 Dec 2021 16:32:36 +0100
Message-Id: <20211213153240.480103-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213153240.480103-1-vsementsov@virtuozzo.com>
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8e64cd7-d85c-42b1-4ea7-08d9be4dd350
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2516:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0802MB251618F3426900C875F5BE39C1749@AM5PR0802MB2516.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h/CnGle0on6pjvQD8YPM86Zlgg5qzjow/Xwlksy2FuuGkno2lvlY1jqidgjBP5SwP7tatIv0KDeUos9LWra8Ykq025H6A9a4WWIQXsVaaKJdxxMUFlE5QoDHSc1XbDgRjuMnIgoa36ydOn1oJdfAibd1uqs3T/8kJP5CY5HGDdBlJh2fgOsDYvKF+KLz+koUmS+hglJ5ID0KKXFB7Gp4sOZ2WPDoSXV85lq+EwzM5PZmVEDCCQTSRq8zS5ZytDeURmbUI7EgnbUgEDHtqX15Ds4MeBVIDitEqgH3NbZS6tU+taunIa3QkiQcdjYELIecG3O6LKRrlJ8APDvt1tWSVdMpT/1Qbq8J5nL4sxI19Bawre7OxoP14SOr4QFL+slYxpDX6vcG5HyEdujnBkJXg78vMoESlFuR6rXDTlLSbzzGullBePbQElMXMPvsqLE050//JNhGoKSPv4Gmo12p4WkXvDVDz39I26ykW3QEOx/lBHLHPkNG2iySU+b1XoJSsAJaRtTrfSnrvQ9uTb0BRqWh8bGQOOAn2UR2J8JRRZHEzOrY/GAs/YjzPYHpcAQysHf9HPiXdECjkQq3+ttMWEKGdErOqNXNqED9YdYcROiOHpABjzmrGbnkYEeQORVqsmgn91wdXGw6trz7KNqDYdaeuTjg5HD4QIuXWoIAEY8FNZBe1YojDq9udrZGpEZ0MJh4Sbko5Ji0BsNthxmtkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(8936002)(6486002)(66556008)(26005)(66946007)(186003)(2906002)(4326008)(2616005)(66476007)(1076003)(316002)(6506007)(6916009)(15650500001)(52116002)(83380400001)(8676002)(36756003)(86362001)(6666004)(6512007)(508600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bGgDFJCU+TGI5RewRqG2ekfo9ptUigXBsK0xYhCzsftGZIpzecQM3mD4+2Kr?=
 =?us-ascii?Q?VeUtMpnVfmdlItwipwK5kYxKR3LlYu2e2YaiaXxMpiBNr946TT0YxTDYwtfj?=
 =?us-ascii?Q?aMlx0i4lTNL9fiijHJT6OTGPJDRKVNLd4zDv2y115lKXQs/n/hhd12oB2tID?=
 =?us-ascii?Q?XU5Q7tE7muMGtfXjBuJ1bMFongzGnlioW+RosOgbAJ8RLsmZ7TRzShyTVWtr?=
 =?us-ascii?Q?CPHVl6/CLlX9MDnj8LBt7BFgjloepfTA3uXbsxjionTjtDYWcAPRWqdbDe14?=
 =?us-ascii?Q?qnqImg8JrhtmnUpzpnTexmEMlMQHUIsaOP0AdIur4OWegBv8E/4KciusunOC?=
 =?us-ascii?Q?uupYJgkrnTz+DDZ8A62eiL2SsJPeGfEdWj3yO9BsFAi4RvtaOtLFNTfWNe2w?=
 =?us-ascii?Q?EE9k1IAa64tBUMgRaOzqIp7s/HPy69aJMCl3dIYo4XCMkKjVfFWA4Pomc8+p?=
 =?us-ascii?Q?3P4MibTmU10Kni/pst66gmJLf2Yg6vs3Y4mo/TQkemw6o2rQlYQb9LalBX+6?=
 =?us-ascii?Q?0tJ0wE15w3LbFccf570OuqAA8nQkuQLe0X+2g34/om3kD9U/TXBGfrxom3m2?=
 =?us-ascii?Q?0C3vZ8qGsJ+ywJd6BXMk0A8pIZM/RvJ43bws2XcQbcpiQu7yb5C2OnGpaved?=
 =?us-ascii?Q?gYesEYzuHNvgEoKtZkTbs37COUlPVwxWiTBNB8ak6LAxglajahxOedclSMio?=
 =?us-ascii?Q?bouShXCLwR5GD01zei8ksidBsCkiIEtwxU63/DclixSrc9LzUEQZIebDCD8Z?=
 =?us-ascii?Q?Xmql/2SWycvKT9FpDn9wtIW8IgY3nLa7RYdbryYC+pzjGpocfOxquktN0xAF?=
 =?us-ascii?Q?wItmxq3rc8Rj+0InbrWizp5MKc2kQhce0mWXQo/mQ7RnpnqMtBtz0aKdeeXZ?=
 =?us-ascii?Q?+jS6NOQaiWmXxenxW4G1wLUYtHwn7XTNgKLreMCIJry3lp8SkT+aGH/TlkVb?=
 =?us-ascii?Q?TAksre6fQXH9kgsWEu41kz8Vw4v1yxyQzway+BNcguT2o+bHElXSsA7MBT/f?=
 =?us-ascii?Q?VpI/fh48jy57lmn6XbUJmi/COPeJUv6ixqLF35QV/rpprAY5F6m6DRtK3k7T?=
 =?us-ascii?Q?F3jYOTSEaYZ4LpwUYqmAQK6wyRJYuwK2ZrNikJ0ee5ZG/DY0GATBqo7NyLup?=
 =?us-ascii?Q?gjsTocLvU+zKaeQ9VTetjRlaUbM8lX9cBmp0w9nskeVmoCZds+gTFoM4LV8g?=
 =?us-ascii?Q?DJCfdFvnVo9VTB4NwYYq3geC7V0CecL1NnnCbPmE8EXoG6A7ks1IrNXoI6/G?=
 =?us-ascii?Q?yrJw07M/h6T2AFyVSrh/mgCLcJs0h212I3edz5pMq+jFVhY7tPbcSRKJSdhS?=
 =?us-ascii?Q?PkGpEEyNb31Q7QtRUJ2fRJ4a6QQQIoDQnU0/vXDsxLPAUvtjo/rYglM34MXQ?=
 =?us-ascii?Q?ve49K8M7LQ/7surWOO/ronfZjf0Qdo4CSCRQVXBAKWSCK7X+ggelitS3C+wN?=
 =?us-ascii?Q?JpX3aYNR8a7G5P7u6YqCOMR2FdGUn8+Fy3ebu2hBp8VN72L24vQKomqanh7j?=
 =?us-ascii?Q?yjyW0SindSrdLSBS93oW3H+QFXUZSkGJpG07VLtjReigtSFbmK/htGcY/zUw?=
 =?us-ascii?Q?OmVzPnRQ9mSa/2wdF4gTiM+1UQ3Yn+Sa2vO3+DM0TufKqP0j+bFzTgUPoZ9+?=
 =?us-ascii?Q?RdGlyd2rCyHJ/NcxtnO85hgTtbVPA6gkhwujsmM9j0Ax0/FzxHa94LOO9o56?=
 =?us-ascii?Q?JtgsIqIk4wF6WDZIVM+TuY9JX78=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e64cd7-d85c-42b1-4ea7-08d9be4dd350
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:32:51.7915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr2QVugQXngw3QYf3iWeNNbv8PQylcjGQYlZJwB9oOeeu6sWGAup1SYRbnjNCjyjMKeu2y1W7B1QlcOrhtyDDTKv7yWINOI6M6jRLqCPxuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2516
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::703
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::703;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 nbd/client-connection.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 722998c985..2bda42641d 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -351,8 +351,15 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
             if (conn->err) {
                 error_propagate(errp, error_copy(conn->err));
             } else {
-                error_setg(errp,
-                           "Connection attempt cancelled by other operation");
+                /*
+                 * The only possible case here is cancelling by open_timer
+                 * during nbd_open(). So, the error message is for that case.
+                 * If we have more use cases, we can refactor
+                 * nbd_co_establish_connection_cancel() to take an additional
+                 * parameter cancel_reason, that would be passed than to the
+                 * caller of cancelled nbd_co_establish_connection().
+                 */
+                error_setg(errp, "Connection attempt cancelled by timeout");
             }
 
             return NULL;
-- 
2.31.1


