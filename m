Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1070700A5E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:34:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTpS-0007vv-77; Fri, 12 May 2023 10:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpQ-0007v8-4N
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:04 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpO-0002eN-9H
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:03 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C9Pmi7017311; Fri, 12 May 2023 07:33:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=sh/OYB5+rwqgBvmcVXyfm1QFTGzSQ/AUHR2vQZWe+HY=;
 b=azZZq5Gs2BBX0tZ3b7oTZ5/yZEWl7/84VRB3++uV1pMryjA+ajK8mJfswXV7B17cpr3k
 hAjQ50KOWXAW8l9EL7pJ2DmpHcugmxm5vk5Kemxdg8M3RteDXw6Rm/7n4Tt7pKYuFjzr
 SLkZO8NVt7B1CLAcULCNc8KFGuAEPsfOxPjHAAxVtsb2ejnRqQ9hrQgBX0unGtBHH+LR
 sLilTiksZMrAWmmaBhyHD3BJpLlR6hfz5R9s/nrgi3PHoxRoKW9zbUtKXprmfa0XYA6D
 /J/TnHX44bSfVhes78GkdqeISjq7ImGAkTAmn+rnKu78QZmnlJcPRspqwTKtwK6anJHC 8A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf7vv9x22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 07:33:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpTSXl2G+M5NUGFJFBQ/TvQtTTOOnTKM2zjA2BizNGqg0DMxWI7xxA3lMOMdYSqsOsTMmNHCdTKKbAlje/M6u/Eeg0c7axZcfTN9sxINPliaAgNdjFhPdPMOTqwHAfyAAEPWAlst4DKUqZYQ+6A1G6sDD/qblcloSlQuQeo3QJRBbu2ULiKow8LeR/s+ToWOLfupnRWfzRKmoWzBQltgF55xw5t5z/b18RGFnbDT8qupG8OajHO3cRut2s7GX82+CSZ/pFYEYCWj8wJ8gwOrpemIK0DCbMJx0MyqHW2GGNkjlvQl6HDOlTApQ5E+/cT/orgyq44ancJf+4TxPgE9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh/OYB5+rwqgBvmcVXyfm1QFTGzSQ/AUHR2vQZWe+HY=;
 b=j+yJexp0EASihFZdmTwaVDyT3NXpACVUsqja5F6KFJPF+nzes04PiLMh0/6uNbjB1Q87mXs2ZMbgIx99kU5fZ/WhAuzQo2fbvlT/xcQISieRL7VZzOgP6Z1FL/GRzA9/zkaPAUWQoVxGI2fLAp46Q/FdCTdKdDsh1G+72c+7UG7F3KIMcJW20ryLb7aGP5JUALA+Z24BOBm023Z+zbmfKB7lO9uZNgumVAyezoaQjiJUpgFTFT7Gmk914BSxBNL6LmLovzkf5+Q2v6eHA97PL/Tf9JdjGWQA8qzDQ4zNt2EfG5mr0RSfTIvI7WlVGQXKECKzxUHj9b8R58+mNC9f9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh/OYB5+rwqgBvmcVXyfm1QFTGzSQ/AUHR2vQZWe+HY=;
 b=ufO7xasLP31pYYwXb1NpYMPSAIkEu2FCodVcICJ7tVTtILg5FCDS3YkkMmGfAtMEyxCnqREen4vBsUndaxJ2Nh9EuqDMebv1L84JpPm28JVPeVGApSL6IMKvW8rts5/pESRPNM16xcS6eCTAQS47K3dJk16d43NVXQpd69qa1uYg3linR+ny2oXnlYABTfFhuMA59JnXpxStJYXsJLr3qjYhn5fgIuVx6a6drqx78h2ra3oAA0IM992vz5U6TkXeZQQTqyjzomxrpGwN2nD76KTGCgdHSM4sCEfTHHvherGsu2qEVgj9bUUnfvfHS0cCrNA9r82J3SAMbfSlh/lz/A==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BL3PR02MB8282.namprd02.prod.outlook.com (2603:10b6:208:345::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 14:32:57 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 14:32:57 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v4 7/8] migration: modified 'migrate-incoming' QAPI to accept
 'channels' argument for migration.
