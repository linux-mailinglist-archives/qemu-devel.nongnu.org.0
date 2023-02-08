Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F968EBA0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:37:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgsI-00072k-MV; Wed, 08 Feb 2023 04:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsF-00071a-SV
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:19 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsD-0005Iz-PS
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:19 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3185T1sZ025574; Wed, 8 Feb 2023 01:36:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=h9+eSdSGtTjWLU1eqxxOpysUo2RycZlMq9Gih/PXf7E=;
 b=pCTRMxLOm8VJoWuUpBVd2pin0LsDm3Mu3s3v4TjzJ2UAXK8uz8dRx1P8tGTpo694oSML
 BDrd5Ywv6UvLWzsbGxqDZkbxvq1PYs0ZRSvP/yav/QVaAxSihxkHZU6vtPEg5Hgr2j7+
 iReXw7Dr+T1vVzULIPnDFT9Y9M2aEsbvtsZ8woy+aMKKsrb9DOj/IHBI2GJ1zMH16xND
 dC2u1oW9rvTQ6TRi3O1m/B0r3knrev/u8k0vSp9GtREkAp9R7L6QGNVSaL+bABlyJDgL
 blxBQJxxXoADmLDRYQsaB1zB9j38ZOvGh7qsKxUVbrOz14GC1yhLV42rPKRQnphe8tAU aA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhmk1bt2k-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 01:36:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S82Tg5E9Uslx5ybzKRRtj6u3t5dxgyInLVFq6dJ8GRZBcm4IckZ61QCx6nAA0yN/dAByFKHjiYSf2x3D4PU7O3HEnCRhce8MrelRR9TIlK5xC6U2dZTksu4awZbjN+JNd4FvXTnMVJcEtNW7B7waY30/gvWVOgSp52UQ6qKcQn3mqvyqOfUWisqCV58lTKaBxCyU8hzrrhCEkMAAbGUsLsEJ5/W+VJlcLlgMbAclFRameAS/9FPc0o4HmAq0XX8h0Ofwc52kzZ/dznIu64llHjFwHmto7xDTOhjZ3TPh7x3gP8yi5M1z3xPNPLR8FNj0TTXnXJ1dXXq0K25rmYfWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9+eSdSGtTjWLU1eqxxOpysUo2RycZlMq9Gih/PXf7E=;
 b=CO8dDFWy1e5tdX8yrq54OS0wyG8ZJHrPjE4gtJtRSjquvgr9gPAAD2RoVBT8lSxkfe69AKXLlBmWb8XS3rkTOwzjCIATqsXWtNHpUkqmiW5QhfpYzJl05KyS23yxYl22LLBSmvzgKgxdrWqHq9HKHfgWjxNoqnGBc62f1TsBs/DuVSjGQIAAVX9wIkhOWngGPSVmiNxVFsRceHcXXsUeEHt+f5Cpy4faRmD3E3BDJIIvNhFcfNym3JM0cd5GUQo6rIt06rDwEcZRTg/C/kT4q21fhda9DFD4Ha47ICgl7/mdZUYag7ELwkkT4JbE5bc5bc+NxmXJkTYakX598UOKpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9+eSdSGtTjWLU1eqxxOpysUo2RycZlMq9Gih/PXf7E=;
 b=bot8TYsZ00vuRR4jZ2qgaT2sh6dwz+Kvbl6TzUYHOi2Cztc2V4OcPInVput7dCEr4gqeXtoVU2gIjOBYOFqS1nD4nEaEZX0CRkv8UT0c8NfA4dgO6JQQnw3NhPCL7ZYsBHMFK+SZs0x9sI/qxLOYpwJrbpD9syIdb5xOVOh6QnNlCn3zZ3UQLcRBjx35bDLkyQhqDhdQK3RuohIEjRrnoGBEuarneStipGjH/CX6KH7TLpw3JNx+ghcue1HQcR7FQlY9JfZFcpXMQmbsPw+qElV96eFwDVhEObP7tOUqnHwynOHdBYzyWFLBmO6Aqjap7WW1p1NPB6yHWxDdMJMb1A==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8494.namprd02.prod.outlook.com (2603:10b6:806:1f9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 09:36:10 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 09:36:10 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v2 3/6] migration: HMP side changes for modified 'migrate'
 QAPI design
