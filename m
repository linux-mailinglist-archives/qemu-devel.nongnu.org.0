Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EFE2F9515
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 21:19:59 +0100 (CET)
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1EWk-0007su-7g
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 15:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1ETY-0005Ne-8Z
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:16:40 -0500
Received: from mail-bn8nam11on2111.outbound.protection.outlook.com
 ([40.107.236.111]:47904 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1ETW-0005QN-KW
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:16:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjfDY/vjVFKOgO6ts1i7EV1k/Bd3KpgkF1QDDUsLspD90CF1qlX2Si4quNpz1/fSmvfv2hVQdxacKZmge06ZD7PTLawdu1qHthpexao6WKP/xLHQZ8K5EOBC8m2vdGBymFsmstXIXU17qx4ytEkB/CEZuJnHeTL6JnOE67hNrxYDnde4Ope2MG6r+NfJCKFqU8CVOClPJU28MQEGpsW5q94uSMwtvuJD7Hmv3QizCL+PyYvkhKZ+0GJ/HmCLLZYZUWhQFZdmEL+XzGLwtuqlnuqyx/BCcuCVy1T24k7BZ4fViPXqA0iKJGNzVh7Oh2YKG838boMuZBoOO+UmIjJhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBL6nZhg2U1wRA0zDv33tSY7/qquZ26HytmM51GWKZU=;
 b=dHuGrksZf5glIgHVKWut3ME+E1u2NFb2lmZBgBuUAh2wXjSP9VD+4MpOf5unz1//qdN5208vnkxm4QGacOo1rpGexmKcEbWiPJwYdSpnfa3ssekYpzy+nl5QRDvs/GELQ0kK1uAyP3VNLZSH3SnxsotJGmZ8mOsQmzmU6W4tPr/K3nnXqs2fvQqCqfN5ZFYsDVdWUXcD6yv+J6B3QhkAx7LRXau1Rfa+Y06zCfswfdFl7cS+Jmf4dDmb/5xCLmOwaxNZwZ1I+vxWc7GzjeBiQ2jmTpF5my8OeSAsDLdrcue42ZeYnzrQufk7tfSEpQktkCkPj8xDqO3leHPC8yqjuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBL6nZhg2U1wRA0zDv33tSY7/qquZ26HytmM51GWKZU=;
 b=PP14vipO4SDhLqKuK2qNG3fGFDZQefLO/pTm0cK7ahwvqPj7SD03eYhX72lmqDpAvVF0DM9TfNiMnP0NBNwR6okw90z+5nMhv/dHtgLDw113ILHwJG3pQ1qlFoaRp0uwuzT9eGzubs0rdFiYENLggOTQTqFGnwQWrUIR2uyvCHI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5852.namprd03.prod.outlook.com (2603:10b6:806:115::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sun, 17 Jan
 2021 20:16:13 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 20:16:13 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] docs/fuzz: add some information about OSS-Fuzz
Date: Sun, 17 Jan 2021 15:15:52 -0500
Message-Id: <20210117201553.279266-3-alxndr@bu.edu>
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
 Transport; Sun, 17 Jan 2021 20:16:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4317372-b1ce-4216-cd33-08d8bb24bc4f
X-MS-TrafficTypeDiagnostic: SA2PR03MB5852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5852294D6FA1321820AA979CBAA50@SA2PR03MB5852.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qq0D3RngLeqSOmmqxYXTnvhJGvXK/xYC7/FJF7r1WZqgBRNlKwQ85ozGlaTvKPIqQ61uzOSiczXooexkJQhM9TtriWzv5i6xW9hTBfhdOBLcSJx9CmNK/86h1nUUAE2LQF7iSY1I1GL+MC8t3pKvZu2daHtb9knzLzzhBGCy7k2oRj4BZaBX8/cPrBpbDquXgOLvM0/XkFS9Pa3yWJ2CBxbStXxp6U9OqF4C82yaKChm/S8UVW/4ovDUzzfxAf5PYzBhdUe5Q3aRrcTmPc+nL02rELaHzd2u+bQVuIWjho0Y+Yrxws/n+t5M5sdHngyoQ+y0+6uEmdxo96Ju+4WTaQ5GxEkQPFP4aYtl4g6xiuKaNycqfrg7RwO4HfhfK9Fp2me54LqT93zbiDf4XVHTrpXsPXAdntcjOtM9/jvKARyo3zNITck/avn9AZw58NEY8TwEz+tAhGVOlW7D1IYWuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(86362001)(54906003)(36756003)(478600001)(66476007)(6916009)(6512007)(66556008)(66946007)(2616005)(4326008)(8676002)(956004)(6666004)(186003)(316002)(16526019)(26005)(52116002)(786003)(6486002)(8936002)(6506007)(5660300002)(2906002)(75432002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dPJHdtPhS3mGNG2xIdZWm5f7r3SvrSXOiZrXWNMEYf+jBHHxIt2v2AFg9/Ty?=
 =?us-ascii?Q?ti0cVQmh1TmLeBxYee7NZjIJ/8521lmZBV9ILgkzSVYTwFoRk5LAepewMU9N?=
 =?us-ascii?Q?Bgvb6OhgWK2C4EMvRiSqVPYXIB5IM6BBQilzIRENVQAE/txTlJSDI4SVVQY8?=
 =?us-ascii?Q?LW9lrsVV0IZFKp/W7treBcodFzaTLd2se+lw56BisGxPNgmkLR2XaXPjVeKI?=
 =?us-ascii?Q?pd40CeDZ3bAHX2RsxoSf63wJasX5u5vyv5/hFWs25RS1A1gGTY90YNPpDzs1?=
 =?us-ascii?Q?aTgkEZtBONtxZU68oGUUbo03sSQ1crtIdvAhx103GMrWy2TMLqUWZQQNpSEy?=
 =?us-ascii?Q?SdHX5M4m9xKPXVXRWXKGMORhDeMFrCpL1Js1x+uyhCS+Nh5GK9nWMU2Z4jhy?=
 =?us-ascii?Q?qslFtvoSBHHtOr+dnQA84Gnv4FSB8pyVZmYXNvs9TZKAACZwV4SxIaLEO9/V?=
 =?us-ascii?Q?Wu/znPUh6zAhgFaW5Em+knsw04s8CnHz8mPgKDQdaETaiqntMhieyNzqB8sN?=
 =?us-ascii?Q?VBQgg6SwDJTtFSj5kCdXgFRQ2p/5OYxnenGkSmF5iV2R0PztqYMIuGlYjnOJ?=
 =?us-ascii?Q?jRkvbNs+V/QaZCtYsGbxq+jFmGTL0nmrMv5UIgEE4BPzT8hWg61k4aJpkihY?=
 =?us-ascii?Q?tUgNIopyCEYxRqoje6+K++uwwJ+Fun11FhCISI5Qa8V11qB8dyVWXt7/06B5?=
 =?us-ascii?Q?BFT3a0K9v6SE1QsBOCf65lsY7lpxXQE2FojvANh523NlbNZtAn2CVdKgAR2K?=
 =?us-ascii?Q?XASgrOzx4B+qfX02LWRMKptDC+J3LOlXLuBp+TcDPWOttE3aaF4B7LlIs2Ty?=
 =?us-ascii?Q?JiH6FIHHHn+I4c6b+papHZin0doKRfeGZakBUnescUYdMkDclR20AG7shgpa?=
 =?us-ascii?Q?dHyj/Pzxn/EZ8zJ4OmPCKARscWhjCpL+4nbJhQJd2E5xab10SkwYaZFBF7cK?=
 =?us-ascii?Q?YuXrUjehEFpGlMPlNFSGomnjs26Js7wSC2P0CRSEiqZPq11t4QdO0oVvodbN?=
 =?us-ascii?Q?pR28?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: b4317372-b1ce-4216-cd33-08d8bb24bc4f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 20:16:13.5699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgsuIbLeitgL+R2olqsmbla6c2teHgZE9cUe7oc8EL//hgR9CJbBIlZCvJof7GBf
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 docs/devel/fuzzing.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 6096242d99..8792358854 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -181,6 +181,32 @@ To ensure that these env variables have been configured correctly, we can use::
 
 The output should contain a complete list of matched MemoryRegions.
 
+OSS-Fuzz
+--------
+QEMU is continuously fuzzed on `OSS-Fuzz` __(https://github.com/google/oss-fuzz).
+By default, the OSS-Fuzz build will try to fuzz every fuzz-target. Since the
+generic-fuzz target requires additional information provided in environment
+variables, we pre-define some generic-fuzz configs in
+``tests/qtest/fuzz/generic_fuzz_configs.h``. Each config must specify:
+ * ``.name``: To identify the fuzzer config
+ * ``.args`` OR ``.argfunc``: A string or pointer to a function returning a
+   string.  These strings are used to specify the ``QEMU_FUZZ_ARGS``
+   environment variable.  ``argfunc`` is useful when the config relies on e.g.
+   a dynamically created temp directory, or a free tcp/udp port.
+ * ``.objects``: A string that specifies the ``QEMU_FUZZ_OBJECTS`` environment
+   variable.
+
+To fuzz additional devices/device configuration on OSS-Fuzz:
+ * Send patches for a new device-specific fuzzer
+ * Send patches for a new generic-fuzz config
+
+Build details:
+ * `The basic Dockerfile that sets up the environment for building QEMU's
+   fuzzers on OSS-Fuzz
+   <https://github.com/google/oss-fuzz/blob/master/projects/qemu/Dockerfile>`_
+ * The script responsible for building the fuzzers:
+   ``scripts/oss-fuzz/build.sh``
+
 Implementation Details / Fuzzer Lifecycle
 -----------------------------------------
 
-- 
2.28.0


