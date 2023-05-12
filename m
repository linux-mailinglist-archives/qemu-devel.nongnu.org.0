Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4BB700A67
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:35:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTpP-0007ub-U1; Fri, 12 May 2023 10:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpO-0007tu-4q
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:02 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpM-0002cj-3g
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:01 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C9NQJn024537; Fri, 12 May 2023 07:32:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=Z4uInVUScCERyuomqGzFfUMrAQvRXOBlflvcLkl5EzE=;
 b=iB+38H8Bl+hdMIPVbRWATVU2vPsZ+kW/mg5yUOd1vo3Nm6ytkz+uOE1brCWwhs9Wv3op
 lR9MNfslcSYQG4Pr+KHd51u2vR3vV7+A0D5wXcdAawGP70mWYcfkfjj50/vEXJKn51m7
 fXboQogNizF4d+8sVRUmub0E9IVCruWWxuE/45y2dWjFXhzOf0gkUVGh90DZnDhL8AaL
 QIOCS0FG01dBvEqarOyJw4vVtRl7gQL3gXYF80NQPatOjWpSEl0kW2K4Dhz63aGtmE/M
 IMDS6DBLBYiQcqz+HFM65PMRAV0JOBzHtRmGtIOnp2hWyWoNhi7miEf0JiUIfkxvYVeq xw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf7g6a11r-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 07:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLBhr0nitLE9l12P+tk6aL+FxzE+vORPOQfaGw7rd1Q2EkbxxuUYjD4+KsEU+v3eLshxfyOGptRkwI7NPkt3bjwHzacUeN4koW+9gUWXsoVnIf/6N2L4ZKA1x9bcD/2vkPQTCH9GWqQwxe+iSpf3pKeGe28Q7NBp39djXwMyEx+aVcVDRL6Vtv8LqllFXWa9l2ILhuXhmsh3/IWs4mW3lG4JxLc8DnpMzlhS5g+7CVdMO5ZjPVo+s8kCrtwU/mDhB460JIwTvEmSTHTVImO0CDSMyeg+WI+Bp3IOdXzcdhp0WjIfgbn7JuWHRdCdgjJYSfbh/pKqvRWNT2u2gy8HvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4uInVUScCERyuomqGzFfUMrAQvRXOBlflvcLkl5EzE=;
 b=I3xVsWWlUF67qIihF1WFY11ix8OGK213Bbd0ir8enx//ZUPe2flXhLi7q2kVV5YBBxgjca/95ICYaeh1EagJ5bevyK6UVQAyJKA/ypJhu3nJPG1MjVQXvYAOghVZJj39gq2x5ImsseBf/ZGG8Oc1iGOJkXhuk1q5OiZpmXYYipA32hWgAiREcrhvzkxUDsrLF40qGeB8JG+1LWTAl2BmQZzw78uMCfsN+nR/xIKPcLeyIBXpkyA1b0qtXyDn/ztKxjH9O71Xj3b9+vyffKoebjdMgecRRTYP1S9U0SQczPSAxKdsdwnmApDv8djA1z58OGjOxRAU4kJRdWa893ICUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4uInVUScCERyuomqGzFfUMrAQvRXOBlflvcLkl5EzE=;
 b=ZlLgTKtM04SsvmscuXMgUCcYj8MKwOB5Wwdrax8pjSMjo9abVOU8Hgjcx/MGONOHNDoeHcupBNdqf2bhVByBOdvJZXuG5PCtAXi6cw1eK1rcc03N7RSxlpXUCSJJuziNxJ55yrJo9GLAn7xINlJuuzILFWynaPaHgs9VRECWy7aK00pjjDw2gDUHtAgjLwKgsN8QRi34Tq9Ef7HX/4iKfRdtnsLBKkgbdCOVIY2Ouc3vDOOETs5Fp6lVn+0p9lVHawZnliQc+tzQq0NBkQo4o7OTTC1+Bne7tg3FZDwGllNSEq3K9yNTQkdFP3gn2htmWiLMez2oGMIlSJz0fnfa0A==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BL3PR02MB8282.namprd02.prod.outlook.com (2603:10b6:208:345::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 14:32:55 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 14:32:55 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v4 6/8] migration: modified 'migrate' QAPI to accept
 'channels' argument for migration
