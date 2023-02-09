Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F66904BF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:29:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4A3-0001BL-Hy; Thu, 09 Feb 2023 05:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ4A0-0001AB-2Y
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:12 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ49w-00080J-OK
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:11 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3197YQMt009789; Thu, 9 Feb 2023 02:28:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=IOcm8bZn9nmTTkCRFrQzOXEMXfUQP3pnqlVfj/kFeT8=;
 b=axx+36isBxWbt2WujjdMyxMJ+fr/mqYhxwM6xSqQJ0M7svIsYivMnTvgacCWMNXijpvz
 OrPu6ettrPOweFh2dzgZDmPW7Jf8EfbTVwfKXz5ZdFBgRfk1oVObC/6TY6dxtb2DUntK
 QYadxR3z351qZUZFiRcsQyAZukHgNc91oH5mit7YqvlWrpDbJltJ3b0T5UkmBH2Cr7qp
 IdF8UcdF5s8qLgmgQ4ErKE3khVOwWQJJG8mItEO44CU/RQjdmojWDwRxZBqa/AfDEE5r
 mZERk4bLnSJxFLxi1y/tM5wyRMqE1dBncNOXQQdUR3VrPfBzOoXWt1xSoGiwgERBwvEb 0Q== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqanq58u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 02:28:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLXzbLvWFJaQEphqa9s++lqyQ/d1bu1BZGOmkriMiUrsZrL/ev/2/+ZebylZdTnfd3sZHIrVGkV1CTtaDmsRzvDfJOg+Lt3UWS+1hb6QZwE6xdocN51TgZGmywcBXY4xBKNYABQDSxUmykvxHu5GRqD0nrdCg+jyoEdTUJ6zsYX/Ab7t5KzrXLmbxpEUXuvMm0yIk9CAPDEaUKcHgvRKaaTSJygLFwqYwj65nTrr4ebueKr5FUZT+rhGW95bohyeFYumdpvONnNXL/B4yz10FaeSmreKBSv+HbZpiZuiCqt1sNctanNSPbwhkDDgjTmds4ufUnJ0nS7zbmNPjCSdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOcm8bZn9nmTTkCRFrQzOXEMXfUQP3pnqlVfj/kFeT8=;
 b=N03y3h6faATz4bKd4rtoXMzVx92nTB+mvHVXXEy42ZKTuNd+ZQWa2zsgQEwlsLS/9eR7zy2psVq20mW/JCJZmgrYoHQRtylhrqWXlmys75aKF2/93mcc7I3zHsMFb8aYDXmd+YGiDu+L+ZuAsrvv3VJmVBpIhreSBc0wtLA8x6EIu+8lEWgfgc/9VscC2+1L73AyKYFEb1d7B4ODhlTxus26O6OvbqQJDDoj4wptl8XasduT7nTCepNCV0/keHt6PP7IvWN9uW2kRIBx6BhHN8e0aJjehjizL5pzDKl79DkZRIHKc44rSa+m8RPPPyXvVqdZEMa+GUigOWrFi7YrRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOcm8bZn9nmTTkCRFrQzOXEMXfUQP3pnqlVfj/kFeT8=;
 b=xY3u6GjNHUYcpgcqfdUuVUuqTTnskd4kRDZQ7Ryh+k9EcrUCCkH3av4fB1nW49N8J1E8ChAHSZEX/b7Q4i6TC5mPKeHfrFHvWUccZvTfki8gOX1u1MhZVLVAlcsLWs5VRcEQrxvpw9HFG77BJMp+y/+1MWV2lAP9M/xOoT9YX+95gkTQbWri9RlwH14s1A1xXGWO/ybS7E5PQLqHzpzsvht+amX5wMUuF0VrO+bH5SzllXwb5hnQTNgq3i9RngQ2mW7HYECNfm0d3ySYFYGyC4MFMokfC1FD9L+++G5Iev482BtoYVRdIzpKK4MSQxJxbpDVi7s68hGJ9AQWaw6XTg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DS0PR02MB8928.namprd02.prod.outlook.com (2603:10b6:8:c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Thu, 9 Feb
 2023 10:28:04 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:28:04 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v3 3/6] migration: HMP side changes for modified 'migrate'
 QAPI design
