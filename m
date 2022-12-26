Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9DC656022
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 06:35:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9g7k-0003vM-3g; Mon, 26 Dec 2022 00:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7h-0003ue-NN
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:05 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7d-00019m-J2
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:05 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BQ3YPXn017384; Sun, 25 Dec 2022 21:33:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=C3B85I4D5OuYEyvO291MlLaOn/jG/RgAB1040jHCuYE=;
 b=n8vI4jfXJF5XKATqfJ91G3AJqNhaWC41oRoht+BVgc6Oei2MzlDCg8mhz7PV4VyboFS4
 okiBeyBFCLF8jiabUjkv4CsaZOv232ZDqj88IlM4syUfZGgtQLkO//SxZERE1v8Aegwc
 lhTEiavKacjA0fIn6yGSLG7u/conuNESMWhHplLUQ/V+F5TtIFcGwRZ7+TqCGNHkNttK
 cyuzClKG6KtPoQDaV6qvqrR79GCh01akh0RyEQcPmjeRYVHTSRrtJoIPr0b2dkR0wVdw
 jyCMNUcFVzdpb008xQumKlFh2l7bTWYkB9ExySxj1mwMJevD6hjSf3UkAf+8nVpHEzoY Yg== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mnxn0bjpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Dec 2022 21:33:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/drBnGoQHfIYdNnuPCY4xHChCqAnbK9OfoP/sHc/CWfeAxVVu4GqmxCX3298xRQDu+8nVTc0rtjs9pxzkkDTdXU2h4M1JLiB0yPVW31GvphhdX6exi5j12QQ3zzN1gq5zRz93IF3RTMiV3dBFrAZGiXGYnEk11NYDbgiqZymjdYxEjs7OPJI6RoOkD93+V+ejEkBMTEYSa9UOV2wSkTCo65e11SVmo0M3xmDAH8jfJY9VBmYCBQ+B+8Wr68rs8TIdAJHOzK6LgYFRg8ZNqqkK0xc3alGLie7IDOr1wHAvUkWpGe3io6aQm5jfqa9iqiqLiwiv1Mhs4Tprn7rojMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3B85I4D5OuYEyvO291MlLaOn/jG/RgAB1040jHCuYE=;
 b=i9GrLsMAsFoj+OcWcpuzadLSch/EcX6/TycqVoi2+Tdtt+ZhitxDltZYuJEuzWoTKKfKoo0oCyQXVp+/SLjSRRCnY33fPBDAF624VyAOMNDyUsiF+VJjFuhCxKAqkslyQlI1xJhG7dAwuFo0a5shtdX9w9HONBjCohJxg7xFJOdmQnK0jgIuKQcVbV36pCrh2oTj6vOBmjMwqxscRA+pJFyQqHnQvsz5T6ugk3pAx/lY7ACY3wM3Ok6xfJmk+UHgZxAvh220sqGNAmev+C+5X0GxdLS5KLDDAa0mWXBkTZbwus/832LFd0MZ/fMiGWzi/ETYx62dyrB02XhnZe1Xcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3B85I4D5OuYEyvO291MlLaOn/jG/RgAB1040jHCuYE=;
 b=LQNSXVrL/CIgVGRbXhK3kybNlz42NeZSuPgFuMl15fHIYbZHbAAOzs0eISqm8PdPTSbeFGfX93fnLi/qiX2k6Hls9zcGopWIuh32qdqQQzzanr7tQyTc0dVKb1TcdtMwkm1c5Pb5j8oY8sXlOHf9iQoQHEmRJOqg79cDuLegyuVMbFoiXPtRyhBaDswgwdL40LySwI+UYBNFuvNBYXx7HyL95yPr/knWzD1O52Ll1paeagIj63of+Bp+u0h+teB/0yHS8XhgL0iX5e4pXG3c829RN3ZdIY8CYbyG2uyXka9PTD/mJdf49SWGqLMt2YdlMhTyBfkP680HrYIz/xDVEg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH0PR02MB7655.namprd02.prod.outlook.com (2603:10b6:510:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 05:33:57 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3%6]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 05:33:57 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Author Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: [PATCH 2/5] migration: HMP side changes for modified 'migrate' QAPI
 design
