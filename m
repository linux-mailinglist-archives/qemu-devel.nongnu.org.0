Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCFD387B40
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:36:13 +0200 (CEST)
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0pQ-0002uJ-9q
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj0lu-0006PM-DU; Tue, 18 May 2021 10:32:35 -0400
Received: from mail-eopbgr10115.outbound.protection.outlook.com
 ([40.107.1.115]:56641 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj0lq-0004Ep-Te; Tue, 18 May 2021 10:32:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZjURbyMFo7/u3BTyhJcBWlly5bb57y6XdL6RO2yCqNWd+jsmV1EdpQ0zbiumm0GTEVOGltAd5ylYkIxCEh3aMO0nB7qpvoq0cKJnq53T4xyYUMtFbGn3s1/UOsxU1Z+cVrPfsX3qBixFSuNw+8GRg5HME2HBsNejCbNLLcKqqzXfyH8pxBMJ+AG2fEMpkOcRD/HjvdSM9VeAW5+EmirfsXge7pcQPmPDCmUi9fbD8MaThKXfUT8rs+Y7wLwOZhx3/E9Uxq0QnB30qsG0N4NDuJZNZepKFvqyRnW6U66QSkeJh/350q2aXMJ0344N5GP4y5c98mmcvTHxCD+pDeOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qf26By1Sqp0r4QECS4YlYcbj67Naw6iFBSJWXNtKoSQ=;
 b=Rc9ran4fybE/mVDcjAa5vVC4exkioaiZWuGk79nf//e7Yzj50/twj7zGgjAuUx4sMjYlpx8idRcWTZgq42EkxLUC3lOjWeh6zaJc2DfBZ9pb32fwZeW1KPi1V2xq6FY8IUhUk+Ulpkt8aPJoLOLEmpELaeEUThO7NHpThDMt/TsbGFI9Fw92saYKDgRDCHZSs8lyPlzvBFS85ZT+TtOaZ/UR9r4bFLO63zwi075Halh6h05298q011N88dhZysPyEvV7/3X0NECUXgOjy5mmg4+S903EdJIGIRWHOLaLOAC9+lcIyfNzR3TYztF60QCsJfPFPevetumxbM3prHp5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qf26By1Sqp0r4QECS4YlYcbj67Naw6iFBSJWXNtKoSQ=;
 b=XcXLtxqy8VEkUNiOY0dGg60V48w6hqkuEu5M5R4AKiFCM9Uxb2BCurmoRdkXpSiEGnx/fJee6b4K3JmqEW2ty8PNVMf8NFvQi3CQY1n4/EnTHU/jVl5At5Oadwq5hGtHAFCYPnOFjM5oV2TppqNUQzmk4HmUAAqpt6VO5la/V9E=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 14:32:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:32:27 +0000
Subject: Re: [PATCH 16/21] block/copy-before-write: cbw_init(): use options
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-18-vsementsov@virtuozzo.com>
 <7fe834fc-741d-bac1-b325-35092473313e@redhat.com>
 <a8694b70-e411-ac27-8dd1-8081c7a03b39@virtuozzo.com>
 <cf3b987b-4426-0378-c5bc-17ae9454b05b@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1a8cb818-6290-200f-908c-5938a4de7fbe@virtuozzo.com>
Date: Tue, 18 May 2021 17:32:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <cf3b987b-4426-0378-c5bc-17ae9454b05b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: AM0PR03CA0035.eurprd03.prod.outlook.com
 (2603:10a6:208:14::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 AM0PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:208:14::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 14:32:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11c3867b-9586-433b-4a0f-08d91a09c27c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151EDEE29EEEF75ACF2BB3EC12C9@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: joeNLN+3biXiCvYK9oO958WV8EFqMCCxriHZ03HEdBNR0VfSBfFvRLiYFzB+d8czr8RZbOFukkAEK3RuZn5QzLPYJ5yFytUc+tnsOXywZokAor59ScUlbNNxQCxIfs8dYqF3vYcrEy5bqLbUV9hbDf5NVltaam6/K4eWg6DYUYhAsOkNX2zoTckE/ArikL7OVdqJzgeVZ92nKlfA09O5GV5OopzCLVqmWTNHlwY4S6I6OHQyqkiDuVBng9GcD+UaoByWc2dsdzR3ekGDUY129cJfWXJcpkTejrCzzcQ1D2HRQlMqkOaonBF/Vr/15MOmov4bSECxNbaz3tBrYXIO1l+z6galA3UAH8QHsi6qKcdg2oHJRXiSzf0y1umwoz0TIVIX3nfNKv4W0XGMfpoJkYgEPrP52raSiCf4u/S7RKXhh2dJwm/I99zrmeyai3mmrN3NtoxMk0bDiQoqWK2W109LHbPoQ3qAYUSLPIrPg89lTeXuaeG61F0rHpgtcC3JEU3qLWBA88wuapnhKyymPQ/jy+J9EpzvCBUcYBlr7NHjzYLCK55tHfr60y0nUnMcEGoKtRl8WxZZjKlXNsuyOpcd64+GVqnRSs8SDsPKX1LVWCvw15AMXz9M2gj8QZXPKZabSACpj/eJGbehKEdKrc3lpX4sG1/RGJCcVYNLcKy/TLmx5SF/BWK36WiwkZroc409BP6tT9PG6BKxxywNoJLcIORMJaugs/RjC8oenjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39840400004)(16576012)(26005)(16526019)(316002)(478600001)(7416002)(4326008)(2616005)(66476007)(5660300002)(2906002)(6486002)(52116002)(86362001)(53546011)(36756003)(83380400001)(31696002)(107886003)(38350700002)(8676002)(66556008)(66946007)(8936002)(186003)(31686004)(956004)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ym9Eb0JaSjJGVHVKNFlBRXlGVExrOWxKSE5hTnlPcmVORXRyYUdqZldLMUJl?=
 =?utf-8?B?YXppbU1hSXVlVkxmSkFVTWk0R2dOTHBuSCsreTR2RFdIdlBTbzRZQ2t6TTdn?=
 =?utf-8?B?N2ptR2dkZzlMSHFCS3c5SWQxNFYySmE3Z0t0TFJqTlpGZ3ZvQ05zTWhHOVZI?=
 =?utf-8?B?NEkvNEV5RDJmTjVZaWVHcVhFa0h4YjlVRDY3dnF1TitHSzE1YTBmbU85a3F5?=
 =?utf-8?B?OWxQQ25nZlBjSXZQQ2dpc1p3ekNjeWk5UWJhY2oyNGI4OEJmbk1yTDM5NEd3?=
 =?utf-8?B?RTVZTXhDeFdacmpURCs3L2JNRWl3aGcyK0dGSXpsWjNPdFZIdEIyQmtNci9Q?=
 =?utf-8?B?d0tDbWtSczE3VmU2RlBObzZCUVltM3BBOW5ob0QzeXE1dThjVjBTRTJCNEFa?=
 =?utf-8?B?OUlLTzlUOEpzSjF3R2swRlpWZXdzT0tucjNyN1c2eWY1dXdzTmRvNC9BdVVT?=
 =?utf-8?B?WENJdC9LL2EvMkZwTmlXU25MRGZCTHViZEk0OUtmdnNibWpETVdCZS9NS0J5?=
 =?utf-8?B?NnA2V0JaWTF1dDM2V3RUSEFpRHlnQTJNLzltbUJsMDJwVWdiL3lmQkk4V3pD?=
 =?utf-8?B?YmQ0VElRcW1RYmF1S2N4ZTdaMnROUjQrTExkc1A1aDhUUHI5dHhXYjVCSXl2?=
 =?utf-8?B?Z3RjOStSU0N3REVvYVAzWWx2U1Joc205bndGSFcxcDFrU3pHdEZmSGZqNmNy?=
 =?utf-8?B?ckZXeUk0aDFHT0M0S0ZGRXFHbkVSd0l4di9USGJzdkJqTHUzTlZaV0FTU3Q0?=
 =?utf-8?B?ZXVtdUx2TkRwOWtEWWlhZU9IWHRLQ0F6emx5RURBQ1IwZjdlQXdCcitWWmNl?=
 =?utf-8?B?eFg1ekRkYTcySktCb2xTMVI4V0w2U0taWEg2cEZSdFgvSnVsNzdvcDloR0RM?=
 =?utf-8?B?Z3pham9OQTlmWUZJV3NiZ0FqdzYvaUh3MWQwNHI2TUU1N1k2QkRPT3IvUlMx?=
 =?utf-8?B?anh5elQwcnoxRmFoR1EyeGxNWlAydThTQWNsc2NmSVBOVlZ6MUg5dHRPa21C?=
 =?utf-8?B?a25PTUErRk5lR1VCNjMzMk96bFF0TEpRL3RHbXEyQUl2ZWRZRzhMNHJpOCtp?=
 =?utf-8?B?N3Q1UXVKN2pXQjFEMFJjeDdURHNRYlQ1Kzl4c2dpL3doUEdRTTJDSkhXYStO?=
 =?utf-8?B?QUN4dDE0cE9FQzVFakZqc0twcnhGNDJqWjhRMzBlOVYrQjI4S3JzZ0tudmtX?=
 =?utf-8?B?S01vRE1obW1RVWFFVlY0UjFsZ3NVelNUMUxLK0ZzUmhYZEdzY2xLOWVZV3g2?=
 =?utf-8?B?STBzU2h3VURTN1liT1gxMlU3cUNVMU9WSkhqNmZDZTQ5bGQzakpKMTRtWWpD?=
 =?utf-8?B?eEdwUno1L2Y3cktmdFYweTJuRnpDZWtoQXJZSWU3TGpDNkxkUGxmUXRJNVJO?=
 =?utf-8?B?bG9xeVBrTlFhYWRmUVVzQ0orZmZ5QTAvRGxHR045MG5HdUU2VG1zOHBBTVBD?=
 =?utf-8?B?ZUV4SW03anl5YmtQaDBlUjJMWWtPd28xRGVZdHFxVDNoek5uQTFoWmMvV0I1?=
 =?utf-8?B?Q0FYZzJLdzZTUGxBVWZTN0Q3dE5EUXZwVU9YMFFSSkFaOVNFOUJYUUJRNmFv?=
 =?utf-8?B?WCtWNnoyWDVhVGRNRzVnQnYzaGwvaENWNnlJQzVHODZKYXdCcWJzdjkzWFVF?=
 =?utf-8?B?OVNEUTZscHhvQW84T0pILzM5SXFiSnhKWWVoNGFMbCtpYUloQjZGVmJJQ1pV?=
 =?utf-8?B?clVjcDUrQ042NEJJZ1B4WWkrQkZaOERINjhMc0xVaTJvUjRDQ2FPWnR1NXhv?=
 =?utf-8?Q?CzrM5G9heIyuko0L0hTWcHVinOMzQJOliX+z61O?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c3867b-9586-433b-4a0f-08d91a09c27c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:32:27.0345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ly+/fsvjpmDdsTb+r/0TA/t5zhEEE018pd4ohvOYMK5tq9CD6KveGVEVGEfn4dmbYfwNLcaKB1U23ucV1e8l0htlFaTiqVwJ9wsguegWJmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.1.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

18.05.2021 17:29, Max Reitz wrote:
> On 18.05.21 16:24, Vladimir Sementsov-Ogievskiy wrote:
>> 18.05.2021 16:56, Max Reitz wrote:
>>> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>>>> One more step closer to .bdrv_open(): use options instead of plain
>>>> arguments. Move to bdrv_open_child() calls, native for drive open
>>>> handlers.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   block/copy-before-write.c | 37 ++++++++++++++++++++-----------------
>>>>   1 file changed, 20 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>>>> index ddd79b3686..9ff1bf676c 100644
>>>> --- a/block/copy-before-write.c
>>>> +++ b/block/copy-before-write.c
>>>> @@ -144,27 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>>>>       }
>>>>   }
>>>> -static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
>>>> -                    BlockDriverState *target, bool compress, Error **errp)
>>>> +static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
>>>>   {
>>>>       BDRVCopyBeforeWriteState *s = bs->opaque;
>>>> -    bdrv_ref(target);
>>>> -    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
>>>> -                                  BDRV_CHILD_DATA, errp);
>>>> -    if (!s->target) {
>>>> -        error_prepend(errp, "Cannot attach target child: ");
>>>> -        bdrv_unref(target);
>>>> +    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>>>> +                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
>>>> +                               false, errp);
>>>> +    if (!bs->file) {
>>>>           return -EINVAL;
>>>>       }
>>>> -    bdrv_ref(source);
>>>> -    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
>>>> -                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
>>>> -                                 errp);
>>>> -    if (!bs->file) {
>>>> -        error_prepend(errp, "Cannot attach file child: ");
>>>> -        bdrv_unref(source);
>>>> +    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
>>>> +                                BDRV_CHILD_DATA, false, errp);
>>>> +    if (!s->target) {
>>>>           return -EINVAL;
>>>>       }
>>>> @@ -175,7 +168,10 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
>>>>               ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>>>>                bs->file->bs->supported_zero_flags);
>>>> -    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
>>>> +    qdict_del(options, "cluster-size");
>>>
>>> What is this about?
>>
>> accidental, will drop. (it's a remaining of my first solution where I tried to pass cluster-size, then I decided that's better move cluster-size detection to block_copy)
>>
>>>
>>>> +    s->bcs = block_copy_state_new(bs->file, s->target, false,
>>>> +            qdict_get_try_bool(options, "x-deprecated-compress", false), errp);
>>>
>>> First, I’d keep the `compress` variable and use it to store the value, because this doesn’t look very nice.
>>
>> OK
>>
>>>
>>> Second, what’s the story here?  “deprecated” sounds to me like you’re planning to use a different interface eventually, but looking ahead for a bit I didn’t find anything yet.
>>>
>>
>> I should have described it in commit message.
>>
>> We have "compress" filter driver. So instead adding "compress" option to every block job or filter, user should use "compress" filter. That's why I don't want to publish compress option for copy-before-write filter. Still we need it to maintain "compress" option of backup job. I also want to deprecate "compress" option in backup, then everything will be clear.
> 
> Oh, that’s true.  Until backup’s option is deprecated, I think a comment would be more useful than a note in the commit message, though.
> 


Agree, will add


-- 
Best regards,
Vladimir

