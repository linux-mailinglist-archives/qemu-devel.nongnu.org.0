Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3586904C1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:29:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4AM-0001Ho-41; Thu, 09 Feb 2023 05:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ4AK-0001H3-0v
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:32 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ4AI-000826-2T
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:31 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3199XZqY011953; Thu, 9 Feb 2023 02:28:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=XYuRnqNsWaFupJOKLVWGRv1hBizyGcRWUh0aINerM1g=;
 b=nvOK2gTOEcKj+X2BsqdU83O3fQiKOQM6KoribadMfxhWSiLWTzrDvBYLfLF5n9snjDl5
 mXvc5xvEgQap1s/dEsboXy0xBT6iUxAkQsmXizPqfckO5Sh3olvxz4NbB5H5geOKrqDh
 aHa13X9Nszb+C/+4kMVCwTLYgX1QQ9rkVlEf0p4TIeS/hXp88J/uWrima1bj6aiIlSxP
 v2hPUrY89VEQabPYl3fDVGlpWqKIZjPL0SRZSGq9/tA1tUgx6uJ99PlCRh3hV7Ab+OZI
 6loOLBFwLdqwJYcT9jjxwA808k2Q6Irl8CzBCyUmgwaBaJwcftMrDcBZO8XqqG342syc tw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqt4q2ua-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 02:28:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odSmWCyzGAcaLv8SjZQfKafzobgGbwkfqrmN6JAPeYbVbTVR1XHpWdW1nkJKvF+jJCCEe52rJbX1StI4m7sS8sUa2UXMJ1t205sEUfopB8wNY72lk9FXHYT4xEsnbyA8D/3GUd8HpMLJSidawtvW+RtpDct3k0Wr1npzw9nY2+0COk5IXCBmYlfp5lZ3BlibRx1HOVnKZI8YGlmTkIAmwL/vozJtc0qldKruoESo6o4repqq2yQBMMJoEnA4Mn4U1TcxX6UXcwgsr22AY3gzTFiQ4TSQDA5dnLR3QchBalwsDX/8YjaBkk+WkR4ZSnJ8s8q6fVqcWdTnnXvIFPtREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYuRnqNsWaFupJOKLVWGRv1hBizyGcRWUh0aINerM1g=;
 b=gM5TAZpuMBuJaF8p2PcDMjuWZZh9AeQ1MzJLopFpNsXYfp/J9geGYvqNIWdq6dxFSbLM94/J9udSkj/IeK0uKvtONjMwdQWltGcCccBeAydCxJMze8bBQcDX28R/lmIs2KrKIDrOFql4+wUe+x2daD7BdYt38T/DN6VbSao62FC/UWa8hrmyt169JKGtwOr/o6nvj2wg1pYcR01dpg8li2/t1ZHj4NV5CVhDyBU3Cn/IaSwdWMZ6FMfgVw2VlTo7amaZn/vzOVHHdRqg/Z6VDzVszC4Dwb2DYySk7QeKZTcASEVjIUKITVkndKpSMHYl4qeCAKeKL6dUUytBlb/Aqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYuRnqNsWaFupJOKLVWGRv1hBizyGcRWUh0aINerM1g=;
 b=VFezrBMSasMOyIaE92drmiNaydn0hcQWtaldaoawLWhnB91RTganPMD4kqinjImZTo482BXF21/GsaAsBVTo2xs1eXH99KtzbdUGFL6j2RE2zHge+oPL0juW3J6BladZzJkK4ag68jVj4e0Vqlh+YYWCqmqbHmy3Uv+A8FSL1kMXdW8ynkmStwOAbhSffqu0fcjoC2V3UWZZUeHSd5Qz/7HcYMTmBlxiWYt6RnsKDcumbzDfUtERB9f5ZrYr80CJvC/zk/IyHXLdD0XXwwntQ46DDEXIkYhDlc6+6UCVpIDldBsjrSoR+Aw5PrqcVd7Sj9pmARZechkFjsUrQYj40w==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DS0PR02MB8928.namprd02.prod.outlook.com (2603:10b6:8:c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Thu, 9 Feb
 2023 10:28:09 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:28:08 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v3 5/6] migration: Modified 'migrate-incoming' QAPI and HMP
 side changes on the destination interface.