Date: Fri, 12 May 2023 14:32:39 +0000
Message-Id: <20230512143240.192504-8-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: a925b616-a353-496f-95f0-08db52f5c74e
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9UQtQj+dEWuw0tacSMooLqc/DQlLP8a+hl8A+V2quhviTcT5ZObRJK8wIcbalZhdLi2U/9dvHWm9Vkgq5HyBFiEmqFGk0mahMTX5pUUhMF+G2E4U8+Qj++13wdPzAQMmYrOTuc05FLTj7HE7QUMY/94WZ2zIDVtJCrLT4xHBWD/mB9ufhT26l7iJRAgq6lKd6/ILE12xw4qk2sLSyokGR1D11WXnE9xRY++NavnRuBVeWTfyEQvQdy0alne3eDUSPyRS1N0XGe2C7Cupq4fJeIvtSyTHZzclItMBUR8Sfq0IOteuAM6HKB2WXJWKuB/45EPO9cCcOjwLyL9oToiim5oPRDoIVEWjtt3KDckH6PFhy1HZTFlXkksDvd53qYulWqpkgtxJel4CNeSMUh7dLgPhlR9Vdb8rqMmc4kxDi3IqwGXQMwaNwJ5ZvW8iLdkadAcfQhptywjfEtygodt2rk8QXUL4ayxef/xNXkH7KtvzgW22TLMGvX6Z++r0X7UHk9bx5HyZVIJEbf1OtWBj/+uOT2nSgbzt4gzqV8KTi2csrQ+6oZvqhC5F0BQXTNR04QcO6I195VKUofEIyjE1P0lR1vC2WgKU6rksnSU6wef529dbWzvou9sF/nSgDHT2xhSN+N53NbzbRuH+GNVOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(5660300002)(26005)(6512007)(83380400001)(1076003)(38350700002)(186003)(52116002)(2616005)(38100700002)(6506007)(2906002)(107886003)(44832011)(8676002)(8936002)(36756003)(478600001)(6486002)(6666004)(41300700001)(316002)(86362001)(66556008)(4326008)(66476007)(66946007)(6916009)(66899021)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J+SF/s2MAZ6eK90sDga2npvhTh2CemQdOufDlfVaEPaw69G6w6/VYnrUPNOy?=
 =?us-ascii?Q?XbdGHBHtbtjQEuXXRFvYtmV2sZcqc6y1ZQ34ReMPtu3scCNXmuQoOCwUNA4M?=
 =?us-ascii?Q?Ds0O1EmBhou+vv1fSbwKHaY4HjhPfMAHU6dK0ueUJ2LpBeEPhF+RsyBAR/ZB?=
 =?us-ascii?Q?yf3qnQnUqPSNysSbLhvjKmOpZkA482IX29nEZViIXuly0A+4FzqISmw03ogg?=
 =?us-ascii?Q?gfkxtAfHLDdt8A8PTZVc3cegs+TBQGRqMYXfRXFmAC11MI12iSDjOrelK67b?=
 =?us-ascii?Q?6xwuZQDq47GFNPkB62i0Znh9lL0wBTy811g6eUdQtl7vGnd7hQxEoTb3UGHr?=
 =?us-ascii?Q?QNouEQxfb5XtF/lK2u5EXuhuh0+ZZ/POYYt9LicO0xnvGOPQ395uNFWzuAW4?=
 =?us-ascii?Q?QsZwh9IprJRVOfENxePBErn8+Bn4GfhvS3Wdhsd2A2Blxhyf7IzVTlbMukUa?=
 =?us-ascii?Q?Cea6N9Q8CSqPss/oNn7c3M70L5ICsI7XXi/nsQ6pvK8MDHRTzUDjnIWKNsHQ?=
 =?us-ascii?Q?7rrLt0b9euPkagbjPVrxNvkZPmMgSCYkXScSDPGQlgXbvcm8CRHWi5gtMseG?=
 =?us-ascii?Q?RegAvmTvLSM6tVVPfOa+XcQ8oLHHVlfntTcSxyjZMcPtZsm5fhrrH+KAdJcX?=
 =?us-ascii?Q?xOJxK+QHNFVkdttDg72Dz82xL3utwkGAAoJfNt6BZTFzW5VBnC26MQEFLkmG?=
 =?us-ascii?Q?crlpVmj6CWb1sjx9LR1pWz/N+5jDKFBb9UwQiq7wpaij3kcr5Co2u8JHGkqJ?=
 =?us-ascii?Q?0PNFVGIUJbWbH9sep/gOxiXLQy9EN1HEQ7icmhat+/d1AB5hHCYp8rtvMANg?=
 =?us-ascii?Q?d//stQP0hTrwZhD3L61mY8Sd2lrXdKJwNkYt4z8/A0ytJE3ABHjZgeKgfD7E?=
 =?us-ascii?Q?+1D0V9ISMBrL2dBlfYl14CM8JseAkkrcXOQzRe3giofXQx2U3gdCqYq3Z0CW?=
 =?us-ascii?Q?Yu9qHii8jepcJF24tZ2zlfWJjvffSTXJ2BGgjC0TfPEAFuvSB2+KWEdgjHio?=
 =?us-ascii?Q?fxRL+e8d4PyTJqI/3t7w6x/eQghmTwO3NE3eqvPYGOS0dzu0NKT0B8UBUrMO?=
 =?us-ascii?Q?/YaiZgmRWhjrfJYFiIMWPBGBqEpJQTLAagukLLAVBU1vt51s4ZL7sU1P6S2A?=
 =?us-ascii?Q?94Rhs8xO+i3FfP73g6WxJZlmNI4H7N7UEIZ+dKWe0wES/wRgCYXhPOLYNvCm?=
 =?us-ascii?Q?56+zHhCgtoHXy9W2SYfr7F5OqyhlkfVpARp1ANfaxE3IYiyEPIGjSSCqnwGm?=
 =?us-ascii?Q?PbLn1KigUXAKWrBMGA2wRNl0pYOcZ76OMrMS+r8KBz4uTUZV/ZU4WauVW2y7?=
 =?us-ascii?Q?W2ULz4FMola3/w2DHN2dFLdKnqEO9KIlgvVGdQqlpLzZEPYLCzEvDuNF1YAr?=
 =?us-ascii?Q?Y2ISKTmltbeae7VzlEUQv01rG2inH5bdg5f7A0k08c+MfSqP/xZ3+ue8+cwq?=
 =?us-ascii?Q?Wq64ia4EpBNrhQt/F0Pdbfbq0pdLH4uyU50ODthiParcrkMs31ZeNi5N06Dm?=
 =?us-ascii?Q?3UmrDMEjiPWgBCzifKDzcQ9CwBwavA2zk6x6bH6upy4sL0trcoTZ81d9QmEf?=
 =?us-ascii?Q?2LaS4+i+0Ma2b+YZU/kZSrgDBzjUAo7VNyQefDPO?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a925b616-a353-496f-95f0-08db52f5c74e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:32:56.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3Z1O1k4tjz/Tkyxs2lLI+17+5BjYlh1Jzhi8dO2qjNggu6Mtt1rIDNu2SfCr/8TPGx44ExNSFC5mGaXPJI2/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8282
