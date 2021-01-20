Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FF2FD769
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:48:00 +0100 (CET)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HaJ-0002Sa-Fr
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPh-0000Sa-29
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:02 -0500
Received: from mail-co1nam11on2129.outbound.protection.outlook.com
 ([40.107.220.129]:63396 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPd-0002uY-Be
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEBZHZcEA01JvqhJnBZK9mVTbS7X4869fHc79jqsWGw51lF/wSXlb4TqZ9AnHRUKF17iP65Dj/vpjbv6XYGxDAsf7nK6Iwa7D9zwLtIm+bN3BY3e7Jz8rLdhQWqoDUg2AcZHR1Kyak94TRkSF3NTthZeXQmb0m+Bo12sVnavBDuyn34IW+SkoVn/ZeKphA10Kp3oCpX9vIpzV+k271IjZHbtFvYFJR1XPqHBj0yWDXQP+t9SrNspyNuLX35jA9ymwIdESR5g1FQU+JSMiz/EbGYJMwVUuplc9dmg9G+GZ98v46JTnRnADQ5F8RU5trT6Nqh12KZE4f/YOM1TI/QxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqAwlkspqsgt5zHVblhrgNjK0N2JsJJYSNl6xVI8XjA=;
 b=bfsG4EGN2p9vFvOPi61Ma5lf752mwgKBlelJnGiIkoY1ruyDIb8Nj/0tzgfk+WGDAqjmzh9vs4n9kZYMlZ0jG3l/v1r9nUVIXo2aWI44Bq1tBniBCb9Uh+oS7cmHb0BP6RZZEdBIlW7yV/Tj3agtLNdeR4f3qT58i1ISHWAudplAOLNbLX8UkjNpfPwtiw8UsCR4fQZo0P8X+AyfJRcHT3z9gnmI+76r76ZyO87WZHmwEtvswROOzvrcC7TcOdp9d2h3twkvPqGyAiUcHCEZd0JNnXU/dGHvC9PGxGKNl3PyduXEipYYk/8AhzEvQl5aBMmy3blShtbRCQT914LmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqAwlkspqsgt5zHVblhrgNjK0N2JsJJYSNl6xVI8XjA=;
 b=envpz2SfNPUFHb1DQUEQVzxKngHuBzGRbvJkAJrwuue0uHDg8J0chJloQbdNxjcDXKGLIcsI987oO4EYh6SyNWv40Tw5dflmtd444/Zj/qAPqg5WjiKdnvvXubVWRl62my94S456ckGtByD1jC0FghiqsSZd2xXIwg2N4UI/ZSU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4576.namprd03.prod.outlook.com (2603:10b6:805:102::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 20 Jan
 2021 17:36:54 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:54 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] docs/fuzz: add some information about OSS-Fuzz
Date: Wed, 20 Jan 2021 12:35:33 -0500
Message-Id: <20210120173536.265601-12-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 17:36:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 001b95bd-e1cf-4510-5336-08d8bd69f999
X-MS-TrafficTypeDiagnostic: SN6PR03MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB457632E0F823CB5E59D38FEFBAA29@SN6PR03MB4576.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uP8FwXxiC6Vkt0ipC9HcMTVg/FgPLdV0TW8ylmLRtD4OWa+tgoqfpWHfl0qrRqVYWnRChEMLSCHptTH4zlBqfb5are4fdxBqXtD5xVOWckjduRz8RmqpkxYG+wjQBuGxMrOPWibknAvaR1oU4vvdD9pfNmW7Qh4X1z41NIzizHSMmfGVhV/nYkVU3LX9n4ZCJ+/6jeAITZqKYFhKNdz4DaJYJ/iHR66ORFuhoONny0/sWVoaytMUm/eOBPtdZ9VzF5Dyb6gez8v34mwPtcoT6RmAgcBr/odEYUr8YEvzP91rD0CDRGgESMdI81MxT3tyIQGK1baMEzvbEOLSyoIKwd6Kl2hl0yfAYTIC1aN9l2i3es9BjIfRzXm81Q8nMJL9+7FpQBmo6Rn/DaW/cxp7OGseo1OyIczfWE0Da2MLPKNQczPYHCj+fSceHz/kouz0qsPIdWr6jOXOlyNSnvtlBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(6486002)(26005)(2616005)(8676002)(52116002)(4326008)(6506007)(6512007)(86362001)(54906003)(5660300002)(2906002)(66556008)(66946007)(66476007)(75432002)(956004)(36756003)(6916009)(316002)(786003)(186003)(8936002)(478600001)(1076003)(6666004)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?C7zFXjsQZHkm2+0Go1IOUyUOkNkwDpDfOyn1NPx3j7EhktczcILuJgHJQ0VA?=
 =?us-ascii?Q?cWNBVW7P++m09LJqjaB4Ga//1pRAjiWMkiu8eir/T3OkPStUhMLsJX9v4FYM?=
 =?us-ascii?Q?0zSo/ze/3vC+VvkcLltykTnvi+aHnFQLxX3Od1a7YUOZOvSCs1uKxJgsykZt?=
 =?us-ascii?Q?y05+0Ujy6Vy2uMbWHlGYoh2CJl46LQW5F74eODmkS2NgurqHkTChgGpEKEg8?=
 =?us-ascii?Q?q29/oTEd/rJBKLNvT5mnkJc+Dt0r3/0s2vsi7YFhNA7jalNGqMPeVTBdyRBL?=
 =?us-ascii?Q?LPdhooScspYfyraeXXaPZsgBdMOrulTwklgXaKjYnFdPmvXyApFdO2dqvMMr?=
 =?us-ascii?Q?iQ5hLildA7m/B/fLyOLbIEA5x+1oUkeUSXSvUrXcve+xZ0XV+qG3zV1c/96+?=
 =?us-ascii?Q?CMcuqrFfA8DeXWWFssaWEL3iv2Z26wVwdJlU26ZgTN0nbxQK7rNeciCedAZQ?=
 =?us-ascii?Q?Bhom4pjH+ymhetj2gyJfBAEtwYwLC75X/iVgD5cPX6FhOKEEtZIszVy0U1KS?=
 =?us-ascii?Q?CZYBrR1p7p5JcEFnpZLTgDQx5uhNn96nrTwOxwXRenZ/oK6qQcZxAIUFjCT5?=
 =?us-ascii?Q?AQ5JEAhrvzaAgpG7Sjr6YVH0gCJal7N873MVSPAK8vOIujNOwVF5u6gGkZFg?=
 =?us-ascii?Q?Op/EWFmx8LoiYKn3N60vWtd8WjhpdSLznNxPZpN2kEh5gl6HZ+Ri25b0qEAS?=
 =?us-ascii?Q?w+o0mEOu25+hxKjtLD4iAzPpjMXks5ap4taCcxk3hoj150DC5UzXGnhY/DfG?=
 =?us-ascii?Q?c0VqUKPL0Ydj9/zhCRXZ9NgxrLRqehr6A7tIWZaf0+WpBLISZnogMlclMQP+?=
 =?us-ascii?Q?D1AVqyVUdxJZS6DbrqX+5bCiJv91s4G44J5FhYJzBBa+DIARbvEk84nj2aXK?=
 =?us-ascii?Q?Bz4ifS3Uy4pM80s8X3XEaaJxl0DZz1x2OefP1Xw1ZMXNyhqrHLMc7R+GTubR?=
 =?us-ascii?Q?U7KN4mA1Lb9fUMLEEH/W4N31Tfynw8/T0mVlspiGIa6Kx5yF2vX/1OWOSSFz?=
 =?us-ascii?Q?Ie0u?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 001b95bd-e1cf-4510-5336-08d8bd69f999
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:53.6002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VomFF+/qLGvTNJjnJZ+1YsL7uWtP/YaVbHoaREtNu7xZDK8LFc7yVV9lAG/OkTMl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4576
Received-SPF: pass client-ip=40.107.220.129; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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


