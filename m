Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1559E33C633
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:54:50 +0100 (CET)
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsMa-0000zw-WD
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6p-0003tx-Rr
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:33 -0400
Received: from mail-dm3nam07on2131.outbound.protection.outlook.com
 ([40.107.95.131]:13664 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6l-0006Et-HQ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgFIbNIaXwg4FYmKwndmx11A6K5bVYdpUHSnoEREj+Ly/BhhwMaFyby6n4axqFUFzm8to12xUgrdcuM+wK0NOqKyyxhfiumu3F/zZIph3/o0KvuuzPoXzvB3Q9xsfo7JzgtrjW8x9sHzDIAysenVqWXF2JRcQKpqfOMcKCaHhn9jdYXvQmEN/YnVveEzU8RluaCl2022GfD4okw0x/66t+rLIWUUCeusCRoTOtYrFj0s7IekHHTMi9L1MJ6f3FEzL36464OZum10Rdxn6VJ1QHJi3aMFKukx2+x7pU4mgygH4JsuCsyheu176bNE/jJkyB+eiWNgPnihyDBVg5w+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z826mhxdE9H5T1+NyKk8GmiHOrEDQPXDsNG20gk8Rks=;
 b=OoZ989iaM1A/NjDR/5lFi+gIjCBEWP3HMwbxjNvRbnovCe5W3hC9mtFooN/ikfOgTNIbat1+nDWH2OqWs9RaCTGSM9N7xmnBJ2YNmUjWx/wxlNJBABy8KeRtVxNo3Yf+WDchkqoy3Q0l9JIjB3StxS7YF+0Ff94WLeYDa5L848IdupRuuvQxkcFFLzCq9L0cXUyb4eAOam/dpqt7BEPUw1cloZdY5qLbqr2Fwpt+tTK1OUNq0vbKKc2/j9dFPBs1N99zYZgFqwrC3A5rmy6glJT0CgXIPcSQkKhxRfc7MQSH3T83x96mINTaTIRpcP4Vm5cNvFS6ZSHfrOHDbgQN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z826mhxdE9H5T1+NyKk8GmiHOrEDQPXDsNG20gk8Rks=;
 b=sHIizPujU0iCVGl8W9aHawQzQSWhuvI5N4TwRABeWYv5Y3mKx8zTxJntawoOggD83KTbfGt+eqGLgHGgbIjWxa7Q/G7ZdgWcEEcsU+q5lF4hEjkIic/gXmhvQkn2cVQPLofkUNH4VRKoNmB7OdlEUkqj1R/usK+ZB7We45weOO8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4286.namprd03.prod.outlook.com (2603:10b6:805:c8::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:23 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:23 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] 20210315 patches
Date: Mon, 15 Mar 2021 14:38:01 -0400
Message-Id: <20210315183812.27760-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0323.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 18:38:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7c0ff36-b2b0-4b6c-0fed-08d8e7e18351
X-MS-TrafficTypeDiagnostic: SN6PR03MB4286:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB428680F7FCD9E3FB70184D0CBA6C9@SN6PR03MB4286.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6s2szWk8n2zTZ8WK+fOJfoByXDbJ+/DQ+mnqJp4yLHNTcdeDje+iV6GCODay3kbWEOCmRvqKFYW4M8/wKKU2V3PqjbcUnBfX7tNtWzo8Y0RWzM3sBXfNHXHa5ArbWX0qbvhD3t8e061BWozzMcRIrI1BQVk2D8MfCpjBNcmUQuAKzXGmSyRpC0OuHaDjJ4WmvR4I0kNywz5cUUopJ8LWbP6fapntnWHDJCEqVwMtYBX7VKk+dNOSVsAyYXN37NJ5+4Lf/F5imE7PKcJ6t4hnqQpgnfrI0ZVXj+1l3W5B2YM3lqHeseQFWwdlfRZvkMjfgNpyyM4OvXEksh7TY+Fo7Qvqi5m48d3qtTSxJ62af8D80QxY2M5z8M3PkZorycMThlUWURKdGrDppjunryEsOFsX+R/hwcFd33njuywiPffN+nBihVntTcufavsjGNy0/RGq2dP6ubiW8uDm//PbtNCOT0GUCNd8VPh4yqcU+OkNEDJIQWjvv5vBXX2B6WhXjaRNhYMkqGcCYbmHETcfkezRVkGTeUfHJSJWXSqBt9sIALVdgPwkAG62R6aDCToJpHNRw0tU1KvKGdGD+T8NhCrBOEuJXtuy65Wdfe5QCW4UJi05bL2kLtn/KGesm+kKaQ0nfcWw7eIi13z0e79HrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(2906002)(6916009)(52116002)(786003)(26005)(66946007)(86362001)(6486002)(6666004)(186003)(2616005)(16526019)(8936002)(66476007)(1076003)(83380400001)(956004)(66556008)(54906003)(75432002)(478600001)(4326008)(8676002)(36756003)(316002)(966005)(5660300002)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGxGS0dxSmlwZVlVZ282QWlRWmhUYlMycUVkbzVUdTloQVRyUzBIU1ZWc1dn?=
 =?utf-8?B?REJucnJ3Q2UxQ0dHczdZbldhZHNWbnExa29uQW44Y2wwZ0s2VHdhTTlWWFZI?=
 =?utf-8?B?V3RNYWFvMEJCbkxuUElVc2t5Vk5lV0VOOC8xMW1qT0VWMXZpVVExRjFHSVlo?=
 =?utf-8?B?bUZRR0NIZFZDSC9QcEFuTGV3MHFSL3NLQXA0ZWlJUElySHRZanNLV2dFSjNL?=
 =?utf-8?B?c1pTcWVDWTBwa2daODZXS0hzYVZxTzZYTnpab25YSnE3eWpDZjdOc2RKd3dR?=
 =?utf-8?B?LytnY0FiYVJ1TUtUQ0hxZXkvQkNydDA4cXlNek5qZkxrb3FHZlpRb1BCeVcr?=
 =?utf-8?B?L0NtbXVXSnNxMHBHTGZsQ2NrbGVsRHd1U0MwQnd0YldtYkVLVUxNV3ZmNXpU?=
 =?utf-8?B?T0xNcDJudkdJdWp2aXBxa3A1a1NzSG1vSTNKMlZPYWkvbHNsWkF4WFk3Z25y?=
 =?utf-8?B?SWRUMER4QzNHUndNeVYzT2ZTeWtGdUdmb053QldnRWlpcXdyNUZMWndkODdI?=
 =?utf-8?B?bHl3RE5Qa21IYTkxWVhnanFhL05CdGtMTzV6b0lQc0FEOGcrUE5CcWZydXRx?=
 =?utf-8?B?TXFHbTQzd1JHRXF2ZXhCeTNwNGNIanU4WVAvN0lVVEF6WE9vWWRqWlBlVjA3?=
 =?utf-8?B?S2VYTTdBbWNFWnJnN0lqMy9BakVaZno2WXdFUjQrMFZEbDNIbEpkdHEvQ2hn?=
 =?utf-8?B?QjZQOWxUY2xpOEpUZWlOaC9KOWwySWlWT3UwL2krNzNoamtkV3BDODdxZ2lI?=
 =?utf-8?B?SU1OQ1FlUlo2VmZ5TFJzZDUvbXppeEw3K2J4M0RndFZ2ZEM2QytPNlNHcGxw?=
 =?utf-8?B?NUR5Yk9tZjN1OGdGYWVFcmdVb1o5ZE1JUnJyWkdZWjQ2MmhQb3pCRVpRT2Nl?=
 =?utf-8?B?L05qK0psMEk5SDdnS1V3eGl4dXNyYnpldTJyRjBoRlExaVZ4L2ltU0laTTV0?=
 =?utf-8?B?UTcrU0dDNTRpa3EwZzVvcEVwcXJCNkkyQlN0cFhLNDlvM1dlTFh2aTM3eTRw?=
 =?utf-8?B?OTZOU3dtZmlONGY4OE51d1ZrbEZNRVY5cEhiOHpOYzBPbmRwUTFhUmNMa1pR?=
 =?utf-8?B?SW5mTEZxT2J3Qnd3WmoxTkE3bUxkVk9FOTdmQUtiVWMwTXJEME51OUxIcG9X?=
 =?utf-8?B?V1ErN093QWRKaEZyTW9sTzBobDNieGNCY2Q2YVRTcGhHaEVFdlk1Y3c3Z1BX?=
 =?utf-8?B?bmRldlVIUnYrSjkwU2t2WUNhUElMSEhhLy9FTnhrYmFHb29razZGRmFhR3FK?=
 =?utf-8?B?eTNTdExwamtKSThXTlFkblRHWmdNVlI3QU1RbUM1MUZibTdMYTZIYjVuTVIx?=
 =?utf-8?B?bjBtb1RJdGVKV0llWGUwL0dHSEtlZnFyaGt0bDYxUXcwZHVQeUhNTFlwWDFq?=
 =?utf-8?B?MkR5bkFwTjl2UlUyc0VuL0twMXJKWG55Z0haeTg5cG9ZbW1NL2QwL3NMOEZV?=
 =?utf-8?B?NHRhNXZ6SUNWbWtoY0psc1gwZ2FMTnRrNGJoekExYUNZalcvSWhaT0JCTGtT?=
 =?utf-8?B?Q0pWWERsM1JqTnh6MFBBZ1IxcFRzMStkUFdlaytLLzc3cXBDSGtZajN1R25R?=
 =?utf-8?B?TUxHUW1CRUEvbXYyY2tzckFMb2pUYlJEMEF2MUhGbnNBZU5sZGVST0R0TVY2?=
 =?utf-8?B?aXBOZmhOM2tjdHZYV1d0WXgxMzZiRFNiWWJnTGE4ZEN2ME44N2RZSHRtVGJm?=
 =?utf-8?B?ZWtWWVpJblFrMGlDQjlQUVNJYnBxUHJ6RHFwbHh3blFkSDRySUloMHJLVzlu?=
 =?utf-8?Q?cFMmlb1h8y4EdHyn4vQBUn8V+LeeYJI3BEZnhJa?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c0ff36-b2b0-4b6c-0fed-08d8e7e18351
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:23.2689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+RbsIC3282IiPonJ4kfQ4iLyB09TuCGDzfdMOdvm0JnFKPYW1CqaAHIO+n9Cw6Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4286
Received-SPF: pass client-ip=40.107.95.131; envelope-from=alxndr@bu.edu;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-14 17:47:49 +0000)

