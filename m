Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5352538769B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:34:49 +0200 (CEST)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix3o-0005se-Bf
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liwWw-0007UE-5B; Tue, 18 May 2021 06:00:50 -0400
Received: from mail-eopbgr00133.outbound.protection.outlook.com
 ([40.107.0.133]:45230 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liwWq-0003Ko-VW; Tue, 18 May 2021 06:00:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqohdViJZbhKo0BuzYLLgaG7XGUxSs1DDnFxJUDcijvDBGTNHFNIz/gjDu1fQEFbQNVvgXGLHKVsulVqZ8K8KP3rexO6XcIQOi/goRYaxqm85YwN4MsZntkUmdfY9onEfNby7QMhUNU+hpFrBYpThwWd9nSCvec6wzHthZ6omhqCySu/TzZPAxmmMnERifJHMuDL7ATOq2V4TUJ2FYegPYqwjqjNsEN5zocmyY//MtoQz3WczQOTh1RJlP6EUu0P7G3fQltmbEZ3tzhLbVE/mjEKH0xjm350iIBo9mNf5iZKtbmz9MTNQh29dBJtn1j+z+g//NZNvUtIphEErL2a8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2uQVeQALLQ9UT3hCBYdxhfJGd7PwFWcOlYXxFAxa5o=;
 b=ncJuFRH0gAH9z6q5QSAiHJO6Ad60kTgp0ZkhSn3O3QwOZpCv4oaAZgUhy5gjNaYHa0n9qWxcyQEvAJXB8cAnZJxbcaTqC9O9/Pt25Qv0I2svfaTfPeuekeK33nFwMihkPTKOp7EqPTPw+Ryoi7gtS/lgCO28IEKswhobW323gTNs4v1IDrsuUrJJ35jpMxhWgF+e8JP6+42J0IHhNGqAKyLem95v72Y/lh0KGIxpbBHaayahPOo5YP0Q57kef9bwKeOgJ9PVicGz+7hww5UbaLducxc++breSqAT00sm36iEgraFTNiCdpbwzl89QNnQtzcFgtXGyTI8XS+jyAKSvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2uQVeQALLQ9UT3hCBYdxhfJGd7PwFWcOlYXxFAxa5o=;
 b=ln8E4ZGYUSN/0eEGmzox9q1L14LXTWG1DYMMi8lZpqjZMoPdmNfUj6xZgCPstOn5uHDNNdm1kF31nlo+kfemsVj0bGvDgqtsQGTjRDOf4D0J28I1m86oEcLf7cuO63GfOhOqRnwROZQFkiX0EWxx40DKrOvx5jcXgoZtnsnfl9Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 10:00:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 10:00:41 +0000
Subject: Re: [PATCH v2 4/5] progressmeter: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518094058.25952-1-eesposit@redhat.com>
 <20210518094058.25952-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <60139fc9-4856-1dfa-222d-08267cb89c27@virtuozzo.com>
Date: Tue, 18 May 2021 13:00:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210518094058.25952-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: HE1P18901CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 HE1P18901CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 10:00:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77ae5403-8540-425e-180a-08d919e3cbbf
X-MS-TrafficTypeDiagnostic: AS8PR08MB6102:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6102B0A7F8CBE017CD276B0BC12C9@AS8PR08MB6102.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8KRk9v94j0qEudue+gIfbji1iN4FMKsi4UVrOx4JVvqsPVt+HnTpLtGq0yVG3iep0ZCjqGwXmzsiRFgV2zVW0S803li3Rr8ZhWo6FIAfEd666+fAZI03Y2Z/ZEhEzajNcqw4+yw+DfS6lu7NW5nTeoVEXha7oqlbN0U+7Xda8boch99r4BDRMNR1VPWzqr2gjyhVvDOZgqDMDtDidfTKMZHY4baVidJ6cYE9/n1ZjkJtMlJrTE/ihkgPRwOv9TNtZFhng9znafTCD9slqR0Qf7WZv2zjsCEBGZVuQb+OnlPaO30ys3LbJXGpmul/PHRYRUi+nHk3VP2qqglI5krWDHdmaH7NtbZ2ygE6XIOXM44QYjNpepwV1QoB6A0bRsExnYV1DDVrQZ0CWlsDMsCol5a9OfziKdwA4gPM4CdKejCPYhrQg1BUwQm5ulYxHybAcgsDfK/xFWrp525tKbO62b3QRaepbAGAR/ewcMH30E2IACwp94U6eA8ZPfeCQh1FPsuZov4vq9ohiWM3qx3MfAuVLu4/6fdhnhY4iLh2/TYuccKptq1f0rT99xl5AjeKQUX31DYIR42P3NejyC3PXIE3EKne4Tv5qRXCjYhkBSaNqz6CNCWYcKaENDoDKXJgmr6P/7D3vwwgzTUccXviroYwB1cJUZUrrBwQeq7kGvbKl+CbhiftbzF6K3RJJ+1AFANpIojUo6Llu0HdzqVh2uXF4IeFGqfkyyUl1EC/IA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(346002)(366004)(396003)(376002)(54906003)(5660300002)(86362001)(36756003)(26005)(83380400001)(66476007)(4326008)(66946007)(316002)(16576012)(38100700002)(66556008)(38350700002)(186003)(31696002)(16526019)(8676002)(31686004)(478600001)(8936002)(6486002)(2906002)(52116002)(956004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVN4eC8vQlJ6Z0VBTTlrZW1CQWU4L2wzSmVNaFZFcmVxYmZVdEN3VUh4M1JZ?=
 =?utf-8?B?cGdST3hyU3VVdGFPTjlmNExjWUlFcWtUbk00dXhTOEw5OFhsVGY3THpLVUhI?=
 =?utf-8?B?TGNEeTRnYjA2YWdBa0gvbjhEMTQyc3lEbVF5cW5uZUp1NVBEY0J2R2U0WVh2?=
 =?utf-8?B?L2tVcHh1MDlRRmRWc3J6NkVMQ1B1WXlnUzVCNzhWeklYL01qYnkvbHJERGNm?=
 =?utf-8?B?M1BmQXlaOEROWU1SZFczSUExei8xUmFBTlR2RmV1UEhaVzl3Rks0WjlKanFR?=
 =?utf-8?B?QUxyRm5qZzhEQzdLK1Vod0ZyTEJVOVBtT2JzMkJoYjdzRFF3Ly9NWnhRT2ds?=
 =?utf-8?B?VmYyakJzQzd2T2x1MjBtaDBDR2VDb3JWb1JBdG1kdGJ2MmtVUFRvL2p0NmhF?=
 =?utf-8?B?ZEo0VmlaTFNxK3J3SzVxdVF2VjJETTlBemlFbVZSUTRuaXQxakRsVUVsTzJk?=
 =?utf-8?B?MS9OZjE2NFZCMkVvZ1BxY1NPV05wdklucDJ1NTJXcWp5cVVzSk9xVDNVMjcw?=
 =?utf-8?B?QUYxbVJRNDJGMGN2Z0ltK1kwVEdla0R5OHExcWpRbUplUWs4OUcyVFp6aWVw?=
 =?utf-8?B?RFBWeTV3YXRNK3hBbDM1R0hvaHpTUDBIZ05BTEFKeU4wSnF3cm1SdW54M2Y2?=
 =?utf-8?B?K1M1TElCV3Z4Nk1FcW93MjFUL3hrc1Mxd3VVS0VkbXhPTitCTE5iMXNGTUFT?=
 =?utf-8?B?MEQxYVVGalVoK1ltK2hMQkNzcktIc1RQZ3JVUWhpSmcvMXZjTnpNaVJmRkJ5?=
 =?utf-8?B?dUc3Nmk4UlNYRlhraVJ1YmtNQ0hRV2xFd3JqeXZYdlNIQ1lNRFVmSThzUGh5?=
 =?utf-8?B?THMwL0MrUjdDK3pKUWNab2QxME94MEk1czd2WTJRVUs0YWd5THo1R2NWSVFB?=
 =?utf-8?B?cHozSmJDWC9mR2wyZjlYemE4a2dpNEZONEFJbjl5bnlERmRVOEJVQkZ0VGdZ?=
 =?utf-8?B?MktjUjJCSXd3akJicjRQb0tUM1ZaTVJrWHVrVVYrUE8xZ0RYamcwRVFBcWFh?=
 =?utf-8?B?N3ozampnOCs0UU84dGdGTi9PN3lSVW1FcVRVaHFPejNEVktxQTlPTk5BRDRo?=
 =?utf-8?B?YmxMMVJkQU5oenRHeVlsYU9SUGw2UGVuK0dNTzdWbE95S00zMHJzRjNHMXlJ?=
 =?utf-8?B?UTRTdVpCL2RmRWd1N2tJRkJubzRzTGU0K0VHVk1PZ0FSNG1CR3NvcW1iUTFv?=
 =?utf-8?B?QTBTTjg3QzR2WkVLWEdqT1JiQWpkbGwwT21zK2NvVXdJQnR1Nko2c3ZEUVp3?=
 =?utf-8?B?czgwTXRVZnRmM1NsVGNsQnExRnpjQWxRNEQ2WDA1bnVLcTNHRkdHamtmMzU2?=
 =?utf-8?B?TWZseVhHTE1DQlRNUmlPM2ZTVVRNRDdETklNazBHemtZbE41TW0rdjJRN2xB?=
 =?utf-8?B?NThDY2d4VG54WGFtS2hSYTlCOC9aZlhGa3EzZ0pOY1Z6QUZaR2s5bTU3dzMv?=
 =?utf-8?B?aTRYRjI3cDlyakhrRy9adEhyK2JsOC80cFdJQ2ZMNEt0ZFV4MFdXaW12Z212?=
 =?utf-8?B?dVprYzc1S3NoNGhZZFJadHUxQTkzSGNkdUNiMGV2YWM1eGJWWjUzczUyK0pU?=
 =?utf-8?B?TjVrYTlodXhpcjAwWU5pbEgvT0VMVkx6Qk9GalJQOW1DTFFHZmZTKzg4ekNW?=
 =?utf-8?B?c0hUcGFNVmRRbmRkQmh3YUYzUE5SV09kTG56TjFwZGVvek9WdW04SU1pUHdF?=
 =?utf-8?B?cGJaTXl0MGVFWGZIVnRNc1AwOGhOYnVvQ2VwMVJpYktaVjVHUFlKQmsyUXNL?=
 =?utf-8?Q?z30bwZGcm16zgIja+g3ND4q8+A5KQcga7tHNoXo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ae5403-8540-425e-180a-08d919e3cbbf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 10:00:41.7359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkfGFff7jY//hL9Jp/lr1xu9JobGck9mkBTlI3AcOw3qOV4NAfAR3XrQhhYcH32XcuXwXgBkac0SS+qITMwVxHMzal2BKzciYC02F7YppVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
Received-SPF: pass client-ip=40.107.0.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.05.2021 12:40, Emanuele Giuseppe Esposito wrote:
> Progressmeter is protected by the AioContext mutex, which
> is taken by the block jobs and their caller (like blockdev).
> 
> We would like to remove the dependency of block layer code on the
> AioContext mutex, since most drivers and the core I/O code are already
> not relying on it.
> 
> Create a new C file to implement the ProgressMeter API, but keep the
> struct as public, to avoid forcing allocation on the heap.
> 
> Also add a mutex to be able to provide an accurate snapshot of the
> progress values to the caller.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

patch changed a lot, so you can't keep Stefan's r-b. r-b should be kept if patch is unchanged.


> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/meson.build             |  1 +
>   block/progress_meter.c        | 64 +++++++++++++++++++++++++++++++++++
>   blockjob.c                    | 33 +++++++++++++-----
>   include/qemu/progress_meter.h | 34 +++++++++++--------
>   job-qmp.c                     |  8 +++--
>   job.c                         |  3 ++
>   qemu-img.c                    |  9 +++--
>   7 files changed, 124 insertions(+), 28 deletions(-)
>   create mode 100644 block/progress_meter.c
> 
> diff --git a/block/meson.build b/block/meson.build
> index d21990ec95..90efd21ecf 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -13,6 +13,7 @@ block_ss.add(files(
>     'commit.c',
>     'copy-on-read.c',
>     'preallocate.c',
> +  'progress_meter.c',
>     'create.c',
>     'crypto.c',
>     'dirty-bitmap.c',
> diff --git a/block/progress_meter.c b/block/progress_meter.c
> new file mode 100644
> index 0000000000..aa2e60248c
> --- /dev/null
> +++ b/block/progress_meter.c
> @@ -0,0 +1,64 @@
> +/*
> + * Helper functionality for some process progress tracking.
> + *
> + * Copyright (c) 2011 IBM Corp.
> + * Copyright (c) 2012, 2018 Red Hat, Inc.
> + * Copyright (c) 2020 Virtuozzo International GmbH
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/progress_meter.h"
> +
> +void progress_init(ProgressMeter *pm)
> +{
> +    qemu_mutex_init(&pm->lock);
> +}
> +
> +void progress_destroy(ProgressMeter *pm)
> +{
> +    qemu_mutex_destroy(&pm->lock);
> +}
> +
> +void progress_get_snapshot(ProgressMeter *pm, uint64_t *current,
> +                           uint64_t *total)
> +{
> +    QEMU_LOCK_GUARD(&pm->lock);
> +
> +    *current = pm->current;
> +    *total = pm->total;
> +}
> +
> +void progress_work_done(ProgressMeter *pm, uint64_t done)
> +{
> +    QEMU_LOCK_GUARD(&pm->lock);
> +    pm->current += done;
> +}
> +
> +void progress_set_remaining(ProgressMeter *pm, uint64_t remaining)
> +{
> +    QEMU_LOCK_GUARD(&pm->lock);
> +    pm->total = pm->current + remaining;
> +}
> +
> +void progress_increase_remaining(ProgressMeter *pm, uint64_t delta)
> +{
> +    QEMU_LOCK_GUARD(&pm->lock);
> +    pm->total += delta;
> +}

That's not what I meant. If we move only function to c file, this doesn't make real sense. If we want encapsulation, we should move the structure definition itself to the c file too. Than, you'll need _new / _free functions instead of _init / _destroy, because we'll move to heap allocation for progress meter. Also, if we go this way, please make at least two patches:

1. move progress meter (functions and structure) to own c file, modify meson.build

2. add thread-safety





-- 
Best regards,
Vladimir

