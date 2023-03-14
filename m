Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF0F6B8B71
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:43:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbyNc-0000S0-Q3; Tue, 14 Mar 2023 02:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbyNa-0000Q8-Hs
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:43:26 -0400
Received: from mail-tyzapc01olkn2084.outbound.protection.outlook.com
 ([40.92.107.84] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbyNZ-0002ml-0l
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:43:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRy5GjsI/+IS+kMUyTQqpBsZBPQcx+S3n7JdlHimhidQP3YOPt3qX2+UJ8YYf+oCf1W/5t0sL+idgR14LSHI5jP7yPUyg3MVu9RpcZEu+PfgFBShjLwANE8D2IeGghOee0BZOurJpdg34JPV073XkpFHOwJE7GVIeCEF/X0IpweRXca/nerXp2BJVjW32QE8M4D9cAGIMHuUzttuEf2lKEuD/ok9XfjR/QxFpPucETt4suyJrfBAN2kbNDrqi03euM6/Cm2MWQqABq/VEO9sMrmQG1umMHtqC1hJNDX4OU3lkUkuR0OgFNcGPpUwfybPARf0PObiPHabLYAGkDCyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNlcXWsfPoMCD8iBvxxGPLdfzYmg/4vhAb07uxVlQ3A=;
 b=C29BZy/OTlNx0zHOA40CRNQQx9eHp4FLXw3xNkuSiv/e/Pk6je92ORIC+ao44xyr9kCf12XDj2m8B6mmgs2frZoq835TbWZImXGL/kDJlvFKc+xfEaf7Xd5jxDD4HTz8uwdExaEVlJvGXq36MgqFbI1Dz7yIiapILXQV2TD1i8rbDDt+/0kcbU3B4M3Ddp2OOY7LnXoFDjhga2bE4G8dVUAo6zhvA+TEknKZtsrTe4oqxTIocPK/wcsETdXmwKTTyQ+lFhpFXIY8MLGqmcyB4z6sGg7ZtFFARyhVKW00ZcOnkq3Kb0Xm6Nt7V6oxgB3ysYsIVrrhAG/rYLp8gOexXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by KL1PR06MB6019.apcprd06.prod.outlook.com (2603:1096:820:d1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Tue, 14 Mar
 2023 06:38:15 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 06:38:15 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Yohei Kojima <y-koj@outlook.jp>
Subject: [RFC PATCH v2 0/2] util: Add thread-safe qemu_strerror() function
Date: Tue, 14 Mar 2023 15:36:32 +0900
Message-ID: <TYZPR06MB5418216269D0ED2EB37D6FF49DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [vCYb2n7rpl3Q/VJqpKA5XjHU635+NRUk2586Jri4CFj21Hn4zyoJ5fQ2P5ftJt7+]
X-ClientProxiedBy: TYCP301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::20) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <cover.1678770219.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|KL1PR06MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: f94e6062-c060-4b28-605d-08db2456b0cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ci6noubLxb79PvtYXwk29SwlYk0IU5Sr5QE0oePT0yIBCLZyYb55AW4mczpPTzDFarDHYAFWXuURde+6Qx77Lg7Ssg+QNchjlms/kgfhELoN5Co/UZyjfEPxB1J6YObQwCBoXlTT6O5qhpoC0QPw/DtBhAqpMKtdXh0D6S7BYA/iFTCGCW/Id6lH0WiWEIpsiXsVJbgpqJYi2GXwTwrc/Skgy00atA4hHbWGMNsScmg/GNpMfxso6wSDBf2NuvnunzdLseH/fFNOtOHg2h+uVaBEMUa5Jp/lxAQZoY78kPRgycSn7B4x6CEutT06OyNSiXcyd2HfR81k+lPg2FKWgWNb0fUkrm9q4M+g6WXYeQTrWiGf24nbp5sqH0NZAY0JthZNLCLxXHnP1PfdWgB3Un2cYinoTO1IkfQ9PJBE2IxA9yKLzeuaWFSeJb/h/84nf6OuaNeoHVGBWEKtHBTga3UVtjCq9HL3nclrCr9izk6yx5pvV+Q4JrBAn+rwjx+OTNN1fDKRsNDgO0Y13dMcXFdjnsXoq9HBoQUsvWNPPX1lu5dgznyaHlJV3i8ay9w7gtBTqF917GhPV9gMxTsm7jFnMIRiaqBd+vd+rrOM50k0sJ7eNAeNvlA/qAWnPqHSCCwcMLAQKAwghzYPMhP4A==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1RV2lnFF0wH7IKdu7IzrvAB8osJ15RLvTGt955zzP4Ecuje898Zce1E1OQqc?=
 =?us-ascii?Q?G1XQ/4iJHonVlS0CNVGZMIWRLeE/uO2eGSL1l0PaoQraPJdSwp7vDztHBe9F?=
 =?us-ascii?Q?HP7xMHqu0ak9aRJMpudRZwX3Xc7YTy2b+MJAcd9KD250NCKEq6xIQeMPv0GS?=
 =?us-ascii?Q?yexG4+1WqMvqsARHHaT3OUGLG61YrlExSV3NptLq7Q+wXK/ljUzlVJau70mW?=
 =?us-ascii?Q?btArvB9fa1vpXEPl7oVzNPxwLpUh1wZ+vAfIeD/U/kumCSRSvwVFTbKn3VxK?=
 =?us-ascii?Q?e7iZCaZ6UKLvh/K/Y82xMys5uQGltd7LqRlM/hJHLYl3r4iGHaZbC3P5X1Y1?=
 =?us-ascii?Q?yjKSUtuVK+EjmT/fMiBwFimMws7ltEc6+B8+Yc8T/P/qMPch3gJlsFBPA62F?=
 =?us-ascii?Q?o3s5oWaT3tVIshHTAHhlIVa+FeahzYJktU3xxXW0fPUN2/NY7W5aaTJ0NhrU?=
 =?us-ascii?Q?rBSvblZCuGZmm5Lz49kH8Q0TfrMaeyKgZ126hFmu8230HmtZlSH2JzYhVZuD?=
 =?us-ascii?Q?geWpBhZq5J9OSAZENWh78GMZOwvTy1dnisYyDgIM27IVzdBPLQcbWBM9NTzz?=
 =?us-ascii?Q?lOO2cKJ9QEqvMOBHvsppTtbVprHvAth36XAw7qFeIS+WP87tNQe6nwyPH7NC?=
 =?us-ascii?Q?PpIiT6/VN9h4t5ciepz5fzYdQcJ+a5tdqSX1OMIQ4021Xci79iO5D0HV9G17?=
 =?us-ascii?Q?kieTr8PZ8llrmKPeS+K6YTqGVTC1AD1ELP7D86HZX6Yzg6Hwh8ehjgd2/mbO?=
 =?us-ascii?Q?MR8SU8XLv1TUZYFm8RcIvxRBNmvqC1Xoo/oomppnfKi2OEh5s1+vvWSwwPPt?=
 =?us-ascii?Q?SH7111MjO8AdqXWIIa+uY7hfjZGrk5RQ7enWQ7Jna68Q9tfo+7ZWukvKTmWd?=
 =?us-ascii?Q?1RsjLmiHJQZsGjjZDo6yjStz1IZSd6vWqXZ6C2rOZ0w+ZX+PhoyRAApFeZ3x?=
 =?us-ascii?Q?oKx0JRTE24dx3f3lhgGzdFPgQ0X3B7JxxNKChJRZWqFogtUhE+qkc6ruT/cf?=
 =?us-ascii?Q?SmGtQJPwTQylUagsoPRkF6hGTz7t9WS3oHdeX2mBTj+c7Lw9aEr+FQ5BnIec?=
 =?us-ascii?Q?GAQzT/lwfYa1LKv+tP/VgF45rdqwOJJXTJQLWELIQFvmkyIg4VBCRegQ1cr8?=
 =?us-ascii?Q?jOOMXZCMJoc9TENFhxPNqfsz3izvGQ+NzIw0qUl+J0ZkllcjhrJ9KdWevzKI?=
 =?us-ascii?Q?+VEovNQ2h2F4shmn/0Z1MCfCs4eJoIM3p0CbdLoFMujR9FwJ61xefdm1A0QF?=
 =?us-ascii?Q?Wevg5Dni3ksO39tc1eNliE4X666+ernyqnTVbSut/LjXZw91p24cfZt9dmNs?=
 =?us-ascii?Q?jgQc4Q0GG1iPcwqGSTWfBT9y?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f94e6062-c060-4b28-605d-08db2456b0cf
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 06:38:15.6631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6019
Received-SPF: pass client-ip=40.92.107.84; envelope-from=y-koj@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: TYZPR06MB5418878CE06C457DF67D78B69DB89@TYZPR06MB5418.apcprd06.prod.outlook.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch series adds qemu_strerror() function, which is thread-safe
version of the libc strerror(). The first patch introduces the
qemu_strerror() function, and the second patch replaces strerror()
function in linux-user/* with qemu_strerror() function.

Because it involves thread safety, qemu_strerror() should be tested
carefully. But before adding tests, I want to ask (1) will this patch be
acceptable to QEMU project after adding tests, (2) where and how
qemu_strerror() should be tested.

(1) means that: is my approach too complicated to solve potential
thread-unsafe implementation of strerror()? Although strerror() is not
guaranteed to be thread-safe, glibc implements thread-safe strerror().
We have to consider the balance between maintenance costs and potential
risks.

(2) means that: is tests/unit/test-cutils.c a good place for tests?
Because the behavior of qemu_strerror() is changed by the feature test
macros, the tests should be run with different test macros, hopefully
in different OSs.

Note that strerror_r() function called by qemu_strerror() has
different return types between architectures because of the historical
reason. qemu_strerror() handles both the newer POSIX strerror() and the
older POSIX strerror().

All tests except for skipped ones are passed in my environment (x86_64
linux).

Yohei Kojima (2):
  util: Add thread-safe qemu_strerror() function
  linux-user: replace strerror() function to the thread safe
    qemu_strerror()

 include/qemu/cutils.h | 20 +++++++++++++++++++
 linux-user/elfload.c  |  4 ++--
 linux-user/main.c     |  4 ++--
 linux-user/syscall.c  |  2 +-
 util/cutils.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 70 insertions(+), 5 deletions(-)

-- 
2.39.2