Date: Fri, 12 May 2023 14:32:38 +0000
Message-Id: <20230512143240.192504-7-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: b66a786a-d1c5-4928-6a8e-08db52f5c65b
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fXgl/lVsYc4NMuwZ9y7FfeJSnBDtC5nBEoI21CyHqDUwfR9NiW2+Cp81+01EQZtMakACyI3tH+nyijex0+ojq+ctZnufJQ8O7Cg0nduoIbMpRbIqRvABcbpSxBzkYL3kcoJDhaBY7LAroFPkY2ZakSklET5zYd7YNd5KScM9V3kfnWlN+/+15/voHwj+gehRBkFmjmq7AWVxVhykqlW12F1yfuH7ZIpwSsKwxIotbsWmMfF3gXLmWA5nlXkMFr3RlDjPhsIuqja9XTvCvhJnVpvEeDLC/DYqbvfx5LEUYQXX0NutTGcv6nHjMWIRMK6rG2/DIeahhNQPsGgbmbzFSqDbaRIbQsKNKb6Vt9b7onpAlH1WgFhxPrmav5BA0YNWDjiVsVlfIsdU/svx6rFmmlMdm5F4WojIYgaFFJ5MBEzM8l3JbmZlo1MB/tyyyTxfP88648SsvASQJ9EIAKufBFfw4V9V8AI60nvBYK8H5Hh9NgvBXVFlsl2OxPvKjdXB4knAM1pTcWMdJ8ITMxVO3Y1hh0PLVfK7KYMEnKSUjdzvrNzVJf/bBsUk/D8/qzZny1LnMcr/j9b7knHpKkaO0zfku0IsbatZY9bEEu9KwXtmq1okDdyDIzNq3Ofh06EDAwXIlURw+3G0mkwfIl+6bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(5660300002)(26005)(6512007)(83380400001)(1076003)(38350700002)(186003)(52116002)(2616005)(38100700002)(6506007)(2906002)(107886003)(44832011)(8676002)(8936002)(36756003)(478600001)(6486002)(6666004)(41300700001)(316002)(86362001)(66556008)(4326008)(66476007)(66946007)(6916009)(66899021)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uPLnRaT/efdqHKkwzbcLw7wwaphUN4IoNbY7v/duSgY7QYCJunoQnS8oAcns?=
 =?us-ascii?Q?qnQv+kl4zljxjg8QQd3VfltvlAlrpjW22My4naIPjfEIOPPd+tooHPxt7TP5?=
 =?us-ascii?Q?NZktwVP8S630bJl2oGhUEOhAYENNs2LhVbNcKCt9SDz3WEZAaBMCqR6Kg54o?=
 =?us-ascii?Q?KTg5epjmqUN1+qKP21xMx5vAQazOEgEaZUmGgNtmvdr7E27PZ4v+kBrkDxx+?=
 =?us-ascii?Q?BmBoZFhnvVvb9ZiJJW2YK/C8e8NjQ1hoA80fmeqKiNDa1ym5D7Dm8EyIdj8/?=
 =?us-ascii?Q?5mVTdvd7U11zlpyxN3PhHn5th/J6/ZOLUHeeTBBroUrP/DvlD9rmIOsWU7iM?=
 =?us-ascii?Q?0fS9KW+S+4mWqKUxU8vVoArUdKCstJ7/ZCMsUlt7xqYbLtng63hAOJKQPHBk?=
 =?us-ascii?Q?qkf2+PxshJHs/hCY3E8zE/8QCBOnVeLf2aAY8adX8rHmUecAqIWxX8mRa5iT?=
 =?us-ascii?Q?mWBGLVTsj4+X+DCeSqs6zg6PuW2mj8k9X4BR3TbG7B7YXGtn8U6NAbAzC99r?=
 =?us-ascii?Q?muJ+DVVb/jYV1X86FqTAdDQgxWOYHjZOW9zJvwYR34o9lBPi8t6qgq/pPgd+?=
 =?us-ascii?Q?9mz5UToRwbW7ReTEAj+qI92Jq2D1t6j+5vu2KnSO+VjIiyM0Zn0zJXuvsU6b?=
 =?us-ascii?Q?2Ucirt7JzpHngbImU2lIudPILQsxapzfbkbk7Cc92aR0xLNZxCx9/cvgO7B7?=
 =?us-ascii?Q?AJwt524kjNw9wUEpKwcN4yeJbtORqYpCToB2zJqFoil6NDs1jt5hAJZkb0vW?=
 =?us-ascii?Q?YrPad467bacK94ISdCIlU0Zbc91O4B0Y4PH5XO8/8+ADztxpzBWVlr42vSJb?=
 =?us-ascii?Q?nlAOkPChGWIN/HQnMi2JyO1UO1hw6t81QqBNgifq+MQVXqA9RJ7VOcK1eRLG?=
 =?us-ascii?Q?szYu5pi3BjmQmH3O8eFROA6trCON7Wwf57/yIrDX5hGfaTXSsz/bnblpp8HS?=
 =?us-ascii?Q?xSJjdsZ+rgtlvxauyFMBUbBKh8m1c54QRRwq3CXZPn6sGaHjAZTDPFzusQQf?=
 =?us-ascii?Q?yMvsEy6cVYVqWGY/4XDfWFbB6EehC3JyL3o6YdMDnrPJe7TDMRsIdyupzc1q?=
 =?us-ascii?Q?3C64pVWXXXTLj2E0W7ingOIKcHXgx9ADvTWcA9k+Pcl06dJiDsI87euqR/36?=
 =?us-ascii?Q?KI6rdFSUMkVPa0dIIyu/skyx1fBG9cufFurTehiSZodNbrW279CUpr8UEByS?=
 =?us-ascii?Q?+fJRRRyMS9tpfrTnQVsZJH8jQoS9EaLnOTFsqtWLZ10oMpYzYlLLufqvWdO0?=
 =?us-ascii?Q?J0lQ1k5YNagryGwwf5hwgDcWBVS89Dcj8qpZGAbjn47zfCZlOso0dAzkz4e+?=
 =?us-ascii?Q?ytFANU76elkBhLCxnt8SUfsrSjsJ+nYV12nX1DazylSgynzlX9+LGRXL8lnX?=
 =?us-ascii?Q?cR5OtFM/KWOYMWPMd7eT67yf6BGle9mhPpPckjDaZdQAa1njPyNlP49jm92F?=
 =?us-ascii?Q?gkeVbrQ3AYu4cGhnuBZg6nFye69KCtxvrJVOmSM+cWAOVvbZzbuZFIJAUmi3?=
 =?us-ascii?Q?KLYh/i9QKbQN+0ohMrUNx032v3k+YTy/vOIYEj6J1QAYEnzBNrIqDiu8Mbn5?=
 =?us-ascii?Q?QcWn2N0Wnnd+eveaDKoXgFedr5cG/UPAierOXwBx?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66a786a-d1c5-4928-6a8e-08db52f5c65b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:32:55.3468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkJ2wDR2Dpy8N53jypynhqbyDJGY04AMQPF5oL+wlFEoal3L3VGzXu+KpxQVJR94mmfvcaivCcIIGC9OAZ6nxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8282
