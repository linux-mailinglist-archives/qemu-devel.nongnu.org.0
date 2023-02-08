Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EACF68EB9C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgsI-00072F-2C; Wed, 08 Feb 2023 04:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsE-00071O-Tz
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:18 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsC-0005IL-QC
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:18 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3185T1sY025574; Wed, 8 Feb 2023 01:36:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=41xoZWDfK+i6XbFnsAkK+J3GXv98Y4Pu6X5J0rDyozA=;
 b=lfmhP5zSC+YDIEcRRl9LW/P1xUiputNh27ktKFjJR2EPh0rwPsyvaioGiaLxj0SkLYMg
 XBdIOZKtz90pbIg83eCs9qorYz98uutty2F4YfWljLHJAFBom02bJ5SzRyv8Dxru54Sw
 CIVjmLx0Gw/pf8x7GdSwFE0AhgltONTjQ+FjMfrojTlTUqKO6mtVrwzSyBRQ1B/EteHG
 5WK+xxtCsrSMFujLk0O0iEQsD+TO4qHPt/lYjUrr3HYId6MlZDRo9Rkc7FGGacamqLkD
 tH5RpW/1MEHh+Kp5i7V+37WwJhFA7p1OAuusKk7RweePXnXcul+FVAykRRarPQT6AXnY KQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhmk1bt2k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 01:36:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSePREBnsxWP+k47DhvBQaFX2mIllImZIdDAyDuCDZIQf32RS1KCAhMO5MTB9kKG/SJZmg9GTD/U2czvmo0YXIQKvKb5qtQYCMyrP0QV+m2Rf54kR6w2J49r5U/RLopGb81W5umd+A4TdaXQzwWRhVElznjTFOTC8IlWg4UGshC1Rle9O3/MBS7ssSJ9l9OrAHHGSo3h6jw9xL38nM7b2LQLlZ9YNmBaspmIgMdywdhQgge4GYDMPh6/Ux5+afxiC5CY9dDJ7wFrSunXapvfp1M8lhFcG0mIg3Fnax/IHLstYhLhGK7eiCBJ0I+ZCXW8swCAWjwAWfSoF8jForYeYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41xoZWDfK+i6XbFnsAkK+J3GXv98Y4Pu6X5J0rDyozA=;
 b=KytCHXeR7F3qZYzPIr1nm5ZRTa4J4xxhTph2wdzHnrehfp6OoQSg2QUSzoIUkv3njSj2vfZ32GrfQQ6geY6KZB0OI+SX31d7TPVchFXaFwQNj8Z3IxbRlbkHRC7/ftcNc8UUc/cbpwbN9K4viqKqFtRKAeZIvneda5cUVr15wKKV5aJj0cBTiQ+sk7K0uFsKKWzTvlBBWeha/E6rAU0cQRnk/LiIaqhfebbUAvZD56ZKD/G6ZvjAn17afqQ5BER2+XDZ3VAZDe6dh9Jwqsrl0Ou8rahaewIS57ouofuEjnCz/Tbrq7TF8c6pJz71AMYW1gyaBCtXmBD0cmv3evDBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41xoZWDfK+i6XbFnsAkK+J3GXv98Y4Pu6X5J0rDyozA=;
 b=cNHeIULAJmW6/5JrPDUtPZ6AvYSf2Fjs5SHBELWq8rLCZHG2uMhfokhyE0U64NCfZBdkHpS4yxGBt6iKS+Lxe/sX6r5793AAL16D9ELZ9LLDNheNyLnmD94u2YIG+abX5BYE1M3TYJiciakCwlwDSpUcaJ6MsGHcbwaxFraAmmrI7xGT92noVG9dHfXCuWwRjhOQCeB2M3rbPRzk/A4nQMJnnrCtz+acRpnWIgnTot2HUbY1LlT0X9WuKzB+jTB5f2zdShXQf1NYVpo5NJGp7Mjaxjsj9mNkU5Qry/FRIj+dOwzAmJjK08BjDXrrqM8gL4Gg8+pjRAlQIXjg84XD0g==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8494.namprd02.prod.outlook.com (2603:10b6:806:1f9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 09:36:09 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 09:36:09 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu
 monitor command
Date: Wed,  8 Feb 2023 09:35:56 +0000
Message-Id: <20230208093600.242665-3-het.gala@nutanix.com>
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
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SA1PR02MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b37cf4-a6e1-4b65-cb17-08db09b7e882
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+hH+wQCkh9eN1Mj9FylXvdpw0JKIYq1BOiRhcCGi2xnG/zPjHhhLmqcAVBbZfEtuH7/Uk/o3iwRUVqhtEMSDJg3Pk4Z6cl7y81Oz+9L+S5hv/DGjY6lLcjH/OPPm1T9Cgc5TvOo4UekYzPXNtiUfK1eBmQWpnuRsb4CF74bTM4o7O29YiLDhriulmubxl7lvhB/IpcOdqt3sUKOfmQsms6bvVUyiK6mFQszA5cRRT/UkYQPVcI6GQE4zkseCMSQkgMalLfCT550T09SihXRcJfvgQRf4+bIczhvNHgx8xV2swH9dmogpy7bfjHi7naS9uF50XEmCzqtIXigUNZvcXL5k1x1nzc58KqIOyxxKMGiRI9WVMzkJKOR7LLYXn0bINxU3i0fM4tr0wob4rF7VuVQcwCpWuKjilzIYHHEDeZrKTzO6yvvxJy0+pnO6qh9svrU81rY3hma5J0lNxcTVlZHMmwCqXvKHM59dTS6TfY/3Q0ltg3AeMqPTlUeM6Qyh41VuiTsq6vSzga30Pw4Gk8E9KpYwADfhIO9FN52z/GVn2oq/7jH35Bx+RAuY3HclcFCGU8tIL34JP+7OPUs1vdpswu2fRgbR1WrdPsX5EwE6WeRrWkuybiNCIjDlZMGmU0oVEcCP1fk3Nc03eEeNFMjEN7ICi0wNaAjX9M4RzjL3lWGVf1ydOC2HoaIqu60pGoOUF6ubPTzrOiNXIgLnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199018)(6506007)(1076003)(6512007)(36756003)(26005)(186003)(52116002)(6486002)(478600001)(6666004)(107886003)(8936002)(5660300002)(4326008)(6916009)(66556008)(66476007)(8676002)(66946007)(38350700002)(41300700001)(38100700002)(2616005)(2906002)(86362001)(316002)(44832011)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lf8q3nkK6UvKAVBPmSdj8MtvN+1YJ+nuGJn0sNM2UYmDSQAMig2pQdNZkBA4?=
 =?us-ascii?Q?y4cFHLd+cc3MNQ5kI6r8ETr/A6yGE2plUUcTQgCBwZ6qRqq2Zpv28kl8jWD3?=
 =?us-ascii?Q?Bah5eSx7ShvB7lzLOfZmzMp5piQ4k8wiXeqH4sVAYUz6vYP2LiTOf4ubSktY?=
 =?us-ascii?Q?ymvfW/LDJVwbbml1ALJKxFZh8x2PDuCGgbR42FCRvhyOn1SsguUSuGFOWKL7?=
 =?us-ascii?Q?+OKaVXrJeBpfXjFgA+FeeaLvfxN+GHJJWp8A/fQcAWjz8nYTEJMwJiQCzBYG?=
 =?us-ascii?Q?wuq2H1Mt46W4AkZcW9vDmh5dRFB5IFCX2FK4yz2ieRH/ty8yJ8gRqDhScsVr?=
 =?us-ascii?Q?S5Ms/ahgX7MAXgWD7qeZkIqVKFYjziRwnQ/He4q+VfBzwaK6eiJ+V5d0op10?=
 =?us-ascii?Q?0g10e70aX4BnwD7eDPd/xRBTN3TOO9IJKEnmlY2YLhHPY6cDaCryLqswI5oT?=
 =?us-ascii?Q?N/OFyuxVpFfRrMHf8ScdncfuNpR5otodSsUXkQG6S22Fsv642Ia3OzGBX0mt?=
 =?us-ascii?Q?kV4PjxbUEzXbOUGKUDP9OlEDl+HAxD9Fkb3q2oz9ZxkeTS7WTnSa/R+H2Ddh?=
 =?us-ascii?Q?Ftx6mDlLknXqWZgW8f06yjcdJqP7v09ZWP2qOKITJYeVcx566DTCMoedqZfZ?=
 =?us-ascii?Q?ZsJky3aMGkjvd1DUuLzvhSoEUWCKTYWSgxfS5xAtHsJjnWTOSFLBuLugs//p?=
 =?us-ascii?Q?TDm0hjFO02ad4dIXxNSs+DVt/lFIqRaQhRCRB1yDTzsxToC9IwWyXF6jssWL?=
 =?us-ascii?Q?TWlWZVobHjY6VvDzTfWCj6kIP6oPZM1fDeoFmW0NFsnE0yX7bohqldNApWQb?=
 =?us-ascii?Q?aZuakJWsBHh0H+3ARnS/WdrPyign+069pCi8oZoeZgdEGAx8KT6JzD5TqzPJ?=
 =?us-ascii?Q?Hyr7zzuKhu5ZSsa7DbCd6zUpKEW56462/1r91TGxYXaTCQa8nup36541I6vf?=
 =?us-ascii?Q?SioZkU6WfKzb3olEI5gbs2pLda0BzGwVgzqlu1/fgo7oIDwQcg1H8khvAO5p?=
 =?us-ascii?Q?WnZRBpxuX5tjcMDyOv3ywh+s2hQsCmN0veNegu04DR11l+9Ea6uFKKcRXtpx?=
 =?us-ascii?Q?sMMn84P98VHnpft10UPxFZkd7mciJokDNmz/G8n9u2KhvXJZW2YfzGuhU6gj?=
 =?us-ascii?Q?eGMgVaw1k+7B/XvJIYtzg8aue8v4pVU+w07LrLAAXv2MaOw2VTZDoOfHfLnx?=
 =?us-ascii?Q?FoSfi8aFjxhl87O3h6if30g5Zj307Fv7R7ZLlwxvMoFs9LGQph0GtWVhV581?=
 =?us-ascii?Q?jLqRTqgCilsI4Z+I1cwPn+YtSi9ufb+hlNGuiejvXmpZ4Y2DIj0lFFa+48rG?=
 =?us-ascii?Q?6yucpst39jnwS+HeaKRPPNUsBH1cQGRiIGVWXDjC48T3V6j+rPXznfvEwQi1?=
 =?us-ascii?Q?BPZUhXPxaJ1hNbLDvrDOvnah0meZc5X9j4b1S9GA1Rk0JHSs7PmKpsM4BlZ2?=
 =?us-ascii?Q?vNyctuoiBOhMjbidGlpsOrTuBgycJ5EtdPb9IUJHe76P0s6E6n/jHLOb6pP4?=
 =?us-ascii?Q?Deqs3Sr553MCxusqQbx8/n1z2E4G+PdKlW3ssqih3nh2u2Xj+5jmoGOV3O3H?=
 =?us-ascii?Q?90j5v0J5vrB7PoQo+SJ/yQCoBX0zirdTLSG60KOqKDuvrK4cNqw5jJ6gGlbG?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b37cf4-a6e1-4b65-cb17-08db09b7e882
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:36:08.9326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIA3SCjoX2vdEuNoLmTJU2YIR5b327YwtJslEHbL7FWQYnZSikjc2pBUJcxUpKywFhK8PvEzarFRNN6PdRcJuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8494
X-Proofpoint-GUID: ivom8_Rae0JM9T409gOVYFNner4WR3sk
X-Proofpoint-ORIG-GUID: ivom8_Rae0JM9T409gOVYFNner4WR3sk
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

