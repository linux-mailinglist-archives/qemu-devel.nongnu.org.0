Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D43027C6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:26:30 +0100 (CET)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44hC-00032K-0d
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l44eV-00019r-RT; Mon, 25 Jan 2021 11:23:43 -0500
Received: from mail-eopbgr20105.outbound.protection.outlook.com
 ([40.107.2.105]:8449 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l44eS-0007fH-Pc; Mon, 25 Jan 2021 11:23:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjWTpFm2KdfvQy7er+qrbFHuKobSgFr3DRRKNXm4O3wjIEF6C9Rxv1LLZ5bnW/gsJ8MgTePQsZVTLwUSexGSEO5ReA3mDClNJJBn/VKr9hpEs14eKgZWcucWWhfex0w3q4aqPScQbjIQ7wB8U8jAqml6sSsRtF0hZvnsE7Pvj1xM8MR7kq0PzuVTx269YMOkiZNMNOyFgV6C3FfsJTFizf8hrFODdZeOvUas0xQabyXDY/B/RsTdJ6YMjKyNR9UxPyfvFQKAdRkM9vY7DFIEd1/ci4zzDuo8krkFU6qEpODeDAQvTrYzNZcvfiEly1b0B6YYSjS4VU1pjoKXDS9gig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0p2uWTGe0KMiheZxiJbipTqU62YQZeJGd9z8iyT8DI=;
 b=KAb7vwwJjTIfmJdpmpkgmApkf5vdQ/jxPLxI8hT8LU49cffDgp9yM/58BNLFV6itV4UvBIXEqRqT3bBWhnBXJwTH/1xH+CvLMafyHAub45Dz8yCOvMQPqaiBxfY3WaK0ZJTfD3rZftV3oDrijTvhYXyytSlgibjwMqBYDzBEpkrrW8y5HvCNaJqR+OijZju/RnN6UX0xVqUzoaksJP8jlP+ZzhNxItEERdMy7lkjF9OCCYzhVGGyVHCcNeJSoL0Fat1RVLww0plptR7rXNfVzXvpamOnYmYUKrT25ePLfET/2ao7XsP0iAB2XsdmqQMlPfsNBR1EmmBDpBITSNoPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0p2uWTGe0KMiheZxiJbipTqU62YQZeJGd9z8iyT8DI=;
 b=D4SUv98tnybMiBJP4H9+oFvTxU/afxwTj8Dj7uaC0ANUtow+dI48C1rIdMfE3/w5I8+tmns6ucXyNaKLIfiljmu19qqMDDPw+dDQIXVQnbcyZPMcyuKhjugHsvf2m77AqQUgTd0QyDVN19SZ8Gbs4Nm8nky9ek3jVwJmSHhD94o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4913.eurprd08.prod.outlook.com (2603:10a6:20b:ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 16:23:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 16:23:37 +0000
Subject: Re: [PATCH v8 0/5] Rework iotests/check
To: Kevin Wolf <kwolf@redhat.com>
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
 <20210125160820.GD7107@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fbca8b6f-6a9a-bdcc-c4da-bc9343149031@virtuozzo.com>
Date: Mon, 25 Jan 2021 19:23:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125160820.GD7107@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.113]
X-ClientProxiedBy: AM8P192CA0003.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.113) by
 AM8P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 16:23:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db92a6eb-dfc3-4c24-375f-08d8c14d917f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4913564DFE5C853F58B680DFC1BD0@AM6PR08MB4913.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u7EQw+fB3OKs99H2WZ5gqxd9mvoKXrLZ+P1A5Ic/y7zLH68XicYdiaZn5c2BbfYpmDM9l4vYNdqhb7k7b6E/gwXHQMoR8OqgELP2Q3dk+ZAKBliyzJhOPkC97f+jeaCwcvXFPfyclTIH5IdvoIDGvCXXM/vvB9mWj7dV/eMopi59mzVn9DNcVx8jJXAVkK8XJwPx7/LpSMJIRE7H1/AQ6IR15GTMiPoT+t9M/SSS3XpHAty73tSnzlrqT6c2zJlrAkyaXBNfawPiAg7dc0Svb2mKlfQpaif//XYguhJMAawoX9+jyEiMFa1XEdgQOLeX0kXwLR4JOtJn0sGkTIe3tFraSgZafZA6OgtCRe5AKk89+J0NGjiiHn8HfBycbaCfp4As37zrZDV5CDc+ixmd5If3haubaM0mNjmP2KRb39wVDxV56mi2JERAu/BcD4HnTuR5nJWJwS9aG3Sx/Schw+e5/8U3f9N3V0OOlTjmg2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39840400004)(346002)(366004)(31686004)(16576012)(316002)(6916009)(31696002)(6486002)(8936002)(36756003)(2616005)(956004)(52116002)(8676002)(2906002)(66946007)(186003)(16526019)(86362001)(4326008)(26005)(83380400001)(478600001)(66476007)(66556008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c3MwZitEQnhJNkMvYi92UXVDWkdCV2JFeGdKZDY5NHh4WjA5cUJhZ0NBaU1I?=
 =?utf-8?B?ak9IQjlVQWs5VzloVTd5VGQzZjF3R3N1M2ZIZGVrY2I3YjhVakxQZXV3WDQ2?=
 =?utf-8?B?NjNTclZuL2N0bmtRL0hLbmdQcU55NFlPb0JUdzlhN1Y0S2lsbUlFRklveFRa?=
 =?utf-8?B?Mmd3bE5TeVJ0aE44TGQvVXYwRmd2Wm43SmR1L2czM2ZSOTdPN1hWcVIrWksz?=
 =?utf-8?B?OURZaWpQb2V6b2wrdFNUU1RCUUhQRndFRlAxdEpTZ3dEN0xRYkZCTUFlVndI?=
 =?utf-8?B?NFYyK0dBc0ZyK2lNSHVmSDNkcFJJdW5Ic1Y3bjkxd1I3NnJhc21pNS9CQzBj?=
 =?utf-8?B?QjhicWRmLzlOeWc2bUxmdmlSdnJrSGtWc252TERlRi92bWpZNTZDcFpMc3Rx?=
 =?utf-8?B?TURCQ09iTmNiOE5qaWl5S3RGak96M3Vab2d5MzNGZzc0M1NZVEJ1d3kvTnRN?=
 =?utf-8?B?RGl4NW9TeWZ1VWN3VVBSRHJXbnJyUEl0TkhiazdsOHZMMDZKL0dkd1U0Z0dY?=
 =?utf-8?B?cGNvSkxVZWppTTk0Q3NsdHpZZjgvLzhUWlowZFhYSFdtcE9pZFR6SFFheUxC?=
 =?utf-8?B?MnJYM1Rnc3dmOEltbGhuM3NmemlmZWdBYzhBckc5T2c2eUIxMk9ESHVqbkEw?=
 =?utf-8?B?T0xLc3pqZlk4aFo2TlJDOE1jaTZTd0p1d3ppZ3A2eFhFNmJNaTV6cmlSam0x?=
 =?utf-8?B?UXhHMG96MFRraTRBcWd6c2xGZHVvcjNkK3FVZWtFOGFWaTlVNERIM1VmZFdI?=
 =?utf-8?B?cDh0UUY0anQycjF1R09NclAyd25OZGl6YzNzOHVGMzc4TzdPOWE0SU1NbWFq?=
 =?utf-8?B?bjN5WDQ4SWFtMERDRmMrMUQrdTh5eUhVd3QzS3FDWFlNTFY0UjBKcWdsdXU5?=
 =?utf-8?B?QTlEK0E1RnJsVlRmQTZjTEppa0s4bWx5c25Tam5iRVk0L2toYXR1VVlJcjFI?=
 =?utf-8?B?SjQrU2VjVXFlaHRUemNPdk90SmFHZzFKWENITkJtNCtPRHFiUFlFbVBNdC91?=
 =?utf-8?B?SFZXRmhLbWcwUVRWVzhyU2tBaCtyL2xZV3dRVnRyM2tFak5HaUlVS0tGajdF?=
 =?utf-8?B?bVVlQ0tKU0k4MCtXbE5rNWFEMzVEcmU3MW96TU9UMjVxdWVYaGhTSVorSnFN?=
 =?utf-8?B?cXpzYTF4WFZuRTRKZEZhUzZHM2lXaVY5bWpqZTdERDBPS1hQVHY2ZUJYNUox?=
 =?utf-8?B?dXZOYVJHRG1tODgrS3lqVEhPTGJIUDl0M2JVangwUnFBN0tkbTFXbE1jaVR3?=
 =?utf-8?B?aU1ZUERtV25lRG51czhJSXg3VHo4b3RDMUMydzlxeUc1Qk02M1dMMXd6VEF5?=
 =?utf-8?B?cTR5Mm9pMjlFMGhCSXZTWFBFN0VuUjYrOGl3ejRuNHdoS2cxRE1XMkZ5M1dX?=
 =?utf-8?B?b2Jydi91UW5HZjhpVDlNbjdRanMvWGVrTTN4bXUwNDFqWUkyWElZa3ZuTm4z?=
 =?utf-8?Q?fKu2sukM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db92a6eb-dfc3-4c24-375f-08d8c14d917f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 16:23:37.2184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LozQ8qWmmzTWxL3F2crHjBTdqJClbj3FdS3+acoo9BuVLYVPfxKVBFyavx3JSdsdce+tYTUSdDGYRjhAGCp/mphq/fXrok5xgiTEdxoz0gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4913
