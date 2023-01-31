Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2305168341C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 18:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMudl-0001fN-PR; Tue, 31 Jan 2023 12:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMude-0001f1-BS; Tue, 31 Jan 2023 12:41:46 -0500
Received: from mail-vi1eur04on0708.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::708]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pMudZ-0005FQ-MK; Tue, 31 Jan 2023 12:41:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qno8PSwXK6vr3VQt/HoBZSwFK45gQitaNCpvqP8dhM9pk0hM3tYU9OLkQ/WHbioQaFE0euP9sBPYzndlj2MdrKJ8dz5E64cf32hqhpIuyWBrmiKeokb4687kGu3yybr2/O1EeDkXNf0kF+MKSuyQFzIJ8idQ/xCgm2bDthMQF4B8dyNgNXFkCXsqbBvMLLEnnEAQuZMNbfsCCewXY/6s1hrOcUwi8Y6uZWhNv2Ho4LOA3cRIREDsqrDU+8c5AueOICazJjG2/EAuPyBWUfBtUO1NpOkH0YjL8p1tEvN6I8huRAe3qnAhBhSf9HPWHJXB/plYsRpPCAhdV/TFcqRWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7oiaGlrmpTLyoCxJOtKAVQRlFgNtOMIt2uQ18kxdJ4=;
 b=Ix0xI1n1+PJjmlqsuTK56nnmYPbbnXpKos+XY1wDA9qXsagIna2LrAWhOoVYEeXmSV2azslIGp63J2a5ZOJY3WWzuJCnje8v6pybm3kYM6yt3dmB7JIMPOto2mnzgUfaBAB5dWmGhZawzr17aWdpOkJ0iOyKSmYF9nBF75OkTguoG+TZTszgll1Totm+oPSl6cQ7v8192AMB4pmsukRCZuYlHxE+LStJ6JX/5yEOSc16Mj1INeWt7TUyoyLJgTpDrwlhCS2GgWcdqh+dBCaYu6XxDuXlaDQrMTIFemMfnv2D+hCOmn9432DyNNtL9iY/o7ax1mw/Y/YCHpHIDbRxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7oiaGlrmpTLyoCxJOtKAVQRlFgNtOMIt2uQ18kxdJ4=;
 b=ljX7W187eFZ8LQSkdfAYv93ujOqwQ0tggZ9WZsXhwQABkXnIM3UfUb0ljJcJlU7FihNcYsMleuaowtF+hBk9UGLjctP94DdPyeL3JDW68etAryAUhMZX4HSfts0afdtV3O7nxqd99lGyenurWCd5hN9vVXgt73tEgEzr3sNzMmJ+j96BTb1dcElhuEB7GJ8XbgY+fKaqh5nH6Ofl7t+KIdRCyRgnUkrgFaOQgMkFtuTmj3SaJB1bdsLYFLkDkZi62SfKiuhBkzHxPaVwYKW0GpFHjoIFDM73MAS4A3HyM8vW6Te2uhW1+oyPd2ig5QFD6tyB2h/jd00FZDIpzFismQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM8PR08MB5731.eurprd08.prod.outlook.com (2603:10a6:20b:1c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 17:41:29 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::eb1:689:d0da:8fc0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 17:41:29 +0000
Message-ID: <612a1e0a-c992-a112-bd7e-83a24626db14@virtuozzo.com>
Date: Tue, 31 Jan 2023 18:41:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/5] parallels: Image repairing in parallels_open()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com,
 Mike Maslenkin <mike.maslenkin@gmail.com>
