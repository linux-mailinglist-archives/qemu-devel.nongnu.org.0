Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883E2FF13E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:01:23 +0100 (CET)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dKj-0004qA-Or
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2dHW-0004H9-O0; Thu, 21 Jan 2021 11:58:02 -0500
Received: from mail-eopbgr130130.outbound.protection.outlook.com
 ([40.107.13.130]:15169 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2dHS-0006ec-Qj; Thu, 21 Jan 2021 11:58:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHFcwrFOuIDAhcYW6Ab/TEewZYmI96X7uvDM3M2NS8AOT9PpMZtRThqisSJdFa6CM+EmLPFwPYUZ7fQY4LwTZdpmVOqjvm7tIi08ek+YxZWEi6+Ab/m4Hnvo4HnrCFDs//FUzRtBzdaz6+HEErrP+kN3Mt8FJci9j0RxCqbHWxUwU4iG7CHwFeGhbKuvbGIaSppmu/RR5K2UAWuO0yJKCza4mUwTuE4m4UmfA/ZBPW/tWfGqYJaQqtIJBHLWfSwddENXsGD+eKCao5zMl67gXV85jPXDUMEsNNOtA5kv0pdlGjFoEvq3H2eOheKQ+E72Dhyxfc5srdlsZ+Dad3wmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHCUBd6rXo1hnTeLBZScscNevVR213NeHAEOBTu9rEU=;
 b=LUggUNXqA/xDERQT6EQJD1VBVWMhMmS+1rwT8tyq4gWdQeOaOzMLODV3d9ZjVogJ7DU2nHJijfvfs6i26RQ0QgVeP5KGDx6X/9tcPim2OxXuycfNXhdhmFutTqdEXrdkaDPPi1aN64S73Z9TqVLuD53E/lphKsI9+tOQzZHvAu3HqhfpLuKb63hamyz9ip9Y2NFM1L3YchNNx3XoXWId3W7Ne0DEShCeZ9QwxhhL70JbiTuYtytZuAmwwyrVO9ibdTgMnfWsYIiQfAYztQ0gvVsVg5gBSDLB+QS/h2G+9uXsgjDmJ2VIMv8gn1BtQQnYGK1+hCNlvOjC1RP67QSwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHCUBd6rXo1hnTeLBZScscNevVR213NeHAEOBTu9rEU=;
 b=rBK7LIulY1qHFMtHjlmTZcfJeFifkXQ0GfY7oPWFp+ZDlfVFzmJznIt56ipkcidIiSwXaobnFBy8FFPHkdh/5avibxGq3ZVdVNGhv2MIY/EFOcsuroW8QUjk8KYH/23zJhA8Wca1EIU2bzn+BhAgfnQIW/gKjdBHcf3hx5D0XEk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4851.eurprd08.prod.outlook.com (2603:10a6:20b:c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 16:57:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 16:57:53 +0000
Subject: Re: [PATCH v7 07/11] iotests: add findtests.py
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-8-vsementsov@virtuozzo.com>
 <ffae0339-5d93-0306-9278-b95fcaa4bb98@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <917fdcd3-9fbe-37e0-3d15-e546950a329f@virtuozzo.com>
Date: Thu, 21 Jan 2021 19:57:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <ffae0339-5d93-0306-9278-b95fcaa4bb98@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:208:d2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 16:57:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c34c67a-6844-4709-8730-08d8be2db16d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4851:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4851F9A3FE84475AB6306E5EC1A10@AM6PR08MB4851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ip9C/cuUdyLMMGtYnJkYC4L28S7v3L1t8/gzul/5t5kEvx2JAah8dIf+wKklw+1OLkx03nH2cBIMDp0L7BVkWbajPHXpRGuJiI60aQlDyjqxJh/LeB2WsVM5WRCUDkXV5GDtpPizzbNpJLpxoa0HKDFebFl8PDBTrY3LZ5DJ5/7WdeVqs01LxWptyHbSqjtin2rExz2DDEoXL6vIrdiyod5pK8uRJ/wOU5A8GzII1S6VC89+WYRMxu6hlne0VZ15maoJjWV3ZZNFh+0hhflVWXHfvaFAKYkL+jt1OhXPVa4rwuiivAn2Tqh2mXWGQo4ZcBFJtkYzvL2BBxMC9AVER39DH+tII8slkBlj+9ojgVmbChD4wciiM8tTRxJCkiAtTVmmaMWIkDbEZQg5haXCP58Ol7l15iFB+Fx53rvY7x/U/nY71av3rgy8CTjlzUcD2yYoFsiN8F7n6ezaWBMhCwjhSCXhegij7qyX9AepXDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(186003)(83380400001)(16526019)(2906002)(5660300002)(956004)(86362001)(4326008)(6486002)(8936002)(53546011)(31686004)(66556008)(31696002)(66476007)(52116002)(66946007)(316002)(36756003)(8676002)(478600001)(16576012)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UVF0OXoxOEQzTnBkU3FrZXpyY2dSNVhTSXMyb1pwZkxRMTE5UE9Zc1N1aFhK?=
 =?utf-8?B?WWJwMU9RSG9VM2RWa0lxeUQrUWNGbyt6NFZibllEWkMzK0UxcHNCMmJoZUU1?=
 =?utf-8?B?OTRodlpmY0UwK3FjZ21OZXRucW84ZEFRVEFBRWZ2NEtSOWVoQ1UvdmpWc21K?=
 =?utf-8?B?MXNQTUpiQllES0pxWGhFR3BDRitkTDluTnlpR2ZweXdhTnczRmFFblRqVHZR?=
 =?utf-8?B?bWlOc1ROaThncFdocFNxaThreW5xUGEwR0R5a3dyT1JtVUFhd3g1RGs3RnNG?=
 =?utf-8?B?NWtzaVk5KzFwT3ROKzNqM2N0N2YyY2xRQ0UrZzR0REwvZHJ6V3AvbmNVVzdl?=
 =?utf-8?B?a045VXdENGJhcnZQUGJSTHQ2WnBISFRKa1ZlZHYxV2dUNXh4L2hsTmtyY2U0?=
 =?utf-8?B?T2h0b1NBZC9VTEN6aEpDTUg4ZmJkazJqUFhZZEU3NGY0Q0dzQS80bVQwdGMz?=
 =?utf-8?B?aFc4bFhuVkZoUXUxRUMrNTVUaERZUHVsQXJVRWJwdVRqYXU5c3YxQmczU0Fl?=
 =?utf-8?B?TTVXbkFkMUYzZy9DOGZEa0JpMVBteWtZMEpVayt3OVhac0tCeDZib25Dck53?=
 =?utf-8?B?ZmRZRzEvQlJzR3VNYWF3NjZTejczcVhwQ0I3YnpiWFlFeDY2aTlIVzcrMlFy?=
 =?utf-8?B?RDBuK0xFSVdVRDlqM1UvT1RLM2VyNmEza0tGZ20wK0YxaG56dGxYNFN6V1R4?=
 =?utf-8?B?MnR5amtCWnZwSnFtUHRkbGUrSGFtM2R4N29RaTNTSjhaclB5em9ndE9jZUMr?=
 =?utf-8?B?ckphUFVyVXFyYnhDMEprYVNsK0FOcnhrK0pzdytuTFFHeW5od1hkdDZZcEZ2?=
 =?utf-8?B?elpiWTdEcjZHTlhNY1JQMFloS29obnJzNkRKL2h1RTJNMjY0ZGx0eExCT2Jt?=
 =?utf-8?B?Yjd5Zy9uU3YycVArOE9PQ0c4Wjd0b3dCNlM5N1F5ZUsxWEh3R3BTVEttbkpG?=
 =?utf-8?B?TElYZ0ZGd3NGcm9wRG9kcExIeVVmMUpzZVZTQ0w5RVhKb2hvMWVLRkFHTTla?=
 =?utf-8?B?Y3hzSE91WUF6d213OWZxWXJVMm9JeUhKRm1yT2kvK1RtOXpoc3VWczBMQ1Nu?=
 =?utf-8?B?cU1EQjFJQlVmYitLekhUWVR2VVg2eUkyN3dneTZUODI3ZVVpSTdPMlZLaEhT?=
 =?utf-8?B?Y01xQVZodVlWTzU1MmkyM1RTR0YrblpnNGkvWnZJR1lDNktzdUJrUmVsdWtL?=
 =?utf-8?B?MVhhMU9XOW1qVFMvdnFjRFdOaWtpUUxvQ1VlR0VTTnVkQS9vUUdHZG56LzQv?=
 =?utf-8?B?UUdJbXRZVlFmYWZ4TGFCREI3c2gxSUEyVDZTWTd0VXJ1cmJzd1RiUy9HQW5O?=
 =?utf-8?Q?E0XvQfYsqSBdO1XMjixCVkSfWpcOMGSmyP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c34c67a-6844-4709-8730-08d8be2db16d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 16:57:53.4064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xsj4iszDz065Gu75o4GjeXxV7xWDIXnFfh3WerqPf5gBDsVpk1d6tXkKnPkDtRbEuVxKSw9x0BIRESnS0VK+yMy+DZf/s3+AlzEutTHhQqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4851
Received-SPF: pass client-ip=40.107.13.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 19:21, Eric Blake wrote:
> On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Add python script with new logic of searching for tests:
>>
> 
>> The file findtests.py is self-executable and may be used for debugging
>> purposes.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
> 
>> diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
>> new file mode 100644
>> index 0000000000..065ec13125
>> --- /dev/null
>> +++ b/tests/qemu-iotests/findtests.py
>> @@ -0,0 +1,159 @@
>> +# TestFinder class, define set of tests to run.
> 
> Per the commit message, the file is self-executable; doesn't that mean
> it should have 755 permissions instead of 644, and have a #! python line?
> 
>> +        return sequence
>>
> 
> I guess it would also need a __main__ blurb at the end?  Or maybe I'm
> misunderstanding the intent of the commit message line.
> 

These things are dropped recently and I forget to updated commit-msg.

So, what should be done is just drop this sentence from commit message.


-- 
Best regards,
Vladimir