X-Proofpoint-ORIG-GUID: 9VQM0aToQ52PI5v_lXJ9to4ZWOcY2lUM
X-Proofpoint-GUID: 9VQM0aToQ52PI5v_lXJ9to4ZWOcY2lUM
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

MigrateChannelList ideally allows to have multiple listener interfaces up for
connection.

Added MigrateChannelList struct as argument to 'migrate-incoming' qapi. Introduced
MigrateChannelList in hmp_migrate_incoming() and qmp_migrate_incoming() functions.

Future patchset series plans to include multiple MigrateChannels to have multiple
listening interfaces up. That is the reason, 'MigrateChannelList' is the preferred
choice of argument over 'MigrateChannel' and making 'migrate-incoming' QAPI future
proof.

For current patch, have just limit size of MigrateChannelList to 1 element as
a runtime check.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration-hmp-cmds.c | 14 +++++++++++++-
 migration/migration.c          | 21 ++++++++++++++++----
 qapi/migration.json            | 35 +++++++++++++++++++++++++++++++++-
 softmmu/vl.c                   |  2 +-
 4 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index f098d04542..8c11a8c83b 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -518,10 +518,22 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
     const char *uri = qdict_get_str(qdict, "uri");
+    MigrateChannel *channel = g_new0(MigrateChannel, 1);
+    MigrateChannelList *caps = NULL;
+
+    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
+        error_setg(&err, "error in retrieving channel from qdict");
+        goto end;
+    }
 
