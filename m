Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8990968EB9B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgsJ-00072z-HJ; Wed, 08 Feb 2023 04:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsG-00071k-KG
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:20 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsD-0005J3-U1
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:20 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3189MokQ029603; Wed, 8 Feb 2023 01:36:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=ugYj40PXuifck19qf1/cXvilD+vGeNuZ4M/Q+r/EAvs=;
 b=jv0Ho0BYqcP0EdNci4pOYeiJZFDnXM2VQ3daIYhL/nfJTqvhtaT/8QVlecvpr2/xis6M
 +JnmaBuhfEpP9h/yQW3w04yZUPxaehxju6H2Tl1dv/Bg6W6euCVD/o/UsJ4DUD1oWFdU
 n84NhIcABQj53ab7hhRi1OzzSANDYVxDBUy9mS98sXfmFejRsXEVqsKDyylGxN6lgads
 1dqlx8X+HH1Br0biwqEHtb/OGIvSSyVPW9MyuPUjjyXcFoeOUYJGjiNmSClAX7vA9Bg+
 IpKDc+/hJc1rOI3SU+g3opwVZQyKpG2dr6esQwvtUOi8FENfeZ85D7o9lcnqmZUziuol +Q== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhm5husuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 01:36:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6i52/YtwE2ybYWxee7p9oZy8Fs0zrjSG1Wq9ujlagBZeBnqQ92TzZOLFgBcDxmo2+HeijcwbpD++lAAe8/PatG3Rb/iRqKs9I+3VHCStXnb3buSaihtO1V3jV7NC39aUdMgsaboqeWJ+uX/3+kcbUBlulx/sarwjCGR9o7eHeKUITux77uWwybPuqBA7Fwp5bDz3fCSIU05cl6pHE9zAu4bJfiZrX8raIDMQt9eLBbuUTSsXD9EywUCibDmo+Yf7tRSRIcQGXTm8fHj0LcszbB9iq4s7266sTeJ62ACU2NQQyiD/uEC9Qb7zsTZegvNnUERrDCrd7d4Am4TwfwMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugYj40PXuifck19qf1/cXvilD+vGeNuZ4M/Q+r/EAvs=;
 b=laQmkv6sH0GVY/7026Pe9DYgsJ4y9qqWRwy29OMykuO3OXyjXfnV7iX/0/5VP0asX/w7l/aw4yQ76HYDwcO9K1N7HzqqMvCHvI58JkkM5xvnm962ZPxlhZ2FDJXJHQN/xXqVPqtJmFgj/cdXMVt0vW/WD1KSRY/6qmweJH3CXBGEecAUWXAxyALx+/u9C2CEILrGDTiBD8KIb3rNnEbYJX5MxcpWH+721O6tHTu3UCx/9YSqmIfp2sfZab3ix5zpFWh0ide6WFLvqU4BJ0FsbhYqjBeqV7ZXa0ttA8VKqGPq7/kJqZihK8IOQr9C1nzzSKgL3Lxjhb9WLMHeABzcbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugYj40PXuifck19qf1/cXvilD+vGeNuZ4M/Q+r/EAvs=;
 b=J0tfULdRmYN9LyP+VQlg+6ELVSyMbF8SPHlYygzhbGNwz1Yaz5jttLTFh0sW49giP3U1hlBoT1swnQhusMeHOD6IUmJlrPTgEbMXwC7PLXQh4B4BVVotZKVtKW4tvY2WAQ0fw7RYXThXMbzNicFvDHtcaMKFlIylyB1X1eDoWGgKqfGsh/Fp+BN9E7kSsOXQfz19LwckihYgUI5xBaE4YRsb/wqjHN8Mc5E4JFy/ZdVWAOQQ8qkcbG6DYw030iMd6n97yN7WDfQmP4xo4XfRscYvKWuy5ZSAIjdXT1gdbahzA+Moupf9EzGENlu+bsLV/DGVIYvREDkNP0LVsOR+Ug==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CH0PR02MB8180.namprd02.prod.outlook.com (2603:10b6:610:f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 09:36:13 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 09:36:13 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v2 5/6] migration: Modified 'migrate-incoming' QAPI and HMP
 side changes on the destination interface.
