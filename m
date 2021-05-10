Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D5378115
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:17:10 +0200 (CEST)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2yF-0007DY-PQ
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2wt-0006Xf-Ow
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:15:39 -0400
Received: from mail-eopbgr00101.outbound.protection.outlook.com
 ([40.107.0.101]:58686 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2wp-0000Lz-Cr
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:15:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOlwaX0IkpgdJE9EFaFKKTIxuFc7F4z1vSAD8r5rMEqqAWMMRnZWQTOWW9cIeq7A9vnIVKo92R8mLG7U3p1NDSloGVdO+CC1TCoL7DNTJ+ZSKdDPxN9XbKYR03NDTxU37akhr8vCEQDYzUcsYc1am+riTI8DbJ7Bx3F0gXnQRa3+Mm6TW9gcg1qvMzjm0qjPzjzHLVX5XvJrMBPVN8Bn2k4umENevkppw1TsssuosyCPJfutfzq1B2pdx70gnuNx/JwBUuQ7cAP3wfJSM6jh3H8/An8MWAYT1Xw/W06ipUEYbJr1QdyBohvDrdylS6UDJPk+bfWcTqzObLMDchqBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfJJFzcNE/mzNAYfrfulvGHs9yhg22lDjmDt1rOpSVU=;
 b=kxiFBSuYH6DMewTfkd3+19pkZMLsMi6hEBrlq0oKZtewjCTJ0lp93IQBcpOgHlD9DQBW9xTdcvpmVW90Rnmg6gx4T6dQXhdkUfCUtDmzpmAIh5Ja38uwon5whEkl/k8oHdfcIG9Gqfw4NYefZ6X7cDO2hKcFLivBOYc5JqcOEjaaRHaA6bQinawySoLY0tAhWwRsFHtLEnkHfPQTLyM4lZv1KmsnM8Bth4Xzm1IxhS2o1Ri1soNjCTb04wofp8APQm7aY/3uiIPW2DC389gWPVIllfOY7+158hcCSmuefl/1YGKW9pTysMWX86+vfN9LWMypoKBobd9iE25TlwfAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfJJFzcNE/mzNAYfrfulvGHs9yhg22lDjmDt1rOpSVU=;
 b=obwMkYzuMQxrUdFtXXfVs4YgncG3AIam8aPRHFwHjR4zBJFcMT0syOsvQvNYc7gaOaU5vOBLGlx7B0VjVGlIAkw2X7xe1a2Hf7ZrFbRQfO9AUyeT8VzutXNOSeLRJ+oYElmHnlAnRdj0AL5WeWFSdHaBdl37Iy9iSbRlJDgfGpI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6504.eurprd08.prod.outlook.com (2603:10a6:20b:336::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 10:15:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 10:15:31 +0000
Subject: Re: [PATCH 3/6] coroutine-sleep: allow qemu_co_sleep_wake that wakes
 nothing
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com
References: <20210503112550.478521-1-pbonzini@redhat.com>
 <20210503112550.478521-4-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <27e5270c-afd4-ea4e-0707-855172b9cff9@virtuozzo.com>
Date: Mon, 10 May 2021 13:15:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210503112550.478521-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM3PR07CA0098.eurprd07.prod.outlook.com
 (2603:10a6:207:6::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM3PR07CA0098.eurprd07.prod.outlook.com (2603:10a6:207:6::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.9 via Frontend Transport; Mon, 10 May 2021 10:15:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ad5142a-94a6-4231-97db-08d9139c8b00
X-MS-TrafficTypeDiagnostic: AS8PR08MB6504:
X-Microsoft-Antispam-PRVS: <AS8PR08MB65045DE64515A84004E249F8C1549@AS8PR08MB6504.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMxqcvFJtJyBVkDT1RbrreWwabNxcwHK/EGodgpym+Rp3R0yawOfOg06mbGHaGWDKklpm44SSZpRD+F9op2n7NHmbTUbqZrrfibH00anbSWrkFKK0qyKZMO78cS2yWehPHQqyuXSMOkwCpxUOFzd7fXhxExXOZUj5n24Tb3hCGp1DxD6OaMmrU/Grs0CsqxWtLYavtma76Kah2P26t5bUJ1URzhskXXLU9gWW+z5nexJ1KCfjTVYBy95Nje9iW9SwG8zS7oyqAERzXSvbVU8UFyYfYtRFRVYBI94AxuH8yHT6Su7f6Ekx4XtPb5DK/tx+uWPg2dLQJKrN1kT/F+3ewzNEBAb6lXA+5xw0RkBTXah2UPFdhp0SFmSECqzvWGnHB7QRpiqppq85Guw+0JiL2ljwq/tIYVa5XeC6rqgLi0o7nKT5JzuMOyvYJHgQ8VrlDKWfMbuCAMJdUidWPO2LJ9fvGkD1DVxNVvXc2iHIbpG/MxlRl7AictLAAYYDYOZAzINII98V0OSfB43HT67nUBP+cKsOLvmjpPzOfUX26wIFPGkWQj059/AXTrkkeYtoEXREqsh4a7+F9nmHWccWug+L3oCCymYWSRqdJSvx8N6L0tpRWDLQAk0/Vbb4tXH3lJZjoYGJcO5ajLSvK8/KVgyUwdE3DmnaplPH//8nawnP0qo/4eqQqWLa7dwb+Q1ny6c7Bi0duu1IhNzHRfIoUMMj+R3MD3boa3RGe82i7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(36756003)(6486002)(31686004)(2906002)(66476007)(52116002)(16526019)(83380400001)(31696002)(38350700002)(38100700002)(186003)(66556008)(16576012)(478600001)(316002)(8676002)(26005)(5660300002)(86362001)(2616005)(8936002)(956004)(4326008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c3B5akVOS1o3RmRBN3pwd20rWWVPWWZlT3cvVWRPQXlNWUJONGEyaEtPZnpj?=
 =?utf-8?B?enV5aXRUNG9ZSE5QdmQ4SFZ6ODkrZzZteHM4M0VHN2RTNlV0TWFrT2ZDNFdq?=
 =?utf-8?B?S05wcTEvQlV5MUNGZVRqVXFDRWUrNURmRzU1Y3VoK21QYjg1QjJmRVRqazY4?=
 =?utf-8?B?emhKMjBjZEExLzJudFlUQUNXQ3JWMyszaWxtNjZ0ZzNzS21ROGh0bitieWRD?=
 =?utf-8?B?ZFpnczVQWTZEYnA1UG91OW1ZRGcwektCWm5xUWRjNUh5dFA2bFpZa0VDU01m?=
 =?utf-8?B?VG5OT0VQV25xR29vMlI1RDhudGlmMStJeUxzK0EvZ2xGdjA3RytUVVRkTlg0?=
 =?utf-8?B?ZTgzRlFpeC8xWDFCbStjMFVwVnZSemt5dTlZQmpHYWtYb09kVFBkdHV4Nk9y?=
 =?utf-8?B?TVBpNWRIVU4zbHF4RTl1NkxqTEZZM0xiS3JISUJwYkdid29tYkxvRXVKWW1k?=
 =?utf-8?B?MldwOFp4SGlWY2ZibTZPVTBKajNuNVM0SjJaRFROd0RCYnFYeDZyME5Ua1oz?=
 =?utf-8?B?SG5oMGNnVW0yd0dkWkJjUGJoYVNuV01pcUE1a2NMaGNXMG9RVnFZZHVKUjBT?=
 =?utf-8?B?M25PM2F2SmNHT2RINkx3VDk5a0R4Tkk4SmVhWm1ZTlZpcVd4VW84WU5qQlFw?=
 =?utf-8?B?MzMwL0NwakVHWUE2T2pTL2tkRFZZeXVFSDRhY1loNCtadHIwSTNWYnd3VXZW?=
 =?utf-8?B?MFR5WmhveGFkQkQ2dHZvOUhUL2VmS0c4RTVhMG1OMjFBKysxalE5THE2bThD?=
 =?utf-8?B?cUVJeFVWdUZmcmZiemR0b2M4NWRHbXdUVXhKa1Bzenl5OVQvZGJWdmNKVzdU?=
 =?utf-8?B?bFJYWHRTbUxRVllsNmZNUzNWa1FHUFVvNmFCajhqMDk5cmN3ZnAyN2JvWDNk?=
 =?utf-8?B?dWF6V1hKTGowM0VYRDhnT2lwb2FNK1k0MzdlTlVEN00yMTVRSStTTUw3Q0J1?=
 =?utf-8?B?dElWMXcydlBJMGhtYWlJVGpPdHNqc0xqVUxoeFp2OG9LaExhU2s4QndZTTNS?=
 =?utf-8?B?QTEwSS9SRmRLemFoTzV4cmcxbEtudTJ1bGg2N0VpVUlESjQ2TWFzVTZwb2Fy?=
 =?utf-8?B?ZE1HZHFHNmFmL0hZUXViNHYyM1BuVnNPTkFuT1pJRTlIcy93SGVnVmY4djBU?=
 =?utf-8?B?K0xOankyOTh5YitEMkNqRngzbkNoNzZIZ0RrOFNhUFhBY24xa04wbk9uclNj?=
 =?utf-8?B?SjJCOXExWTNMZVAzMElucWtoRVcxcDM4eXFpYzRaOUZQekREaWRMUE9YYkZ6?=
 =?utf-8?B?dkNRM00wNWQvMFQxajlZTk02TEIrbTRQMlloQy9MWHdIODJRWHZnOWxsRmsw?=
 =?utf-8?B?cVpqZVh2M2loSitpTFlhcDRpV2xlQmJHVC9ZWHY3OGgxcEdZdUtENzJxRVhk?=
 =?utf-8?B?c2VoditVTkR6WlhIRkdHMnIrLzVmakl2bkVDQUU2ZU0ybHJaWDhpSURpa0x5?=
 =?utf-8?B?UGdrZ3g1N25oejk3ZlFGcGZSOHJCdEo2UGZQdU44Qk9NUDNUMFl4RmttMnA3?=
 =?utf-8?B?RlN6bEZmOEgxTWNkZnpoZE1tbU14Y25oR2FndnJTTTNwMlRRQ0tLaDlLTzhS?=
 =?utf-8?B?WE9YblZaMEtIYjFxU09Nd2dEZVh0QnFmU2lVVUliK3RyZVl3S3BYUkRBZmtw?=
 =?utf-8?B?R1VzcE1Rem5SMmNxa2NTM0tnUGNIVFdiM0FTbnNhZmM2bHh6Y0c0YnpZdGtO?=
 =?utf-8?B?Z25TV1ZKeWYzdmRndm8wWXV1RklmTUR0eGszdTFUZm8zVjNWd29uWDFSbzdq?=
 =?utf-8?Q?+9ySmmY0M2WEzyNzXiTsG2kOW7bSvGjZrIHNgSb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad5142a-94a6-4231-97db-08d9139c8b00
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 10:15:31.9226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wJCAkFe8KpZfBlmxhwpg0W3846zy6JneZOyc/OU6AjL833LmlARzr782Ld3gON87krU+GTWr95wJu+fe7rT4UHuJ9rnbIf17i6wJJjdS2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6504
Received-SPF: pass client-ip=40.107.0.101;
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

03.05.2021 14:25, Paolo Bonzini wrote:
> All callers of qemu_co_sleep_wake are checking whether they are passing
> a NULL argument inside the pointer-to-pointer: do the check in
> qemu_co_sleep_wake itself.
> 
> As a side effect, qemu_co_sleep_wake can be called more than once and it
> will only wake the coroutine once; after the first time, the argument
> will be set to NULL via *sleep_state->user_state_pointer.
> 

commit message say nothing about change in co_sleep_cb: it now passes the user pointer too.

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-copy.c          |  4 +---
>   block/nbd.c                 |  8 ++------
>   util/qemu-coroutine-sleep.c | 21 ++++++++++++---------
>   3 files changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 9b4af00614..f896dc56f2 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -674,9 +674,7 @@ out:
>   
>   void block_copy_kick(BlockCopyCallState *call_state)
>   {
> -    if (call_state->sleep_state) {
> -        qemu_co_sleep_wake(call_state->sleep_state);
> -    }
> +    qemu_co_sleep_wake(call_state->sleep_state);
>   }
>   
>   /*
> diff --git a/block/nbd.c b/block/nbd.c
> index 1d4668d42d..1c6315b168 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -289,9 +289,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>   
>       s->drained = true;
> -    if (s->connection_co_sleep_ns_state) {
> -        qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
> -    }
> +    qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
>   
>       nbd_co_establish_connection_cancel(bs, false);
>   
> @@ -330,9 +328,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>   
>       s->state = NBD_CLIENT_QUIT;
>       if (s->connection_co) {
> -        if (s->connection_co_sleep_ns_state) {
> -            qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
> -        }
> +        qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
>           nbd_co_establish_connection_cancel(bs, true);
>       }
>       if (qemu_in_coroutine()) {
> diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
> index 3f6f637e81..096eea3444 100644
> --- a/util/qemu-coroutine-sleep.c
> +++ b/util/qemu-coroutine-sleep.c
> @@ -27,19 +27,22 @@ struct QemuCoSleepState {
>   
>   void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
>   {
> -    /* Write of schedule protected by barrier write in aio_co_schedule */
> -    const char *scheduled = qatomic_cmpxchg(&sleep_state->co->scheduled,
> -                                           qemu_co_sleep_ns__scheduled, NULL);
> +    if (sleep_state) {
> +        /* Write of schedule protected by barrier write in aio_co_schedule */
> +        const char *scheduled = qatomic_cmpxchg(&sleep_state->co->scheduled,
> +                                               qemu_co_sleep_ns__scheduled, NULL);

over-80 line (and indentation is broken)

>   
> -    assert(scheduled == qemu_co_sleep_ns__scheduled);
> -    *sleep_state->user_state_pointer = NULL;
> -    timer_del(&sleep_state->ts);
> -    aio_co_wake(sleep_state->co);
> +        assert(scheduled == qemu_co_sleep_ns__scheduled);
> +        *sleep_state->user_state_pointer = NULL;
> +        timer_del(&sleep_state->ts);
> +        aio_co_wake(sleep_state->co);
> +    }
>   }
>   
>   static void co_sleep_cb(void *opaque)
>   {
> -    qemu_co_sleep_wake(opaque);
> +    QemuCoSleepState **sleep_state = opaque;
> +    qemu_co_sleep_wake(*sleep_state);
>   }
>   
>   void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
> @@ -60,7 +63,7 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
>           abort();
>       }
>   
> -    aio_timer_init(ctx, &state.ts, type, SCALE_NS, co_sleep_cb, &state);
> +    aio_timer_init(ctx, &state.ts, type, SCALE_NS, co_sleep_cb, sleep_state);
>       *sleep_state = &state;
>       timer_mod(&state.ts, qemu_clock_get_ns(type) + ns);
>       qemu_coroutine_yield();
> 

Patch looks OK itself:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

(still, please improve commit message).

-- 
Best regards,
Vladimir

