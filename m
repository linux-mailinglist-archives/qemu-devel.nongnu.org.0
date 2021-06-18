Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE73ACF6F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:51:36 +0200 (CEST)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGmN-0003no-4k
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGkC-00014Y-51
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:20 -0400
Received: from mail-bn8nam11on2115.outbound.protection.outlook.com
 ([40.107.236.115]:23557 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGkA-0004iY-HW
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCfrXPa76pFMdJZNhox/2tI0D8QTOWmDSLIVoc/wIG3qjom4E1cMNw+3oeHxVM13jW1VDKgddGDbR9tMIDmOuqhghjS4yLCiGHGQRpFBLLliRhsw/3duObLfWEjADjWU7bq8pwVto+6rEORfmDXAC0FBs0+vU7CW4SmQmFEw/crZt5pWj0HZo6/xcpOpToB4DwnL/1GNSxudMTNWut6zMzV5JiGYwdgRAvo3bAhIsmVlX/HDqDCn9vSSfuO7x7ANeORFQoVsQ3FcLqkpIk9VOJmeX314FrOSKaoLMxtBkstBHmRfEYPCQu3ZUGt/jZIzkF277ac8+q3CFmgzjDRbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGlHnuZ6LI49lHpNRUcwWerBYsPdXwydq5X3n3y9/L8=;
 b=kusBRUDmu/B1PLk86M4haChpF7hYPAWloSUDz4oEld/fDQwbRCzI2cGpft+nT0UGMJ8NvjObuZ8BU+cB8JVxKtGn5yn7hBPgOTMs19DLaj2gIaR7b+eDIm+I4jTvxyLWYOco0hBQedAa1azQRvJc5Y8n+QAoDloR1mGJdYn2ElSq4tZ9ljed3YfrkhXI5jbpYidQAqBrvVMt/hLgyFgabch0PdJAGnBgtgDSfsOE68UnA5I5EhgzukIRoGzxFU99u8vqx+EQYwrjrkXxac3VMkfQV/W5TxPQgywRA/NxtKS+0dLIuUOZsq+bKf6Q3HEx4WZXtxPoQsG7cPpzPcqDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGlHnuZ6LI49lHpNRUcwWerBYsPdXwydq5X3n3y9/L8=;
 b=71SVYqe/GX4mpbghJ8+RNKVnxifyyB602cX5XAreGSXiqfxBrLnLjaYUj8SPnOabG2+9PDLvKa8kKbTWby6nItx92jincVs6oEiB51ikl6xUAPCwV2EzLiskgYOOiTL++u/GlLMgmBYm3a/ly22F7donpUEJPcNXbHRo8RggFic=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 15:49:05 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:49:05 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] fuzz: add an instrumentation filter
