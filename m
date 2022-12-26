Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF2656023
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 06:35:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9g7l-0003vr-2N; Mon, 26 Dec 2022 00:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7j-0003vD-78
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:07 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7h-0001AD-8y
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:06 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BPNR4tA013796; Sun, 25 Dec 2022 21:34:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=0jRv6wzpfsybjN4oJ2uto6f4enBJ2KFpjeXYBHdIUN8=;
 b=TVRYwg3eYf3wSfEzsZctLrOCoo9tzoWGYNJvkfgrJpDOWvVfiX2QDerIy4vEL6UFjUmS
 dJDXokrdaCIPhTOWl/8Pg9WsRGfN3Ag3V9/KuKFHLQlsexIG+diD1d6Ni5m5EdtSCCtU
 FmiMEsGlmUAbrlenNAgxHw+XJFmC6hQg/6Py5ryTPgmAn7vtRRniI7vhjKphSYxuC7iA
 0rTDB5USMsz4xuaGd6DzbQBMTlogbdkw8stcJjiexKnAw7YjhFRHKNDvbTK7DRyjFVzA
 BwKOcG/wq7sPUC7ZkDo69rPaJWpN4aJjcnl5MTCJY51EuLlPevMQ/RNoAv9jFPy+UBcz gg== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mnx7dukw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Dec 2022 21:34:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvevb+7hek79/sPBhQxdC/fTpUQjglkgRAfhMPKIR1viggAs/YDe+XGyUfWvGaCyOuFLwh3h0VzNl2Rlm/5CPO9GZRgiYmE7J6Q+2w/lmtRS4pC01WEQzNHy8myrUZvbNag5ZRmwbARrboVgQ2VW1PzvuTjrvjfZNIryr98P4iBvKeCLjEpm76yc+zzIjNZsyxxPTxeJCBpgwkdoT9FAAKHIGvoY3fUURHN3LpmCaLmlyyJ+Q+oyjGphIdm30xT0xGwPjS0joDvrUz5QhytC2tn7QO7OwSRXzlY9cWWOvM87ZLhRLJrUj2kTOHzfrej5dDkAi193SlZfbibZ7lCU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jRv6wzpfsybjN4oJ2uto6f4enBJ2KFpjeXYBHdIUN8=;
 b=DbmGSGPTokIafwBnekMnUevjw3/rxtAwm05zY9UN4jERtRB8jWWU/2eo8UtMUaRiKiVa1QED7ZJLiQUUd3DeWAvfXTp6Kngx/BDSjovKFjPJEb9ArDLtAiK5P6qtGL6QhFrD8/8YHpATwm/AY5fBhKtGjwNYEB5HvajG0+Uh924zxSxUK2R8/+u3XL3PldY3TBXYPknypeW5IwIatt9VbfW7Niqs1EHASxohcQjaeuWdvOVRY/apK73l95zRvY/Ko1UqpVs7pZdnOc8WU6dgtJRg2v5Jo2hlSq2QdogjGMk5La7imyef+DnNobz9PF5qBY1DCRbjpnzLTo3ZNa8iDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jRv6wzpfsybjN4oJ2uto6f4enBJ2KFpjeXYBHdIUN8=;
 b=qV2c1loLAVNmjC0eN2xEgHXn+IBAYatpqHZfhWn8rQkQFvLyqwFULI/Z84yHd130qgr0q5mHzxKe39gd4AXg8xvYw7Q+IYd/cdKccIOdaD8q4Noy6ykiHmwHerX+0sBlvNzq8q9i551o97YUcjCJvELJouus8OSmE3evSG/UcnQSaw/1XvK26x46r7EYHKKVOkTLuX7UaIc8GYECI2u0BTdQpNshTarVyK3qd18XKwhf2jy6WkwJL7DbmlU+KYXH9b7dcX3iJHTS5yM4iQtjXA12ITneSGj3npDgjbqgpfI/2opp9lPlSRe+1LAWvHtw9EEVml43vSGcuIlAJlIPeA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH0PR02MB7655.namprd02.prod.outlook.com (2603:10b6:510:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 05:34:02 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3%6]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 05:34:02 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Author Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: [PATCH 4/5] migration: Modified 'migrate-incoming' QAPI and HMP side
 changes on the destination interface.