X-Proofpoint-GUID: 06RA31VpFQmetFoX2EYIXX58F2Z6J9CO
X-Proofpoint-ORIG-GUID: 06RA31VpFQmetFoX2EYIXX58F2Z6J9CO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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

MigrateChannelList ideally allows to connect accross multiple interfaces.

Added MigrateChannelList struct as argument to 'migrate' qapi. Introduced
MigrateChannelList in hmp_migrate() and qmp_migrate() functions.

Future patchset series plans to include multiple MigrateChannels
for multiple interfaces to be connected. That is the reason, 'MigrateChannelList'
is the preferred choice of argument over 'MigrateChannel' and making 'migrate'
QAPI future proof.

For current patch, have just limit size of MigrateChannelList to 1 element as
a runtime check.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration-hmp-cmds.c | 113 ++++++++++++++++++++++++++++++++-
 migration/migration.c          |  17 ++++-
 qapi/migration.json            |  69 +++++++++++++++++++-
 3 files changed, 192 insertions(+), 7 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 4e9f00e7dc..f098d04542 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -51,6 +51,101 @@ static void migration_global_dump(Monitor *mon)
                    ms->clear_bitmap_shift);
 }
 
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
+            goto end;
+        }
+
+        addr->u.socket = *saddr;
+        break;
+    case MIGRATE_TRANSPORT_EXEC:
+        addr->u.exec.args = (strList *)exec;
+         break;
+    case MIGRATE_TRANSPORT_RDMA:
+        addr->u.rdma.host = (char *)inet_host;
+        addr->u.rdma.port = (char *)inet_port;
+        break;
+    default:
+        error_setg(errp, "%s: Unknown migrate transport type %d",
+                   __func__, addr->transport);
+        goto end;
+    }
+
+    val->channeltype = channel_type;
+    val->addr = addr;
+    *channel = val;
+    return true;
+
+end:
+    error_propagate(errp, err);
+    qapi_free_MigrateChannel(val);
+    qapi_free_MigrateAddress(addr);
+    qapi_free_SocketAddress(saddr);
+    return false;
+}
+
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
     MigrationInfo *info;