References: <20230112150149.1452033-1-alexander.ivanov@virtuozzo.com>
 <20230112150149.1452033-6-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20230112150149.1452033-6-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::32) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AM8PR08MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: ff3d7681-e152-4310-bcde-08db03b261c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cdLglQMT3/rOXkldedCHe5Ih9Ykrs25mK5qbhGgUUqBs/LE3f7BBXh0IQm/vvksB0RJc1lthy20WrCTj4tIeo8jZAex8OEnFNNWywNQ0R/t++ddULDOnOELKkkXH2XHTteWkCqrfhYYuUeqvJoxMZxr2YelSaiHrSsf9jx8qia+mPNqxMJtyDnMxvvHTRYWF2SUK0/Y5fbcMdfKddnxsDPphnvzDKwC7HmjeeEuH9rI3O7GfxEuuoMVrVbKQ2w1IXAmoouGkGdjCvSQPoOBI5Eh2bLY9R1G+w9NfoBqut/OMzK0qnHym/SKBCphjcFjxBJSBU2VFOfDVHvFZqmbBEUSrwCScxuHtDWOJjt/mIM5WcdR1Ty925VE6gk6GVxADBbi9f6r6j/7izyuNPoQ7x7AQ4SG06MuEbtpZktbDrdRLx2USGz5LzTVCg4/QRA3gBqW41WFdqZbEloRb0zCXVpBteX2L8Q2q/OY+tSogPVePMQY2+jlsh3j3NkUHlqQSgQ/+bSfCeeIkivqOUlDv52DxsDIj3YiAUK9N0sBWqTg/05/+d3gHFm4TQJpyHLxgHe0u9tJ/oQfFNt0lLYf7LpYyDO7tMXBuNBrThUxgi0VtWHnGu/YLEvr8mVB00ezxPR51rdcHHWeicqsalwzHkYE+Jhs75SdASnF0U89dvE5Jby6YVnGwVKks9zej4KlmGZJ9QeHzZvTNkfV2h0rdVMmmdwBQ6xwnnrKziFriMts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199018)(83380400001)(6512007)(186003)(2616005)(478600001)(53546011)(6666004)(26005)(6506007)(6486002)(36756003)(31696002)(86362001)(38100700002)(316002)(8676002)(66946007)(4326008)(66556008)(66476007)(41300700001)(8936002)(5660300002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVROSE4vdXlzWmVObDlONUlRVWo0b1FJOGlWL252ZEhlVzVGWGJTc3hsSXNK?=
 =?utf-8?B?ckd3c25uaFpTVDI4bzIyclFFZlFUQXdLSW9Ob3QzOUNoWkI2S3JpL0YvWmpr?=
 =?utf-8?B?ZjdaNmRZNHBpb0djRTlsVmlXY0RMTFhBVFFoMGVTQ2Z4bnJjS2NqV1lLOVU5?=
 =?utf-8?B?TURZYWFEQXBuUm5VNGNyS3pJcHhISGEwL0ttcURyUmE4dGt6WTEzZWdTM2hN?=
 =?utf-8?B?NHJZNDF1LzF5ZlAwQjJ3Wk9sRFdicUFyaUtpUmZkbUxmOWdxZ2szOXF0WkhD?=
 =?utf-8?B?WkllZkpFL1VDSjJ3cjBaNEtrOGk5WGJyeDd4NHFWOTdWMThXdlh5STAvOTVq?=
 =?utf-8?B?aWVkVytUUDFnRkRpTmlJdm9nZXh2WnpCNktzR3lBUFpmZ0NrakpyenpZRVJV?=
 =?utf-8?B?azc4aDRMdlBkSm5UWjljaDJ5WDgwTXBMY2pyemRSS2UrZVdCQVZwcnFFYnh4?=
 =?utf-8?B?ZEt2WjFoNUJodGpNOHJhUDV1QTRWRm1SdElKS2ZFUjF2MnpCYzlMc0NoTDJ4?=
 =?utf-8?B?Y2dKQm5LeE14Ui9nUEYxbE45bmpoanJoZzBqM3ZpdXJpQVBxeGxhVFE2Y0N4?=
 =?utf-8?B?eVlUMm5TbFozbTFWQmkySGkxYklvMkJQQmt1cDFQb05pc1J5d0pySSthZldI?=
 =?utf-8?B?UXNtZjM5T1dFbUxId1ZwSVRsNE90RHV4SFF3eThiNjZXZlVMazhjeTdvazdl?=
 =?utf-8?B?MmhvSktkSXZ0bXdWNmM2Wkx6KzF2cDE2dmpPTElBOVJJU2ZldDRYUzBCMnVD?=
 =?utf-8?B?WFNPSUU4WDlKWWRkemdDWEVPczVXZDE1U2hsYkkybGNYQ1RLbHZqdlVqRFZZ?=
 =?utf-8?B?MUlIcDRoeFpuSWpCSW9VeUVpaXJrcTh3VnZoOG9pNVQyV29ZN1RnZGVVTXAy?=
 =?utf-8?B?RnJjT1pSV21KclVPY21qS1V1ZUM1WTU2UXZhZGovWC9qbWIzWUowcjRST3pX?=
 =?utf-8?B?YlZhNWkwNGFMQzMyaWtNSE5iaWx5Q2J4OFNkUGlDWUNxV1JESEV2TmJMUG1o?=
 =?utf-8?B?WW10c3krMzJxbVJodVVkajZaL1ZUS3dHNGZ2bzUvSmtmdlljODB1YXJ6ZnRR?=
 =?utf-8?B?SW9CT2dkSVJsajJuY2kyTHN3MHBaTWZxVXRxRUswMVJsMTA3allkMC9wcTlW?=
 =?utf-8?B?eU9rWE9DVXdUQUlLS2N6UWNDOTZxRTQxSmZZcUdsSXJobExhNEdVdFZNWmo3?=
 =?utf-8?B?SGZiMFJhTVlYdjdHczVVa2Foek5rZjEwZG5HVWtXY2ZkNTFCTmNkL1drSzBy?=
 =?utf-8?B?ZUZLUHdSRm9Hd3hCTU9INkdBT3VDUmhlTGZvazA4OHNIVjM3T0JMeXIrWmZW?=
 =?utf-8?B?OFhKakZQckg2TEhhTGI3V3Iyb2JteTdxSVV2TEZKVGI5ZnpIajZRbDQxZHVt?=
 =?utf-8?B?NXlmQ2hZWFNreGU2dmVNSGl0bkV6YWIwMHhYa000RWNjN3U0UzFKWUVYZlFK?=
 =?utf-8?B?UjZvcVhoOWF5WDRGOGtCVEFRLzlGeXZnQU1Qbm5kQzV3L0puMENER0crTlkx?=
 =?utf-8?B?YWcxWUlOd1k2ZWhmRUN1Q0NZMFZraXc4Y092WTNvTHRVYkZ1YTBjemNHWmZJ?=
 =?utf-8?B?MGNIQTVoaWFwWFBpRWJIczZTY0xEM08xRS9jdCtFSkdqQjNiWDVTSTVDdWth?=
 =?utf-8?B?cFFJbXhtSm5HRCtlWjZNeitDY2N4bjNZbUo2L29zZmlabmFyOUw5ZS9RbUZJ?=
 =?utf-8?B?eDdlRlFic1EweDhpcXFHQzVOc0NndTU3NThuUDVBZ0tmU2FzYjV1dnd6Ynov?=
 =?utf-8?B?dEQ2ZGJKWnc3T2RlRVdoVDlVeDZBa1hDWjFKNVYzcXN0L1ZZS3MyMXB3S05B?=
 =?utf-8?B?a05mRkJZbXNLZExST1lYRW56SkMwOE5FVUFjMHVOek81Sk42K0FjYUc3QTJx?=
 =?utf-8?B?WXhPeWtSc3ZobDFJenE0YUZnUXhoWm4yY2dvUGJ0ZS9rU21ZUlZDeTlmUVp0?=
 =?utf-8?B?R2hscEtIcGhRanlvbGVNUzV4SG9HRmw4V3ZuWXNQdytIKzZ1cVRBYnl0TEIr?=
 =?utf-8?B?REVWNGpSeG4xbTFWQ3hRZExTRlN1b3JQTWVhYU4xR2ViU2pUUUx4M25WM01n?=
 =?utf-8?B?U1FoRUl0Wk9uaHB1Y3Q3S2Uza2RCYTNrOHliODlHY1pkZnVudkRGVVF6NnNK?=
 =?utf-8?Q?mJp5InQ9azPF5/2OcHLId8Fxh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3d7681-e152-4310-bcde-08db03b261c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:41:29.5843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Q0S+4uiDpJ6wzUDEJsIStpoB1QXvb3c1QnBPaut/o5IjZl+MNXNTFhjdmvcbRQdTxmvZWo8jaojX0dCSjb0Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5731
Received-SPF: pass client-ip=2a01:111:f400:fe0e::708;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/12/23 16:01, Alexander Ivanov wrote:
> Repair an image at opening if the image is unclean or out-of-image
> corruption was detected.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 67 +++++++++++++++++++++++++----------------------
>   1 file changed, 36 insertions(+), 31 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index 5c9568f197..74f6d00ffb 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -753,7 +753,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       return ret;
>   }
>   
> -
>   static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
>                                               Error **errp)
>   {
> @@ -965,8 +964,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>   {
>       BDRVParallelsState *s = bs->opaque;
>       ParallelsHeader ph;
> -    int ret, size, i;
> -    int64_t file_size;
> +    int ret, size;
> +    int64_t file_size, high_off;
>       QemuOpts *opts = NULL;
>       Error *local_err = NULL;
>       char *buf;
> @@ -1044,34 +1043,6 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>       }
>       s->bat_bitmap = (uint32_t *)(s->header + 1);
>   
> -    for (i = 0; i < s->bat_size; i++) {
> -        int64_t off = bat2sect(s, i);
> -        if (off >= file_size) {
> -            if (flags & BDRV_O_CHECK) {
> -                continue;
> -            }
> -            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
> -                       "is larger than file size (%" PRIi64 ")",
> -                       off, i, file_size);
> -            ret = -EINVAL;
> -            goto fail;
> -        }
> -        if (off >= s->data_end) {
> -            s->data_end = off + s->tracks;
> -        }
> -    }
> -
> -    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
> -        /* Image was not closed correctly. The check is mandatory */
> -        s->header_unclean = true;
> -        if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_CHECK)) {
> -            error_setg(errp, "parallels: Image was not closed correctly; "
> -                       "cannot be opened read/write");
> -            ret = -EACCES;
> -            goto fail;
> -        }
> -    }
> -
>       opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, errp);
>       if (!opts) {
>           goto fail_options;
> @@ -1133,7 +1104,41 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           error_free(s->migration_blocker);
>           goto fail;
>       }
> +
>       qemu_co_mutex_init(&s->lock);
> +
> +    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
> +        s->header_unclean = true;
> +    }
> +
> +    high_off = highest_offset(s) >> BDRV_SECTOR_BITS;
> +    if (high_off >= s->data_end) {
> +        s->data_end = high_off + s->tracks;
> +    }
> +
> +    /*
> +     * We don't repair the image here if it is opened for checks and
> +     * shouldn't change the image if BDRV_O_RDWR or BDRV_O_INACTIVE
> +     * flag is present.
> +     */
> +    if ((flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) || !(flags & BDRV_O_RDWR)) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Repair the image if it's dirty or
> +     * out-of-image corruption was detected.
> +     */
> +    if (s->data_end > file_size || s->header_unclean) {
> +        BdrvCheckResult res;
> +        ret = bdrv_check(bs, &res, BDRV_FIX_ERRORS | BDRV_FIX_LEAKS);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret,
> +                             "Could not repair corrupted image");
> +            goto fail;
This leaks s->migration_blocker. Please see error path above, i.e.

     /* Disable migration until bdrv_activate method is added */
     error_setg(&s->migration_blocker, "The Parallels format used by 
node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
     ret = migrate_add_blocker(s->migration_blocker, errp);
     if (ret < 0) {
         error_free(s->migration_blocker); <--------------------
         goto fail;
     }

Thanks a lot for Mike Maslenkin for the note.

Den


> +        }
> +    }
> +
>       return 0;
>   
>   fail_format:


