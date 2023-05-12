Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233E6700A62
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:34:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTpT-0007w5-Om; Fri, 12 May 2023 10:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpQ-0007vI-VZ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:04 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpO-0002eg-SI
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:04 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C9Pmi8017311; Fri, 12 May 2023 07:33:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=3Yd5kC0D4rNzGKiRIMojhcJTyTVHmGbfKAk22G1gh3k=;
 b=x+seFw4WxhWZs507L0g0SsiMCsfkznL1uuYNzLCBBkZp5KS/Gjbi707HdPpjFDr42GZJ
 F7cGwTsN6lH0lRXOZeDeiwCLDwkS8bJrfYQ0t6SOjBYOh4nGgUOO/eM6F5VfjVzgjv6K
 Yvh08R35JoHWH2E7LqFY0H3MStF6d6Sh12/AoF9MZm42qGCSZGxU52MYmI3vnI2l8Pja
 AfybKmL1VuAV80dWtu4VK3d3A8FQJcXFgCGev/DB6Aa17BPReIMtG0f47rwWkvp+GIMk
 noXwlbtGmcF6wiqQ3UAhWGqecDBj6ZIAqtxuTAtfqvtlMf9UKnDQiF09N8fybfxf5X15 QA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf7vv9x22-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 07:33:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4aA6InTe0kT0cjpjBQxcoVE0+0twdi+XPskJvfd7jo7VVa8Cl7HTO2RpzgEkhLu5Yrikl9B+F9a60fts7BPgEQEPn+XdTUIYEUgYIf2T9OmUr3z51SizArOFCYEcFZ1PEpdYKdsSyMhF5qRBsALtd/fciKVqxmj4qK4eZjCrOK2a/pSsbpfMO52SinKmR0+BD9QR9ET/0WytPfW/BOBuRMbF6t2Zwla7WXfZlhRGBB2wF77hnmPa3D2xkrGeThFqgJzicx1tcYh6WNo0ugOd3QUjrSEay6vcxLDgHQl40348nFmTVH60toUMzlDyigV7LLXVV47CvJT5vqmEw+NTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Yd5kC0D4rNzGKiRIMojhcJTyTVHmGbfKAk22G1gh3k=;
 b=iWqXVkCZbb+0/r2DLTLsiPP2sDpKaOywVGVrgeTKY0MdGPRXD9v8MhE/NiEUzRBhe0hEwG+kW3OLMzlXKIagvHzsnh/nhvwu4rjOhDRsTQKo2DMS16BruClWAL1vIV4HFjy45sD7nA/9ZLp+Ff77SJ3Wy6SDHNjiwXwMGcn6/sTi2NJg2g8NCk5S9u2unG0qDLWql0EHUSw2+SBi8FwbYNCKBjiW7I3AtW7xKrBBUXs/OMmwTTQq44YCUSAThKJBJH4RxRmGOY+9jpcTQ1bLVDmgZgF3H2DnXJB48k5ftM69kceGRtQs2YkkkHtxN5Ucq4RNT1Fa1Nn0wYfeRtkEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Yd5kC0D4rNzGKiRIMojhcJTyTVHmGbfKAk22G1gh3k=;
 b=MLYrBIPvYWFFRxf0VHxyNWg9O/wJte71XAsdc6DzFwS130KC9YK5Nii8g+Y3z9ShhuMpcM8xv+35Y6Ijaqe5ao6S7BKnJQbZ4TBuMw4BtDIEymAXWRS9r4sp2vbDpJkjAh92yA/0B6pZ2Lj5dFS4EKdrlho223wifMoVDhOYaWtc8TWjAL/+PsBNwh6497dh11v+aJtgiyudXRPyQYq0HtcAV6YJ4gTWPbpeqcrUjPKy3QiaJtnMSONa+U626iKrvPaWON23EJzFHfmbYaNE6fMTc9IvFJWJAWDKlF+zinSWXQOsBxsEK9IZcFl2gh0/8aXjUcbDzqc/1aXd6IZTDQ==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BL3PR02MB8282.namprd02.prod.outlook.com (2603:10b6:208:345::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 14:32:58 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 14:32:58 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v4 8/8] migration: Introduced MigrateChannelList struct to
 migration code flow.
