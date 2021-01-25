Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7735302AB9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:51:37 +0100 (CET)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46xc-0006Eu-QF
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46ue-0004Op-AR
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:32 -0500
Received: from mail-bn8nam12on2112.outbound.protection.outlook.com
 ([40.107.237.112]:16865 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uc-0004xv-Hw
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfYLSMbiH6n9zWS4eBtnM5X7L+PjNd8TGqPcurV8f2M7YzZpyKi2+q1qcnWO/e2Eqb7w7vRCkW8/qFCSvdeuN0uwq8t98kmfzaiRU4KBn4XExhALJfp+DC66o0GLgsdZGonqF0t2BpNeIkU3l6VRYMYjbN5zYO6jAbivdKiuN6YeJX4D8EkgzAsQElpqhfYsVW4I5XEudUD17rH3appBCe3jK9/xfjQloVPZSXXdp0xIElJkph4PuLSc2M9xY54i6fx/yPWtgmOLKYmiSNp7mlvEjT82U9Byn9+PuAYwqgui1Q3UmsIO7xIvntYS/djUdKnJ6sN1lztDTBu10/hATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/KQK2YszdmrH9IGp1twtLfc1tvsY3GwSWUNIeQocHY=;
 b=VxCxnh+UdxFD5YQU40Erg4shtTtaWZvQkIGksYMhaZrbp3Mw2nXo4Dj4eYUAfwrwI4p0M7zCGvEF+Bkfqg0VcJbgQHCoMJ+ryMJm2STg0rosQXqdWounAjWVYHwS6I2VEdBrdnpoQp5YjPCdLFCQyE7C6gkOL580WCgQbWYbmmarECXKK1hHDae6oQa4AYhC9zzwwfgHDn+MCffheo6LPmpuqDLpUXBN4KrvTTjZVO/JjBDNfPDdIdkTKDIAPUo55BX73WqzcovJ2mccSfqqkiohw1uN/a8DYb0EQvdgkdMsvQJJNY9R09NAEzCPD7sdzzXJaMcR8bajF/p86QRPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/KQK2YszdmrH9IGp1twtLfc1tvsY3GwSWUNIeQocHY=;
 b=XOTF1uNsWI0ypUJdy9igXpe7tTs2VGyUbLnaPysRmdrcoRbLpvNgg5ICh2B2RlLph9Mr4oKDICNo6eyocJmcpX9akTLApbSMYB/XJ8eTYWjisbzDViQuVWM+bH+9wUn0+FGijKsov81VBSBwBIgX79QMUH5QKi4vfZ8BicFfVbc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5563.namprd03.prod.outlook.com (2603:10b6:806:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 18:48:14 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.015; Mon, 25 Jan 2021
 18:48:14 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [RESEND PULL 6/7] docs/fuzz: add some information about OSS-Fuzz
Date: Mon, 25 Jan 2021 13:47:55 -0500
Message-Id: <20210125184756.319453-7-alxndr@bu.edu>
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
 Transport; Mon, 25 Jan 2021 18:48:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 138fe51e-837d-4fdc-9462-08d8c161c57b
X-MS-TrafficTypeDiagnostic: SA0PR03MB5563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5563F1BF549F4927D72BB6BBBABD9@SA0PR03MB5563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDr+0tu4Blj9eFUdQPrQaigdVz1dOTOyobADPIEhSDykapLfB7QIyZYLAL3RrzBxr15BzeRjh5fEjYxqhgr16NLrxmrNdXwfnXrhCoyIVqsCsh88+6k92j8KpeWMd+dBYnykbcT4R6n5Qa7kbAA+AfnSj9jW5P9PdwQk98jyShX5/WO2wxDCzS0buWbxqKH3PsCQyZYtMTREes2n+T5q1Tz2/JVOwNXJY0XRCX7/6HjYNgI1INqmcKRc3D9C+uSdvZIn7XfQSLSN1UYDEyJAdEoa4MzyoNm2omzRfylCKZzLGdSS3LPJMyt2x27omJPm/nz32ipmzZ1SdRWLaNSRro3qWOJdEqCXVb53FB8i5RQqsss5NWsHk531DadUwz9YeM6hsdGQmOEGbNQs0XWxc74kgzxiOH2gFNYdjS1sGeWS5PAaF7iY5Q8YuQDgwmn7vCU8AWgbCTuy7yVUGM6IAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(1076003)(75432002)(478600001)(6666004)(956004)(786003)(86362001)(52116002)(2616005)(54906003)(2906002)(316002)(83380400001)(8936002)(36756003)(66946007)(6512007)(6486002)(16526019)(186003)(66556008)(8676002)(26005)(4326008)(66476007)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U8gVt8LjLLsfCqXl6LJAsNsVAUOe/W6e0p14Sgt31/o3LBZybkNOcO8KQSaZ?=
 =?us-ascii?Q?w5pINXlnScT1u/A7kLJ4j+eg6x5fI+wpjsjWNFw9HrW55WXd4OOBTyU/Z9Nb?=
 =?us-ascii?Q?gU1MmfkyV8WNVIMBNsa6+eX0WGwIu8Gxb5OA+TzO2ATfNmRvjaZqZJnc6Qda?=
 =?us-ascii?Q?zn7w86dhvqafjGfFrWZQZZGCBuQvL5Qv8rdjpmhOOncO2xpm5zTJGpnatbUn?=
 =?us-ascii?Q?Y9Kk2Byd2HBIvJJOtfrqcTFnEhGd9nqNX5quASU3CDaYGSX6HPfUKJ1mHk3Q?=
 =?us-ascii?Q?rcNweNuMv+V+7XZ2geiZeIttWhr7KPUOSFvFeUfjp9x42qUm0sPUq7zcllF5?=
 =?us-ascii?Q?LIPuAG0R4egpLfaTL6Rv5KSRK2Rj78i/9Fj4seCI1lZ8XpftTWK3mTPfxgDl?=
 =?us-ascii?Q?dkUdNLa8E4hAfqm53TUGHPd8MUQeO68abttr58+bCFDkRwGP9yCG076kTCuO?=
 =?us-ascii?Q?9qRfoF62bxyOp5CphKoKhIIgiDhFzPDK7IhZlNMRmJUaV+ZKLyeiOwMNnGBE?=
 =?us-ascii?Q?ycD46RfUYF/cy+kMWnrmxrgovPpaO/Ta9R6mzlmQUmFZObZZAds1bMMR5LyX?=
 =?us-ascii?Q?xP3IIUvqjmnmJxbr6tK6HwdWGMnNkZOVkTU+qtwmdUkpRcWhbMyQgDhYR03h?=
 =?us-ascii?Q?mmJ0NE01D4Xi2zBPYsuSLz59RrjC3SdsTm67Rx0Ffyy8BRbGrrXTs5+G22Bi?=
 =?us-ascii?Q?yRhi+OIlfv14xq7RAFP4tqYUQ7f4DJJ3txlW/mgQ7Uj1HgK6hZt+JQxzyCG3?=
 =?us-ascii?Q?gxx1zGdxP3fecA1L8HX96MMSO98Ix6Iu0UvMbNEp8SyY1ewf+Jl4SNBXaZTe?=
 =?us-ascii?Q?1o+Mhw699dpfnoBVB8SG0/umQnv2d3jYfvot9jPHKV/3/hTY9khQEYyBH9/x?=
 =?us-ascii?Q?6juH1lirlHtSDKXjZg02Ouc7KjhkrEFNFK5U5UkDD5LX3yp/to+yvJQSK5KP?=
 =?us-ascii?Q?5fDI4iRrw8zwgQqWVI+L5E/TnXz+RJjxkgmHbxuSyOv6HFP+43yS9+ixZymq?=
 =?us-ascii?Q?lpUjRbjE10rh+6H3rf3u0M9q9CNQ5C9g7Taw7GkEzrxrr0XIMTWyN2emzCzX?=
 =?us-ascii?Q?6nl53vH9?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 138fe51e-837d-4fdc-9462-08d8c161c57b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:48:14.6251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWRhwT/HbG2fobJMxmIjLQ7H2hsKn09fis4AL0qYtr47CC8/ThyhzMG9OUApWsGk
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
 philmd@redhat.com, Darren Kenny <darren.kenny@oracle.com>,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20210117230924.449676-3-alxndr@bu.edu>
---
 docs/devel/fuzzing.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 5f5200c843..b9bb07988b 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -180,6 +180,32 @@ To ensure that these env variables have been configured correctly, we can use::
 
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


