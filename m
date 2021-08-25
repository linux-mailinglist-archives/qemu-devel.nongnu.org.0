Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22993F7632
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:43:58 +0200 (CEST)
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItC9-0007V5-OP
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItB4-0005c9-Er
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:50 -0400
Received: from mail-bn8nam11on2096.outbound.protection.outlook.com
 ([40.107.236.96]:64735 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItB2-0000MJ-5J
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkYYhffvhpXbOwRwy/KyIIRyA8XkFmdJxgf5T8RoOuLMDwRbcjydwuHdW7AtP9G0kAL48c2a0v8Qr6wSaXG6ZdvGk7XsjgS3lC7rdSlHPgGV4Ui7mlN6uXwWaJTQTknOule7XEZbGGmKL4VMrbiHUWSr613oPZzstYEsKGaxr/c54MIN57lolK5yXoNZS7gn4N6d1bfZs6/YS5M4X91u/FWnESbyZXXN9vsPz08AdkiAUgtkqxNYlvYX28nxnQX5sRgf+rlyLUkafTJzRV9Q1ffqWHfW2MN37GL/C6t8LH1n1s4h6o2ZDR9L1FKE7/GBsnjqlPqWZljeUCL93NoWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwZIQ/0TR5jv9z6GswI4FT2eSBCQ5hb40yrKnEO4ZaY=;
 b=VbkflxdsE5dui7zcWQt0MeYyqeTbve8JFU6IkEeW8CjLc+LrAbv89DzUXjamLVxBDylUujnNY8BEk2/g+hkwmmpN1ElAgGLOKdRmnj2ahYhQ50AF5O6OfR7F2FPT/YhFXTRe8wwHVus/vtsv6+h1/Lr2LNnrB8G04NemIoPozUBM2Kz41ayV2BPBdfgmwdwZ92hzAbA0rc/XP+ReLOAlAmDbOkX4pIPEHvTNcK+IdlI9r99bOiJnhnmA+tAUKh7TLW++OGAv73f7kruDN5j7YhFjwmg0Lnl2lFlPC4zJKfTGW3JQsyRpDgbrcCIyEg58P2fteqdhCOgrsFDA48zqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwZIQ/0TR5jv9z6GswI4FT2eSBCQ5hb40yrKnEO4ZaY=;
 b=JrcQVC6qwj7BhUisPkSspjPfHg4rJ5nskK1IyqMVSZOSZlY8nS0kY0NcSfXCRDSCwZmk7XE5NHRTAE1YrFs485oVrgj1DiPENXL4jGtR4XRSN3arBJInhPI59LQrQoFelH8PTjrwOAiVEzrR0LtDq0RqC1qzU8/DSC1Cjl1h0ms=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 13:42:44 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:42:44 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL v2 0/8] Fuzzing Patches for 2021-08-25
