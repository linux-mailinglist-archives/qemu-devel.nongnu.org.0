Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570092F9622
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 00:12:25 +0100 (CET)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1HDc-0006vX-Dd
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 18:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1HB4-0005cG-NC
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 18:09:47 -0500
Received: from mail-eopbgr760103.outbound.protection.outlook.com
 ([40.107.76.103]:12485 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1HB2-0006XA-Tv
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 18:09:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2sdZFO6XROZKJ/LXtEoCsrALiwjp6ZMVLqYbp1yApPlu3RO4QQMRv0b5m9c1W0jX6StC59WSdHKHhJ3wvU9QvUAyXEPuGnND2cQpW7CYnfqyUoU+AtHo0WgRHtSnTd0zwAXpeneJvt27jySp1CYmNu1CUOVnKenzDGTfqifNH/98pbUogLeuMzFvdAo4r4UQtgVwpgdgT+J2fP3wVZx9VtuJgQqwO/pC81awJvzQ57CXIScOWSXFYfPoJP4iS3oNsdrpKOg8HsU2CPAbnYBlq5X45F5BDiosDHGUFJugh9Qy6+noDXqNrNpACrIy/iBfb+mVq7/z8YxqfqzyO+nIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQZ/bnN5CnpUHnEjgmBy7H+xRBCUMJSq+kqdjgLhREk=;
 b=fBv2yadPGPwwn9YZfmlAWRr/Jt6z5CtTUoqarJ9Jpu60bwvZ3HBVYnkzO1AJYEDlNqAVqapEKKubhz4rAQ89H/nUu2de5GMh6pfi41mHOqg/ZOUOeUXmjaQ844lwn0KaUvKid68MphhUR1Hv/VF5j+3DFFMzKHcO+7YM1bpo94R/tXf2rzF6YG/KQexd/h96cM87P09D041oQvKE5Kei/i2a2hIzxib93IlZA1HXCBTC/85BUEj9Qz50a864iXv7HEYroVRPmEKTFCXopYXM5ko6iQ5SSyathVDlIR4xsJfiD2D021LeDUVhMuD5xJ7D14H5HRxLeIjn0oEzbI3lXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQZ/bnN5CnpUHnEjgmBy7H+xRBCUMJSq+kqdjgLhREk=;
 b=LVQ1K9cMykslKYhBsbujAKrnfHWFdf9URuPlBf1o/b9+oDvIMqnkDDjKn4w5OqzHlrJX+gHfEnoqteSjUsNZD5I1+l1nS+wFCEeXfF3uCj5bUeOY6Mal2HrsUjERnw9Y5cLJu/KAENkeOeU/VenpbSZxzDXaj7OqM/DSroqP/4s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2208.namprd03.prod.outlook.com (2603:10b6:804:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Sun, 17 Jan
 2021 23:09:35 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 23:09:35 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] fuzz: Add 9p generic-fuzz configs
Date: Sun, 17 Jan 2021 18:09:21 -0500
Message-Id: <20210117230924.449676-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
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
 15.20.3784.7 via Frontend Transport; Sun, 17 Jan 2021 23:09:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26b4a9ae-b4d7-489c-f09b-08d8bb3cf47d
X-MS-TrafficTypeDiagnostic: SN2PR03MB2208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB2208D4280C52C6445102C5B9BAA50@SN2PR03MB2208.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfoFt4Mm5J4xmtq6TEu+9wt4EfzbsJCWzxU4+LOlI48PVkSjudrNpWJKehDw/278gGYNvfmj4wqoscPibR9Bf5+zJst8RP4G7ZibZNMS/qE5FFdS/CVFl6K2UWqhpti38RjxqrPLIW6X/uYHkt5e9Fc9OHXjkXmCUdyHnJ8C3L1IjDpG1MqdW2iij9g6gbzXc/8T3o63dJ3g5XsJcOQrObqjTrtLeJkS6noDi3mhcHX/uuTcoi/zZOZQOsqbqq28O4uKYKG8c00i3gvg+0jKeKwjQuOLkRBH4mDHEXsFozslTBtU5CDcSjn2W4pLw5Glm89ijtZzSOKc7B34vceFbHcM/qVPNMHJvlSixepqs7jEqkLTWxD0sGlJmhgKcr2saQ3WsV+D/BfoUJhBTiOEYU5Y4Jx6RIkMlR9ZHHg1X4CbGs6oWEnjk9y9Hkw2ETNn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(6916009)(8676002)(86362001)(8936002)(1076003)(2906002)(6506007)(16526019)(786003)(6486002)(36756003)(316002)(83380400001)(52116002)(478600001)(186003)(75432002)(26005)(6512007)(66946007)(66476007)(6666004)(5660300002)(956004)(4744005)(4326008)(2616005)(66556008)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Opj/cfyaHo/69b96T7nE9ZwXLzvz43eQZOzO6PSDQbOtm3KGz/gpeD+q3Kou?=
 =?us-ascii?Q?IEeaFA5pDMK/RgrynIpuWoZPkRHl7GFajVEhnfzVUH1g2Zlf7+oIIdYTTmIi?=
 =?us-ascii?Q?PkJ+oq0+n1Zz9M0Z38zONHv88YHtLrZJp/NO32NmvKvP4WYk0vWnzYOBhbwa?=
 =?us-ascii?Q?VRuOeAUIT2vN7hAJqOpaNR33TR3jV5bWxox7Ena9pCSTRLJYER7tF9W/HZsF?=
 =?us-ascii?Q?4eN4LcZTMtyYD0WDe25FWf4/N2vCb/CqNi2DEmsVYb7hNzvLxF9fW4aRkh8b?=
 =?us-ascii?Q?0k++uYwGzlliKXxigR7mq4mm0d9wIdmiqyaemFPoy02E8PRFCiwFWg8em9ta?=
 =?us-ascii?Q?jUZLHe1ZGcwCdm28CdNw5YOWTlMKMxkdwWwfRFdcZXGaZuHBicon5pXf1aDx?=
 =?us-ascii?Q?8S8e69spwKam7C6k6wkOG7thtj9I2e0Nngj3zijXEfKiA6dBfZd9Dx79kZBh?=
 =?us-ascii?Q?ttq0VVepTCycwlPJqCpwPyZrJExxNZTHe32vJ0x4EZJKlwXTkvWn3PZX4KLO?=
 =?us-ascii?Q?J3mkSjkQnuGdvotBqfKqeEOnvlHs5MoKJ8FGNhyAp63LBG2gedWJPDBXa6Cy?=
 =?us-ascii?Q?8CbE5jxPnRuH0z4DRxuj3w462t3yHU1ZCcC0s4NS++WhVCPFzZNDevdRkDfv?=
 =?us-ascii?Q?9Ve2uwrB1SXFHKB3+CIfOa0AzmXxCuZczV6jr7QWv1k+fkR810dsIkUUbhNh?=
 =?us-ascii?Q?vl2fK15DKeLKukSd+zvbVXs4RsTF/hk2VBbZziAQSytwnh3CESKsB9h9zTEs?=
 =?us-ascii?Q?rLMjiRByEb0b0AFB26sMB5RYlwDTVzCGUq9Ao8NAncRVKaJKwnSl64fONIOJ?=
 =?us-ascii?Q?TKXDDZsX9+SIh2pOkAdWHVA27yDAnTi66VV51MHkSL1mDirTRrL7iXK5lDKY?=
 =?us-ascii?Q?Gn0CnwZP8UZrjxn1xaW1D68/LMa4druj2IPatx+WDcYOa+hRwB2wN9KYeTir?=
 =?us-ascii?Q?MYK+8vJ7PVdMzWSvuomhejXhTXZzellyuBSHSUy/2a182NCZmMZ17NAm8nl9?=
 =?us-ascii?Q?G5kH?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b4a9ae-b4d7-489c-f09b-08d8bb3cf47d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 23:09:35.0824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lTBeAWJywbIGWzJvoA0FSrSIwpL56LOgf28FRwBAKNTS8EoRrIa9WoJqSheCZ4d
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

v2: fix spelling mistakes and replace free() with g_free()

Alexander Bulekov (3):
  fuzz: enable dynamic args for generic-fuzz configs
  docs/fuzz: add some information about OSS-Fuzz
  fuzz: add virtio-9p configurations for fuzzing

 docs/devel/fuzzing.rst                  | 26 +++++++++++++++++++++++++
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h | 21 ++++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.28.0


