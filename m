Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346EB2F4EDC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:36:32 +0100 (CET)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziCF-00006O-17
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzi64-0005Kw-Kn; Wed, 13 Jan 2021 10:30:08 -0500
Received: from mail-eopbgr10120.outbound.protection.outlook.com
 ([40.107.1.120]:4494 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzi60-0007KD-US; Wed, 13 Jan 2021 10:30:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7O6jloTvkVEwad19Of6f6/atq4c3bEMEaoxEXfh4pBVU0x/XmMk/mu0WgP9oODSVD7wePTxux11Qvsv7Rss9nTap4D5ofYKPHnJ/rFets6nCmKswfsXKoYabgU8CZzUMgJkFfHe+6OYfX1mGvefwP46/xfkR29QlKzkMhSAJZ8KAoULQh6KWA3CcviV4AFFSTYCRRDc3DLBO3nmRZ6FEpQ2TY7/rTXZiGR0As4el4GQVLAwT5VDOy6WLmgf43sLm+tmeW5327XbnrQya0puh4Fy7z96zItIiNQ0UAcJTDBfoUR75siW/f2/Ojoljcoj9BHYfbTOtNlZCw/p1jHPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZCnIZcl0XrVoD+zr41eLsfm++hpwj1ltMsCiB9qniI=;
 b=HUgAbZQb7kspib2FRBqcmNC83B+wNXle+rh30DruIatwZK0by+GtY0gamaO2xxUZLy44wK/prfWv9GPH8OJmwhurUqc+CP/wZC+4NV03FbNTiVs3XCNp3JuD6heWyJFCFrUCop9hkxIqBpRTsNLdmfgdmm47gdnueKExXLaqPsf98hU3un/TKR8XpnrQePY+IQkk4VhwX58VvnaIirRt1bcfhDJOwtZkQNWvWdO3bvR2MTTw2g7bRpqdPc7dea7d0y+7z3zDNCeSEuadKAg7+rVvJlhO/3UyvJEIJFRK1Z4C2LLJ8oZlOLlWwHPuMbYD/O1/KmcODS+uKHHKqZf5tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZCnIZcl0XrVoD+zr41eLsfm++hpwj1ltMsCiB9qniI=;
 b=MZ0b3EQR90XSNrpX2ArvDucla9ZaaAN8l63ZGthcD/y/q1G6SuRfpvnOLSccN73L23bqR7WkHZj70xNPk9mUvHu3K3GSAlva3pBhlvRAhDn4P5JGVdRhxzxOMf1rbJ6uTOAXyEWfcOLn61T8nLGRFQmCatTHuyawQEAVZ4hN6xI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 15:30:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 15:30:00 +0000
Subject: Re: [PATCH 0/7] iotests/129: Fix it
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <746f2be4-4093-fcff-fddb-60b0cae74c31@virtuozzo.com>
 <e2d3fd8e-f138-c37f-8b63-be3aa9ff31be@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <10006a30-8543-ceb3-33e6-fbc619efc1fd@virtuozzo.com>
Date: Wed, 13 Jan 2021 18:29:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <e2d3fd8e-f138-c37f-8b63-be3aa9ff31be@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR02CA0025.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::38) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:208:3e::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 15:30:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93c0eb8f-5d6d-4193-6001-08d8b7d8177b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-Microsoft-Antispam-PRVS: <AS8PR08MB63099E8029ADA8A9E2A9736DC1A90@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oF/IjAoKCiEUHN1cXYioXIlVUQrEslFd6Y8ps5JnLNvLwUgbXmxdxFBOxiDa6EHOyZdoKXmyAEajdwkyksloNikKzWBd+CGaLMU0cTdG1SuC9Vl7O/oxLnC8W1eFOGVMyLWPASWSEnTQi+eizbfpQQGhiIua29cwVQzbaPl6Cm3nPIjZ+cXuDZ8T3NRfQHmhp0hqo5tM5Pora4LliIO8v2JpbAgLXUUnLDArzYTcsOa08UvLhmiclbDkk3zCP5c4KIlus+XSmbDyXZzmiNmFJkLV2Z20WlBSmfMAA9R0dyNOL7zLh6Vk567Xd6nGT3vUSdatgLWPlyYCTQ79G0DKt/kNNOP9HKWDMuDiRzI0ucJ788aewjrlhNsdRH+7ma6O6+sNUYEmhGE3xejMPRgMP+QgvYLbZVRX44vM1gSZtwtEjzgTnpaTLVK+6LizX26ayBJsndlOP6+BjP5zm86Zn2hGrWyuRXsDbXP1uW7Y5ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(366004)(376002)(346002)(136003)(66476007)(2906002)(66556008)(66946007)(31696002)(186003)(26005)(16526019)(8676002)(478600001)(31686004)(8936002)(4326008)(6486002)(2616005)(5660300002)(36756003)(86362001)(16576012)(52116002)(83380400001)(956004)(316002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3lWQzRxMlZKMlR2R2x6d2xXME8vMDV3Y0tTVGFBWXdadC8xWE0yRHptQTdH?=
 =?utf-8?B?WVlUYjcvclRiSVNudGtWdzJNbUh4Wlc4NGkrRTV3cFRURkN3SmowMmEwMGZO?=
 =?utf-8?B?RVV5dmE1NlhFUDRXcTFGa2lvYUFVT054WFdVbEdJY0d3ZytHcEhMcUJZNnUw?=
 =?utf-8?B?YXFkc0x5RHdtSGVrSlNaTDhLT2R4SnhnZ0QxS1FxVGg4dDRZWFVrbFNSbyto?=
 =?utf-8?B?dlRKMjNLWWhSd2o4bGZ1TmV3YTc2eFB4YzdmcDFoNVZqNWJzY1J6cVNoM3pP?=
 =?utf-8?B?NHI3N3RtZjJjcGViWUl4c0tzTDcvUDB5c3NWN3lFQkVzMXYzMFd5VXVVb3Vq?=
 =?utf-8?B?dUZnRFY4RVFmNnlqVlV1bi81b1BhVlhBWVNqdDE4bWdJbHZlRDV5cVUzdHE2?=
 =?utf-8?B?NEdkaGx3Vjg3ZC9DaE8yeFg1MVhlbTNQcFVQbnB6VDFmS2NkVmViQ2NORGg1?=
 =?utf-8?B?SkRmUTlRMXhPbk1uOVpSVXRPdThhZVBaQU5SS3lHbkF3bGw3ckxuajArR0M5?=
 =?utf-8?B?QnFjR29NMVlxaUdMcVRTUTlkSWxiaXJxQ25Ka2tCbnFjNElmOUFBV3ZFc1VO?=
 =?utf-8?B?Q1lRRXk0NWpVWkxJQWVKcjhuSWRUNDJUT050RXQ4cGNCZmt2QjZGTkU2THNt?=
 =?utf-8?B?aDQxc2U2QWtSY2JRM3NnUUN2bmRORTdSajV3MFlNRWY5Qis0UmIzV0J6UHU5?=
 =?utf-8?B?YXFyemFsMmtKUXdkRWpNWksrdTVBbzBJMmFqUTV0MUVmTWRId3hBaEsrSUFO?=
 =?utf-8?B?R0c5Q3lrbnN0ZVlicmJOdGFXb0xhbGtkQmpJRlFxZnNOTDlycTl3aW1kZjJF?=
 =?utf-8?B?NGNNWnltWjFnU3dUTzF2ZFlkQm5NUUdsVVBnM2FBdllYK08zWExIZGFNbXpL?=
 =?utf-8?B?TDVFQi9sZEpaQzhCbitIZmx0cTcyYURRWHhhY3FZOTVMcUhxRE42Q0FDMmcw?=
 =?utf-8?B?bnQ3N0kyaUc3L2lSaVpLcVBHRUNQRENGR0ZPeWptVmlZdG9rcEtIb3Fnam1o?=
 =?utf-8?B?cnBlMFVKemdHTElPWnUxL0dHOTRBcHF6Tm5mZXJvaGhDaCtDakpvaWZkY1pv?=
 =?utf-8?B?d0FoWDdsa2pBRlZWa3o5YW8zazJEUWlhNWRiOERRaDV1bXFmNnllc2had0RC?=
 =?utf-8?B?R3ZWeStYMkNEZEJHT2JHcmtSMHp5b0EyeU1aNndwS2NsZ0k5NkFoeUQ4empK?=
 =?utf-8?B?bUNSRG9rZjIyeS9XRzR5S0JCMVkwM2dRYjBMRW93ejZKSVpvQUlsUWFoaWEz?=
 =?utf-8?B?MWdJckg5bnlMdmh3R3dDbHJlNW42QmRpZytORFpuTG4ydkdBZlFBT1U2NUwy?=
 =?utf-8?Q?N5G8NDedR57HIn+CwJDTGhUBR8Bg6XKOR+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 15:30:00.6973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c0eb8f-5d6d-4193-6001-08d8b7d8177b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJv5Q8xg+L2ECv1vWuFUiDeSWsjrYK0n7LwAtrf2CGhQWvEDK5Tw6J74IHrLUDiRgf/5Kn8pAHpeRd6WVlDHKEQUpe8dj5DTX1STG6CGVLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.1.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 18:19, Max Reitz wrote:
> On 13.01.21 15:31, Vladimir Sementsov-Ogievskiy wrote:
>> 13.01.2021 17:06, Max Reitz wrote:
>>> Hi,
>>>
>>> There are some problems with iotests 129 (perhaps more than these, but
>>> these are the ones I know of):
>>>
>>> 1. It checks @busy to see whether a block job is still running; however,
>>>     block jobs tend to unset @busy all the time (when they yield).
>>>     [Fixed by patch 3]
>>>
>>> 2. It uses blockdev throttling, which quite some time ago has been moved
>>>     to the BB level; since then, such throttling will no longer affect
>>>     block jobs.  We can get throttling to work by using a throttle filter
>>>     node.
>>>     [Fixed by patch 4]
>>>
>>> 3. The mirror job has a large buffer size by default.  A simple drain
>>>     may lead to it making significant process, which is kind of
>>>     dangerous, because we don’t want the job to complete.
>>
>> Not quite clear to me. iotest 129 wants to mirror 128M of data. Mirror by
>> default will have 1M chunk size and maximum of 16 parallel requests. So with
>> throttling (even if throttling can't correctly handle parallel requests)
>> we will not exceed 16M of progress.. Why we need limiting buffer size?
> 
> It does exceed 16M of progress; without the limit, I generally see something between 16M and 32M.
> 
> Now, that still is below 128M, but it’s kind of in the same magnitude. I don’t feel comfortable with that, especially given it’s so easy to limit it to much less (buf_size=64k makes the job proceed to 128k).
> 
> Also, maybe the default is increased in the future.  Increasing the chunk size by 4 would mean that it might be possible to reach 128M.
> 
> I find not relying on the default better.

Hmm, OK, agreed


-- 
Best regards,
Vladimir

