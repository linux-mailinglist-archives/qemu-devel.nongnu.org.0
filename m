Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F2036B20C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 13:04:52 +0200 (CEST)
Received: from localhost ([::1]:50214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laz2p-0002OY-G6
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 07:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1laz03-0000wP-RJ; Mon, 26 Apr 2021 07:01:59 -0400
Received: from mail-eopbgr140107.outbound.protection.outlook.com
 ([40.107.14.107]:53039 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1layzz-000557-1E; Mon, 26 Apr 2021 07:01:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJsv1JxqQzhpy//b8FyyE5k6kuLCUT1YeEd4Dr9OAjmjE/xXC++FJ4fwaFgievJprQRykfJFMT+tSbp5aKWOKbUH2C2n389/CCqkb9f+xryJl/LjlrfKl2PZplZHAKdT+bN4OHYAbe7ChKCrFIp4ZY88olIQELybpA8kUWr9dBJukDCRGUlPEXw8jBQG03dAA5d8sEDl1ZzJ02N7+4XektLxF0OrsCTLwD5WIBpaH0KbjfgxukWWlYHKu3PMV4oRijXaTNP5pCJOAfGufXQ+0BhdYn5fLVJbpgnW0pxtTy2Per3uBP6aSflKtL1j5HKvd/svOJZlksj86Rp4Hkc25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAjViT3/gyW+b0KkEWl1N58oqNm3wlmkmRLaPudMc7I=;
 b=M4KpALYuvX/83cgB+WKrPG+Xc0Pzao2UlYIt/0kVt8qjTflMfwlcQ+/+FgiQxHEeBDI1301W+9bdm43DfZM5x0gzooLZXebT+XU7vXeZAjPlfDQs30vpcQtPqbgXzUWQ+ghlz48FIxWXiyy+NM5ihbumG5DY2Dl/LkXNgD+gUsoddAGZ0osbY04N1P4fWhoL9nfHtdrfm/v7uMTYCLYz5AtBxcc8p+l9PAFwtaiOFIX1IINHAfNWaD3wadAww80btN4eZ7e3EbiAoWrWg3FTxqcZNECf1n8wwZI4mmyr7uPjoySHMLQWG35uIyxctYJBHMM90ivHsoH6jS7KtCRupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAjViT3/gyW+b0KkEWl1N58oqNm3wlmkmRLaPudMc7I=;
 b=kNvUZuH3a8MnjYMVKAdvi4vYQWT8U7p4D896SDzoQH5uedCyXGRmefuJnApqyj4kfwrXdP5hFE47mnQ6K+zgiGjJkr8bDmmTdp4Q4EhJfEkDZHCOWRwuhqP8I1k0NsBgA1Ew+EQmr5AZ9nGYflz+IBzZoAy5zjK4SauLfxToess=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Mon, 26 Apr
 2021 11:01:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 11:01:49 +0000
Subject: Re: [PATCH 1/2] block/export: Free ignored Error
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210422145335.65814-1-mreitz@redhat.com>
 <20210422145335.65814-2-mreitz@redhat.com>
 <e1374b1a-67f0-b55e-2d3e-7440dea21b26@virtuozzo.com>
 <125519ee-718c-2647-cff1-b920a699223d@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a3717b31-780d-ff5c-c687-ad4e57fdf3e0@virtuozzo.com>
Date: Mon, 26 Apr 2021 14:01:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <125519ee-718c-2647-cff1-b920a699223d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: AM9P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 AM9P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 11:01:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89ce5d01-f576-40ce-460a-08d908a2b0d7
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32211113644CA593F3668D04C1429@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YhFQCzKqGPUz8SJvTV/B5i53HdHoGiBtjO6r3qP5Ycg1dtNPW5jriGJiic0czqzzFTxXGxXhKTnjv6llnQIC7ptInL2n7NGeuYQxHerDmXtbh7UnA8hJ9B+6M6KEwWsL+MjwaT1KhFt7yrHckCgxhgX526D5Q97i6QW3xuMSqBWaSpBXe6YcsaCbrNC46m0SY6XMJN9vqDC7KQhY0AKCqccm5Mv53nHq5WfzoU/8qrUok+mDNLQ5Gk317hwJFmBdtZ2jadnFxfMV3s5Qdi/CYBagHOvdN/aCqfhjabuTRrgZap1vAkyNBIaYkXQZ9ttAlk088izYfKwBtFo/tUuzfRN21/I7DyYksOlFucIg9LcvFrMG1PcgvYoGql0MmMA4G44MeSswQh04L7o1pIf1zgOpZo0E6TVLXyHurvPDJTeEnFyA1VAkLvvp5zBtbKoslUY9aqhJ7PpgZaO4Q0XoXQMi6aih+5kUs4SeTcluN1ICmzxxTLvPSqF7PCQOtt3XLJT7ipmT0Op4r0Mnbtj66QTl7mm/S8fV1XK2wJ6lQzgSaQt8z3ClDc1Thb1J5Jd9YDaMuzSaluB0ZcbEDCnnTpYnI1AmFz5gVUHAIhMcUigdxXQF6Py6jlJZrTVSPVLO86GfLRhQ7BsIVfdpfcTz0KyLVI4axLpTAzc36XheShpL1xLORS4/h017bVEbmy2WA4pnk8slIt73v4uGVV1ycP3D6K9xiuv3X3BB0KYYjoA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(39840400004)(396003)(2616005)(6486002)(956004)(38350700002)(38100700002)(31696002)(83380400001)(86362001)(16526019)(478600001)(186003)(4326008)(8936002)(26005)(5660300002)(2906002)(316002)(54906003)(53546011)(16576012)(52116002)(8676002)(36756003)(66476007)(66946007)(66556008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXZ0Y29hZDY3K0xzQWJwRVliL3NnYUNJRWs1dTdLemVMa1BTL1lSOXZLZVFQ?=
 =?utf-8?B?SG9rVktvZm4xZm9rWnZhalNyZTZCK3hOQTZoY1ViczZNd1l1bjRDcDdaWmlv?=
 =?utf-8?B?Q3pONnFPbHJZNjN2VUtnODNxV2kyVFhOWTI1Z2RWVlhacTNKRzRLUGtKdllC?=
 =?utf-8?B?aWJ3Znc0dnVqSUZ2aXBqcTcyVlpNWUNWNjhaSE9MYW5WMm9iekdUV2NBZWFM?=
 =?utf-8?B?OWhZbUoxV0ptNlcyYkVXNTVBSXo5bmhSWXV0T1FJaGplUG9DalpGaG1XZTBG?=
 =?utf-8?B?OEdjQXlSSW9IM21FeFVRQjZxQTk5OW5mU0FzM0k3d2k2M3p3cU9CM3Jjc3Nh?=
 =?utf-8?B?MkhrWkpmTzNYNno2K0tnUjJMUW1XS3FOVERuaG5LZ09mMmQ3RHNNUStzQXVj?=
 =?utf-8?B?Q0dudDZTcnNNbGZVSGp3UEdiYWFOK0Jwa25CSWxYUEN4SnJnQUI2S2ZUakhm?=
 =?utf-8?B?Wk1FY3N0TERZYlQ5dFJ0NWlueVl2b0RLNFJoSmg5aWVIUndxNHplaG92ek8y?=
 =?utf-8?B?ZFl4MHZCdHM3cGg0VCtDeG1DaGFZMkUwQVFrTW9ZTnVZZnltS2ZtUmFtcEhn?=
 =?utf-8?B?Z0V5dS96Zlo2ZHJVMFZiZmZad2Z3ekJmMUpZWnpGMGMwYUF2QVltNVZmN0Fr?=
 =?utf-8?B?V2xWdkhvUkFtUUkyajR3SVJjMldLU3FpTjRkQ05FM2FLSmRaM0czdXJpeTBt?=
 =?utf-8?B?SE5DVzlXOWMyL0kvU2pJTGpVSm5GWVZFNDl1RDFOWkRlUEhQcHpiSkNuRVBr?=
 =?utf-8?B?OEZCYU9lQXBqS3JDcE1MclRDLzBoTjRqdVdwWlBQRHk0L1RGcnV2Q1Fmcjh2?=
 =?utf-8?B?eEZRUk9DUERoNE80dkRBWEIyeFJRUUtIYjZzVDBBeE4vN0JTMDhERnAwZTl3?=
 =?utf-8?B?NEpxcW9NMVVZOHJBVkVVODk3Mzc1VVZKLzFLMG5YbEFyY3E0SU1DWG1LdXpC?=
 =?utf-8?B?S0RqbXlpN3JyQVEzVk91cy9XZmVuMmR3ejk5akRvNG96NjhtMlBDOVc5M2I4?=
 =?utf-8?B?c3Fjbm5ub2FWU2RXYXJQMlZtQUMvVEdnZFNnOEpTUGhGYWh3aDNWRzlFTlc1?=
 =?utf-8?B?d1QzUXhNSFliWTg3TjhFQjliZ2dEbGRPMXg4Z0o0bFJueERnQTJkYld2SDRj?=
 =?utf-8?B?YVdZaUw2UktSeS80dHNqdFdJQUoyVkt5cWJIY1hWbE5KbVdkWjlObFhiLzBJ?=
 =?utf-8?B?enFUVGV6UHUvL2JQOVhXMUVUZWo3UXp4bEpScXVydGRucFMwOUhlcm5qRXB4?=
 =?utf-8?B?SnhkcXQ0cWNXaHAwRWd5OTQ0c1dJY3VZU1VPdGZDeXBmWUt1ajRCN0VrWUFF?=
 =?utf-8?B?N3RTNVd1d1lTU0xJK1h3TWdldUljVytieXJHOGRhUmxUalRZVUpIVHl3aE81?=
 =?utf-8?B?cUxhZ2dLbXp4bHdFYUpvRDJNWEpzNXhFSms3RE9MNHQzcW5OZCtWSHppaEJn?=
 =?utf-8?B?T2ZlMDZCcmlBNUo1VVR2U0Y0OXpKWjRQVFdCbFZMVlVJNmJVR21udmxKWllL?=
 =?utf-8?B?NDluOXBpUEx3ejI0K2J6YVRmMXY1dFNmbXVoajhFUlVmWlVFeXd2Y25JK3RN?=
 =?utf-8?B?NE11SlJqV0ZrUmZlN1V5blVDNEZrdVBoc2xkN04rZ1g1Tm1pNHNMZmJ1cVp4?=
 =?utf-8?B?UHFlZDZWN21RNkF2MVZCNVE2UURZdTMxT2t4TlpmclF5cUVYZkgvdVRkNUtG?=
 =?utf-8?B?VWtOTWdlN3pDeGNDZnpyNlB5S1ZSbnVoVzZBcGhHV2luVDVaV3libmFFTXJt?=
 =?utf-8?Q?DVFLzkG2Q5S724ds8nm4nOqT/HZ94RLN37VMlE4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ce5d01-f576-40ce-460a-08d908a2b0d7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 11:01:49.5612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsMfe6Ta8z6R8gc/OQRB+Q7i9JSo2f+82CBCgbj1rTjbEzvvFxQRVOOCRMG7Iwros53SwME2fc1+HRUbPWZacWPsYoi4YT9QExoR/qHUaKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.14.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

26.04.2021 13:33, Max Reitz wrote:
> On 26.04.21 11:44, Vladimir Sementsov-Ogievskiy wrote:
>> 22.04.2021 17:53, Max Reitz wrote:
>>> When invoking block-export-add with some iothread and
>>> fixed-iothread=false, and changing the node's iothread fails, the error
>>> is supposed to be ignored.
>>>
>>> However, it is still stored in *errp, which is wrong.  If a second error
>>> occurs, the "*errp must be NULL" assertion in error_setv() fails:
>>>
>>>    qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion
>>>    `*errp == NULL' failed.
>>>
>>> So the error from bdrv_try_set_aio_context() must be freed when it is
>>> ignored.
>>>
>>> Fixes: f51d23c80af73c95e0ce703ad06a300f1b3d63ef
>>>         ("block/export: add iothread and fixed-iothread options")
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   block/export/export.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/block/export/export.c b/block/export/export.c
>>> index fec7d9f738..ce5dd3e59b 100644
>>> --- a/block/export/export.c
>>> +++ b/block/export/export.c
>>> @@ -68,6 +68,7 @@ static const BlockExportDriver *blk_exp_find_driver(BlockExportType type)
>>>   BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
>>>   {
>>> +    ERRP_GUARD();
>>>       bool fixed_iothread = export->has_fixed_iothread && export->fixed_iothread;
>>>       const BlockExportDriver *drv;
>>>       BlockExport *exp = NULL;
>>> @@ -127,6 +128,9 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
>>>               ctx = new_ctx;
>>>           } else if (fixed_iothread) {
>>>               goto fail;
>>> +        } else {
>>> +            error_free(*errp);
>>> +            *errp = NULL;
>>>           }
>>>       }
>>>
>>
>> I don't think ERRP_GUARD is needed in this case: we don't need to handle errp somehow except for just free if it was set.
> 
> Perhaps not, but style-wise, I prefer not special-casing the
> errp == NULL case.
> 
> (It can be argued that ERRP_GUARD similarly special-cases it, but that’s hidden from my view.  Also, the errp == NULL case actually doesn’t even happen, so ERRP_GUARD is effectively a no-op and it won’t cost performance (not that it really matters).)

Hm. I don't know. May be you are right.. Actually, I don't care too much, so, patch is OK as is:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> 
> Of course we could also do this:
> 
> ret = bdrv_try_set_aio_context(bs, new_ctx, fixed_iothread ? errp : NULL);
> 
> Would be even shorter.
> 
>> So we can simply do:
>>
>> } else if (errp) {
>>     error_free(*errp);
>>     *errp = NULL;
>> }
>>
>> Let's only check that errp is really set on failure path of bdrv_try_set_aio_context():
> 
> OK,  but out of interest, why?  error_free() doesn’t care.  I mean it might be a problem if blk_exp_add() returns an error without setting *errp, but that’d’ve been pre-existing.
> 

I remember we still have some functions not setting errp on some error paths.. bdrv_open_driver() has work-around for such bad .*open handlers of some drivers... So I decided to look through.

> 
>> bdrv_try_set_aio_context() fails iff bdrv_can_set_aio_context() fails, which in turn may fail iff bdrv_parent_can_set_aio_context() or bdrv_child_can_set_aio_context() fails.
>>
>> bdrv_parent_can_set_aio_context() has two failure path, on first it set errp by hand, and on second it has assertion that errp is set.
>>
>> bdrv_child_can_set_aio_context() may fail only if nested call to bdrv_can_set_aio_context() fails, so recursion is closed.
>>
>>
> 


-- 
Best regards,
Vladimir

