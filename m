Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C4638CDA3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 20:40:16 +0200 (CEST)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkA4F-0007qv-Ep
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 14:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lkA2P-0006sm-Rg; Fri, 21 May 2021 14:38:21 -0400
Received: from mail-eopbgr50136.outbound.protection.outlook.com
 ([40.107.5.136]:2046 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lkA2N-0004fZ-77; Fri, 21 May 2021 14:38:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eos3QYLZ/eatPA/F0+bwoUpoQzTN+P3tBUJLvs7alrqS4n2OWufOLb6TxryBT9HntlUe8Di2qiNejtJN1zC1mDfvFZAchijayVp/OLkDpTbr9fYgmKdSlhEmJBM9GxR8A85HQHjFgv1kTAz2lVvgOa5ScLzv63RIiR0aClLXWYoddtBy+GdIVcIwXvjolLtdQR1C3vGT+CN07sgUZPuPLfQUpdK5i0krEXJ6tPAQBqxv5kd+2dIPN5bP0etckrBcKFJVrraFyw2+6Gpzgp1vZp1KFKUgyWVVzECwD9j4v6at2KZk6PeuKitQBnIIAmTpZn7eTN+Al8F7cOsQ/LOE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKnM9zo1fBUvamLaJDiboWxNy1m4EtdnvrZnnwGn9Rs=;
 b=XyxXc5VRhkGSu7puQoAQ1QWeItLVV93JhxEWIwNCG7R3PmGfs0zpephyp5jhlxSK9os7KxfY1NOMSzKnb5gsxC0ivjb7GjScECgtFfGtyiyXgjebajiJIXLM4LNd0aJlqvOp38qESCxfq/8xpEGgCabbIdPdMzWeI7OA/bzaPVg3ewT3sRTr7U94TQ26U8AeJvXD+yYxjXNg/GHYvzuov5DH10dBjYjY8g5RXwxJTmrgMg9xmDe5Yw0zFItTv2nFzy7adbbhkasuGg4iAjoWykWl697jv6a0OPqoSULJcO6ZlfJox53XhM+f2mRix+GJn3z1xzFVTrTUQvs/c8pMLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKnM9zo1fBUvamLaJDiboWxNy1m4EtdnvrZnnwGn9Rs=;
 b=oxi+q5AvCHjKA81ois0CBph5Fgs/V4Ou1xDaOlDP8YGIW03L5YJdhhIWA7mUWIhUZHJF2WwT+/6yUH4tu2OuNxHw30JODy8PlWS4E0z6DMqsJNQmgGGblH/6Pq//RbGuVCVjWWQVNxjeHkt19/PGe2eiqmpQzlwufRfjtboVR3Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4469.eurprd08.prod.outlook.com (2603:10a6:20b:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 18:38:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 18:38:16 +0000
Subject: Re: Qemu block filter insertion/removal API
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>, yur@virtuozzo.com,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, armbru@redhat.com
References: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
 <YKT6D1jg4gYi8nZE@merkur.fritz.box>
 <a6435411-d4dd-29a0-02b7-d99e9b42597b@virtuozzo.com>
 <YKUMeq/EY+TyXZGk@merkur.fritz.box>
 <bf9b37fb-fa02-20f3-6642-4d2d578927f5@virtuozzo.com>
 <afcb0aa4-a7e7-aea9-bf56-bd01b4d22857@virtuozzo.com>
Message-ID: <64881100-bb19-535f-1dc3-789d0c253380@virtuozzo.com>
Date: Fri, 21 May 2021 21:38:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <afcb0aa4-a7e7-aea9-bf56-bd01b4d22857@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Fri, 21 May 2021 18:38:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d767953c-5d8c-476a-9726-08d91c8798df
X-MS-TrafficTypeDiagnostic: AM6PR08MB4469:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44690E4C335339ECFF62F969C1299@AM6PR08MB4469.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uLYkMzb3kXY/NsJw0CJDAI6juvZK7og4A1QrZpjz0NVtadVqmRDYvolSZM5inL8F7IfyhKEQ1nR3eauJ9WGoCs8iLttrkcI+ZVXtiMkdE3clBnXktOlams82m1ZNP3ocavV0odV8q7WKEyDxyPN/27HObHJsMViqdVMjggbSprEsICwotfTb+pbyaHZK1YahM8i9rWf3U7MoCSOx8CcZDtf17pCmeCmmSjGDq9YYYu8RcJk983iseHeY9NWHx/x/7wyQBmQTMztO0gk+ppXjKwfNbzU7NOpCAaGlecy+/YwBc6+rMZXCPp99p8t4PDA8tY6Vw/zoWz1EKa+IhWw+CP92JemwG2DtzpLtk1e2yrWKDRi7g9C+aBOhuuGLcAoqHLTRczEtEH4Orsb9m6bd2vnjBQFLBcnW71TQ+1skSw8PhSH/qrvvFtjXTIsHObVBSdgQZonyun58aXydpDbR8SIafPHcxNrbKsANMCWcWjr/uu8RSrMaD0z7QasMTgEsWMQsIBVSzU1BqhISPax8GME73DtO3dsFLX8vppwptaH5kHX+VtMEroQgDLwEEvM2XyUxcOCKwdXb3iuotI+8OX9K+s94Huuroe75v3gVJsUiQFSycHQTnhS5/1RKR7h34kFWG03cSlAAe2Eif+Exug+VODBslF53HQUEnyDYe8mNvQg8/mMOwGeCU7Dnyc6hIFdjYwgpXKR3/URiDXREXX62HNb/7enBbQc5rjbYD8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(376002)(136003)(346002)(16526019)(8676002)(31686004)(2616005)(2906002)(66556008)(66946007)(66476007)(478600001)(26005)(52116002)(31696002)(956004)(86362001)(186003)(8936002)(5660300002)(6916009)(54906003)(38100700002)(6486002)(38350700002)(36756003)(316002)(4326008)(16576012)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmhaWVBWeldmMVZ4SXBPWm5MeUYxWG5QQmg2VzhYS1RoY2l0MG9USUJLdTYv?=
 =?utf-8?B?TENYbkZCbm5ja3hFWUpzTFFjdTdHSWh2NVpNNjlCemJDSHFCZWpGS1BIVHE3?=
 =?utf-8?B?WWNKTWZBRW9ndEI4cWs4SXcvRzkxUGp0Sm5IMi9tRTRaTUJzWjBKcjc4VTZ1?=
 =?utf-8?B?SUxTSUVqY0NZR0lJTm5jZ2ZQSzRpN0NmL2ZPZ2xIZ2d3ZzcyS2R6N1FVMDEz?=
 =?utf-8?B?VjNWOVJmVk1pRDcxbTVNUmMvd0QxcmsxNjg0SnYrZklXTGFlR0kxcUtOVFFs?=
 =?utf-8?B?Z3llend3ck82dlhoUndWb3FMUzl1NFVCOWhvWER2STFaSUxyeENqZ0E5MzRF?=
 =?utf-8?B?TXQ3WWhGcVBLTDZWVzVidmVKalhjM0xBY0RZWGFhVzFWa0lXWWpId29yWFBN?=
 =?utf-8?B?OUdFZ0pyZmV5ZUQzNDVGRXBlQnk2d0F4OEcwcENLVzRudndUVVNlMDJLQ1pZ?=
 =?utf-8?B?UFd1UDJJL2xXNlIvV04veFhOYnZURks0Y1dtNTRMMXhPK1ZIOEt2V1RmTlND?=
 =?utf-8?B?ZGVqcTBjbWRSeUxGRTlwbjNCdGxuMFRiTWQ5Vk9ZeU5UZ3c0S0kyRGtFMXVk?=
 =?utf-8?B?ajN4Vy9HZ1VGMzk0Vk5VNFRVcDBXbmJ5emhETXI3UkNxeEtuUGtaOGFqRXJo?=
 =?utf-8?B?VjFzbGhsQ0hJdFFjRHlxeDF6emRTZkpWblNUaWdMekZ6OERXZk9idFY3d0tD?=
 =?utf-8?B?akUvRmdOb2tIaVNJRVlCazFzanVkbld6M0lnUWoyTWpNYUdSeko5OVcxOHRj?=
 =?utf-8?B?cjZyZWkrOG1jMWJ5REl3UnJzM0xYRzlOWGZ1ZHl1UHkwbHExRXNFbTh4SWdD?=
 =?utf-8?B?U3NHTUtSVUhvNEl6a2pER1ZLMk00RlJrQzExQm1STDRQYnFVankzUU42ZjJU?=
 =?utf-8?B?dmFKNnNkeXdmdzlZRWxMMEFTNXAzak5XZEFTcUo5akFaUEZvZjZNWVlJMzdm?=
 =?utf-8?B?VDhTcWdIekVZQUxDdWhSQ3h3R3BOOXp0QVpYMFhnbzRNTWpORHREQkZFRlRJ?=
 =?utf-8?B?WjVOd3VSTUk2ZFJ1a05IMkU1Mnd6QXhidFFFbVh4dXIxR1V2cHRMOEVjOWU2?=
 =?utf-8?B?SmFWUGhKMWNEN1htNUNoRFFvbU40aVluQTkwbXplOGwvSDJIa2hkT2R1S3kv?=
 =?utf-8?B?L3BRUytYa1JSSlFtUVgzbUVXa2p0SkkyNTVsSjhSN3BqZGZyQlIwOVRIWTBE?=
 =?utf-8?B?clY2djFqT2Vua0lMRE16L2hmWmd5NWk4WWlwNjNWSmdPeXR0SzBkMlp0WWJQ?=
 =?utf-8?B?cENKbzNLa2lSZ1JjR0Vvb2ZweG8rcWUrMTFVek9nM25ZVDdmMzFqTGpyaDc4?=
 =?utf-8?B?YVNVMmE1di9SWmIzU1RHT2RxMCtSVGRITjFjRmNieGcyeXN6QzRpUVBNM2l6?=
 =?utf-8?B?d2kyUG5oQ0JuM013Z21QWmdUSW5UUkQyTlZkLyttYlhCNTlKQ3FNa2s3K0Ju?=
 =?utf-8?B?Z3JTbXA3Ynh4Q1RVTDVMbkZveXl2Z1h5VkswSlZhVURjb05TdWllbHFSY2w4?=
 =?utf-8?B?UWRveGI3WDAraHFZOFA1ekF2L3dxOWRwTlREazAvY2JZQmEvcWdSbUlkTEVs?=
 =?utf-8?B?M3ZJY0FJQ1oybmdyMWZtN2VDNllPcmYxQXdJVWsyNFZFajF4Um1Fa3RZalg2?=
 =?utf-8?B?RTE5Yk01d2U4U2hLYTl4Q2pic0MxOXBKRXByTHB6R2FTSURxYkVWVjRkUkdm?=
 =?utf-8?B?Sm5WQURIZFFHMG54ZmpiMm1abHV6clp3REYxMGF1MkxkT3MvUkY4ekFMRGs5?=
 =?utf-8?Q?Rwt33MUTeKHS0AOTGjmZkxJKBSAsrTFZHFloemT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d767953c-5d8c-476a-9726-08d91c8798df
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 18:38:16.1753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coxLzk3aly2b34Pe+Iy4+V5mAl4u4lkP3SWAe7HAmzbVnxJ/jVtOXU/rnQFyfDNIuoc0caNnn0fe4p3mSQxUQtZ2LoHeZ4tn2roVIEyiBzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4469
Received-SPF: pass client-ip=40.107.5.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

21.05.2021 21:32, Vladimir Sementsov-Ogievskiy wrote:
> 19.05.2021 17:14, Vladimir Sementsov-Ogievskiy wrote:
>> 19.05.2021 16:02, Kevin Wolf wrote:
>>> Am 19.05.2021 um 14:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 19.05.2021 14:44, Kevin Wolf wrote:
>>>>> Am 17.05.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>> Hi all!
>>>>>>
>>>>>> I'd like to be sure that we know where we are going to.
>>>>>>
>>>>>> In blockdev-era where qemu user is aware about block nodes, all nodes have good names and controlled by user we can efficiently use block filters.
>>>>>>
>>>>>> We already have some useful filters: copy-on-read, throttling, compress. In my parallel series I make backup-top filter public and useful without backup block jobs. But now filters could be inserted only together with opening their child. We can specify filters in qemu cmdline, or filter can take place in the block node chain created by blockdev-add.
>>>>>>
>>>>>> Still, it would be good to insert/remove filters on demand.
>>>>>>
>>>>>> Currently we are going to use x-blockdev-reopen for this. Still it can't be used to insert a filter above root node (as x-blockdev-reopen can change only block node options and their children). In my series "[PATCH 00/21] block: publish backup-top filter" I propose (as Kevin suggested) to modify qom-set, so that it can set drive option of running device. That's not difficult, but it means that we have different scenario of inserting/removing filters:
>>>>>>
>>>>>> 1. filter above root node X:
>>>>>>
>>>>>> inserting:
>>>>>>
>>>>>>     - do blockdev-add to add a filter (and specify X as its child)
>>>>>>     - do qom-set to set new filter as a rood node instead of X
>>>>>>
>>>>>> removing
>>>>>>
>>>>>>     - do qom-set to make X a root node again
>>>>>>     - do blockdev-del to drop a filter
>>>>>>
>>>>>> 2. filter between two block nodes P and X. (For example, X is a backing child of P)
>>>>>>
>>>>>> inserting
>>>>>>
>>>>>>     - do blockdev-add to add a filter (and specify X as its child)
>>>>>>     - do blockdev-reopen to set P.backing = filter
>>>>>>
>>>>>> remvoing
>>>>>>
>>>>>>     - do blockdev-reopen to set P.backing = X
>>>>>>     - do blockdev-del to drop a filter
>>>>>>
>>>>>>
>>>>>> And, probably we'll want transaction support for all these things.
>>>>>>
>>>>>>
>>>>>> Is it OK? Or do we need some kind of additional blockdev-replace command, that can replace one node by another, so in both cases we will do
>>>>>>
>>>>>> inserting:
>>>>>>     - blockdev-add filter
>>>>>>     - blockdev-replace (make all parents of X to point to the new filter instead (except for the filter itself of course)
>>>>>>
>>>>>> removing
>>>>>>     - blockdev-replace (make all parante of filter to be parents of X instead)
>>>>>>     - blockdev-del filter
>>>>>>
>>>>>> It's simple to implement, and it seems for me that it is simpler to use. Any thoughts?
>>>>>
>>>>> One reason I remember why we didn't decide to go this way in the many
>>>>> "dynamic graph reconfiguration" discussions we had, is that it's not
>>>>> generic enough to cover all cases. But I'm not sure if we ever
>>>>> considered root nodes as a separate case. I acknowledge that having two
>>>>> different interfaces is inconvenient, and integrating qom-set in a
>>>>> transaction is rather unlikely to happen.
>>>>>
>>>>> The reason why it's not generic is that it restricts you to doing the
>>>>> same thing for all parents. Imagine this:
>>>>>
>>>>>                       +- virtio-blk
>>>>>                       |
>>>>>       file <- qcow2 <-+
>>>>>                       |
>>>>>                       +- NBD export
>>>>>
>>>>> Now you want to throttle the NBD export so that it doesn't interfere
>>>>> with your VM too much. With your simple blockdev-replace this isn't
>>>>> possible. You would have to add the filter to both users or to none.
>>>>>
>>>>> In theory, blockdev-replace could take a list of the edges that should
>>>>> be changed to the new node. The problem is that edges don't have names,
>>>>> and even the parents don't necessarily have one (and if they do, they
>>>>> are in separate namespaces, so a BlockBackend, a job and an export could
>>>>> all have the same name), so finding a good way to refer to them in QMP
>>>>> doesn't sound trivial.
>>>>>
>>>>
>>>> Hm. I like the idea. And it seems feasible to me:
>>>>
>>>> Both export and block jobs works through BlockBackend.
>>>>
>>>> So, for block-jobs, we can add optional parameters like
>>>> source-blk-name, and target-blk-name. If parameters specified, blk's
>>>> will be named, and user will be able to do blockdev-replace.
>>>
>>> I'm not sure if giving them a name is a good idea. Wouldn't it make the
>>> BlockBackend accessible for the user who could then make a device use
>>> it?
>>>
>>>> For export it's a bit trickier: it would be strange to add separate
>>>> argument for export blk, as export already has id. So, I'd do the
>>>> following:
>>>>
>>>> 1. make blk named (with same name as the export itself) iff name does
>>>>     not conflict with other blks
>>>> 2. deprecate duplicating existing blk names by export name.
>>>
>>> Yes, if we decide that giving them a name is a good idea, it's possible,
>>> but still a change that requires deprecation, as you say.
>>>
>>> The third one is devices (which is what I actually meant when I said
>>> BlockBackend), which also have anonymous BlockBackends in the -blockdev
>>> world. The same approach could work, but it would essentially mean
>>> unifying the QOM and the block namespace, which sounds more likely to
>>> produce conflicts than exports.
>>>
>>>> Then, blockdev-replace take a parents list, where parent is either
>>>> node-name or blk name.
>>>
>>> Note that you need both a node-name and a child name to unambiguously
>>> identify an edge.
>>>
>>> I guess you could do something like the following, it's just a bit
>>> verbose:
>>>
>>> { 'enum': 'BlockEdgeParentType',
>>>    'data': ['node', 'device', 'export', 'job'] }
> 
> Interesting that it intersects with @XDbgBlockGraphNodeType.. I'm looking at it, and see that BDS node is called "block-driver" not "block-node". That's because the idea was that we have block-graph, where all parents are included, therefore they are "nodes" as well.
> 
>>>
>>> { 'struct': 'BlockEdgeNode',
>>>    'data': { 'node-name': 'str', 'child-name': 'str' } }
>>> { 'struct': 'BlockEdgeDevice', 'data': { 'qdev': 'str' } }
>>> { 'struct': 'BlockEdgeExport', 'data': { 'id': 'str' } }
>>> { 'struct': 'BlockEdgeJob',
>>>    'data': { 'id': 'str',
>>>              'role': '...some enum...?' } }
>>>
>>> { 'union': 'BlockEdge',
>>>    'base': { 'parent-type': 'BlockEdgeParentType' },
>>>    'discriminator': 'parent-type',
>>>    'data': {
>>>        'block-node': 'BlockEdgeNode',
>>>        'device': 'BlockEdgeDevice',
>>>        'export': 'BlockEdgeExport',
>>>        'job': 'BlockEdgeJob'
>>>    } }
>>>
>>> Maybe BlockEdgeJob (where the correct definition isn't obvious) is
>>> actually unnecessary if we can make sure that jobs always go through
>>> their filter instead of owning a BlockBackend. That's what they really
>>> should be doing anyway.
>>>
>>
>> I still think that block jobs may operate without filter in some cases.. But the schema looks good, I'll try.
>>
> 
> 
> Now I'm not sure is that a good idea. This forces user to handle different types of parents. So, user have to make an abstraction of block-parent, and handle all the types. Adding more types in future will lead to modifying this user logic..
> 
> What about the following compromise:
> 
> { 'struct': 'GenericNode',
>    'data': {
>       'id': 'str',   # id maybe node-name or qdev-id or export-name or job-id
>       '*type': 'BlockEdgeParentType'   # optional, may be omitted if @id is not ambigous
> } }
> 
> { 'struct': 'BlockEdge',
>    'data': {
>       'parent': 'GenericNode',
>       '*name': 'str'  # optional, may be omitted if @parent has only one child (good for exports and block-devices)
> } }
> 
> 
> Then, if user of the interface cares to give different names to all generic nodes (jobs, block-nodes, devices and exports), he may use rather simple interface.
> 
> Then we can deprecate any duplication between qdev ids, node-names, job ids and export names.
> 
> 


Or, we even can go with simple


{ 'struct': 'BlockEdge',
    'data': {
       'parent-id': 'str',   # id maybe node-name or qdev-id or export-name or job-id
       '*name': 'str'  # optional, may be omitted if @parent has only one child (good for exports and block-devices)
} }

And error-out if parent-id is ambigous. This will force users who want to use new blockdev-replace to give different names to all block-parents.

-- 
Best regards,
Vladimir