Date: Fri, 18 Jun 2021 11:48:50 -0400
Message-Id: <20210618154852.5673-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210618154852.5673-1-alxndr@bu.edu>
References: <20210618154852.5673-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:208:e8::19) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR20CA0006.namprd20.prod.outlook.com (2603:10b6:208:e8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Fri, 18 Jun 2021 15:49:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8711686-7494-4b65-1364-08d932709a3f
X-MS-TrafficTypeDiagnostic: SA2PR03MB5769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5769800D7CB2EBA3A2A1A7D9BA0D9@SA2PR03MB5769.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2hVGwy5zSi19aA4UFR2+S8mukcNrgLjjXDqczX/Lz0FknSglIcfOk36Sq9lNXA40ts4nb1ZYYUevSfjw7C9METWp1JzSmOY8zLwTK32RCcYFVV9XdR+OtAo7qMHYRkJot7fJVuF1ffg2cyZZ3uYD+UOwqq8qHWDdNzSKZ2V1qGgL2wMAcr1v8Tr19E2MIHn9f1r6CkWNa9r4bsyH0mnRdk0GnM/DWw35KfWglwvfHZViS4n34Y0qr05UbBe9g9unF42oIR2KxEqkbKtZOUdPo/RsCslKwi27N00KZLonkmMZsgHoaPy8fmbIQucxAGugC1m+VI6RizNGpCfTm5pMSC9ooPMUlAcwWiP5F3RZ0YIzjyfsxoA3rWkO/AyMbISO+o9MGihHmaFneosoRJcYzSpx6K7RQMtCWVRwtfYL+fewMlqjXCgCLcW7TZHBBbQLcBMRW84sKho7lsOQqDolPLwN+plCExMINQ8C/JyUKXk5jdB6oG6s7/CsYzLZsgsu4FXf+zveL9xC3yLE0gl/GpOwa8lOUiYgTcEZmyr9mDnatiEWc19XkynWgo81sQoooRt2Bzo+r60+XlNfiBmVwY4S84+1GsNUH0ENq4wnR53tYHWJo2zYi6UzRzQ9yCwlBbSjgq/3y5/fTyZUV6t66w5vG0yvOdzwc5xTJPOGOC1+qiHcjzy2BGu+I5RfRoH4xgO8i8et1fYBrjzllvmmryH4N+aWDZza8C4vSx2947zkcfJoG12ykQjgbO+iFfjYioZcVkHnV/4shz38yS4OcwGpWQPEFbZh1DDRYPbCCQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(478600001)(66946007)(54906003)(66476007)(966005)(8676002)(2906002)(786003)(5660300002)(26005)(6666004)(1076003)(8936002)(6512007)(316002)(4326008)(75432002)(186003)(956004)(38350700002)(38100700002)(16526019)(2616005)(66556008)(36756003)(6486002)(86362001)(6506007)(52116002)(6916009)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pftgaAxMxK30F95ugF3PO12iJpqjsgYWldeJbTOKDdplBNA1wk0usssHfFbl?=
 =?us-ascii?Q?3ePmNqR1NfnFDPJmmlMeXfNTMLHzuwccosCtzx9pIrHg6MyU9tx2i4aY1d8p?=
 =?us-ascii?Q?hMFHTqvxPh3W7oG7GsUttLRLpMiMylH0nxwbuty8G9XeiYRfij/ByMuU6njk?=
 =?us-ascii?Q?CqG/axwY6KZbLvLoFTSElgastuhoUHnHQ8r6PxLmmgHMSszO60oEl3fS2zal?=
 =?us-ascii?Q?L8M5uyl6HwK4irCP2S77/JsdaXkOqoyHAA/0Zy8NNsYTXROi/y1xSLyEtgN8?=
 =?us-ascii?Q?kwzRUB9lkgbp3nu78YcwfRk2yhg3LOYc3hmSWtXuB4xXdI7DunrOt9i//iGQ?=
 =?us-ascii?Q?FM31yvWImd1y4Hx7HHDcACwSA1Bylu0aTolAFnE0hPUlx1ZWb4VGWjSQsGlW?=
 =?us-ascii?Q?ovfPb5IhfezFoGy97GkbMpTHkQVSMpxRXdR0WXIxQNNJI1BEA6WoRNA893NX?=
 =?us-ascii?Q?29FCN5SUdb8ZjwpfSO7eMMTdsIVJK5ITA8IIQfn8zbwDHADqe7Pjf7Zj5BA4?=
 =?us-ascii?Q?CIa2w5zgDhDQ1g2Q4mZ6RwJZd6GPpDaQrtnNSazyiWY79Ia8Pi9Flls7dLbk?=
 =?us-ascii?Q?sqSV3oQOkqZN31+tqaZ5UJEmlinlJnzT84dNz84QEChfPksVR3fWSbxt42tH?=
 =?us-ascii?Q?vLG5Wx4m/6sQwkZPWBiC7/9Q/HfGYO3nrcAD3qKI8uWy4ZnLhw+h7fVvkRbk?=
 =?us-ascii?Q?bs+XTHRR++8A2P0GtCc/69puH0PsKhz1DYSownDiR6m+VMAMJQzaY2ELD5MU?=
 =?us-ascii?Q?xD8rOxkFe2A8ctlBAhkBlkE2DABLQ2+bbcl7KyRiZNU20kzXDpGyeBUcXlUu?=
 =?us-ascii?Q?r7PU5KRZRmd4bl3lPVSKDEpcRDpD1iRra2D/ikcU400gE4hizu41SndM9bFN?=
 =?us-ascii?Q?3WKFOYDvPQjoikMfwcC8fYYZkfzmBXsFdtez/criB25MnJeC3SiG3QLgGPxr?=
 =?us-ascii?Q?ZrwBcA9+RmyJ0BOtx3cp0ISxscYyrwx+fzjwq/JjyZeZDe4u08Dlvlvlc7BN?=
 =?us-ascii?Q?fE61R5O6HnGqlP/eCQrbFagAhxBr7XGEDhs5kMeM3IWcwvsw5XGoX8p/XywL?=
 =?us-ascii?Q?K+yHYUI3l6niHSFKi0ZgOra8pcazHqs80e/ZDck7UlcdhDsLdtjaQJz3vi5H?=
 =?us-ascii?Q?mfuleg9u9YmYwCxJVdsfgjD45zoaajMZNNS15cxqY8Oy+pW2PZdfykaFWy5T?=
 =?us-ascii?Q?bgSU0sqTuwB35xdPEEjc7KClah2fNAEBt5jnyHGDB7BQffhoWXW3WRMlN5d4?=
 =?us-ascii?Q?sdkDMmdQh1GXJwoTNKs3E6mBi3XD6sbK4zIemcS9XJ3nz5yxG/fW88nfhpxX?=
 =?us-ascii?Q?U7YxCc2k/CaDZ6gIe8bDrfbN?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a8711686-7494-4b65-1364-08d932709a3f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:49:05.6536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3VINIBSznw2Oky5/wcNsWaj9gDDfhr9MtPzqrpljK2sVx9kf7+oKH0Rf4GypGFk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769
Received-SPF: pass client-ip=40.107.236.115; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, f4bug@amsat.org,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default, -fsanitize=fuzzer instruments all code with coverage
information. However, this means that libfuzzer will track coverage over
hundreds of source files that are unrelated to virtual-devices. This
means that libfuzzer will optimize inputs for coverage observed in timer
code, memory APIs etc. This slows down the fuzzer and stores many inputs
that are not relevant to the actual virtual-devices.

With this change, clang will only instrument a subset of the compiled
code, that is directly related to virtual-devices.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 configure                               |  4 ++++
 scripts/oss-fuzz/instrumentation-filter | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter

diff --git a/configure b/configure
index debd50c085..40412bcfcf 100755
--- a/configure
+++ b/configure
@@ -6089,6 +6089,10 @@ if test "$fuzzing" = "yes" ; then
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
   if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
+    # Specify a filter to only instrument code that is directly related to
+    # virtual-devices.
+	QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=$source_path/scripts/oss-fuzz/instrumentation-filter"
+
     # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
     # compiled code.
     QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
diff --git a/scripts/oss-fuzz/instrumentation-filter b/scripts/oss-fuzz/instrumentation-filter
new file mode 100644
index 0000000000..44e853159c
--- /dev/null
+++ b/scripts/oss-fuzz/instrumentation-filter
@@ -0,0 +1,14 @@
+# Code that we actually want the fuzzer to target
+# See: https://clang.llvm.org/docs/SanitizerCoverage.html#disabling-instrumentation-without-source-modification
+#
+src:*/hw/*
+src:*/include/hw/*
+src:*/slirp/*
+
+# We don't care about coverage over fuzzer-specific code, however we should
+# instrument the fuzzer entry-point so libFuzzer always sees at least some
+# coverage - otherwise it will exit after the first input
+src:*/tests/qtest/fuzz/fuzz.c
+
+# Enable instrumentation for all functions in those files
+fun:*
-- 
2.28.0


