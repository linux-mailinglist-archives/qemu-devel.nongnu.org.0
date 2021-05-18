Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77E387B34
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:34:59 +0200 (CEST)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0oE-0001Eo-Se
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj0eq-0005ia-Iv; Tue, 18 May 2021 10:25:18 -0400
Received: from mail-eopbgr00117.outbound.protection.outlook.com
 ([40.107.0.117]:33995 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj0ef-0007zl-4J; Tue, 18 May 2021 10:25:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa5tY4WJH7J8tVy+lWn2s+b3RHlBcpYTh5KI1EA+7aqSvRiU9N2zbRVHjyEzq21Qb76rRckGN7wepxlF/2qzqA7dqW/Zxw58X1jA54q0/mJw6ptO/85nUmEiZhEtkxDxUgW1pRG77KZBKaACxxRyJlszcJ6EJR+Bv/9ewXb6lMlKLuxHP3YPxZv7Pu8dmLvhWCCF3hZ+dqnu4FESfJUPZFQIY5S6WPMECZISoyqBID6coTPi7XtPsJQVOZVCbpz1jWfx2Y3qBOA+VUf2EfB/pBiZHt7USGZ+nYyWR5OS9DBY3tD3lpyHGivhbSaKuqjAPsYhRGnUjnXxruY947O+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/FeEm3swh0qfyxEOjwDC/WW0I2XaY/DuGPlE8Mz9M8=;
 b=Ra3f1hNJSgghzXLCOOHF4kUSXRDRnIGiiPBiPkG3wPv3FjjktDnhu+h3C8sz4l2b0db+LyOFuhae4Co9hBatYTh/vSDIH9mPAUdliupz/BR+CsiEBMAvwK06ImbdfnJ1kUqmnPIkTDm9Nd0SAMq8ESpHVaHz14IpMCC0pqA0ZXBZIM5jbhr0Nwf5cXiY9/WN0TeHar0LXl7+RkK+Pfc4dHcCvv++hNC6ndv73SI7/aSDcs3xdjpYrjzlLaSEu4B4sDiHZ4hR5lAAelOzyrfrtR7zGZ9YP/ZXuMvGGBTivro/vx1QjB3Gd3tod209z6k1MU6ooq2v3lpA4qTZSpwSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/FeEm3swh0qfyxEOjwDC/WW0I2XaY/DuGPlE8Mz9M8=;
 b=P6R934DZBo2A5bLiLOm0cdyPKq8TLT06HjD8Usc66JZCoR0Zv1EhgZpWUzbSOQ1m3iYRQ6GJDQzNCL3jLVWNNOE7ATFFlhVYhkd/pBdETu2chcCFJQ0LN9A1Py6H2npSrv9y3m/X2psbtc9eLGW1WbOAbRAr26lextGsFkeYJxU=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 14:25:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:25:01 +0000
Subject: Re: [PATCH 16/21] block/copy-before-write: cbw_init(): use options
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-18-vsementsov@virtuozzo.com>
 <7fe834fc-741d-bac1-b325-35092473313e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a8694b70-e411-ac27-8dd1-8081c7a03b39@virtuozzo.com>
Date: Tue, 18 May 2021 17:24:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <7fe834fc-741d-bac1-b325-35092473313e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: ZR0P278CA0085.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 ZR0P278CA0085.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 14:25:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5c6e222-c93f-462e-45a5-08d91a08b8ac
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3447591A09D4A150FA55340CC12C9@AM6PR08MB3447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: euj+LJig9kjemZDVR3h9F3/U+2EN1Jyu8XNdvQS0AZkcsvQ+g6cV9g7fbD7D/Lsea8Yszu9I7fceWDhVX0q6czqzCRSQo+ta56BNhGuEbiYRvs/Hb2qOfJuN3E8LKJ2WAzsjripM4XqjMN+P0ZpyAdDA/bHMvEAsceiEMidzU0iubsyevsjUZrfaaBwd7DQsvZHx7eKWe8p2DYV7cRQH0RLHh17PeQPtfc+J4ejst7DDkQgF/xdJPvbsHzeXSjb9cOFCVsyqDdxAHZORosnObUrr5M2QeicsYXLtkCF1tXHPw/yIQtuH+iZfR7Enj9yQXc3dKKfSq4sgJu4TUBsW/1+tOmYAcR/xx+zuWrw86uOA4jXQ5jNcNB5ILxC06Gu/Gx7il9l5kkH10bFZ3bLFS1a9OyJEKTGmimOeIQos6rK7yJkDB3yOOksF2b4AZGQQs19JpOUpCEiB4qU5QK6VQD+A+tl52DliFkndOaGtCbrjShZWx/HMSkLPn6NsSU9Mro417KCrVLfovkgMqWIuytv2ydrIu81vrN1L/Segteokmh90hUkSrqOipOGchfV5Ji0HhhozR16v+Yg+lgxnCapkL+kYc1eokNztdBVgQkHzuB/y4W3r0B0vSFF90cPaXHhrkFvyQeUttOajMnnoOBPMBRYv0VB/GdOyHZlDuCBrhkyUZYnRsxf2EpNAT13YAWEA5U/XKVYVmHbxtraMUFb6/vXI3KSo+R7leKFP2YI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39830400003)(396003)(346002)(52116002)(38100700002)(4326008)(16576012)(316002)(8676002)(107886003)(36756003)(86362001)(38350700002)(31696002)(8936002)(16526019)(186003)(478600001)(53546011)(2616005)(956004)(6486002)(31686004)(7416002)(26005)(66556008)(66476007)(5660300002)(66946007)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MEwrQkp2dkdURlVPa3RWR0RwdjZuODk0TjBYNWRFR3BoUWttNnI1eW9HZ0xl?=
 =?utf-8?B?REVTYmEzTGlqTWNmcmRsQ1FIZ0toNkF6cWhtWi9YUVBvNDEvRm9xQm5RcGFG?=
 =?utf-8?B?REZRYVlKL3NkWTBPdTcranlWZ0lHNEVGWGF3UmRxdWY4RDZMWG9WK1hYUFha?=
 =?utf-8?B?Skprc0pjTkwxcWlMSDlxQ2hWUDg4NVJTcHkyVzlETzFNclNXWGNWVjNHZkRE?=
 =?utf-8?B?bzRXWS9LRURScnVNbHdrNFJndGZ3ZHp5MUNXdUZMVjlMQWJuLzhCT2RLS2hW?=
 =?utf-8?B?RlpLNEJiT0lQMnlwTVVVWGtySDB6emRYRjRNdGV6RDg4ZzhmSk15RzBmdTdp?=
 =?utf-8?B?NDNnWmE3OHBuQWNIWFZqSUdQR2NyekIwSnhZRGJjQ2g0U215YUY4SjF0Wndu?=
 =?utf-8?B?L29PUDAxWHRPbmEyMDdQakE1QjhyekdYYndHODhIMUdHWTUzMVkzTTB6U3V1?=
 =?utf-8?B?QTFzNmZiM0paSGtTajZzWmFCNjQ1TldYMHNLMDhrcGJLcXBRZWIyY3YxRWxi?=
 =?utf-8?B?b08rSTd1ZXVJRmJhTWdqajBxNTJEcExESWV0ZUZzS1VoNFRNMGxCbFVaRmFi?=
 =?utf-8?B?QVp1bVNkb0t6K1IwbjFhZnFxdmpqc2xCWm91WFJoaVFsS3d3ZVNmWmNOektk?=
 =?utf-8?B?UFpuQ3F2MTRDZ0pQdE8zZ0hEaVVDOUlIQU9hdW42U1ZKZGFybnJuT1VhNG1m?=
 =?utf-8?B?a085dlJ2emwyUTBjS1FkcFBaQ2hQdXQ5ZHg0VDNIejFxNDVqSEd2b1I3ZEx3?=
 =?utf-8?B?Wk96RzRmQkdudzNhQnliN0hCMW9henZ6WUNyR3BudENvamFsNjU2T2R1d2tn?=
 =?utf-8?B?dWxpTXZDM2F5YzRkU3pPVlU3OE9qMklqTElaSHJ1a0hzYUtzMnNPemFYSk85?=
 =?utf-8?B?a3FMK0d6b1FlMDRQRG5BcERtR01adHl2S1BCeHhnZWsyN29pclY2VHpxSmpu?=
 =?utf-8?B?MjZmb1hqMGVUUjVGSmRKcFZtaU5hUGdidXhxRHV4NHdMMGJtQTFsUHpjUTVv?=
 =?utf-8?B?aDRNSnc1STZSbkUzRXRlbDkzbGNCeEpiVGtGTkFjRDZ2N3k1eVlhOVpGVzVv?=
 =?utf-8?B?elF3Zis2dFBNQXcvVjdoNGhva05jb1FIUktXZWxxZEwwZnRoM3JJd2llSmZO?=
 =?utf-8?B?cUpac3NyZlJkcUJtNjEyalU2bmpkb3l4alB1NVlpSXI0MEJxVmNoM3g2VW5O?=
 =?utf-8?B?alhjMk8vdkQ3eXpnMkFPZVpsazFLTjBRMkhEd2kranY5cEJDU3cva2tXL3Av?=
 =?utf-8?B?T29yNGpzWVZ3eHhXVkhvS0hkc3FGbTRnNXFPblRUS3kvRWwvSWNZZldVdEIz?=
 =?utf-8?B?VjFtMFR0bWRiT2xpVHRITkFpRWg0NExpdnRxZ3c2eHdPMDBQZ2tUTjUzcmpE?=
 =?utf-8?B?anFuT2hXVkdUdkR6bUhxUjVuQ2toYXpOYU4xZmFhTnlaQ3c4eXRCOHlTUWhW?=
 =?utf-8?B?Q1dZUFYzNDZ2c2xuYkhNazg4Unh5R1pZalZ3SWxhMCtZSEhUcC82ZGg0OGhC?=
 =?utf-8?B?ajZBUU9GZ1JuUXZwRnVNbHpjZnVBSUlyWktpemcrUEh4S2JaaDdraUIxUkFM?=
 =?utf-8?B?QUpYM3pXd2R5d1NrYVdDQUEyTldNUkxqdElLZnlqQ2RsdGxoc29mU3V5dU9B?=
 =?utf-8?B?MUlkRGFCZEtlNWZXK1RoSG96SEhHeEUvYmZId2E2Uk5qYUpCc0Y1QXpadkEv?=
 =?utf-8?B?dlhlMEJtNStEaFhtUnJSYnVrVnVOSE5mMTUxTnNYdUdGa2orUmJBWGZOcUdS?=
 =?utf-8?Q?j7LkhRb/1sCmuR6hsnI0KEf6QGeXS1CvBQ4gcNr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c6e222-c93f-462e-45a5-08d91a08b8ac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:25:01.0800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6WtglVVqq39AiRqzO2frbRYpQjOhW3uPluZfmpc8m/2DU9W00KW2FS1PfUoTeli124Fu8ja+QSMjvhtdtkmQ6qGjJJjnyxE5a9wYJSNU4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Received-SPF: pass client-ip=40.107.0.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

