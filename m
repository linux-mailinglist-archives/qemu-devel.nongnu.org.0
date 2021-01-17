Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7402F9621
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 00:12:24 +0100 (CET)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1HDb-0006vH-Ux
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 18:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1HB2-0005bt-KO
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 18:09:45 -0500
Received: from mail-eopbgr760103.outbound.protection.outlook.com
 ([40.107.76.103]:12485 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1HB1-0006XA-3H
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 18:09:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO2e6rsDftnO4Ew3O2bMK/AqEeCezQKi8IRB1utV87CrOaxJz6CkYNefVsHO84MmpcA86mAE+ZDVyDudN1AASnJkaa5eiXlaGHmkS37ehJj9uSMQsHUZ9nIdA8WZu1/cuOj86QQBAi1UYybHoLTX/TICoFE7Sc77HJSWhCXfHHNtDMHs90kycBDEzCKXfFJoUtowpW+ABZEALPQJHn65D6Cm4BxPFINzjHY3hPaiQtjIbu6cAnHOpNeig+HjsfTwXrDuB5nWVC+bWJXXwvRscgjclNt8GCY2AsKUH9sVO6vMNCOA9cQU9dbYNPWwRfLE83vIchCWgcWoLK2APyPWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBL6nZhg2U1wRA0zDv33tSY7/qquZ26HytmM51GWKZU=;
 b=gIKsdHfWIdhplSsg30z/eyEAcb/JPJH+xQ9WFxON9ZvN+DtWouQGiJI6MNoFFStLpk4FxHv2U5M1waAJ6+cDmEyXkmPcBAVRPQtnu1lNvtVqcZY7XAYVVjq95tSsAfWBTi3kexMEYP1Mb3/TXS8/kDHp4CIF3eG958PgTkQK/QGnRnXJ0d8dGnlHNGhO+G3tM8/Tt8VOOmHDaWbNlgjkxdui2WKa7YIQZ3W2itrjzcuz8PoxIR/Lg/dBIJo1TJefE0FrLzKQfX5Il9PsyHgZfYjE6sZh5chuNgD+QMuW3jIrFYSjnyru/3VGU77BFUu366ndpVkTvwZOfpYLHyRQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBL6nZhg2U1wRA0zDv33tSY7/qquZ26HytmM51GWKZU=;
 b=RNco7cXj304P93Jse/9WgUeFw/ILoELMmWeg5SkvqZLsKmgroc40TfwW8WWIn5Jjx9CvQ1jSCWmChHmQ1tilnrxMT4aRnqg//6u9W1FWUeclbXKzqrmgbtewa68qVDaJ+gXIJRySDm5G8JZYlzBu7tIrH1ZUd+sQm9oO516pzi0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2208.namprd03.prod.outlook.com (2603:10b6:804:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Sun, 17 Jan
 2021 23:09:37 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 23:09:37 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] docs/fuzz: add some information about OSS-Fuzz
