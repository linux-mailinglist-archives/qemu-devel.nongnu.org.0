Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385AE2FD7A1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:00:50 +0100 (CET)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hmj-0007xI-9P
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HYF-0001ZD-JL
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:51 -0500
Received: from mail-bn8nam12on2129.outbound.protection.outlook.com
 ([40.107.237.129]:51169 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HYB-0003o3-Md
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlV/gamNYi7WBaM/N6lvOEUSOumHDpSrklRKpdhUs3xrNjGjtbB3DDOGDZQvNMNvv1De04HAVFNymVc42CGeEHOMOVpcYa6AuiCpa/HD+k2DJev0b7KEuyxr+M7vn4luN5MQf5Wecs9hK9Kc7Bez6Lj97trAYIs4hqto7Dlp2WFFfBp/zoIjuxr7p65oYg0/Nxg3Rc63AyMs4anUfcvTy+MrJmrkW3xPir8SE4T0Gh7i9/70i/F6HSe9Ya16Ut9LNa2iu2jBElaq9B3hgmS2groa4QXSeC1VH5hKVWEUzRIqaC/O8qi84rIpYZHmG9Rb3VrA7l2gwsWu394vc2SQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqAwlkspqsgt5zHVblhrgNjK0N2JsJJYSNl6xVI8XjA=;
 b=iCCYAnLyRFMeKPnfuA3vR0uowQAzQAwrGBMnXB7/CxC/Ve1sVJqT72TEy0gEivSIfRTyQ41lpQMaLLXw13MSnEOwTbSre64GvWYTEw8PC8Ulu7P4UUy4+CepBEx2pUzWxw8eroVNNCzSu2jZDKUSmDkC2QMa02zC+NKkuLT/C85VS+Ex0JTsvF8oB5JKusJD5400+10nbggb/Mngs5GPaeUDzG43y7BK6yeVbYBFR55z4BYPbfB8m9FEkxHV6P81BVjPoxu1mLi1Ep6UxljR2Lq5vnTHnEAZJ/OdLc4FQtgdFT4hUBG0egbdKEeN7QXExm+YEP3n0AISimQSXQR6DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqAwlkspqsgt5zHVblhrgNjK0N2JsJJYSNl6xVI8XjA=;
 b=3sDy2mKPHr0Hu0JQx5xzivY+wbk/JGHRvvtEQ6PCsOg0nnQ/ywoPd6uj7GJHe2VyAQnwfTJQmqWaL+xLqGelnGUO9U4T6QTlXu0ip+WYzxQxhXTVuSDvWYFw9URdpRLJh9jlbX2dDQDaj4U6awCxvb/SnzexbqUOyLU8/4aENc8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5835.namprd03.prod.outlook.com (2603:10b6:806:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 17:45:22 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:45:21 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] docs/fuzz: add some information about OSS-Fuzz
Date: Wed, 20 Jan 2021 12:44:55 -0500
Message-Id: <20210120174456.275312-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120174456.275312-1-alxndr@bu.edu>
References: <20210120174456.275312-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.5 via Frontend Transport; Wed, 20 Jan 2021 17:45:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edd8fa53-94e8-4995-4e10-08d8bd6b265e
X-MS-TrafficTypeDiagnostic: SA2PR03MB5835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5835807CCEE3EF01BB80374FBAA29@SA2PR03MB5835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0b3hVT90i0T1lzOJk4QCEoMUzxBnxmtArKy+5BmzslQqfSqlb54aBzzVJrFpmXiOyyAEtEp9QrcavFy/ItOq5l9O5PBu1ACs97ebnOSPwzLltFOlhO5FeTlAFN9ppSwQ7tS9YcJvl1ZMwHM2GJwVUlDKQTtbOPVS2R1SpPl99z1qDZy1JmcutfP6I4KObmQEvyWvsMXIa7DF3BjURmWmD6Lh/IXV2MzidPa3y/9D5BfnyBSryvMJfbMDFd/Pc3f6ooCQDasByncXQM3ZJ6cCw/PIHTcaeqH/CjYVDVeNlFjU4ZNBsz87+daJLv00E4aJqevBu7GW8nXN5L/VgOGry5OnYw/Deu81ZDM4KVKcyUdEOCCNx1vkqunWDh5lBF3ACn33nSMYnO4x02VXk7xMgxARm1aaCksYEOO9bFmxUjzsVh0uXcDVicnKLbZTj7viPzjhbTg2HJHPJGyeVA7pLb/WGaxnqR3Ygzu7EFcsHpFNbFEpziaWNVqTtJXQWC2DWzHa687kPjvTh7DEp3yGv1ceAUdB38/01xKcNtaCgFiyhsxtThXNOBp/uSJ39uyoVR9MSFyJ66WlbmwNO+Iswi89p8bUL6ZwzOOtrQTaz8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(8676002)(52116002)(4326008)(2616005)(6512007)(6666004)(956004)(54906003)(75432002)(6486002)(5660300002)(16526019)(186003)(1076003)(6506007)(26005)(8936002)(478600001)(6916009)(316002)(786003)(66946007)(66556008)(66476007)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oZvLCz/mI6wcbViWft/GJYh3enf3A4oNUy2Xatzbp5j73/tYi+GEQ2OrV7g0?=
 =?us-ascii?Q?3/V1trselhklg751Hjv4zhXE7UFOro8zG6C7a0lpE6v26N95mFXGCEJYAxhR?=
 =?us-ascii?Q?3DOr7Him1/D3XLfZijmoSsCMVlG2Cq5jMo0xGYH9/xV5QJ6ZsX/N/ODC7svU?=
 =?us-ascii?Q?0Ukr8mkJ78TorACWni7pBFo50Q3tAz+3rtY6w+IjtcNypVT0gmDfNdL3HQzV?=
 =?us-ascii?Q?npkGbFMpxVCfmoZSMCT6x1E1qZFa3ZzmcvSVhNXcYH9BSgz/64y8M/Bva8mn?=
 =?us-ascii?Q?/P5tCe/kRmZ9oiViQwobSrolKyLC12sPiw0zFiWxiAs2+UuZbNIhB0bBh1NE?=
 =?us-ascii?Q?KQjInmHBcE+qKuA8pxj+PmhphSbwcoHXZBrMENxV/V9qQyohtHOTNTjcaX6l?=
 =?us-ascii?Q?euV69mhSQYrhMsRldty1Wh+K3tNWEJA8GrVh1btcPGJqXbAckKrcfVBh0MeH?=
 =?us-ascii?Q?bvEeciuWGOGnstakbgDW7HDcvqEMXeXagcpnH5ZG2/k+EY8//xzzLefhl1dd?=
 =?us-ascii?Q?JDPAQ/K4C9lvFCJN7Z7ra2oB/eXlqHXlIkYFtT+1MsZc7Bm5kFdx0YLu0ksr?=
 =?us-ascii?Q?Nh/lvlbRpnIS8EAGDdaD2hc+1kmoEXKVsmdXzjGSicBJMqeIvUH+cC86anvu?=
 =?us-ascii?Q?p0f5eTOWlxbTVtojpOzAgud/gRLlvw2AD9zr+zwnvx2sr8jXuZ7o26EBxSx0?=
 =?us-ascii?Q?868o/JdBQ48khelGdOWDK/gcQZCd2t4O3RiXxwhq5uSMJlQYABf2K4rPklMv?=
 =?us-ascii?Q?C82X1tR34j2+aCoGBvtRC01YbEodgh5oXVbdhN7x5ep9139b6mjDFLz/IqOw?=
 =?us-ascii?Q?7tH4vR75MFxN+iJv9X+4v19x21/JntV1lI92zbQETJvNqGEwjR0y92hSuCZg?=
 =?us-ascii?Q?xm8lKdgSfKUQ2Ol5l7Z0v85NKr/PEeTpWRloKiPASX8UujH6GUvl07XYXxRh?=
 =?us-ascii?Q?C87VjOlfuZaDKbYVo9FxNM9XaUXJ/Vl460sNW1KJkDpU1g21GMyQ1tSkpzlh?=
 =?us-ascii?Q?bmaN?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: edd8fa53-94e8-4995-4e10-08d8bd6b265e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:45:20.4703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBOn+/qEzdB8JEXMr6XlWueUD0xzys8urQi+6Ht8qnmfElMbvZksG4fNJqdsD+b8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5835
Received-SPF: pass client-ip=40.107.237.129; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
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