Date: Wed,  8 Feb 2023 09:35:57 +0000
Message-Id: <20230208093600.242665-4-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: b3bf5ece-91b2-4e74-e3f9-08db09b7e962
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZvM5kMrlrF3q/QAMTHLF4qqv4R8Wuwrl1lzCMxVi3OTNBPQqMmMz3lLTD7KUQPeRwRcL5xN/MG7E3Epkr+DVDKtXXlLgnyOw5y8/UJHDffko9swYbR6kSy+wQon91FtE1P7U2dxgQ1crWhJQP4KTVZJf3+/MbjM3qMyxS5mJKr3DP6dH9t8Dj1lxdiBJPOF+QzoyATgIGKCoWB9EdUX1xucGy8E7Af2JDRZJ2rqfkVvv9kVmSuEmagCWlCeTrIlmxJRDhdOt5d+UjbhqNF8tt/rXpbjcRglE5J6+WqU3+39kH9/24fHas5AC6w9m+OEFPcItYWIbyzxCb8Wt64T+QTIQTel7Ph5fU6m5rrVnLaaOjmMp4iCtaMO33QDMgDCVVYkc249wS1cuFzjG37ggKYOJKeDR8fa2flATzDKCB16PDzmjvUh0/mQzAAwhK+13l+BtVxRzlqKrK0DQI2k6trZszbwsUJT8f724DXvYW3B5X7smM9FRX27wQ6/FacI691D0RxSLs7n9sDzNm55NVd5/qfvHLaacBg/Ivucd/+BZPCbQc/gEhSIlME/eQwdktuz7Vu4lm+AtWv3dpnYaHqkGK50829sWR/n6b1Z+sHmy5PCAHLZOPFoNzSqq6eaffYjnVeFYKPy7rYmWt8eX5QxelD/ZoUL1LvU26xZ0Uv1p4oc8InUpxF7zT+45pFyLl975e6+TDh35L8Zz9Haq232XFV/EqmUFZAM4GZpwky8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199018)(6506007)(1076003)(6512007)(36756003)(26005)(186003)(52116002)(6486002)(478600001)(6666004)(107886003)(8936002)(5660300002)(4326008)(6916009)(66556008)(66476007)(8676002)(66946007)(38350700002)(41300700001)(38100700002)(2616005)(2906002)(86362001)(316002)(44832011)(83380400001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dKtOPmkDBhV0RO5ImGUIpp0w2YlRwyUg3w3psK0Bqd8uawUg3llAAGxzDLZp?=
 =?us-ascii?Q?8NT1Dr0de6HjYFzxJmoAqxzYKaw5bpuImUSRcWlBVoVjLfMrInmvdlRyEBwL?=
 =?us-ascii?Q?EWvixfeIDexMgbZtRHiaHoU8y0c0Mr8u1bVKYrP6pmGiKpPp+Ao5hZEPLcoE?=
 =?us-ascii?Q?tHOUAI7jLbtixQtBtgpujpZ9AO48SwxBeD/QjE57lKl6FYTJBiCkgQfZL3wo?=
 =?us-ascii?Q?VkwpXvGiC/XDmDmVy+dBi5lrrF2Xche6VX4/pPdpdqoWrLQRkOE0kFZvbcd6?=
 =?us-ascii?Q?Pq0uvkfkEK6GWkK1ry8Ttn7jMWpLYAdVlD+KebMSP9ZhK83CwVVcAECTFM0P?=
 =?us-ascii?Q?qU06XSi1GNBNL4cRDAPRMPFrz6KSNWT2SDGyFPKCpRdS7wBpw1ResNrYnQt3?=
 =?us-ascii?Q?xnx4Y4IKndUAR87IBHODdqR9hq6BE7mQWbQTG4XTvFwX2yQcE0jxxThwnEfB?=
 =?us-ascii?Q?SdNpjhgwY3Xf5sQ7ukipffFfFk2K11IfrCgrdgR1umAOMYTL+pKkqArlW/30?=
 =?us-ascii?Q?9SGDyB5S6oTiDfSoScCeKcTv9XxTOgjODvGky5u2aEoA71HqQVQ4sSgJmAug?=
 =?us-ascii?Q?WTjOjeENRxYhxYNUui/PP+fR6DYUelxgz3hFCUHGEuMGTTNET3OIaDeJW+/E?=
 =?us-ascii?Q?GLD1ZjsCfKpBNEX/qlF6JS93h1+Od6y6oyEmevvNCY9vV01igCwItCt6ws0/?=
 =?us-ascii?Q?ZKH9otYo1KDJpx50MkemnVnGtFEmH6N5aQPJP3n+D4IWCRK4a+mSz9meIRbR?=
 =?us-ascii?Q?O/SauCePyZFNwbdskjmqG+d2/lRX/fmhc8PuauvCl1s2N2RqBoKR+vKs2h9p?=
 =?us-ascii?Q?E2r666zTqon0s2CSeL7lIkCedB1ZN+ZznpnzJ1um74+J8pBI/7knEisNH7Id?=
 =?us-ascii?Q?W04IF0EM6rQ91+fKqZSBxMS8yQOyIjS+zTOtQ7UD+0WzJdngXvQ6O/TORqjM?=
 =?us-ascii?Q?mcWObf4n0Zm3Qdzqmx8ujA0xUgY6/zLrgeed78VyuethwCgkGTfmtl4x/B+I?=
 =?us-ascii?Q?ulgkFsyJiAqML+r/8EngZHo2FfnfiU3a82UmpqeiG2GUru29Kvjsfv3PSgeS?=
 =?us-ascii?Q?UzMaQHRGyEN7s7EU9FJLQ0bqDho68oOUkf5qdepo+p/NB3dnmiR5pj+Ju5CI?=
 =?us-ascii?Q?++jgWCq5LPGjTr0jlUBy26TM0sUFKj8hileabOwWnxl/4IM7zaItJkOt8i3K?=
 =?us-ascii?Q?6zkumGXSqBvgPxTv5Xy8noNOThiF0agZ33PSMDK53fgonX8f1rBGU5kvb9iR?=
 =?us-ascii?Q?ZkdPzXS5g1TlTFcc77EQA2k7BKwSiDxYU6BJs6gg2lA5sIzv4oX3D2gszuVk?=
 =?us-ascii?Q?Qr4+ZeMY5i6reYHgC+L7cF4i2vGeBNB6sfzFfE81BHKQ4SCGdGM7hfxm4aih?=
 =?us-ascii?Q?52CygNy3rlZkTxSKtrNE0FRHItjBX8FN44DH4aaB5vuR8eXvLxAFdxGc6oEk?=
 =?us-ascii?Q?afXubHc3o4x57eVi629mZG/0qW0/07qEXI66M6NnryJldYBbmrDWqihJGL8a?=
 =?us-ascii?Q?UOHZ+uK+iihJd/JUYo3zkbYcPmfitOa4FkAy0acx4WNpf9ZtUDmCKsoC3knk?=
 =?us-ascii?Q?cepfP4Hew/qFstMNBvRNy/3J/Z2JFroZy4zBmBytVK8k6xNXgSI9zw6pFG6O?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bf5ece-91b2-4e74-e3f9-08db09b7e962
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:36:10.4325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXrN81ytZ92OatZK/5JeZqdQs5JhQFWGpf8euPJMtCXJRlw0loR5bqKOQ8bHuTSTx8nSTQ7UQzgszD1kSRJXEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8494
X-Proofpoint-GUID: Wrd6JJF1HKeqCPqElMYaVja1F5XG5Li7
X-Proofpoint-ORIG-GUID: Wrd6JJF1HKeqCPqElMYaVja1F5XG5Li7
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

hmp_migrate() stores modified QAPI 'migrate' arguments from qdict
into well defined MigrateChannel struct with help of
migrate_channel_from_qdict().
hmp_migrate() also accepts uri string as modified QAPI a 'migrate'
argument (for backward compatibility).

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration-hmp-cmds.c | 105 ++++++++++++++++++++++++++++++++-
 migration/migration.c          |  15 ++++-
 2 files changed, 116 insertions(+), 4 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index ef25bc8929..a9f65ded7a 100644
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
+        addr->u.socket.socket_type = saddr;
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


