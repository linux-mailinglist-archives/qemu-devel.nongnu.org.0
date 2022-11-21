Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37189631F0A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:05:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4bg-000495-DS; Mon, 21 Nov 2022 06:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1ox4bd-00041L-Rq
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:04:54 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1ox4ba-0007Xn-HC
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:04:53 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AL7VJTM020315; Mon, 21 Nov 2022 03:04:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=yMyh6GNSvhLGtspBVDwvpKns3dzKfvO5/76DMGw1QDw=;
 b=JYR16kQlauGfD4hYVXJ4DTSqh6VrfJzASjWkJubm1RVBw2Hy6wo5fKE0AvzcxnA+l5pP
 Ixu5DjExYIZnxwbBCNPvAnya6cKe9gyT32ng+5tkeYA45NiiM0HmdTdF3fQWnpiRyvGE
 1ZJNeQtze3m4naEPX2qt+/8iNdJzwWWxQvjEqC5R9fT0pDJdAMvT9Vos+yLlub7QEWs/
 227VBojuTklAvPR/JEPKACo4KjRP68VXuI9FgNBQ2mvaeFauDuszbIrwg6tXKGvzJdt8
 s3W07Cm2KKVHuQL9GVbk7H2Ijot6UEnHD5AX+epvdwQBo+zDRbej9jHm0FkjVUYaSL04 3Q== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxx4pc9yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 03:04:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLYC6AyaR8y4ui6ekhWilobMM5Ef+9BWrmLhefrpFqNs1XF/PnoBLtghNAKes43Io/BHP5dUgiL/mdtMLz9VpIZxbI3vx9/xqTJiCsVpm4Z2d2SmXpZXMt8w/iMjLDtZjTYDUO4rqsAQrWUefeHG0gUH/QBm91lEJaXlyRG6QAAa9++C8hwFMCet/fxU0wdd2DzmoYYBhE2tNC6jX9ugRCX+WTXePImp6n/rEGq+MadPmUblQeH7HQ8m9oqDTxS9X9g2mQi2qDIfEoHchfG1HUZj6ggAzBrM5DmRBirQgmozSH1qr6ykXYfxQOk8UnNcIdzLHRqozGKaUQzt9buJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMyh6GNSvhLGtspBVDwvpKns3dzKfvO5/76DMGw1QDw=;
 b=k4n8ebarAdFRwzLP7UxwiKxrjEWzCFnJVVQISHOA/C7S6FcqQsEvHIc2FCORv/aCJOsaVMXoE9RUNhLl9jkI8DcH78yrnIQaEPvtqPGaJuduMfgdUxNbPwmtZrONffvM8Bxs69tdp1KM09AzVhyQiiF6hWdMKdUuFmnQrcq2TEwj3JjQKf9dZAEPhZ18Hds6shXhp9BNs7LGvU3p1cdGfklwX+fwm6c7i5IpfQQP6JbNFmO/qIQg7/xSuXArL0lR2mCnsGsDg+OzhpLeA0sTvfSaLWEZ8Q7rJBz5QEPL7zKRJSkUCsI2MzXLsskUYs4SnJArOYh/v+0rOXORGEXlWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMyh6GNSvhLGtspBVDwvpKns3dzKfvO5/76DMGw1QDw=;
 b=PP4eZMiuIYQlaF0ReyTIKFbVbQtdj2EB+M5QWOLklgdRUJien1xBpPSRn0zhrBQrnuSgfxyvYqu612vr94DCeI/hKF+DMQV0UUOvhSwCbvZsyRB5Mowi2ZHmGDPE+TWdAjLRs8Xx+RnVZqOGoY5eNkU9aE/egCQnsjUaU801+fx9utR5PAiclvaUc4TAcm+bvcCEAKKGJoT4q4WTnEoTp+DOLsFxon/sIFdZoA89a46ZgXMFdfjqVdOwPDbFhMQXNql/r6awXsvGBEdvFkeC/BZOFeh4yaFbnTBhQthjY0R7T6tuWfnInoBimYMQ3n4XYIOdo9IO2PmKqehsoktzOg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SJ0PR02MB7117.namprd02.prod.outlook.com (2603:10b6:a03:2a1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 11:04:37 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::43a8:c20d:67d0:74c6]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::43a8:c20d:67d0:74c6%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 11:04:36 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Het Gala <het.gala@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH] multifd: Updated QAPI format for 'migrate' qemu monitor
 command