-    qmp_migrate_incoming(uri, &err);
+    QAPI_LIST_PREPEND(caps, channel);
+    qmp_migrate_incoming(uri, !!caps, caps, &err);
+    qapi_free_MigrateChannelList(caps);
 
+end:
+    qapi_free_MigrateChannel(channel);
     hmp_handle_error(mon, err);
+    return;
 }
 
 void hmp_migrate_recover(Monitor *mon, const QDict *qdict)
diff --git a/migration/migration.c b/migration/migration.c
index 78f16e5041..de058643a6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -452,12 +452,24 @@ static bool migrate_uri_parse(const char *uri,
     return true;
 }
 
-static void qemu_start_incoming_migration(const char *uri, Error **errp)
+static void qemu_start_incoming_migration(const char *uri, bool has_channels,
+                                          MigrateChannelList *channels,
+                                          Error **errp)
 {
     Error *local_err = NULL;
     MigrateAddress *channel = g_new0(MigrateAddress, 1);
     SocketAddress *saddr;
 
+    /*
+     * Having preliminary checks for uri and channel
+     */
+    if (uri && has_channels) {
+        error_setg(errp, "'uri' and 'channels' arguments are mutually "
+                   "exclusive; exactly one of the two should be present in "
+                   "'migrate-incoming' qmp command ");
+        return;
+    }
+
     /* URI is not suitable for migration? */
     if (!migration_channels_and_uri_compatible(uri, errp)) {
         goto out;
@@ -1507,7 +1519,8 @@ void migrate_del_blocker(Error *reason)
     migration_blockers = g_slist_remove(migration_blockers, reason);
 }
 
-void qmp_migrate_incoming(const char *uri, Error **errp)
+void qmp_migrate_incoming(const char *uri, bool has_channels,
+                          MigrateChannelList *channels, Error **errp)
 {
     Error *local_err = NULL;
     static bool once = true;
@@ -1525,7 +1538,7 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
         return;
     }
 
-    qemu_start_incoming_migration(uri, &local_err);
+    qemu_start_incoming_migration(uri, has_channels, channels, &local_err);
 
     if (local_err) {
         yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -1561,7 +1574,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
-    qemu_start_incoming_migration(uri, errp);
+    qemu_start_incoming_migration(uri, false, NULL, errp);
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/qapi/migration.json b/qapi/migration.json
index a71af87ffe..9faecdd048 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1578,6 +1578,10 @@
 # @uri: The Uniform Resource Identifier identifying the source or
 #       address to listen on
 #
+# @channels: Struct containing list of migration channel types, with all
+#            the information regarding destination interfaces required for
+#            initiating a migration stream.
+#
 # Returns: nothing on success
 #
 # Since: 2.3
@@ -1593,14 +1597,43 @@
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
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channels": [ { "channeltype": "main",
+#                          "addr": { "transport": "socket", "type": "inet",
+#                                    "host": "10.12.34.9",
+#                                    "port": "1050" } } ] } }
+# <- { "return": {} }
+#
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channels": [ { "channeltype": "main",
+#                          "addr": { "transport": "exec",
+#                                    "args": [ "/bin/nc", "-p", "6000",
+#                                              "/some/sock" ] } } ] } }
+# <- { "return": {} }
+#
+# -> { "execute": "migrate",
+#      "arguments": {
+#          "channels": [ { "channeltype": "main",
+#                          "addr": { "transport": "rdma",
+#                                    "host": "10.12.34.9",
+#                                    "port": "1050" } } ] } }
+# <- { "return": {} }
+#
 ##
-{ 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
+{ 'command': 'migrate-incoming',
+             'data': {'*uri': 'str',
+                      '*channels': [ 'MigrateChannel' ] } }
 
 ##
 # @xen-save-devices-state:
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6c2427262b..ade411eb4f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2633,7 +2633,7 @@ void qmp_x_exit_preconfig(Error **errp)
     if (incoming) {
         Error *local_err = NULL;
         if (strcmp(incoming, "defer") != 0) {
-            qmp_migrate_incoming(incoming, &local_err);
+            qmp_migrate_incoming(incoming, false, NULL, &local_err);
             if (local_err) {
                 error_reportf_err(local_err, "-incoming %s: ", incoming);
                 exit(1);
-- 
2.22.3


