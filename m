Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA84479B81
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 16:06:33 +0100 (CET)
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mybI8-0000lP-Df
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 10:06:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mybGc-000850-3C; Sat, 18 Dec 2021 10:04:58 -0500
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131]:13315 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mybGZ-0002by-Jx; Sat, 18 Dec 2021 10:04:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0QNFIcipv6ojgMKo7MqEZq6IuvkaRtSAB3eVy7BpKMF1suFlRcs6ZJc4IbgM9pVffgQVMNFy6amLa9gWFj9w7z29WhRNRBx1x/UTI9QpRWoFR12PeBfx/RjptGGu73M7dE6CXX9JSpcQDKD5qJ3tJE02H/ZdEuZfYs6Mb4SQPOxjrkJDlDOZNVDntNCQOxNYkz+BDB1KAhjU59Uk5xFS7ziT0sq0ADrM93xWT4JISkuHCkxABhweKFSXJAZkbd+25XbNPvlp0yIewXWP7DaxPvLEObToPOe1Y0B7U+pjzMGp6B8MvXCpYRcf6MF2TOtVoJSQhTEjJOqrjxCVAQ5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVwNc+OsJOGpYZAduJ8bXGKob8SCrblfuakEiBWQJOE=;
 b=btB0zR8bOTcXURfjzpBhnCC2mMee+OAXyYkb2LaGnbn6jVernjvsoMiiK0Pkr5VddtQKooVpuasLGbqLRQ2n96NlkXhKtaZoTK1x0u0scG6XUlSTQYWejCJ7F2zMEKzK4qO3HFuhskZsdDvjF/3ZQY9wj5PUKG3OJzjw8Eu2j6lNw9JA92dM+4GfPCwLm6gB+r0UXciGdEe2743vDepj5gFf8tNjno8FYwxNFDxcnv6bqrwD8PUHyf4Qv4grFRJdOkKWyYg6fODZW7KSXmMUBEZClIXoHoYwb4jfjDdxahpIZ700N7w+JdPcZmQuPpNLl7pKFExOqZgkxpNZlw2KXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVwNc+OsJOGpYZAduJ8bXGKob8SCrblfuakEiBWQJOE=;
 b=MC9QtiXs83R3JCuz3CHOsruwhJWKW9rcDAjQPQ9d3gW9hfuQJ0HMLARrSUvZ+IDmEHVrqWWqXH7O7n1PLZEl2/x/KNC4Yspmv3iS0I9xyAVPzCtp2LalkBphNeO1T3hn9tz7jiX86kx/TpDJOxBFPDun6TfJYBcl8cSZ1tx/O1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3090.eurprd08.prod.outlook.com (2603:10a6:208:56::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Sat, 18 Dec
 2021 15:04:41 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Sat, 18 Dec 2021
 15:04:41 +0000
Message-ID: <b09f71c9-10a3-0b4c-44a5-69392224cc6b@virtuozzo.com>
Date: Sat, 18 Dec 2021 18:04:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] block: drop BLK_PERM_GRAPH_MOD
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, crosa@redhat.com,
 ehabkost@redhat.com, armbru@redhat.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com
References: <20210902093754.2352-1-vsementsov@virtuozzo.com>
 <20210903184726.rsz35o4jz6bzddbi@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20210903184726.rsz35o4jz6bzddbi@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 18 Dec 2021 15:04:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e9d2e80-a960-4d70-13de-08d9c237b79c
