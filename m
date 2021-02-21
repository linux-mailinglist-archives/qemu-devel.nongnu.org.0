Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1F7320C27
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:50:33 +0100 (CET)
Received: from localhost ([::1]:38798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDssJ-0002gb-NB
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDsnP-0008Bd-Nk
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:45:28 -0500
Received: from mail-dm3nam07on2107.outbound.protection.outlook.com
 ([40.107.95.107]:12864 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDsnN-0004je-2w
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:45:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJQ5UGffeONXrdQhDcXoxLopy33SiYPKF7lOFvLi6Cu3evCTRpc0oj0m5HvrRXouYw4Xwo6oHIILSve0tMdNWn2qTJaQ9UiPNZmhQqasb4gxr0Blvi2GHnSEHhyJ+cjMwfXpzoSYA/KwQLBtTFuJXJonN2VUu4E7BZ1D/r69vbzoJmQ0AfMMo6ekfo2XDtfMWQe4aucv0egDeA8viHY/tnBRiCHPMHTAJukyUc7KWkAbCug7Cf+lg/9t/99VJYDhcvKX81WMvGiIqh3dOf/+JtQ7Q0ECnwvKw71ZZqM/bhKvoUo3oPqDtYvHhJ7lq7Z6OtHr9ssfhc2EbrxS9oqVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcXkbWSfhN2kBxIWenxn10339HZaSy/evdZdW0k/wOk=;
 b=X65q9dJsTW0uXtqf4DtV4F2WCmGOh8sWsGELRQcgbjdLf/3x1txt5A2J6SdOW9dcRpfYzkau0B6QEZBOpKLBLtbvW1Nx/l2ap89gOPnr20SQXDvUFV8bdgOrbTUo3ep/DEN21js1zZRGu1ZatDe6eBplnn5UEgmphr2+6z1NaRbSgFS4DRjiMyWbcuIfagw+Kq/K8h0XoGcyWrPFExPBs+tifWc6PLwDWTpE5bP4ZPECaXRkMSINWIbOO75JAfwENKu0ky3XN+4AHW6S6gzJnjkDHeA9cvZ7J6A4Kt0cayJng02g/ddvDO+cuX7LDuwTg1L8Rsa9ad1r/7h7L2+TNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcXkbWSfhN2kBxIWenxn10339HZaSy/evdZdW0k/wOk=;
 b=8BJKY4TlaKKCMYiw7wMbonggmO/ke1lr89ZPhBYqv/W3rfiVUSvZ/IyzyauYZHvT8iuGaPmTg+SxhPvWLEIMgkFerykHN6n4UPmPTMSeupcsAYImtLyjVMd3oGw61SxzSls8Xqyh3DjUHaAfsj8WD/szTqDm7tKqQ684enb2Hfc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5387.namprd03.prod.outlook.com (2603:10b6:806:b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Sun, 21 Feb
 2021 17:45:21 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::1ed:b27e:19a1:5bfc]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::1ed:b27e:19a1:5bfc%4]) with mapi id 15.20.3868.031; Sun, 21 Feb 2021
 17:45:21 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] configure: fix --enable-fuzzing linker failures