Date: Thu,  9 Feb 2023 10:27:51 +0000
Message-Id: <20230209102754.81578-4-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230209102754.81578-1-het.gala@nutanix.com>
References: <20230209102754.81578-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|DS0PR02MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: 240f11ad-63b5-4124-5927-08db0a8853b9
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qj8s7RfvukHrwaweaFRyqBigaVGezYWeQu3OnhASJSIXXmO11uUCReuuNak1thnv5q/hxwITnWzm8hDOXxWixxj/loApquJNtEoaK9Gs/bVkUIfqnfAVc/a7lJe4QZW9JmU0bxH925aueSIcr5af668/2uYmXq/eSXMNTnk2Dq1e7YRzEgXDoQ/AyLuKlWknlDSrwD3m6omLNEYk3Xz4c1mz7bJxLWU1rWIT/9HE9e/sN9JoZXWNIZVtFzYionDIMbouqC3CHfnL/P+1URY2tbFSRKQnX6F7iMQFs3FcpoAznl41aNIq5jnkcR1FKhxo+8ggesGu/UgfxWgfFHgU72P9W6JEbNuxP0aqPHy4Z42ZL40RYlcnujJQMw3+sCdzKCr29LVMUxBGmYClULUesBsuU73wHROi8MkurHqraGE45lChJMhcf0luGHQ5LEoyG2ukdvJIzWNl9gg8h8dNLyCuf3LpftHI7d+0oIbKBnhifrMf1hSWKBDRjkRWN3bhSq59j3QwIVErCvGqXFJPh7l61I+T4+i2X8O0Aar8zfGMY0IRdhFfgRzUCezFtytl4q6DJADLBWc5ndIp1rJUc9QLJ8gDsIqWuScjyhLApb8WaPNn5LsMA/U7dFqno3gDIUiNWH2YoAUKXiISao+jtqncXE3KiBbM+a78ev6U3nHf1uLDyK7XXTSRGkr8qgtV+Kk2qxBbeTjR2VLa8utBqcLFYfOqu47xBnoA7JCFVE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(36756003)(66476007)(38350700002)(83380400001)(38100700002)(8676002)(4326008)(66556008)(66946007)(26005)(6512007)(316002)(6486002)(6666004)(107886003)(1076003)(6506007)(5660300002)(186003)(44832011)(86362001)(478600001)(41300700001)(52116002)(8936002)(6916009)(2616005)(2906002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fmKo19KUL2iWa6ZOTOSqMs/pe1J7eDDfoka7jEooa+OjW3yGbaI6KJiZ/hn3?=
 =?us-ascii?Q?66VZdCWwPImG4bXE+JumdrOdvrGAZxy7mpCKW1KYHZ0mC/11wtrlQQmzUkbW?=
 =?us-ascii?Q?zAKqrnyFf4Jl51TmJJLFzYSy85t8ka0yjAjACEJi6CYWPvcpLnF7bI14kTYT?=
 =?us-ascii?Q?LI+sB9zyrMy/AVsMvOriHbZ4PydURCD3felk/UzbaY6QNj7A7PEapUQoPHrk?=
 =?us-ascii?Q?0jhkwXE+GmYBC2XiPZ2OTS2aTJzlaAUX9OfAUsWZp/02FcnEpdOSwcSkD662?=
 =?us-ascii?Q?FvvBxLl4YLqAyMAfGURk5WY+sAgpKUUw9c7j75toavPzGFwenOjYbH/93x8L?=
 =?us-ascii?Q?lZZDnZ7f6JC7cFJeKLsSl+Y//tQi948qBQ/pDfMKapeQn3J6zejl8wkshzB4?=
 =?us-ascii?Q?WNHJ3LP228eaaMoKX1CIc3M/gHkV1GvizldiUxn+oXZITtzM2UG3xnEjrsVr?=
 =?us-ascii?Q?d8rsjx0f4RO2xNdWpTQOlVyWjvwEleNM8Zt7ILFT+mT0cFtOLHriHT5uDHBk?=
 =?us-ascii?Q?ooMYQ8y69s66iw/hB0tbCrhcWQofcDyHAmN5/O3wUevEJ6vwFg4AHNUoD+B0?=
 =?us-ascii?Q?NFhf1dgYatewFjrbA5kur5162NyKsnZ0T9d2Zg+eXkuLbts+5sXHz4G0yzMq?=
 =?us-ascii?Q?+Q02yWBE2IKhVvBlDhYzaLKoIF7cPnLvaT9gYOozIUE/SzKPo3yW1/Zdfs+B?=
 =?us-ascii?Q?p6MjuR43bb23G/HLe0bdh4nYmffmFHXLi9XoKoXGmUlxpWDEDC8nIji7iBe8?=
 =?us-ascii?Q?Xb9mOROVuNil+oGwaZ/41AMtcZWnSIF2ooCZQBnsS9V9fdPVVj6gYdS8naDM?=
 =?us-ascii?Q?oSGma+vG3E1TmkGh7RIuFJNc90N0o2fDFHe2Ed9y3GNmiwOzocloYXjjbxCL?=
 =?us-ascii?Q?vlwzWNNMxILmoOL7hQrJ+4ZoVPLKwD3ZskE5qyqQgG9rApB2F/ETSuftl4gf?=
 =?us-ascii?Q?9sTvPZFqfZJKFeh/aMO31KLYFlQhx+B5m6QSTFp2/2AgU7zThNjzD4HHHV36?=
 =?us-ascii?Q?feo/jOtZgAtReWNbq6/g7JBKwJ2b/Dw81SViab+aOgag9XYwglp0Y19h291P?=
 =?us-ascii?Q?MGpi4mnVZmP0QmFsTzOsMaGcRf4qp8LwZN70Q5R1KxoC0eKyASslo7ThUUj8?=
 =?us-ascii?Q?mVso303AJXOst2QmWl9sYaDbLeq/XjoGjIbXIwnhdWF9UdRd3J1vbOmVQLbl?=
 =?us-ascii?Q?rsOMWpdGqerMzgxhbkC2mQ5a5v716Cxgjzse13chV+feczwoUTBepw//Di/1?=
 =?us-ascii?Q?33eiMl+rUv+NOxiNYKbQ6zIX0yxElQ4dl5XwgfC7Cmmfsv7o8coQ2UxGjNqo?=
 =?us-ascii?Q?OJtx8dYFDlRVRmRQ0My8SIGrfuP3E2j3rNfdg/RTfDvdTy8not5yf3ngEno6?=
 =?us-ascii?Q?VPaZncZ4lb83VsUGkdeCBfqbJfC2o2640y714QCvBsOLyAqm1v769q6UMzJM?=
 =?us-ascii?Q?6WOUvRuQT6zFeWVQ0AyQG7svRxaRqMMFDYebV9k/XdnN7Z3JcYqySsdjlUOT?=
 =?us-ascii?Q?Su3lmxJJthuoztZp50itK1WaLm9FpzQWZb+le1oK8nbVX2p4FXeG323o6OUQ?=
 =?us-ascii?Q?L6bBW7wwcpqxdwtTecHOH0qPE/1W1jud7LiOrLLQl3dOdMfcDAeyWkfg1i1t?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240f11ad-63b5-4124-5927-08db0a8853b9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:28:04.1730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZUs/0+oWss3Y3PGl1wAJyVy/D1nzDOgUEjw/gxRufffDJpUBxeN3pzaFw72xUHKd6z21iQQevLazpnuQxGdEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB8928
X-Proofpoint-GUID: 6P-2W9BMO5i7kRAHIqNQavYAD8hcFOwv
X-Proofpoint-ORIG-GUID: 6P-2W9BMO5i7kRAHIqNQavYAD8hcFOwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_07,2023-02-08_02,2022-06-22_01
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

hmp_migrate() stores modified QAPI 'migrate' arguments from qdict
into well defined MigrateChannel struct with help of
migrate_channel_from_qdict().
hmp_migrate() also accepts uri string as modified QAPI a 'migrate'
argument (for backward compatibility).

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration-hmp-cmds.c | 105 ++++++++++++++++++++++++++++++++-
 migration/migration.c          |  15 ++++-
 2 files changed, 116 insertions(+), 4 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index ef25bc8929..1005a9e1ca 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -32,6 +32,101 @@
 #include "sysemu/runstate.h"
 #include "ui/qemu-spice.h"
 
+static bool
+migrate_channel_from_qdict(MigrateChannel **channel,
+                           const QDict *qdict, Error **errp)
+{
+    Error *err = NULL;
+    const char *channeltype  = qdict_get_try_str(qdict, "channeltype");
+    const char *transport_str = qdict_get_try_str(qdict, "transport");
+    const char *socketaddr_type = qdict_get_try_str(qdict, "type");
+    const char *inet_host = qdict_get_try_str(qdict, "host");
+    const char *inet_port = qdict_get_try_str(qdict, "port");
+    const char *unix_path = qdict_get_try_str(qdict, "path");
+    const char *vsock_cid = qdict_get_try_str(qdict, "cid");
+    const char *vsock_port = qdict_get_try_str(qdict, "port");
+    const char *fd = qdict_get_try_str(qdict, "str");
+    QList *exec = qdict_get_qlist(qdict, "exec");
+    MigrateChannel *val = g_new0(MigrateChannel, 1);
+    MigrateChannelType channel_type;
+    MigrateTransport transport;
+    MigrateAddress *addr = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new(SocketAddress, 1);
+    SocketAddressType type;
+    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
+
+    channel_type = qapi_enum_parse(&MigrateChannelType_lookup,
+                                   channeltype, -1, &err);
+    if (channel_type < 0) {
+        goto end;
+    }
+
+    transport = qapi_enum_parse(&MigrateTransport_lookup,
+                                transport_str, -1, &err);
+    if (transport < 0) {
+        goto end;
+    }
+
+    type = qapi_enum_parse(&SocketAddressType_lookup,
+                           socketaddr_type, -1, &err);
+    if (type < 0) {
+        goto end;
+    }
+
+    addr->transport = transport;
+
+    switch (transport) {
+    case MIGRATE_TRANSPORT_SOCKET:
+        saddr->type = type;
+
+        switch (type) {
+        case SOCKET_ADDRESS_TYPE_INET:
+            saddr->u.inet.host = (char *)inet_host;
+            saddr->u.inet.port = (char *)inet_port;
+            break;
+        case SOCKET_ADDRESS_TYPE_UNIX:
+            saddr->u.q_unix.path = (char *)unix_path;
+            break;
+        case SOCKET_ADDRESS_TYPE_VSOCK:
+            saddr->u.vsock.cid = (char *)vsock_cid;
+            saddr->u.vsock.port = (char *)vsock_port;
+            break;
+        case SOCKET_ADDRESS_TYPE_FD:
+            saddr->u.fd.str = (char *)fd;
+            break;
+        default:
+            error_setg(errp, "%s: Unknown socket type %d",
+                       __func__, saddr->type);
+            break;
+        }
+
+        addr->u.socket.data = saddr;
+        break;
+    case MIGRATE_TRANSPORT_EXEC:
+        addr->u.exec.data = (strList *)exec;
+         break;
+    case MIGRATE_TRANSPORT_RDMA:
+        isock->host = (char *)inet_host;
+        isock->port = (char *)inet_port;
+        addr->u.rdma.data = isock;
+        break;
+    default:
+        error_setg(errp, "%s: Unknown migrate transport type %d",
+                   __func__, addr->transport);
+        break;
+    }
+
+    val->channeltype = channel_type;
+    val->addr = addr;
+    *channel = val;
+    return true;
+
+end:
+    error_propagate(errp, err);
+    return false;
+}
+
+
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
     MigrationInfo *info;
@@ -701,8 +796,16 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
     const char *uri = qdict_get_str(qdict, "uri");
     Error *err = NULL;
 
-    qmp_migrate(uri, !!blk, blk, !!inc, inc,
+    MigrateChannel *channel = g_new0(MigrateChannel, 1);
+
+    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
+        error_setg(&err, "error in retrieving channel from qdict");
+        return;
+    }
+
+    qmp_migrate(uri, channel, !!blk, blk, !!inc, inc,
                 false, false, true, resume, &err);
+    qapi_free_MigrateChannel(channel);
     if (hmp_handle_error(mon, err)) {
         return;
     }
diff --git a/migration/migration.c b/migration/migration.c
index 7a14aa98d8..f6dd8dbb03 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2463,9 +2463,9 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     return true;
 }
 
-void qmp_migrate(const char *uri, bool has_blk, bool blk,
-                 bool has_inc, bool inc, bool has_detach, bool detach,
-                 bool has_resume, bool resume, Error **errp)
+void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
+                 bool blk, bool has_inc, bool inc, bool has_detach,
+                 bool detach, bool has_resume, bool resume, Error **errp)
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
@@ -2483,6 +2483,15 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
     }
 
+    /*
+     * Having preliminary checks for uri and channel
+     */
+    if (uri && channel) {
+        error_setg(errp, "uri and channels options should be"
+                          "mutually exclusive");
+        return;
+    }
+
     migrate_protocol_allow_multi_channels(false);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
-- 
2.22.3


