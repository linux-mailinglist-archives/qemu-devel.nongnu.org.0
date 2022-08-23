Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB9659D216
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:28:28 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOKp-0001lO-2y
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQOGO-0007pf-Ot; Tue, 23 Aug 2022 03:23:52 -0400
Received: from mail-eopbgr80107.outbound.protection.outlook.com
 ([40.107.8.107]:36709 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQOGL-0003lo-AO; Tue, 23 Aug 2022 03:23:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4l/Bsj3pqrMfcSYJrKJi64EUA+bC5ZygBpk4LdeoLNDUi7gt6q5niKGePQ9eA5TKi6Obb9e4l7Gi7etGncmSH4Bwh/p6i/0KjVDsVfyTSlAHjsBna6JgqDJ0kndbfbQPHGkSqzcV8bVnFcBlqN9+rMT3Kx3Y+dMbiSkpK2JbBMtBpfFbo8+cmIkE1YKaV4JD1YmFZNKNnLYlbNOel+A7nqp+xLzs7K6C0zDC5IxOUM/XNWvd29lPf8ucl8ORHi9WByd9AveRl1G0AmTNEMpGhr/cgHWjh6uvem0ywYiy01Dy7+xcAP4rHr3dLsOMrEKF45m/4HyUbILiCbBfXsNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9W9fkc7W8KLIKjONlSY3kjfk9+UCEIy7U3d1QFFCaE=;
 b=eHfZAbXn2nkcKZvykP3xzuY2h4Rhy+tXaGdSP3xau1QWPU4k4YbjqiRORI+9HV2x80gay6hQRc70+DkSjWioOPbvNxEDXt8kRyRV2uV9ITYB5kL4goDx8BLoHkvQoqtG2WVJNiMspHkeDzvb/G4QFUM4LBwXW8jXjB0k9RHIv7r6F8sJxvr3XN5SATf95m0CwNw5AtnhCpW/tFkdfQ/X0/zX4wY9/edoD2Tzh+p5Qha8J4G/ST8M6YiH4i8bJG1wtdtvTuDD0rz5+LnsnFB3Jzm6YXT1b/xMnc0CGdAjE70cuvOc8G3pJ8+1HIMCa5skywT66hEEOUA97ZykuoI1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9W9fkc7W8KLIKjONlSY3kjfk9+UCEIy7U3d1QFFCaE=;
 b=EKMQyMilpniEtqu1pPUCuz2U2VgJyvaR9Dk0NAAaotBebxyeWyp2iBNvEXu4EXLYOXliEbKH8744rCTL+lboX5g7AxQqWacBZbnhVO319kxCT4++2Im9YNrs0TSrz7anb4WOtvTt59RURp6bIvt7nu/eTEwa9YnGQyuEFJFxdXxDbW++A8vDQ786Kucxuaz6R+cN3m1V112t97Qw1BnDKeKKHHvEICvoqeMhnGo4QgbQbb71tfcNLYZ468Wgw7sJOb+4PtTg+efpeXB8mlsyUIc7UBeiSpLKP041QUusKbcY1ZVgfO7vALAmLGrFDwvDRh1E13Rj8slQLNRvBowSgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB3279.eurprd08.prod.outlook.com (2603:10a6:803:4e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 07:23:43 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 07:23:42 +0000
Message-ID: <c7c88a75-4e21-99ab-db91-bac5adc27f98@virtuozzo.com>
Date: Tue, 23 Aug 2022 09:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
 <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b150ab80-8d1b-49aa-e850-08da84d86887
X-MS-TrafficTypeDiagnostic: VI1PR08MB3279:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pw+LiJwZrQ2edO3my+CSHy49ZruoBW4WvuCVcx4GNXN3POg4GlpGAfsCyNe1uv2YU8FEIQSOihuO7jwfN8lyLFEYvd42kM3btKznee3inD40kzvuqL6ix3v7ivwzFJo4sttoejDu89s0b7TXLY2hATOkBl4OTET14jxR/QCvFFQeKdR32aslT6+c5HLMRwxoq+/fUCLcvw7AkNwMVj2Wc418KstpBGzbEileHimKqFAkFp/DhPSwPA/31eqOuxAsKwbxZZz4W5AvqL6ocHKdh2hY31yG9PgdEbqOWf7+ruw8iALnBiQtzSZYaEqXhEdbdLFzxYsi5fxQYU0A0azdVw5LYrKs2suPjyTkIT5VpQ/4RcaFu2CKr1QIqSQVMmwgBvuCbVfu3a9DNaZWPC0SrkWUtm/PPdjGkB7AIGtbdeIk//B1YS1Wgv0/BacE7i8ubCWYRGDghhkvu8Kb0BxuVOVTtMvAfgk0axYyvUiBiFtZFVacKXil0CVD6irwSW44DwhtlOBDfQxlN738zqFOoyJVhDwHa5FtQ5STH9GsWPUz2ZUaZZXIf/lHmtj1d9WLLvTm5IIvmW1Pb8MUfW63xdQVuu9ZWaZhHGvpYpGbpTk9svzfNYZK9FZziqm+dmvHronGNzBIoGXxbPaDl9g4FYJeUI4jnKEV2rOy10kQ9cuE0iCmtx7soJuhlwy/4k1MnJZheCuxaEE+dd14q2GGG3UGF0AYuRdgHOLsupb+gw2CnmpPIaARsir2TfX6k84nvS97XCU6seVni+ZKP4DJYVutPA1P1+lLcbbnrHmVBnBizWejCqAYxC0zQ5avFG5AFj3GfMM+qt9hDHPdUtLcsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(39850400004)(136003)(376002)(6666004)(6506007)(478600001)(41300700001)(83380400001)(52116002)(186003)(6486002)(2616005)(6512007)(26005)(53546011)(2906002)(5660300002)(44832011)(316002)(66556008)(66476007)(4326008)(8676002)(66946007)(38350700002)(38100700002)(86362001)(31686004)(8936002)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRpYkNHRjZYWDFaQ2t1c2lJcHp6WVBTYWZMU1FzU1JCRFRjL2VQY3FsOGEx?=
 =?utf-8?B?WEdhNEtBSlFPZlFyMi9aNTRlUUsvV0VOdjV0aHFHMDhPL3dLR3B1YnZIMmph?=
 =?utf-8?B?WjNoNGNVSEhSOVlabnJ2Ym0zRjRiS3R0a2NjWWQvb1hUVGpTREtsdiswcUF5?=
 =?utf-8?B?SEJ3bHV2SzVvRmo3dHp5OFlUUFpCNng5RGp4bm5yZy9RbmlHQ0NnNnFTZ3VD?=
 =?utf-8?B?UzRzRE15Z3VjODM2T2NRN0I5QWJLeEtvajB2eWdpZ3Y5Q1c0RGlGNjA2RHcw?=
 =?utf-8?B?UitDYyticm9Jc1A2T0hYbHA2V1RIcHNxV0U4TmQ4RHJKN0U1Wm9ycDh6Zmt5?=
 =?utf-8?B?bnN5NlZGb0ljMFlxNWFWSGhNVndWMzRpQmIvbWpoZXhEMGovdkRoMTdGNTVQ?=
 =?utf-8?B?NkRHYThqL1Vzdkh3MW1XdWw2UThBWHJ6b1NsY2NyRzhacjJpNHhDaG5MRXJD?=
 =?utf-8?B?QllpS0hnbVRDTWhYZ0VoMDN6SHNmZUgvRnphdVhnNmIzb0p1ZDcxMGRQWFE1?=
 =?utf-8?B?OURFQjYwclVjZm9GQy9EUEpxMzUwWXVWSEhNMjJleWdpVENxcjkxOG5tUXJo?=
 =?utf-8?B?SlpzanoyUXRXY1IwQWFKZU5TNEtiSzFuMG1mV1pONFBzdXNVU2dXUm9ZRllN?=
 =?utf-8?B?SnJBRVRDOXR2Z0xtcHNrNjlFN2NVVEJGWWNTWVFURVlRaWVVcVJLbEJjSm9k?=
 =?utf-8?B?TG44UUt3c1NhSkVUajdsb2xOOHN6RDhlanlvVlB0dWozRnRtaXNwOVV2QnV1?=
 =?utf-8?B?NEFxMFh5YXpGNzNaZWpoc0M2V0dWYzVPVWpvQjNUVXBVeTJVbjJVME5kL1Fa?=
 =?utf-8?B?dXFGbjgzS3YweG1XZ1BQYjhOMkdEVkM5ZGZwVUFXZTEwVHFhWnRBSXJneXla?=
 =?utf-8?B?K0lRSm9paTNsVGVDVFQvRkxxNHYvMnA1ODdWdzFFL0dWYURWWWtoMVNWSklJ?=
 =?utf-8?B?aXozWHNjUGJacGFsaFFGdFFIMDVrRVJEMGVSRWZqSk9DOUJaWUpWdVNrZ0c0?=
 =?utf-8?B?R0dZVElBUThWZVMreSt1bG8wRkdscys1R0RmbFcvYTVEOW9hVVkrZXFzZ0VU?=
 =?utf-8?B?MzNkN1FCcVphVWlaTk9OSUlDVUVOY0dEREFNdUdlSmJNN2JIcm1yNkpkNmdh?=
 =?utf-8?B?V0tEbklZREhEaW5LcTh1cTQrRXJ0QzNFRUg5WnJwYXhGMWZ6c0x4NDFuTkRq?=
 =?utf-8?B?SnREQ1RxdlQxNXNwYW5aTHpTb0VzMERJdFJKUzNpUVJpcEs0S09hNVdtS0RP?=
 =?utf-8?B?SmJVZUo5SWordG9uVWpWR1UrR0p2L3VEYU5mU2xCTnJUNjAyY0NleEpNNmcy?=
 =?utf-8?B?a0NnTzJMUEFpZmxuVmthQTFBOUlqdE1DMkY2QXVHQTR6MDZMeWVtWjNoK3FV?=
 =?utf-8?B?ZE94Y1BqTWJmZzVMemZlRUozRXBlNHg2L0ZQVnlWSzBHZTh5c3NtZVJwNzJV?=
 =?utf-8?B?RGRHOUpoWmF1dDVIWWdkakx2WkQ5VEs4eVEyUThJdUdSLzcrdlVveUcwNmdy?=
 =?utf-8?B?ZjFUa0ovLzFGVzdTa0xoWjNXSWdPbmx2OXNRcHNZSFhicTBmOUpPcFBGMm1t?=
 =?utf-8?B?YU4zd0hLZzZZM0ZwMlFKdUNKbGhMR0kwZEhGQmcyZ1E1RjFsaEMvMERYQVQw?=
 =?utf-8?B?R2gvdmxyM2RtUG9hUmUzUHh4Q3JxbU1MNGJldkR6YmpUdXlMQ1JJTjIvaGNn?=
 =?utf-8?B?Q3JHbWZ4MGhlREhQeWhQQzRoZFhMMlhucjRtaVZFZ3VMYjdsbjErOXAvTlBQ?=
 =?utf-8?B?emFKQ1phaGg2WmV6Y2FxQzRBSUdIUjEvU3NWZjBYWElaY3JaZnJ2QUhySjY3?=
 =?utf-8?B?Wm9sVkVoWGt3Z3pZQ3lwRnZDV2VrREluTVE0SkUwelU2OVh4bEcvSklmNC96?=
 =?utf-8?B?ZGorNURPSHZ4WVphM0k2SHNiS09ZcUFXNlRYYnJNaFhCcDk0SEVmTE9NbWkx?=
 =?utf-8?B?NnZkbTdxYm5jMTRjWStUejZ6ekNHVUgvWHVPVzZ2TmpGRkw1ZVhKYlFrSmg5?=
 =?utf-8?B?UFhsNmNtUVVYa0Z0bTJBQzczQWZyOWVEOG1WeldwSW9WTTFNUWpzemFwejhT?=
 =?utf-8?B?TjFsSW5DM0pGdVU4cEFCdVlCY1pib2dadEVkWG5EK0IyRGZsRTZaRnhTa1J0?=
 =?utf-8?B?Ukw5SVptbmdDakdKczNWYnR5WWcrV3RJWTdiaUdvRFlTS29hUWlnQStweEFI?=
 =?utf-8?Q?BXVg+4rwanyWfdU44X+PiRI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b150ab80-8d1b-49aa-e850-08da84d86887
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:23:42.9135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhI3Gn93EZbXeHyLrYAILUSJnbbThFO9sJ7nCFwdZW997RmULezl8p992w91936vnHoe4B6DaqrLVaa39Yw7f44GrSBcoDD1FIRvt+wxbGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3279
Received-SPF: pass client-ip=40.107.8.107;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
> On 8/22/22 12:05, Alexander Ivanov wrote:
>> data_end field in BDRVParallelsState is set to the biggest offset 
>> present
>> in BAT. If this offset is outside of the image, any further write 
>> will create
>> the cluster at this offset and/or the image will be truncated to this
>> offset on close. This is definitely not correct.
>> Raise an error in parallels_open() if data_end points outside the 
>> image and
>> it is not a check (let the check to repaire the image).
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index a229c06f25..c245ca35cd 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, 
>> QDict *options, int flags,
>>       BDRVParallelsState *s = bs->opaque;
>>       ParallelsHeader ph;
>>       int ret, size, i;
>> +    int64_t file_size;
>>       QemuOpts *opts = NULL;
>>       Error *local_err = NULL;
>>       char *buf;
>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState *bs, 
>> QDict *options, int flags,
>>           }
>>       }
>>   +    file_size = bdrv_getlength(bs->file->bs);
>> +    if (file_size < 0) {
>> +        ret = file_size;
>> +        goto fail;
>> +    }
>> +
>> +    file_size >>= BDRV_SECTOR_BITS;
>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>> +        error_setg(errp, "parallels: Offset in BAT is out of image");
>> +        ret = -EINVAL;
>> +        goto fail;
>> +    }
>
> If image is unaligned to sector size, and image size is less than 
> s->data_end, but the difference itself is less than sector, the error 
> message would be misleading.
>
> Should we consider "file_size = DIV_ROUND_UP(file_size, 
> BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
>
> It's hardly possible to get such image on valid scenarios with Qemu 
> (keeping in mind bdrv_truncate() call in parallels_close()). But it 
> still may be possible to have such images produced by another software 
> or by some failure path.
>
I think you are right, it would be better to align image size up to 
sector size.
>
>> +
>>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>>           /* Image was not closed correctly. The check is mandatory */
>>           s->header_unclean = true;
>
>

