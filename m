Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD6302804
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:38:20 +0100 (CET)
Received: from localhost ([::1]:52742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44sd-0004lY-Dt
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l44rW-0003sy-Dt; Mon, 25 Jan 2021 11:37:10 -0500
Received: from mail-db8eur05on2129.outbound.protection.outlook.com
 ([40.107.20.129]:38112 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l44rP-0001YZ-3M; Mon, 25 Jan 2021 11:37:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IALW6jdXAZys6mZPyDqvwfRMPqNjXfBag46MZIg+AkOhvt8Rynn5qF7ZMK+eSjif6qE4LEtrbmqoYLBkbJHiVR8byBJJLqgQGNrwkVoO1SaqiUBmfkzApHQzHxhVICaR/wUQ7zLhim4FnG70CpE38LXEcbS9V3nHUCUy0tawnwYdAqf1VewAxRRkXTgYASUZMMNklgVgADr77Mua84ieH6hpe5xpWdnxqDdIUs2b+PcNsgmnwVfdU5fTXYGjRQoYdmMCjqLQ0mrKkNzCcQVnpgYuPrUte1RDmr+AYee01Y3xdrHekwJWALiJkQzmzHnkgze3zgMprhio7uLt5S2Lyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKuW6KzUp+IhpY027uCtvn7RY9rH9iRH5d+R5p9fqUM=;
 b=lGUN5EH41TqZMIb0NKINRpVJA8bPlJaZ32P89UC1vVkzuPC37wXN0O5QmoQSYYm2RK4fOGjO1feFttQwZpqkUqYDKS+WpEYsrFnqZE0NyBqWsO7MyQ7P4k2yx8UGEM9sai3CoBwFx07qWEZWA3ZltQAj3LY31AFt0M8RFusaYPK2+yw6nEPDesbU9qLwlutv1pBc/4fMVzGBz6FVELGomRmyt+U5mBJo0wpTAs3KDtHYJBWqypBZp49WGeyJK+ZdBoAL56PSGBbsaiISRuo9xHbCNoOYs6/Sg1sFLkrq2sYnUa/UVZVrdOcAJGnFGE2EFOobJ1fKkdbZkKEAxfcfsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKuW6KzUp+IhpY027uCtvn7RY9rH9iRH5d+R5p9fqUM=;
 b=MGf5Ouijio6ZiaAWHBoFPPm/R6dmm3XzGWyD6HH4EcIwgHUN/v3ZuzliaYR3jiWOQCqRCDrZAkihIclSMeEx+a5IMneiy3JWcrQPE6wrPDVQuJG+LQjbtHG+WCTsLfHPR/uF0qeXKz2T/yYSb5OfemxxYsRlGKDaK7UIKpPcwj4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Mon, 25 Jan
 2021 16:36:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 16:36:59 +0000
Subject: Re: [PATCH v8 0/5] Rework iotests/check
To: Kevin Wolf <kwolf@redhat.com>
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
 <20210125160820.GD7107@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <65a24006-32af-1ce2-fafd-e1ea152e4412@virtuozzo.com>
Date: Mon, 25 Jan 2021 19:36:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125160820.GD7107@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.113]
X-ClientProxiedBy: AM9P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.113) by
 AM9P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.14 via Frontend Transport; Mon, 25 Jan 2021 16:36:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48a29ef1-02a5-4f35-ce07-08d8c14f6fb8
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16527AC45C9A61069188D869C1BD0@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yWVv6THGXWqdDXScGAREHuTdtIEBUpvLuGhOEa3XVRZuNJNmaAzcP2i4NIcsiwo0rVvYQ3laRtCmNVB84m9tSykRlctwr3zv21Tg0VNcxV334q8KrnLqUKllVrsNtaFltvAflKkJZl26CdAH49q7h35MlM2Lr1Gwr/AfHDcxOf726a/VD+QiI5mfJecwGp2j5bgc1L64jn1Zo44PgMSp2iF08VJIvH3Dm2NxvWcJp+qz5NhTvJZwGqlDhA1q4YoKcTa9Kz1uRTYyLpfMnYTfnr3HTisCteJkMvSDz9VRbsFKWpvz/mT+JytrXgKAdPYQG6a7AvvwgwEFGFg5dtoDA4ei8qoTM4UhJ/3ElMApltkDacIf/0wTijEu4EFdvW3ql0jUgaeK8Q0CwRS1OeuFBFqALJ20x1UFMKv1sq6IfE+OfnpwTLrTOy/JGFR6Fnkw5gN01qeejqwxVV3UMs1/rfLkeVYN94nqKiFN6wgkG6AB+NxwIx14HgNxXMzI0UrgvhW5EMbSMUHJVKz7sGs3SAMRisP96wYXCrLs38koYD4ZjYkieV8xYS7U7T6nRwnR2tyb2iZin6FX3hs6T4WYQu7k44AcenuLDb/6ILRunsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(396003)(136003)(5660300002)(31696002)(86362001)(83380400001)(8936002)(16526019)(2906002)(66476007)(66556008)(52116002)(6916009)(26005)(4326008)(2616005)(31686004)(478600001)(956004)(16576012)(8676002)(316002)(66946007)(6486002)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVhaYTJPcnZTWUJydmlXaThsaEtlYWpyNUh6MWtScGN0VWJVQzlBL0pGVWta?=
 =?utf-8?B?S1hKMEZWdzRkVk1JMS8vVVkrQUtOVlhzWHNiUlZjU3V4Z1hVQmVyMGI0MUdo?=
 =?utf-8?B?alJab2hiUXJEc0kyenlrNldZS2tiRGFxTmt4c3d5NzJyZEkwNEIxcWYybzVR?=
 =?utf-8?B?cUhKSEQrWDJZd2RDU3dRMGtVeS9NVHVtSGJDRUhVZDlrOURNUG9RbnJKR0J6?=
 =?utf-8?B?MytaclVMQ1RlaTVzUEVkNi9BcDF6emk5cXVIQU9ib3JGNEVQRFNMZlJWRkx0?=
 =?utf-8?B?SVc2dldPSDNoQnp4MEJDTHZTQktqaGdXMUxHbkd4STlYeFU0Yjh0SW9pNUJV?=
 =?utf-8?B?dnl0dExvUUcrR0pBUm05WHNvRWVqNVNTQ3IxU2grYlFPNWNSdjQ0MGsxeG85?=
 =?utf-8?B?R2ZxSFUzb3QyRXk5cGw4azIwQWUrU2twczZtQUJBSjdXUnFWNmd1OUE0UTNL?=
 =?utf-8?B?ayszVzkzd2w3VzRrQjVka2QvaTNjdlJ1Zy92Q3o5eW9sTUkrTWNUaVZNcjhX?=
 =?utf-8?B?QXFpMmVQWURuYkJzZUpoN2NmdE9weW9ZZGpqdW54OGt6Z2tpcU9iK0xlOWNE?=
 =?utf-8?B?VFE1QUFqRkNDK1FzZjNSenZDY0x3OVRoRW9ML0JmQVdOUkU1UWlkdlZSc20x?=
 =?utf-8?B?ak10RmZsWDlMZ2xEVmNLdzlLamhpTDhuWG5IdWo1S3Ntc3I0WXVHbVQ3d2t3?=
 =?utf-8?B?Y2xHbktORDVXQW82WGtkUGwwekExVVRtK0tIZzdJdFRUU0VkMFdmTnZOTDlK?=
 =?utf-8?B?TUlkUXF4L2l1SlBrSllzbjdzTXF5ZXBGUFNiQ3VhZnBWQXFEQThGQmk3Y01L?=
 =?utf-8?B?RnR4U2I2K1d4N2IvWUNPMGxlVVB1b2ZNWVpqbkxJaUhvYzlTMElpOVI4dk5j?=
 =?utf-8?B?Vm1vSWw4NW5DdWQ2U1k3dm9WSlpIcWo2V3o0cHBSc3ZuNC84aVJIbHZDMHJa?=
 =?utf-8?B?WDlQL1ZzaHlkN20vK3pQcGZkdWs2d1VEcFdWSHVRME9XdzArSnh5bk9kSzRw?=
 =?utf-8?B?SGppNXR2QXovMnhabkRrbnZWTWc4dXhiR1BDbmprZTdYcFdkWklleGIySXNX?=
 =?utf-8?B?M1RkVzYyWFlvaDdINi9iUmt2M2k1SmU4T2UxQ04yU2dNc3Y0TWswQ0NhM0d2?=
 =?utf-8?B?NStSWUFVV0lnRStsMnZRbjM1TVVHVGY2YTVTeFZiQkNKaDBBUXpuT0lhUFFY?=
 =?utf-8?B?QTNINlRrSnlmb3I1Q3NBSFExdy9EYjRtWm5EU1E1Um9zMU15TENwWXNwQnZ4?=
 =?utf-8?B?N0NxOHZxSDJnQ0tybnZpTjI0cXpiN29SNWUwSFIwTGQ4VStUNWgzWVJKZ3hG?=
 =?utf-8?B?aVBpaFd3NGtxNmtkQ3RQMXEwcTVJZUdYbzR5MStBVE9QaUxjQW52UkxoOFBG?=
 =?utf-8?B?TDJOd09YZWhMMFVKM1ordlhGRm1lZVRNQ29kZEJOVUZHQy9pYVlLVXJqRS9W?=
 =?utf-8?Q?MNSVje+/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a29ef1-02a5-4f35-ce07-08d8c14f6fb8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 16:36:59.4989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvESUeqJkPlyJp6e3It4G5TnpUWaSH1u5A1JEf5r8puZ8PY8bEo5HjgXYf0p6g3U2jMWaMh80oALirh60O+jBaxw7VKnajnhuqm3uf9Sr2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.20.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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


Hmm. Still, I do think that new order is better: no reason to run the test, when we don't have corresponding .out file. So, may be just change it into "not run", with same "No qualified output (expected ..)" message, what do you think?

> 
> 2. Test case 146 for vpc passed previously, it fails now. This seems to
>     be because of whitespace that is checked now.
> 
> 3. Skipped tests display either "..." or "0.1s" as the elapsed time. The
>     old check implementation didn't display any time for them. I don't
>     really mind either of the three ways, but a consistent result would
>     be nice.
> 
> Kevin
> 


-- 
Best regards,
Vladimir

