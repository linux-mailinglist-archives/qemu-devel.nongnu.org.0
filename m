Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F4032E46B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:11:37 +0100 (CET)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6Ui-0002i9-Bf
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lI6TR-0002F4-Cj; Fri, 05 Mar 2021 04:10:17 -0500
Received: from mail-he1eur04on0731.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::731]:58183
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lI6TN-0004U5-RI; Fri, 05 Mar 2021 04:10:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxrcii01X1deyKcYArxLYJAJhO+usWLfU9fHMHp8fFvw8V2sv67CHFUWbV0MhpCOWFNQmlVkjYiAqTVepthPIvyUqNMdrnxr+54m8YGF1+2FtQJ8XjTeoQJt3beK+B5BvxSUUr9oJ0neEVhxd4ZjB6fUAkg+qLvWOfrrj9umdNQEWRaEqachQgK4Im9WsV5BBGEgcokLjMETMut+1Ljf3jefDmjR3CipZP+++ljICB6hAa29ahLt08mdW2h0l7jHz6cES5qhMOuvr0dUgFYNAUrrnZq7x5lnOmmcWxeyXxnEUiTqtXXHYZaOs/Ip3k7zbzdmKeGHZwcK9T6lYZVm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySL7DAJn94LkpofNZjhuIrtVGRt6Kpiq2OpfgwUQFgU=;
 b=LmQUumekuChBSwbeEuxiGquqG8UmP79VxG2mwh7ZDcbeyQoyIVoTw8sxFxZ0Ty/JL3V1toNMas/QVYusCrNjdtwRAvuLubtbBH++kCxQ4sR1tBN4wF8UvUhoA2r2HYVmFQ6ye3HanmQMdact6QNDNtmRfvQ8xQwI8JXuqPKcdruv2irVia61cO+ixEiELg1ZIJlVyR/bTavqsPv4EbjQBs8lh88Yboj2Mbs1ANE6UBMpPMZj01qmPkvEhAKEUitoe7k3uXfWyID7soZa/9i95Bq3oO97io2h+whezvKICh1AEBJHrNvSv2hPH5zmOTWycySxH6OYsRpOaFRUqF2rsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySL7DAJn94LkpofNZjhuIrtVGRt6Kpiq2OpfgwUQFgU=;
 b=EPxcNTo/L00Y6iBNS6589lVIA0LZyR35ewAfRwUvIdAMMPxzAwoasUwqz8+aPKihzl5MlMjrbL8DO1vR8KHCMKCQibVdaZf+oNWsAT6kmAoJIZhFi8mwyz9eSWM3Tg4Hs0znNAFtTm76OynK28ixGRdxfGEWHaZfSMHPnvtA/kE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6504.eurprd08.prod.outlook.com (2603:10a6:20b:336::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 09:09:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 09:09:56 +0000
Subject: Re: [PATCH v2 7/8] simplebench/bench-backup: add --count and
 --no-initial-run
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, mreitz@redhat.com
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-8-vsementsov@virtuozzo.com>
 <a105bef9-9f0d-6380-1b65-d93830408907@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c8722977-ec8e-ea3f-3d1d-d018a5d20526@virtuozzo.com>
Date: Fri, 5 Mar 2021 12:09:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <a105bef9-9f0d-6380-1b65-d93830408907@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:208:3e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 09:09:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12bf7ec7-ffee-4063-8f12-08d8dfb671ff
X-MS-TrafficTypeDiagnostic: AS8PR08MB6504:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6504A0B595BB1A2124E633D6C1969@AS8PR08MB6504.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZmlQDSe7oY/AkKHe1pHB1oTARXoqlqJ66vntHmAsY1LXp93s+G/D+8p5oKDY424hyKBN+IwnqzDMbsQ8kg0UgN90C4lRv47n+6Ryfpsm5l7q8iaCh32zihmwuxP2xQNzwVErcd2mV8ny6jnGcnfFEJO0+rPs7aNb6r6xsXo7GOhyXnmxiFavTY/AaRIIyp2Mi+ziK1XW2kuCXawBmY2rpCbfRFL9ON2gbVMsYazsUogiUfNENKsUybF2bxCFLuJiMpikpc8wSH/J4f03usk3ZIAKhjTPyPeWww6Q4bB21VWPXxQbmnBto+CGndnzeZkAkDgYo6dcSzcr1BkPydQKzRcD8tvsYxII+rOK2EwzxWuhIZY4UIiDv1NgIVJqdD+gvUK8a8Sh1OpDrKtR4OkXosUDGlOhIklYT+AVtp15nxIQvJCecTG2MWHdyAuDvPdOOHL7Zl+uFijKm8af0jnD9MbmyycRT9PosVNPzbHo6ZrT5vjjbISjFX6LNxheeiw/taPXfpY+KDuNOWqznvuD4qLGt/IiEl4Re3YEAFQRYEkE57G63v4o93qVAoKnofwpNnSRkUNag6r6MPoiElsi5whHgBPwd5aCT5gVrvwu1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39830400003)(366004)(376002)(8676002)(8936002)(316002)(53546011)(52116002)(36756003)(6486002)(86362001)(83380400001)(4326008)(66556008)(956004)(16526019)(5660300002)(26005)(2616005)(186003)(31696002)(478600001)(31686004)(2906002)(66946007)(66476007)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K0VSZTZ4QTF3b1BqSWpncU92T2NURFcrd21QT1pVVnRIYzdISU9KRWxtL2Zk?=
 =?utf-8?B?VUZlbllaTVEwRWpOanJIeDkyKy9DejBjMHFaRktqZzZ2N3JpczNQVXBUd1ZT?=
 =?utf-8?B?SHVnTmMzYTJDK2huSGdFZmp2c2lMVUFraFdCZEVrTE9ZN2FpOVFOam9vL1Zy?=
 =?utf-8?B?b29MdW1DbDBEZWZuNHpCbFlnZkgwOFE0VFFrd29pNzY2ZFd5UFZPY1gxb0p0?=
 =?utf-8?B?cW5MSHh3M0R2STU5UE1sNTNLb0FyQzhFamdxdEtReUZrSFFmbkJZQkVFb0hv?=
 =?utf-8?B?dldMNEtXcWRnTDM3QVJpQ0FOdDFmOHRISXFxZ1ZLRThVVEVIaklKWG44WTdF?=
 =?utf-8?B?eUZOSzVRblJkT1hmR3k5UnNQWS9MQmVGV2tsc2tGcUFmSSs2YkNjV3EzeXk1?=
 =?utf-8?B?WmNXbXZCNEl6cWJ3Z09nYlFGTFVPWnBQQS85cHhqcGVaVDZMS2NNazZnMEpa?=
 =?utf-8?B?eHN5c2NoSVNreE5tZ0dybUNYdThwdDJFc1VLdGhyVDh4aHhjaHlMTm12dVBR?=
 =?utf-8?B?MzMxVzJJVHNzdUxSNE8xenErTlp0ZklHMzZ5azJoNlRpVHNWYVFjaXJOTUl0?=
 =?utf-8?B?TFBodDE0WUR1dXI4TzFEUzc4ajRGMDlscFc0emtkbDErK1BENEg0TTdxbHZG?=
 =?utf-8?B?NUdnWVNqU29JZzkyTTRacXQ0V3BORFk4Y3JWRkJLcHFGMGYwSHVwZ3VZVHc4?=
 =?utf-8?B?cHRaM0RWK0lQTE5WSmpQWDBLZ1BSUHR5OU5FNTVtaitHc1RYb2hmZ2RDR1NN?=
 =?utf-8?B?S3Bkd1Y4VTc2a1BDY0ZPZ1l2d3pKNkZLSHFQdXpxaUNmRnJvMFNzN0ROcktt?=
 =?utf-8?B?R0x4cHRleG9sQTlEU0tHbCtrdnVqUDIrTjZlUVVadmd5anpyb0pTOXZ0WVJt?=
 =?utf-8?B?bHhKZ3Nkc1d1aW5uVWpqMGJvSzN0TDlPNlpiZHNwdnRMaUhsakRLcW4wU3hT?=
 =?utf-8?B?bEl2MVJacTJ5MVl5L3hmTlhwTnVZK2Y3dTdjbFYvWFlPZ3NmeTJtN3NoR0RI?=
 =?utf-8?B?Zi8wUWI2NkEvYmJpUXRsdmdwMldOWitYZEk2MWJnKzN5SDRWeHZFcHl2SnNN?=
 =?utf-8?B?K1JMM2c0amxXem83ZXdzaFFKQWpKTStWUUpjcU94TkhnMEcxMGpvM1dJcFlR?=
 =?utf-8?B?Tll1OVNjNEhLRnZXL1lTWEUwbWxhMFZNUm5LVkpmemFPMG1wTG1odUgvYUM1?=
 =?utf-8?B?aXFGc1I0YzR0WHdrZkNOQVpiaGRzODFPaW1rLy9xLzZsTlFzT3RaRFVsWUNq?=
 =?utf-8?B?VTFNdzlmaW1Wc1dkejlFaG9wV0Y2VkhHeVZlNGFiM1pZSXd2VmFjSzB4RlF6?=
 =?utf-8?B?Nm5TMGNLZjZMR0h2Z2NxNFNMVEZyd2FoRkt3TG5GSHorZ2swR3I5UE0rNW1Z?=
 =?utf-8?B?UVR0RmZGT1lNaS9Wb090Z2cvemFCb21ibHZIUnM3S1ZCTGtjY2h0RE9iOG5E?=
 =?utf-8?B?dUlDK2hmZDlCb3UreXpLeWgvSE5PUlB1QnBrQ2w1RndaT2pyZkFoZmRDTkZa?=
 =?utf-8?B?UWFHRUN5REtTd2NsSHA4aXJWN1RwNkFXZEprTTFyTFJCVGw3ZEJNSTFRcU5E?=
 =?utf-8?B?SUN1SHFSU3Mxc2dvQzlRYnRkRmR0d1U3MVJkUm5lTXh5aDJBU2M2OTBYZFRP?=
 =?utf-8?B?amMvNlNkeE5CZ2htTmgrQVcwQ2JmRENGR1pnQlgyV3NISDhnMTN2M2JLbU4v?=
 =?utf-8?B?SFNxMWc1T1lEMkxubHUzZ3hzTm0xcFBHdUZtd1pKTklqbXQ4VHVzSzlUTXJK?=
 =?utf-8?Q?5iSmn4rTjb3gOLKV/YDe+HqYuF0kPsvu+9qBGsZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bf7ec7-ffee-4063-8f12-08d8dfb671ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 09:09:56.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cFzqu02qB1fgoDiFGmSBLf6hnkPCCfZMgliCKshGRQcw1uqH2jnDU9kk3PM8L/BAFIoJJe0vp29EIPqXLwT/NTeqz+GQfm6L+A9ox0je3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6504
