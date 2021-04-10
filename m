Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B6935AC9B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 11:59:02 +0200 (CEST)
Received: from localhost ([::1]:44066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVAOK-0002zE-JV
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 05:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lVAMC-0002Sc-5c; Sat, 10 Apr 2021 05:56:48 -0400
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:52801 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lVAM5-00031I-Qc; Sat, 10 Apr 2021 05:56:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLDfQ1GewBo9i/lqvZY5tnDVEnYrWIK4I5zCPHTVc1OvEdv1tSwsKn5MRl5UZXS5TW1FkZUdouv6QRuJdHuYKWt/aO9yD1oygqbVN4h/lYhPQEzsja8hJk8tjz2czp83WwaGznEXpVYfT7WRmS0fkaG6bhdJM/2iDHMsny/773/dGkB+YuHOVhhJ5igEhiStkua+MVbogUcF4PgVSohMghoQmwZL5XGSEjgJzHGjZwPIi8gUawcYD2GSItpXjuYoSo9XdmuWDOP/Kp1Qp+6OOdwqSATvcJN0kQLE7UT+nEF3S73cKuV9qxB8HftwQ3hDcxWDP9s9v+EftGdYSS3FAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cszeTHR6YhROun77WtFd1UMzrl4gxeMj6cu8EkKdG/U=;
 b=UCPp1Haj/gAKDVFztNOdcpnWhmYBRjlzFaLuDUuamfbjLAul3lh55q9ouS/+Qg1OiMovdHa71Hx4glC3rvopDGz2S76KPYR6eqUM8CnT6XQVryzykJNIhaFGdjTa+VPX5DQz967BNTLsHHxofjj0ZlUOvSeG8tXC18KfYNQwyfXlpTFNG+654XC83bbHHpaYRlq1D8rE4AJJLh4TvFzE9Gt7HsIsmnArsD9x7obdKSYvm6wgt97qWWYmkLlne5O/PBNXg3fdmlXCly+KxGdvm6GWnB06Y03HGAs5UfMBxu8GgmfJVRk7yVLICOn/avNaWqmEpqPNZrKjWsXMTM8WZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cszeTHR6YhROun77WtFd1UMzrl4gxeMj6cu8EkKdG/U=;
 b=udJjTOAXCQwaHZODLVBGxiam2Bv9AaKdQfswkbvyhI0Xe445g7AlY3n86sl68v60k4O3g7Q3e+DxerMliPGsKeiDB3uACdTq8b/7204xQec2z+4d4GgoCZBqnLvHu1rPpY7P7W383hToIZT3O9UUrU1PRIox2iW6HkXsmumYHsM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4788.eurprd08.prod.outlook.com (2603:10a6:20b:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Sat, 10 Apr
 2021 09:56:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.022; Sat, 10 Apr 2021
 09:56:36 +0000
Subject: Re: [PATCH for-6.0 2/2] block/nbd: ensure ->connection_thread is
 always valid
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>
References: <20210409160406.1800272-1-rvkagan@yandex-team.ru>
 <20210409160406.1800272-3-rvkagan@yandex-team.ru>
 <fa2034b1-137e-017a-90df-6d5014b85a72@virtuozzo.com>
 <0d115e55-1727-31b8-0aff-b1ca5e8e49ff@virtuozzo.com>
Message-ID: <e8d7f32d-5e51-5b12-3b39-71acbe29cdf3@virtuozzo.com>
Date: Sat, 10 Apr 2021 12:56:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <0d115e55-1727-31b8-0aff-b1ca5e8e49ff@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.198]
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.198) by
 FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Sat, 10 Apr 2021 09:56:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e673368b-cb9d-4ca7-6789-08d8fc06edd7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4788:
