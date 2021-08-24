Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36DA3F5AF9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:25:51 +0200 (CEST)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISgp-0004Oc-1O
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mISff-0003Yc-FD; Tue, 24 Aug 2021 05:24:39 -0400
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123]:64032 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mISfa-0003CC-Gh; Tue, 24 Aug 2021 05:24:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+UvH75VKw3wVkiVlixS//iYQ/m6KtXgiMF5KfM4ren4MqyUzfAS7CQd4PvvX3fpVxh22kW82RGgRqerkzan85sl3T9IW1zjtKmeji1elrz6zkxeKRClJnmuvBe5nRawIvUHmC3JvXn9618Ca0/3+qQyuvewDfZzu6T8oXxr+s3K2B0dJjv/HE1xrMM2piPOZERe+Gyh01Ild6NvzY++mOUTPpC4jPXkVArjHeYxCjSeGCaG5O3lqrvDQCHY5vOdlKfvXUEoiMe5L0JtIPWiAwJn3M2QN3wn6YYiiwVg1eRZnfnUs6XtkIXKgCVh/P9VkzC25kCGZZKZKEOSV7r/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K/1oil61tK6belFi/7pA+s2ykqpinGq99vi4m220ic=;
 b=b+59VwaZ8salEXD2G4szBsJjbOhqOe4oy0jkSmpUsJ/AOaSKpdME2cm4LSJlcs6Vv2ix54wLulZtkusHnJg68RN/B8Ifc7btd7fT0RLRgtHK5jUt5a8mjUfLByiVXIutBEOA7veP6/ntWKgkFB6+IkyD2ezwddwfyIONUMkCBABczWKCKL+2D5cern2mPPM0BuG46t0FSCXFaug5og7eTJFSqOzkNbruwsCj8HXG1aNoBwafSDneavOTJTrxEwAkamvx7YogK+2zLTF9nxzQRmBB4NADQcKYBc+LoIStmVwyKvypkOIulXLQt14H121MaaDwPkE1o/+tHahGQMK5tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K/1oil61tK6belFi/7pA+s2ykqpinGq99vi4m220ic=;
 b=d3y1sjiukrRWVwjfy90FLKHNhTLHTJ4dB+t+9+b3YquqAlqI9DZLWnj+gFpbwfYrkrhHrQ6vPRr1XplIufjqnTjiTJiEo6XM+AdgAvni8xu+AqzjCtz4mXBJnm04PACftz3EHoT0UKmJmgtYgXnidV6Cj7Sqw67+fQRVN8F7gVw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 24 Aug
 2021 09:09:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 09:09:47 +0000
Subject: Re: [PATCH 1/3] simplebench: add img_bench_templater.py
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
 <20210724133846.64614-2-vsementsov@virtuozzo.com>
 <784f21b4-f990-f0af-1f24-caa2c66144bf@redhat.com>
 <86ef6f7a-a9de-e422-be66-99a1edf27cae@virtuozzo.com>
 <18d5aa59-3d73-02b6-589e-bd2f52d1f626@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <28d979ba-0fec-2100-17ce-55b75c676a24@virtuozzo.com>