Date: Fri, 12 May 2023 14:32:40 +0000
Message-Id: <20230512143240.192504-9-het.gala@nutanix.com>
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
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|BL3PR02MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3522b4-98a6-4f69-5ef9-08db52f5c83f
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ej9qIYu8g+EQF4kmorUek2L4HCqT+ulHtBIokVLmc4jMXvudJFwAJiMYo4mpfoRM8CE7e72xtxJDSJgOhdFJ2rsDR7mSL0sljvuhekkXu/chQsUBeHSlw/tjH/04H8gpYYOftSBO91xTEj5qQ1UEd+bSkyMop4a6q0jD2RmzOZLmHWxj4It27YBlXB0Hvw87JKfdF9io4w2e8X639SJeZyvSL7epM1gm/kY17BQyciUJX8ycznipZO8kQS6iiXbFhZsClveZcE0EiSTumGzAbf4qjJ6LVlTLr/0hxrMFA3XjH7GMNx/qW4ygaGNO3lR8st6SPrIkJOv9osnBSW0JrgjNL+C12qnQHtLy6v+JXSsu50KDJ3U29oc9XFz0AxiVE026Z8tCCtBwUGJGjqTFjtZlzOQ+I8g0+detJ4qoFQxjs0vnSDPn7HNIqR7QHeIhBW/8+RVgCt7yG0jmPphXParCFE/vt+V+7B4cPemSJMWMP9OnvNHX/ZMiLTHkVzx5suqRrw6UC2eaHsLKYwJenQ+/nuw1Nm0otovNXqMV+e9qYSF56e5KHrb9yFk997nVUqqvKpPv0RlhVgqNe9R29h4DLLifDi76a3UzvTDlo85xViotVJsWaqR+OkGCiPzQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(5660300002)(26005)(6512007)(83380400001)(1076003)(38350700002)(186003)(52116002)(2616005)(38100700002)(6506007)(2906002)(107886003)(44832011)(8676002)(8936002)(36756003)(478600001)(6486002)(6666004)(41300700001)(316002)(86362001)(66556008)(4326008)(66476007)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C15J2YtDlCcU0tgkljPOsvVmFpAS8VuGTNdkUIndROcfUbajIPVRwFEQNhp8?=
 =?us-ascii?Q?4vCOZSs8+GHWvGqnMsgWToAS4OCq5pfDSoo9RTxzoC2kWAxKm1TaObO/qd7M?=
 =?us-ascii?Q?+pNYC2q/2a8pelWslcih79WgLP/CT+OaWjo3Hhph8YrXfPaIiaaY4O3iJJlO?=
 =?us-ascii?Q?HitVxmzVFNcr+iZKkXJv+QjUQksOCU6HyUIIJ27Fd1BDErp7Hjbkh1Bpm+Kp?=
 =?us-ascii?Q?Ju+7ob5AFGxlJvyTR2+BQgvtve4rA3q5hLtlpQyi2OPFZcbqmfIEgMBTAknG?=
 =?us-ascii?Q?FiKbJN5V0VKfnlk4sit2Vq4YMDyBAPRyshMLJMSOO+p2PZJ9YDl8J7i5g9D/?=
 =?us-ascii?Q?DDZyLy70Falk2/imV7CSMmQAV4KyMkZxi+vqMZxhvOd7wkShK3b94DT7qARa?=
 =?us-ascii?Q?TKOW8PB21ZFlSI01PtjRxw5lJ6RIRbYiixnqUXSFKfklVj21PQnyid7H2VKi?=
 =?us-ascii?Q?QAxDnFTJ6yrGzqEN0Q/Xx+fTZ0maXXk0KlPTSfd2KEPmjwHyZ3ri5G2JKCLt?=
 =?us-ascii?Q?qBfBTIMEzKyk37ezuW1EjYG958vW+Z/6OOZUR9TAgDz/ObSR3OA34C5AmsM1?=
 =?us-ascii?Q?zOiW8TZCVRirkLl24z7FrPUP5cWckd5CK0mIe/B+aGI6lDrJxiT6YLOT7X0D?=
 =?us-ascii?Q?8xZnH5ndaLpvy+aQNGdo8CcfCXZn3YqY+lpIH5QRglv/ML19ZOf2uiKbMj/r?=
 =?us-ascii?Q?Th1E5KsonOqd4wE9gY3MuL8GTycHXQZff4AZiNPVoYEp7XlSAH58vjygJK1v?=
 =?us-ascii?Q?EY9cpN5Er8w2DbGjMS7HXQU16v4Hg/ifztJkWpUbP12A5xlZiwK7uZwdSXfL?=
 =?us-ascii?Q?iGBu26pQRXwtSMYObZWOWDyZfVk2wZSjhvT/ULyPe6NrC5lbCafzgl5A9Z+e?=
 =?us-ascii?Q?vt8TMelCg0dDflP5NBHxmyPe1xzrwKagnLi1DxiqOABwxqgXSEPQdc4VOba3?=
 =?us-ascii?Q?6Ko2UZpn3USdlz4dgRrSHkl9cKFaFUx35IpCcHNrNZ+g70cf8vvrSeNRVbug?=
 =?us-ascii?Q?8HD2m5D852ZirZWKYl3wKi8YDdwy1BgmDmgT4H845chPK3qkEt5yfonxIFuj?=
 =?us-ascii?Q?CGuIm6GNYNCGp8CC9oNlwwOPMZEVE4xwOhj55p5ymiLhBzU88HLCvm1fk3dD?=
 =?us-ascii?Q?0g2mmagzFdKG9OvYLJwWasX3sHJndgWnDHq9WFCffzrc+8hZiZzWdBEPtqFK?=
 =?us-ascii?Q?BREO/3xzDBiy818B3tDJFntNHdKHb5YKN1Jxim7GWuKeMx/tDszt9QQKf2qo?=
 =?us-ascii?Q?RqrspFQ11whRUFE04n2Lk9YpFuLbJHj90vrB8v774R/TLOXGoCHY4p5nzjGC?=
 =?us-ascii?Q?VyLGgyBTGI+PQ8SlE+eEeNEJjrjyw1yl1kCQsPID2Eh7Q5QZ5hBZnVmLwsZy?=
 =?us-ascii?Q?dGLahdBExbaWa2Ygtp7QN0vQr/eASXK885ZvlzkonhbpSdhzQ5LfV6/1rqJx?=
 =?us-ascii?Q?T8pLR9Mwon5f4+T4TiP3hsfyIkWzrKZan54jcP1dAyOfnFqHrH85iTdhbkOz?=
 =?us-ascii?Q?5iHm9u87LTS05l/UAlm629mRlRAiNSagQfS/ahcLOUPBtyFM4SI3YykM5aOg?=
 =?us-ascii?Q?NmznoD5MrfpG23GufyRB80T1Lw35gZQ+vudyWfUo?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3522b4-98a6-4f69-5ef9-08db52f5c83f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:32:58.5375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Srw0PbydX9rf3tQ6XndnMBn1GjhWyR7kvZ6MMbnXBCINCKHWrZWrrfvIL0XgqesenKKCQfWll4QJx5Jz9Y4OCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8282