Date: Sun, 21 Feb 2021 12:45:10 -0500
Message-Id: <20210221174510.22542-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: MN2PR20CA0049.namprd20.prod.outlook.com
 (2603:10b6:208:235::18) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 MN2PR20CA0049.namprd20.prod.outlook.com (2603:10b6:208:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Sun, 21 Feb 2021 17:45:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99357aa3-cdda-40d1-b026-08d8d69075b7
X-MS-TrafficTypeDiagnostic: SA0PR03MB5387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB538779129AC9BC4753B7AFA8BA829@SA0PR03MB5387.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUzqEM1E7OxFphyiChrSVTXlq8rnDUw/5L4HQ4tPJNw3ZrZLIOGtS6P+nqTMOdCsnmNCkzEfmITITULLz9RxBtz4zUa66PJyy8w5guqUEyAtBNGZc44uoFILvvQJB+U4yOJaxof6lPmfHhPnyj5je4K5U38DB8mc8xwKbiBF5ZS2VTXul0vWObecYgbkK8uDZEq0LoWNZtXGDnMuNinEKyubMfPHn9T1wVkRPWLyUes1nCc7LiCUDoDPNIvirYXkHEoqbvqbXxuQpPVFbhojhvIAINsC5B4QGDw2tHT9o53mq1XaAxLpoV+eEGm3Tua0nGZDKzI+qiPBnEJ2QXpcDMEk04xkeNxpjRid2tBbOxbi9LWkXZXWqkK79LroOOOeMPucyGOvqYim76AMtqI7odYzzrEh/ka8o7rEZqiqC2lyFI+zQ5jclxOdVDKIYaWatobhn1uA9dk6NV5rlehxl7D/Ca+zdCPsfcdiE5xNvjdFM19S75ZG0KjP2x7fYK8AXa3Z2a5ISG0DhKmlRlNH0LhKuw5JvVvycZlWjm9Ap+0K0N/xuVioTLSNvawNLR7m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(186003)(956004)(86362001)(36756003)(8676002)(26005)(6486002)(16526019)(66476007)(66556008)(2616005)(66946007)(4326008)(786003)(8936002)(6666004)(54906003)(75432002)(478600001)(52116002)(1076003)(316002)(5660300002)(2906002)(6916009)(7696005)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5UNs2DgpyWmWd3e6gRUcoR0gtURKUmpCau/LM6YGH6x4jdezrhQ3yRfeUaHT?=
 =?us-ascii?Q?fGm3rU/0mgbzLExh2GjAtedRh45gtRqk0h9lxYpjg8pR7Xks89qeKJgIOAPF?=
 =?us-ascii?Q?fYyijsx/hj+mhk5yZMzeo7fmS2xtowVhxQV4YybbOl4mOXJVwNOfU2c7lctj?=
 =?us-ascii?Q?gqP8bcI4FNxgkIPudUxq7W5OImmRAD7+MNZXDBrcJgfDBQDrUXC87SwBhp0b?=
 =?us-ascii?Q?peZV16a7axcjnKMsQugKWI/KK45CygTtEksgSG4YjQhjECLPTEOj/fAXwKfS?=
 =?us-ascii?Q?kXwnGYTH3dTSgHe5xp1/4EdT9NhaR+p32dHCcIap2n5BrhDjT1DV1BHXLkTO?=
 =?us-ascii?Q?+rN0/nj67W914POf6jCBq67vAl8XpNFhM2R//f+E7ZND8MVrfl+X6qAxQev0?=
 =?us-ascii?Q?ACX6DCCwy0exy1lr5VOw8yIS5kOjvVoK0hHueEEGt7vnKNVGlY6H4wNdmdcP?=
 =?us-ascii?Q?Q7a6dfKR1j9acmHC3fqMWhyxbsZkh5Es0nU+eStXucvArhSGJikzvk+w38W1?=
 =?us-ascii?Q?9NOL41zBrw+9E91B6plm5JE17OTjls0qziAMXkN6YibabIps3of5TTYybtmy?=
 =?us-ascii?Q?W91/eZgLR46ddKW2g+87bwpIxd5fqdPA8S50XcWiu/qqz3uy0XB3kAUPW7uk?=
 =?us-ascii?Q?WayxSIbO2QOfVFbw8QPyd8k8ModLRO1xQeH5xdBXftZVG6y3GoD7BNi22iCJ?=
 =?us-ascii?Q?o2H/8y1WqvMdry6Z/e4ZZOh3r395h85DVems2IFB0ZGv9sDifBD790B26vyv?=
 =?us-ascii?Q?2zhNTU3aJXYjZJq0oCbTp7jRKmBievi0lmIFddJ1KVMmkQVE1wQzRx28hfy/?=
 =?us-ascii?Q?mLOp/C3lb6eK7SUNHFZKDUokDUzYHcSGGd5wKP/HvGYRR6qlzb+Lf4dfUBZP?=
 =?us-ascii?Q?3HoAe7LGxI2WSIQcQzJRTMA/Y+w1NS+kOpSk5LQ3uLuGdcgM6uvmBZPishwO?=
 =?us-ascii?Q?SKR4swGJu+0XeYCpCM/HZrH4yGA/AfHVUb3eADtrvdlq3573n+FDOpRRVxul?=
 =?us-ascii?Q?nSkuCmdiTjl/0WLd7UDC5xshTpimBPkOZ8hWMDqLsQ7zVHvNz7gLDShl47M9?=
 =?us-ascii?Q?XrRSQuO2qBqEEi+MFbarh12zN3aUzJQEzCLmxBtNcgkcZTeqcLluhrpxlQhc?=
 =?us-ascii?Q?rnxJcjM0K1r9VaC83JapZbpB62n5TcB+8mI+UY5VRu4IqBK3rMA0IhV8AfUT?=
 =?us-ascii?Q?r2SdTuOAJwICdfA8IdbmUGNjA1b2oniWv2j3lZwyDwdeM8Dz5pzKtm4fZo8y?=
 =?us-ascii?Q?6/GE/ctDmvH/XDS2vgvf5xUzvy9y3RpVKm1ZNDaU9XSqTOXut/S8rLn5QKCS?=
 =?us-ascii?Q?cG+L7wvbUEG5RXyVtuDxQ0H6?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 99357aa3-cdda-40d1-b026-08d8d69075b7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2021 17:45:21.4420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3cXOPe1wh0MZU7g+wFNMaXtgIzcPZ/0/dXweaGcHKAlabunUArfPtDWrPeIMY8f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5387
Received-SPF: pass client-ip=40.107.95.107; envelope-from=alxndr@bu.edu;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, Li Qiang <liq3ea@163.com>,
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With --enable-fuzzing, QEMU_CFLAGS include -fsanitize=fuzzer-no-link.
This should allow us to build non-fuzzer binaries using objects
instrumented for fuzzing. However, to do that, we also need to link with
-fsanitize=fuzzer-no-link. We were not doing that.

Reported-by: Li Qiang <liq3ea@163.com>,
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
v2: Fix a mistake in the added QEMU_LDFLAGS line

 configure | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/configure b/configure
index a79b3746d4..19f2b88589 100755
--- a/configure
+++ b/configure
@@ -6096,7 +6096,17 @@ if test "$fuzzing" = "yes" ; then
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
   if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
+    # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
+    # compiled code.
     QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
+    # To build non-fuzzer binaries with --enable-fuzzing, link everything with
+    # fsanitize=fuzzer-no-link. Otherwise, the linker will be unable to bind
+    # the fuzzer-related callbacks added by instrumentation.
+    QEMU_LDFLAGS="$QEMU_LDFLAGS -fsanitize=fuzzer-no-link"
+    # For the actual fuzzer binaries, we need to link against the libfuzzer
+    # library. Provide the flags for doing this in FUZZ_EXE_LDFLAGS. The meson
+    # rule for the fuzzer adds these to the link_args. They need to be
+    # configurable, to support OSS-Fuzz
     FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
   else
     FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
-- 
2.27.0


