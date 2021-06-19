Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104293AD9F9
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 14:23:56 +0200 (CEST)
Received: from localhost ([::1]:55874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lua0w-0001f2-JP
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 08:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luZyx-0008WI-D7; Sat, 19 Jun 2021 08:21:51 -0400
Received: from mail-vi1eur05on2130.outbound.protection.outlook.com
 ([40.107.21.130]:63968 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luZyt-0002Yi-Qd; Sat, 19 Jun 2021 08:21:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6FmEE7qeqbm41XAbx4YwKLNu+QJXKq1cIeyC0jj54tMQBoGCOU/TrRmw3kSN7IBLdTLXnGwYpxFS3wp6RAAaGiofTcd4aMPjmtZaWwfT9EQVVO2xhjPu08IISdiZp08zm7kXkn2oTHdN//TYAbxJ9tgFKb68zxU7TtgeYP4bvt3P2G3NJbVNvJtPCG7WxJTM2W0ZhXsvjNZd24n2yzkHW4xKXsJNFOYZPNpnQGEIhmJjJUVBrTMalhYC1H4uEIp1NgMZwBYl4ITCfYgJK6xZ8LyXPjZ5tJjTzlmig0nqvfSxT3BI8GMa9Ub9rb+hmYThnBPfgLn4rTiAPeYXtr6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqgiBJRMg6cYe6d9dtsHbwoxwYTx4G5UIw9fmCSQDpw=;
 b=R1FzGEpPWZLZIeEcpbTaPrYFrqMKNEuQCM5e8L4ssViK/pnkqzc5Zu3CZiLci50Ogi5dvF8F/zfc6c2n1bes0rWVXPp+7N3J7bUj01EaHSpSrtIMQ3rLjiIewUYycIaxUJVkZJ+xx85RxpGUbgfA7fyTeOqD9Q/kK+96bu6vvLR3FgVkBEDSthFO1NaMrbkLkanaqFVuCkO8U5EOLttx0Zm0tlo0c+HJOvz94ldFcKCvb/DyOTaDeypJZOADiU7exZmQc8tPFk4lr9zrSHLt7YVS2ddOawcZgAvJbi2nsd93rW4reU0BBJ5CY20U/4YQCxogoSCkl10JFEeFSomdGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqgiBJRMg6cYe6d9dtsHbwoxwYTx4G5UIw9fmCSQDpw=;
 b=PIGM7u5+DKIYOPZO0/MScC9FWvznZ0HOs1WBXV3bB5Rvb5hgV2RHuE+TV63Jlu09o+TeTn3YOl6YBh6Gkq4b7rD6Jnh7Eq/idy2OQqJSpM+HMBxezd+jS7YG6Kgj3sod7mtI55mUjbKrEww5j04/9BrjYy85WKpEihGnkWIGxkk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 19 Jun
 2021 12:21:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 12:21:42 +0000
Subject: Re: [PATCH v3 0/5] block-copy: make helper APIs thread safe
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614081130.22134-1-eesposit@redhat.com>
 <3761c5a9-d29e-8ce5-f785-38b01d76e141@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e1b618c4-6492-9101-d0f8-815edc401de3@virtuozzo.com>
Date: Sat, 19 Jun 2021 15:21:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3761c5a9-d29e-8ce5-f785-38b01d76e141@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0501CA0009.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0501CA0009.eurprd05.prod.outlook.com (2603:10a6:3:1a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Sat, 19 Jun 2021 12:21:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6798143-4fb2-4aad-33a1-08d9331ccbc8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-Microsoft-Antispam-PRVS: <AM6PR08MB407265EE1137CB9EE47E9A93C10C9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ay+bPbZTRmleq63q/J+qWkrPKxRmFU0df77dH8vf/0urkh/G/hbjjH7grAsG5RTD8pEd+bmPnJBquifnXYZHo0vQ9Q97EZQuAOWhSS/C5ecJlp2N/vIJX+XU8NQ1j0y8EGB0+zu84CPl+81NAA0eBwhUmdfl8SdX2Krwa4xCQgNHtL0pxphJKXpONjRJJdxo6DzKELZqcjbGDWTLUSOXr7HWrAWJD3L+2LkKNTCD5dAnSomMrfqfYEL0Bahrx3GfWzxJdwzecCx63IYEouRMRUxvwKnRwbjS/AmsdJKTFEVhz6v3M8RSLZO7b+GYOkDYSF8o9nlFeDlmXXAlqwBhJ8deACbsxQvErcEk9XMuEqboSOf2EcBXEELvL1/e583VeP6pftDHeeu3YEuEEYE+pgVlncTLU0z7/3oG72Wf6VSQoWDKB3+kx7hYIDebhqJ3wI78rG/afhcjcbrcj1sSre/U0eDAqvE62B0P5T08Y/8MzsoCnELx9PZ6XHV/6u/Rwoiqf55capRyNrql1OXiR5t3d3VHsbPQ1ZhA06oh9t5u7Nid18MYqaFz3+EqzZEbHAqPGGYVokIDsJzuQ8ifyRhyGwAzx8oqDVvD8YJEScz89b3NF+3M9tvcFwBinMenrXnlj/S3eFD3rl7T9IL+wYAdvtWd8bGOzX02zCzBbWZMQnVbRjwBatmysNWuWEvpFi1UgHLsOxwkN1HwsLAwmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(396003)(366004)(136003)(2616005)(956004)(478600001)(4326008)(86362001)(36756003)(31686004)(31696002)(38350700002)(38100700002)(5660300002)(53546011)(52116002)(26005)(186003)(16526019)(316002)(16576012)(66476007)(66946007)(110136005)(54906003)(66556008)(2906002)(8936002)(8676002)(6486002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MExwVmZhUkRZQ1l1RmxpNkRFUVZEaHZPbG54T0hWS0RWWGFWTVFWTWlsRkpC?=
 =?utf-8?B?T0s0UU0zaHJIbm9nUzRueWVQVk1Tdm5kVXZFYzdpcFlRbkdBOGxVRGNJK3BX?=
 =?utf-8?B?ZERvU1FiTGF0dDQwcTROR3Jid1h4cWs0UjhjcG9tN2tuQ2tSQnFWYU5ZOGFs?=
 =?utf-8?B?SmlLNWpXdndmTkNFL2kxWTVSekJHaUN2MlFvZjliNnE0MGplb2VMdjVILytN?=
 =?utf-8?B?eTRPb2Fjc3REbDV2VWhOdzNXZTloTzU3OVpQTFg2N0ZXNkVYQWpYUWhieHpo?=
 =?utf-8?B?dTk2V25HWFNZY0lBOElmVG8wQmdOS3k3VExiVDFaVjhCUUpNTnJIRnpaV2Rt?=
 =?utf-8?B?aDAvclh5cW1WcjJsZGU0WlpOWExKVnFLMk5IOWxybFFqUFBkWDIwcnAvRDEv?=
 =?utf-8?B?VE9WVS9xRW5ZdkpsM3VyWFloTC9MdXFoYlFIZzd0VzJhbDdlV3BCK2hySVpG?=
 =?utf-8?B?bTJ4RnN1VkphUmtUdkcxL2pTTkdVNElYTjQ1MlJBY1hlekFsQlNESmpHZ2hw?=
 =?utf-8?B?a0ZQL1BoZWJyN1F2N1BkclFTZUw5NEF3cjE1N2FCR0I0VEdaMndycmVjUFg4?=
 =?utf-8?B?OENxbnBrTkMvWVIxL01LQmYxeDRPOE40dkI4QWNSTnptN24rU2UxL2N5WmF4?=
 =?utf-8?B?b2dZTHV3R1E2ZE80WElvVmt0a0ZqN0d6czFtK2dpWlJ1Q3FqTzIrRXJsZjRP?=
 =?utf-8?B?bUZlQ3E3U3lTRStlUjFYTjNlMU1oUUFWSVd5ZmNEQ0V2ZmpnZ0JXR2hUSnMv?=
 =?utf-8?B?SGNTdTQrRk1xQ1diYVdxZ2s4UC80WjgyaXB3SDZDakNYaEp5cFBOY21ra0NW?=
 =?utf-8?B?NENRNnhWMEZ1TUNPNFBKK1l1TFZNUWRmK2xyZHhmWEg1RHc2aWpvOFZhdFZV?=
 =?utf-8?B?Y3hpa0dVOUU4ZDN1RklTM2xjMUpsZXJuUXlmc2tnSTYxMXdQVGJoYXVFYkcy?=
 =?utf-8?B?TS9vN0x3U0xHQkpLUktXOEhSbHVWT0dlRnRNM3dTcStKK1E4YmMxTjFpVUpL?=
 =?utf-8?B?aGVVeVlEKzNKYWRpd1NaQ25BSnF6QXRIcGFiMEE5RVNFNGIwL1FnQ3pMN2cv?=
 =?utf-8?B?cmFSTnhlS1psVmZTVzJyMEVoaVlmZ1l3ck9Obk1HYitZZzNnRytqeWFvVXpP?=
 =?utf-8?B?TnNJbjB3Um1IcDNmd0JGdEkwcHV2bFExZHkvUUF3cTduckRVMlpPa0lZa3Z3?=
 =?utf-8?B?WnFEY0VZMkhLcFdGT2dqd0YxVCtPQWFuM0NuTGVSVk9vbEU3M1RhR2NUa29K?=
 =?utf-8?B?ajJCMUxWTCtPOE1UMmVnaEFpMk05TmprZEllZWkyOUxDYlNiSXh1YUY2Vzhk?=
 =?utf-8?B?S2Q2TFJBS1FnT0tLcTFKa3NzK1kyZ01xWlBlU0toS2d3M0JOUkNLNHdQK3lH?=
 =?utf-8?B?MDlpakZ4WUpJMUlnUEpWMnFCWHVaTUtJVWVPaStpWVNPRkJmYSswU3Z0bjVl?=
 =?utf-8?B?QUxjZHB1S2FDTVNqVDFoK0M2b1Urd0pxSG82aXhwUUlBYTlsOThOdlJjUUdD?=
 =?utf-8?B?NWUwOHRKazgycVRpeS93SDRZVldJOE5nSHkxOHZkcmlhQndXV3BBb2JmQkxI?=
 =?utf-8?B?N055QlgzR21HUDRtWFVkd24xU01qNHY3SFVodU1OaXMzdXhYMXBNdGVaTkxY?=
 =?utf-8?B?R0c5cjJwSHB4ZzIxNGpkWXBJWVlxQ1V6dzFydFhZL2dHL1o5N1AzTFhUYWxm?=
 =?utf-8?B?QXZNSEJUeHVTZTRKSXAwVUpTVDdobWZWakNVQWdtT2k2eThGZFM3L0U5cWRD?=
 =?utf-8?Q?sH9kXJZ/vdQGUxNQgFNbD9QIHbruaZnTzijX0jY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6798143-4fb2-4aad-33a1-08d9331ccbc8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 12:21:42.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JD5YyeKT46gOlCZ4lcWnSaPYfvyjMLHYR5gUqd27PaOu5MJqAAlhvVHNS8cEExPIcCcFZ9adZx+YVjzQQNT2K0Izu+sGFzgHrqQte3qzogI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.21.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

14.06.2021 11:17, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 14/06/2021 10:11, Emanuele Giuseppe Esposito wrote:
>> This serie of patches bring thread safety to the smaller APIs used by
>> block-copy, namely ratelimit, progressmeter, co-shared-resource
>> and aiotask.
>> The end goal is to reduce the usage of AioContexlock in block-copy,
>> by introducing smaller granularity locks thus on making the block layer
>> thread safe.
>>
>> What's missing for block-copy to be fully thread-safe is fixing
>> the CoSleep API to allow cross-thread sleep and wakeup.
>> Paolo is working on it and will post the patches once his new
>> CoSleep API is accepted.
>>
>> Patches 1-3 work on ratelimit, 4 covers progressmeter and
>> 5 co-shared-resources.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>> v3:
>> * Rebase on current master (had conflicts in block-copy), remove based-on in
>>    cover letter
> 
> Hi Kevin & Max,
> 
> I think this series ha been reviewed and I just rebased it to current master. Can you give it a look and let me know if it can be merged?
> 
> Thank you,
> Emanuele


I think, I can queue it myself as a block-job series. ratelimit and progressmeter are not mentioned in Block Jobs sections of MAINTAINERS, but actually these APIs used only by block-jobs.

I remember, Stefan had a complain against patch 5 and against general design of adding mutex to every structure.. Stefan, what do you think now? Paolo, is this v3 OK for you?

If everybody silent, I don't see a reason to slow down these series anymore and will make a pull request on Tuesday.

-- 
Best regards,
Vladimir

