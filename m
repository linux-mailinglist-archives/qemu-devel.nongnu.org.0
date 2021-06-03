Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1333C39A0C9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:27:23 +0200 (CEST)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomRW-0004Zx-3B
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lomPv-0003CX-3p; Thu, 03 Jun 2021 08:25:43 -0400
Received: from mail-eopbgr80108.outbound.protection.outlook.com
 ([40.107.8.108]:60768 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lomPq-00019s-KO; Thu, 03 Jun 2021 08:25:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDTjv4elFmT0uDvenf/XFZbeRxezM9yTpRD8Z1sqWtg0dlGtaTrAKVu/ROekWWK5qC65nDsYYe99VDuf9hbbhe9++4A9h1gXu36/9UhP8TlAjqEDbXu5AZOCvV+pBYklw6abY6N3dPIZTrWwT4sW6QTWWEanE2HQ3G7Ud8mAIaBEcue5Sd7tohxhB9YkPVnlqNFiw+FcMuTSUNRcMGEP2s1c3lQ9RciwtP4I+UTQ/iG0X+6Ti5CuxE0bhnEtNoNjzxYkL2yFghGVo33TAIjwTVwp+i0iVKvgjOu7z4TXquWDXPZz9vRY0gfRIhBJcqDmr7c9Nq3ep4Nvblo2VT0p0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND9X1WU408zV4h2aLRdLVorfD+YcUhVB73tDvzz99O8=;
 b=YI+HVBDm+1VAHezOl3He6XsSN0rmE6kDnl4Vlj8SKDzHtEKuV17hv0BwSJedAX52qM5T0xhJxmCRs5DkKOfWErkw7nfilRsdNPfUS/dZAgEdHYbjyFf/nXg9gcmDSONAJkTiLDXOI61v26kkxmaNoj8rJ6C91P3W31ISMKlBoSWV5LumD2Jk0PyAHa62vz4wjufJZm8sPzQEONL/bqSvJouQLjoSr2jHDuWAoFqUstzJgbcsVWg9xy6uoN66JgV8Na1RiSkBfBLSteeeLtMZW0y0Ncz98BEK4490MRxgiD/GYheIdcbl0uEC6UGpWRXRD8OJSRhe3ZgSq3kfCwkqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND9X1WU408zV4h2aLRdLVorfD+YcUhVB73tDvzz99O8=;
 b=qIGLfX7Dj4UPfmDGDllF6MXzLmooHkBcpk2FRqMWqESwa6RPQMRNfOQz6/XGo4P9MdtHzToYmeBDmL1QFQbPLQ12pxy0Ash4u8A0P9LXegJ28j1WWzxr8FHUbnFz3LEVBO7YICpvNYiD/FTP+16Ur36Wr2eoTdfHjdvy+laTBLg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 12:25:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 12:25:35 +0000
Subject: Re: [PATCH v4 05/15] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-6-eesposit@redhat.com>
 <5bde3128-e972-3653-308b-4faa4eb52bb6@virtuozzo.com>
 <bbf2c63d-662b-541e-6a65-1419f650e066@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1570614c-7c0e-694e-b5fd-d7814da88964@virtuozzo.com>
Date: Thu, 3 Jun 2021 15:25:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <bbf2c63d-662b-541e-6a65-1419f650e066@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.243]
X-ClientProxiedBy: AM3PR07CA0112.eurprd07.prod.outlook.com
 (2603:10a6:207:7::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.243) by
 AM3PR07CA0112.eurprd07.prod.outlook.com (2603:10a6:207:7::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Thu, 3 Jun 2021 12:25:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d27053-00f5-415c-5a6c-08d9268aafe2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-Microsoft-Antispam-PRVS: <AS8PR08MB611913E3BD5E90D844D8B39FC13C9@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxJ8qlIyxYf+8m10oZVbXNmUhDFGUbZD89q4UWd3JDZGiwavCVYwr7Cad+UL1KTB1Ncj5uKtAJSsgSfogsIIKZhVIcoZYP5bJKcudBscQIs6DYg9Xxpz2s7NyJ4JN4Si9EsWhQoSMzQp9UYyARe11+Df9YgvSt3VPN4bL+uj8UIUXvFxBT+A+D48Yrnnqc9Y9gxp1BALngmyoq6J6g+PNQBO+5rpule1e0CwMbqlKcN8y4b/8GdV+Qbz1TEW16D2PCfIi00fzBjIdCk2wKrV8w6bECZ6aqnzb4bjvCAteNyD7M1hP7xZEPSTwCiqzgtGMz+xZ0xP/Q+9SOdzHTpCnMS3I76N3T4uzRf2Pg6Nf478I8GgBF+gCLd178EBSvhsFghLTRTy9T7x2BoUSy8btr+7qtZXRS0H7/5WczjO33V+38ENABbm9DYtIbnTebm1+U+YMwmGQyKkofoIG8KzWCXCblbuntDHcdrMN2QAXjoqmLVGj3bCUK7/nVNScH3pj4+YUOyxVT/ilWAoNimxJqrniCy8YLXqAVX586A7Nry0HKa8ItxAKxOuIPg9a3U8v53uVEhGJjrAEUT8NTkOjlcyfOtVKXLM+lQTkmneOB+PA/hrI4GK+8XMYodHGDxNlDj0xbd1HeqmKLc8Oethurs6F5joUXrGJuSODzeqn1vl6uYP9zx16rlPDtZ/Gc+TiiZZxz3AAbq7R0/LzBFWxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39840400004)(376002)(4326008)(2906002)(478600001)(31686004)(36756003)(31696002)(86362001)(38350700002)(38100700002)(316002)(66946007)(16526019)(5660300002)(2616005)(66556008)(66476007)(52116002)(26005)(54906003)(186003)(16576012)(956004)(8676002)(6486002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TVdMV1orV1RMeU94L1dMTlhKWklGS090akpTQ013eWkrT2JWYzJrcWxDSVRL?=
 =?utf-8?B?RXR4Z1g1NmZEbHdrSW5lMlM1dGh3MWtDa3VkME5RdFlHUTBiSmRzazNHVVhw?=
 =?utf-8?B?S3VhZUpIMTBteGJrekNDdkxWdXMvTjZRRE4zSjh1N09hNVNmRkxoTU50TGdK?=
 =?utf-8?B?Ni9peDQ0b0JCTXdIWnBZSDd6Z2M2K21CMlIvZjZFZHA3d2Y5S0VwS0F2bkVi?=
 =?utf-8?B?Ym42UFY4aVpBZEMxM2xPTmdYM0V3cUdmMUxGSHpnK0thdXJSOE5MRlpZOFVq?=
 =?utf-8?B?Tk1DRTlES0czZUs1VGRvUW5idUIrek5JUEdOQU9hV2NqRmRtY29TNHlXNkcy?=
 =?utf-8?B?Z2loV2txZVRUVFVTRHJJanpXMVBmenR4b1lqWXFkUmFuN3Y4U3lYclROTWtO?=
 =?utf-8?B?S3lZVHZBQTlvVVlaTVhTeElXWHdrV1BGNS8wVmU1RmZta0JVUGl0NGtzek1u?=
 =?utf-8?B?YndmbktnSHF3QmQ2UWVZKzR5RXBDeU11WmR1NDVIUisvNFh0Ui9VWVBMTitt?=
 =?utf-8?B?RW1LbkNraGJmd05rRkhmVHFERFA5bnBGTkRMU250NDlWNC9MUzZiVWllUFhD?=
 =?utf-8?B?V1ZWb1FCdUh4V0QycHpVekI0cTA3R1pHR3FtK1VuNzJVYUc2cXdPWWlKMGxR?=
 =?utf-8?B?SnpoaHBDK3Yydytub05VOTIyNGpWcnN4bDNDbnBYNUVJc25ZNzlOMkVrSC9G?=
 =?utf-8?B?eTR4Y0dLTHNmWmx3WkpuZzhNUkFEWVF6NmdhazFxZzNLMUM2c2tRT0d4VEhv?=
 =?utf-8?B?OXV0N080a093ZUUrRTgxc0wrS2NyM2VDU2FWYkdqcUdQTENEcXh4OWc3K3I0?=
 =?utf-8?B?K0RIQ3Q4KzNhUGg0ckFFdGlVZVd3RU9oNlBrY1RuOHYzQ3pwVTZLR2pXMTJO?=
 =?utf-8?B?T3B4RHVoY3JrVDZjK3l2RWxJaXlPWkdjZ2hXUVRPRWUvQWIrc2RZa1lVaE54?=
 =?utf-8?B?UitNK1cxZ0V5bzRFL0Q5TDhVMTZaZ2hVYmFrSTk1dVRVb05SZnYvTzJuM2Vv?=
 =?utf-8?B?aUt1dzJsTFl0Vk1ta3pHWGNiN0hJQ1UyeWhsRlVWRFFPSWREWXArVDRmeWVh?=
 =?utf-8?B?QlN2R0VHdHdHMjE1WU1PRm9YU3ZGeTdTSkFERnMrNFdWVzl6Y3NhRDFBVmxw?=
 =?utf-8?B?emYzaCtaWnRKOGx5YWp4YlR6ZUpNRDVnRjdURXlGdllVUEhUaWxQU0lXeDdM?=
 =?utf-8?B?eG9IZHlCTUxpRzRrQ1JpVjJiSGZhdUxhNytoNzNHbnU1bTViTU1MYkJjcTNS?=
 =?utf-8?B?YzlWVmxLK1MyaVZvOWpBRnM2VmZ3eDYxeVFRbUdjWXZxRmhqOVlGSlBkNnBU?=
 =?utf-8?B?QjMrY1RlaGJlSlY2QnVNYTNYMm9CS1VxYVJ4WEhoVGZBVW5JeU5nZEpVYjFE?=
 =?utf-8?B?diswUU55NUdWL1VUVUVvMjRMZ3BNQUVseUF6dHJuRnpwZXI5Mml4Q0tueWZ1?=
 =?utf-8?B?RkJpbTBaL1ZmdUpDazh2NDZVVWNzT1hRZkFnOG9iZzJmLzBWaVhZNUJaNzNh?=
 =?utf-8?B?N0xJaVJuWG0zK0RkbGIremoyWkoxblIvMGRjYmx0eGRBVkV3cTFMbXgxbUlU?=
 =?utf-8?B?ejQ1SDUzakNYM0hrVlFqSjdXMFBLbUFsZHZqWkd2NWZiMXoreGR4WmxVeitk?=
 =?utf-8?B?Ym1TUHp5N1ZYRm5rK3dNaG0xdUhQa2p0cG1SNUxBdDJNck80MFBnT1RLa1FG?=
 =?utf-8?B?R1Q2WWJYeS93ZElMbWlWcm1Sd3B1Wko5WE9OMG9HajlpMW8zR1dOanBLWS9X?=
 =?utf-8?Q?BsRdxHMQDNqKXMdaQaaSXdAHdnMcHNI+xCahlG+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d27053-00f5-415c-5a6c-08d9268aafe2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 12:25:34.9109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSlewiWsitQNQYjg8OPNvBhKYjQ421rRwPccKOCrW3ccjRWDpKwhmf3YecOi/+dbty2DqYfVEl6bmcqRacWeU74Bb0SB/++97MyzE9tuqVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.8.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.06.2021 14:03, Emanuele Giuseppe Esposito wrote:
> 
>>
>> So, you just make the class do nothing.. I'd prefer something like this:
>>
>> @contextmanager
>> def NoTimeout:
>>     yield
>>
>> if qemu_gdb:
>>    Timeout = NoTimeout
> 
> I am not sure I understand what you want to do here.
> I have a basic understanding of @contextmanager, but can you explain more what you want to do?

With qemu_gdb you make the class do absolutely nothing. So, it's just provides an interface of context manager, but does nothing.

>> @contextmanager
>> def NoTimeout:
>>     yield

is the same thing: it's context manager, so you can do

with NoTimeout():
   ....

but that context manager does absolutely nothing.


@contextmanager gives you a simple way to create a context manager. You define a function which has yield point. So, everything before yield is  __enter__, everything after yield is __exit__. And you can return a value by yield, it will be a return value of __enter__.


So, what I meant: keep Timeout class as is and just add code that I suggested after it.


> 
> Alternatively, I send the patch as-is, and then you can send this change.

OK for me.

> 
> Thank you,
> Emanuele
> 
>>
>>
>> anyway:
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
> 


-- 
Best regards,
Vladimir

