Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723CB3B425E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:18:20 +0200 (CEST)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwjqk-0006o3-Vl
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwjpi-0005yW-BH; Fri, 25 Jun 2021 07:17:14 -0400
Received: from mail-eopbgr130127.outbound.protection.outlook.com
 ([40.107.13.127]:45646 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwjpe-0003gh-QI; Fri, 25 Jun 2021 07:17:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYEBGQstI4aMuBSX21+V0OwCzOLA/8lbP4dEoGP6TXiORDYL+KAafeNEPVAti/AYScaDA3fwNwTfTyR/m7VDJVQaK5E9tq4nRC7dw8Rp+1BrT9Oo/n5i3BN49s/SX8lMYgxDgwD/nsDtOSynA8DppJbq6SbUentpeLoFR74w/UH3E+H7HJaUDJ9UweJexG6cAujA8X6Cj0u/ViJDLZnQ7Geq+s6p5BCMQIbH7qUZglgp7ZxTHJFBTXSkfCK1WmcmB1QYrEeC0L2ONXj+iuOThXbwcSdyr4JoFsZ/hJzTuQrAs+evme94hpLVAN9Ga0h5gHvfAqKzi0o6/HpQ1hBQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GU87NOyBeA7PqNMNpCrXu/pKwqs2HMnHlWgLErWzw/U=;
 b=lqMzMNGPR5EhhJKO/2CECTr1HJwNp/85H+dQWajpYA6Wt+Rb/lo9YPgDxXTrT+N1pNxmR2GRe5lUsnLrCP5xpezNDAaXOoQHJLeHyfkfs9uLE6qpykFT0wdB+xMAZlT84CtCfnTA1fCCTxl0UGOvIx1bUgaUf2cIm/QM4wS9fHD7t6gWTJV6T8YVO0htkQy54Q40rGkK4pYSDEvRar6+iZMHToztge4FSCNwKoemyrx81StL2MtPy85Q3zRkAj95ujY8rIdz7OwxMNqgccDY1p/aPAfscjNUnHhnZUDRmT6PXI4b72RByqFLEeYAbMJK1+69JTU8fKJvNQfQLEjP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GU87NOyBeA7PqNMNpCrXu/pKwqs2HMnHlWgLErWzw/U=;
 b=tK/Av4Z9tPOBThZfSL9CvE9/iGJsIXsZ01HnpoMkf+dfzFALaM2UHOikk2qL6kyC6JBM5q2GgKmvMy210jVWkZ65v78t4yy4uIhOLIAE6bglZ+RGtjaQNi8SDY92Et2R24/LwYeONuGhTUEdCdamJXVORiKzizc8K55F4Kotc6g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 11:17:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 11:17:01 +0000
Subject: Re: [PATCH v5 0/5] block-copy: protect block-copy internal structures
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210624072043.180494-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ff63fba2-007e-85e6-6e87-d1961dd3ce2a@virtuozzo.com>
Date: Fri, 25 Jun 2021 14:16:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624072043.180494-1-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR07CA0024.eurprd07.prod.outlook.com
 (2603:10a6:7:67::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR07CA0024.eurprd07.prod.outlook.com (2603:10a6:7:67::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Fri, 25 Jun 2021 11:16:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc37583e-906e-4e8c-f3cb-08d937cac0ca
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6805F21B3B87A03489DE364EC1069@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EODJSrs6Rg8EbJINAys2hDVI4NNAgAPLxfL7KMN1EgaKjrgEhsMoT4hRexnqDRVVbBiQQ/4nNfgoDHgbIJwz8NHVm5n5pFLzt2QYispCv029H6QpVjdEFSzfqY9wXZ0yqn/mn5MousgG6tI0omXFYpyQ52Qq2vvssgQYZjQZ81gDASzvNhSs63Q/8fCGjy+CuYhereaxTEiqr6Ip22RU/r3MRx1vEMyDgMDruAGwkXI6nTYwbx1739nJGZTpHeMeijCXhVdmC7WdosdNWgPgnA7I78Gx1l6Z+Q5qVd3Z2DoefRO8r51xaJZ+j3OiCHUYlyPeH9VSGP8A5sr8gG9CAULuubQZgm8+SMGB43/1hDdUfaXyJVhh0oRT2dUEqWHF/j69N4gPgrN47ISzbHa8uwcMJob4vru3V/Gm6kZRlH34Roo/2FVvm3xKhzssTEXmu3wD1i8u95NDXjWFwZTik2Z37B7e0AoYT5WAEsdYgnEQVDcxUkawGjCdtBd/2II7AE729TDt6SKUUEmH7u7bieRmbJE22kiFAtAq9hyksn+zssXIIC0Q5WSPRzXEl0or9l3/So4C/QbqrwRQ3dPLf1QB3XmOkH3uM6+o2LvjSv1sEwpgV+tpVTw7b7jnoY6d0M3ohu60LuYKF9CitbVjH35jbllhH74HS8wy9DHaFKrPLmY3l54GFRhWXiRFPnvhOYHYuVQXMB0y36xsvR9jew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39840400004)(8936002)(36756003)(83380400001)(66556008)(66476007)(8676002)(66946007)(2616005)(956004)(16576012)(2906002)(316002)(31686004)(5660300002)(186003)(54906003)(16526019)(52116002)(4326008)(6486002)(31696002)(26005)(478600001)(38100700002)(38350700002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0k0alFZcVl3ZWNENFlnYWJ6THN2Y0RlN25hcXVPc211TmlNMi9nY09uTzdx?=
 =?utf-8?B?cHRYMFVMck9yOGdsaWtFTzhERkpHSVF1a3ZjRmF0VHgzbjFJdzlOdHEvcEll?=
 =?utf-8?B?RWdmVFVWTkp0aW16ZmFzdWdsM2lydmZydy9KZFQ3WFpWaWtORlA4TUI0WTlU?=
 =?utf-8?B?aTE4QzdDeU0vOW5Qa0hKbjdiLytyN080eUtJR01JV2lBZjhTRHBqcjhrQlpl?=
 =?utf-8?B?RnRlVU5adUVCNWl6SCs4Sk1BSEJpMzNTNXUvaWZhOWgvWktQZGZ0NTZ3cW5q?=
 =?utf-8?B?THlSKzIyYjNGL1pQRGxYbTNtd2MxcGJkekpLT0lST0tFcTJuU0dDMVkyQ0tI?=
 =?utf-8?B?MWszTlFJVTNUNHFxQTRXaWNRdUtzUmFrc3ovRDNmOEZ6cUY4YSs3anFlemFF?=
 =?utf-8?B?WmoreVppdGY4VEVzOFpHYlM2OUQ3Z0J0ZDA1UlpqWXgwL2hSdGkzallpckIz?=
 =?utf-8?B?M3BlYkhZNmlPRE1JeTQ0WW5mVHdiWFUvTktUVkpkTHAzdnJDeEthM3dGK0g2?=
 =?utf-8?B?cE9MMFZBQlZIWXh4M3owdjBQNVZsZTh1dXFoWFdJZlQ5c01LcnpiSWFBMmJi?=
 =?utf-8?B?WXNqbGwzc25LQ1pwenhPY1pRNWlHamt3UTUxeUVEZXNyU0NEY2hGanpQRUpt?=
 =?utf-8?B?ME04S2d4SFlTUnE4OU8wRitIUkJhSHJLMVNNSjFDVjFUQkdjRCt6UDByT3B4?=
 =?utf-8?B?LzFSYzRndXA3Mk5EanE1OUc1c3FodWhNTmFuLy9WZkRFQ0RLRWRNcTB2WVhj?=
 =?utf-8?B?YkVCanBJcVpualErd1UwSFdUVlY2eGw3ZEhmRG1iZ0hzMnpPWXN5VGNiaXVU?=
 =?utf-8?B?UmlKYTRDMDJkbjMrclBJdU9palQwR1dFclNOZDY1NkJycU8yMlpFM0o3a3RK?=
 =?utf-8?B?aWw1TUdvWXRxUE81TDFzQW5pOCtQVUdSTk1DQ2hCQTVNdzF2dHJuNW9jM2FY?=
 =?utf-8?B?cmV6bzlhZGZEMnFWZlYwM0Y2RlA4cFo2WUtNKzZOaGY2ZUU2LzBiWXhtQ2xJ?=
 =?utf-8?B?M1FNYnVPUC9ERWszNEJJbkdGNndGRHg0K2hrRkVpL2dzLzFwMXdYczcvUzY4?=
 =?utf-8?B?dGVKeUZiMzQ4QnRzVHQ3R09CN0RyOEpaR1dTRnAxRHdNNGZTN1hIL2l3VzZB?=
 =?utf-8?B?V3p3MmVTRThZRGpXZTRMd2t6K09odlpiNTJyenFvNUZlWjJ2cmZ2SCtPTTNF?=
 =?utf-8?B?bGFjbGtMRXJ0SW40UEFUMzh2QWpsczBhbW1KOXRVRDd2WFMvSEhMNmhaaEts?=
 =?utf-8?B?Zy9HQmJGaW1sMjZKL3QxNnVXekU0Q21JckpzRzlPUzBPcGhoek9mUmUyR3Ji?=
 =?utf-8?B?UlJVcHlNQVE2dUNYKzJvT3grQXdSNkVScnVxMnJwcGNhUnd1c214RlV5UFVZ?=
 =?utf-8?B?bGRHV1d2cUFIRCtXbUVva20yL3F0ejRKMG15NmFKdnhJakZuUWx3Snd3LzAx?=
 =?utf-8?B?VEhPN1U1WWJCbnhvVVFLU1VZcitlVGlud3VPTERNKzlRbStuSVNscWhaRVV5?=
 =?utf-8?B?UFRGZ29GZEJaT21TQUoxQ2dGd0lZQUkvVjFTVXFqd0tyVVN1MDVrS1lIb0tL?=
 =?utf-8?B?L1lDQVdTeHVMZjVNMzRSUEpWdzFETmpkU09GQit0OUUrTklEaVdkZzV6NU4r?=
 =?utf-8?B?bGtFM3pNWXhLOGk2R3RrTXo0TjdZVVhYL1lVZkN1elJ6L0o5clBDck5zVVI4?=
 =?utf-8?B?OE0yVll0MnpUb3RyRnlFTWN0ZHpsVlR6UlcrZFUvNEFWUEhsOW5jdy8wM1J4?=
 =?utf-8?Q?a8jNjZdsFd53uVPkQw89n7IAz9AAK3RhUCbrrJ+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc37583e-906e-4e8c-f3cb-08d937cac0ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 11:17:00.9940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7KF14iuylosGFszZfFEevKNfSF4HnMUpXmWNJTc/CS9nzfyKsilLN7THCwDe4m8c/Vp4z9UkJrtGKuwvxIZgktIaA2d3j1XYwLBppjO5i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.13.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

24.06.2021 10:20, Emanuele Giuseppe Esposito wrote:
> This serie of patches aims to reduce the usage of the
> AioContexlock in block-copy, by introducing smaller granularity
> locks thus on making the block layer thread safe.
> 
> This serie depends on my previous serie that brings thread safety
> to the smaller API used by block-copy, like ratelimit, progressmeter
> abd co-shared-resource.
> 
> What's missing for block-copy to be fully thread-safe is fixing
> the CoSleep API to allow cross-thread sleep and wakeup.
> Paolo is working on it.
> 
> Patch 1 provides a small refactoring, patch 2 introduces the
> .method field in BlockCopyState, to be used instead of .use_copy_range,
> .copy_size and .zeros.
> Patch 3 provide a refactoring in preparation to
> the lock added in patch 4 on BlockCopyTask, BlockCopyCallState and
> BlockCopyState. Patch 5 uses load_acquire/store_release to make sure
> BlockCopyCallState OUT fields are updated before finished is set to
> true.
> 
> Based-on: <20210518094058.25952-1-eesposit@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v5:
> * Squash patch 3 (improve comments) with patch 5 (add CoMutex).
> * Better comments in block-copy, drop IN/OUT/State categories
> * Remove some load_acquire in patch 6, replace them with atomic reads
> 
> 
> Emanuele Giuseppe Esposito (4):
>    block-copy: small refactor in block_copy_task_entry and
>      block_copy_common
>    block-copy: move progress_set_remaining in block_copy_task_end
>    block-copy: add CoMutex lock
>    block-copy: atomic .cancelled and .finished fields in
>      BlockCopyCallState
> 
> Paolo Bonzini (1):
>    block-copy: streamline choice of copy_range vs. read/write
> 
>   include/block/block-copy.h |   2 +
>   block/block-copy.c         | 368 +++++++++++++++++++++++--------------
>   2 files changed, 231 insertions(+), 139 deletions(-)
> 


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

