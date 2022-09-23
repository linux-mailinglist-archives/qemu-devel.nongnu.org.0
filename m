Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D95E7786
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:43:43 +0200 (CEST)
Received: from localhost ([::1]:44028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obfDi-0006G1-1u
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obf3C-0000uL-8l
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:32:50 -0400
Received: from mail-db5eur02on2121.outbound.protection.outlook.com
 ([40.107.249.121]:1027 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obf38-0003A2-Lv
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:32:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euRpbnptiNU5ATkYOmtiMUBahIZejPzlnliDI1uEhaVvqn5dk3He6iuLrq+4jTaIAlBobgFxRqU/C1C3ndQ7j8zBMGUNgTzCFvK29APmlt6Q0d2c2MJcC5gVqKmfdQYiMjrjiWiCz3dm5U21SpMsonA4gPzsOvIQEsXTYMKGNgYakVroQuJQTJQ6s4KrawGkHUSDl2fTrcW92VLGhaoJKpla8Ug3+HEeaDGcsdypx/jhzqgsVZ0nygHtTbj41oNElhhFvu67TNKsk9GAsS1zyyU3JaA3iTET1+BCAVxuyRseAz3ZeHN2/EYSsDehoouyMCyx/y0nDS1Z/ETg8o6ByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07NRDJ0q0FIwWpykTo7Flf/6veSaA0S20BWjmdpaS/E=;
 b=b6BNzbMPrd9aGt6ZIMbleHfkVNLoX8g/f8PWXH4bdJML4XEvn0BYX5LSXYoMI0XEAiv52bDukrrKzIb2XBtDcXtaCEthwTISrYrdR59S5vtoSKh553eSJSOYQGX2htDpK6OvzrM0ZtPteFLtHyUOb7vIMBeBaeOmMsahuHJ8Yi9aYN9CYQUDLSyhLupO0//yM1XIBI23GzX6LfZ75zcy60/+D/WanOWPJ+fGr5ypbWhchxbHCIrKd4S1YgBXRmvV9MblRfpSUaunNwFo8AAdISNc6dG5Bzg7PusHORnuSLCRZAa0aI6EM5Fd3mFbrj/xu58Fvp3gI9Bwq1mop5+Ggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07NRDJ0q0FIwWpykTo7Flf/6veSaA0S20BWjmdpaS/E=;
 b=X1blugkM3+u4WDGLdxjIr+ufXrtcExQkRSicYlsccQhXcESgWcxAZ4cFPxgfQpD7/h1rrvgHqSNeomRsgwbKtsALeeU9mAfXa6FyRPqSpyjt1pX4btwSSPjhIF4fl93WhcrmZP2J7flS44DbuPArRp3jqTcTXNM8iltdTdxUPvPTUxCUM4iMzaDZYags6BkdnDuvVLnzLMTZUhtLwWspC6HLaEy+Dz3pfR2tEbs6s1w9wLD2/kMcyFByFusJNxd5defUtl9rlsTMgJam2vjbl5i3rv8fpad8srTOxyS1wHGUhteBTiP2axGRDMT5dc0ioxxitXaRd5IlwvTdUm+j/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB9814.eurprd08.prod.outlook.com (2603:10a6:20b:615::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 09:32:41 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5654.019; Fri, 23 Sep 2022
 09:32:41 +0000
Message-ID: <0285ce19-5e91-96d9-e294-2972468447a7@virtuozzo.com>
Date: Fri, 23 Sep 2022 11:32:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] qga: Add initial FreeBSD support
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
 <20220922132001.940334-3-alexander.ivanov@virtuozzo.com>
 <CAJ+F1C+Hf2TUjFVf1tJdH7r+mepgFqD9pVQPQXebnK7YQ4DpRw@mail.gmail.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <CAJ+F1C+Hf2TUjFVf1tJdH7r+mepgFqD9pVQPQXebnK7YQ4DpRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: 688d7f1c-3ff3-4869-e224-08da9d469012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oWHZdNQyFOv6I/MLvNGu/dzJZ20YPg/JtnHqhjaJqhBo7V75qk4WxKByuyh9ESo6c7XmtkHky1UbeYg05yPZY7SnB5DLaa9ntsSFuyuzeKPaNGFlQkmP8qTwUE0Sl+7/ZrSqBG0tsBLFShzERhAc+LWfHNwRMsW+LjUfCrPntLjRZhZ2/wE6+RFlOzZyelEXUBbqKtJESFOJ7+XG+G6JSirOBPHcWTSx7mX5lvHGr+/d+jnNdEdCBpbVx/fwDyQKHPh4CRcsJNfcmsuDpFCQyIyHKuXz/44LFGdWFYYRlY4nabjSvQoPNhBn52qGnNx2YN5Vy57KUHD4j165+pDUuO0LzbB6c1DQfU5BuR2jevAgIoGlbp6U0uW8yqO2t6LzKFWgSV0EatxQhvvA75lRTzD+3r1IKvkvJ3n2Mo81RFLD8LyOR8VzEP+4JW0mlDTsmiFKNyDvoomNJfM0ny2eWMsq+w4jcV1HzOfi0H9Qf5Tz7hEpRf5ev4kn/+tCZRPeoF+MZperqrzL5dM4H5WtQDG3iyHDlzlVrpW2A0Fc7cnO1RhZGTdULlEQNMWU1QtlvFTSd39O4nywJ/cw4d6crOqinrM+oOShsTr95qjijF4GPZcocogGGgJe4gD5+HWn9D4uktbM0xN3ANykagA57hSl9J1dObWQaRoif+mO/3r6rmSdl5dNIC6CStxh6xRRTcooWUSUSSlXoDj0aEdD9JbuTHdxzyR4xaEjrk+TZmQDjRXIoY4fEJYt3e25tGUbI8ndV62krckHs2FAgwQj4qIEVult8PmTWr5vKsgSacT9ZWVQj6JG0vjWNjOM6pkmQhPXglw+1Rxz7ESPOAx80A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(451199015)(6486002)(6916009)(478600001)(31686004)(36756003)(5660300002)(6506007)(53546011)(316002)(26005)(6512007)(52116002)(41300700001)(2616005)(2906002)(66476007)(44832011)(66556008)(8676002)(186003)(8936002)(66946007)(4326008)(38100700002)(86362001)(83380400001)(31696002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkZtbkRHNEk3LzhpTFpGeTk3bVFGTlA0MmlpSmxDQkRYdU9DUTFGUWZYYUtu?=
 =?utf-8?B?SEdUOFpsN0lreEppL0Mrc0sxdFd5SEloRC9YV1dRSUFGZkVqcERYQ2UzVGsr?=
 =?utf-8?B?NU1hY2tyUXhFSFI5bHFES1FRMHc3SXB3MXA3T0NGNWtPUFQ4bWlTUFhBVEd5?=
 =?utf-8?B?ZGlRU0w3YktGeHdUWHdJUkpjYW50Zkk4QXlXbStDM2RheTNHY2o1ZlJZdHJp?=
 =?utf-8?B?aUFCTmRxKzRyU1JBT0szMU92MGhMaDVvcU82QkN3RVh0WEllcWZ0b3E0VWd2?=
 =?utf-8?B?dXpHNytCdEdaVEpRVUJXa1YxUldnMnJRV2MzZ0Y5OGJkY0dSWkFuSkI4RmNh?=
 =?utf-8?B?bXRCaEdYWmJGOFhIWXNiZXVPSTRVc2pxczZ6TjFLWXE4a0M4d0doenFEaUZ1?=
 =?utf-8?B?eWF0aHlqZ1dVWVgyYkJMMUlXQ0lYUnRPbnlnbEZtVXp3V3BLUUZyYkkxNWlE?=
 =?utf-8?B?U3IwaXV6TWFsK1BUNjNOMkZ4V0JEdFI1aWdSd0JDdXlndmRKNUdEMWRFS25E?=
 =?utf-8?B?eXhCdGtxN2Z0cEZCbGRGWlpKODlVTGNuR2JlVjRnaTQxZ0JRUm1mTHN3ZE8v?=
 =?utf-8?B?ZWdnbTgyZXVoNlJIdnZSL3dFc0gvRnl0YWZ6WDdHZFpnSHk0RjV2S2tyMzhH?=
 =?utf-8?B?dmNTd1ZIdW5jdlFkVHpFekJGYUJSdWRMVDRjZjJYeWtNOTB0WWdYY2FoSEhm?=
 =?utf-8?B?ZU5hWEhsRWI5UXAxUzUyU3NvZVVCWlZYbFpCT0lRM3ZQT2ppNkVhSklvbUQr?=
 =?utf-8?B?bFZrb2FKQWFFZ3FpRWFHUGxleXVzWDB2UGt0dVZVcGFmOXVnWVFWM21UTU50?=
 =?utf-8?B?RXBkTTdVZjQzT0dzMjA0RmZmSk1nMHJJWVIxbldIaDNhNnRMY29MUmJQb2xR?=
 =?utf-8?B?WVpTN2RLVkJ3TitmWDBQNlpYRXNqd3RkVXh2NEdTZkxXWEpUV3RmWm5pcnc4?=
 =?utf-8?B?dy9aRFZ3Zy8rUWpmbzlTcWlwR0Exd014UFcwNWRSaWJKQXVjbzZ1NzdkSDRp?=
 =?utf-8?B?Tkl6Um94SDAyZndqSkJJVlNqL3B1NTE4dVFjVjhYa05RTWJnbldZSXpTYTh3?=
 =?utf-8?B?RnNuNDBjUG5nLzgxbmFiTkRIKzIvRE1peWY1UDFyblh5VE91NytBb0trRXAy?=
 =?utf-8?B?dlAvN2o0NFFJeC8yMWFjaS9hb3BhYzVkZEhoYkZUeENkRWp6UGdIcHBuWFYw?=
 =?utf-8?B?NW9DMldUY1ZqME5lWFlFSWRQbG1aeWhWWmFNWmgzWlpRTzBYV2xwNFZxSy9G?=
 =?utf-8?B?Y25zT3BIYXFBZTdHd3J0QS9tRitYK25JanVmalZ4WHczSmZ0akl6OHA0T0RE?=
 =?utf-8?B?Rlk1bFZtVkRyQktrNjdjWkRWd21wc3pjSVVhekpnNTdGazJaVU1Lc2F6ZTMx?=
 =?utf-8?B?Zk51TWN6NHZKalY3T3NSV3VXbktrRVBqeGhCNU0wVG1XYWRPcVBrSE9kOXdM?=
 =?utf-8?B?T3J2cHdVWWMwdEtJbitMdXhzSWczekI2dWxRK1lMd2pNRlBXTUZMMzBpLzhm?=
 =?utf-8?B?L2dNUkkzRVFKKytXZENIdUdyNmR4WFF4KzNVZVlyblRjdDhaYzJLQ3RHd3JW?=
 =?utf-8?B?QytQVStXdmRKNFQzWEwvUWhHWUZHN3NUVHowblRYUGMwM3pVTDJ0RkFHeWxI?=
 =?utf-8?B?QTgvV2dDbWsrajdnOUN5TUpsK3g5ZElVRXVaOG8vS0ZMUEVrK05lTUNjM0xF?=
 =?utf-8?B?b2dldGhMSCtxWEdEWGtOKytUUnZyeGtWTmtpbXlDZVJwTGYxbWZsSmFWam5j?=
 =?utf-8?B?bUZCZFpobnREZ282V0k0KzA5T3VweFVYaktPemxNTlgxZ3VrbUV0UXBpZk9n?=
 =?utf-8?B?WXBCRmZqMkZGOXhBb09PVlVaR0JmazJ1aVB1OVkwb0RmZEIrMnBBQ0xOeWxC?=
 =?utf-8?B?ZG81VjUzWml3RFZVS0s5d1l6YTBOcmM4UmxsWE5mR2x0S0ZUZGNyQ3BaMWd1?=
 =?utf-8?B?VENzT294eUtWLzVweWE3b2NqMFhrM0lXK2VhOTJ6eTBtaytrTWVWV0xOYVNu?=
 =?utf-8?B?K1VoMEFOTU45RlRqVlpERTNHNzNyUXZsTFRvSWJBbmExQXpKbUdwZjJacDBH?=
 =?utf-8?B?MjR2UHZOdXFFRDZqQWoxdFY1a0FBbVkwanhBbS93VSsxakhHTXF4ZmRGTVll?=
 =?utf-8?B?MmJYR0NpajZwclVVc3dWVlJTOXZVTE5WdEdBRCtsRU1iQ2w5UkRQbzNJNTl4?=
 =?utf-8?Q?bNE8pI7j+u57uNLIoMswoMs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688d7f1c-3ff3-4869-e224-08da9d469012
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 09:32:41.8024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkD6ja9cdUNF/5TLAHZvbB6kcXHl+PIBzNNaGRiPu0hU1fWET09vIh0vsgwogWT17lrKFdEZNOCwe0WRNDrrFcSzMTTS5b5gOPrQgMIUxLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9814
Received-SPF: pass client-ip=40.107.249.121;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.893,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 23.09.2022 09:56, Marc-André Lureau wrote:
> Hi
>
> On Thu, Sep 22, 2022 at 4:28 PM Alexander Ivanov 
> <alexander.ivanov@virtuozzo.com> wrote:
>
>     Add commands-bsd.c file with dumb functions, fix device path and make
>     the code buildable in FreeBSD.
>
>     Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>     ---
>      meson.build          |   2 +-
>      qga/commands-bsd.c   | 121
>     +++++++++++++++++++++++++++++++++++++++++++
>      qga/commands-posix.c |   6 ++-
>      qga/main.c           |  11 +++-
>      qga/meson.build      |   3 ++
>      5 files changed, 140 insertions(+), 3 deletions(-)
>      create mode 100644 qga/commands-bsd.c
>
>     diff --git a/meson.build b/meson.build
>     index c2adb7caf4..574cc1e91e 100644
>     --- a/meson.build
>     +++ b/meson.build
>     @@ -75,7 +75,7 @@ have_tools = get_option('tools') \
>        .allowed()
>      have_ga = get_option('guest_agent') \
>        .disable_auto_if(not have_system and not have_tools) \
>     -  .require(targetos in ['sunos', 'linux', 'windows'],
>     +  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
>                 error_message: 'unsupported OS for QEMU guest agent') \
>        .allowed()
>      have_block = have_system or have_tools
>     diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
>     new file mode 100644
>     index 0000000000..c1e3ed13e9
>     --- /dev/null
>     +++ b/qga/commands-bsd.c
>     @@ -0,0 +1,121 @@
>     +/*
>     + * QEMU Guest Agent BSD-specific command implementations
>     + *
>     + * Copyright (c) Virtuozzo International GmbH.
>     + *
>     + * Authors:
>     + *  Alexander Ivanov  <alexander.ivanov@virtuozzo.com>
>     + *
>     + * This work is licensed under the terms of the GNU GPL, version
>     2 or later.
>     + * See the COPYING file in the top-level directory.
>     + */
>     +
>     +#include "qemu/osdep.h"
>     +#include "qga-qapi-commands.h"
>     +#include "qapi/qmp/qerror.h"
>     +#include "qapi/error.h"
>     +#include "qemu/queue.h"
>     +#include "commands-common.h"
>     +
>     +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>     +bool build_fs_mount_list(FsMountList *mounts, Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return false;
>     +}
>     +#endif
>     +
>     +#if defined(CONFIG_FSFREEZE)
>     +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
>     +                                          strList *mountpoints,
>     +                                          FsMountList mounts,
>     +                                          Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return 0;
>     +}
>     +
>     +int qmp_guest_fsfreeze_do_thaw(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return 0;
>     +}
>     +#endif
>     +
>     +GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     +
>     +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     +
>     +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     +
>     +GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     +
>     +void qmp_guest_suspend_disk(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +}
>     +
>     +void qmp_guest_suspend_ram(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +}
>     +
>     +void qmp_guest_suspend_hybrid(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +}
>     +
>     +GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     +
>     +int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus,
>     Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return -1;
>     +}
>     +
>     +void qmp_guest_set_user_password(const char *username,
>     +                                 const char *password,
>     +                                 bool crypted,
>     +                                 Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +}
>     +
>     +GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     +
>     +GuestMemoryBlockResponseList *
>     +qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error
>     **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     +
>     +GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>     index 0bb8b9e2f3..3a1055d5c3 100644
>     --- a/qga/commands-posix.c
>     +++ b/qga/commands-posix.c
>     @@ -31,6 +31,10 @@
>      #include <utmpx.h>
>      #endif
>
>     +#ifdef __FreeBSD__
>     +#undef HAVE_GETIFADDRS
>     +#endif
>
>
> Why? leave a comment in code please (or in commit message if it's 
> solved later in the series)

Now this code break building in FreeBSD. Maybe I'll add a note to the 
commit message and add a patch to fix it.


>     +
>      #ifdef HAVE_GETIFADDRS
>      #include <arpa/inet.h>
>      #include <sys/socket.h>
>     @@ -763,7 +767,7 @@ void qmp_guest_file_flush(int64_t handle,
>     Error **errp)
>          }
>      }
>
>     -#if !defined(__linux__)
>     +#if !(defined(__linux__) || defined(__FreeBSD__))
>
>      void qmp_guest_suspend_disk(Error **errp)
>      {
>     diff --git a/qga/main.c b/qga/main.c
>     index 5f1efa2333..22b3c0df11 100644
>     --- a/qga/main.c
>     +++ b/qga/main.c
>     @@ -45,9 +45,14 @@
>      #endif
>
>      #ifndef _WIN32
>     +#ifdef __FreeBSD__
>     +#define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
>     +#define QGA_SERIAL_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
>
>
> The same path for serial and virtio?

Hmm, I saw such an approach somewhere and it works. Will investigate this.

>
>     +#else /* __FreeBSD__ */
>      #define QGA_VIRTIO_PATH_DEFAULT
>     "/dev/virtio-ports/org.qemu.guest_agent.0"
>     -#define QGA_STATE_RELATIVE_DIR  "run"
>      #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
>     +#endif /* __FreeBSD__ */
>     +#define QGA_STATE_RELATIVE_DIR  "run"
>      #else
>      #define QGA_VIRTIO_PATH_DEFAULT
>     "\\\\.\\Global\\org.qemu.guest_agent.0"
>      #define QGA_STATE_RELATIVE_DIR  "qemu-ga"
>     @@ -1475,7 +1480,11 @@ int main(int argc, char **argv)
>          }
>
>          if (config->method == NULL) {
>     +#ifdef CONFIG_BSD
>     +        config->method = g_strdup("isa-serial");
>
>
> Why is isa serial the default ?

I think, an answer "because it works" is not enough? =) Will investigate.

Also I've read all your comments in other emails and will fix my patches 
accordingly.

>
>     +#else
>              config->method = g_strdup("virtio-serial");
>     +#endif
>          }
>
>          socket_activation = check_socket_activation();
>     diff --git a/qga/meson.build b/qga/meson.build
>     index 409f49a000..456ba4c29f 100644
>     --- a/qga/meson.build
>     +++ b/qga/meson.build
>     @@ -75,6 +75,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
>      qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
>        'commands-linux.c',
>      ))
>     +qga_ss.add(when: 'CONFIG_BSD', if_true: files(
>     +  'commands-bsd.c',
>     +))
>      qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
>        'channel-win32.c',
>        'commands-win32.c',
>     -- 
>     2.34.1
>
>
>
> otherwise, lgtm
>
> -- 
> Marc-André Lureau