Date: Thu,  9 Feb 2023 10:27:53 +0000
Message-Id: <20230209102754.81578-6-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: daad27ad-463e-442e-0322-08db0a88567b
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vLycKp1X/+ii+3GljleTrgdYpYC+MrJCUXsNnT4r/lRtS01VELrDjSzHT4gOPtI1mOYTW0jzZ1+XRA9RTkZiO3mblfFUC5fUKkGiGZDIpRq4MxC+wmzMa73uwfqQ+HMK9BOBY0wxYlpSnbomrcYAkRKe2kHR2r816EiL+udhbgT5UAvimCIlBz0KaiDVqaO3znMYCFHXxglBpfMj+JF29W3xZurTGri6N58qhwdhsvlhpThk64x3g9PJvoaR4ezNbsjuCy3JwfBz119YjPnHksh5qEiF+Cl8gYb01Th/KI/SbDrVBirblFRigpeYToOCb5yZTUwbQJ3m6CEk+/RDADQci+uzP+9QVLjfAPcpKer061W+GktazrzoEIWBfd8smbCOVvkqrJ0nXpv6yDKfIhapCdf9s6RevzN9WXsz2U2sBqVitxbD90natbJ8FB8iP8l/1NMmnafxZ3nYOF+CYEf8EwigpwTYLQHN6ky0paqCmNSLShpk8fNslXFybJMcSYl9ixVBWn9Izd82ev6TnOnqhUuaF8WmHaH9Cn7u8FCdYVPTvskrJI8rpEthL3z+oENlLzVR6cJJl/h5xXQ5LKa2ZMt2PffQxsRw/bl5AhnMB5VnhzAFpLshLZD+9EGLHi6cJo3xGTh9rm9CdjO/0pzXKS8Gpgbl0rcpU1v5GcwFqBwX0JBT48axKzGCn8rLKcxq99txHM4CwwJtKDYZgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(36756003)(66476007)(38350700002)(83380400001)(38100700002)(8676002)(4326008)(66556008)(66946007)(26005)(6512007)(316002)(6486002)(6666004)(107886003)(1076003)(6506007)(5660300002)(186003)(44832011)(86362001)(478600001)(41300700001)(52116002)(8936002)(6916009)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9jY7U1hDMuJxNuA8DQDcHPqV8AoPsOMd5hKWGaOch86Exsz3V2kmDAYTgyon?=
 =?us-ascii?Q?keYMRMpe/z6Tg2LHsPazLOjsPlKgF7DLKQ8ftSLL/BiZloLxR9Dmsj0ggU7/?=
 =?us-ascii?Q?BLwf6fD6kHwT8Q5MNs9V/zIj1a6qrJlZAtYgcfqKVb4f0Ipwr+xAKFeGrSI2?=
 =?us-ascii?Q?vo0nO3h4O8w0X44b9XRkSWQzGpfsuOsNpB3IJ7qc6sHBp2BzJYpYhjU3Hxn3?=
 =?us-ascii?Q?m2vWDxLpkADqz9IcnLzKXP2ABdjPbyMCC5Unsz7R8YL8pJXTOUjNBzqPwhyB?=
 =?us-ascii?Q?gqT/vGORciyfoND9c/X+gf07znYJQhVBaTY5C7atXvHn7nn30J/g9BEae8Cu?=
 =?us-ascii?Q?3Fo7ezx+HeCH73cljRsNbGiNfm+Rsh/N2BrvtHexzs3k5hvJxU9IAZ6TPSGq?=
 =?us-ascii?Q?mMlv3q+H4i+jKluguHpCW7SIHkaYnA4Xgn19WYiGQZgfoQcyYPbw6VrhiQB/?=
 =?us-ascii?Q?4pMznQQe/zP4fzs4xuuHB/ZWKqgEJK1rXhEH0i55q2B5OsXg1PYXb33gNlNQ?=
 =?us-ascii?Q?4qNfYdwTFu5Qwdla6AFICy1VO+52rCR2p4Yz7ySLNNVblWP3+9PzOp7N3Wxk?=
 =?us-ascii?Q?Z196BbE16quVkXAQOx9kUE6h+vlnExh6dBKN3NbVCO918LRAGqm45TNWoy1A?=
 =?us-ascii?Q?RGPjI34eFKHCds5cepT0dfqI4BbFHhb6D9HGm0jEXMQo1+1vENsJ2G4l8/+e?=
 =?us-ascii?Q?4fy140QUui0X33DdIj+xRp1YYI//9ZucBCJuFIsw+y+2NSkQDgVXY4cJDkn9?=
 =?us-ascii?Q?FIFy6baTbGc3ljxZr3SIyIFA7yKajkqfLPKjnDGGfstlYXRx5u+CS4sxov4J?=
 =?us-ascii?Q?ge+JvPZMae2KWa+8ZZZ1wq7J8wbzF6lvFoOqv3OKskIGRHc+4fbjVkdcuvye?=
 =?us-ascii?Q?1/8fdCPXcABLEJUpnHvCYe2BdT3pARk06zYBYuvh5JzAqnyTRN45JdHmHnGv?=
 =?us-ascii?Q?wILDMWNNBkpFAkVi5n9Zpk/wQFFikUC+nPuBJkbYw/b82r3fi3qma9xvlVBJ?=
 =?us-ascii?Q?YFGYxAuJZIECkxkeGEatxMF5P0uLLdNs96s4OUtiV4LA6i+wx2BWJLqtWi9T?=
 =?us-ascii?Q?Gz7jQlKtU97KkZxHbJ53uQQ1Zdu8RQfqSdnwUuPyv3LC15F5aWjXnsHBubKK?=
 =?us-ascii?Q?jZxCh4Pr1qiu1JYKoMAJ54crg2tbxngzvdxWV0mR46EFD5zuOYVFVWV5jmoD?=
 =?us-ascii?Q?Xxfa8ewVg7gZLSdylrgbNSrX4dHRWEn3Yx/i9eceUWw+TnTen4LXhCFMIZG3?=
 =?us-ascii?Q?cjutLpeDZxaOUx4PCo0CmJcwwfjD8biGPjs5q6y5OJY80R2QACoKbwh0oujd?=
 =?us-ascii?Q?cNjx92hsHCQu9iqG/d89kif2xeNGAk94SLqmrBQ4kMCTGrktAuK9GCXY1jkL?=
 =?us-ascii?Q?lYbXJ3vI0B16W6phP+H7+kHoH+DgI5ZKXBg5L3kEVBpsTZ8I9XZtZuetUln1?=
 =?us-ascii?Q?c/hFzXPTARoTbKud1T+QZF02GF4Q9kmctc5Fe+K17Elw+I8kPSveEo1sxT9Y?=
 =?us-ascii?Q?TadvU69ElTneFRo+Nk7NL4nli1gYseWyJaE5v0X5DHV+yO3ylUrwbrdqKNfT?=
 =?us-ascii?Q?uNsXoZUC7KIHwaAuTyaIZjq442RjSI+hMHil8x4CVoVqoawCRAuCBNBfCii8?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daad27ad-463e-442e-0322-08db0a88567b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:28:08.7820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dfyg9W17a8hoMwyM0L2AbC039daBRDgjbBBfilRAXuMK/15Lruce5ZVvMkwAi1wNq2mrsYjaRxweVXWvVF4Wuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB8928