Date: Mon, 26 Dec 2022 05:33:28 +0000
Message-Id: <20221226053329.157905-5-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9b4696e4-f43e-481e-74b6-08dae702cb9e
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mn8QRAAVF5GZ/0yD7RhMyF5NQLRUX+ImjnknKDELPwKWg4sM+QC8sdbNCcbjyBGkE6uFSx31d1mqvX63YFOhFCx8HwIoL+jLyy/3EbdRBoVqzN0OnjNDTzPgKvxi0OWdcOPXImVXYxlFmgwEcrlb3DuIg3J5AOyDjVuG+YOAdad29n6X7WjZBeceuCaXeI2czFG7HtTkxeQLBLCy4zshqNXHw5kQm7EExDPNe5pJqGud3A4ta6/fsXX9+w1z/rx6y+2thVxmrDgW+wuPqs+Qytw2tPr30zCts6OifM4NWi3mcMdx3ugCJ/gPN8WRYtNbgYV0RS/LIli2a8kmmtq7vJxqBLmkilqPgd8DK1KAUdF9pITOqaEB8podJo5rPCEkJQFhwVOdBerRqzqc3AofsL7Rww4loC90UpjVXrzYED0yialtVagjvfbfRn0VUgLZDZVYGDAc+Nxv7zY4ZShwdXocb5rd4akiOZqNeh1d8rL+28ztxCE69MZp3WkQm/OhAcuT/vq3EdX90IFu0W3p6XSsheNrMlMLPrE1EBu+FnaYpInwil5o+AqcCl+bPSSP6t0/GkjtVEywxcWM9g7RRBqfhRCq+NaBzU07B+DUqLHq/aeIeR3TIyINBCNEmja1qy2tV0ctoLfJB8H0yLuvumFG8m3es8iuc/KlIvDro27QzZKdssJsSQ9IPrCC0lmhKB/s3SqpMLIs6XdsxZ1xxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(396003)(346002)(376002)(366004)(136003)(451199015)(36756003)(86362001)(26005)(6486002)(478600001)(52116002)(6512007)(186003)(107886003)(6666004)(6506007)(8676002)(66556008)(66476007)(5660300002)(66946007)(41300700001)(8936002)(2906002)(6916009)(316002)(44832011)(54906003)(4326008)(38100700002)(38350700002)(1076003)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dPYZAbK/sep7j7zP+UZkXgzrUPAdqL7dgnq7PTYmN3poN/6KJQ8PtMsj5Cat?=
 =?us-ascii?Q?RxlQ+xnZbO68lV9xPnJF2rJ/bCm5CJOc9oqtkrCtWaXxeTbZy7wDV/wf383Q?=
 =?us-ascii?Q?GsMH/AHkc+jteOkzijmd+Gvehk/85FEm138wXZDiL2fKrKARJIXHqNoqPsOH?=
 =?us-ascii?Q?kQdXsm1DcmySKi+vmunu3byc3OUuyN3k5nE5rpklKs6j3dKgSJvblSnB7cjJ?=
 =?us-ascii?Q?utlYXeLtncPwJyVkAjFMD/LZ8p9s0OKpHuHMTffFFzTdYiCwxgKrxU/+D6Bt?=
 =?us-ascii?Q?j+qQu4Ne7XI6PU87Jn5mTCPRgYUFwj6vsc4X5v1n3oPbb4zc2B5GaOIxP3ui?=
 =?us-ascii?Q?lfgu3GRX3KKqDzujvqKW+kDvd1s/g/uZaL0bQVjc3TdiWx+K2gan7+Zi3l4n?=
 =?us-ascii?Q?354oJ18MsFvnMXT/Xumop5pYcLgXuZKctmKeFq91quJ8p0S7oH90OecMvgcj?=
 =?us-ascii?Q?pWtLnqkcfiOLhFqNCnAnZHiIdS0k0lSYbXZLS+OEb0I7sAEVd7ZWfWKxGjbU?=
 =?us-ascii?Q?EIDi3geNjaCQvHzcX83GdRQmM+k0O6eiHd9K9R7Rd+Dykrqf/IiIwj0AnP0g?=
 =?us-ascii?Q?OXHJuBe28vMYfdfrVR4vy4W3CSRLTVI3bNonpR7ZcDKIfuYedDN/yEc3hO8D?=
 =?us-ascii?Q?WRch5gNqn3Nr3d/KD0+224A8JKrmXaBfgB6wcrAehVOXrfNe6BVljUOudZbb?=
 =?us-ascii?Q?Yr+L5tSzRDp9M3XzUeoUqPyvidpFaSZ+XVagUFyf4CaEkzhRAlGjFOjD8FgW?=
 =?us-ascii?Q?dSdPvqgNGcOAh28jUI87qILmdSfJ/TXzAuTJl+5PRhCinf7IIgvDLf8Ad8qK?=
 =?us-ascii?Q?dC1wzSvWZmzKamTnaKzXGZJt1F1Zz8SPOXI/FEACE1X4p/xR+FmZvSQibAzb?=
 =?us-ascii?Q?+Au9zGGN9MJ/+4iTK/tpCHDtq2i4WQcrD8TGY0p+dsue7mdxPlY7c3KoNJj/?=
 =?us-ascii?Q?btPHXeluQ08J0UuB8g3FI67ddgCEDh+kCUb+thqmjdCIQnWTJsab6N7uJJso?=
 =?us-ascii?Q?F8BBm6J8TgFGA552pu1m7kVcuRqVDG8URJJTdQBlZND9h3RTayd+yQJPRmR6?=
 =?us-ascii?Q?NSitJdlerr6ImWaOqXNA/kA3F4FcNDOA6VQsbj9sB1ZLJZwrFbG7G6Mpgwuv?=
 =?us-ascii?Q?v/VgHeIbOv4XSNDLIeItlmWSVDomu7UcOb9mcHpt6mckNQVrzAXlVGMynC6z?=
 =?us-ascii?Q?fndbYZHsCgmaoRgrAcDj0sJDOZLzc4XrYcDmnmfpdyrad6PutFjtsPkFO04q?=
 =?us-ascii?Q?4aHlANY1XF23Z7CDK3JQDXN5zgVwiPgcllRMduZgmpQz1xnKGZDUxDEsXXfY?=
 =?us-ascii?Q?E/4qYuCXDcOqEHlU+1iygxMh5W6/ISS2btDRfUUN8OVv90M700STgs1BOjj2?=
 =?us-ascii?Q?vp6zNo9gywJF9VB5fhsfvSoyZfIJBo35kMcPwIoM/T0hENR9eU47adnpWKAL?=
 =?us-ascii?Q?y34YivjwDIj53Li9BKJ4txqnfwNZ5QinCkX3W4VMUAa1OH8VRurwDUDHQ98B?=
 =?us-ascii?Q?zityyINQ50jmOkOj7/+JcGbwcYIqUeyFD1bBd5SK6stbYifayS/GAEdP6uW8?=
 =?us-ascii?Q?sjj9YaQSgdjYdmrQkqKd5XjSTjUT6pwaZvPlasA0EzuWm0EMc9wNDLUBJyCi?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4696e4-f43e-481e-74b6-08dae702cb9e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 05:34:02.1112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQ+RmrbwqsGyqDvBw75mGE3+AqpTS59NiRDomuptrFs7MGeBo69ycc+/1l4zT0RypynEpgd10UW/06kCXustPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7655