X-Proofpoint-ORIG-GUID: tAw8w_gKxIw_L3OKZZinI-jrZD7exRbA
X-Proofpoint-GUID: tAw8w_gKxIw_L3OKZZinI-jrZD7exRbA
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

Integrated MigrateChannelList with all transport backends (socket, exec
and rdma) for both source and destination migration code flow.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c | 95 +++++++++++++++++++++++++++----------------
 migration/socket.c    |  5 ++-
 2 files changed, 64 insertions(+), 36 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index de058643a6..a37eba29e3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -410,10 +410,11 @@ void migrate_add_address(SocketAddress *address)
 }
 
 static bool migrate_uri_parse(const char *uri,
-                              MigrateAddress **channel,
+                              MigrateChannel **channel,
                               Error **errp)
 {
     Error *local_err = NULL;
+    MigrateChannel *val = g_new0(MigrateChannel, 1);
     MigrateAddress *addrs = g_new0(MigrateAddress, 1);
     SocketAddress *saddr;
     InetSocketAddress *isock = &addrs->u.rdma;
@@ -441,6 +442,7 @@ static bool migrate_uri_parse(const char *uri,
     }
 
     if (local_err) {
+        qapi_free_MigrateChannel(val);
         qapi_free_MigrateAddress(addrs);
         qapi_free_SocketAddress(saddr);
         qapi_free_InetSocketAddress(isock);
@@ -448,7 +450,9 @@ static bool migrate_uri_parse(const char *uri,
         return false;
     }
 
-    *channel = addrs;
+    val->channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
+    val->addr = addrs;
+    *channel = val;
     return true;
 }
 
@@ -457,8 +461,9 @@ static void qemu_start_incoming_migration(const char *uri, bool has_channels,
                                           Error **errp)
 {
     Error *local_err = NULL;
-    MigrateAddress *channel = g_new0(MigrateAddress, 1);
+    MigrateAddress *addrs;
     SocketAddress *saddr;
+    MigrateChannel *channel = NULL;
 
     /*
      * Having preliminary checks for uri and channel
@@ -467,22 +472,30 @@ static void qemu_start_incoming_migration(const char *uri, bool has_channels,
         error_setg(errp, "'uri' and 'channels' arguments are mutually "
                    "exclusive; exactly one of the two should be present in "
                    "'migrate-incoming' qmp command ");
-        return;
-    }
-
-    /* URI is not suitable for migration? */
-    if (!migration_channels_and_uri_compatible(uri, errp)) {
         goto out;
-    }
+    } else if (channels) {
+        /* To verify that Migrate channel list has only item */
+        if (channels->next) {
+            error_setg(errp, "Channel list has more than one entries");
+            goto out;
+        }
+        channel = channels->value;
+    } else {
+        /* URI is not suitable for migration? */
+        if (!migration_channels_and_uri_compatible(uri, errp)) {
+            goto out;
+        }
 
-    if (uri && !migrate_uri_parse(uri, &channel, errp)) {
-        error_setg(errp, "Error parsing uri");
-        goto out;
+        if (uri && !migrate_uri_parse(uri, &channel, errp)) {
+            error_setg(errp, "Error parsing uri");
+            goto out;
+        }
     }
 
-    saddr = &channel->u.socket;
+    addrs = channel->addr;
+    saddr = &channel->addr->u.socket;
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
-    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {
+    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
         if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
             saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
             saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
@@ -491,23 +504,25 @@ static void qemu_start_incoming_migration(const char *uri, bool has_channels,
             fd_start_incoming_migration(saddr->u.fd.str, &local_err);
         }
 #ifdef CONFIG_RDMA
-    } else if (channel->transport == MIGRATE_TRANSPORT_RDMA) {
-        rdma_start_incoming_migration(&channel->u.rdma, &local_err);
+    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_incoming_migration(&addrs->u.rdma, &local_err);
 #endif
-    } else if (channel->transport == MIGRATE_TRANSPORT_EXEC) {
-        exec_start_incoming_migration(channel->u.exec.args, &local_err);
+    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_incoming_migration(addrs->u.exec.args, &local_err);
     } else {
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
 
     if (local_err) {
+        qapi_free_MigrateAddress(addrs);
         qapi_free_SocketAddress(saddr);
         error_propagate(errp, local_err);
         return;
     }
 
 out:
-    qapi_free_MigrateAddress(channel);
+    qapi_free_MigrateChannel(channel);
+    return;
 }
 
 static void process_incoming_migration_bh(void *opaque)
@@ -1714,8 +1729,9 @@ void qmp_migrate(const char *uri, bool has_channels,
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
-    MigrateAddress *channel = g_new0(MigrateAddress, 1);
+    MigrateAddress *addrs;
     SocketAddress *saddr;
+    MigrateChannel *channel = NULL;
 
     /*
      * Having preliminary checks for uri and channel
@@ -1724,17 +1740,24 @@ void qmp_migrate(const char *uri, bool has_channels,
         error_setg(errp, "'uri' and 'channels' arguments are mutually "
                    "exclusive; exactly one of the two should be present in "
                    "'migrate' qmp command ");
-        return;
-    }
-
-    /* URI is not suitable for migration? */
-    if (!migration_channels_and_uri_compatible(uri, errp)) {
         goto out;
-    }
+    } else if (channels) {
+        /* To verify that Migrate channel list has only item */
+        if (channels->next) {
+            error_setg(errp, "Channel list has more than one entries");
+            goto out;
+        }
+        channel = channels->value;
+    } else {
+        /* URI is not suitable for migration? */
+        if (!migration_channels_and_uri_compatible(uri, errp)) {
+            goto out;
+        }
 
-    if (!migrate_uri_parse(uri, &channel, &local_err)) {
-        error_setg(errp, "Error parsing uri");
-        goto out;
+        if (!migrate_uri_parse(uri, &channel, &local_err)) {
+            error_setg(errp, "Error parsing uri");
+            goto out;
+        }
     }
 
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
@@ -1749,8 +1772,9 @@ void qmp_migrate(const char *uri, bool has_channels,
         }
     }
 
-    saddr = &channel->u.socket;
-    if (channel->transport == MIGRATE_TRANSPORT_SOCKET) {
+    addrs = channel->addr;
+    saddr = &channel->addr->u.socket;
+    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
         if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
             saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
             saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
@@ -1759,11 +1783,11 @@ void qmp_migrate(const char *uri, bool has_channels,
             fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
         }
 #ifdef CONFIG_RDMA
-    } else if (channel->transport == MIGRATE_TRANSPORT_RDMA) {
-        rdma_start_outgoing_migration(s, &channel->u.rdma, &local_err);
+    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_outgoing_migration(s, &addrs->u.rdma, &local_err);
 #endif
-    } else if (channel->transport == MIGRATE_TRANSPORT_EXEC) {
-        exec_start_outgoing_migration(s, channel->u.exec.args, &local_err);
+    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_outgoing_migration(s, addrs->u.exec.args, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -1780,6 +1804,7 @@ void qmp_migrate(const char *uri, bool has_channels,
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         }
+        qapi_free_MigrateAddress(addrs);
         qapi_free_SocketAddress(saddr);
         migrate_fd_error(s, local_err);
         error_propagate(errp, local_err);
diff --git a/migration/socket.c b/migration/socket.c
index 8e7430b266..98e3ea1514 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -28,6 +28,8 @@
 #include "trace.h"
 #include "postcopy-ram.h"
 #include "options.h"
+#include "qapi/clone-visitor.h"
+#include "qapi/qapi-visit-sockets.h"
 
 struct SocketOutgoingArgs {
     SocketAddress *saddr;
@@ -114,12 +116,13 @@ void socket_start_outgoing_migration(MigrationState *s,
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
     struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
+    SocketAddress *addr = QAPI_CLONE(SocketAddress, saddr);
 
     data->s = s;
 
     /* in case previous migration leaked it */
     qapi_free_SocketAddress(outgoing_args.saddr);
-    outgoing_args.saddr = saddr;
+    outgoing_args.saddr = addr;
 
     if (saddr->type == SOCKET_ADDRESS_TYPE_INET) {
         data->hostname = g_strdup(saddr->u.inet.host);
-- 
2.22.3