Date: Wed, 25 Aug 2021 09:42:24 -0400
Message-Id: <20210825134232.45074-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 13:42:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bbb9db8-5956-4a10-be36-08d967ce376d
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4446D635E4A31CCADEDEFCC9BAC69@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2MGT38LxZVeKLStR6RJgieZaqr0rLa0whK5eupO3G+3XG+7N0tDqHzXcWKtOi+mgDEF1h+e+HZo5MJ5gdKSckiW/WnFOJj206kqxJS/FFQ2d0PGmipcchV9vZyHNCiCwjTWIJX8HuPODGN8XztYIRPhRReaecw4MSga4teWO1qo60F7vZyUI05yWv3tjuw5ruP7J6IdpmRGu6OQGfiS21so91epTAtkzn5KgE9uF4YzWFdY75EGF9SyU725459aZbyGh2PlHd7q2Auy9erKObgErryxqxATJZt5Ht55F0fmsDz68GrRF8NaoPoy2uwHN957aUfbdQiByFWd4L3p4rS6sy0nohU7F8asGQauTWblnbBM7WZAqhVGbov9E99eWdvuDs1W3YwAAzYNfGOIHXSPB6lw9COAmfbqTKMJw0mT4qfP9OiP296UtWRZKtS5TWU3wvzqjAZoezYyxmGLOtdsrZVhIeUKF239H9Utgj1ioXsMDZAoGk6Gya19+zTEDbt2kcvSOJ3Kex2HAGB7EjvDbLSXY5YBgvveyXLylAx6Nq73Aix2LSyARWLbXSPmFSUG0iefbHbxiRp8gMUf1Apl1CEOTOztGR9ixZzkEuJgCFA8jvIJv67yOCxn3GSUCG3upDOdU2l4yLZvs5CKRHFKgCHSYf3pWjPYVur15sATEulRuiSOiay4Gj608Cb3S2pmOh3h6+1CU3nttB7np6NYD15Y6UNxGkshRwGNBbqrzmWYbAFwIzthH7te55GLaiLb0NORSkmy/kPXS29WeG6PEcLEgaLvZaVIWrDDG8XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(4326008)(6506007)(86362001)(52116002)(6512007)(6666004)(966005)(75432002)(1076003)(2906002)(36756003)(956004)(2616005)(8936002)(38100700002)(316002)(786003)(38350700002)(83380400001)(26005)(6486002)(5660300002)(186003)(66946007)(66476007)(66556008)(478600001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG5GRVk0dDZHZjJjemY4TUVSRjBXNnRONmpYUkt2a3pYZHJ4QjhvWTY5R0tI?=
 =?utf-8?B?SzI2bXlPcVBvL0d1RUJPSzB0bTZEUk14WVVJSU1NNUtVdmxINHhZT1JaeUtq?=
 =?utf-8?B?Vmhra1V4SHhISlFkS1lGUzczMlh6SGdUN0lqczBtNkpHMmNqQ0p5cWtGVjky?=
 =?utf-8?B?bHFkem5Ua1l0R0VHK09qNnEzbWpiN1EvUndMREllWG1GM0FUMmNGcGpRYzZ5?=
 =?utf-8?B?bWxpeStYbHlEZTRhK2I1a29vbm1lekNlYlRvN0tWWWhWakkzZHB5U3pUM3VQ?=
 =?utf-8?B?QXdxd3FDNlR3YlhsNFZnNUNXRG1oMDc0S29RcVMwYXJjQS9uRis2SXV4TUsy?=
 =?utf-8?B?TkxCam9Qb2Rmd0xqc0NWR2N5dlNCRHdoMXdTdXNERVdFZVZsRkJBbHMyeUNW?=
 =?utf-8?B?anNEODZxQm5kQ1FlOEF1ZDVOT0lDWlRyZjNhbWUzaldzcDFZd3kwZVl4ckxz?=
 =?utf-8?B?UjRMYjBGcnhad3NEUks3Rml0UDdyWS9GSEdOVUkwSTNvbkV0ZEhCUThqUmJC?=
 =?utf-8?B?Yk9HYU9OZEY2dEU1WjJUOUdyM29DRnZING1OK0MycTdiUVlXd0NWcVp3VFpD?=
 =?utf-8?B?UDdGVnM2dGY3Sk15TnI2dU8yVlEyb1BkOHpEa0xGb2tHWVRwdWhvUGo3SUpz?=
 =?utf-8?B?ekFxT25MeGRvN2lKdU14Zi9GT2ZzNG1JOVArY3QzbVNxbGJ2UU5MWUN4MkQz?=
 =?utf-8?B?UmgrTmszNTRHMk1yYXRjTm5FK29Wa1pyNUN4S21VaUt6THFDUG9qTUpaOEYz?=
 =?utf-8?B?eU5ROExIUHZWOGNSdGZnQWpxU1Zmam5kczh0S1R1OU5VVElUY0FuSElBZUNT?=
 =?utf-8?B?TEZwSTUybm9YUVRualhsTEhweTFUSml1TXozY3VXZGVIUW42bXRhQWZ3a1V6?=
 =?utf-8?B?dnE4T3RQSEJHb0hlM3U4RW5GREFtNkV1bjUwNmp3d01WTHI0ZVc2dE8vNURH?=
 =?utf-8?B?am15cTRlWWhNSGhPanNiaklpczJ6MmZDSUwrRzJuc2QzVE9OcHJ3WXVld2h2?=
 =?utf-8?B?ZWozdHdNRDZWWEh4MkZHRDZOa3MrK3pTL0RwN3NTWitoeXhsUSszL2JYbjhi?=
 =?utf-8?B?Q2QxVTRTVEVCTzNGMnlkZ2dQYVZzVE0zTTR0MW04WW9aMlpneE4rUTVpOGpo?=
 =?utf-8?B?c05YR0FjVHMzbmk4ZEJPTEh6dm05UlFFV1hMdTFreFNYZTREVWw3MkpBNERE?=
 =?utf-8?B?ZUFUZDQ2Uk5mU1l2bVBhcUtHUjVMeXlaenRVSENvZE03ZjZPUncvVFA5SHJk?=
 =?utf-8?B?eDdjb0QzeERxNGZlT25nMVNqOXBuYmswTkNvSHdUSlQ1MldldXpsdjJINjBY?=
 =?utf-8?B?TkFiZWNHUnE2K2NIbGRwQUFROXhPWXljTjNkbGNmdmwzS3RUNEYyS0pQaUJC?=
 =?utf-8?B?NXZkd2FLYmJWRUdIYTZGS3pRbG5zMUx4WjUvTitaTzdmNEpWNEptRDk5V2s3?=
 =?utf-8?B?VEZuemIwb2hscXdLSGRpV1d5Z1FzbUdJUE9sTVJ2cG1rMXIzR3ZNZTlqeU9h?=
 =?utf-8?B?UkI5Q0UrdjVYNjA2Y1dZUFZPcHJaZCszNU44YTFMRTQ5N2JyNE44czBvUmJq?=
 =?utf-8?B?ZEhNSzArekxsdEF3Z0J3OUtDWUFJeEtTblMyYmdScjNyc292cEpNWTJ4VHlu?=
 =?utf-8?B?UlhsT2t0dThnS2NUZHVvQ3ZZWnNqYWwwNXJRejRXRmoveWJOcGd2d09WT0pB?=
 =?utf-8?B?VU5hWW96SGROT1RaSml4cTJ5NVJVd3NJY1AvZHRKVEJtWTV6dkpFVllyMXJm?=
 =?utf-8?Q?0iHXWoYu4oqccCHkOzn+8LcTcspZ/6mAhbEZvAF?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbb9db8-5956-4a10-be36-08d967ce376d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:42:44.1648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQFTYJryzArZUOK02QJhnGE9eefddQ3xR5+pzZ8m+CK6CM4WjawMfG2UgYpmFW4r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.236.96; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

(Resending, since I didn't send the original PR cover-letter to
qemu-devel)

The following changes since commit d42685765653ec155fdf60910662f8830bdb2cef:

  Open 6.2 development tree (2021-08-25 10:25:12 +0100)

are available in the Git repository at:

  https://gitlab.com/a1xndr/qemu/ fuzz-pull-2021-08-25

for you to fetch changes up to 1818b05bf41665731c9c82da8ea910a44b5142f4:

  MAINTAINERS: add fuzzing reviewer (2021-08-25 09:30:34 -0400)

(This supercedes <20210713150037.9297-1-alxndr@bu.edu>)

Thank you

----------------------------------------------------------------
Fuzzing Patches for 2021-08-25
 * Add Darren and Qiuhao as reviewers
 * Make coverage-instrumentation and timeouts more granular
 * Fix a problem with impossible writes in the DMA callback, leading to
   false-positives
 * Attempt to fix oss-fuzz coverage builds, by dealing with a
   signal-related problem

----------------------------------------------------------------
Alexander Bulekov (6):
      fuzz: fix sparse memory access in the DMA callback
      fuzz: adjust timeout to allow for longer inputs
      fuzz: make object-name matching case-insensitive
      fuzz: add an instrumentation filter
      fuzz: use ITIMER_REAL for timeouts
      fuzz: unblock SIGALRM so the timeout works

Darren Kenny (1):
      MAINTAINERS: Add myself as a reviewer for Device Fuzzing

Qiuhao Li (1):
      MAINTAINERS: add fuzzing reviewer

 MAINTAINERS                                      |  2 ++
 configure                                        | 28 ++++++++++++++++++++++------
 scripts/oss-fuzz/instrumentation-filter-template | 15 +++++++++++++++
 tests/qtest/fuzz/generic_fuzz.c                  | 55 ++++++++++++++++++++++++++++++++++++++++++++-----------
 4 files changed, 83 insertions(+), 17 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter-template

Alexander Bulekov (6):
  fuzz: fix sparse memory access in the DMA callback
  fuzz: adjust timeout to allow for longer inputs
  fuzz: make object-name matching case-insensitive
  fuzz: add an instrumentation filter
  fuzz: use ITIMER_REAL for timeouts
  fuzz: unblock SIGALRM so the timeout works

Darren Kenny (1):
  MAINTAINERS: Add myself as a reviewer for Device Fuzzing

Qiuhao Li (1):
  MAINTAINERS: add fuzzing reviewer

 MAINTAINERS                                   |  2 +
 configure                                     | 28 ++++++++--
 .../oss-fuzz/instrumentation-filter-template  | 15 +++++
 tests/qtest/fuzz/generic_fuzz.c               | 55 +++++++++++++++----
 4 files changed, 83 insertions(+), 17 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter-template

-- 
2.30.2