X-Microsoft-Antispam-PRVS: <AM6PR08MB478830F59FEA03ABC09D4891C1729@AM6PR08MB4788.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Km277gM1YvWHyUoXs4x6c8JmLA1MZ/3Lmfe8ACJPK14VcgfA+/zyVuApfvXS03hSYpR/+zNOuUzmJr7PuvaVqBpCkO1s08z/ncp/RwiilqTkonarWtxtUwOjV2dcmrc/ckg9eMKGhIdE399Pd2xpxeQyYOdQAsHu5Rh2lG8oBcZPRRn8XKNG/sQQS9UbbD3EzvBVm1eU1y14XfU1fa6LyaYqG54B0+kX2wEdrXLHOEgncLxIoE5tJFUcQLwww1DVjYONjKzo7Ig14zGwTqc2aifbta4H2i/QvTUxWoGBJ7iT4mQcMuRHIOP0MnXTi1thzp8E3A6CcFmHKttS/augNhBMBbVsw/uyEDrkog0aFa9Emsb/O/xn9KCQ3Z3TE8ZpyH8qYv/vDCFfm9/CBgbRx6bKGcenNLS+xzClriJ5wMl7J5Lgsl2YCJL1y2zJUL7b8r1XxvG8RLjzybghop2Cckny2rOaXds0FjZhssFbkFlgmzDTZegtmSl5ZdSMPhJ4TB9QAy/e0PNTdUrBrwFwwCGXb1N6mOrUsy2S+g2DMgjdjun1ERQHrSbhnbtvphPspTzBjQ8GjjgjMyA90j85Hnca0pO4RUZQvQeu4uEwsqCkGfPj7CuVUh5gNnErAKMx9OMf0rzyJNfdnsp4EUPhbZt/pmpWoIuHY3Z2tujANueI1uBG1Y9bmwnHw/QClzxNRQHHZQRtlSYwCKw+9hkjEnDo7BFOeEGL1vEON0Ld6nM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39840400004)(136003)(396003)(16576012)(186003)(86362001)(8936002)(6486002)(2616005)(2906002)(316002)(8676002)(16526019)(36756003)(83380400001)(5660300002)(66476007)(956004)(31696002)(26005)(52116002)(66946007)(4326008)(66556008)(31686004)(478600001)(54906003)(38350700002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MEh1dTV6dmhrbWw3alNKMGhIU0dJWUN0bWgvUHZZMTFkd2o0VlI5blIxbSt2?=
 =?utf-8?B?ZU9xWEJhSG1xNGVhOXJselh1em9VRlpzOWk1WmdZS08zeTlIakhSODJVcXht?=
 =?utf-8?B?dlpPeU1sOXhaMEFQcW9iZmtCSnVSTzE1eFB6dDN5T01QU3J1dGhXZGwzdVVw?=
 =?utf-8?B?WklLOXZScHdnRHdMQkNacVVzc0c2YTJ0SXNVTmYyRUhtblhuRDVHcUtSVzVj?=
 =?utf-8?B?U3g0SVJiczRseXBxWDkwcXlnUG5mU050bEl2RFY5RTFHZVBVNkRxZE43KzM0?=
 =?utf-8?B?emZ1eHRtSk1kUnBJM0hjbGRxV0xHYVd6RjVncGFLZjNUNnhKWjRGTlhlSDZK?=
 =?utf-8?B?YkxCbFdhNjBzRWZZalZCdUs4NGxGRWdYZHowaUlFVnBGQUJLV0hRcjdLUzhX?=
 =?utf-8?B?ZVJoWnNDVnZNRk1iekFDVXYrQkNQNUF2L24xdzBsamdlTE5ldFJBM3k3eU0x?=
 =?utf-8?B?ZXMrY2JkZm40eXM3NXpIN0F4YmdXb0VzeXE2NlhBZjlUK09VUEk5SjR1dGFy?=
 =?utf-8?B?S0dFTVBVVzBSVVBsVm5QQnFMY0FnWmEwdUNkS20wOWhuTG45NEl4a0IxZUNY?=
 =?utf-8?B?UDZSeEU3MEN6a253OWt3NkRiMnk0Q0lPcE9EdzBQVEVTdm43OW91RFBqczBm?=
 =?utf-8?B?MnhKVWJsVjNNWkdVQTVQV05rZXp4cXl5TjNHczRua1JSN1owTFc0R2NHREtE?=
 =?utf-8?B?dk9TSExTNTJiNVZIUFJlem5SVktGd3NCMVZYWTBYaDVqTkhUOEZmV0ptUnJX?=
 =?utf-8?B?dW5qOERjN0c0Z2VBblVFUVZPNlVsbTA1djFCSFNZc1IxTHhKVGlCb1NVenpn?=
 =?utf-8?B?N21nMytlOXhMdUZBVUpiRmdJWXZEYi93Z0xyTFZ0U1N1UjRENUVCemJCZ3BW?=
 =?utf-8?B?dXZhQ0VoTDJibVhQK20wNnZKbmNJUUFIakVOS3k4R1kzeEZNZkEyRitlejll?=
 =?utf-8?B?SEZyMmUxdkZQamJvbGZlUFZzTE5GSG53NjBnTmtoNUZQNndlTE9LNDJTNGth?=
 =?utf-8?B?QlBhOHh1a1ZKVWJIc2hlbUJjRUlFVW9QVngvTHJmSzNPNTNNSTJMS1BQZmYy?=
 =?utf-8?B?TTlKOHFJckFuVDdtM2pSejkzZldUWk9jRCtkS2QwbkFoRzBOc2xhQmI3eWty?=
 =?utf-8?B?dFhraVhjL2pxTTZUNmlpN2xLVlNCMEE1WFFQb285cGdqT0tRSHo3MjBoS21j?=
 =?utf-8?B?aENScnQ4ckJvaW9NdzZ1b0J0bFlrdHlMQWJkaytFOC9aOTJOZzYrZXBtNmFl?=
 =?utf-8?B?R1VRR3cvcGsvZmF4bVBVT0tQNnREbWxldnZPRmt5MXJsUFd2T21JMkF5NXdr?=
 =?utf-8?B?NFBIUCt0VHFHOGRFUmNFOU1BcnFiSDNXMUpQZkJjRUtubEJ4Y0hrUnVsRUVn?=
 =?utf-8?B?N2tlYnVqSjluTHA5UllIYU1pNUdpSW8xY0FWTyswVXdxT05tSHA3NlovNHRE?=
 =?utf-8?B?MTV0OUdKbDkxSWpwVlhKSFdBQ1FqRmUxZXlCRzdwU2RMVWRlYUwrN0ExRXUx?=
 =?utf-8?B?c1ZaRDI5MFBodkUxcFo2c3AyRlBpa2N6bUx4R3FIOGpSckpaMVVmKzhzSktZ?=
 =?utf-8?B?Q3JSMWZvYlVMbk5wSFpUV2ZRWUV4OGJzZjlPR3lpSGJEYUcxRTZ6KzJuVzlH?=
 =?utf-8?B?aWZ6MWQ3ZzJOWmNKZWVxekhRRTdZYkR1c0x6eWV1WDVVZW1hOFhobUxQRE1L?=
 =?utf-8?B?Yk9mMDNOVW5sd2lwT2xXR2k3cEhGa2RRaVdrSG1iVHdUWVYvdXBEN3VYZW9C?=
 =?utf-8?Q?hlI2sCE8jLKd1+TqH/DZIgPcVpMpYxrbnI3Gdit?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e673368b-cb9d-4ca7-6789-08d8fc06edd7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2021 09:56:36.4589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3D7krQKKBROUK/BkPc4TvS3t2RxhnD5tmZsi1/rfe8c22612Zn3WSduPnjVEKnMrknYv0JoPir1yr2GDflNSlusvUQ6DpkpnnzSvbk2pfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4788
Received-SPF: pass client-ip=40.107.7.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

10.04.2021 11:38, Vladimir Sementsov-Ogievskiy wrote:
> 10.04.2021 11:06, Vladimir Sementsov-Ogievskiy wrote:
>> 09.04.2021 19:04, Roman Kagan wrote:
>>> Simplify lifetime management of BDRVNBDState->connection_thread by
>>> delaying the possible cleanup of it until the BDRVNBDState itself goes
>>> away.
>>>
>>> This also fixes possible use-after-free in nbd_co_establish_connection
>>> when it races with nbd_co_establish_connection_cancel.
>>>
>>> Signed-off-by: Roman Kagan<rvkagan@yandex-team.ru>
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
> 
> Ha stop, it crashes iotest 51, as nbd_clear_bdrvstate is called also from nbd_process_options.
> 
> And this shows that we also do wrong thing when simply return from two ifs pre-patch (and one after-patch). Yes, after successful nbd_process options we should call nbd_clear_bdrvstate() on failure path.
> 

And also it shows that patch is more difficult than it seems. I still think that for 6.0 we should take a simple use-after-free-only fix, and don't care about anything else.

-- 
Best regards,
Vladimir