Date: Mon, 21 Nov 2022 11:04:27 +0000
Message-Id: <20221121110427.198431-1-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SJ0PR02MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 4807ff6c-c544-43d1-f7f7-08dacbb02da4
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kuYuOkcqC3RwvV1zJyEgwyElHGt//4/a5LGeaJ1TR+QKopv/MCkK5sldGGhcQta3yY8wH3ijEjSV/5Vvv+ZkVaHUpbGb0KXUTvuiMa5DCvhY2JRZVCmxvN+ubvySz4nnuIWlWqjAbiaKdwP4wQYkxC032R9hxbMLdf7olPU6mG3jx33HPTrXpxfDSySE3C7RCkuggHWVFT4ZJMcvfwnNgOx0SQFm6w7kdyD+hmAOPwG4N/gH1wpfNI+KG4N8DQ9dDzK0C1u+TCAOAMrNfC14ee65HnPqaBiD7TjLmBcABaDyXKvuh2hB3dcc57yUh4WRknk1jVrx07xxdnZ+D6uO4wOHtlh4w4SxF4ogZCUctCHhCG3HFspwarPJcJGcIbQFbQ7y961UnIA85yGbUHKG9tWyG57NnHlHLdcRIO6gwyj7zffxErXPjMiIDsL9qwFvYbLLoOhYBlq9U/0ufDxs5TLobr7gPo4U7rzQe1i5GP8F3UKpxZ4pfzxeqo25eFQZtIAw222TxlCmulRZOphVeydH+jH8902aoqW4XCymOLdFvmEkcdMBjbqdu2Gn73tKhBr7xBjdEJ+3fk3LdYJ7q7PP+dZp8q78E0vjGmaJFA8BNP1VkU/mZrD7lVeKABeRzn35gagGLWX9vJOD/uIkCHHrqX+Bqkqv0oCWvNzgv41C8xRalIpIo1l7eZVnyERehCtF/fd7IZ1JW5d3ijDU4X5FBmt2Z4kbzYxBbLKs7oYUr+SMpiog5w5AUYSkUjSis+xFFMcAIgFNk4RNZEa8OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(36756003)(86362001)(26005)(38350700002)(38100700002)(2616005)(1076003)(186003)(6512007)(44832011)(83380400001)(6916009)(2906002)(54906003)(5660300002)(8936002)(107886003)(6666004)(52116002)(6506007)(478600001)(966005)(6486002)(41300700001)(66476007)(316002)(66556008)(4326008)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?teMSb0usYYFDNoIhBJcPnwwX8mwAJUm1GOEsQDFcz/ymoKO+F5K3SFIOywaa?=
 =?us-ascii?Q?fuFDuuLmSUY2aGyaX1CXxFa9SF5suz7x4uADTZwqAhxAS3Lu2SOfn+5vrPry?=
 =?us-ascii?Q?K7ebWjT080wTlZS/Sf7xmdPgL9lkV4GBgM3zUXzvBaY1QWvA/YKWE4p4hwrY?=
 =?us-ascii?Q?7WUcL8dYDA6TeFNk/yQzPLq9aHRf5r/OSKarzJuLnzoZV5rJWo5bAXFKpico?=
 =?us-ascii?Q?uiJVvX5vpr2NtfjSMNAbFlVieXaFEOvtpAoUuaNwkJ0W1od3GeDNzwO8rD0x?=
 =?us-ascii?Q?4w/HQIoMyaGfkUmwA+Tfs3xHWSGADZiehNOICxow/OEFmaCkFc3KVKdbAZTc?=
 =?us-ascii?Q?wqIBeoEyzFz966Ou/e0bBZjPMIKCJOsAtJ6EerTD1oCfJUi2sLOJJ1IW/bNR?=
 =?us-ascii?Q?CdNdG4wYlTLBybAfDqXdPQt1yFo2KcHyOGfdYgbjJJ0ed5x6hKT+WyVfDVwG?=
 =?us-ascii?Q?B33P4NPWhcBc5XMxaWaA5uZcWH9ByRG+5zcn7HGmAWfdRE4m3qZxDMWWyO50?=
 =?us-ascii?Q?pV0LlQ18rOViWkk+iMFdW4jzv4kQq4cZ8o48zBIXtKpwYI920FivzZTudbPp?=
 =?us-ascii?Q?lp0qaN5qEO0XPs49+sjmAkCZQ9egg5QMzM3IeHsQWvXdPo7IXTqwJ+Zpb8fu?=
 =?us-ascii?Q?1HElqtvkqbCL27E11NqrohQXT++Rf9Zk4t3hKKDOWLjt9Gsg/2HVJpeCYrtO?=
 =?us-ascii?Q?OBBZmDL5LBW/xhZE7i7KMA7avgKScX1s6yiD8feCi4fJ8KT8NVEkIMc9MEUt?=
 =?us-ascii?Q?DQYKqkBw9U4BSdL2n86/iuPhCjLcjw7DtE4N+kP30askDPvkCIH/xm4OJ0wk?=
 =?us-ascii?Q?2SSLRDXyOrKlVKTrdP1vrlwsF4RBp71EyPHeGcLuYPukXwLKMxF9QjHoTNJQ?=
 =?us-ascii?Q?UnGHTj1ADcocMmK5UBg3oDik0zqCliDgpxoEXmT+P+yICPhPICr1Kh7mLKsG?=
 =?us-ascii?Q?PMTTmV2vChoeTf0IZ+O++EOavEICVT6Uu2piOOsr47zelh0u2yXeNoKVfg9i?=
 =?us-ascii?Q?3vmDYDWwRAFY0zi5PzefmaqIyfhL6hggLiAL5FSUF3wOMZ2C0PXnBfZ9NWlu?=
 =?us-ascii?Q?xTf0g+7hoSNlgOuNQizTgHYTaWDzD7REWpQYt4tDC7IpJiol4+sqWPNEIEIg?=
 =?us-ascii?Q?rPouCSeAdWxR3cBhjVMLeTcsT+B60sYlCXtayGTr68nFTPdEQeVQZJIgAAz0?=
 =?us-ascii?Q?MNAiuEowYXAL4yk+WqbOr4NUrDZ5Px3H2+H77eQqKbTen2ufolUqqmLoQGs4?=
 =?us-ascii?Q?3tFbamUIdd+yF7CuzWLbGzfVMowTa1ZFrhLgCajaIQAtgua5LrYNNvXA9Aoy?=
 =?us-ascii?Q?vuaHctbpRz2EJTetxPskUlJYINE9h3N/NXpB04YTS0lYhkJL4crh00HWwiaX?=
 =?us-ascii?Q?zVeXY66ZoV/dfUOwop+zVErpJjxSXbO6C3aw2+jbVWBVwfN0qPQCKq/U0XzB?=
 =?us-ascii?Q?0mWtC9zvpnsJW2dKvQ+hu8xygV5RtOuWWXYA8ysY7P395L3l48XRDuSro/NK?=
 =?us-ascii?Q?lYxyV8WkdHaAAfOmxEGWkScVIQsnldg+eP+47KeKzONSGyUjChFXjrGQybNi?=
 =?us-ascii?Q?lxZBQNBDeQmifq6bOdyA8Gv5MsSH4Sro02KY5cmF?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4807ff6c-c544-43d1-f7f7-08dacbb02da4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 11:04:36.8221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwx82wOB7RFCHsRQd0duABWL3WDHcGupsUI30fAurUf3YthT9/M762undj9SXYiXri5S216w8OCpEGWX8GYTLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7117
