Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87C05A28C7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:45:23 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZe9-0006Bo-8O
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRZIm-0003dB-Kr; Fri, 26 Aug 2022 09:23:13 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:1280 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRZIk-0004I2-No; Fri, 26 Aug 2022 09:23:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR/Eso3M8yvarEzF0sskkBcSKBDKEyzEkZWo9VUZ6e6IiGp3vBcz8bJLEMxPgy0ZQAdaUSt3wW0yyzueE7AsYSKtLcnsQ+js++Eb6GbIeNMz3rqtca/ogLDmrQULjgEg2+55FchmW/9JU1Q05rW7p3sLNurke9UekXbU07MkoZIIw/2I4iawLZpIBxR9LH+FU0i3RtpHDRvdJfXO2cR+ZPlNCtGWQ1xnJeylrnknXGRpT4H8fa1aYKVQWBiBzSH3YJe+jCA3zgwE5GqQOm0xtfBQ3TYBtw5n1Nb67cXl7GagZi5fIneryzJtwSbGg1L44YyDb4SS/FnA1uWlAqBd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mfREps8uo0jlEdBw7g+ZK/zaSlg1LSpL3UnApxjX8M=;
 b=nRnOWlRhADqgKxKxEW6wiLcOf8jpdZUggjENxuR8TCdB9foDhnbxYVHFrUilN3z35H9p9XP4q4f59/MXcLsx//757e8SOGVGPwcOK7m41OPIhLETmTG2Og5GSCwMldOWn0dES3DyjNyvhDqENKH/4Vkqy+6bCTIiLZWCMoPQ1z0e89e2/pu4+7Gb7onpVpoxd99o3GA/w8Vy7VBNDSM8WCkVR6tha12WRVHesU4HPyzr7QE9+ysqUq25NctthROgINpexKepnNMn+r2d0vwdjHDXSvO/mJ9xNHTAkgwgjNIq0PaH0jzMptLbHtFAl4y4myr5fIu1j2TpeGFpvWa3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mfREps8uo0jlEdBw7g+ZK/zaSlg1LSpL3UnApxjX8M=;
 b=Wq+9dM2GtCJVgvWUwYonNYAVIbU3afC66dupNUyJxCZ8jXV5hLItoKHpNsqT+J7dp1az5/SEdFNr5iuYuzGyErNsrLsy0jEqfNFx02Q8Yplx3F4YUGBbBlzqygZlIytzVHwxonlIghZ9CfV2QGtY8IRZgrAnDU5paVSmimIaP3aRMs8lyZzh3JVwh79u5Z3CrbK4lHZFxPqLZWiX9mI0kC3qxVCqcmcl5C5UCX/8Oa0U0taLvE3+HIeAy2Us36dTqjny/S6BC4P0lEKxRfFEWYE+SuBB1EEIgnY1QvYKnCWo+4dG5+7NWOF38vBmb+C/Abm9oUqzyzEGH3OptOtzlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB8706.eurprd08.prod.outlook.com (2603:10a6:20b:564::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 13:23:07 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 13:23:07 +0000
Message-ID: <3dc87536-2a35-87bb-b512-80d1df4fa2fc@virtuozzo.com>
Date: Fri, 26 Aug 2022 15:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 07/10] parallels: Move check of cluster outside image
 to a separate function
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220825143109.176582-8-alexander.ivanov@virtuozzo.com>
 <894e03ab-4cbd-da6b-7f95-df1912d3f47e@virtuozzo.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <894e03ab-4cbd-da6b-7f95-df1912d3f47e@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 155979e3-bbb5-4ec7-3720-08da87661d46
