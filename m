Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A18334089
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:41:55 +0100 (CET)
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK026-0001gv-2z
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lK00j-0001AI-6r; Wed, 10 Mar 2021 09:40:29 -0500
Received: from mail-am6eur05on2105.outbound.protection.outlook.com
 ([40.107.22.105]:50497 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lK00d-0006NJ-4A; Wed, 10 Mar 2021 09:40:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms1vDp8w9/SClS/yGi/7Ek3T3qrvnQ2cBT182IQ/bTIcIJY2Edv8yb2Xy0VQfcH2+6Pwv7h7dwWBV+AwoHTn08aGLjzf8JW0i8E/wBMgtlB2BZV+gwxc5CXPVKuNthR+8qrDT+XqktbWth4ZBXwmAIJnJmyXYxThOUaez6dDcWDr6m+d5vmmPG3DfDblTt5lpZBJ5MoGPP2fUVn7++uYhdI2USSIU0dJgBRw9RZo/XzHE92GHMGjy2TIZ+zNTlsJuMeQ1YSwRFpycUlnkk97WQ4YLmgiTfbpPBRDw2JapCPFeM5NDcnmOZyey67AfHG20FV++Uzw8V4KpD/c+eC4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNHxzDdHXiQefIOllrK+LpHQgJXlA/PYzMbCF71kHP8=;
 b=SdQVNlvkHw8h3hlQUrcE6+ZQ5srQyefTLe0En1+qcoFmDU9tqvn8QZl+l/hi2DcQXSpxQxsExPkpygRN/oONIOb5sz0NBF9FkyUULKlLIGbv7ijCMTAMPf6jRdV+kyROQR0ez8mqMvQWQIAHNhPjfJ2xvC5I6aIxYLfTCWBPIXNClDlw6bSTV7YHawRFrqEqp6GRKVh7Yb2fJ/a/xALUYoaqSlQrROCw3c15Q06ZEHGbYu7ucOLcqxEeUZefpbguIdSpVRmFaPI9ib0bYfYmVNcXWs9PAoDE2tV0k4w5CGpO4xV/hj9yP2ygv19I/CtU+eD2dp3pdCyXzK1eu/3voA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNHxzDdHXiQefIOllrK+LpHQgJXlA/PYzMbCF71kHP8=;
 b=CaqnYZZLtIoKYOGuPX3PT88jjHTJfKJiEXgL72bnZp+h+0Q5T7lw8sOO5h9IcKwn0Kgo36qO/GDnWYz7Ah+G/rrTuGXIcOCFt/7np2dacK7VDhPU1rq6RCKL7iJk9Xj2ua8GvgMN2YR68uR9nWiSr2TjfWxy6/cTHCUybuTM37E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4950.eurprd08.prod.outlook.com (2603:10a6:20b:ea::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 14:40:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.027; Wed, 10 Mar 2021
 14:40:18 +0000
Subject: Re: [PATCH] block: Introduce zero-co:// and zero-aio://
To: fam@euphon.net, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20210310141752.5113-1-fam@euphon.net>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fe6ad34d-2e4d-c187-21c4-9f26e3da14d8@virtuozzo.com>
Date: Wed, 10 Mar 2021 17:40:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210310141752.5113-1-fam@euphon.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR04CA0066.eurprd04.prod.outlook.com
 (2603:10a6:208:1::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR04CA0066.eurprd04.prod.outlook.com (2603:10a6:208:1::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 14:40:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 636320dd-4a60-43d9-c989-08d8e3d26ce5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4950:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4950049F10894FCE0FEE0DACC1919@AM6PR08MB4950.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HL17/WGBhzHl1+fkIUMBJedDRXLFiusCVtgQ+lpazy82NQHN6SYJiU+MuHdGCpz45YdDF/MzDaX56vB0OkhJCa2k2HmrcHUg7BZ7+X2dWsHnafSeZR4GWI5o8kIAod+qk0JP5zRugRNzzQms3p5tu5F2PXxAmVpHQY3jYxizIdDZxsLMnuIBUNocwOl0uRX1HEOXhHpWoxcB4lMNT/3op1iFtuw1+U2F45uvuW7UOPWApBX3US7KK7Tb8wYR97kCpsKwHO68s9x10vPR5fTNnlwPrHvunaaH/KkwwIVpKUoySHYj2Msy75ahrjipt3/0w85da+nHqeW42qoMqbPwtPjCK6mfmBBFXWt6Q43+yKaEt6HDOm0o44nz/z5oene0aIaujpy9N884sUXsvf+ooRkhnTwUrnJN3vM/Jonv89TGkHUqOGx0NDF2m/5q02mq6O8H1z/pm9CtVCAdpqe/8ihh6mRU0CwGYWeSANIa6EyzB9JdiWVo1ySNWCXRBYruXzMMtWiw+BbLMHNd2UljEaDL1zXF/PWKp1TBPTs8v7yPsAM41Ecci7bXPF0O/0O4+6mpqPu6NBZqIaz/hTF+jhTAusAXFn3Ej+DCq/7WkCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(376002)(346002)(366004)(16526019)(31686004)(26005)(83380400001)(36756003)(186003)(86362001)(66556008)(2906002)(956004)(2616005)(52116002)(66476007)(478600001)(5660300002)(8676002)(316002)(16576012)(4326008)(8936002)(66946007)(31696002)(54906003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGIwbElYMWtOOFdwaWp2QmhOQWpiS3hVUTJsTzBYT1g5TE1rbi94a0VITXhP?=
 =?utf-8?B?ZGkreStkRmNzL3JLUUlPaURLcFlYZTdjUkFPdVRFdW9EUHp6bHFDOTFiVFdq?=
 =?utf-8?B?NUxaL0psc3ZIN0MzL245T2VtY3lzV0xsVVVxTUtlNTNjazJEVHRrSW1qUXl6?=
 =?utf-8?B?NHQ2QytxTjRpVm5UUXZjUE1Sc1ZZV3p4bms5TFI5c3FKandXTk5vdit1dko3?=
 =?utf-8?B?WVlyZU41ZmtmdGVkNjlUbjRLVEIxMTlSNU9xdjR0aGpCbEpndStscWc5Nndp?=
 =?utf-8?B?TDJ1TUgxd3dSdUNVTWF1L1hrcUZoS2I0MkljRjVIcnZQZFRoVW5nTUkxem10?=
 =?utf-8?B?cjczbFVyYks2RDVYYTZNMjBWN0liUXJLN1hIZU84K3VnTnBHbVVvUDVWMDhs?=
 =?utf-8?B?aUgyKzVBUW5kOHhDNW9xQThuUktNOU1jZkd3Y0ZPRWlkSXJSaCtHVitiVVA5?=
 =?utf-8?B?cFBXS2tuSm5leUJEVkRSK1YvRk5Hb3BNQUJTdGFCSGJqNkh0MnpYSE9STEEv?=
 =?utf-8?B?MjE3Zis2Z2kwSWdYZW1sS2pVUGEvNFpoZ1k0bWNIVDJxL0J5anFMZGVCR2t0?=
 =?utf-8?B?bFgwRG4xamRlSXZCT0N0THBUQUVwc2lmeWZta0EzUXdybzY1VkdXU1lSbHg1?=
 =?utf-8?B?SzFrY2RhMGNLczd5Vkl0cnliYVFGT0RSYUVhMC9pZFl2TlhwNmIzOE1LZUJp?=
 =?utf-8?B?N2haa1c5ZGxFTWRQa0h2ZUJ6dWRhUWwzRk40SGdGZzBScW1sSUlJd0tzS29s?=
 =?utf-8?B?QjN0ODl5QTV0QS9jSHd0NlE4S3E4LzF1WEdXcUxuWGVjUjZobnBHbUMrSTh5?=
 =?utf-8?B?TUQwNy8xUnhzcEVyUFpUUzdack4rVlBFb21VeXlFOUVHSkdOLzBqN3JGUmpu?=
 =?utf-8?B?ditMenU5SE5qMVBvU211Q0NZOHlPd3pMTy9nS3hRTkdhSWlCNzloeGZYRUZN?=
 =?utf-8?B?Tk9wYU10cmhhVHdRSWtYY0pvNTEvVksxcmgwM3NwS2RKeXliK2NuamtzTkhr?=
 =?utf-8?B?dFpGL2dNR3dleUpzVTkvVnlocTk5WWRtWUxGeDBYQ2phMmczblc2eFRxZGtp?=
 =?utf-8?B?a1dJQkdmVXdhNGM2bUdSTWQ0NHZmWmE1RnFMQm5KcXhHN2Vmam04WlNIelFR?=
 =?utf-8?B?akR5VmdZSnRPQVFlUDQxRjF4bklWcGhXQlhCQm1EeVlsQjErV3lITjVXcWFa?=
 =?utf-8?B?QmRtanpJRmJwNHpqWGJlcHZ2MVZxSUxlUGhIRzQwRktCZDN1dDRKcEN4eHI4?=
 =?utf-8?B?ZWtKQjR5NzFCR0lBUnlHOVhsV005SzVvT3p1VW16S2hRL2QyOG9lcGN3K0hi?=
 =?utf-8?B?emlzVFNpdG9EL2lmWW1YVngyV3F6ZXAvaE9mVFV6a21ZQXVxMEpjVWZZV3dj?=
 =?utf-8?B?dXBYWHdqMDA4c0FuaGh3amEwdGFGTzdlUzFFMWZwY0dWbmlWeXlLWHlra0hI?=
 =?utf-8?B?cTY0clo4TzdBT0lSMVVvdTEzb0UyM25NeGxqVWtObytzc0JxVWlWaUp3SWsx?=
 =?utf-8?B?MXl4S2N5VFp2enBmdGRFZEJoejk1ZHN1d3JRL3dicUxIYlBEVUVCRFVOckZS?=
 =?utf-8?B?bDZnZXRObWZFdU1GemZJOXI3NHZ1NkZoNElxS1RZZ2toaGZaNkhuL1hWVEZq?=
 =?utf-8?B?WStLSk1ZelVuTGhneWtBd21XdVFVdUtpMnVqS1VmTVVoVFJBNGlkcm1vT2pM?=
 =?utf-8?B?Wlhla05QUWNIZXdyaUlDWXJIeDFRb1pLZDF1cE84WHoyMjFOT0FQMUVQSC9n?=
 =?utf-8?Q?NaKJ95LpYGBq9L1Y3mxg8Uqcxov02KATRM+HcGy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636320dd-4a60-43d9-c989-08d8e3d26ce5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 14:40:18.4547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUVc5tosJpsxR2fB3ndYVMPVqTYglW5aa0d8rkjefcYTUisy2iztoZDTISNWN6pLIEoSx9iVsffssH69pIdu0i5L9SymxXuz18k4JIUdjn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4950
Received-SPF: pass client-ip=40.107.22.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

10.03.2021 17:17, fam@euphon.net wrote:
> From: Fam Zheng <famzheng@amazon.com>
> 
> null-co:// has a read-zeroes=off default, when used to in security
> analysis, this can cause false positives because the driver doesn't
> write to the read buffer.
> 
> null-co:// has the highest possible performance as a block driver, so
> let's keep it that way. This patch introduces zero-co:// and
> zero-aio://, largely similar with null-*://, but have read-zeroes=on by
> default, so it's more suitable in cases than null-co://.
> 
> Signed-off-by: Fam Zheng <fam@euphon.net>
> ---
>   block/null.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 91 insertions(+)
> 
> diff --git a/block/null.c b/block/null.c
> index cc9b1d4ea7..5de97e8fda 100644
> --- a/block/null.c
> +++ b/block/null.c
> @@ -76,6 +76,30 @@ static void null_aio_parse_filename(const char *filename, QDict *options,
>       }
>   }
>   
> +static void zero_co_parse_filename(const char *filename, QDict *options,
> +                                   Error **errp)
> +{
> +    /* This functions only exists so that a zero-co:// filename is accepted
> +     * with the zero-co driver. */
> +    if (strcmp(filename, "zero-co://")) {
> +        error_setg(errp, "The only allowed filename for this driver is "
> +                         "'zero-co://'");
> +        return;
> +    }
> +}
> +
> +static void zero_aio_parse_filename(const char *filename, QDict *options,
> +                                    Error **errp)
> +{
> +    /* This functions only exists so that a zero-aio:// filename is accepted
> +     * with the zero-aio driver. */
> +    if (strcmp(filename, "zero-aio://")) {
> +        error_setg(errp, "The only allowed filename for this driver is "
> +                         "'zero-aio://'");
> +        return;
> +    }
> +}
> +
>   static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
>                             Error **errp)
>   {
> @@ -99,6 +123,29 @@ static int null_file_open(BlockDriverState *bs, QDict *options, int flags,
>       return ret;
>   }
>   
> +static int zero_file_open(BlockDriverState *bs, QDict *options, int flags,
> +                          Error **errp)
> +{
> +    QemuOpts *opts;
> +    BDRVNullState *s = bs->opaque;
> +    int ret = 0;
> +
> +    opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
> +    qemu_opts_absorb_qdict(opts, options, &error_abort);
> +    s->length =
> +        qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 1 << 30);
> +    s->latency_ns =
> +        qemu_opt_get_number(opts, NULL_OPT_LATENCY, 0);
> +    if (s->latency_ns < 0) {
> +        error_setg(errp, "latency-ns is invalid");
> +        ret = -EINVAL;
> +    }
> +    s->read_zeroes = true;
> +    qemu_opts_del(opts);
> +    bs->supported_write_flags = BDRV_REQ_FUA;
> +    return ret;
> +}
> +
>   static int64_t null_getlength(BlockDriverState *bs)
>   {
>       BDRVNullState *s = bs->opaque;
> @@ -316,10 +363,54 @@ static BlockDriver bdrv_null_aio = {
>       .strong_runtime_opts    = null_strong_runtime_opts,
>   };
>   
> +static BlockDriver bdrv_zero_co = {
> +    .format_name            = "zero-co",
> +    .protocol_name          = "zero-co",
> +    .instance_size          = sizeof(BDRVNullState),
> +
> +    .bdrv_file_open         = zero_file_open,
> +    .bdrv_parse_filename    = zero_co_parse_filename,
> +    .bdrv_getlength         = null_getlength,
> +    .bdrv_get_allocated_file_size = null_allocated_file_size,
> +
> +    .bdrv_co_preadv         = null_co_preadv,
> +    .bdrv_co_pwritev        = null_co_pwritev,
> +    .bdrv_co_flush_to_disk  = null_co_flush,
> +    .bdrv_reopen_prepare    = null_reopen_prepare,
> +
> +    .bdrv_co_block_status   = null_co_block_status,
> +
> +    .bdrv_refresh_filename  = null_refresh_filename,
> +    .strong_runtime_opts    = null_strong_runtime_opts,
> +};
> +
> +static BlockDriver bdrv_zero_aio = {
> +    .format_name            = "zero-aio",
> +    .protocol_name          = "zero-aio",
> +    .instance_size          = sizeof(BDRVNullState),
> +
> +    .bdrv_file_open         = zero_file_open,
> +    .bdrv_parse_filename    = zero_aio_parse_filename,
> +    .bdrv_getlength         = null_getlength,
> +    .bdrv_get_allocated_file_size = null_allocated_file_size,
> +
> +    .bdrv_aio_preadv        = null_aio_preadv,
> +    .bdrv_aio_pwritev       = null_aio_pwritev,
> +    .bdrv_aio_flush         = null_aio_flush,
> +    .bdrv_reopen_prepare    = null_reopen_prepare,
> +
> +    .bdrv_co_block_status   = null_co_block_status,
> +
> +    .bdrv_refresh_filename  = null_refresh_filename,
> +    .strong_runtime_opts    = null_strong_runtime_opts,
> +};

I don't think we need separate zero-aio driver. What is the actual difference?

Probably zero-co is enough, and we can call it just zero. And then, maybe add null driver (same as null-co, but without read_zeroes option) and deprecate null-co and null-aio drivers. Thus we'll get two clean well defined things: null and zero drivers..

> +
>   static void bdrv_null_init(void)
>   {
>       bdrv_register(&bdrv_null_co);
>       bdrv_register(&bdrv_null_aio);
> +    bdrv_register(&bdrv_zero_co);
> +    bdrv_register(&bdrv_zero_aio);
>   }
>   
>   block_init(bdrv_null_init);
> 


-- 
Best regards,
Vladimir

