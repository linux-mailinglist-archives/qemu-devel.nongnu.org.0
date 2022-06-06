Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCFB53E51B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:41:40 +0200 (CEST)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDvH-00046j-Ue
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nyDqG-0001Ns-Sq; Mon, 06 Jun 2022 10:36:28 -0400
Received: from mail-he1eur04on072c.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::72c]:52134
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nyDqE-0000Mm-Gn; Mon, 06 Jun 2022 10:36:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw/86+p9fyDRfAY8Gt6Ko1qkjbnxaBj5m9TuUijPET3beKJ1i11R6evwEeu0vdwmosNhAMODLhpj8UTGyrPXYsyfp4FHTx9Yyyk4Pwmz+1EFK75Yx1I+aBQSLcSkv4jBqK/mSH8a7xQPYKzLhEtfdu6ZYvctKNwXpTB9VACslMoGSdLlGAyqGdF1F9QfZ6Qeyu+YYZLA/URJDYI2h7AlSvEpJCKeiDVQ/QhbKS+8LtA+FyQTVlBMBw3KJvAtMqodFnd9/dAC52i1cmayeN9UZM+O3nc2aU/KwxgkoK6m3+qWyD858j7RME/EvzikKBgjZB20xW36nTuNRE4uTF/hNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFuqiZmdB6lyaIg8JhWhy0bEWX6mEbq3Mz4SJ+05F3Y=;
 b=S9fBZxs+y2WDCyjDLyvSnFlIFflxgeEiTBIWS634YDUPpgwWrXgVb0FZ4FkDVuZ6WlCA9jHA4VT/JuPyYUO2gUDfJ1llUgQO+1dr19EkLwaGyeREdPj4nR2vPhMf5RSeT5akxodMEZt/u4LVtB2SskHo48xMMeEeX+rCNCWfCRui7MD8dTO+MSS1aNnEBzRRag/R7Ri9985Ey9yci+yBc/k3VOyj/qiQzEVqMtKLw0CT6pTkcwFKxVnlbmuRj3vNQL44iwleJB3hYlbNz98N8PxI67H7CE43sFEzpirMDWXABioljKIgY0ZKfPqJrgRjSp3+12OI6XL7lkcG32fCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFuqiZmdB6lyaIg8JhWhy0bEWX6mEbq3Mz4SJ+05F3Y=;
 b=qG3nGNnjzAelRvHme5NSv3f0QolNCQ8i11c46iYY9rmcprLYELwRkJFBPvPrRxDH4ceYCpylH+pwDqNX9jlEPbc9TLtCOp65twBnkDhCcBYMJTjKnd3PVnQ2nmequWqv6Phtb5gi69Ut0bIGbtybXbMmX1mSYorFk4f+EStZdsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB8PR08MB5275.eurprd08.prod.outlook.com (2603:10a6:10:ec::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 14:36:20 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1%7]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 14:36:20 +0000
Message-ID: <5cd4a337-8e90-d19e-154c-dab6ad017532@virtuozzo.com>
Date: Mon, 6 Jun 2022 16:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/1] nbd: trace long NBD operations
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220530103929.629328-1-den@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220530103929.629328-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0501CA0042.eurprd05.prod.outlook.com
 (2603:10a6:800:60::28) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7924f0a-e2ac-49bc-1492-08da47c9ec5c