Date: Mon, 26 Dec 2022 05:33:26 +0000
Message-Id: <20221226053329.157905-3-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1694d9ac-77fb-453a-655c-08dae702c8f9
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +d/AE0u3XMTuQtXBn3pPxl2x+vIfpCFjg2HyRN75PUliU22MWyn7b+AGyqgTF8v8PsyaiHJu+hueao/KJlP0vzWNCzGEF8qHoUBRyB+B2cp8p1nu2ANMLnLEb4G7rlvx7TRYcW26/flMuKOTu1Xwo46O/r6OVABMpa3+EWCI3XgBm6tHLvXRWbSlaufA8jMwCwM9ZnfNU7VA96aWpY7BR960IIQtw6F+nUV0/yFVx9skpt2KBjZwni4UThsCXpygzi4rMa26v6mqRtywCqOb5xp8y6aCxATQCvnArUFjtoGLNKtt8GG5AijUDQoEfmINe71iIpFdDEfzu6BlHb2h8sIcmrBaJUpn2p3PmC+evqqP54CuRwUUBIMUWZXPh2t2igjFT1hmqOrLrFffHVnE8GZeu7/Fl2NNIK6u8gQFD5qC2BXhW115uAdjTmFTgtK1S/YE8VaJqbhOXaDxTWbgiDykp0rNPIsiCVzkX+R8eT8erelIb1K5UdWMdWs37zmnN6d7QHCK3WAUrpYr7MZswTPhunHtVT5cD8zVH8jHqhg4V0q7XQPF5qwNVdXpciTLLlIsBaIBCd2eWn5ADp4QrQ2rwmSfOlb4RTkn9kj3QEXGycCvBxYsNkeaAvpFQQdcD7vgQfAEZcszXlT+BC/uioabM3BTT8b06mWaJ6d83JvEUNAsmBOMTzkkxue6M0hPHk6TMbisTK9QQKYpA7qr6pLxCtk/Md5TmTtGqEAnfD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(396003)(346002)(376002)(366004)(136003)(451199015)(36756003)(86362001)(26005)(6486002)(478600001)(52116002)(6512007)(186003)(107886003)(6666004)(6506007)(8676002)(66556008)(66476007)(5660300002)(66946007)(41300700001)(8936002)(2906002)(6916009)(316002)(44832011)(54906003)(4326008)(38100700002)(38350700002)(1076003)(2616005)(83380400001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w8FEzj3eMuQCmEY8xjyaoujsqi6DocPZUE4S+8wpjfwTWN7YGLhGvGKPOegZ?=
 =?us-ascii?Q?VEYHRjxcMzrKyKoEtbyys5juiBR7BMnAHDTWfzEmDvY8uiybW6KSHUlAbDgv?=
 =?us-ascii?Q?xH5/tlbl1KGWJup/w1q5uIdnMGp+IasX3X8jqUiEhvXh9Tdaux8u/Bnl/StC?=
 =?us-ascii?Q?RePCA0cuUFLQpPd4sYNM8JYgZhLQwLmnXiIKQRoS8pLztcwUQMG9SvUfmaPn?=
 =?us-ascii?Q?wo+41EbqoVRoBgt6y/XGFLPpffz4iBGMawbN8ddVpogIUL8Xiyzx9SzRo5h9?=
 =?us-ascii?Q?W2R7emJxySh/0wk0gMmiO0MK9Ha655NTb4vl6+Po5aG9/wuvERXqRNmil0j/?=
 =?us-ascii?Q?IhDGImD3S0kJstG59UlZ71B4xsJI1MLb91MLlLgwit5bzAk92Y/5CFqPWWiD?=
 =?us-ascii?Q?iJfDET1/z2NMrhLAuZgKaK/66cYG0EGldoTX1bMW9t8ml83TMlXUiQPQPu2q?=
 =?us-ascii?Q?jEM/ul2MmSHuQd9SnYkmrHJUeFPoilIwKochBSzJEKfThwrX+iR21VPKFRnK?=
 =?us-ascii?Q?gmX6zu0yfjLQ6jT9b+LnsGPX/5QRbK+lHJO/LQV3790m7SNUoITQt2ZQVCn6?=
 =?us-ascii?Q?t2WUVpCpx257ckOt++7MK3KzRRY7BOZb0+CF83IDRdHg8+OfgSEg2qT63Dh8?=
 =?us-ascii?Q?+ACNRXVixwjjSoTn90ap0p8ofcUi9tY6sfHWPNPhQbLrI5XrLhKBSMLUDvVA?=
 =?us-ascii?Q?zowQgWYY+zykcTs5BJEUrQPBayQUpmyNY+UVddVdixo9F3hpD500DrP0mizs?=
 =?us-ascii?Q?+2HAAsbEaQFT5JLp97wN9JQJTxXpgIJx/JhLxn2tazTnAwp7darQVDjDsOe3?=
 =?us-ascii?Q?JUpiS/sqWBa1kRHPTN2BC8olpHXuvzwk0tKmyFkJvzzlBCwdS9NpMxXyYUXW?=
 =?us-ascii?Q?JoBni5CpvdDapng4u1V61G+84bxedDyhJ72d7iLVaZfC4UB1QtPavQRZibTB?=
 =?us-ascii?Q?2GdpJJcf3J7XBa+TTrbbVmbo12ZKyb8ojD6BWNUVOQEM71hVWp8BdDg8BORM?=
 =?us-ascii?Q?uDlMzQx2B6HJvKj1EZVAVVhPGTxayAE5fciOsX7KZMkkCLtp+Iz3C4CFUywX?=
 =?us-ascii?Q?jqt7yCbDq63usXn4dCoZvqqcc0ycm9iNLAjeEwYvMUoEllg2ilpN8dmuFSmx?=
 =?us-ascii?Q?F9OHhP70AWgCQKvMZ+WGkxltd4a8JTRjxWmI1LQI4pJCNHDEwl2grNzIk31O?=
 =?us-ascii?Q?jS7hOFYzOSyByZuxw6ZIZVTnUUQMfCeTF64KeD8n6i+rQgnKjnMarQvYuECl?=
 =?us-ascii?Q?myD5hS5kuAmbP9y2QFBSz99wtSmmZy6DDY0xQ9kQFGs9qm/kUCXPbFQP4MaR?=
 =?us-ascii?Q?6GNP445nK54T4rSaIw+5THYAftGyV1Yzsq6VDcoI1xBcXnyi9v4dCzOPMXYZ?=
 =?us-ascii?Q?z+HArlOVkEvU6Jg+cGS6kiLGHwlHr/c6vs2QdgQZArJsBDke8Gw+cCYw19Gj?=
 =?us-ascii?Q?smPNKZTGOpkdPs/8r/Qq7aqj2N2l2mLODLL98QhgCP8T0R0oIxeOKMeLHI4u?=
 =?us-ascii?Q?lag5oISkjZ0cnIbMgsvv84/jywf9A6COI/mGqaERBI0m7H4Nu3uFLyADmU36?=
 =?us-ascii?Q?2XRoI4Wb9gZAWlvBLE843zoHx04Ygi7E1Nu9DuYBsDG9I6u4CvHMUXdjN5c8?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1694d9ac-77fb-453a-655c-08dae702c8f9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 05:33:57.6897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hDjVbsh+wAW+eYgXoplk4JlFymuE2V+Ps0WOqEVDWnCuxEn3tCbQYJaZrKps0e7xJ5Qb0n4glSEGQSdfadduA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7655
X-Proofpoint-GUID: aloiq3mGpFrjfnS71iFwdoBTcD7IMimd
X-Proofpoint-ORIG-GUID: aloiq3mGpFrjfnS71iFwdoBTcD7IMimd
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

hmp_migrate() accepts uri (backward compatibility) and a
well-defined struct for migration parameters, and with help of
migrate_channel_from_qdict() maps QDict's 'key':'value' pair
required for migration stream into MigrateChannel struct.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c |  6 +--
 monitor/hmp-cmds.c    | 91 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..1b6e62612a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2391,9 +2391,9 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
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
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ed78a87ddd..e44d96f5dc 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -999,6 +999,91 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
     qapi_free_AnnounceParameters(params);
 }
 
