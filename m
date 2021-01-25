Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1A302AD7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:55:06 +0100 (CET)
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l470z-0001X1-Ao
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uc-0004L8-9u
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:30 -0500
Received: from mail-bn8nam12on2112.outbound.protection.outlook.com
 ([40.107.237.112]:16865 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46ua-0004xv-Pg
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gohxIPReb5/J9Q38eEkOfLfAkBxJu0OaIQAMrS1UwsvIuoCLOIwEP/gXKsiA9WdNGH2hMEwuDRRluFecLNwlf0kE49eVI8saL1Mz0o7aFP0IseO7DMlU/rq1vxN4pCnnvBUVwQIVXYPgJifba7yWLWQrbyB/Ej4mbtP0ne1mBys0SzlS//NXiV2CJCQxbOTD/bVgLchkttR5V9C9yQGHHhLwGBVhqydrzY4NbXjUVp0lOGUaT4u7Z0m7e2etP9QyBbd82PyLqLl49R186VV32gGrdrgY1Nh9Mly6Tb61FbHQGBSKk2j5v6YkqqWsjxdfr1sAYYbz0moql1rZIrHTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxdKhxYza15yI11/yMak4n7yM/SmffxiKxjrYAnusUM=;
 b=ISAOEtWs1v6wmDyucZs/9cvGYR+qPz3d4DnC7LZGecZWOUon+WaGtrELgTyKPbzkEOsIsFmFecw1sBG5Q4T3CMB5vOI0g4T7Vt8oi9+x8kiVPDCmzXDsMEqyfQtR/AlBoPirbdTGriREQSaf430YQiZYyV6hzOqy1dLUnyYnv8SJwZ89ic0gZ/QYk5gCQsStD7jK16Q9g0Qi/x+qg2ugV4AAGbvuofwjpGok7zwlrNar7HZHkzRBYlV563PxPY6YbcqYQUhviGdT0+2psvFgat3Spfe5IVCz997eNpLkF6A+KQNc9jQGQ65R/AYH89hJlr4VMrnpvR6GBXaYTpj41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxdKhxYza15yI11/yMak4n7yM/SmffxiKxjrYAnusUM=;
 b=NYCaguJ3dHqiD2Hjr31VgrEGrSDtLW6YYZ0qI6Tx/WCGOC/Wbovj9DZ/UU627T+XBp2UDmX4H3rTa3tox62xbnV3XFKZ8Z+R/MHosyA0iq+6DS+rM/FK/ilAsFyVnka2Bw+ADRDxT54b1ox2Cp8VAC0EBHvkkQsovj5PVnb7YU4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5563.namprd03.prod.outlook.com (2603:10b6:806:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 18:48:13 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.015; Mon, 25 Jan 2021
 18:48:13 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [RESEND PULL 5/7] fuzz: enable dynamic args for generic-fuzz configs
Date: Mon, 25 Jan 2021 13:47:54 -0500
Message-Id: <20210125184756.319453-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125184756.319453-1-alxndr@bu.edu>
References: <20210125184756.319453-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:23a::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:23a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 18:48:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0225a193-ea21-4d8f-6e56-08d8c161c4ef
X-MS-TrafficTypeDiagnostic: SA0PR03MB5563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5563F3259F59622AC8DC137ABABD9@SA0PR03MB5563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXgZW+jwzsIgcjyg/6Y11kudbhOPUJ+xjn5cxMpXebzmv/QdqZLO4xbte8zGztYFxBu6fnY5tqlvFrrarzfEiMIOtxPlxz5h47G4zr/G6IIHKXxUzodbQIcBbTDMxadw7u7cl2J/8+Lc3JYHNHoIIgFO2b5eY6ppef9tn3XmNkaz2Zm/kiyEfAkjBm0ZERFQG++ymFmT2b0qO9Ve69s+pGOzpddJVf4amm/wAYxo4rfxwPJ3GtO98tdJyVsJ5sdtmH+658JNDuDIszFiTKdI9AV6kLhyDnsuRE8KM3wTgHKBRfgITcys4gEl4nxqt7g5OsIk+zyg7tO38zeVnDth+mKHE6l2IpbbKOYtVZGTbCKbG2riKSBO2XzilIhgMGpiUHpcJWSG9aTGOAVY2JIv/VG4CjaJ3Ke8TzaNcMV8+tDY+lF5a8uuab1kOW6WEIuG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(1076003)(75432002)(478600001)(6666004)(956004)(786003)(86362001)(52116002)(2616005)(54906003)(2906002)(316002)(83380400001)(8936002)(36756003)(66946007)(6512007)(6486002)(16526019)(186003)(66556008)(8676002)(26005)(4326008)(66476007)(5660300002)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ev6RSdemawgWxwAoQAC8CT8+T7hihXvISdeeFhQzSO8I/B73x51n9a1UQhTB?=
 =?us-ascii?Q?dcigaxUA/yja82My31cRt0Kvs3uTW4N4n++6TrgeFBia9iPR+/xt1jiOK020?=
 =?us-ascii?Q?2qsK2rRoi8glIOe4cCsRoOLruEseKagWtR35e4ce40PC9DrvILf740KST8mB?=
 =?us-ascii?Q?5SLf19W3ygazHv0ltKx5ZQQg2w9/pezAWeU8Jm3N4HrfmQ4pNN54D5SdWoma?=
 =?us-ascii?Q?KM+XIqYkiGGyvlVV5B3xEN1kQaIVLRZ29aWqCPlqQ4PsufZnxKQwAOaF9hgj?=
 =?us-ascii?Q?0b+nk2yPKmWNb8uvVuB9ta1uRwq3pk5yw1z2apZTbhtaGDVZvnHVYRDXiHeO?=
 =?us-ascii?Q?4HpXEIhYsdPs98Ws55eZ9yqVf0+zXk/FYnfVaW02+AOxMspWMp0d3drgejCc?=
 =?us-ascii?Q?h2+tiNRDvL/NIPvUBKmqbwdVDoDbAAvyzZHsr8m4xjoTcQ5RfLOP+NECu0Mr?=
 =?us-ascii?Q?7nqy1mEyWIyWWfTLvmKpfv4pzOKLS05TgyoJln6UxWHQXRNpYedZm9CFVIXm?=
 =?us-ascii?Q?5WvRnGimcOu9IBtL+p+epKFYDeB2ilICfX+OXFU946k/USyfszr6DD484yLD?=
 =?us-ascii?Q?yEtQXTzzw+jcb3a35JW9f28R9G9R7XGfvmln5S3kzPlw+V3DrhP7bYAHdX8+?=
 =?us-ascii?Q?rgHHFyMonp3MAMX415BmCyVPCp89KeUzjWC8mpGTXiQHKgOcP3jKQx8Xr8K+?=
 =?us-ascii?Q?iPK/bvarBAK53GlyemAH2RlHf1VbUjbBOPk8TG90/XcpIibwo80xaLz/cfYC?=
 =?us-ascii?Q?N6+LAYHBuwIqmpWerz0QIUeil6eGwQs09s+dD8krjopZSjIT78O6pOTmRofj?=
 =?us-ascii?Q?lIb7LZdeh8HZWd5BjewTTeAjkkRBkP/2UdF8FPf0zuVRBlc8uBQsYz0+8jPG?=
 =?us-ascii?Q?J6zMXiFvbrg+MdNd+MXDvMG2+KZ7fzWAklSCxNy2qymXgkGYkseucdeRzl4t?=
 =?us-ascii?Q?x+frpk2AIyyLmYjxt7KzTBlLaUy1BZRhTYngSFF25+EqS/uvd7BKOS1ZqM2A?=
 =?us-ascii?Q?PqmyD6XDiXLsBO0PvVh6uanqz8T24tjMylMQBBF8IJwYBoGj6zwAdJOt3n+1?=
 =?us-ascii?Q?4R5CfcZY?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0225a193-ea21-4d8f-6e56-08d8c161c4ef
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:48:13.5158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rdeogn5HMD3InTc8DsXVSzQC+e4awbkgD3EkhuiohWbP+6DHxyzdoxgnmThck/Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5563
Received-SPF: pass client-ip=40.107.237.112; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 philmd@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some device configurations, it is useful to configure some
resources, and adjust QEMU arguments at runtime, prior to fuzzing. This
patch adds an "argfunc" to generic the generic_fuzz_config. When
specified, it is responsible for configuring the resources and returning
a string containing the corresponding QEMU arguments. This can be useful
for targets that rely on e.g.:
 * a temporary qcow2 image
 * a temporary directory
 * an unused TCP port used to bind the VNC server

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210117230924.449676-2-alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index deb74f15be..ee8c17a04c 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -933,12 +933,20 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
 
 static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
 {
+    gchar *args;
     const generic_fuzz_config *config;
     g_assert(t->opaque);
 
     config = t->opaque;
     setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
-    setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    if (config->argfunc) {
+        args = config->argfunc();
+        setenv("QEMU_FUZZ_ARGS", args, 1);
+        g_free(args);
+    } else {
+        g_assert_nonnull(config->args);
+        setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    }
     setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
 }
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index aa4c03f1ae..51e69c6e42 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -16,6 +16,7 @@
 
 typedef struct generic_fuzz_config {
     const char *name, *args, *objects;
+    gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
 const generic_fuzz_config predefined_configs[] = {
-- 
2.28.0


