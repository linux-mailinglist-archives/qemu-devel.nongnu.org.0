Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D649B12F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:18:22 +0100 (CET)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIu5-0001UV-LS
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:18:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCIoY-0005Dy-A7; Tue, 25 Jan 2022 05:12:38 -0500
Received: from [2a01:111:f400:fe07::70a] (port=49998
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCIoU-0002tg-Ux; Tue, 25 Jan 2022 05:12:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWynVMKEN2kPLtZ9muJnBaedS6LKisoH0GnxJSUfQ+6OcrStT5trNlGrSnCxlIoXeaI8LQ/GEVTE7ZTi6D9o/jWIWXiqQSnAcJf2U6elp1QobBisWWOXf1X6K0pmy4z5XwMCF59xl8Th+i3FELDmB35nnNrWm5oWcbN6LUH9GCtEcyYR1bZlRBjvYc34kTFh1WaiqEyw0+YC6DLK81C3OPTWZf8lvosJlEdz5hFx/TVJCQPiMycgv0zjZjJADrUMO0Y9ywZU56xDIVV5mP+qaGzm2joWi8MCYVLI3vL9shSoNiJePoOf+acpl+N9R0vo87sVbvXWMHOjFZ/i41tNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFhIW20EWMO0cfaVBVIc2VsT4n7MjH2DLbBXWzlp3lc=;
 b=j8tC/0l1XBAFJZwGDXamg0/QydoXnakd5WMFjs/eXJnAA9Oyj9uuU7744RFIUxgGc+GjTwMeVwuvsgTKjLgjoX/8ZRexgUCbA2dMV93/6KigQ69FBYe34FTJ12Sl08TRb0KwhHGjuHV2TlytPnmCzccmAPBhoHNyGd5vlhyIWldslFfMrxRnVCG/s9OhoiJWAXiguWaKBibkrY5DRKn36xybe79VFIuznvZyHrHk4h5DAkATrK5VmDWOvMyrjpEWF+Q8tczWIFTHjoxDdR/SQNjgqRW+lVdrn9pc8U0dTYoPOjT7yuS0CbFXlrxS41PTtOhAiVHpJwG2WvNP6G7OYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFhIW20EWMO0cfaVBVIc2VsT4n7MjH2DLbBXWzlp3lc=;
 b=DLQth4akhLXioAx8ewHLjfhyjIPM6ICCDeL1MYvRyoqeJwhys1PjMFLRgxCzLhJpddKE7sgG/CF1jqZrBqdoIQN3a6Wk9R8M+L3Q4+VnZgrvTcpWSStIVYjsh52Evs9MqS4JdJ7ccvu50AOb48Fnt5kEMK6G7oqN3KFTcaWygSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6931.eurprd08.prod.outlook.com (2603:10a6:20b:30f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 10:12:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 10:12:21 +0000
Message-ID: <4aa42545-e0da-2a15-110e-3d7b2d8cd273@virtuozzo.com>
Date: Tue, 25 Jan 2022 13:12:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block: bdrv_set_backing_hd(): use drained section
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20220124173741.2984056-1-vsementsov@virtuozzo.com>
 <8689ce30-7021-5d5d-861f-1d759e8acf46@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <8689ce30-7021-5d5d-861f-1d759e8acf46@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0019.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::32) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 815e0ecb-4c21-4e2e-4952-08d9dfeb2cf4
X-MS-TrafficTypeDiagnostic: AM9PR08MB6931:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB69316C9F8F1B01919C6345B9C15F9@AM9PR08MB6931.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mKKyPIKrtW5TEAhRhqq8K4ekqp+8wWnJwR3xJFV1CVtFkCKYmW7xTV+WKGjMromfoGiWKbNHCv1333ETS0osK6PkA2oy4VBiQdQGksWePexs2ZwxjifOEfenbY1IEvqZojTbPnA8QoLnN1q+qM9JKGFDvJT9N5Xljl3YV8JRy9V1MR6dGWfMcGB03TDYREYIpaZQB/PaIzJEPpX53X0sY/ayTm+Zamk9SdmAyCEo9G64TIrL06QhwbjUTXKb8RtLm7ti8Ryvu6/P8RPTJj1oVJPMQjDupT4F9lW6aWss46dVvtfKunlpF+XotWqMsGDdMxsl29yez+PVk6H19nric+VPlHmWg8/0KenLXlcn52sis36rkaLWuz+kdwIFRodQe4JH8diRTib4TFMmLPjZgoeFcwKhWX+Qinq8N3W7eDlxKHPpVIOM8kW6/qbBXiVN8YvhJ0VxHHYATiPvmM4AF2VAfpnQlKP7Ubit69Htpvv+KZ+KxgAtIvVF7tEpuqIIejr0UnD/1zM/hI/yIaBoquconuKmOHHizWGrW3dmfcDUFQtG9wROcJWeV1SzL8CSOfg3GtcmE6U0927kBttlihChxWxxGIEqSms1U+AgIAyBCM0Fizmg79sBpVlWWPZR6h2/yShWgPoXJU8gv39hN8GU8yj12AaVrwZMnCRmKKgnxaNGyj32qB5YlmE6Zg/PoMOb32goGhgxyaCXEevXNZDqlLj1QmyRFx4AmTyhZah2QsNeT/EqbliH1HMZEEKoszgTamDFQ5LJoG8PqNZrtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(8676002)(6506007)(53546011)(38350700002)(66946007)(66476007)(66556008)(38100700002)(83380400001)(26005)(6512007)(4326008)(186003)(5660300002)(31696002)(316002)(36756003)(2616005)(508600001)(6486002)(2906002)(52116002)(8936002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTlFQUJSdUtIUWkyU215Q2JOQ1ZMNnhUQnQ4WnFWL0l3eE9lakpUKzZ5eG5L?=
 =?utf-8?B?RE1rMlg5T2dMU08yb3V1bXlwTjZ2UkYxdGhxdEZpbTdDd0JSRkpLNXN0UmVw?=
 =?utf-8?B?SUxLQ3g1NEVBWXlyWlVhajF4R1pjNldsYWVLMDlxdXArMUo3WXlLc0kvYUJj?=
 =?utf-8?B?NGVUeUszNWlmeTBweW9MSmhRVVRVYVBCc203UUVNc1JpQmFlallwMnI4MVYv?=
 =?utf-8?B?UTF3TzJoS2lhcUtUTFRBRElFMDhpbDViTU5rTDdpQ1czRUIzOVpvRmJVNzZu?=
 =?utf-8?B?WEUrNUlIYituZGYzVVJSb211NWdrWDdvT1hHNndoOWNoV1ZXRGJQRVRGSmRZ?=
 =?utf-8?B?ZmNZdkIyd0p1VWZwdzV6U202MGVza2pQUTJpVkJiMmZqSEMrdVVsM3RZYytS?=
 =?utf-8?B?Vm1DVUg1ZVp1aDdNMDJXY28rNDRHVGFyZnVnTDY0VnZFaUJ6RWd1alRNRjE1?=
 =?utf-8?B?eWw4YU96a0RsaWZaTXM2cXdCR1FoTmRYNitVSTdjVTRIZVZaK2NIU3BnQXYr?=
 =?utf-8?B?dERYdmx0UFM2QkpKSHVIbEVmMnFLaUNDYytGbXJZQ2hFYmpXUzRUbzhVMjNQ?=
 =?utf-8?B?amU5K25hNjl2ZSt0NnNEZUdzQXdkVUxEa3dXTGFTOG1uWG4xbFQ4QjJYc3Y5?=
 =?utf-8?B?a25CczVQQThTVGtCWlp0amx3bEZTSnVaUWRmU0ZPQ1IzMjlxNHc2dlEyZGc2?=
 =?utf-8?B?RlRTWXg5L0lKMzJWUjY0WW9rN2I3VEY2NnMrTTNTNE9TOGx6VjJWMFpvQm1W?=
 =?utf-8?B?RWlnSVp6U2VPNFp6S3VNdmFMOGx0MzY5bDVEdE1jQXpQZGd4U2FsK0M1Z28v?=
 =?utf-8?B?aldkR2pjdlVRUUVUdHZSWkVhY250bktHNzF1bXFYMlJEUDkrU083ODdvUXEz?=
 =?utf-8?B?ZE9VVzBPdnlQRW5kdGVRaTNjZ2tTSVJIa0U0SGswanptRlZpTkx2aVBieUZU?=
 =?utf-8?B?RERWa2FFMVRHVkdXanhmZE9XbjgrT3BqYnorNFpoc3Q3OTNFSjJydWJXeC85?=
 =?utf-8?B?RkQ2dW85SUJRVGZZN1UxTFJjYTVQN2Vtd2Y0TUwyWmdhRXN5RVNEMlZpSFdQ?=
 =?utf-8?B?em5Nc0NhVHhXdkNYbDBpS3Q2RXVIOFJMMTN4N0Z1czJ0bjdEaG03cDVoSjJV?=
 =?utf-8?B?VFpNNEJXbmYvcW9nc2wyY01Mbm94amMyS2wvTnNEQzBZNG5pTWFrbWVzRlIz?=
 =?utf-8?B?Z2N3SVlobEF3WSs1aDRpVkpmdXJyenFkOHdsd0Vxc0RuSG9LbmdpeU44Y1pp?=
 =?utf-8?B?b3N4d3lEeFRYalBscDB6enQ0SFpTSzlHcDJjMDI2RzVEajNyYkRnWFY5YUZW?=
 =?utf-8?B?dDRFWGFocmh6enNYejF6a2RKblZjbGFicDh4aTZmYTB5RjBUbm1lU0hMb0NR?=
 =?utf-8?B?aGkrL0ZIL3VSZVJScCtrNnlTc1V4NTAzTUovS08xV1V5REFEK3lYUnZqbVpY?=
 =?utf-8?B?ZG9mVVdDRnNrVldHZzNyODZra2d5YVIzZklGbUIxcm4rNDkzUHJqSGFqZTQz?=
 =?utf-8?B?OHh4N3R6c0NhVmNyZTUzMVVUMEtDdFBibDV4NDkwdzhRVGFyME0wMUxFSGpX?=
 =?utf-8?B?bFNnOTdFNGcyUlJoZWplaVJ3WkhHditlczdleE1kUXIyOUsvQjQ3TkFVYWl0?=
 =?utf-8?B?YmFFdm40RG44L2ZsVmx0Wm9CYTFhNUJDQ0JVMzdIMTdMRlRCQmlHQW5LazJ5?=
 =?utf-8?B?eDl3MUwzSTBVUWtoT0hsZkhiWEdDNXBMUlJwWjJEMTlpbW5SM0Rkd2ZCR2Iy?=
 =?utf-8?B?M2V2V01vb0NKcFNTcko4UFA3T1FpMGJXaXhya1hHV2tEZVVNcVdxUE9YRGlT?=
 =?utf-8?B?STA2MUJta2RtS3ZUeXNUQnpRU2JyZDMvVmNTUWpDcko2cUJUTDIwM3VZRDNq?=
 =?utf-8?B?c3ZIU1dGMmUrRlhmSTVNQ0g5NUViK0o0U2wvUDJ4K1NEcnFyOXhPenRtaFRo?=
 =?utf-8?B?cVBmUDU1U0l2Q1R3aEN1UUx2QlNTd2FUeGowcndEZTRKbWJXNUUwTkpUdkcv?=
 =?utf-8?B?SVRjekt6LzZSNmQzMXYrRC9taU5RckJnS3hsYUM4YXFkRUhidkVXTFIzbzd5?=
 =?utf-8?B?eVFhSC9wQURYWUxHK0Vja2FZR3c3R045dXZCY3dQSDRzVGU4TXRPOE9OZWpG?=
 =?utf-8?B?R2Z4YlBBdlhFZVdhVHdTYXVTZ3U2VjF5V2t3U0dsOVk2OUV1REhXYVVVaHJk?=
 =?utf-8?B?VG1HUU5nbGhIU2JQMG94UVc3VWVhaVBFYlR0V3hpY1BHS1o4M3dSWHRCUjNE?=
 =?utf-8?Q?QOjf/K5tvsNpLcLgIaV03klgWE9W09y5DGMDQ5o83g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815e0ecb-4c21-4e2e-4952-08d9dfeb2cf4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 10:12:21.5245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVmHP4ILc7Nblk2Vh1OM5g/malah8xin4wyVVj0/rdu2s8zQoRAOd2YrxjXzFYmJ9tRdjBQiaK3ZOkeKB9dpa5oo5C8h/HEeLYzX3By4qig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6931
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::70a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::70a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

25.01.2022 12:24, Paolo Bonzini wrote:
> On 1/24/22 18:37, Vladimir Sementsov-Ogievskiy wrote:
>> Graph modifications should be done in drained section. stream_prepare()
>> handler of block stream job call bdrv_set_backing_hd() without using
>> drained section and it's theoretically possible that some IO request
>> will interleave with graph modification and will use outdated pointers
>> to removed block nodes.
>>
>> Some other callers use bdrv_set_backing_hd() not caring about drained
>> sections too. So it seems good to make a drained section exactly in
>> bdrv_set_backing_hd().
> 
> Emanuele has a similar patch in his series to protect all graph
> modifications with drains:
> 
> @@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
> 
>       assert(qemu_in_main_thread());
> 
> +    bdrv_subtree_drained_begin_unlocked(bs);
> +    if (backing_hd) {
> +        bdrv_subtree_drained_begin_unlocked(backing_hd);
> +    }
> +
>       ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
>       if (ret < 0) {
>           goto out;
> @@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>       ret = bdrv_refresh_perms(bs, errp);
>   out:
>       tran_finalize(tran, ret);
> +    if (backing_hd) {
> +        bdrv_subtree_drained_end_unlocked(backing_hd);
> +    }
> +    bdrv_subtree_drained_end_unlocked(bs);
> 
>       return ret;
>   }
> 
> so the idea at least is correct.
> 
> I don't object to fixing this independently, but please check
> 1) if a subtree drain would be more appropriate, 2) whether
> backing_hd should be drained as well, 3) whether we're guaranteed
> to be holding the AioContext lock as required for
> bdrv_drained_begin/end.
> 

Hmm.

1. Subtree draining of backing_hd will not help, as bs is not drained, we still may have in-fight request in bs, touching old bs->backing.

2. I think non-recursive drain of bs is enough. We modify only bs node, so we should drain it. backing_hd itself is not modified. If backing_hd participate in some other backing chain - it's not touched, and in-flight requests in that other chain are not broken by modification, so why to drain it? Same for old bs->backing and other bs children. We are not interested in in-flight requests in subtree which are not part of request in bs. So, if no inflight requests in bs, we can modify bs and not care about requests in subtree.

3. Jobs are bound to aio context, so I believe that they care to hold AioContext lock. For example, on path job_prepare may be called through job_exit(), job_exit() does aio_context_acquire(job->aio_context), or it may be called through job_cancel(), which seems to be called under aio_context_acquire() as well. So, seems in general we care about it, and of course bdrv_set_backing_hd() must be called with AioContext lock held. If for some code path it isn't, it's a bug..


-- 
Best regards,
Vladimir