18.05.2021 16:56, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> One more step closer to .bdrv_open(): use options instead of plain
>> arguments. Move to bdrv_open_child() calls, native for drive open
>> handlers.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/copy-before-write.c | 37 ++++++++++++++++++++-----------------
>>   1 file changed, 20 insertions(+), 17 deletions(-)
>>
>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>> index ddd79b3686..9ff1bf676c 100644
>> --- a/block/copy-before-write.c
>> +++ b/block/copy-before-write.c
>> @@ -144,27 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>>       }
>>   }
>> -static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
>> -                    BlockDriverState *target, bool compress, Error **errp)
>> +static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
>>   {
>>       BDRVCopyBeforeWriteState *s = bs->opaque;
>> -    bdrv_ref(target);
>> -    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
>> -                                  BDRV_CHILD_DATA, errp);
>> -    if (!s->target) {
>> -        error_prepend(errp, "Cannot attach target child: ");
>> -        bdrv_unref(target);
>> +    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>> +                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
>> +                               false, errp);
>> +    if (!bs->file) {
>>           return -EINVAL;
>>       }
>> -    bdrv_ref(source);
>> -    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
>> -                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
>> -                                 errp);
>> -    if (!bs->file) {
>> -        error_prepend(errp, "Cannot attach file child: ");
>> -        bdrv_unref(source);
>> +    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
>> +                                BDRV_CHILD_DATA, false, errp);
>> +    if (!s->target) {
>>           return -EINVAL;
>>       }
>> @@ -175,7 +168,10 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
>>               ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>>                bs->file->bs->supported_zero_flags);
>> -    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
>> +    qdict_del(options, "cluster-size");
> 
> What is this about?

