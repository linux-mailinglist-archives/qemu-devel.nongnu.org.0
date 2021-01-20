Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F9B2FD7AB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:02:30 +0100 (CET)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HoL-0000Qf-SB
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HXg-0001OP-76
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:16 -0500
Received: from mail-bn8nam12on2129.outbound.protection.outlook.com
 ([40.107.237.129]:51169 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HXd-0003o3-JK
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsJukq5tIK1yM8MFZyzPVdws6KZEgF/+h1kP7KsOXw1n63tTLrEgvgxk09SvCu82yeG89iblWEIHvzE9Ikvjcu9dAYzQPBgx7nNetcF136Lv9RLomlCqjZgvlgTZSFmNiyQXIipKuuwiYyBEp+6VDJGMoEBuWBQkk7cfv6fBZ9rAs89C2wgQHkDTwwToaOS/GFxoJ9H5GkDkVRR8PuOnIf5ydnpPPaDDRubg4VfU2mkdu4SUCn1J7bcyFaYfA/0P+o9jPfaiq8BTuskyMMiQ/XZanMRKCDNna8B2tSdjg4uVsqzqEClVcrZ1mKDbJ1TAnYA3+zBq52/LU1c5op3Sgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QTsd+pQMELg0Hc5szEeFLuvthii0X/22zfsUX1BwyU=;
 b=VWpBP3SM98GWBWLPJQYArehVozDfWY8IlKj/AXwV7Se1CHGk3MLPfJJvaFyIADWd/1cczovj+OD++g8RpwHy98SL5X1V0yTuycYimMWu9KaoX203uH/2/BLzHsWs3TJ9j5RsepGyRqqHcPk15KBa4UtU12WZUwX5ffRKcNL9hmra1eJw4t+7cm+14U8affRYopRmUExIgGaOOQNpkeL+cuoQOmFQLm1wczFYPDYhqH9myULgSWNpNjUfkvxLPmMQIAXrZgJOBVaoPSX8/9pruF/ouxTEUpF9nIL/JK5Ii3fMnFVAMrpCtLhy8SmaFuadGCP8j/4SQU5XPbMG5Cpo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QTsd+pQMELg0Hc5szEeFLuvthii0X/22zfsUX1BwyU=;
 b=kKZNAj9XD2R4/5+FxNIZMBXgmS/A5HgbPd4aT9hnuheFfZ8rG/51IoyCifGaSb2XUPrlRTFVr8857NDDIfiAf8yje5sv6XfEdAKb2NbrWCoyZCiUerBJFlSFSA44EbbfdzSnnyfDMFShQz/ST8RhE6CaVopMY+E7efWjQSi02rE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5835.namprd03.prod.outlook.com (2603:10b6:806:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 17:45:08 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:45:08 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] 2021-01-20 fuzzing patches
Date: Wed, 20 Jan 2021 12:44:49 -0500
Message-Id: <20210120174456.275312-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
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
 15.20.3805.5 via Frontend Transport; Wed, 20 Jan 2021 17:45:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36404fca-1bbc-4a98-2d66-08d8bd6b20bf
X-MS-TrafficTypeDiagnostic: SA2PR03MB5835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5835BF7BBAA37365E41E795FBAA29@SA2PR03MB5835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTvuzYlbB7MsDKDvmoBJ74rqnWI8RxCGIKg5l/hNtv/huQnss1JEa4OCVmsZH2x1Enn+BgQvMA+ymnZYeUpNmIOczimvPqaqLr/iwPaZvDGvEfMhsdUGTwpoObfaKuCxm2FpYvI9tqofyRG3INwbNXsYfBpCgGUgxhYixcM5+oRz0S+pKJizBnBaG9Tl54OByg0AhjxIZ7EklVZpj/+fAzEvydjPEZ+pdeAUsLFwpGK/3mUPSoNWu7vesLyTWPM8+i8a3r94tUDDz1/CkFRwi5AbPxsOzZavVfrGC4Q7zNqk34svo8JzBavdaMaCLXhFj/9+Rf9tNEy86UKsXVKflHYernlzVcKrsbWsp27LXZ7b9CvEtm+bUKmME0JcjiDwkn0cvS1J5eXUAOJmqIK65pJkoI9Lf7CIeyYvnksBv59f3Ac55cG5cSH/tZQvmwgUpcliW9/WSP7H/xS2bHTuAorc32fFtX6uDzB0++sqHwsANOGJ9lZO2iVLmB0Lc6y2VQxIe+Q9M2mMSpZBGUhzdh9gx1SIWWLcUVYfq4qwE3Xb6QxeaTI98sVdEX20uDHvvLjpguOEFo7y0Z4VhyFfr7PS0rC3Vhw6j41P3zBdveM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(8676002)(52116002)(4326008)(2616005)(966005)(6512007)(6666004)(956004)(54906003)(75432002)(83380400001)(6486002)(5660300002)(16526019)(186003)(1076003)(6506007)(26005)(8936002)(478600001)(6916009)(316002)(786003)(66946007)(66556008)(66476007)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Qbuj1eLbS0adeLmdFKbqkN0/MR8/2iCNlcxvICA3nHaFbHjhloB5YbAqMDF/?=
 =?us-ascii?Q?00EAjXrnGLUdpzChHTD3OYDRDM4SkHH7QfMCp4eDyZ2z4BSgd+AGSDjcUbuc?=
 =?us-ascii?Q?0I+MOKsDlH9f1z4gSwioPm8G1L4RAzyt1GP/exVNI2hQ3tPME6GK7lFUClfl?=
 =?us-ascii?Q?sOYzdrKEjtfSo1Ae1naf5s7jh27dsQrordo1Q8zxBjrC2EIeW1MXWuvbu4BM?=
 =?us-ascii?Q?03h+BuwAwwJAw5/Lxg10EFw60ULV7ZTkwPzMyhQxCq3IZS5waqkJqmwZ0V+i?=
 =?us-ascii?Q?KaetMhI0oR5arCV+J/LPciwsIBgSYvROsv/3vjxXk0GHyF7Ii7xiuXiYoUJw?=
 =?us-ascii?Q?9S7emjbjh3dbofnzw8kTesXs5WKlEPBau5XxD4FwhObCH2YirKClz+c6W+3R?=
 =?us-ascii?Q?6eoCLLg7Kl3q5HpiIGQ3DiYLcKUg0hzTk65yQYJngi30vmuG51S4+Er6pUMf?=
 =?us-ascii?Q?Z2JKkhkOY20zu3CwrZHf5ATsjCMVtAN20AY2dWbSeTCDUo3xVi5FEqRC9hg8?=
 =?us-ascii?Q?8hbAmOgvU9n0PPKd2V0mHIZI36Rm0CoGpOTMjjZjoeyA4tJU+4ieVO84zG/r?=
 =?us-ascii?Q?zmNfpWEvp2K5SKGmjNDdPpMerlASt8qPM/UZ+aBl0ibVtZyA5jH8ZPc3Rg4u?=
 =?us-ascii?Q?4Y0TvEP9qWSUKDvVwVVkrlK/FPF+RZnRLrIydK5g66j5HePeHnRQ+FgYujj1?=
 =?us-ascii?Q?FJkf8jTXBRdU7/6yL9dGF+7Wa/Au9CkMJ8xmFXAPIOmFWnOtlPLQlArbVtae?=
 =?us-ascii?Q?gxsrE9HgzN3wTpCEvUSG5UkJuVbjPQ/QJ69ZzDtEQNvGU4JcVI7cu96MZejh?=
 =?us-ascii?Q?TmMQLqJRUU2E+0FU3fA0RCojBIHKiXBaJUxjJinircr/AzTzIxuk71P6IBJY?=
 =?us-ascii?Q?BM0Ir7tcV66TO5+/IyM2Aq79BVTPLKNsgEk8dPWc+noI07dzqs7LZWRmUDHg?=
 =?us-ascii?Q?vHkBctr41Lfr0E4iHhgqK9pJcpeclQyl9eO0m4/WX+BMfX0Bm5SCC92WqYDd?=
 =?us-ascii?Q?kycw?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 36404fca-1bbc-4a98-2d66-08d8bd6b20bf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:45:08.3754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDz8Wq02nSExf4ibeVQcDYMEQYelLeiO7abdetttgYBQj2ZiIgJMIdDTVgFtXuyG
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210119-1' into staging (2021-01-19 15:47:23 +0000)

are available in the Git repository at:

  https://gitlab.com/a1xndr/qemu.git tags/pull-request-2021-01-20

for you to fetch changes up to fae446ae7b6f746377186b3e19fd3f732a8b4325:

  fuzz: add virtio-9p configurations for fuzzing (2021-01-20 12:30:26 -0500)

----------------------------------------------------------------
* Add fuzzer configs for virtio-9p
* Add fuzzer configs for PATA/SATA ide-hd and atapi devices
* Remove a DMA callback check that was limitting the fuzzer
* Improve debug info and documentation

----------------------------------------------------------------
Alexander Bulekov (7):
      fuzz: ignore address_space_map is_write flag
      fuzz: refine the ide/ahci fuzzer configs
      docs/fuzz: fix pre-meson path
      fuzz: log the arguments used to initialize QEMU
      fuzz: enable dynamic args for generic-fuzz configs
      docs/fuzz: add some information about OSS-Fuzz
      fuzz: add virtio-9p configurations for fuzzing

 docs/devel/fuzzing.rst                  | 31 ++++++++++++++++++++++++++++---
 include/exec/memory.h                   |  8 +++-----
 include/exec/memory_ldst_cached.h.inc   |  6 +++---
 memory_ldst.c.inc                       |  8 ++++----
 softmmu/memory.c                        |  5 ++---
 softmmu/physmem.c                       |  4 ++--
 tests/qtest/fuzz/fuzz.c                 | 11 ++++++++++-
 tests/qtest/fuzz/generic_fuzz.c         | 19 ++++++++++++-------
 tests/qtest/fuzz/generic_fuzz_configs.h | 41 ++++++++++++++++++++++++++++++++++++++++-
 9 files changed, 104 insertions(+), 29 deletions(-)

Alexander Bulekov (7):
  fuzz: ignore address_space_map is_write flag
  fuzz: refine the ide/ahci fuzzer configs
  docs/fuzz: fix pre-meson path
  fuzz: log the arguments used to initialize QEMU
  fuzz: enable dynamic args for generic-fuzz configs
  docs/fuzz: add some information about OSS-Fuzz
  fuzz: add virtio-9p configurations for fuzzing

 docs/devel/fuzzing.rst                  | 31 +++++++++++++++++--
 include/exec/memory.h                   |  8 ++---
 include/exec/memory_ldst_cached.h.inc   |  6 ++--
 memory_ldst.c.inc                       |  8 ++---
 softmmu/memory.c                        |  5 ++-
 softmmu/physmem.c                       |  4 +--
 tests/qtest/fuzz/fuzz.c                 | 11 ++++++-
 tests/qtest/fuzz/generic_fuzz.c         | 19 +++++++-----
 tests/qtest/fuzz/generic_fuzz_configs.h | 41 ++++++++++++++++++++++++-
 9 files changed, 104 insertions(+), 29 deletions(-)

-- 
2.28.0