Received-SPF: pass client-ip=40.107.2.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

25.01.2021 19:08, Kevin Wolf wrote:
> Am 23.01.2021 um 22:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> v8:
>>
>> about linters:
>>
>> I didn't modify 297, as Max already staged 297 modifications to test all files.
>>
>> Also, now I have two complains:
>> +************* Module testenv
>> +testenv.py:158:4: R0915: Too many statements (53/50) (too-many-statements)
>> +************* Module testrunner
>> +testrunner.py:222:4: R0911: Too many return statements (7/6) (too-many-return-statements)
>>   Success: no issues found in 5 source files
>>
>> And I feel, I'm tired to refactor it now.. Probably we can ignore them in 297. Probably I can
>> do some refactoring as a follow-up.
> 
> I don't think these warning are very helpful, I would agree with
> disabling them (even globally).
> 
> When testing this with the other image formats, I found some problems.
> 
> 1. The first one probably means that we have changed the order of some
>     checks: 150 and 178 have reference outputs for raw and qcow2, but no
>     other formats.
> 
>     Previously, the _supported_fmt line in the test would just skip the test:
> 
>     $ build/check -vhdx 150 178
>     150      not run    [16:45:46] [16:45:46]                    not suitable for this image format: vhdx
>     178      not run    [16:45:46] [16:45:46]                    not suitable for this image format: vhdx
> 
>     Now we seem to test first if a reference output exists and fail:
> 
>     150   fail       [16:49:18] [16:49:18]   ...                  No qualified output (expected /home/kwolf/source/qemu/tests/qemu-iotests/150.out)
>     178   fail       [16:49:18] [16:49:18]   ...                  No qualified output (expected /home/kwolf/source/qemu/tests/qemu-iotests/178.out)
> 
> 2. Test case 146 for vpc passed previously, it fails now. This seems to
>     be because of whitespace that is checked now.
> 
> 3. Skipped tests display either "..." or "0.1s" as the elapsed time. The
>     old check implementation didn't display any time for them. I don't
>     really mind either of the three ways, but a consistent result would
>     be nice.
> 

Thanks for testing! I should have done it myself actually :/

Will fix soon.


-- 
Best regards,
Vladimir

