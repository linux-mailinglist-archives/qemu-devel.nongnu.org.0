Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1732F9513
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 21:18:38 +0100 (CET)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1EVR-00068p-BA
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 15:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1ETU-0005KH-R6
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:16:36 -0500
Received: from mail-bn8nam11on2111.outbound.protection.outlook.com
 ([40.107.236.111]:47904 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1ETT-0005QN-7d
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 15:16:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QptgnqEz9Go5rsQtPlusAEM+uA1a69GMW6rwG9Ra12wDlROrkcUeRpumtsE/7LXs++BsxtJmWQXW35AJnr6rvm1nkBlC7x/y0Byn82Ku4zsESLsyWhuGWSgvUHVGOnauZpOOPX8AHolwVTyaSxwL2U7G72t0iVxBtDiDCs5ASzzRC0/Xxx+Rtocu5NRlWPliYIOVJn3Cv6Qkl3BhqvsCy3F6ul6JlZP3/VWdc6r/cw3fOMG45cHgYfzg1f/xvycbRfbJovsh8QINDb3dv1uWyOqqRcM9UzfosM0IHJYsQk8N7YaeQrqjksHUGBJPLhMeMrUfYxN4PnSbcCm3OSZk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBfiAP1+C2ySmIzuBuZQKMSXf9sUpmyAc5nuhuGAcaQ=;
 b=OfOxYEOmnH7GdCgKen/bBxsFFiUoPpcZ2Rd5PM/6UWvFHwBFo7McJwR0D3By6FYIm3CVudyhVInXghxDw9sGKC7GZrExKPcTw6S/5fGPxKitBvRo24ZfkmJqp3nZfAR40huM6Dd0i7W9N4+ndNOvvLvCMrpbnTZ5J7a6vwb0PHF/BAdfotIj5Y90+QzO/iCRINLNUbFXYCqb6mlqNq2l54hZWFLjf6XnJ8T/45D5buLZMpWmQ4w0IJwf5kCiEgpXwLqAHbvwAJ4mmHJuB8AOAOVd/sZFd4gbWcK0WaaJpQMPC33MdjXgdeOhyRN+Ray+EyzBtNCOyB7fiJj0HKDNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBfiAP1+C2ySmIzuBuZQKMSXf9sUpmyAc5nuhuGAcaQ=;
 b=IR+inGdNMDSES4htAF9ZIAJU90/IH86w/8gc1p3X4diyUMQYwRQqekfQ6SNZ0ZSopDrHBLUK97+qlEf7+geSq4ym+pY+3kD7FEoLlPncIrhgk44BrRIaGkpvvaVnAdfd3V6ZZfpnAStlQ1zck/dawYrYRmbFlSGdNU1nTjNbK38=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5852.namprd03.prod.outlook.com (2603:10b6:806:115::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sun, 17 Jan
 2021 20:16:05 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 20:16:05 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] fuzz: Add 9p generic-fuzz configs
Date: Sun, 17 Jan 2021 15:15:50 -0500
Message-Id: <20210117201553.279266-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
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
 Transport; Sun, 17 Jan 2021 20:16:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cda7a0f4-fbf6-4b4b-0717-08d8bb24b801
X-MS-TrafficTypeDiagnostic: SA2PR03MB5852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5852156463538C8CF2E619D2BAA50@SA2PR03MB5852.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b8jebPFLcjshscfkx+oSkZhrKMypZVe3j/02IC0MF7JkCAgA7FHuS+kbp6HSoodcvYt93aVYf64STylfMhKwmqIKr5pP0ZbRr0MSteX04ssL99Ag9avC7tLoaoV1CnL3rD8+yhFIBFu5PB30FsinCNpgoqSag7O+YSldEVfBjH095aQBSTO9p85BCSamQPRAeEheOlubgrG546AgxLX73IhYo9HWOba0QPX5WbQAJLGrFlh4mI3jcxyvQmuaoScmRlfhty10vU7N/+IvGpwx0t5EijJVSnxlAAplchNorrN1gfOHpJstPdDaYgUIfHk5IFPrN9CbBOUA4LjfZIffi3RG7KIw6KxukxQ6mahnwYma6Aoq/El1B9S7xgq74IXFQfSAqRBqlXXvm+KEIUxeRBrYCN/q9Q2TYeoifQFSUr45IfdogqgX3gj+7AvsBIwt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(86362001)(36756003)(478600001)(66476007)(6916009)(6512007)(66556008)(66946007)(2616005)(4326008)(8676002)(83380400001)(956004)(6666004)(186003)(316002)(16526019)(26005)(52116002)(786003)(6486002)(8936002)(6506007)(5660300002)(2906002)(75432002)(4744005)(1076003)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pYwNt7aDCMMLnyCybtFK87oE8CsghRTXYmXT33UPl5Sk3NGVTjWJt//2cOGG?=
 =?us-ascii?Q?JbGQdzP1lgQ7cyJQ3yB/1yFFg0sFXjPWZX8O+9klShe3UNAD10y6Bs+pgKqJ?=
 =?us-ascii?Q?JOMLHeo9t6XB4AJ3H88lW9nzlUIOc2zJynWxgh2lP+m3I7M238isnUlFoBDT?=
 =?us-ascii?Q?aam1W3UlFZUZIy6eOFx3uqZR+40Bp4ZYVwzOTN/xC9nIeDCCwWyJKNswlX66?=
 =?us-ascii?Q?GHyq1nhZNJbizbov/tolEaGLB3gVfCajTiOJd3dS1uKMMGnyvk5zhNYAp3qL?=
 =?us-ascii?Q?HMvbMS5gtMP3eCoUSaOlfrDy6s+cQvJcbldb9vnnihhNdt94zs6Gye4buDzz?=
 =?us-ascii?Q?vnt90P1oBaPyIbP9KMRwzxAQtuJmOBrZUAMN7RVcISpog0S9MtPh1BdEkHH6?=
 =?us-ascii?Q?/yuKouuOSODrxpCoiGYMZDFsNuCeMz5maSD2bG3fXtDIOsjOJQgyEP9WDebo?=
 =?us-ascii?Q?rDUhogzKaPhc9LP35r8n9jekPp6QG1a0Bm4Dl+3hv98poY8GLUs0J4G2PopY?=
 =?us-ascii?Q?zNWDEaWLvwJjDgub9g5WjOe0WXYfHtShkAmzpHUSv3SVPMmlM0vDnZUurnZj?=
 =?us-ascii?Q?rLcC6O6x/1Bj/uqEwlrLIl0LupEa199mSkIxtZHd21TSksu/raibb5SCP6xH?=
 =?us-ascii?Q?UWb6JaXeflaScKIFfSQgAho9SIWGhSUx5JbWhHbufhOUnSnC3lIE2IAnNtxS?=
 =?us-ascii?Q?yfto51tSa5NjuUCoz8fRUp3y10TjbcZoS4w+xh8ghDMdYcB/bzeDC4iCGUJ2?=
 =?us-ascii?Q?nc0575+N3V3fgyEIHO3s90ueFEp2Dr6wEELbklxva8KtVToiPvuVBb3tHkYy?=
 =?us-ascii?Q?BaX6v9jaIpBmSnK13wVD/wNphvD02lvR4U6XbeiXsfIqX0gOD6qcnLseAYWr?=
 =?us-ascii?Q?OEQ1kzOWhHG/5wDTU2GsFe2FReTdsKU5gohB8SOeXzaYkMIn2PBbznPD2N/n?=
 =?us-ascii?Q?kBIwXrCK1VmodIIgRphRVXaQ1cLlure5eLxTta7+FoO/cSRfGarbyjvi0Ma1?=
 =?us-ascii?Q?8szs?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: cda7a0f4-fbf6-4b4b-0717-08d8bb24b801
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 20:16:05.5717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caHoxsDDDb950PPVzZ0x7YMzlzZ0dGPmiVp+B4OzQ04JR15Uq4EAvTnLxD5Mkaju
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 1 enables generic-fuzzer configs to setup resources (such as temp
directories) at runtime.

Patch 2 adds some documentation about OSS-Fuzz (including the feature
added in Patch 1)

Patch 3 adds two virtio-9p generic-fuzz configs. Once of these configs
leverages the capability added in Patch 1 to create a temp directory for
the fuzzer.

Alexander Bulekov (3):
  fuzz: enable dynamic args for generic-fuzz configs
  docs/fuzz: add some information about OSS-Fuzz
  fuzz: add virtio-9p configurations for fuzzing

 docs/devel/fuzzing.rst                  | 26 +++++++++++++++++++++++++
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.28.0