Date: Sun, 17 Jan 2021 18:09:23 -0500
Message-Id: <20210117230924.449676-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210117230924.449676-1-alxndr@bu.edu>
References: <20210117230924.449676-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:c0::31) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:c0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.7 via Frontend Transport; Sun, 17 Jan 2021 23:09:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29d4d4d9-9ff2-4f7f-e62c-08d8bb3cf5df
X-MS-TrafficTypeDiagnostic: SN2PR03MB2208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB22089A372364958EA5090A04BAA50@SN2PR03MB2208.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlHd3VDOPGH9kqBkGf3a4PvOsdxIIn/PcUpIYkdUN1tgJoKQ69HVkW8hJWFZ4chVVKej6eJyWm78puoRZ+EsJc6YOtlwWQnG3/MRDlzmHpdxuAnzSQTfJN0w8njPa+FlYEnY+YpUa/7Y0FG1yoFYdE2825FBQeUAlNMNPxbWO/U2iQ21FsUkAIObiwgB2MIBgnkUe+JWrCnfN+Wfolbbo9QjU3S2Z/EbTE+PAIuGh2jT7aXTV84hxzU/C+PSXx/e1KrsEdR7ihElSw7ocRi7mKXkG2m5rMoo793JBN9bigXhD8OpB+qSIvtDrWCrqu8X/wH+s+FfoxeYfcn1Fc/NgJIyTr+APHZniz6uIXqoVl8OgjFFo1Q+OPbVlS+NhqYfaYsU9Jo1flJOg3L5VARgJSjV7/c3bn99rSOsdwDe6FrezY85VqhYSaWPsut/vI1WSFBSdZgJ19DTYmVgznygzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(6916009)(8676002)(54906003)(86362001)(8936002)(1076003)(2906002)(6506007)(16526019)(786003)(6486002)(36756003)(316002)(52116002)(478600001)(186003)(75432002)(26005)(6512007)(66946007)(66476007)(6666004)(5660300002)(956004)(4326008)(2616005)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kspOTf9KswwvsXqtecfH23ISj6vfWHTibawSTMy7u/V9HD6NIk3f2FGf9zeR?=
 =?us-ascii?Q?KJKFihB94N1d2q2/V/QLQZZFa0wh3RQCms/vy7SCT87lH+hoSx01gtigmvTj?=
 =?us-ascii?Q?JZjfjSEECenU2vqFceQ2pkE3vRSJd3cVayB4nAyuAaiIT1fFEdxG9dEbY+mI?=
 =?us-ascii?Q?gO6umXIkYp9055ICmRcqeIQcnJ3K1QubqdVM58AMqdaEkXQzh71cSqa1Mzrt?=
 =?us-ascii?Q?PG2H5aNahcG+e9lUVhO8Tp7FMhIhSJY7dwv2EgQPtHq5semKEqQ1LtZ0frrT?=
 =?us-ascii?Q?639j8+oNq1l6H9A7hRjAfhFbg/0S30aqExaqB47wdUD1aVEGL9VxDe/O/Pzq?=
 =?us-ascii?Q?+PWae7ZylJjpOGC5lPPBISkyOI63bylYrt/6ZerdYUrxCa1jLLv2kcvPPzjt?=
 =?us-ascii?Q?4xYrw49B+aiVOqv1az1kCgmzSe44dXNVaN4rtPcRYBANBkc8gMmtE1BTkNwD?=
 =?us-ascii?Q?A0G4+6lvJC+p+DRiLCnoOzSTPlSG07vb4OJEf3Bv6oALUS5E/Mw0IcCarM4n?=
 =?us-ascii?Q?iaxKsK5C9703bhHPNlp/0S97UWpY3U5Ik8fLpkEqlL1g/Qs5/i6UJ472vsVQ?=
 =?us-ascii?Q?U/LzWMJpw7FD2MJmuxHbAkmZPcFqLJZKom+YSfITWGqU/vWQh75WRJrWUTQO?=
 =?us-ascii?Q?8hqcPOzM2rMqsLKlQN827BcIJcVgBIyVWzWuw6NQlSWg3B/ch4bsWQMSIhOV?=
 =?us-ascii?Q?KrIBzS6BSVTJIugpjiwzriyFFKS8H/IIZznbUjP0ZFKo3/yBfQc6dWO4PJOr?=
 =?us-ascii?Q?dM/tF9CfRylHy8knt6m/oEPab17qN7CiA/N81SZykx4Uoy9poW722+RBVeGE?=
 =?us-ascii?Q?X+gTn+B91UmhrZ8RsT7m8LLgLo1KFcfLQWPJ6avi+dsD1TI3XZeJqyTqenPx?=
 =?us-ascii?Q?0uGVOQgiHTFASrkl2ZPqwE7udBTvwKow7Z1wmFAu6mwzFbcgKalZW7ZF3AYi?=
 =?us-ascii?Q?8JcPdt2vuyHPDWC2ZqJdWqfYK1muPdHUBW13c3/q5XMksLU8ueH4bEvkJqpm?=
 =?us-ascii?Q?Whw0?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d4d4d9-9ff2-4f7f-e62c-08d8bb3cf5df
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 23:09:37.2489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKq/Ez6Ab6uS0Ul/x5nekyhLbEBC1XBLqn6cDPeKNx65zBn94mjSPIL6gfKlSSe3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2208
Received-SPF: pass client-ip=40.107.76.103; envelope-from=alxndr@bu.edu;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
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


