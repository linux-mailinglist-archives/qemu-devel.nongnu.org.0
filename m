Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1A30A631
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:08:48 +0100 (CET)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6X4Z-0007qN-Hr
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6Wzx-0004zR-2x; Mon, 01 Feb 2021 06:04:01 -0500
Received: from mail-eopbgr00113.outbound.protection.outlook.com
 ([40.107.0.113]:57166 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6Wzt-0005Gq-SA; Mon, 01 Feb 2021 06:04:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+QWsJd/35sb1CUHyBZtHsc0f+XR7Vdf33jVGOryXPrP+jGokuOfreWkgOpFY89kMFDv12dSkM5yM6CnDPg2WtDz8fiGtYXOln0XB1807j7DwB5hgoYZH3Szvg35PLfiPRJ7h7cMgbQDo5aYkjcbVTBCfjif0Y1UK9nKfZa0awun4OpsWV4+R6Fd5KRWjVjCBW3m7Gdlp0XNH/ZVIr7E00NaN+tpC7msRYiUs/+m8tRELw1NUfNdiDvKuORjUwflr8bKq3VQTgwljUXQU0V4IghycGHmBAVM36Xi9803M/U+iCRgwhVq/qPsJ4Fn9JWNjlJWGYi4I8Dq5BkRroSCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKzYkAJymewj70ZnpuZOnOw1YjNkldIP1tbhyUici4E=;
 b=C+/pLuTdpZiBuLWJtTzp36w2LAfkWmbgS9hjWh0OrFc2jQkJDkP7SEgU+btco1fm4hNgZ3cVT0zRSwid8C4gKeDtYMQFF/Av1RkIQtlHiCjR/yGOV3ePeTXoHBZdFV3XMPseSyn+AxC7154qji3XODAfJAuDltTZ5Ujt9dD1O2eZqNx/psJlbIc2HKgTIEasPDF9nL+59rpBEuWHaVi0saX76lfm0R72W9a0Ku+EY/mQs4ZDDxZxMJG52zmR7GItVbX2ZeSqDbuMvUW92cgujOleGbLb98knXkKidVJEjp63EyN+J7bSQ5PryHMxk3SnbE900Tet7IYaAuRxDdU1vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKzYkAJymewj70ZnpuZOnOw1YjNkldIP1tbhyUici4E=;
 b=PmKLLh65XnOrtnVYJyXfeRJiIgVtNG2Aoo1/p+GPSOydnEcX/IqV4EEyY2iQRcb5q7mr6ufHgmYWuelOLL9syWf3XOPTHx4kvF2Itz9sTol2em6ei6nM4AE8B818RVrIvMtyuwRa7e1JtHvzBCVEopiJ4fhxjVcOmfKGoDFHm2c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Mon, 1 Feb
 2021 11:03:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 11:03:53 +0000
Subject: Re: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block
 Jobs
To: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210128144144.27617-1-vsementsov@virtuozzo.com>
 <878s8d85dz.fsf@dusky.pond.sub.org>
 <2651677f-aa5e-1937-0fb6-767c080fccdc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <094df33d-f944-7a68-c0b4-a7c509287a6b@virtuozzo.com>
Date: Mon, 1 Feb 2021 14:03:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <2651677f-aa5e-1937-0fb6-767c080fccdc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM0PR01CA0118.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.160) by
 AM0PR01CA0118.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Mon, 1 Feb 2021 11:03:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5541c600-3faf-4647-20cf-08d8c6a10fe3
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1650676733391EC819741CFEC1B69@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QcGM8z3K8t8hu0H1QzvN/mRBYSEBn2Ud+Y80uIFytSTG7YMwixWDKcWT9Y0HNxMppJyUwjgYIA2ZX0oHPOOTqMv5EwF3Eu5qnEDpCsC4ewH+UkbxbODDpMpsf3+8bavEJ6SFFFdlRCzBzTeRU7NyCz8/I2ojbNyeOSxjyJYxQU6YIqbTncXfb9AM0kRhqfLuCUgW5jL8HTz6VCsTr2pdD/KXcALKKKuHRKFPL7vO3upMWjdONGPD4qOmPXv6Y7Vs8k3vIlVVGht/lNwF5saRPsMjF0Jrvz9OO+prVkAyklK6CSp7yLivNB1P4QoKEd5k/CMSA+Wq4dLURMfVHeia8JsOIIEoucEBJWrKeCD7CWLddKHW1JeC74/xzDYNW7R6AoAhZ0xw1gi/H8NOnVn2XWAC3V+Yr1wwwuei5ebej9B+EJKNnluGneScxs1kRL30b5uhpOHqwwtY1QqgW0ACaya44hkTD4kV1VHNleJ2DVIzabH9QBLP+5r9mSsaOzAZ9svUNH+IDtMv6+Spsdz+mdRbpMjjnM3kbXuFD1grT9otahPOkCgcMj17Kd8ZYZiY3sahB5FPyJNn/wTlJpzuFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(186003)(16526019)(956004)(2616005)(110136005)(4326008)(86362001)(8936002)(66476007)(16576012)(66946007)(66556008)(31696002)(31686004)(5660300002)(83380400001)(36756003)(498600001)(6486002)(26005)(53546011)(2906002)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TXBIUjJ3UGhoajNHODIyN0YzeXA2NlJ1cE4vdkxZN3gwYTJQM2tyVUxqNm0y?=
 =?utf-8?B?RC9KcytNWTlqQzBLNHBHc0YwQU5lZjBJVHlHdGl1Q2UzVG8vSjRkdTNmbDAw?=
 =?utf-8?B?L1ZPQW1Wa0kvbkhkdFRWcXBQc3V3cysxaFBMR05ERENBYk1KQ3hqUnEvbzBJ?=
 =?utf-8?B?Ti83Y3FmN2VvR2FaU2pnWUZWZGdDbzNYNGxwQ1I4Tmpxcm9Bak5odUljZHl4?=
 =?utf-8?B?QkVyek9YV0dtbFQ5VDREK0tER0tYSFk1akN4RXZpTm9aN2cyY1pyMW0vRHNF?=
 =?utf-8?B?YURzYmlxNkc4aHg0RktuUnRiZ0RIVnNDOS9LRmdwS0pWOWFhNkdWYzVUUVdC?=
 =?utf-8?B?TURnWTd6Vkg4c3R2SHM1TmxjOC9Ed3BaSTh4TERoOXZxYVRvWE5COWNZZXFO?=
 =?utf-8?B?a2lYc1NjaWJRUTgxd2pSeVVqbDRHaHJwaXphLzFacjRndE10K2R6cW5zWCsv?=
 =?utf-8?B?NVM4S0c1YkIxeG1xYTV6UEJWVnBXTjhZRGdvalNiWGRQR3RMVEZxTnJFT08w?=
 =?utf-8?B?bXVnRUUzUm1OU3BxS0x6em9OSWViRVdZdjVldFVWamI0QmtyZnZRNlJ5Y3Jo?=
 =?utf-8?B?WDFnUlduZFhCM1FJRzRoRDhkc284bXVyN1pFMGZldURXQkJRTWtwd1ZQTWM1?=
 =?utf-8?B?blhrSndpVzFTVFFwYWNuUnJ5emIvQ1Y5RTZPQ1pqQXhGaWlCVGptYjRYSVlJ?=
 =?utf-8?B?U05xOW1ZSmdTT3BQQk1vUDlZVFpBUzllcjZEWlJpbU1ncnJqSUJiMi9oUlY2?=
 =?utf-8?B?c1daSGpWZ1JnSjY1N09ka3BLalI3Z2lDWkRacTI0Ni9lb3VRRVI0S0lhNXNu?=
 =?utf-8?B?cWlBb0dnMzRqK0NmRU96OGdEWUYvQWwvaDExaE5sZnBaUGRDT2JyNHQ1cjNj?=
 =?utf-8?B?ZmJYK2VxVzE3bzNybGJySGtVM0pudnBWeTVtMnhkbWtkS3V6VUVXYkF6Ni9q?=
 =?utf-8?B?eVh4OE1iUXVjOWNldUczcnZvQlkvM1R4Si9wZlovSy91bm5UYnY5VDFQZ09q?=
 =?utf-8?B?VVVWZFdFbUt6MmxJSllRMnNuaXhITWpzTWh5K0ZkcndPR1M4T0VpblprVkU4?=
 =?utf-8?B?aCsxSlU2SlhRQkl3UGhNY1VRK3FvZHZVQy95TFJOeU1TMjV6MnBGSy82djVM?=
 =?utf-8?B?dDV1eTdOUEUzR3pRRlptNFFhTHgwMVg5SGZFQjdzdFpUcmJxNk4rYjFsVExP?=
 =?utf-8?B?c1pZWlVZU2lEY1VwaU5GeWM5bGpFZ21VT3YvQkZRaWhlL0pidWhFNDNDSHhx?=
 =?utf-8?B?ZHE2azEzbS9lTGx1NzdwMmh5bmhvbkt0Y3M1alh5Z1paSE9jODh4MTFKeFo2?=
 =?utf-8?B?SGhsZ1doWi93Y0dVeTAydDh4a29sQm1WRjBJTXIvN282eXNWTi92dGxEbVAv?=
 =?utf-8?B?a0RKNDdQT1Z5Zi9reHFidFpkemk1a0s4aUlURGs4eC9MKytOdzcwcHBhZTBS?=
 =?utf-8?Q?dfOe8F+R?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5541c600-3faf-4647-20cf-08d8c6a10fe3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 11:03:53.2906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMKeL8S216Cw9pNUQuzy+RohQIvod+5Pmgv1Vk/5Su6K4NtOL4isTdt1A9TV+S2ZPezpDMfubaWbA+RwmJmyy5uUZQ0ccLUG/brf4/Y9zPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.0.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 18:28, John Snow wrote:
> On 1/28/21 10:09 AM, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>
>>> I'm developing Qemu backup for several years, and finally new backup
>>> architecture, including block-copy generic engine and backup-top filter
>>> landed upstream, great thanks to reviewers and especially to
>>> Max Reitz!
>>>
>>> I also have plans of moving other block-jobs onto block-copy, so that
>>> we finally have one generic block copying path, fast and well-formed.
>>>
>>> So, now I suggest to bring all parts of backup architecture into
>>> "Block Jobs" subsystem (actually, aio_task is shared with qcow2 and
>>> qemu-co-shared-resource can be reused somewhere else, but I'd keep an
>>> eye on them in context of block-jobs) and add myself as co-maintainer.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> With pleasure:
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
> 
> Absolutely! Glad to see it.
> 
> Reviewed-by: John Snow <jsnow@redhat.com>
> 

[..]

> Great!
>
> Reviewed-by: Max Reitz <mreitz@redhat.com>


Thanks!

Could someone pull it?

I don't have any signed PGP key for now, to send pull requests :\  Interesting, could I get one while sitting in Moscow?


-- 
Best regards,
Vladimir