are available in the Git repository at:

  https://gitlab.com/a1xndr/qemu tags/20210315-pull-request

for you to fetch changes up to fc7c6fae7e36d2aa19b66dea5f9663cebeefb504:

  fuzz: move some DMA hooks (2021-03-15 12:49:28 -0400)

----------------------------------------------------------------
Pull request

 * Add new and fix existing generic-fuzz configs
 * Add documentation, and a script, for creating reproducers
 * Add a sparse-memory device to boost fuzzing performance

----------------------------------------------------------------

Alexander Bulekov (8):
  fuzz: fix the pro100 generic-fuzzer config
  fuzz: don't leave orphan llvm-symbolizers around
  fuzz: add a script to build reproducers
  fuzz: add instructions for building reproducers
  fuzz: add a am53c974 generic-fuzzer config
  memory: add a sparse memory device for fuzzing
  fuzz: configure a sparse-mem device, by default
  fuzz: move some DMA hooks

Philippe Mathieu-Daudé (3):
  tests/qtest: Only run fuzz-megasas-test if megasas device is available
  tests/qtest: Only run fuzz-virtio-scsi when virtio-scsi is available
  MAINTAINERS: Cover fuzzer reproducer tests within 'Device Fuzzing'

 MAINTAINERS                             |   4 +
 docs/devel/fuzzing.rst                  |  45 +++++++
 hw/mem/meson.build                      |   1 +
 hw/mem/sparse-mem.c                     | 151 ++++++++++++++++++++++
 include/hw/mem/sparse-mem.h             |  19 +++
 scripts/oss-fuzz/output_reproducer.py   | 160 ++++++++++++++++++++++++
 softmmu/memory.c                        |   1 -
 softmmu/physmem.c                       |   2 +-
 tests/qtest/fuzz-megasas-test.c         |  49 ++++++++
 tests/qtest/fuzz-test.c                 |  76 -----------
 tests/qtest/fuzz-virtio-scsi-test.c     |  75 +++++++++++
 tests/qtest/fuzz/generic_fuzz.c         |  29 ++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |   8 +-
 tests/qtest/meson.build                 |   5 +-
 14 files changed, 542 insertions(+), 83 deletions(-)
 create mode 100644 hw/mem/sparse-mem.c
 create mode 100644 include/hw/mem/sparse-mem.h
 create mode 100755 scripts/oss-fuzz/output_reproducer.py
 create mode 100644 tests/qtest/fuzz-megasas-test.c
 create mode 100644 tests/qtest/fuzz-virtio-scsi-test.c

-- 
2.27.0