X-Proofpoint-GUID: PeKqakHxsggHhUrTaZ8OhmOBNPoRNpXI
X-Proofpoint-ORIG-GUID: PeKqakHxsggHhUrTaZ8OhmOBNPoRNpXI
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

'migrate-incoming' QAPI design have been modified into a well-defined struct
'MigrateChannel'. Similarly like the source side, modified design was
introduced on destination side mainly to prevent multiple-level encoding of
uri string.

The struct contains various fields for type of migration channel, type of
transport backends and various associated migration parameters with each
backends.

Please note that the 'uri' parameter is kept for backward compatibility.
HMP side changes similar to source interface , on dest interface uses
migrate_channel_from_qdict() to redirect migration parameters from QDict
into 'MigrateChannel' struct.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c |  3 ++-
 monitor/hmp-cmds.c    | 10 ++++++++--
 qapi/migration.json   | 22 ++++++++++++++++++++--
 softmmu/vl.c          |  2 +-
 4 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 36de9f6a6b..838940fd55 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2237,7 +2237,8 @@ void migrate_del_blocker(Error *reason)
     migration_blockers = g_slist_remove(migration_blockers, reason);
 }
 
-void qmp_migrate_incoming(const char *uri, Error **errp)
+void qmp_migrate_incoming(const char *uri, MigrateChannel *channel,
+                          Error **errp)
 {
     Error *local_err = NULL;
     static bool once = true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e44d96f5dc..7f45624c41 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1106,9 +1106,15 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
     const char *uri = qdict_get_str(qdict, "uri");
+    MigrateChannel *channel = g_new0(MigrateChannel, 1);
+    migrate_channel_from_qdict(&channel, qdict, &err);
+    if (err) {
+        error_setg(&err, "error in retrieving channel from qdict");
+        return;
+    }
 
-    qmp_migrate_incoming(uri, &err);
-
+    qmp_migrate_incoming(uri, channel, &err);
+    qapi_free_MigrateChannel(channel);
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/migration.json b/qapi/migration.json
index 753e187ce2..201b085715 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1613,7 +1613,11 @@
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
@@ -1630,14 +1634,28 @@
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
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channels": { 'channeltype': 'main',
+#                        'addr': { 'transport': 'socket',
+#                                  'socket-type': {'type': 'inet',
+#                                  'host': '10.12.34.9',
+#                                  'port': '1050' } } } } }
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
index 798e1dc933..7005be978a 100644
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