Received-SPF: pass client-ip=2a01:111:f400:fe0d::731;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

05.03.2021 04:37, John Snow wrote:
> On 3/4/21 5:17 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Add arguments to set number of test runs per table cell and to disable
>> initial run that is not counted in results.
>>
>> It's convenient to set --count 1 --no-initial-run to fast run test
>> onece, and to set --count to some large enough number for good
>> precision of the results.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/simplebench/bench-backup.py | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
>> index a2120fcbf0..519a985a7f 100755
>> --- a/scripts/simplebench/bench-backup.py
>> +++ b/scripts/simplebench/bench-backup.py
>> @@ -155,7 +155,9 @@ def bench(args):
>>                   'qemu-binary': path
>>               })
>> -    result = simplebench.bench(bench_func, test_envs, test_cases, count=3)
>> +    result = simplebench.bench(bench_func, test_envs, test_cases,
>> +                               count=args.count,
>> +                               initial_run = not args.no_initial_run)
> 
> The double negative feels odd; "initial_run = args.initial_run" would read better and avoid changing behavior, but maybe that's intentional.

Hmm it was simple way to add --no-initial-run. But I agree it looks strange. Will improve.

> 
>>       with open('results.json', 'w') as f:
>>           json.dump(result, f, indent=4)
>>       print(results_to_text(result))
>> @@ -211,4 +213,10 @@ def __call__(self, parser, namespace, values, option_string=None):
>>      both: generate two test cases for each src:dst pair''',
>>                      default='direct', choices=('direct', 'cached', 'both'))
>> +    p.add_argument('--count', type=int, default=3, help='''\
>> +Number of test runs per table cell''')
>> +
>> +    p.add_argument('--no-initial-run', action='store_true', help='''\
>> +Don't do initial run of test for each cell which doesn't count''')
>> +
>>       bench(p.parse_args())
>>
> 


-- 
Best regards,
Vladimir