X-MS-TrafficTypeDiagnostic: AS8PR08MB8706:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pv03ZqykNJ4Z/gyYwwnZmRzMRsWRRAijEUr0zPP3rUC6B2WbeEiJirsrJvMFcXftp+sz48JQofx+9d+4LNeklUfrFDKfR3rRzbbVzwU5RWPwycZV1pEqiNC0GuUd3IgNXb709vQ5FrKmiyHiG7hQesBTD1USXdTdXeoLwgqzhmkn4nSy170kLYOoADfYLANlheAe0QVudYHvJseznq4WAmUMfoCRT0DNHq0hShvA4ARAuKuyM597mjEimlwq1lwPCQ7LDoWD7T2v+l+tgQp5+pbwMkRxW7euzuCq1VRRQS/J7aubYZEYtC4U+yWZYqW6LvSKqHXZlh1dbljyTzfLzA0ikvlQz5QHrF089t6mVy4S93iDt4mQLSIGRGR+yMmG0cHTkG666kFXmrZCZns4y5aomG3THmbVBlFyQWaz7VdeMvS3sNtIXiNOncDCY0UUbfha49xvhLbkgyu1nIboCYTkPUPrXG3BPtqOMTVOq7p60vjJCwbKIcyTbjauFRJLBARRZiZ5CK+ncaHL5Xus9FR/ZWFbBAkewIACAwLY2hLyqhBK1Kkz7Enl/JFpE8j1IZoHxHoqz0KzBgTvg1huM/GyB38AkAF+F0x5UGvROfTJAFYWTjEK9F3uh20f3iO9Ab8QzsXV4ZYzTvMd7Olc7iVgVClvGsWAuwJgbOj/ueqPIVf5vbZIQrOPNoF01NYArRr3jhwizlf0oxoGgm0IVJngY7OVsqAVe5w6QmS1zDNpBxJ1hBRl0G9kJD7BnZiNyH5Yf91oyFDDF4AkRUQNcwl+4wP8yXaMX+IUXOGxWnF7ZIxJ+zIl/Q4B2uqD1VF1eVVIgz0b1MWqCoixAfQvlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(136003)(39850400004)(396003)(66946007)(66556008)(44832011)(66476007)(38350700002)(6486002)(478600001)(38100700002)(86362001)(5660300002)(41300700001)(4326008)(8676002)(8936002)(316002)(31686004)(31696002)(186003)(2616005)(53546011)(6506007)(83380400001)(52116002)(6666004)(6512007)(26005)(36756003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJ1YTFUbllpYjYzcU5VUTRsY0hoT2R0UHJNRUtaUVNyZlkwQWVNbW5UOWpV?=
 =?utf-8?B?ZmJwakVrK3JmaXBnd0hKQW11OU5ZL3p3WWZCTGJmeWVjUjlrTzEyczh0UUhx?=
 =?utf-8?B?RkZqenZOUklrSHBlVWxHOE44bCtkTFdzRkhnSGNibUsya01XQ0VvRzc1WC9H?=
 =?utf-8?B?Ynd1QWl5L2h6elYyOGx4bVNRYmlnTWhsNHZxYmFFVWk3S0YzRTByN1NHeDA1?=
 =?utf-8?B?ODVoTWhKMkFiUGZiRWQ2WmxzMmpYMDgyLytCVkp1Vm1SSzhMRzY5d29jRU8r?=
 =?utf-8?B?bWtrd0VFVFFqYXEza0pvZGgxYkRYMWZQUEI1RUdTNlNESWQ2UHlSNCtrUXNI?=
 =?utf-8?B?dmdvOU83R04vRXRpaXNJa1BrbXd2K2M1T0MyeFUxNTlmUWpLdkZjWkF3Rk5U?=
 =?utf-8?B?RytGdjlhSVNHazh2bWNCcytpT0crL2toeGtsdFl1V2lmUmdzaGVna2JRYkhJ?=
 =?utf-8?B?K1Z0d1ZsemFrdCs3YXhHYytoK1NMU0tvenRad3hWOEVBY1pUcFhsT1VuVFc3?=
 =?utf-8?B?bldlZnNyb3NGNEVuWFpmRHpVQ3BvdjAyRVUvdHJPNVFqMGF3eFdkOGE2WW16?=
 =?utf-8?B?c0RqQ3pJNG1YVTFRVjVuYTlpL2Q5Nm9BZ0phZFpDQkp6Y3Z1UDlOTDQ2MHJv?=
 =?utf-8?B?QTlYQkJ2dzcvaUpzQUI3MFIwdDA1d21FdWJUMXdDaWs2bklFeFRqVWFqMnNW?=
 =?utf-8?B?K2tDcnVEZldWK3BteXUwYytRRHlWMGx1dFl4Wnh1c1A1dXM4M0JmQmNJV3A3?=
 =?utf-8?B?WW1JZWtmemk5TE95Rkk0M3ZCV1N3V2JWd3ZVRDE4dHFFdFVMRndZUm1KaVlx?=
 =?utf-8?B?d0wyREVCMlUwbHhxNytiM2t4VlpHWUk4UUMwTmxzYXY4bnBHRlVMMWdUWVp2?=
 =?utf-8?B?T093WXp6TVI1NXlodDRzTlBuVG0rL3czN05aNjA1eFhRbVhjR0tCVlBkTVdz?=
 =?utf-8?B?WThIdHF1VXQyNEZKVzFyWkRFeEV2NjRaUzNEbnBNT2NXK1BHUnhUK0FwdXlq?=
 =?utf-8?B?ZnlGaWJpYVpDazNYd2dtSHVtZFRqTDZJU0RJak5zc2tzc2doTXB0VnhmV0I3?=
 =?utf-8?B?ZEFmT0Fvb0hnUloxeUxGNXFWRkowRHgzN3MwaUVhQktTaWVFUldTQnIrQjYy?=
 =?utf-8?B?VmpvQldyUU9UVFdpZFJBZ2V4dHlEMnJVWllQblBod2wvbzV3RjB5bUJEa0Nv?=
 =?utf-8?B?OUZ2UDJIQ29vRjk0d003UGdRcXVzQi9RR3hZWGRjQ05nNGlMa0lBM1l2SkVm?=
 =?utf-8?B?N2srL2xKU3NHWC9FUkdCVGM4dG5iYVBJWHpOUG8yU2IxZEFOZGQ4b0ZsQ29u?=
 =?utf-8?B?d0xvNmhBa3JtUGtsMms1b1lOcWlQOEJ1Z3BzdTR1R211b2pMV25NSENWa2U3?=
 =?utf-8?B?UW5kelphY3FnSFJlQ3NTYzBCZHl5bml3cVd2ajEwQWt0QWJBOFd6VHo1aVQv?=
 =?utf-8?B?MFFQWCtLZFdKZUFmOHpWUFhlS2lyK3BJSkJiMW55ZnhYWmxJc0lxRjlrZnFC?=
 =?utf-8?B?RjZEVUFWRGtXYmlhRFIraFg2UW9mbTIvL3JHc3YwUzF4eWx5clJxMzdGSDl6?=
 =?utf-8?B?ZVRyOTRqd0RmUnpycFNabk5BUFE4dFl2dWNTYThnVzRDNmFVams1V3pxbFlW?=
 =?utf-8?B?alZaaEtmeG1kNnV4MFJiMVZtMnZaVUVWOWpxSzM3U2xSQXNCeUU0R2R5bFcr?=
 =?utf-8?B?QjBkTG5TVmUxMGtYMy9QVVhrMXFVZEdSdS9Ld09mNkw2ZGlra0o2bjBZK1JG?=
 =?utf-8?B?WlVybG5YOExjdFI3Vk16VVhKZDkvMnhSUXVwRW5heEY1UHhjc1FVUW9vUnhI?=
 =?utf-8?B?VXA4RnpzSkJWOWVOMGlFL1pVbG1pUDNqYlJBZ2xXeURucnBOQW4vdGdGZUNE?=
 =?utf-8?B?YmEyRmhSbWk1Njd0QW5OS2wrTU9SaXJ0ZGlmbU5tTWxHR0l3Y1lXMVUybVZu?=
 =?utf-8?B?dTRhNEFtT1V1dDhVdkNmNXVjNGRVU0VqQkkvOGFRSUFLc0RVWCtLMGtZcytH?=
 =?utf-8?B?MDFYMnI1YkI2UTJnZGh0NmhHUGZHd3FoNWtoc3Y2MGtSQVJaZHdoM2ZveSt1?=
 =?utf-8?B?QUFqbVozWG9kV3VQYXJDN2NDdEp6WThyTTZUKzBWZ0k2Qkt3SzV1N2lNYlQx?=
 =?utf-8?B?bU8wN1ZLRklFTi9TY3hGM1pTOWZSRE1WNjl2aTlDY0pPV2NLcHUycE1wNUNB?=
 =?utf-8?Q?wTnygWp1Lg4vdYii2TAVs8s=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155979e3-bbb5-4ec7-3720-08da87661d46
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 13:23:07.5755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6XYaMBAgl0tVT7emX8s9WyDlTgxcXYx/Qdt1yB9KpYDW5pdiDrZatOV8rPNm1SYH3NwXgYHcpwt4ilxIl7FySC22pz5Ir3jUpUAm+7tlsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8706
Received-SPF: pass client-ip=40.107.20.91;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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


On 26.08.2022 15:08, Denis V. Lunev wrote:
> On 25.08.2022 16:31, Alexander Ivanov wrote:
>> We will add more and more checks so we need a better code structure
>> in parallels_co_check. Let each check performs in a separate loop
>> in a separate helper.
>>
>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>> ---
>>   block/parallels.c | 59 ++++++++++++++++++++++++++++++++++-------------
>>   1 file changed, 43 insertions(+), 16 deletions(-)
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index eea318f809..f50cd232aa 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -438,13 +438,50 @@ static void 
>> parallels_check_unclean(BlockDriverState *bs,
>>       }
>>   }
>>   +static int parallels_check_outside_image(BlockDriverState *bs,
>> +                                         BdrvCheckResult *res,
>> +                                         BdrvCheckMode fix)
>> +{
>> +    BDRVParallelsState *s = bs->opaque;
>> +    uint32_t i;
>> +    int64_t off, high_off, size;
>> +
>> +    size = bdrv_getlength(bs->file->bs);
>> +    if (size < 0) {
>> +        res->check_errors++;
>> +        return size;
>> +    }
>> +
>> +    high_off = 0;
>> +    for (i = 0; i < s->bat_size; i++) {
>> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>> +        if (off > size) {
>
> we need one more patch here. Correct check would be
>
> if (off >= size) {
>   bla-bla()
> }
I have such a patch in the next patchset.
>
>> +            fprintf(stderr, "%s cluster %u is outside image\n",
>> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>> +            res->corruptions++;
>> +            if (fix & BDRV_FIX_ERRORS) {
>> +                parallels_set_bat_entry(s, i, 0);
>> +                res->corruptions_fixed++;
>> +            }
>> +            continue;
>> +        }
>> +        if (high_off < off) {
>> +            high_off = off;
>> +        }
>> +    }
>> +
>> +    s->data_end = (high_off + s->cluster_size) >> BDRV_SECTOR_BITS;
>> +
>> +    return 0;
>> +}
>> +
>>   static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>>                                              BdrvCheckResult *res,
>>                                              BdrvCheckMode fix)
>>   {
>>       BDRVParallelsState *s = bs->opaque;
>>       int64_t size, prev_off, high_off;
>> -    int ret = 0;
>> +    int ret;
>>       uint32_t i;
>>         size = bdrv_getlength(bs->file->bs);
>> @@ -457,6 +494,11 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>         parallels_check_unclean(bs, res, fix);
>>   +    ret = parallels_check_outside_image(bs, res, fix);
>> +    if (ret < 0) {
>> +        goto out;
>> +    }
>> +
>>       res->bfi.total_clusters = s->bat_size;
>>       res->bfi.compressed_clusters = 0; /* compression is not 
>> supported */
>>   @@ -469,19 +511,6 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>               continue;
>>           }
>>   -        /* cluster outside the image */
>> -        if (off > size) {
>> -            fprintf(stderr, "%s cluster %u is outside image\n",
>> -                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
>> -            res->corruptions++;
>> -            if (fix & BDRV_FIX_ERRORS) {
>> -                parallels_set_bat_entry(s, i, 0);
>> -                res->corruptions_fixed++;
>> -            }
>> -            prev_off = 0;
>> -            continue;
>> -        }
>> -
>>           res->bfi.allocated_clusters++;
>>           if (off > high_off) {
>>               high_off = off;
>> @@ -519,8 +548,6 @@ static int coroutine_fn 
>> parallels_co_check(BlockDriverState *bs,
>>           }
>>       }
>>   -    s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
>> -
>>   out:
>>       qemu_co_mutex_unlock(&s->lock);
> Reviewed-by: Denis V. Lunev <den@openvz.org>

