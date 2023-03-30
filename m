Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE276D0C5A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 19:10:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phvmZ-0002zQ-44; Thu, 30 Mar 2023 13:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1phvmW-0002z2-PX
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 13:09:48 -0400
Received: from mail-psaapc01olkn20818.outbound.protection.outlook.com
 ([2a01:111:f400:feae::818]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1phvmR-0005Vf-04
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 13:09:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXyO19TWIMNtKgWHJvd+9PQnq5sOADC5vkbPodJ65NZrU5y7upq//mksziviQCO+qbaO1XGKnaTs42B4wUHzLYIKWirGADx4NFDW+3Gd5eW51Ek7AySfEzoRJbYMxORJ0tnPei96Mh8iixi+ldDpw1i7fnhMCqO7m1E0uQIyh87MzUBpQq7/CtExyQhDoG5MOi6bNpZsDWmQxD72MnPV/xiMgq8eMkZ2dGvNrnwaX6uyR/jOJRLR7ldny8QH4plYQEGhHM4T64yMXXHPy4tuVnaAoZZJX256Dvb8jXjOcKhwWzXcFEsxASlxMNQmTmsMfasEm810+gN8vmjuQJ2+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvS6j3aix6J6vNDTsQwKkzRW55lXjXCYG2UsNYWSgaA=;
 b=KWsDw0AA+bmRCkrj0V6qnvz5AnHvaPdAO+BNvqzf5B/E1l/86T1U0dW/exfufJJPU/PUPwNj8E/zajbi/Hm+4ANWFbvn3ghLeKy/0yqQIxv7KO+NeW1ek/00FR8Zut4KQWpreymgYVkJpt7LLL9G+Cpu6sGBU0U03DNdaHezLBo22IirqvsmAoGRAeU1uvKCt9W/66uWOThU4HltG2HGrVzDgcI+oksnbH8riVxcpueW0syK1HEByIG8/TYeyU3MtkFAxUBj0GivPseUEZCOjCWdikAgUeP/o6K6vO1doaF0Wu1qyDZ3ilkEdEvnEm0si4+4T9vleBrUGykAOSn48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by TY0PR06MB5331.apcprd06.prod.outlook.com (2603:1096:400:214::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 17:09:37 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6222.034; Thu, 30 Mar 2023
 17:09:37 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Yohei Kojima <y-koj@outlook.jp>
Subject: [PATCH v3 0/4] util: Add thread-safe qemu_strerror() function
Date: Fri, 31 Mar 2023 02:07:38 +0900
Message-ID: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [HTX8kMeg1LXZvAv3bH03OdBn3rGrhlOVrEqvF5M9gxKoOou996LQmAu3tq4u2rjw]
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <cover.1680195348.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|TY0PR06MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8bee97-87ec-4082-6ccc-08db31418a95
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sPfh9qOpo9Zh/L3FMmbElv2Sv9IWK66/HnqKvIG2uPrjrMSV5NG/XHxuU/9qg4KlqGPmTVfQYwEEG5f3W3ItoURMhNe3PqTVHoLOR413sNPQdsqZqIwFwqJa6Jah5rSQ+9Q2RhtMOe/olqvQleasyaBtMEugThvaCd5ENVEPJwagiqxMboo+me8A4OccubHQazfmTPsZfU+2SLGHLjYDpodIjXkLVWSRH6m8OT0W/CAPukH7W3MgYf7ivn6nwQud75IO2ONE5AEV4porxnZmtKRuHqWW5wrlJLRWzLRmyYqz7xvbTokL/vGiPrfEamp4w26vZAAhik3a+Uw22J1GA4/AkPA8Gv1AzIgUQcOArGnA+DCME7wZjNmG4jxVdwU548NmDZ4XlmEglRQvjkRmUx7CcN9Y+wRB6OCSdVE5S3C4pIW9e192efNG47d6XLapeA3UfSykddxTwy/2XDrKh6a46wV+EH5zw90EjFT0wZBZX93AcdnrGZvixAOjUq5o7iycA+U7Pl4qV1MT0YITuUu468bDgJcdTZoVwvgtbUwAbg7TP90OHIKF+5uikFZz1VpeWAYjKplPHUtPaasEIQ7eHGqJkHyyPfC4CcWa50v0W5sWn7ks4AFtItimUNPC
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alN1aHI2TGpLWTFjaVpEOCtwQTIzeXE0N3paanFrTWpWSG9OcUdORFA2VHky?=
 =?utf-8?B?OWp3NVVRTFV4K2puM0JNekNyemtsMVlqeDRCS1dwVHdlbDR4Z2ZTRXExMTJC?=
 =?utf-8?B?OVpVWDZLTFFpYm1GRUsxK1pOK0l4YTNTRTdlV2JFK25JN1BqZ2ZTOVh2ajJy?=
 =?utf-8?B?dHBSckxSNTJ3WXF4aGJIVFlCMkdFZnN5b0xaaS9mQ1QvVXdYYncrbkZDWFJC?=
 =?utf-8?B?OEVIeVZKOEVIdzhvVnRERHF5aGlFRnI1bldnVjlnRVR3R3Z3NHVQUjlLY3Fr?=
 =?utf-8?B?M29qRWJpK0ZYTm9EbjlQMmRZZUVGdklNV3AwWDkzSHFlTTd2Tm5BaVZnMHh6?=
 =?utf-8?B?NG1MVDQxS3FoZ3UxalFRZDkxU2F4aUhYT21pRXg4VFpwVjBJTGZlV2NRbDYy?=
 =?utf-8?B?OVRYb2tRVUsvNmFmZ01ycktldDR4eFpsZE9zL2NVeVVFNHZYVEZmMGljZjNq?=
 =?utf-8?B?SEQxcWp6VWFkQ2YzWEFxVmREekcxUlZVR21kZktiNjlpZHFTWXJZRkJjSnVT?=
 =?utf-8?B?aEFaanRCK0c4OFVnVVlwTTZleHNSaVpPVFIwTFBkOWZhNXVoeXhKWGQyN24v?=
 =?utf-8?B?ZG5RVm9KRmZZNmxHNmErS3Z4ODhpa0kwTzJ2S3ViTGxmTHNvT2p4V1dDRVhw?=
 =?utf-8?B?L09qSmVMZDJmbW1wbVJvWW1zNEUvNTZHV3pOM2FFdnlzaFRaUWNWVWFlYnlK?=
 =?utf-8?B?OHlsbkw1OUZSWll5d3IrZTZDZm1GR1o4WWtJc0ZGemhxclh0MDdnQmFSOGZ5?=
 =?utf-8?B?QVhhd2ZrUmVod05GWEw4QkRuQXhjV0l2MEswNHBqaWlNWkdlc1dMU1F3UXRv?=
 =?utf-8?B?RERXbVIxWmROZUR1QjRZQ1pXa2lxMDZRMXNvL09BOUV5b1RjUURUMFBzdVdH?=
 =?utf-8?B?Ky9VWWFwK0QwOFk5ajc5ZTRVaFFwVWVEd3ptaFRYMklUOE14MjhQK1dCeFU5?=
 =?utf-8?B?U3pLS1BZdlB2TGtJQ1BrZlRlSm9acVF0QmV1RzJVQW5ubFNsSU5NMTE0OGd4?=
 =?utf-8?B?bWlIdnJDR3dDMFdORzl6dkhIdWRoVUw1c0I4U1Rtby83SWt0WEE0KzQrUUpW?=
 =?utf-8?B?dTRQN3N4cXdnSGxBYzBqbHhmU1pveTFtSUE1ZThtc21Ka1hqeHZyQ2tGNVZt?=
 =?utf-8?B?bHJTY1dIYk9PbjNoanJkdFZ3cmI1UmZqR1c3NEtLNUJhdW5hMDBmV0VTZG1S?=
 =?utf-8?B?c1IwK2huaG13Y0VWZUZ1VUJJdVhTZUVzSVRQYkVPZ2NkQkpWMkFlTmZYY1ox?=
 =?utf-8?B?VmFteDRrSklPRXpmMXFlNkltWjI5TkFYbDVrK0ZrQm5uSVFkYVRpQmVxZDk5?=
 =?utf-8?B?KzIzU2JGRmJUUHFnY0hjMWF2dmt1d3dsTFFnTUQ5L2NwL0IzZUt5RGVHU01V?=
 =?utf-8?B?Z1JCMDU4Z3lwei9DSzRCN3J3SHp2Z1lJeUQ4TDdiaUJoTmk2aytHRUdzbG1V?=
 =?utf-8?B?MnltWVFuYnNFcjZGaEJVYmYwMDV3blZnb3NXT0h2TkZxWGQzODV5WElBRHh3?=
 =?utf-8?B?RXNUY0VlNzZlMHZaT2c3V3NDZ0RxMTR6MkVEOFlwMFY2QkNMUlJ5cnpTSEFn?=
 =?utf-8?B?Mks5MC82djcvRkxDN1R3MzNQTkZwcnBBd3Q0aHNHYXpNSnFmSDc5ZnNmeE8z?=
 =?utf-8?B?dm50dHM1M0ZOSFdiRWV3NWJueUNpSUJJa1RUMFlIaEcrWkthNFhUdkRuNmVt?=
 =?utf-8?B?SHYySkxydmkrQ0puVVNHMDNhNXBZbHBmUGFBR1pFSlNBbFNwQU5CQm9BPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8bee97-87ec-4082-6ccc-08db31418a95
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 17:09:37.4321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5331
Received-SPF: pass client-ip=2a01:111:f400:feae::818;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch series adds qemu_strerror() function, which is thread-safe
version of the libc strerror(). The first patch introduces the
qemu_strerror() function, and the second patch replaces strerror()
function in linux-user/* with qemu_strerror() function.

The difference between this patch series are:
  1. Add the following patches
    accel: replace strerror() function to the thread safe qemu_strerror()
    target/i386: replace strerror() function to the thread safe
  2. Add `#include "qemu/cutils.h"` line to linux-user/elfload.c
  3. Fix qemu_strerror() to follow the QEMU coding style

The following lines are same to the cover letter in the previous
version.

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

Yohei Kojima (4):
  util: Add thread-safe qemu_strerror() function
  linux-user: replace strerror() function to the thread safe
    qemu_strerror()
  accel: replace strerror() function to the thread safe qemu_strerror()
  target/i386: replace strerror() function to the thread safe
    qemu_strerror()

 accel/kvm/kvm-all.c               | 32 +++++++++++---------
 accel/tcg/cputlb.c                |  3 +-
 accel/tcg/perf.c                  |  7 +++--
 include/qemu/cutils.h             | 20 +++++++++++++
 linux-user/elfload.c              |  6 ++--
 linux-user/main.c                 |  5 ++--
 linux-user/syscall.c              |  2 +-
 target/i386/kvm/kvm.c             | 49 ++++++++++++++++---------------
 target/i386/kvm/xen-emu.c         |  7 +++--
 target/i386/nvmm/nvmm-accel-ops.c |  2 +-
 target/i386/sev.c                 |  5 ++--
 target/i386/whpx/whpx-accel-ops.c |  2 +-
 util/cutils.c                     | 49 +++++++++++++++++++++++++++++++
 13 files changed, 136 insertions(+), 53 deletions(-)

-- 
2.39.2