@@ -702,9 +797,18 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
     bool resume = qdict_get_try_bool(qdict, "resume", false);
     const char *uri = qdict_get_str(qdict, "uri");
     Error *err = NULL;
+    MigrateChannel *channel = g_new0(MigrateChannel, 1);
+    MigrateChannelList *caps = NULL;
+
+    if (!migrate_channel_from_qdict(&channel, qdict, &err)) {
+        error_setg(&err, "error in retrieving channel from qdict");
+        goto end;
+    }
 
-    qmp_migrate(uri, !!blk, blk, !!inc, inc,
-                false, false, true, resume, &err);
+    QAPI_LIST_PREPEND(caps, channel);
+    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc, inc,
+                 false, false, true, resume, &err);
+    qapi_free_MigrateChannelList(caps);
     if (hmp_handle_error(mon, err)) {
         return;
     }
@@ -725,6 +829,11 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
                                           status);
         timer_mod(status->timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
     }
+
+end:
+    qapi_free_MigrateChannel(channel);
+    hmp_handle_error(mon, err);
+    return;
 }
 
 void migrate_set_capability_completion(ReadLineState *rs, int nb_args,
diff --git a/migration/migration.c b/migration/migration.c
index 6abd69df8d..78f16e5041 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1694,15 +1694,26 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     return true;
 }
 
-void qmp_migrate(const char *uri, bool has_blk, bool blk,
-                 bool has_inc, bool inc, bool has_detach, bool detach,
-                 bool has_resume, bool resume, Error **errp)
+void qmp_migrate(const char *uri, bool has_channels,
+                 MigrateChannelList *channels, bool has_blk, bool blk,
+                 bool has_inc, bool inc, bool has_detach,
+                 bool detach, bool has_resume, bool resume, Error **errp)
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
     MigrateAddress *channel = g_new0(MigrateAddress, 1);
     SocketAddress *saddr;
 
+    /*
+     * Having preliminary checks for uri and channel
+     */
+    if (uri && has_channels) {
+        error_setg(errp, "'uri' and 'channels' arguments are mutually "
+                   "exclusive; exactly one of the two should be present in "
+                   "'migrate' qmp command ");
+        return;
+    }
+
     /* URI is not suitable for migration? */
     if (!migration_channels_and_uri_compatible(uri, errp)) {
         goto out;
diff --git a/qapi/migration.json b/qapi/migration.json
index bf90bd8fe2..a71af87ffe 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1464,12 +1464,47 @@
     'exec': 'MigrateExecCommand',
     'rdma': 'InetSocketAddress' } }
 
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
+  'data': [ 'main' ] }
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
+# @addr: Information regarding migration parameters of destination interface
+#
+# Since 8.0
+##
+{ 'struct': 'MigrateChannel',
+  'data': {
+       'channeltype': 'MigrateChannelType',
+       'addr': 'MigrateAddress' } }
+
 ##
 # @migrate:
 #
 # Migrates the current running guest to another Virtual Machine.
 #
 # @uri: the Uniform Resource Identifier of the destination VM
+#       for migration thread
+#
+# @channels: Struct containing list of migration channel types, with all
+#            the information regarding destination interfaces required for
+#            initiating a migration stream.
 #
 # @blk: do block migration (full disk copy)
 #
@@ -1494,15 +1529,45 @@
 # 3. The user Monitor's "detach" argument is invalid in QMP and should not
 #    be used
 #
+# 4. The uri argument should have the Uniform Resource Identifier of default
+#    destination VM. This connection will be bound to default network
+#
+# 5. The 'uri' and 'channel' arguments are mutually exclusive; exactly one
+#    of the two should be present.
+#
 # Example:
 #
 # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
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
 { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
-           '*detach': 'bool', '*resume': 'bool' } }
+  'data': {'*uri': 'str', '*channels': [ 'MigrateChannel' ], '*blk': 'bool',
+           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
 
 ##
 # @migrate-incoming:
-- 
2.22.3