+static void
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
+    const char *fd_str = qdict_get_try_str(qdict, "str");
+    const char *exec_str = qdict_get_try_str(qdict, "exec-str");
+    const char *rdma_str = qdict_get_try_str(qdict, "rdma-str");
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
+    switch (transport) {
+    case MIGRATE_TRANSPORT_SOCKET:
+        switch (type) {
+        case SOCKET_ADDRESS_TYPE_INET:
+            saddr->type = SOCKET_ADDRESS_TYPE_INET;
+            saddr->u.inet.host = (char *)inet_host;
+            saddr->u.inet.port = (char *)inet_port;
+            break;
+        case SOCKET_ADDRESS_TYPE_UNIX:
+            saddr->type = SOCKET_ADDRESS_TYPE_UNIX;
+            saddr->u.q_unix.path = (char *)unix_path;
+            break;
+        case SOCKET_ADDRESS_TYPE_VSOCK:
+            saddr->type = SOCKET_ADDRESS_TYPE_VSOCK;
+            saddr->u.vsock.cid = (char *)vsock_cid;
+            saddr->u.vsock.port = (char *)vsock_port;
+            break;
+        case SOCKET_ADDRESS_TYPE_FD:
+            saddr->type = SOCKET_ADDRESS_TYPE_FD;
+            saddr->u.fd.str = (char *)fd_str;
+            break;
+        default:
+            break;
+        }
+        addr->u.socket.socket_type = saddr;
+        break;
+    case MIGRATE_TRANSPORT_EXEC:
+        addr->u.exec.exec_str = (char *)exec_str;
+        break;
+    case MIGRATE_TRANSPORT_RDMA:
+        addr->u.rdma.rdma_str = (char *)rdma_str;
+        break;
+    default:
+        break;
+    }
+
+    val->channeltype = channel_type;
+    val->addr = addr;
+    *channel = val;
+end:
+    error_propagate(errp, err);
+}
+
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict)
 {
     qmp_migrate_cancel(NULL);
@@ -1441,8 +1526,12 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
     const char *uri = qdict_get_str(qdict, "uri");
     Error *err = NULL;
 
-    qmp_migrate(uri, !!blk, blk, !!inc, inc,
+    MigrateChannel *channel = g_new0(MigrateChannel, 1);
+    migrate_channel_from_qdict(&channel, qdict, &err);
+
+    qmp_migrate(uri, channel, !!blk, blk, !!inc, inc,
                 false, false, true, resume, &err);
+    qapi_free_MigrateChannel(channel);
     if (hmp_handle_error(mon, err)) {
         return;
     }
-- 
2.22.3