Date: Wed,  8 Feb 2023 09:35:59 +0000
Message-Id: <20230208093600.242665-6-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: 28381948-581a-4938-b355-08db09b7eb20
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w0g4JSpazaVsqg0NNa/DlorOLw4hnAK1QHqthD/XbttBnuokFVYP1tuxxCJtuX7mTqdCOMZLdHuO4OHyIBNzDkcRtOmGZ9idTMxTE+FaJdSaan5KVmM1+YkWroGud0gjyfTFTlMK82evw80sHo9mTlGfXp7wLADgNhoV7hievllAeAdiNatnCXUxl3bCzVknNqegDjxFzEMW+regLSPDzQexcL3dnqihsktsgDykxxth2YNASPk1aS+/Ac674A8UsFT2X188P9sAoZ96kQ20eL+dHL2RfxM2rylfQEwN4UiP1MdmkwY5/q4dN3GBy/9+svybLe9BXLWIksmQjft2W3cUSm7hYaJAfEhgVZbOq/7cLxw8/BZ/JQrpFHFjMWVF0LanH39DBof5yhbTTQcsVsD8LZYvcuPr9H44vsykVklzWSCZj+fQHIc+pkRBPPMXzVcIbtrwKmjHgW3iTwKm4a6ZbTj3wk/NgjH2lUicP2U6tySWEFD+ela6H+y4QZH+SdAwOrVhsP7dEtj2YA7YgQTKPSfQQo84O8EGIG13yiKZnxjhd3iA5YagwK3wj5gHLck1B2siiL6sUfVFe3HX7RQSijSMt3bykrs+f+VMkN303ACFWjBPSkmpwURFfPWAM1/GQla/9gpYsusPIN6nuqiLCfr2IO4uJsPJ6QMeV7EdPbZ3/MqncJUxkYfUmDfXJnln50XY9Jw7jLFYIWikDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199018)(36756003)(86362001)(2906002)(41300700001)(5660300002)(8936002)(44832011)(38100700002)(83380400001)(38350700002)(6486002)(52116002)(478600001)(6512007)(186003)(26005)(316002)(66556008)(8676002)(6916009)(107886003)(6666004)(66476007)(66946007)(1076003)(6506007)(4326008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dGWYW2TL2nBsW9J15r5LxucAW2fbAGMzlYJ4R3li+roV5zdQAEuuub2+8puj?=
 =?us-ascii?Q?VtOpergIa6cVmLT5xqeSk2jiQ5lFEPbyGyxKyunU7wIUFeWr5EahFW2MkoXT?=
 =?us-ascii?Q?xI7RVuwY16d8yWkqPEc4FzwP+MpPpLDN/wkm7j8SBvTldKvjBvaSQCmgZk1x?=
 =?us-ascii?Q?ooOQI0jQtfkhTzWxYqmNK4b5KV4tOEXnPyWgWQ84UKlf1ywiJQWa0btgL48Z?=
 =?us-ascii?Q?gr9a00wbS/tM3Ygsdct9azn2lhzBqADOlmX0TxGkJU/gRCVO8ik9zEbgGUG2?=
 =?us-ascii?Q?TS1F+J9kiTOIozOe7pey5QYZpVgmts8I5bV861aybySCFv23mf46SaZW+ddo?=
 =?us-ascii?Q?nKrXUnOKGIUG2jLsKMOiA+i1/DkuPjBt1/XNyNbizMh4wn4zzCDfyGMhWshC?=
 =?us-ascii?Q?xIWMcfC/aBDlB1ttXAe+d1bGpPpVQJatGFNk4K+ErhrPfyVTYPNBtrd9pQhW?=
 =?us-ascii?Q?hbUYjU5SCiNF/+7MnAdfnIztGm81yWhvZZxX3+w8D7CTHQxVMNkGucyR4FoM?=
 =?us-ascii?Q?c0QOxIHrNwc62hnlgoCvj/JfTT70Hx40QQnJzu181UHsI9Nc+y6G5RYr5Fo6?=
 =?us-ascii?Q?TvwXHz9kugBICR0ILd/VXePDjvUSkdH3tPmrv9zwzL1PLug7S13P5lYJRpn1?=
 =?us-ascii?Q?FDYgzo1Rn3YXnSPYlLSrHztMeL3NQ49EzKDVdLypiOrSk8s+/2fREGU3PKeY?=
 =?us-ascii?Q?eqlOA7SJ0TJ+uSThxhJuHN6zmPqwNB64FZ8PRg6kGUPFUG85Opyi9BUI1qHr?=
 =?us-ascii?Q?+Qbf+WPMJOl8aoJrqdvfJgwGsF/OZX/3EuRV1xYbNAEv94mhGeDksO3dpNSP?=
 =?us-ascii?Q?rasxntvFH0/ZXqgalTvjJ2WwbBuzss5V4aD6jma8YZkILYs+Q00rhvEA95Bh?=
 =?us-ascii?Q?k9qv0mfvWW+ZGJT18httWVA9kUU1Ypotc8GXZWd5BMA4MDZd9xuTZwkFZkbA?=
 =?us-ascii?Q?O1NcGdm9R3jJVjB16/MtjxHaQs3Q6OTi8+5eERV0DfcoudKhuhjG8rraIWiH?=
 =?us-ascii?Q?9bhcc2l5RrCr1Jmqk6IpMkfx7DYTGwWdeZTyIqLHjuFKVy+Nc/E5pyY794Lr?=
 =?us-ascii?Q?bbTE9FaY0nHE3gwDwjd8VJ6q5XgmamGfOoskgoEwUaCdg/U2JhVzPnPZvXQo?=
 =?us-ascii?Q?ZbQFn1xqlwwUf3ND6AtvdSWwWFh6b7cHeygRwyHachm25ziF2WQq4iZft5d8?=
 =?us-ascii?Q?UC2QkIFyK91IPIxDgDT3AvjfjBqwerGVwDqSRJUACfSpScoLDrPdmiKCBMla?=
 =?us-ascii?Q?Lu3Ojba6Uv9XADs6+BJ1DsHufpBk1TycXGAeKvroeTWfin8lln4R2PHvZi1h?=
 =?us-ascii?Q?C0YQdH87r5qP8L1RekS3grPx1nmOYURhtvRAAMqD4TCNXVkxfV+tf/zueuVA?=
 =?us-ascii?Q?bz4UA8FlS0Nn9wo4Z6TbtHhnAFmaxo9ObwTeUYBnIRQPYxGoe0xSRbQK/fXG?=
 =?us-ascii?Q?DJu6d7dmzep66xFpOHYrmO0/5Ymiv2UL/ctDsv/kiVTgDh8jjYs3MhYtQKuC?=
 =?us-ascii?Q?/uzMAeCKJ1/mZB7lBiRoWEO9HCiJXqLq3ErglWmGb+T3p++n7ieSkvBbN5c7?=
 =?us-ascii?Q?smsgetKeTYvyMKvz4pq0xhg0RHa9Yas/ngETBx0JbTdFqrJtnLAQIL0LkwtB?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28381948-581a-4938-b355-08db09b7eb20
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:36:13.3229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkoB/o7YC3m8DGwhVwkZPE0p6rfwNoD7I7Wsi7l9/ZW4stonqhsurVRfBSgdqQ7GawlxB2t0nxsVrUOvYYqcxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8180
X-Proofpoint-GUID: ogyQZNc9i71FzGGvI3bBMEDRra9yn02C
X-Proofpoint-ORIG-GUID: ogyQZNc9i71FzGGvI3bBMEDRra9yn02C
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

'migrate-incoming' QAPI design have been modified into well-defined
MigrateChannel struct to prevent multiple encoding of uri strings on
the destination side.'uri' parameter is kept for backward compatibility.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration-hmp-cmds.c |  8 +++++++-
 migration/migration.c          |  3 ++-
 qapi/migration.json            | 22 ++++++++++++++++++++--
 softmmu/vl.c                   |  2 +-
 4 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index a9f65ded7a..ae3c5ea5b2 100644
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
index accbf72a18..e22ce2dd15 100644
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
index 79acfcfe4e..3a88912f4d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1623,7 +1623,11 @@
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
@@ -1640,14 +1644,28 @@
 #
 # 3. The uri format is the same as for -incoming
 #
+# 4. The 'uri' and 'channel' arguments are mutually exclusive but, atleast
+#    one of the two arguments should be present.
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
+#                                  "socket-type": { "type": "inet",
+#                                                   "host": "10.12.34.9",
+#                                                   "port": "1050" } } } } }
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
index 9177d95d4e..16b8bdcf9b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2617,7 +2617,7 @@ void qmp_x_exit_preconfig(Error **errp)
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