Date: Tue, 24 Aug 2021 12:09:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <18d5aa59-3d73-02b6-589e-bd2f52d1f626@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.249) by
 FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.8 via Frontend Transport; Tue, 24 Aug 2021 09:09:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9327caa-b568-47cb-24cb-08d966deeb99
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904C4BE3E66ABCC390EB888C1C59@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q4cxEajcNPl2Zjv96aQQyYaR2u4Hf1YadIxCkVAeQgxNgZLBwt9KrhjbN+BF/xb3pRVEpK9X/ygBpL2uSZ1r1aksA8f2vNsNty9u6MRE+CPHHYKMP6ogFnuNgewaldOejiYd+URJpeJn6Y3CYBdVHzO9lf+vTTRe+oLKgu2SxMjNwUGX8AWXllMEyaRoWX6JqYQOLo9ChPXd3+kzsh6QDS1LiSzyCk1xJKgW2Pl5smFXFI8fTULi7FSMwmFkEp3Yzehar7LSZBNXS0yX4R8YtC4t/mNOr38ZpTnz2FkRQAMhZUm7cjg1JC7BZPh8WQgW2GkTQoIZ0HxmlKARkc2w7ujo9sKKDfDewK3dz1xA93PCMt8xOzX5hzvzzgm2y4V3Z4MY9QumfWaZ6jKM99s1X5JwtM+Zpo0Z/V5RHkAyqM6JS8lnC5EoMgQsAwLsX4ifrploww13QRJNSaBmqLetF556I4yLszErSH0g+ny+fxN+uPDjIuo8yhUswZDJC+jKCVqxIATjsCo+iSL5mTlQgnick77wnfziD1yeyGIHVfOWA9/P4qRyZ1xbJoYTL9mmKCWq3zDyWycOIhge1kIh46A2bInvS9E7SbfDUjtPWs9x4sOVVb5qcxfSrPHThMGXEVzLL/tbyJO1EvYDrT/BH+AyphaQbYPEyyJ1BcJmf7VLjVx7Z3/mgfF2kRXxMyKfXeScvZqSjW/ZEnqjihNGnw8xAv+8O2FAIGGWvtLGkvVZ0fy3rDyAlZAubDvuhNIy/86ouXnC7F4VzNSHrBAkKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39840400004)(346002)(31696002)(66556008)(107886003)(66476007)(8936002)(53546011)(26005)(86362001)(8676002)(38100700002)(38350700002)(52116002)(66946007)(316002)(2906002)(186003)(5660300002)(6486002)(16576012)(36756003)(4326008)(478600001)(31686004)(956004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eURIbUtDb2VwS25GbXI5ZGV4V3E0dUlVR1NyVjZlc3k4RHBqalV0OEVNUWkw?=
 =?utf-8?B?Y0hheERrN3ErOW1uWkQ3SUNFM29VZXAwR1ZiT2Y1U0owZUtIbzNRSnJOUWtu?=
 =?utf-8?B?MTFoNmQ4Ly85bjMyK1orQWVuenB1eThCeE9vWWRmZlJ1SXdFV2pZRWErK0hR?=
 =?utf-8?B?Vkh1MCthM3VRN01lSHFsajMwSm5idmFJU0JyRWZCVFY3Zk1DWXpMSW81L292?=
 =?utf-8?B?TEI2MHBBOXQ4ZlVjLzN1M2djUldCUExaWE0vTkVTNzhjbGtYUS9WM05HTW00?=
 =?utf-8?B?UE4xZEE2c1Z1REVRN1pIMmN6Tnh1Y0EyM2k2M29Pd0w1QWF4U0hxdks3aW4z?=
 =?utf-8?B?d0I4dTVVVTFiOXhpWEswZU1EZWV2L29YcWlPSzgwZnZxdzdTMUdHN0xQYm92?=
 =?utf-8?B?S0pvdThya2NFNDZoWFRSQzhHOTh4WGZsWlZueThjbUt2TTRCK3dqRmdQV1l0?=
 =?utf-8?B?ajJvcFVFQ2lybVNOcU9vUFQ3bXowVksxSTdXdVVPU0NPekdWcWh5WlAzWXcw?=
 =?utf-8?B?cWNKU2JIeXI5L2xuTFZmb242UmlzS2d3c1FVNkUvS3FwUzNNR2JPMzlqdmN3?=
 =?utf-8?B?MjRjdlFxOFYzMXBKZG1OcXk1bmhvUW9LaXY5RTVNejh4UFBkRlRsTzZqeFUy?=
 =?utf-8?B?KzNhQ2FFbjdHcWg2akhpc2NSZ0xqNEhldkF6SmdyYThpS29TQUVuMjFGbSsy?=
 =?utf-8?B?Ky9jMGJLV2xoZCsrTkpuYWI1MWhGT2VmRWs0Q2k3STFleWhEQ1EvZVlqNkJk?=
 =?utf-8?B?cFRwNm1mV1FNck5XWGExZ3lydjEwSEg2a3lXVnZYSk5FaXg3b1Q2TE9mM3hq?=
 =?utf-8?B?VXZPblc0M1ZrdFoyMStYbTl2YUxuV3FJREk3ei80Y1BJRWF2ckZxS1ZoaXdr?=
 =?utf-8?B?bDhOKzY3cHJkOUY2c3NUQkYzcjR3dllDZDZLekxiRDkwVGtEL3VrMkFuOEVq?=
 =?utf-8?B?aDF2TzhPY0NQZ1NHdkt6aUhjNWNKQjNRM1BGT1E1VmZQYTNvQTNBMVp3Y2pH?=
 =?utf-8?B?bGlHVnhSc1d5VEZvL1NWV3lORnExeFJ1V3VNMk1lU2E0SDNJYzdLRnE1VGds?=
 =?utf-8?B?NXhuOGNrRzVmSExtQTdKY0lBVHprai9PMHdCWHkrR0dPeDgydjl6TTBxaitT?=
 =?utf-8?B?aGxvYUlNUlFkS3A3OHo1WnBjYitsUTVGYW0zSHQ0aDRKWTIwVzFtOCtPcjcx?=
 =?utf-8?B?R0o3VXhPd3l4RDlMYkt6S08ySThWYWJNRnVuV0p5UU5LTVFBdUZkLzdEWVA5?=
 =?utf-8?B?TEhXT09lM1F4dHU0MCs1RTZsb3Q1VE5XaElQZ2NSanBnUjNrVGJudXlBLzJK?=
 =?utf-8?B?d0xEdWVZckxlSXRDYmJhWW81UUQ2YnFzWGhjdUxrWEc0eG9seEdHM1BBSTN2?=
 =?utf-8?B?MmRuQUZydU1BeEFaRFE3NEtUMmZFQjJpYis0elFMdkNKT3dYVE80b3BmYlJN?=
 =?utf-8?B?bGJqRVZzMEVKYVRacHA2RVBkQlBHekJzWlY4eDJBMzNaS2w3YU43alhzRE10?=
 =?utf-8?B?UGsvSnJ0Y1Q2aXBNcGoxRFYwRUZBTUpqWnpLZXl1TFBwMCt0cFc1b3RzNXp6?=
 =?utf-8?B?UVNaY3MwcXRpNDB1cTNnQTNRUFQ0RVZkKzNLYVZqTTY5VXZQWXZYRGRpN2Yv?=
 =?utf-8?B?NzZBbml1WWlQSHFnS25BcndzTmxGREVmVUYzWDdrdE4rdWJSaXkwUEZDUjBw?=
 =?utf-8?B?cFI5ak9aZUdrcjF0dllpeFN6blU5QkF4STJQSWhsRjNqUmxCeUYzejMvTnNX?=
 =?utf-8?Q?xKb8aA3lr+qKl4+oX88TQ0NDN/s16g02vDNa0oc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9327caa-b568-47cb-24cb-08d966deeb99
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:09:47.1917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laClipoN5dLyk1pT8MGVjorqOm/CGJelSs1/nHpikOAlpoDc0vS7fhhDaPNBawZ3IideMFgaS//um+6hf75H4rfKs3eunvmOcvh9FNI3Tw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.22.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

24.08.2021 11:59, Hanna Reitz wrote:
> On 24.08.21 10:53, Vladimir Sementsov-Ogievskiy wrote:
>> 19.08.2021 19:37, Hanna Reitz wrote:
>>> On 24.07.21 15:38, Vladimir Sementsov-Ogievskiy wrote:
> 
> [...]
> 
>>> +import itertools
>>> +from lark import Lark
>>> +
>>> +grammar = """
>>> +start: ( text | column_switch | row_switch )+
>>> +
>>> +column_switch: "{" text ["|" text]+ "}"
>>> +row_switch: "[" text ["|" text]+ "]"
>>> +text: /[^|{}\[\]]+/
>>>
>>> So I have no idea how this really works, of course, but does this mean that the `text` pattern cannot contain pipe symbols? I.e. that you cannot use pipes in the test template?
>>>
>>
>> Hmm. I didn't try. I hope lark is smart enough to keep pipes that are out of {} [] as is.. But of course, you can't hope that pipe inside {} or [] will work as bash-pipe.
> 
> Yep, sure.  It’s just that the `text` nonterminal symbol doesn’t look like it could match anything with a pipe in it.

Oops, right. To avoid it, we'll have to split text into "text_inside_brackets" and "text_outside_of_brackets".. As well, let's postpone this complication until we really need it.

> 
>> Same thing with other special symbols ("{}" and "[]"). I don't want to care about this too much now. This simple grammar works good for test template in patch 03. If we need something more, we can add a kind of special symbols escaping later.
> 
> But yes, if someone trips over this (i.e. we ourselves), we can still fix it then.
> 
> Hanna
> 


-- 
Best regards,
Vladimir

