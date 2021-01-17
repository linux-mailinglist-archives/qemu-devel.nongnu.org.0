Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A212F9514
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 21:18:41 +0100 (CET)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1EVU-0006Cc-DE
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 15:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1ETW-0005L0-E9
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:16:38 -0500
Received: from mail-bn8nam11on2111.outbound.protection.outlook.com
 ([40.107.236.111]:47904 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1ETU-0005QN-VA
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:16:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXmaZM5okYjPq8p1gy3GG3xvDJAV0Dvr+7MIMPznYCw+R7pF4J1OPTa1KL9pYgvfB/ajr+fKNBP3UZIyl82gXJv1LN3FUCwPMP6+fqHdur9ZugN9/k97Je7B2OIVp/ntTfF4hv8SbIOaPDL/BFCRvheKv4BWKzGJ7I94uyr2pdIxo0rnw6wEkYY2bUh7SQzGHL3548Ny8ryW72dhZKV12xpvQKpMKqGNYx2Rwoxi3baWWTylLqrF7WF0oy2xPTHpWQDEkcgUcZIqmnefnu6JfRePCtBA7mdIQM1hNMC4gyqMHZ1ff2kLAtuk++XTF5Tpa9lnnh7Bt8kVYJ7I+XW95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zn88Y4wyui8dZUUGDRajG/TQI+V+mAGvklNCKSjzyg0=;
 b=eqaHp+bZerZJHeTZIHYiFaa9QbsoWf6laUTLsYP0CtrQn83jVxQmpQsjoNVA+KEA+tfaZMw2dZuKYOxrkkg8rA/g5JsCbnSBJb/YcCU5mlZPSm9Joh5tWVDu8C9dycCjVh6avCAT8BvF26iNhfgJEk1KxTyLagOOC84sW53+lZ6djIyNbiG/cWga4ndpRseuSBZJlc+R5t4PhV5DA/ZsZV5D6/RKIOjfd27QL54FOlSusea7LdvbDaV3P3GDFWHff9DEV00CnTlWtlKq2Kw/D80kNO2qRDEzawQRv7Dy+G4U8UBCXrqbQoEAoc3wz5SajnXKNcYBu+DfM249PRw2pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zn88Y4wyui8dZUUGDRajG/TQI+V+mAGvklNCKSjzyg0=;
 b=o1oDSqawdsoOvkrCxrsDlYY8MQS728ogO6V7sEvvVv0TxQqXBcoLQnQy1K8mJLtt3p5xfvh8h8C/RDzGDXYOUR+sJ3r+DXxu8902sc8sFB12tuTkuqIMNgSPGnOFOCWNBx/6A8tdHQigLTtdPt/4bbCGuP9/6tDR37Fsq3lqH5Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5852.namprd03.prod.outlook.com (2603:10b6:806:115::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sun, 17 Jan
 2021 20:16:08 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 20:16:08 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] fuzz: enable dynamic args for generic-fuzz configs
Date: Sun, 17 Jan 2021 15:15:51 -0500
Message-Id: <20210117201553.279266-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210117201553.279266-1-alxndr@bu.edu>
References: <20210117201553.279266-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR19CA0011.namprd19.prod.outlook.com
 (2603:10b6:208:178::24) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR19CA0011.namprd19.prod.outlook.com (2603:10b6:208:178::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Sun, 17 Jan 2021 20:16:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dfe7b86-5049-4f14-8ca3-08d8bb24b99d
X-MS-TrafficTypeDiagnostic: SA2PR03MB5852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5852C06A68CADB50D1E188A4BAA50@SA2PR03MB5852.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Id10LyH8pCiQ76yLjNYrtLxv63/pDFU0UGEOjvNaOOTTTwtpYNFXBvsoA1cvrM28MojN0AWm28PVehYQkYGncRax6aH5nU/hGW+/+t60u2q8/uYgS2eed9HRk7UEYzl8vX+I1M9ah8zOOdPkdJeGcY4wLERed1qxErTUi7S5k6Zb09WXNycDUzTkxy8QkZ6p3XoXsfjZfBeGY+QERFSyNV7eWYpp+RJYHcSmdlw34tsc6DX4U9A9WMpvhmbsdbn+a7DdvjKS7lBhiAltmKxsqU8gHpKr3+dSrnKR8TyWQ8O/s4CwO8WAqCXAVnkPkDgeDVvcBMcVa0ylaE118JtU+m2A+M7b+Vg0BzCS2ug+/9NSXcrQ6BAHjz7XQExuhrULxqdCOwhPcrVBk7GlUJUDmdmTCMIaQwrjxvLbQ1Ils9xbCgFIebD2lYdMvFPr8zUU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(86362001)(54906003)(36756003)(478600001)(66476007)(6916009)(6512007)(66556008)(66946007)(2616005)(4326008)(8676002)(83380400001)(956004)(6666004)(186003)(316002)(16526019)(26005)(52116002)(786003)(6486002)(8936002)(6506007)(5660300002)(2906002)(75432002)(1076003)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?czhjqx7TvYTvhqVYFQDTVVN3sga12k8NPWQt5gM8DG/LNYOIunb8HPuFZsNY?=
 =?us-ascii?Q?nHDlEFKDR/hRBiPiOQxuv4aA5Pc89x3HFhDwlIhUhadwdP59Kp7+WhJBwgka?=
 =?us-ascii?Q?ltK8zWPpr2BDDlOpIkdjGXy+S01dIOGZ7EG2fCpLoJA1oXFZ5ku0LSIXdwyS?=
 =?us-ascii?Q?87OuboHNhc3zU4KsWpQLgjHvC7Fm7xaU2WzMN8avZk0CQ+35A4WBnOCjxg0u?=
 =?us-ascii?Q?8NMTkQRrDSW194fmuOCv6AMg0/Nz78PHZ4hwEZ1qztSATme4ONdQ+QK9JlQs?=
 =?us-ascii?Q?dcDo4QYFqKbNmdN1scyw82njR4uIvHyK8M+KefbLyLE5d6le4B5hsVA82efp?=
 =?us-ascii?Q?UMwaBlZo+nRcSgvmKjhxPkgpFDl8FLIRgp7QamQLB+/8PphPkPKziFa6ULcj?=
 =?us-ascii?Q?0vEXFEi50GcRel90qZ/r79HgJibW4QX0YAodiMVgWFXT3PFmFYmrdRbYzuqg?=
 =?us-ascii?Q?aOvstXET0GxMwY5dwHWtFStn9kxUfWqsIRCW9n5/xPax1Z+3Z2P7E8kFylMC?=
 =?us-ascii?Q?Z0fYyVDWAMxHfJJ2YmFxKcChpMed1ElqMFrYzSjsAxF4zOkx6/Y5Ty65ZL6R?=
 =?us-ascii?Q?/2ZMvKqq06ehTpDyTmJfv4/hTR7pU0VgnA02JtToGvYFC51xybJRDFNOd67X?=
 =?us-ascii?Q?mMXTJVCT4QxoKzvq12rdOPegQIICWG322YW5gXA9WYbYFzdToe7NwtCsyqPk?=
 =?us-ascii?Q?2mq9QfgnvZ/1POJH1mrQz8kTMUK4MIvKxhws5Z326zkbe3bI1iHyX3UAI0Mv?=
 =?us-ascii?Q?Z0spIvKr7LzEo8YF/DtY0memOX16LX1HGejWeXPcaTpEp3Ptauf6XUBKAjDF?=
 =?us-ascii?Q?xKnjcmHLbhTVMB3+TtaPyeAtPxLZWAKo9RYhG7TRXo++eYhSo0xSM5l69+zh?=
 =?us-ascii?Q?fVcmM1ZDljqmfFPgaHx6ffYr2DCMGDePopoJx63aH2iOo4SfRHa1q5QVD9KW?=
 =?us-ascii?Q?SZQx9SqUPF7rYFdM/Wl55beb9AsDHsZFx6cx3skTCgFzkqsmYOQfRUEoW1Ux?=
 =?us-ascii?Q?Kdta?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfe7b86-5049-4f14-8ca3-08d8bb24b99d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 20:16:08.2108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oeRJnSrk1rF0wBVRGhv4mozEI07XLhkJmBOO38f//5JzAMvsD/Z33oRjd6nenlQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5852
Received-SPF: pass client-ip=40.107.236.111; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
---
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index be76d47d2d..062e2b6f26 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -936,12 +936,20 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
 
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
+        free(args);
+    } else {
+        g_assert_nonnull(config->args);
+        setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    }
     setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
 }
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 7fed035345..1a133655ee 100644
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


