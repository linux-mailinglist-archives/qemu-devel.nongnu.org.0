Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569492FD761
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:44:37 +0100 (CET)
Received: from localhost ([::1]:34738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HX2-00070U-8g
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPa-0000S1-K2
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:56 -0500
Received: from mail-bn7nam10on2095.outbound.protection.outlook.com
 ([40.107.92.95]:32454 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPX-0002pL-RD
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAHhzzc33kEFswCzGny+cYEOwBPC+vTzTgYd/UwTdUqguEeDTLwJ3BDAMcqjOcL/rKogN3otlD2qSeX2HYWxPJE0gNf7mDmf+QcilycJH7SyGdrJtYVZ/j5eRgjJUKfR53sqft0X+xM+5Wog0dtFiCEQX7QL6AkyMAum8vq+XnwhwXf8VC04Hy0f8dQnXmr9N+ByCeOl1Mn3G6JcfjkNGzdw/FYjkprdKMbH9MeLsYDqTlxbqUGM4snjj20A2ttPr/JYNvBU3o8oLgzATe4dqpg6NnqkM+Vc1G4w6eBgoiut5I+aDYjRmBmy2+FwqA8xLvq6lqlppAAJjDop6tmYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBH3OZ9a+YW7rSSruXrFY+pZ8ln+GDLj7yrY7CXHmFM=;
 b=mV0qGigHjLRM/HmdNe4Bn4xMAROs5lUCJ4bUImgCPf46toS2jnSYnLTf/pxd05Tjfhv2TZVPtevLAjLEemW8xVqKFcc1Rqvm6gkpHzqGq14beRI0lpM9y7TuaIGqGklA0Xd0MO+hm1+MLiYCw//BtR0c9MT8laclOKR09P5+65b/Cn0dC2aiNeYZiRxmJBrTtrYYY27qSKYDcnjUuXLFXdacnxTm+I+pTOjLFwjOUoMApVBwTyTYlu1K0X5IfQxzz6KePrcPXvnx5RyZKZGI+fGYoOeuC3iw9DH0ouY9voIfb5CQvvcTrMblImUiPO6dLfgazB7TSojtW4s1Hhdikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBH3OZ9a+YW7rSSruXrFY+pZ8ln+GDLj7yrY7CXHmFM=;
 b=BOp7kGg2JiWO9MVP8uQaB5+Oyrd8nD4i0Bf3RLSgVSZ7eHuP48driU2oSI7sbPyTLKiKubMy2te/3YTJHbXkfYbCJ9mb6IqctSdIhGIlDO3Th4rh/WOyWWDnw7zmHqRsh6VStiFLjR3FFxYHgrowyRsz4ZZGPw7NZ+q5nJ5EGhI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5482.namprd03.prod.outlook.com (2603:10b6:806:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 17:36:31 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:31 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] docs/fuzz: fix pre-meson path
Date: Wed, 20 Jan 2021 12:35:23 -0500
Message-Id: <20210120173536.265601-2-alxndr@bu.edu>
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
 Transport; Wed, 20 Jan 2021 17:36:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5361071c-901f-4051-b209-08d8bd69ec9f
X-MS-TrafficTypeDiagnostic: SA0PR03MB5482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB548230CA03FCED4C08170D2EBAA20@SA0PR03MB5482.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /OndjcZOTP6EfIBFUANrp1frQ05242msa7XVvwFW59qht5LPEj8TI8BDi/XhOdkSmQfYll8K3ae0eRPEmycIPy9PSqVw03nS0GmFLFpdPzLDc2d3EiTeVh48Hcrs+sgjq0qoe0Nvu4HivM5H14pabe+7PkpjxYGSLzIl+OWr0qG9zEvtHFo554ufX+GCMInKGPLW9tfSmuXEYtP/XHdc3wuAd49uVKE0Kvyhi7CPG78zm2AFRebcWJiEpi68uYuvgCSDnSUAHmn87y8dJCYU54paL3JheDn0Jv+Z2q/j+lDcCQ9r4uWvh1Fnv1Bz7aumpHbXDFZK9dXzTx092nNfOKn20CMafynwP58Tev0g6AHcJRDjp6jaRM3DG5fEaMSica++KMyPy6pWgi8CZHEysA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(6506007)(26005)(66556008)(186003)(6512007)(66946007)(5660300002)(86362001)(83380400001)(6916009)(66476007)(956004)(16526019)(2616005)(54906003)(6666004)(1076003)(4326008)(2906002)(8676002)(52116002)(316002)(36756003)(8936002)(786003)(75432002)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dtBVAY7I0d+DiCMgsOvpwGOFCexL9OMn3P1NNgXiqPJn55QH7EaR5dycgcKD?=
 =?us-ascii?Q?NKD9glqqY4ysNUwBQLtDaKGWTW2oZ0dx11ZIwkFO9IC9qx+84QMS8CARce9J?=
 =?us-ascii?Q?9AsuSDUQPAqRCNDBdPRC2OH6zzqcJUVJIpZsiGikQkTUtwjG/UEK7mXBq4Ql?=
 =?us-ascii?Q?nF9OibQwd9b5plwQPSA9YU4hr3u01NXLhKBdJBwBilK5vlnljJpXJJMl9hAx?=
 =?us-ascii?Q?s/q0rmyoaXHMBw/QVr3R7hhXst0FG3flBuwDblK6BCtCADNmiiwIokLmv6n0?=
 =?us-ascii?Q?QFAcBhE0rIfWHxRaGN5mA7fI34OAMB8tdSCO1PmSSryyIBs/Gboy7oNRO8JO?=
 =?us-ascii?Q?yf9AVrUAn3Vd2b0uG5Kutr5GKsxWAm+RVGuoSPc33isdnWc5zsDAxoG5V+75?=
 =?us-ascii?Q?dIBqGQmAiTAM6xIB04h/z+J4fOk4c9/ur5NcelyHlPm1bP9vYvYTxV4k0PIy?=
 =?us-ascii?Q?DBYjfV7lzkyrJh+AUqkMIGNMic97ub7SuxSBgit2ZvKdjY/iCB94Z/FEkoVe?=
 =?us-ascii?Q?/xXGfwzjDaf/u1u4yITM2HiIHpOuqnJ/xveb3pf++mIV4dEFWXs/OGdEFAjy?=
 =?us-ascii?Q?zLeD6AAFyQotri9LkDH0ROX0H2putau9TttjTG+p7oz5MwugFysyB1zcEXP4?=
 =?us-ascii?Q?MGYPubX1pylPeLCEdOZpptI8jT1p4c0m1B7wvI3egt7gHINAkbdbDG2qNIUA?=
 =?us-ascii?Q?fWcmhkWX4VhmGFb8Sr8Vco0ls1V9nbDRpVJk6BZ+UyN2b2tmMnNeWWOJEYBy?=
 =?us-ascii?Q?Og7bgTksYgpVyCloIpm4NbCiUzKtPbDPbvbC8AFnIYTtErQWJ5gNqcGFEwjb?=
 =?us-ascii?Q?L+7yJIH3hq3SahQ4fptGXJGWp5ANWwHyYNMlTY6DENJalhR1jsRbiUHzbjrh?=
 =?us-ascii?Q?BIPhVBWW2tApfhP8caGm5/bqY2L2zmjq+ZqvIp4785VI6kAvHvqJP745FzPg?=
 =?us-ascii?Q?f8jfL4DTY5YmVgynmh8I+dN9U9AkI6IVy/giH8xM4G5gnhssPhu1xu8yNaa1?=
 =?us-ascii?Q?yo50?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5361071c-901f-4051-b209-08d8bd69ec9f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:31.3988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JpS55jTduWkz0MCm57x24ijJmPx5xhJ+xgUujxkzdY8x67+XlsBPPTTLIxJqpsO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5482
Received-SPF: pass client-ip=40.107.92.95; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/fuzzing.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 6096242d99..5f5200c843 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -119,7 +119,7 @@ Adding a new fuzzer
 
 Coverage over virtual devices can be improved by adding additional fuzzers.
 Fuzzers are kept in ``tests/qtest/fuzz/`` and should be added to
-``tests/qtest/fuzz/Makefile.include``
+``tests/qtest/fuzz/meson.build``
 
 Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
 
@@ -128,8 +128,7 @@ Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
 2. Write the fuzzing code using the libqtest/libqos API. See existing fuzzers
    for reference.
 
-3. Register the fuzzer in ``tests/fuzz/Makefile.include`` by appending the
-   corresponding object to fuzz-obj-y
+3. Add the fuzzer to ``tests/qtest/fuzz/meson.build``.
 
 Fuzzers can be more-or-less thought of as special qtest programs which can
 modify the qtest commands and/or qtest command arguments based on inputs
-- 
2.28.0