accidental, will drop. (it's a remaining of my first solution where I tried to pass cluster-size, then I decided that's better move cluster-size detection to block_copy)

> 
>> +    s->bcs = block_copy_state_new(bs->file, s->target, false,
>> +            qdict_get_try_bool(options, "x-deprecated-compress", false), errp);
> 
> First, I’d keep the `compress` variable and use it to store the value, because this doesn’t look very nice.

OK

> 
> Second, what’s the story here?  “deprecated” sounds to me like you’re planning to use a different interface eventually, but looking ahead for a bit I didn’t find anything yet.
> 

I should have described it in commit message.

We have "compress" filter driver. So instead adding "compress" option to every block job or filter, user should use "compress" filter. That's why I don't want to publish compress option for copy-before-write filter. Still we need it to maintain "compress" option of backup job. I also want to deprecate "compress" option in backup, then everything will be clear.

> 
>> +    qdict_del(options, "x-deprecated-compress");
>>       if (!s->bcs) {
>>           error_prepend(errp, "Cannot create block-copy-state: ");
>>           return -EINVAL;
>> @@ -212,6 +208,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
>>       int ret;
>>       BDRVCopyBeforeWriteState *state;
>>       BlockDriverState *top;
>> +    QDict *opts;
>>       assert(source->total_sectors == target->total_sectors);
>> @@ -223,7 +220,13 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
>>       }
>>       state = top->opaque;
>> -    ret = cbw_init(top, source, target, compress, errp);
>> +    opts = qdict_new();
>> +    qdict_put_str(opts, "file", bdrv_get_node_name(source));
>> +    qdict_put_str(opts, "target", bdrv_get_node_name(target));
>> +    qdict_put_bool(opts, "x-deprecated-compress", compress);
>> +
>> +    ret = cbw_init(top, opts, errp);
>> +    qobject_unref(opts);
>>       if (ret < 0) {
>>           goto fail;
>>       }
>>
> 


-- 
Best regards,
Vladimir