Existing 'migrate' QAPI design enforces transport mechanism, ip address
of destination interface and corresponding port number in the form
of a unified string 'uri' parameter for initiating a migration stream.
This scheme has a significant flaw in it - double encoding of existing
URIs to extract migration info.

The current patch maps QAPI uri design onto well defined MigrateChannel
struct. This modified QAPI helps in preventing multi-level uri
encodings ('uri' parameter is kept for backward compatibility).

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 qapi/migration.json | 131 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 2 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..79acfcfe4e 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1449,12 +1449,108 @@
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
+# @rdma: Supported communication type to redirect rdma type migration stream.
+#
+# Since 8.0
+##
+{ 'enum': 'MigrateTransport',
+  'data': ['socket', 'exec', 'rdma'] }
+
+##
+# @MigrateSocketAddr:
+#
+# To support different type of socket.
+#
+# @socket-type: Different type of socket connections.
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateSocketAddr',
+  'data': {'socket-type': 'SocketAddress' } }
+
+##
+# @MigrateExecAddr:
+ #
+ # Since 8.0
+ ##
+{ 'struct': 'MigrateExecAddr',
+   'data' : {'data': ['str'] } }
+
+##
+# @MigrateRdmaAddr:
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateRdmaAddr',
+   'data' : {'data': 'InetSocketAddress' } }
+
+##
+# @MigrateAddress:
+#
+# The options available for communication transport mechanisms for migration
+#
+# Since 8.0
+##
+{ 'union' : 'MigrateAddress',
+  'base' : { 'transport' : 'MigrateTransport'},
+  'discriminator' : 'transport',
+  'data' : {
+    'socket' : 'MigrateSocketAddr',
+    'exec' : 'MigrateExecAddr',
+    'rdma': 'MigrateRdmaAddr' } }
+
+##
+# @MigrateChannelType:
+#
+# The supported options for migration channel type requests
+#
+# @main: Support request for main outbound migration control channel
+#
+# Since 8.0
+##
+{ 'enum': 'MigrateChannelType',
+  'data': [ 'main'] }
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
+# @addr: SocketAddress of destination interface
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateChannel',
+  'data' : {
+	'channeltype' : 'MigrateChannelType',
+	'addr' : 'MigrateAddress' } }
+
 ##
 # @migrate:
 #
 # Migrates the current running guest to another Virtual Machine.
 #
 # @uri: the Uniform Resource Identifier of the destination VM