X-MS-TrafficTypeDiagnostic: AM0PR08MB3090:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3090D5C89BC24D5E2A6416A7C1799@AM0PR08MB3090.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUqug2cN0V6l/eYGUIdFSeMVahZs/zMxUnZ8nB5gUJ9ST5rUdhS2DiYbAliV+hdGLbwJW2F3sWJNjLmQPqLvob+mqb5iHGzZSYsdzNYPufsnT+kst7biXdQt9g6NJR2gqz1ueLOgfOfvCbJ29F4Bex7dI/wCapt/cCe8APtvDIxcW/ALKOEvbaT5Mai9JYQeTbRISPq7/259gchmUxkMJND36Tf8+vp2YHSeKxmvcQ5bSHjHWd+v3F65izTLFxJQfvTI/bFKxXaUPnQNr9Hxv4hr/9mEhsg4aAqrTjpUy9fzxUH17HOzmjUpWXlXsgNlRxaLyCez19mZXMlbSbEIprrvK2FCUh/wzcekQXZgxOUzGqS2qHrNZE1M7QQDnr+hdCOl9vUT6wXe414cqDq4irMxBbC7ljNHxs973vw0A26kbkaQk252FXkAhQXwpGkaUfTPqJWL1hZTKq11LDMP12xTk3/8zJgWgfHvdehGzbBtcLUZbjnmHB4sOAIOxzz6SNhyx3PSGzX0BTdGjFZVa9rLh8DPD5J/Nrwm5OEyDg9BrSpYfr+AzEJtAILnSms5gXJU5pfmXZnlzyJpOjbwnqnJWl7gr5pHvoZtR+ZLlsuGwTZWozn2LD7somVJYuFy7doF1KQAbrU70DsRgT9CGC50I5lIsAZf49/fsGbVNygwAsxStjqso7Y2WaNZTICc8BkkrDbeE2IJl5e0wKm/bxPhDPUwruBjwiE/0H0Kku8oCa7cDNslJuqYhlwocsCa1sqgCQLjRDi84PjOeVtCVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(38100700002)(26005)(31686004)(38350700002)(52116002)(956004)(2616005)(66946007)(66476007)(66556008)(6486002)(83380400001)(16576012)(316002)(5660300002)(6916009)(508600001)(4326008)(186003)(86362001)(8936002)(31696002)(36756003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW5Ya2RJa3FMSldQWTgxb1prT2VicU92dWhwQWNjQVdBV2JnSndCS3VCZFA3?=
 =?utf-8?B?WTk5U1JMWm05WERYL2NHVGdaMUtyVDhvSS9yNGE4VGxoVTFoTTQ2MVhPKzJE?=
 =?utf-8?B?d1l4aTFiWm15QjN5NURrczFxcWRzL2tqVzF4NTVWYm9kRlRuS0k1TXRjSW5U?=
 =?utf-8?B?VG9INkhSOFREcTNURVFFbFB2N1RQaXhFNXV2b0pURUdaRk9ENm9HOG1FSTQ1?=
 =?utf-8?B?eTFPbVV6K3ZxVytLMFFuUU5KSkV4ZnQxdjdZckhpU3ltUDlVNjdNVlduWHNl?=
 =?utf-8?B?YU5oTHZQVXRWUENSL1prbUVpcEhsVkx6OW0xWGlna09xb0RJbWpiamZoNVYz?=
 =?utf-8?B?ZHJpTEZrZkhDdVJlUTUxazFubWZVejJuZ1JZVTFYQUpxcEVwL2VWK3VTSEQ0?=
 =?utf-8?B?WVlMd1dUNERlT3V4MzlkcUJJTDEvM0NWK00vNHBwT3VmTDB0YVlOajB4dW0w?=
 =?utf-8?B?ckszVlEwa0kvUjZYU1JwYlREWkc3MkNHMGI1MGlkMVl0UThpaVdCWXJ2eXls?=
 =?utf-8?B?Ui9tSm1xWFZLQ0E1K1dqZnQxOVJkOGdPNEVNdW9abkkwS05uWWtTNnB2MmZO?=
 =?utf-8?B?UnFIT2V5NlhzMHZOU25iV1FsbUtCdlU4YTF4czZmUTBTZVN1eGFhRm1RQ05n?=
 =?utf-8?B?SXNCZ2ExRm4vM2V4THIrdDV5MC9zM3pvYkJ5c0dva1psN21xS0hyTHFNK0Rv?=
 =?utf-8?B?WTFNU0laUUxsY25EQjhmNU5ERWpMaURRMmxmRkFTQ2E1WjZYamhRVFFoaEpQ?=
 =?utf-8?B?c1Z1enh2VWRxaG42ZXRsS1lsNzJVQ1FTeUF1cVJhQ295U2tSb2hIa2VFOHRY?=
 =?utf-8?B?RG1vaG9SRDloWmYyUkJSUi9Jb05ROGFjUjVZZzROd25zdUlwTFhSQlJtcjVM?=
 =?utf-8?B?YWtudG9BV1Jxd0ZsMjZLalkyYjVLRTJ1bzQxcDVRQVFCSUJua3kvRnd5Q3dl?=
 =?utf-8?B?NERRM2NLNWxUMTlrSEREVE9Cb2RSYUo5WFFibG9jOGV3L3RKZ2wrMG9NSWdX?=
 =?utf-8?B?NXlWMTZreGZwWEpXeUVFRnlXK3Q3MmRzWHJPQS93cWFoVzlPM0pwWVowd21h?=
 =?utf-8?B?SUJ3bmdjakUybTVsZWlnUVJhZFpXenVkNkY2ejd4WW9PTHZLT3E0U21VVDNB?=
 =?utf-8?B?TzJyaTczYnhtQVBveHpBaEZMRzdKTkM5ZzBTUEpsTVdPcURtUUM0WEE1WWF6?=
 =?utf-8?B?c2lvcFpsNVV6c0JHcWNrbGgzNXpxYmsyTmM4eWlSNGZ3MjgwTGxEV3dNbytJ?=
 =?utf-8?B?MXEzbzFxVHNsRDM2Z3NaWUJydzhmQ3dpYjlBd1RJRGEzK3pIb2lsd3ozcjRv?=
 =?utf-8?B?eEtGSDY5Ny9wOWJIS0liQ3pac3k2emZXb1kvanYyRnpwWVZMbHhlYzUwakYy?=
 =?utf-8?B?QmNnWTV6Rm9nQWNsYVQ1MTJhN1RrVTlDZWlDd0lFWUk0RGk0T1BuZmVCb3hH?=
 =?utf-8?B?UTlYWEZJWkNWZ1I5QmRwZGRsM0pQTGNlKzFQa0VPcWdLZkRnVlV4ZXNEVzBz?=
 =?utf-8?B?ODJHN0pIUUVCNGNVOCtPcGNEakpCS0lBcFRndnZZV3ZEbVhKU0k1anlKaStW?=
 =?utf-8?B?VGk2a0MvRkg4eTdWMGdveTJBczRZZ1NPNld6M2xGZkV4OFlQWUpDQm1rSkZj?=
 =?utf-8?B?K2VtRStTOVlXUjJSbUU3OVBqQkU0OUEzeXozRzd0MXdITnFGdDBiTFNEZk8z?=
 =?utf-8?B?eURka09xVkZKazJQNHJ5L09mcXVVVnQxYVBwMnROOHpzVGRZMVZIOFBnR3I4?=
 =?utf-8?B?SStoeWIrKzR6VWQzblVTN1ozeDk2Q0paOHZoV3BEUEtncHJiSzVYa1RFNHl1?=
 =?utf-8?B?RW1TYm40bjZmaE9ETWk5VlNkcGR6dUFJN3NjUmYwMjhERHZ4ZDVkREVrcTNX?=
 =?utf-8?B?enJ3b1BCbXV2Rk1YUWwrQnZWUFdVUnE5Ty9HOW9sNjVyeTV2b2x0QnMvdmkz?=
 =?utf-8?B?elZjeFVWcGhETm4xeHN3YVljb1lwTnVDWGJFOHluaEczL21iam9GeDFtcUhx?=
 =?utf-8?B?bUlQYVh6SHpicXI5RGphTG5zRXNES0Q3S29CRXBxK2JKVkZHdTcyV1dUMFpM?=
 =?utf-8?B?TWVmU2xXUnVlY2tTenQzVTg3UUpRTnpxQTdkZjZLMHFsNkZ1VXpRYjZxcTBT?=
 =?utf-8?B?cjdKVWdtS2NSNDRHa1ZOSnN0Z3lteGFSMFBuTWFTeklsMFk0MTlWNnJDVnJE?=
 =?utf-8?B?MXR2Y0oxbUp3MjBVSEFlQ3pBMG1TK01Ka3o2M2t0d2FzcEhtNWpsSHNET3hw?=
 =?utf-8?Q?NNv76kcMbjev5LiKU1JjQlbbtM/yt+6Cx/1uRBdiQo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9d2e80-a960-4d70-13de-08d9c237b79c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 15:04:41.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pKyubqOLsYjKH+EbVWOngg3zXptzH1CxqFCXqq7sglCC87nbISNzU3scX9p/KF7EkKnlx6MEEz5U6dBFEgcHbYjvRlQGExdY9yBNHTXO1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3090
Received-SPF: pass client-ip=40.107.8.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Ping)

03.09.2021 21:47, Eric Blake wrote:
> On Thu, Sep 02, 2021 at 12:37:54PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> First, this permission never protected a node from being changed, as
>> generic child-replacing functions don't check it.
>>
>> Second, it's a strange thing: it presents a permission of parent node

[..]

>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 06674c25c9..6fa2c4ab82 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -1825,14 +1825,11 @@
>>   #
>>   # @resize: This permission is required to change the size of a block node.
>>   #
>> -# @graph-mod: This permission is required to change the node that this
>> -#             BdrvChild points to.
>> -#
> 
> Do we need to mention that graph-mod was removed in 6.2?

This structure is used only for debugging purposes, I don't think it worth mentioning.

> 
>>   # Since: 4.0
>>   ##
>>   { 'enum': 'BlockPermission',
>> -  'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize',
>> -            'graph-mod' ] }
>> +  'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize' ] }
>> +
>>   ##
>>   # @XDbgBlockGraphEdge:
>>   #
> 
> Otherwise the patch makes sense to me, but I'd rather that Kevin chime in.
> 


-- 
Best regards,
Vladimir

