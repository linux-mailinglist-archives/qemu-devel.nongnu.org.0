Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091592F7D33
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:53:14 +0100 (CET)
Received: from localhost ([::1]:39882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PXN-0007wI-2h
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0PBo-0006jp-QE; Fri, 15 Jan 2021 08:30:56 -0500
Received: from mail-eopbgr40111.outbound.protection.outlook.com
 ([40.107.4.111]:56614 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0PBj-0006uZ-Fg; Fri, 15 Jan 2021 08:30:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dyf4E/7yfDbLWPpIpBlZAT9HMJt3+LGyfzyFPIhyHF9Ktjj+o7U8U2Xn43kzbtmSIjj84pezWyqFrPUJtBlAiC3UJjNV1K4hf72CjFbNo8ktp1OKxYsNieSOzK44EIbzFzwuQDRcGTIBVK2hNHWowpFGSMZbs6e6Mm919gPXFiCssmGpmO6B17vGJp7WE6tl6gWbkiBZDZkahLLVA9RWFSsbOH0QQjqwsO/R7XZRaHgOLo0vN5BQZ8d3Kv61IRqVa8AB35aqZAZegl9IjmWH7zHwsP6WcSEoeo7uZU/tbb/n/0oSnygQZqE+dqJQx3qZKa9eYa4QR2At8Vv7qawy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MKkTFVCWA1arszVXMAmVeWWZ0AF/MDRpVcFd7G2waM=;
 b=Ezs0SbqM/dsYlWzRm4Tw6t1f71MN86JCU7KVCAm2UefQ24X5mryF78O/prli2XTLtOmBB6/PxruR3d9OjAKU7AVQvIQN/xPOA5W5d2eLaq4sF8tQlRZP9RJCc8PJd4LwQvtdJ6mbBSYX4HhzrhI+VKFMxsnfoVfefHyZznY57R9NX5s1PbtPZ1gFXneU3k8XXIa+UsNSJWd7EatCD05LCEyqDXK8S+aWQ9Mhhenv3tCyYKaMOj2tpDE0GivuGUvLcmm7Dc5kqvbIJ0AJJLcIrTU1X6DFjtP0n2SsPj0UdYF4EtWjNKbhH38+tcuvW0duKSIdWM4hfgjo6CRfRatABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MKkTFVCWA1arszVXMAmVeWWZ0AF/MDRpVcFd7G2waM=;
 b=sHRd47DPvF1g2wtmtM9ecfdHyxeUtlLEyLG40RBJns6VinyZd2Sg+aPwtfLPRUlI46oBZ28p+NGV5fd2HBlis9gRDnjgv4u4af2ndxd7PWxuMicjV45luIwmpu+u6WxPNuwQcEfoLyVVepmi/lEQ+d1OMlpTEXpPa6Jo9G0zsWE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2609.eurprd08.prod.outlook.com (2603:10a6:203:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 13:30:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 13:30:48 +0000
Subject: Re: [PATCH v3 11/10] iotests: add flake8 linter
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210115115316.24633-1-vsementsov@virtuozzo.com>
 <461d224e-6527-851e-c995-3cb9e2545f41@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a385ae6b-28eb-e124-ee0a-2aad9d2ea806@virtuozzo.com>
Date: Fri, 15 Jan 2021 16:30:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <461d224e-6527-851e-c995-3cb9e2545f41@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM3PR05CA0108.eurprd05.prod.outlook.com
 (2603:10a6:207:1::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 AM3PR05CA0108.eurprd05.prod.outlook.com (2603:10a6:207:1::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 13:30:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9f82cbc-6392-47cb-f393-08d8b959c4fe
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2609:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB260985C79F7CCC67493D2C49C1A70@AM5PR0802MB2609.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HT5ENgZz4x4RqwVgsZ2i9KJcJFsqqTuKzRbJp10eQAhhARa0oOcJDsWo34ER5aKyZpTSg2m34W4mAScpeLlK3CFZn9oBeIUobtIC2Ws8cfvV2JlM3ZQJByToevUQu9yp8NfAIIPTq8gvVcHLDk49Lz11hrBBj2yosNlTgrWrbnUwNcZwBLnncWrBMjcglGzpVgBxpht6k6pLLxVlPq3vkdTe2S19Pvpv83LvW5kOGT+0WojNyBH/RVUoMCmwIK+84UQsKqeYx3oHxrmz+VknznQCUsBbGQ26uZnZIw/aqvEm99KI1tFysKEcnos+lPfYnyRgo8Xbh7hcN4LQJqvUE6JW6ySC/Nq28iYIMcbrXNbpJ82l1W/KZlgpGYh4FTOLAwBgRpCMj273eT7CcLZdS6SKF3/9+UY9YBkmVcN828WJdQN8Tho803zw4/StVbJV/q54OVHQGmY9tbw5gztpmISfwlWPJUwMm4YrHuhGr/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(366004)(136003)(346002)(31696002)(66476007)(66946007)(478600001)(316002)(66556008)(4326008)(52116002)(956004)(86362001)(31686004)(16576012)(2616005)(2906002)(26005)(8936002)(5660300002)(186003)(16526019)(8676002)(53546011)(36756003)(83380400001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVJ3SG1aa1ZETUVTT2Z1YUt5S1dSaEViL1B4anZYUGt3c1E1Q2ZHZTZhNEsw?=
 =?utf-8?B?VEJKMVl5VW5acG1acUxaa1BSWkhPb3FPSVNVbmUySzB5eGpDMlBSRy83Z2RF?=
 =?utf-8?B?dURCYVhRdWwvbExnK3FPdklBZkg2Y2hsc1Q5ME5HYTRlUXBFUVRZUjI5Ti9K?=
 =?utf-8?B?MnFCT1FIRkJ4V0dORmF4SVI1WjUveWdIWU5iNUtDVlJwdWxETjdabjR0cHVq?=
 =?utf-8?B?NE5oWm5OYSt5K0hCS1lqaVg4d2RDTkxQMkV1WGwxVzlBQ2c1WEFFb1cvV0tL?=
 =?utf-8?B?Ykd4T2I3SDY5Sm9hYUt4L1Z4YjVpWnZiVEhyeTZ1d0x5dVJjTlJWdklJK3ZS?=
 =?utf-8?B?dXQ2dThHMU1iWXM1dWxSSER0Q0VjUDVPRHllTDVjSC9qUmFhQTlpQVgxbmdS?=
 =?utf-8?B?ejBsZS9rSUd0UndaZldadVE5QVBWb2ZjeGxnNTlHSXJoY1FRSnlNa1NwN2RF?=
 =?utf-8?B?OTJWd1BpclBuS2NoOXE4bDdSdG10aXlwNVIrcTFBaFl6NjFBNWgvbW9HWEFs?=
 =?utf-8?B?ZUFtV1lrYlZwYnFEUTI5dmZYTUhSRTlKSW5WU0FJZ090dVp4aThyK3JVTkZO?=
 =?utf-8?B?Wllxb1JuSDJ6Y0Q5d1VkSy9yV2tEWkJlaStlaTdRd3dOUTJpVXNYaUFkNmNT?=
 =?utf-8?B?OCtSRkMyUmlpTW83OXg4YXhmWG5kR3FGcGNzbzloZFZSangvWGJFNDlNa3kv?=
 =?utf-8?B?dnFCTGFiNnRLc0llbjNFdlowVzFCaitJWFZoVXVpTm9CUjE3M1ExaVpidExQ?=
 =?utf-8?B?aFV3NjNEdHZQYXAyZUNaZVRRQ3h5ZmwrUXlodW01UDZFaWVyb1RiZEFjZVFD?=
 =?utf-8?B?VUl2UnRKdkRkSDMxOWlGRWRHbjZ6Znh2cDYxVUhJZThmeHA0V28rRGd5OWhJ?=
 =?utf-8?B?Umx3clcwdVgrNjJSTWF2RkxOZXN2VEVqekdOUkU0U3pTaDI5amU0aCtGTW5u?=
 =?utf-8?B?eFZhUktjNytjY1lUVmdDejAzd0l6YmlObUZ4c09OWmZ2QUlwaHhIOFlWUG01?=
 =?utf-8?B?UnpBbVlNVVdRUjlDYkFoVlFXaVR6MmRCYUlhaVA3UnJ5WTc3MW5rWmxXRFRL?=
 =?utf-8?B?VXVnWDA4Rjd3OHJEM3RyRHR6UG0vRlk3L3hPNkhueVZOejAwSGxhUXNxT0Fh?=
 =?utf-8?B?Y2dCWVhFSFR6RTFuQUJpWERaYWIwMzRDWkw5VkpGS251WkxSTE9HaE9pZ0JM?=
 =?utf-8?B?ZGtNWGFFVGp3TXhRM1psdk1hRkZJd0VqZ21hSDhXdXl6OWFuYjVITitCSVFX?=
 =?utf-8?B?TnZtRHFma1FBL0V6WVBMVTcwdldiUDNhd3hXTGZZY09LZStianF4NmVLbUZJ?=
 =?utf-8?Q?hpzSPNSQaVxro3mgRlOh/o0bm/A4CKlJJh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f82cbc-6392-47cb-f393-08d8b959c4fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 13:30:48.2206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdDj+ybDt+DLfsKmaNEpmWV89fsO9AqNyYTsy3K0gsq0t0ODAIz1Hcgu+hATLz+Hjiu6HZO5khebFMoqOIlfOsiq0DfUwNNN572/sojIzq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2609
Received-SPF: pass client-ip=40.107.4.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.01.2021 15:03, Max Reitz wrote:
> On 15.01.21 12:53, Vladimir Sementsov-Ogievskiy wrote:
>> pylint is good, but doesn't cover the PEP8. Let's add flake8, to be
>> sure that our code sutisfy PEP8. Add new linter and fix some code style
>> in checked files.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hi!
>>
>> Here is my small addition to Max's series, hope you like it!
>>
>> Note, that this is not the first occurrence of 'flake8' in Qemu:
>>
>>      # git grep flake8
>>      python/qemu/.flake8:[flake8]
>>      scripts/qapi/.flake8:[flake8]
>>      scripts/qapi/.flake8:extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
>>
>>
>>   tests/qemu-iotests/129        |  6 ++-
>>   tests/qemu-iotests/254        |  2 +-
>>   tests/qemu-iotests/297        | 21 ++++++---
>>   tests/qemu-iotests/297.out    |  1 +
>>   tests/qemu-iotests/300        |  4 +-
>>   tests/qemu-iotests/iotests.py | 88 +++++++++++++++++++++++++++++++++--
>>   6 files changed, 106 insertions(+), 16 deletions(-)
> 
> Looks reasonable to me, but perhaps it should just be a dedicated series.  I think there’s enough in here to justify that.

Not a problem, I can resend :)

> 
>> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
>> index 201d9e0a0b..28e6666c1d 100755
>> --- a/tests/qemu-iotests/129
>> +++ b/tests/qemu-iotests/129
>> @@ -21,6 +21,7 @@
>>   import os
>>   import iotests
>> +
>>   class TestStopWithBlockJob(iotests.QMPTestCase):
>>       test_img = os.path.join(iotests.test_dir, 'test.img')
>>       target_img = os.path.join(iotests.test_dir, 'target.img')
>> @@ -39,8 +40,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>>           source_drive = 'driver=throttle,' \
>>                          'node-name=source,' \
>>                          'throttle-group=tg0,' \
>> -                      f'file.driver={iotests.imgfmt},' \
>> -                      f'file.file.filename={self.test_img}'
>> +                       f'file.driver={iotests.imgfmt},' \
>> +                       f'file.file.filename={self.test_img}'
> 
> Interesting, when indenting this, I was wondering whether pylint would complain.  I was so glad it didn’t.  I really don’t like PEP8.
> 
> (Though I understand that style guides like PEP8 are there specifically so when someone like me goes “but I like this style better :(”, everyone else can say “but you’re objectively wrong”.  So me hating it kind of is its point, I guess.)
> 

When I noted how you indent 'string' with f'string', I thought "o, interesting idea".. I just very like the idea of standardized code-style for the language, so I just used to follow PEP8 since first time I learned about it.

-- 
Best regards,
Vladimir