X-Proofpoint-ORIG-GUID: MZXChW0Dex3B4LpsAJA1WZkxcltolRLh
X-Proofpoint-GUID: MZXChW0Dex3B4LpsAJA1WZkxcltolRLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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

To prevent double data encoding of uris, instead of passing transport
mechanisms, host address and port all together in form of a single string
and writing different parsing functions, we intend the user to explicitly
mention most of the parameters through the medium of qmp command itself.

The current patch is continuation of patchset series
https://www.mail-archive.com/qemu-devel@nongnu.org/msg901274.html
and reply to the ongoing discussion for better QAPI design here
https://www.mail-archive.com/qemu-devel@nongnu.org/msg903753.html.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 qapi/migration.json | 127 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 88ecf86ac8..fd9286ea0f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1449,12 +1449,101 @@
 ##
 { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
 
+##
+# @MigrateTransport:
+#
+# The supported communication transport mechanisms for migration
+#
+# @socket: Supported communication type between two devices for migration.
+#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
+#          'fd' already
+#
+# @exec: Supported communication type to redirect migration stream into file.
+#
+# Since 7.1
+##
+{ 'enum': 'MigrateTransport',
+  'data': ['socket', 'exec'] }
+
+##
+# @MigrateSocketAddrType:
+#
+# To support different type of socket.
+#
+# @socket-type: Different type of socket connections.
+#
+# Since (7.1)
+##
+{ 'struct': 'MigrateSocketAddrType',
+  'data': {'socket-type': 'SocketAddress' } }
+
+##
+# @MigrateAddress:
+#
+# The options available for communication transport mechanisms for migration
+#
+# Since 7.1
+##
+{ 'union' : 'MigrateAddress',
+  'base' : { 'transport' : 'MigrateTransport'},
+  'discriminator' : 'transport',
+  'data' : {
+	    'socket' : 'MigrateSocketAddrType',
+	    'exec' : 'String' } }
+
+##
+# @MigrateChannelType:
+#
+# The supported options for migration channel type requests
+#
+# @control: Support request for main outbound migration control channel
+#
+# @data: Supported Channel type for multifd data channels
+#
+# @async: Supported Channel type for post-copy async requests
+#
+# Since 7.1
+##
+{ 'enum': 'MigrateChannelType',
+  'data': ['control', 'data', 'async'] }
+
+##
+# @MigrateChannel:
+#
+# Information regarding migration Channel-type for transferring packets,
+# source and corresponding destination interface for socket connection
+# and number of multifd channels over the interface.
+#
+# @channeltype: Name of Channel type for transfering packet information
+#
+# @src-addr: SocketAddress of source interface
+#
+# @dest-addr: SocketAddress of destination interface
+#
+# @multifd-count: number of multifd channels used to migrate
+#                    data between a specific source and destination
+#                    interface. Default value in this case is 2.
+#
+# Since 7.1
+##
+{ 'struct': 'MigrateChannel',
+  'data' : {
+    'channeltype' : 'MigrateChannelType',
+    '*src-addr' : 'MigrateAddress',
+    'dest-addr' : 'MigrateAddress',
+    '*multifd-count' : 'int' } }
+
 ##
 # @migrate:
 #
 # Migrates the current running guest to another Virtual Machine.
 #
 # @uri: the Uniform Resource Identifier of the destination VM
+#       for migration thread
+#
+# @channels: list of migration channel type, pair of source and
+#            destination interface with number of multifd-channels
+#            for each pair
 #
 # @blk: do block migration (full disk copy)
 #
@@ -1479,15 +1568,49 @@
 # 3. The user Monitor's "detach" argument is invalid in QMP and should not
 #    be used
 #
+# 4. The uri argument should have the Uniform Resource Identifier of default
+#    destination VM. This connection will be bound to default network
+#
+# 5. Both 'uri' and 'channels' arguments, are mututally exclusive.
+#
+# 6. The 'channels' argument should contain atleast one control channel for
+#    main outbound migration.
+#
 # Example:
 #
 # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
 # <- { "return": {} }
 #
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channels": [ { 'channeltype': 'control',
+#                          'dest-addr': {'transport': 'socket',
+#                                        'type': 'inet',
+#                                        'host': '10.12.34.9', 'port': '1050'}},
+#                        { 'channeltype': 'data',
+#                          'src-addr': {'transport': 'socket',
+#                                        'type': 'inet',
+#                                        'host': '10.12.34.9',
+#                                        'port': '4000', 'ipv4': 'true'},
+#                          'dest-addr': { 'transport': 'socket',
+#                                          'type': 'inet',
+#                                          'host': '10.12.34.92',
+#                                          'port': '1234', 'ipv4': 'true'},
+#                          'multifd-count': 5 },
+#                        { 'channeltype': 'data',
+#                          'src-addr': {'transport': 'socket',
+#                                        'type': 'inet',
+#                                        'host': '10.2.3.4', 'port': '1000'},
+#                          'dest-addr': {'transport': 'socket',
+#                                         'type': 'inet',
+#                                         'host': '0.0.0.4', 'port': '3000'},
+#                          'multifd-count': 3 } ] } }
+# <- { "return": {} }
+#
 ##
 { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
-           '*detach': 'bool', '*resume': 'bool' } }
+  'data': {'*uri': 'str', '*channels': ['MigrateChannel'], '*blk': 'bool',
+           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
 
 ##
 # @migrate-incoming:
-- 
2.31.1