+#       for migration thread
+#
+# @channel: Struct containing migration channel type, along with all
+#           the details of destination interface required for initiating
+#           a migration stream.
 #
 # @blk: do block migration (full disk copy)
 #
@@ -1479,15 +1575,46 @@
 # 3. The user Monitor's "detach" argument is invalid in QMP and should not
 #    be used
 #
+# 4. The uri argument should have the Uniform Resource Identifier of default
+#    destination VM. This connection will be bound to default network
+#
+# 5. Both 'uri' and 'channel' arguments, are mutually exclusive but, at least
+#    one of the two arguments should be present.
+#
 # Example:
 #
 # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
 # <- { "return": {} }
 #
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channel": { "channeltype": "main",
+#                        "addr": { "transport": "socket",
+#                                  "socket-type": { "type': "inet',
+#                                                   "host": "10.12.34.9",
+#                                                   "port": "1050" } } } } }
+# <- { "return": {} }
+#
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channel": { "channeltype": "main",
+#                       "addr": { "transport": "exec",
+#                                 "exec": ["/bin/nc", "-U",
+#                                          "/some/sock" ] } } } }
+# <- { "return": {} }
+#
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channel": { "channeltype": "main",
+#                       "addr": { "transport": "rdma",
+#                                 "rdma": { "host": "10.12.34.9",
+#                                           "port": "1050" } } } } }
+# <- { "return": {} }
+#
 ##
 { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
-           '*detach': 'bool', '*resume': 'bool' } }
+  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
+           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
 
 ##
 # @migrate-incoming:
-- 
2.22.3


