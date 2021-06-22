Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4710C3B001B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:22:23 +0200 (CEST)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcbu-0003VY-3E
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvca0-0001md-RL; Tue, 22 Jun 2021 05:20:24 -0400
Received: from mail-eopbgr140104.outbound.protection.outlook.com
 ([40.107.14.104]:9201 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvcZy-00026r-Nq; Tue, 22 Jun 2021 05:20:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsnfSlEs+iVrTKsvna7f9Ya7RONad3GaoZe0t3dw9I/Jsg8qAWJRvR0J9W3uNI82c3gXKZMIkqaq14WgJmxPUMqvJBH5vK6JlQK9FreZJQNiyuew8pLLcimVdzqXjFBKaXj46lXBVdMTWh5xYz3CJFOuNiO4WqStqNMb+HUmiRUR7CGCDTSsscHoXWtYoWY8b+15M2pBDByip/xyJAnPaeHomnUI5X32l40oAWeszFtyhCY+8Lj2FaZbrvMo3X+4Ntjs7wyQByo3BgbmzZg5QBiis3GwmlsEzxl83TqogpNIvqinMFq839/gVyzlqeLYpzR32Lk0boQkvVX0M6vF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrJg7xceeBXfWykrBhAFC7LkpQwqPeDGcAoz2BfEx4U=;
 b=Ynn9u8uUA+327lXZ+Dij7GstjfOk35f30WNDgjpdthTR5/gXqcQYU9E9QRrGnI9jVcQj9dVmmatIgFhm2TbaU1Q94srmOFMIpEtp47CtuRa0R4umIVpldxUgH0clataMH/zRaCA6paRvmh0OwzWv1bYkSv2me6oethcTxXlIp6Lfvxr6dOpPsXK+UqmSHNN137PTPj/CT4utoq0yIn4ducYrJ3mtmJHECMIJ0BhQRfpaxAdoF6Pox24jyB2e5ettmMt0dSFiHLkhbrmp9yqq39I1eDQPgKrErHmq6tRbP3noJQSPWc4EtIwU7z2jlgOz2qmSlnbZzv4N9mOijMrhhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrJg7xceeBXfWykrBhAFC7LkpQwqPeDGcAoz2BfEx4U=;
 b=mLl6bSWas8YXGXqq9IbVjki8kbZJiGrZp6cFYBkqZdfluusDdc8Rkb/AFj7z5yvjJsTOMxYS8l7/nSZVvH9LSykXg3rFT+zX9sckW1ZNYuJkjjDPWPzY4ZT8bDSBDkHYKzBIBa97/6gHGZaDh/p1Yp0aJ/prw0ZjK5oi/GnpMN0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 09:20:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:20:18 +0000
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
 <3ac5e749-2a8b-e2d2-f1a2-04452b4277a0@virtuozzo.com>
 <554f05bf-4ecf-e00e-e50a-ff2450e74b00@virtuozzo.com>
 <7e0ac9f6-bb8d-ccdf-04ea-81d88cded4ff@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <abea7935-9419-c3ba-0edc-185f6134209c@virtuozzo.com>
Date: Tue, 22 Jun 2021 12:20:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7e0ac9f6-bb8d-ccdf-04ea-81d88cded4ff@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR08CA0077.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR08CA0077.eurprd08.prod.outlook.com (2603:10a6:7:2a::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 09:20:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6413d4fa-afa9-4851-2ab8-08d9355ef40a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-Microsoft-Antispam-PRVS: <AM6PR08MB44717285D0567A3DADD6A3F8C1099@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6f6+iwyakvaAqAdUQycrYYjwq4pWUkw4/2m9M3qeBTIES/UXYWQzTxw9KoudfMiu80mbQkxtfh9Y+Uyyq1iqkT8vgT7D4V+794b3VZ1rL7uSCZMCF2pJ+ix7tFLfqwp2n4UibAt4O2EKUm5L5a/EugslDyu46xenHyMLCRVQ3tvJJQhiIpGy5sTk2ILqo9PRu08bhbcTueRCe1R9FAl+FJz+GMiQnTyGuGt42dKiOTbyHeBbqCB7vkuK7afK7P0rHYP+ZK2CAom8RjZaBDQzKQqcVh6Hn1JBeJkq4cwd5OVF614t2C9lhw1kC91sUCqx1BoccXueoxcgzPKwvNDj1LaAp5y99NrjZ53sLMIkRa/zA27kPR5D2pjKRB+1ts5Ltl1EI+RbkMCVZdU5pragABbDQmkKJ8PPlrdJQRq/pJCsGmMYbXt5X6pDCzpN8Yli3vlxSknlPkzUedT/ulO2mlFORMu4nR8xXNynTy2/Tl6r+0kNo76UnJid15ln72bXXV0ZgJol31xDy9EQs49g4g98cyFXfLtImeJPEWLJmAPtKzn/hGSqIa1KqXH29fg/8g2Y2EtHbzuen9XCYjYuo76bbNLVfUUaeLQv1R2RAcsBEeQ49oAAaG15QrapZGOzq5MCjwccVlwofh7AE5v+UeAW1qP6SK3sA3Wa/ny6BVCGw3ThcKr3dh7ZgwC1Ba2zvvSDID8nb4DzKFl673SdP1ZJPM+A3daAHfr0mSK9cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(366004)(346002)(396003)(26005)(38100700002)(4326008)(16526019)(38350700002)(186003)(478600001)(316002)(53546011)(54906003)(16576012)(86362001)(83380400001)(6486002)(52116002)(66946007)(66556008)(2906002)(5660300002)(31686004)(8936002)(36756003)(956004)(8676002)(2616005)(66476007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWkydVFrMGx4LzFJTkRnY0w4QVBpV0tKTFl3dExlZVpkNlk1Tk94MU93T2Za?=
 =?utf-8?B?TEJWNU43WE1seFNNTC9QOU9YdlZxZHJiOU5NY1FBT3NVMHJBUE5SajVEYTRj?=
 =?utf-8?B?UUdrUXNCMjVuZnFTcmtScTcyNGxpL0JtaG0xc0xYMDJWNW1vTmxNY0I0UXJa?=
 =?utf-8?B?SmdZNm43cGM0Ris3eU9SQjEyckFlM3JLOHhUS2NGWlFUTndobXZLRmhnOVlB?=
 =?utf-8?B?anpWY3NZQzJuelg0bU1jYjhWOEpOMFFvYU5zUEFYNVFuV0RwSDhKUmc1cUg5?=
 =?utf-8?B?V0NFZktyRCtMMWdScU93TTFtTkEwUkN5OXpXSVlKdjJiSjJRYWd3c0RyQTJa?=
 =?utf-8?B?L1dYT2drRzhyckkwTFE4YXNNZDBvOUcyVzg4ZE9ybUZVa1kranVRTFhKNDA5?=
 =?utf-8?B?NjRnWE9jaHM4cGswYUpNNW0vOTltcDdheU8vazJJZ1ZDVkhlb1VlcUY5dWlh?=
 =?utf-8?B?N1dTQk5EUG96YjFGY3NuMmFIeWtWYVlkZy9XNTY2UXFhRzUrSDNxTHhvaGpi?=
 =?utf-8?B?L1lobWY3SVZQYllncGNsVUNRcS93TlhOdGtkbTFhVG9SNnE4RThObEk1VkU5?=
 =?utf-8?B?Zld2YUFYNm01YTRkUXJ5cWhRQ3VMbHBhRitPR1BjQ1U1WThmOFV5ZGhHOCta?=
 =?utf-8?B?c2dzQ2h6c0lGbjYyaG0xalNNWERISUlYV0s3YjJjV0JvOUtwQzBUY3lXdzIz?=
 =?utf-8?B?OUZxdDNrMW9Rb1VIOFZqZTNqcVI5T3NjWnRZNitBZ2FyWldNTG1PaldlRTNk?=
 =?utf-8?B?SEdld21mK0ZHbjdFSzc0WGNERWNMUFN0SXNRTkx0aWZteWtkbXdvSlNuSmlu?=
 =?utf-8?B?aWtHQkw5VzlRdzV0UVJjd0Y3YjAzb0Nnc2pvU3QyaTM1YnMyZnpXalcwbmdZ?=
 =?utf-8?B?VG5GRWVOYWhzVlhhbXF4WTlpcmozQTlkWlNXWHpyM3VhWmo3S0xkOTdaTlp5?=
 =?utf-8?B?VTI1d3MzTkN6Tjd0R0xvVjY1SWJ6Z0lFUUpiWHNMOFdKWHY1ZGJIbmU0QWRs?=
 =?utf-8?B?QVY3em1OOVR6RXlRUmo3ZFdpS0VxbDNVcGloVVVxWW1pUkNtSnRVOVowM0dG?=
 =?utf-8?B?Mkh3bWQ0YTk2VUVETXcrUVUxcWdTbWJFZjN3WDBHK2JRbmUxMEFEYVgyYzQ3?=
 =?utf-8?B?Ylc3T1A0d0JqMlMrU28xdkE5VXdyTjNOOFVDSTZXSDhmcVYyWFFkRDhTOFI3?=
 =?utf-8?B?aWJDUjV1YmxFcW9zalJDRFF5eER4ZWxld0Q3ODdKSEV1WTE4ZVc1M21KekU0?=
 =?utf-8?B?ZjdIMTlFZXBrSDdZUmRJUTM0V2luR2d2L1d5NGV5Vi9JK1B3T2ZvZzVRYTE2?=
 =?utf-8?B?a3VOK3p5TmJKbDBHRnpXZTR4UFluWUszbFhaV2lTdTFEUkR0UVNxVUFEeGov?=
 =?utf-8?B?ak9QUGhHSEs4ZUpqSkVqK0dQb0JDVjJSdFhzL2hoaUJNSElFN0psK29kZ1Jo?=
 =?utf-8?B?QWJPeUFoVC9USkpidTBDeFhTRDArakNZcHdCMlVpUkdqajdRQTZBMVBpSmxG?=
 =?utf-8?B?cFJZZCt5WjFQdWpPcmt2RHQ4KzRPRklEcGQ1b2xNczkvcG1heGtRTnJVYmlU?=
 =?utf-8?B?aVF0WnZYTkR6QXZYYTE3TXQrNTUxeFA4OEUwRTE5VWhqaEdXczhIWjBSalBT?=
 =?utf-8?B?QThkYlhTaUdMUENKclk5b2xIeklaNlpOZGNISjJZa1RZTEpWdXhvYUdnSVJj?=
 =?utf-8?B?VmNKZzZTa0hrZDZhVEpUbVNtUGQwSXZvTnRpWUsvRGRpNWNWU1IxQ1c4Vzl3?=
 =?utf-8?Q?a68L7bVg3KDZXtli3ebcR8X4cjCv0sDy+U94hbS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6413d4fa-afa9-4851-2ab8-08d9355ef40a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:20:18.7907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFFdakstuGu5BekcJr2uhYin5g4Nhg/jSKfKhVKTkL78gJQZFocO2vgKixNQCIcPp6eCRfaQTKJRLdEA3jlp6oOLV5caZrHye7PBfqF0ifM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.14.104;
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

21.06.2021 11:13, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 19/06/2021 20:31, Vladimir Sementsov-Ogievskiy wrote:
>> 19.06.2021 18:23, Vladimir Sementsov-Ogievskiy wrote:
>>>>   typedef struct BlockCopyTask {
>>>>       AioTask task;
>>>> +    /*
>>>> +     * IN parameters. Initialized in block_copy_task_create()
>>>> +     * and never changed.
>>>> +     */
>>>
>>> That's just not true for method field :(
>>
>> I think, we just need to document that @method is never accessed concurrently
>>
> Ok I got confused in the last patch. Method is read by block_copy_task_entry only after it is re-set in block_copy_dirty_clusters loop. Sorry for that.
> 
> Will leave it as IN and document it better.

IN/State/OUT doesn't really help IMHO. As most of fields of interest doesn't cleanly belong to any of the categories. Better documentation is good. If same variables share the same access documentation - make them a group.

> 
> Still, moving the lock granularity inside the while loop might not be too bad. Not sure though. At this point skip_unallocated can also be an atomic, even though I sense that you won't like that :)
> 

As I said in parallel email, We can't keep lock locked during block_status. So, make it atomic if it is convenient.


-- 
Best regards,
Vladimir

