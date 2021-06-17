Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B23ABD33
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:57:05 +0200 (CEST)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lty8O-0003KP-DQ
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lty68-0000wE-Vd
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:54:44 -0400
Received: from mail-dm6nam11on2110.outbound.protection.outlook.com
 ([40.107.223.110]:19734 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lty66-0005so-9i
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:54:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VN51mD/gKzIYjB1BlVHnl+SkOPaQ/2EwjEI9KwitXECmp9c9LF37z6W2b+zQ3QbsJQneIuhg+e03k9ryzNmRUbHqSgxRSwZORE3rvv0J54dwZlj0D/NuDj9jrRgGrDcnKuXanZHi2vqrrqbazMBCpA8gNNFiXhUByvR3ti+F2lkox9vHevopEBhajbeYnhKebKGkjQ8PQN5KYfhXfL1/oVFDyraqJwt6CnmOogxa55NUkHdCG3s9FwFZxxIprLakaZBxrq+YY09pQVH46eLVI4IQundnAaxNrYXcgEYopPfcwD8C2VuaaRP0nLoShqdto8g8fvoG7ssAuv38Kd12Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiGyNRA0plTpVD4IwYeevHK9XbHuuwfi5W2tkrB9Bys=;
 b=il5/KonL7pFCYW3ldZKKXa1eb+596/7Xq8h4CohlPuy3Jf/Q9HeephHGxpk0lBnL/WlH/iJ1Kgiii1K3lIQLaXS4973yqAVyVIbnyz3D4YZOmGYiOPzmajLXDfOsrQ2oogxUpkpqGdhIfdIM2unVBrOJFiKYSsm+BYKkWekULOYJi8MTdUlqGDBEXHvNX25/gxJU9HoGAoyggRoapeKOzm2UU3u4yYnogpWKnhHsauG0h89/HigGLQUa8piJDFFXFyWLXehUHUggxADCAaoEAfl49VuGiGI7ehXwwXM3tid8v6oe25cM7MpGAtpWFimdpDtlhhDOXzbwhCo/7OJipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiGyNRA0plTpVD4IwYeevHK9XbHuuwfi5W2tkrB9Bys=;
 b=QCnRwrL3Z0UcDdaXH+h7fPmx2odhtqHGwkn6NnJ/0w/vHtYEyHBVVbEez6El28Ntw92V+30OAYBJ5dL4IYp1qCEJct2SOYciOVKh2Mv0i6ozhY2RK4M7FxpEZDOzv8UncXJPxiY3i2nI8NWyZhFLv9QwwNJFyGmArRYEWH87cG4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3677.namprd03.prod.outlook.com (2603:10b6:805:41::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 19:54:07 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 19:54:07 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] fuzz: fix the AC97 generic-fuzzer config.
Date: Thu, 17 Jun 2021 15:53:52 -0400
Message-Id: <20210617195353.284082-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210617195353.284082-1-alxndr@bu.edu>
References: <20210617195353.284082-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR18CA0030.namprd18.prod.outlook.com
 (2603:10b6:208:23c::35) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:208:23c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Thu, 17 Jun 2021 19:54:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3de4cfe-0ef3-4640-04d2-08d931c9aa67
X-MS-TrafficTypeDiagnostic: SN6PR03MB3677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB367718F11487D54927793D0CBA0E9@SN6PR03MB3677.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5U5WqCjwt7yE3vTCEHHaqVONzoR1QxeErq8VqP09LD+sq5yMEM9L3eXJ4ISMa+2N+3k3UNnxtDX9UyqNjKxOlugmyuBCQBPnJNnbH94Ms2hCiRqwYS75qM0FWJN0/W1NnlanqLRui/Vb9YZuovYPD+j8ydIcCqffrtupGvLakiWo1iepDX6NmbPkBa0LVQSP5uOsyb2wTmVRhyUr/y+OYzfeMp6sfBX3/s9Mc7H0DoBQ6jcuIOJDkQcaYK/6IGxG4Z2uoeRuUFu4j1BIr067evPntcKIiiKaimU9Ow94lvqAUrsQM1hXFx3zAYHaKnDWgmijU9rcdW1lEYktD/25wf3PY/sOhtWRvY0maDimIT8G1mdju26+jXtfcZtFfTnaY6EZ8j532lnZzL6G2U8a0u3K+zrmryvCgSuCunDiCKyucIRX+aGf/y2r3z2AraRiZvBAja5Qg2gK9HG9yivqzU1hoGrtxwwEjjIPQ0jAQ1Q3IpbrhiEmoYl7KKpOVhma+yei4Tns635cqHJFpgT9y8XhBer9ElvKtK4sUmizl1V70ivU6ddHxYt5TnuRZdAlFjW3HlvyQgDeyI0FhLi3i5jHBj7uj6kQv7VS+xSEABhkWC4/v5yZj7QezWQlmdpPavrqvdcjjcJwsOYUVju8KdwnxMjVp25jwFRL2f+Xe0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(16526019)(54906003)(4744005)(186003)(786003)(316002)(2906002)(6486002)(83380400001)(52116002)(36756003)(956004)(66946007)(75432002)(26005)(5660300002)(86362001)(6512007)(66476007)(66556008)(8936002)(6916009)(38350700002)(6666004)(8676002)(6506007)(4326008)(1076003)(2616005)(38100700002)(478600001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8/99QHMVHJAVmMWvPPjOu2UQ99JyFucSBeU4po5Jv8U/0vDXSzmGSx5Agdh2?=
 =?us-ascii?Q?0d2uB320AzZa5R10ooujbjEHkBK7tgTTzNYPAR6hNRNhmd3+JThwSQ5fiBjM?=
 =?us-ascii?Q?jxyMOlNNxTE4Om7mhYXbUjUeGY5GUBwwKtmRUZWTPsbnr6LbBF2EOeaCuwWa?=
 =?us-ascii?Q?W+B7C4ILldFYtoa278iXea9+ukqU+rhqCT77WGRbNaM66lkmiKfIkgkvyTAE?=
 =?us-ascii?Q?ehYxUVXjqR5m1xObL/Yz17GLnV2OQxVPEF5fzpExAocuqXLpZOS69yrYhbr+?=
 =?us-ascii?Q?Ie+MGU1YK68zlwWWeDr8Gpg1o6DGQMCDAE01ZANIgNMpJ1em0so6D7FlkaWN?=
 =?us-ascii?Q?6e70DcHhV2b9MTyE+eTtoh98NZ9igZ0RPBwNyxPqzmShZkHf+AS00c+BprGJ?=
 =?us-ascii?Q?R8aencBVzYDDCUmaHFaWcrCKogb7meqLx+NNsGA1cJejt4VsEJaR+iHLDot0?=
 =?us-ascii?Q?3I1T18AZrtQ+GDYbU7qJoLYCo9g4VjztEaf/AkIe2fZ3L+zsG1rjnVBeRnqq?=
 =?us-ascii?Q?zVulcURLnRFyC9HCYTUNq35fLSWOs40jLgk0Q+6BmSv60+Dh2CRAWqqxKs6F?=
 =?us-ascii?Q?lgMA6oR/3EImh9Ozqo63F+E76kyk9vlSm9Z0JYRnc+MU3yJcf8TZXKE7V6Gy?=
 =?us-ascii?Q?rew42uWtCujgpk5My8R+wdTrbxLQKhJf8o98ygupYFhRHIdY4sSC4uPozIHM?=
 =?us-ascii?Q?D5j0vXNouKZYJVS1UzCddDin8V/VZYfmMcTNeClZa642BSd2F615I3+8gZ1/?=
 =?us-ascii?Q?H4TM3qHTSnq7RgoZPGna7tlMQ6goUOfc22+Xp1LtWJF4uOb57Q2ehcYP6n5x?=
 =?us-ascii?Q?eA1MBsavGJd9wDwyOlIJAXJsc6yq3KKFzfo/nGH2Mwm8390S5ekzpED+ljWf?=
 =?us-ascii?Q?lofJMsqAk2mOPrl8fHP3vEylpgl4vBYgqjDFRQGWB9skvnUDCaqvzFkep1+z?=
 =?us-ascii?Q?iBuaYltsx2SQslp0xu2rHJVxlz7iXsgmIH9hXaUP6WkeayIlOKYsAZWYEabU?=
 =?us-ascii?Q?Ms5ERIn/Yw5nmGc0fFRn6mgSynfqmHmzXO7D0IOPGgTu8WP0Rs847BIsk5Gp?=
 =?us-ascii?Q?eKAShxBIYw6lqwtcj6wOE87tGL5aF+l77Brb+8BNeb3MDk29sg7EZjA99Lg6?=
 =?us-ascii?Q?fWuXJnnODmlAaYl0S+/PZxDHnO+j8LcyU6wTWrCpOfQ60MzObAxzP1vRkD3Q?=
 =?us-ascii?Q?o/aXa5yHIgWl0LVec4hJT/IEoLb3UpJ4OeIio/s5m+SiwCD5VQUOk29mgI4p?=
 =?us-ascii?Q?h1DkFVm0Ne6184efohFnDCob9zZg1Y2vjjwIwaRzXoLQuNG0jIcjn4h+Fd2M?=
 =?us-ascii?Q?dSpKcvlJD8rVYolWCK5gHc1E?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f3de4cfe-0ef3-4640-04d2-08d931c9aa67
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 19:54:06.8840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBboutURNZmoNTUDgDE3Stbbb4CPUqe/g+dGJRLlr1FpeY/sb8dCicuXTfoRG1cs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3677
Received-SPF: pass client-ip=40.107.223.110; envelope-from=alxndr@bu.edu;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_AC97 is "AC97", capitalized. Fix the config to account for that.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 004c701915..049697b974 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -218,7 +218,7 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "ac97",
         .args = "-machine q35 -nodefaults "
         "-device ac97,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
-        .objects = "ac97*",
+        .objects = "ac97* AC97",
     },{
         .name = "cs4231a",
         .args = "-machine q35 -nodefaults "
-- 
2.28.0


