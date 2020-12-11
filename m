Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ECF2D76A3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:34:58 +0100 (CET)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniZV-0002xs-NV
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kniWa-0001p8-3a; Fri, 11 Dec 2020 08:31:56 -0500
Received: from mail-eopbgr30136.outbound.protection.outlook.com
 ([40.107.3.136]:15520 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kniWX-00071K-Pk; Fri, 11 Dec 2020 08:31:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hzp8Y80ShpM7vH6XjcGzx5OT0mOUSzWi07jwW7xv5MSltMZKgTgAWJ7Z221GsXyBqXCIZkOXHw+NMkHl2UV4No1Rnq3umRQplZB9dD9GCHQm4ZPYvGMo5/gJ1Fxh9scv9haiZ+r7K53mrfZoFprJAZi7DsIveeikUyszN92bcKdoT2bJLnKXXTXLDgxRT6LGeAjL4dYsldr99GUFWv9NT2/9VNs3fC3eHfbjzDS0ks4qQ+4wGPETkd0auY2Z0i2ImYxuHmWG4eYOwcpCstImYRh2fnfwURRueE8ltPhV81Oc8w5/l5BtMELRbu1O9gEmqC/squ8aPeoyE9UwztrVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMWDN4/djbITsraWA7fswkoM4Ryj8W5xBcHG/96gYyA=;
 b=fo4IG469DqWPnkR9WcA5Kh84J9CmgqUPBzsls9bvfVCrGcXetdgsd6Sk8w23a2qTyUVk8W+J3XXojn/mpG82zq0/XY5Q+0PKPjvSskU8iCK9bbO8dCZsMQfj7UfbIowaZvailwLVeFipBnYlLu0OFSESQ6WuB0z7hCCojSyELhLgQLQWsKokpS4OyoNhvoo3Jr9Ef3uJ6c3tm10T6ghuFnoMuGyrB45RlS26NPirBgHpO1gnbxV0LPEX5iZ0ZptZNEQhCbeGrOhxl+lwiQuOO6kDz41L5TruDA3gDlJ7GyRiUjQYcqDdgOYqfrg8s24/tQp8flZEvaV8o+ACikoaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMWDN4/djbITsraWA7fswkoM4Ryj8W5xBcHG/96gYyA=;
 b=jGoOEdtvtGvzzR1nf9hLlzbLhHrTFAl8U1bVkvqyZEY/EawWxEbM2FVIkVGiCdFW696z+tRECpWxGX28HwTEAnBLbXzKZj+gND+hWjomSa6KDPQrgg32A0Kp+v9PtKSG+fqWTRB292ykUiWNl4XGf8ukwtqnsvjVorkdTXRL0vI=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 11 Dec
 2020 13:31:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 13:31:49 +0000
Subject: Re: [PATCH v14 07/13] block: include supported_read_flags into BDS
 structure
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-8-vsementsov@virtuozzo.com>
 <0fdb23ba-6690-f082-bad1-2839222eb688@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0518667c-8410-3eec-3394-8a834a590bae@virtuozzo.com>
Date: Fri, 11 Dec 2020 16:31:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <0fdb23ba-6690-f082-bad1-2839222eb688@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR01CA0158.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR01CA0158.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 13:31:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07017c9e-4e43-4d1b-520e-08d89dd91d4b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119512BD353539AEC2D2CADC1CA0@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rrMKw3PSigTk759JPaAcsdBNk/2Qkif2XAXpKlx0BZmzFu3fWcO3RrC8/ed6sRri4aDH60ZNggMv1oINwQ4XcETN2ftyn4h47e5UQwaIlaeJZDqXOGSd7+eaH+Pxsjke253uXAEYVcJligX1EJD2cze7fpYs8ZdJRHJ558MVrKrcZ51EolLCZSavSnPJ/BdLt/Miop5frbrhU8K53MHr2VkqC3Jn3ptI16YS2KT4TbAn3T6x0GW1HIEhTh49+t/G12tbCj4ICdKS/SaVLpCPAzMxYXnEeoWEwsLqxD0qJVWYE0f5qtcczH8VpNx+a6DgxF5RFRY4vCVlCE5+5FVWgTKAT8xUlTB2iCbwIKtnsazEv+dg7KFseDoD+vxT3GlV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(396003)(376002)(366004)(8936002)(66946007)(36756003)(66476007)(66556008)(8676002)(5660300002)(86362001)(956004)(6486002)(2616005)(107886003)(316002)(186003)(16576012)(478600001)(31696002)(53546011)(4326008)(83380400001)(16526019)(2906002)(26005)(52116002)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VVM5K1lWbFpvbUUvY3pEc3VKYlhtN3VrdFVGYUMzeGo5NXQxYlRCdlNTTXJh?=
 =?utf-8?B?bHBQNjArSWRQeWMwYkswYVI4bi9Wd0E1dEZmTWhWM3VURlFmZE9jMmFJRCtO?=
 =?utf-8?B?NnN1ZmtMTzM4Vlh2czIwME5wT1VLaW1wbFlyZmtjQ2NWYjdtWjY4WWdiczFP?=
 =?utf-8?B?WEpDNkRiVEhGMnBmakk0Y2p0V1R0QzYxS3RIVnFuZ1NYUHYzMm9CVWRSSFcy?=
 =?utf-8?B?VkhhcW44bUM4d0Q4RGRLUkhobmRlbGlQRUNTTmFNWVJ6Q2JEUlVkS3BYc0ZZ?=
 =?utf-8?B?Wit6bG5RZXlNSUw3WFJoOCtZdlNKVU9RakpSVlBvZW90QmlCV0hNSG9ZaCtt?=
 =?utf-8?B?RnhTWVhwSUp4aEhJRTN5NjRnY25RL1g1QnhWL1grK1J1eXJCYkRjOHhBME9u?=
 =?utf-8?B?QXBHcGp2TlcvVnQ3Y3NIbkJtd3FWYTFEZTFKUkExaU1YRmdxL3lTM3Z0RU1o?=
 =?utf-8?B?L2kyMWd6WFZyTDNnWitoWE0yaGx1aTVTU0xHZFpzVVVGa3RqVEVla1JpeE4w?=
 =?utf-8?B?V29ISVN1aytIZjcxZ1BUd0Q3UTlFa1drWSsrdU56L1QrWXJvWlM5OHIzZnh4?=
 =?utf-8?B?d3BCU0YySFZjdlpsM1RSZFRHRXp6MTNpY3YvV0FYVFNTNjRpK0RpNHhlbURY?=
 =?utf-8?B?bG1YZ2JMSlRoUStlMHdVVjU0MmRGak1wYW1uUGVNNHBERDRFNndobTUxczE3?=
 =?utf-8?B?c1haeTFVVXk4WGg4RDZCUk1kVzJhckp4QUo5S09jZWx3RmxpMzJ6YnBzYnpZ?=
 =?utf-8?B?YWVkRG9yM3R5OXd1WjdmVUJ5ZFIrWnhkdXhOcmNUYzl0aFZ5OGRleFZNdFBT?=
 =?utf-8?B?cWRRd0pSNVM0bGhNUk9QZWk4TzZWcnJ6MlNhVEFxRzVvR0VBbUlWdmZHdEVL?=
 =?utf-8?B?OTRrTXcyYzMybitGei9iVWxEZ0tQK0h3ZHlGUXNLSlBVMUVZMzlLL3N2cUdp?=
 =?utf-8?B?SzZwQmQyS1VldHNpc0NFNjdFZ1Zmb2xyYUZxeU1vQ2tvZUV6YktHQURGaVp5?=
 =?utf-8?B?RkxXK1pjTjBuN1B1UHgybjkvUkpQdGZ1bzh1b2NaTTJ3TncweFhhUm0vcFhk?=
 =?utf-8?B?V0Q2dE9SRzRuYng0c3NtQ0FuSU5JejhEMW1UUkIwc09aMVhGL2REUDBDL2dT?=
 =?utf-8?B?V3l4aE1XMmdTVE9abEU0L05INXBUVzl3QUpUVm5jMzU5N2daTmFON2FIQ1RN?=
 =?utf-8?B?dkQ3VVRTd1kvN0RtWFNjeVI1Q3E3MkJoTjVkdlowWm5IRnhsODRVQlNhcHUr?=
 =?utf-8?B?TzRUNlg4eGdiYVVLSWNTZ01GcUhHSktoS1pVYkNwQ21HOFpkV2sxNEpnTmow?=
 =?utf-8?Q?zCCp9xrsX7+lCa/JcdWRBvdtT0cpp/8RrL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 13:31:49.6520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 07017c9e-4e43-4d1b-520e-08d89dd91d4b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cX81ideLjA2Jmu188XIHxF/XDh1yyEqJqLzz1Q+RKLov09EQI9CqJc8gm91SzfvwrngahxASuuk5ljKHTzYdfUsqnCW9wza2G2KzSvwfkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.3.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 16:20, Max Reitz wrote:
> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>
>> Add the new member supported_read_flags to the BlockDriverState
>> structure. It will control the flags set for copy-on-read operations.
>> Make the block generic layer evaluate supported read flags before they
>> go to a block driver.
>>
>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block_int.h |  4 ++++
>>   block/io.c                | 12 ++++++++++--
>>   2 files changed, 14 insertions(+), 2 deletions(-)
> 
> [...]
> 
>> diff --git a/block/io.c b/block/io.c
>> index ec5e152bb7..e28b11c42b 100644
>> --- a/block/io.c
>> +++ b/block/io.c
> 
> [...]
> 
>> @@ -1426,9 +1429,13 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
>>           goto out;
>>       }
>> +    if (flags & ~bs->supported_read_flags) {
>> +        abort();
>> +    }
> 
> I’d prefer an assert(!(flags & ~bs->supported_read_flags)), so in case we do abort, there’s going to be an error message that immediately tells what the problem is.

agree. and one-line check is shorter than three-line

> 
> Apart from that:
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 
>> +
>>       max_bytes = ROUND_UP(MAX(0, total_bytes - offset), align);
>>       if (bytes <= max_bytes && bytes <= max_transfer) {
>> -        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, 0);
>> +        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, flags);
>>           goto out;
>>       }
> 


-- 
Best regards,
Vladimir