X-Proofpoint-ORIG-GUID: 5cZf0B0ViffwVe_JsdDHAbEMh7ma0oHm
X-Proofpoint-GUID: 5cZf0B0ViffwVe_JsdDHAbEMh7ma0oHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_08,2023-02-08_02,2022-06-22_01
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

'migrate-incoming' QAPI design have been modified into well-defined
MigrateChannel struct to prevent multiple encoding of uri strings on
the destination side.'uri' parameter is kept for backward compatibility.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration-hmp-cmds.c |  8 +++++++-
 migration/migration.c          |  3 ++-
 qapi/migration.json            | 24 +++++++++++++++++++++---
 softmmu/vl.c                   |  2 +-
 4 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 1005a9e1ca..1ab3375e9e 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -500,8 +500,14 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
     const char *uri = qdict_get_str(qdict, "uri");
 
-    qmp_migrate_incoming(uri, &err);
+    MigrateChannel *channel = g_new0(MigrateChannel, 1);
+    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
+        error_setg(&err, "error in retrieving channel from qdict");
+        return;
+    }
 
+    qmp_migrate_incoming(uri, channel, &err);
+    qapi_free_MigrateChannel(channel);
     hmp_handle_error(mon, err);
 }
 
diff --git a/migration/migration.c b/migration/migration.c
index 91f00795d4..5fbf252243 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2314,7 +2314,8 @@ void migrate_del_blocker(Error *reason)
     migration_blockers = g_slist_remove(migration_blockers, reason);
 }
 
-void qmp_migrate_incoming(const char *uri, Error **errp)
+void qmp_migrate_incoming(const char *uri, MigrateChannel *channel,
+                          Error **errp)
 {
     Error *local_err = NULL;
     static bool once = true;
diff --git a/qapi/migration.json b/qapi/migration.json
index 261a6770e7..d43265965c 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1621,11 +1621,15 @@
 # with -incoming defer
 #
 # @uri: The Uniform Resource Identifier identifying the source or
-#       address to listen on
+#       the address to listen on
+#
+# @channel: Struct containing migration channel type, along with
+#           all the details of the destination interface required
+#           for the address to listen on for migration stream.
 #
 # Returns: nothing on success
 #
-# Since: 2.3
+# Since: 8.0
 #
 # Notes:
 #
@@ -1638,14 +1642,28 @@
 #
 # 3. The uri format is the same as for -incoming
 #
+# 4. The 'uri' and 'channel' arguments are mutually exclusive; exactly one
+#    of the two should be present.
+#
 # Example:
 #
 # -> { "execute": "migrate-incoming",
 #      "arguments": { "uri": "tcp::4446" } }
 # <- { "return": {} }
 #
+# -> { "execute": "migrate-incoming",
+#      "arguments": {
+#          "channel": { "channeltype": "main",
+#                        "addr": { "transport": "socket",
+#                                  "data": { "type": "inet",
+#                                            "host": "10.12.34.9",
+#                                            "port": "1050" } } } } }
+# <- { "return": {} }
+#
 ##
-{ 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
+{ 'command': 'migrate-incoming',
+             'data': {'*uri': 'str',
+                      '*channel': 'MigrateChannel'} }
 
 ##
 # @xen-save-devices-state:
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b2ee3fee3f..579ed59023 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2614,7 +2614,7 @@ void qmp_x_exit_preconfig(Error **errp)
     if (incoming) {
         Error *local_err = NULL;
         if (strcmp(incoming, "defer") != 0) {
-            qmp_migrate_incoming(incoming, &local_err);
+            qmp_migrate_incoming(incoming, NULL, &local_err);
             if (local_err) {
                 error_reportf_err(local_err, "-incoming %s: ", incoming);
                 exit(1);
-- 
2.22.3