X-MS-TrafficTypeDiagnostic: DB8PR08MB5275:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB52757C42D8D69B13CDD75295B6A29@DB8PR08MB5275.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hD90kWuOj5btDfWPyBLdlAungSMUuTg/Ok68ZQyYfWZXJJ92ZXm1CKno4CEmXtMCmTI5xFtQ1D7y5fAjnK2ZmnrYx6tpiRYf4apii45+W4YzNk3V067po7gME2EAvRx2Q11SO0B+cLKwWzbW5Lial1YNPCoyiBM3N5zSzRYN/6aR/cOmJOAzhiXd8h2K18/uQJZHDdNiX7Y2B7RDjVFAOBRiHam0vZM63lFBR4MIXxVU5HPg8PwNXqCRGLlJBFJnCk8MkDFKahHlKhbITV6bDR0YDP0S6igQLmgxA4Gy+ln4UZbMIHZNjaiaBw9b0TgntCSPAnb5Q6j3swMFh7STsd48SXJSaq6pizh3SEOl0wj6xe4O5FlJ23KUCUezzbt8OA+EJ/jnLN+VJUlKOEVTobb/yuUx14jNwBhEMK7GaGAM8UawdWMJBsNqBmMjQUTJBHDfhEf8upFFBx2qR1jIbYODELf1KOVWQ9vfMsL1Pm+CDYdeptw/1Wa2dhuyybG8xyzZqsgZ4+dzLRvRBGVR2+ZAFOQZwo81EdENQVFnA1rZt6DRJ6DvreayyR8i8GbgDSLk4Rui45sj/XIoj9yUzLD5E0/C23SpYtNrOA+f4+HKK8ucjGu/iO1ubtyShSAl9YaIQ/HKhaQFSgMlTALNzWgiEFq5433V25hS1QklQ75DChIuFoSYp6M8b0yFVuXgV6oUNgWApqrVxdwZuSo8J96dOIhywpfUADf7tFueYxFTvRmPwHnVcez62X8w+/2fILBpWWfkK9f4TUZT7bREvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(31696002)(38100700002)(6506007)(53546011)(66946007)(66476007)(6486002)(52116002)(4326008)(86362001)(508600001)(8676002)(186003)(2616005)(8936002)(5660300002)(36756003)(2906002)(66556008)(83380400001)(54906003)(31686004)(6512007)(26005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkV6MWt4NVdIc0l0Y1N5SGdSNHY2b1NlSEl4K0pYancrL0F5Y0tWVFFjbGxK?=
 =?utf-8?B?ZVpGT0tTWkkwOVlSQkFQa04yQnQvREFDbTliR0JreGwrTHlseVVXRVdyMmtx?=
 =?utf-8?B?UkF1OVB1N0h0VG95SkVGSnBISXV6YmROenduYk5xcjZhYkZ5cXM0ZUkyNUU5?=
 =?utf-8?B?R2tqT1NBajlybFRJMlhDaWtlTVUrRk80NVd4R3FnMEVjSjV0K0dwa1pMS21W?=
 =?utf-8?B?OENsVmVzVHR3bTFyNGtnbEIzUWtBWnZ6Tlc1SlJRT1gvYjhFUjJzS2twWndI?=
 =?utf-8?B?MVlxNGt5Vk5PK3NnUnVMWFFxZS9qRURxQk5MaXIrUzhUV2ZKR0x6TDZwdGYw?=
 =?utf-8?B?MUVJWUU0aTZuTVdQa2FZSjFGWjJ6N1Y4dFJ6RDZxRWNJQk9ERE5ldFZqY2h0?=
 =?utf-8?B?dmRBU0I1c1VPWjZUY0NFK0pielRJcmJrMFRidDRocFR5SXo2K1NsaTJLakFz?=
 =?utf-8?B?L040a0t2WnpaZnoyK0lsUzJNMVNUbTBVL0RVQXJQRDlBOTBrdHgvNjVDSFNo?=
 =?utf-8?B?TjU5Y1lpc1l2S2NJeG9vakNNeE54RTV4a1RCSy9PNURKMDZTZlhFTXhWNDZ0?=
 =?utf-8?B?TmZ6ZFdJWmJUazFySTNPSVovQjJGYUhaUjZwU2FDKzB5NUdFNVNFK1BzdlF5?=
 =?utf-8?B?OFhEd1lrNnlTQmR3WXg4aExhT1gzajZVb1k0YmU2dzNjNlJ3WXhlRlR0NWFj?=
 =?utf-8?B?T1NPVnlmYTNSTndOTzBOY1BuN1h5TmhXSitkeVB1NUQ3enh5UGExMkdSQnFh?=
 =?utf-8?B?VmMzQlFRNEhyOXByeFJlV21PaFd3WE5qTFdIZ2d1dnVKVWxnSEVUbUpLQVQw?=
 =?utf-8?B?UXoyUHFSS2ZiOFlVZTdjaGNseDB2MHBsOTRiN09RbW1DZk9nR2tpVFZCSk81?=
 =?utf-8?B?SFc5ZzVBaFpWdFp2Nm9WQ0k3OWF4aVpnUHlFUjY4RkhDNkR2c2taQURHZGZp?=
 =?utf-8?B?emE1UTl0WkJsOVdKYXByRkdtNzZIRmxwMTFaR3R6dnUyZWxYbkN3YXBzZkli?=
 =?utf-8?B?Y0cyNzJOdVZOelIwKzZTQzFmREVuREMrQm9aYVZ5VmNTSWRNZm45K2NYL2ZY?=
 =?utf-8?B?YlNQK25VMk1NaEZiaGRyUkt1MSs0dldNekJNVkpNOEVZQS9NZWQ3bGpYLyt2?=
 =?utf-8?B?YjdGcHhXOXRYQzhlblZIbVUySmRJakRGQm9tcXFJYVVMUHdjUzRSOUhmaE1F?=
 =?utf-8?B?V0ppVDJqSGowL2dvSkxETXk0Rmk2NHowajE4YXNObFh4bEllNnk3U3AxUUpG?=
 =?utf-8?B?SGxvQU1qZjlzeWZHeUhiMFlKTnBFN0JUNW9zQS9KajY1ZW1JUkZXNTcyR3Ji?=
 =?utf-8?B?RFJQZWxXTmE1MUJRSnRxYzF6cWsvWkF4V1o5TGV1NHZzTUYzTXA4eU9nRUU3?=
 =?utf-8?B?TmwwMi9VV3grUWpVZWlaSGdFNHpPZ3pDSHExZzgzbmppZUxqeTkzSkhvMTY3?=
 =?utf-8?B?aFZCWVhaWUJNWkdlOHl4VDc2Y1p5V1RXY0d0ck9BMGlqcFZQQk9TRzM1QkVJ?=
 =?utf-8?B?V1F4eXMvdVJpZ3hUY045NTVsNTdoT281VjFCNmx6M2hBVXN4ODE3cU9wTXNz?=
 =?utf-8?B?MWNXNlNONGxZcitZcmNwRUt1SHR6dmEwcFBQL3YzQ1A0Zzd1WUdaSGlHa1ZM?=
 =?utf-8?B?Z2VWRlBLR0NiS3VhY0UxeWh0ei82WEFLbURjZWV0amZBWjBwUTlFUDhGalZC?=
 =?utf-8?B?ZnB2UHhMeEU3T00va2tEYlVjL05yTTdhNXZ1ZFl1QnozeDJJazE1dTc5eHBs?=
 =?utf-8?B?dmlocnkvcjJQdUoyYVhlTzU1eUpKbytuc2JicjNLVGtjeElGUUJaeVNHQUl6?=
 =?utf-8?B?SnhPdWs4N0RaWXUvUVBUdWlnUWV2V3FUdFRoQUtaY0ZUYkVYVTNvSHJvZjhy?=
 =?utf-8?B?N1lwV0ZWU3FseGYrOGVMeHY2WFVqZklQYXpRQVFuUVdDSVNFbjVuRUhNcFlk?=
 =?utf-8?B?OXp0dFdLZlRFNllpdG5lT2MxeHhvNEZieWdzYmdaUUE1OUZYdWwvUjhsZWVa?=
 =?utf-8?B?aGRqVDdGSy8yRWVFcFRxVEs4MGdmYWpScytRYi8rMUhJVmV6MW5CVG40R0Vy?=
 =?utf-8?B?dXVBb1pqVlJDK3AwSk4vWTdaNys2MWRMaVV1cjR6OTZCUmt1MVgrTkxsS1RT?=
 =?utf-8?B?VHdleGpVcUwzTXNzR3pIZkdyWjErSXMyZkJSRTBZSC9waVB4ZkNKMTFiYU40?=
 =?utf-8?B?aFVkajdaR3J5RndaTEFyUUE3cVp1NnM4bEpFUW5GK0t2U0FEOCtVM0xVZ1ZE?=
 =?utf-8?B?czc5cWtiSGl1S1puNWRuWVNaQ2ZVQ3l1STJXcEdnYkgyVytBVDBLSGJpaVZY?=
 =?utf-8?B?dHpyVVUxMWNSUDZCdmVuZ1M3Vm12allBRmJhbjZjMnFXL0hDREpFZz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7924f0a-e2ac-49bc-1492-08da47c9ec5c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 14:36:20.7208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iuhh/rtUogj788e3B62kuDUO0oYWJrBaJjbtupcOr/n4ksbmXs8px2KrSlUh/o1Dt5ncyRbxbDf8dvXT+qgLQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5275
Received-SPF: pass client-ip=2a01:111:f400:fe0d::72c;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30.05.2022 12:39, Denis V. Lunev wrote:
> At the moment there are 2 sources of lengthy operations if configured:
> * open connection, which could retry inside and
> * reconnect of already opened connection
> These operations could be quite lengthy and cumbersome to catch thus
> it would be quite natural to add trace points for them.
>
> This patch is based on the original downstream work made by Vladimir.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Eric Blake <eblake@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/nbd.c             | 6 +++++-
>   block/trace-events      | 2 ++
>   nbd/client-connection.c | 2 ++
>   nbd/trace-events        | 3 +++
>   4 files changed, 12 insertions(+), 1 deletion(-)
>
> Changes from v1:
> - %d -> %u for in_flights
> - renamed open trace-point + fixed timeout type
> - moved trace_nbd_reconnect_attempt_result above
>
> diff --git a/block/nbd.c b/block/nbd.c
> index 512a53bf73..19e773d602 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -371,6 +371,7 @@ static bool nbd_client_connecting(BDRVNBDState *s)
>   /* Called with s->requests_lock taken.  */
>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>   {
> +    int ret;
>       bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;
>   
>       /*
> @@ -380,6 +381,8 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>       assert(nbd_client_connecting(s));
>       assert(s->in_flight == 1);
>   
> +    trace_nbd_reconnect_attempt(s->bs->in_flight);
> +
>       if (blocking && !s->reconnect_delay_timer) {
>           /*
>            * It's the first reconnect attempt after switching to
> @@ -401,7 +404,8 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>       }
>   
>       qemu_mutex_unlock(&s->requests_lock);
> -    nbd_co_do_establish_connection(s->bs, blocking, NULL);
> +    ret = nbd_co_do_establish_connection(s->bs, blocking, NULL);
> +    trace_nbd_reconnect_attempt_result(ret, s->bs->in_flight);
>       qemu_mutex_lock(&s->requests_lock);
>   
>       /*
> diff --git a/block/trace-events b/block/trace-events
> index 549090d453..48dbf10c66 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -172,6 +172,8 @@ nbd_read_reply_entry_fail(int ret, const char *err) "ret = %d, err: %s"
>   nbd_co_request_fail(uint64_t from, uint32_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name, int ret, const char *err) "Request failed { .from = %" PRIu64", .len = %" PRIu32 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) } ret = %d, err: %s"
>   nbd_client_handshake(const char *export_name) "export '%s'"
>   nbd_client_handshake_success(const char *export_name) "export '%s'"
> +nbd_reconnect_attempt(unsigned in_flight) "in_flight %u"
> +nbd_reconnect_attempt_result(int ret, unsigned in_flight) "ret %d in_flight %u"
>   
>   # ssh.c
>   ssh_restart_coroutine(void *co) "co=%p"
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 2a632931c3..0c5f917efa 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -23,6 +23,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "trace.h"
>   
>   #include "block/nbd.h"
>   
> @@ -210,6 +211,7 @@ static void *connect_thread_func(void *opaque)
>               object_unref(OBJECT(conn->sioc));
>               conn->sioc = NULL;
>               if (conn->do_retry && !conn->detached) {
> +                trace_nbd_connect_thread_sleep(timeout);
>                   qemu_mutex_unlock(&conn->mutex);
>   
>                   sleep(timeout);
> diff --git a/nbd/trace-events b/nbd/trace-events
> index c4919a2dd5..b7032ca277 100644
> --- a/nbd/trace-events
> +++ b/nbd/trace-events
> @@ -73,3 +73,6 @@ nbd_co_receive_request_decode_type(uint64_t handle, uint16_t type, const char *n
>   nbd_co_receive_request_payload_received(uint64_t handle, uint32_t len) "Payload received: handle = %" PRIu64 ", len = %" PRIu32
>   nbd_co_receive_align_compliance(const char *op, uint64_t from, uint32_t len, uint32_t align) "client sent non-compliant unaligned %s request: from=0x%" PRIx64 ", len=0x%" PRIx32 ", align=0x%" PRIx32
>   nbd_trip(void) "Reading request"
> +
> +# client-connection.c
> +nbd_connect_thread_sleep(uint64_t timeout) "timeout %" PRIu64
ping

