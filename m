Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C9444298
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:41:32 +0100 (CET)
Received: from localhost ([::1]:40448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGW9-0007R9-J8
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGTA-0004j7-Th
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:38:24 -0400
Received: from mail-ve1eur03on072a.outbound.protection.outlook.com
 ([2a01:111:f400:fe09::72a]:55937
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGT4-0006A6-3t
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:38:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLH2y2Es4ZgtLkPW00Ve5RcjOYbHl+Ls4jOhhTUdHzsJwC0ME5c+00h5nnYFSs62HsXyosElsg6Ny/hTrQqpOef5ghfeiUc/qguZMOXf/25I6m7cH/v7L9msqYB27cN2kRDNpp2+bXurGC++t9MUSlwoS/AnMHlyeJqh8HnzDHNwahg3q8bIKIszfB2ItigTiGpmpwbie0LMoW6f7A71qhMQkoC17o4MC/SHcXJxY83Nqh4sIf6v+RUvRllKrEIkl1Yrcz8oTScz9iOl+YKcCLkOEYvbs8THSfJS9zf53JAAYC93L5e1YeMEb6EIcMrjkfK26yqWD8RRrQR8Kyxjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShFDdGSM+DpALHydaaulaar7SccULgmm+C+3bNzMfOY=;
 b=Tp3qwrVMus5M3DvcqmYlOEmrIKs9g7Wu4DDePm84bZqM9zeuza8XuUc64896tvZGvajj2JQ32ocOziawD8melbdqxvgoTdU/ZxVX51FykGNEiJrdffvGY3/BhHFIyVkQptSiBN/oZCVlOzVtqkqmxgFSjbjQEEYDHH63ozuRn/BQp4Z6k+UDUVBEqu6bfy5YWcMYZDlvoLQtO9wGMXx9gpyQXkfFu1wr+yYftQ0igG+g68y/a3PRDDTTfQjqM8P1a2SX2LgVtkducLORh71yznaI0b5IVBAaQTmKWyRSmsiLilzTMfk7DpA9KYmbRMSBZ7+/gtYVkINe6QmxqbBjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShFDdGSM+DpALHydaaulaar7SccULgmm+C+3bNzMfOY=;
 b=hQX5783KD2rYw5A5GX6yZNqD5T1YrQZyzoUoYgAfotnV1K7qJWAEg20i4U8YcJuTHgjJ1XHzIaUADFUkGOzja9cQZw9I9mHYOyhhq8ChzZy8MJhKytWoiGyMEb8cpT3vUABQz3Jj1yAGGJkE23oSIcE7fLAnGetvDNZZaY9HVlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3287.eurprd08.prod.outlook.com (2603:10a6:209:41::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 13:38:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 13:38:14 +0000
Message-ID: <60d04c47-248c-d4f7-3eaf-a153bbe8c0bb@virtuozzo.com>
Date: Wed, 3 Nov 2021 16:38:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 5/5] block: Deprecate transaction type drive-backup
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 mdroth@linux.vnet.ibm.com, libguestfs@redhat.com, libvir-list@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20211025042405.3762351-1-armbru@redhat.com>
 <20211025042405.3762351-6-armbru@redhat.com>
 <CAFn=p-ZfdUO5hfxjqFLt_kUD24jvAbPURyJ6Cozvdq5SLb0YcA@mail.gmail.com>
 <87v91jca8c.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <87v91jca8c.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Wed, 3 Nov 2021 13:38:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 916634ac-705e-4200-45fe-08d99ecf2fdc
X-MS-TrafficTypeDiagnostic: AM6PR08MB3287:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3287AA19952567C9784C29C9C18C9@AM6PR08MB3287.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2S50FKIELC64HyV6ouPjauMmhnorFmpP82XoqoCNJqXDIeEiukPP0Dska8+exhI0hJGxC01boTR6XdVf8a2k/57RcjPJ1o0du67BMqnJ0wwuJ5v5/tfvB0rAE9etXRn+fyuf5Cd8MxfGmj1vPVGLbkM4rN5iQcqaYFAMCzkYlJOX1wKvEP8ErvVh9quevu+Ufd1dafMkgf84UCcCUtTX2/FZ5zrGcR1heAc1Drud6JLU1z8riNq1hwMhLhAn9cbOV040rR9IG/ZkpllfipYAWczNgaGR/FA5gfrLZWXZO32XzuSFQayQd3YnfL8r/IAUSrv1Ujd1VPpUtx1RSamif3zNm9osTyJ2cyreEeSsIyXuhuMnNNFu7IbDP0qZfFYDi60BjR8FP0nvaDdD/010uFjWRgS6qKev9rbjWhvAE6IasmUe+ei3s+MArmCcFKFBVhjphXSSK3ZcV9KIZB5Ngdz3QNhRXk7qOWr1kfAF9epFwOuALsYmoPYBwpCEtUH0GhdBuWH8mUqj0kdFw9f5ooN4IWgxsjCCI4kid55u3u85tMcUjACVbk3B7waB3+a9uhKugiNz38le4HWsPi5Afn5AKPJNvwARTf0gyTX5z5D6GZ+PbLy3XAsCQWJDc1mAYNnWc6cPmLL94SQ31Zpy5u+/FCiR4ryAEZeW0cGcIoGhDtjuX7XKcP17FG8+v6R2L7f2B7yZeve++01z6N23W3FThvA3bXD/hdlnk0wllBEV/WzjaEg1rnEFsBDAt1gG3IPK2KfIx1wjRA+Ps6jPZxZK/JPNRJHW7tlTWdMssLwPJLiO8b7zg3Hy/M8my7Ub7x7MEzlg6vrbatu1J1HOP3GKdhvB5koMAxzp+GvwLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(6486002)(26005)(5660300002)(8936002)(966005)(86362001)(186003)(7416002)(83380400001)(36756003)(508600001)(16576012)(2616005)(31686004)(31696002)(53546011)(316002)(66556008)(110136005)(66476007)(38350700002)(54906003)(956004)(8676002)(52116002)(38100700002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXNRR2FzZmZudXMwWWtQRjJoaDVXTnVUczV5WURudTNNTkw0Unk0S3BxeW5x?=
 =?utf-8?B?WEhmbDd6dUhSaXJkei9PWDJzS1A2eTErWjhUMHdKSnB2WUlOMFJpQys1SzZY?=
 =?utf-8?B?VXpWcmU4anFYaHFzaWlYcXIxRWpmUzFQTVpPdGlCVE80RFcxQ1JqeWxoQS92?=
 =?utf-8?B?WW5qdHMrTFZ6T09qNzdlNHV3YStvbUhSNHRzVXNIdmtjRHlla2ZvazBCK1dX?=
 =?utf-8?B?RDd4ZVRoTm9yMEcxYVBSMEpHeTQyZndyUHFyL2VrRXU3Y0pna0xPbVFqY0RD?=
 =?utf-8?B?K241MGhFVnJXU05saVVGUXFiZTdTaEJUdzVQMmJqeGxWRGl4bXZETWhoSG5s?=
 =?utf-8?B?Q1ZHWFRIaXhnVjJpR1ZwWGdObEpkSXNvdHVLNkM3RkVoT0JRQzU0K2QzclR6?=
 =?utf-8?B?a2Y3dUMzSWllSENWMGg0TExZSWU3YVA3bnZGUE1id2hUaUVxMzY3NzBUY0FU?=
 =?utf-8?B?c0tCRzlnMTVIc1N4ZStlRjRkNU9RWEdJbkhlQ2J0MnJPYjZJQitDM09ZYWtx?=
 =?utf-8?B?cFpRQ3drNTZHREJnR1NudU4rbFpxMEkwZGpQNHVxSGZsYXNBc25tMWMxZXZq?=
 =?utf-8?B?TTBpdENuaGFFVHh3ajJTQkxlY1ZSOENFRUpidnVVREpXUWdLV21aSzJLaStD?=
 =?utf-8?B?T0lhRTEzMnhQKy9RdlVGVlQ1VCtNSWR1SHBHNzhIa1p2eENGWnZ6VUtqY21O?=
 =?utf-8?B?OW9JRVl1UUNuV05FTldzQldMTDdXcWs2YU5jTkxtaG44UGRzaGtUTFRoOXQz?=
 =?utf-8?B?TTlxb2VBd0ZGZDQvVWtDOEVreVdZWmVjbGxTSFMyckdIckgrbXpUTXlISGY0?=
 =?utf-8?B?QXZIU0hWSWZQazBSbXliSHp2TUJVbHU5TDVYOUFlZ0xrVVdjUnVyNnB1STZu?=
 =?utf-8?B?ZGdHSnRWRmtKSXBaWFVXRnFscWFoRHRvMU9BZEFQd0pQQVZZc2JoVkhmRnJY?=
 =?utf-8?B?WFVoN2RwbTNmOWlteEkzeDNWejVaSWF4ZSt6VGE1cjRGWU5aVHBHNHIyL201?=
 =?utf-8?B?S3pOQitaM1l2THNNMXBuNnlvMXNrL2ZzMVlzOXkrTmwvNWtWNEx0UjJOa005?=
 =?utf-8?B?MVpIWGdSeUwrdk5lY05FdHc4QTBDdmQwczlteGxyZ1lhSjFWVGxQRjh6U3pt?=
 =?utf-8?B?WGxEYnhhMDdONkpGZzlLU0RDQWt2V0hhalBZV3YvZEtRUC9KSXZLbGQva2pk?=
 =?utf-8?B?U1RycDBVZXBQRVhsdnI1ck53Q1NXVThhR2FxbG5hUzYwVUlaNUhLUVpFamlC?=
 =?utf-8?B?S3R1dWJjcXNyNloybkVVRlV6UlJ5WWdIdVk2TmdIbkh2d2YxYlpZZmVNTlR5?=
 =?utf-8?B?RWNKNHlIQ3d2OUdnT2ZFUUxLcDFXNDBCVG04ZEUzTGVCZm5zaElBN09oSFoy?=
 =?utf-8?B?QjJ0aW03SktYUkNNWXkxNitQcVI4WW4wK2tuZHpLZTBlcjkyTXdXNnhsNHBB?=
 =?utf-8?B?WmdPcS9WdzdlYi9FeXFNeHY2eU5IbXlyK1ZzdlNNVlRKbjM5cHdmejd3SVI5?=
 =?utf-8?B?ZFg2cFlqdVppcmEwVWJFRTlzVHZ0VUtIWXkwVkVnV1VySEk0RUw4L01uUVJl?=
 =?utf-8?B?dW5SaC94b05SWUxvdk5qTHdCWFNUL1BtMHJpdzdjQ1pwQ3Y0dDdzcFMxb3U2?=
 =?utf-8?B?N3M2OW1XdnVha0FHVXJ1UFpmL0VaWU5wclQ3YmIwMUtuRnRWamFBRjhNZ2Fl?=
 =?utf-8?B?d1dibjJXbmtNdTYrS3JBQ3N4MC9lTWNtaFYvYlhTVGdKcFpwREw2N3Z0MUxp?=
 =?utf-8?B?Y3hCWktRZFZqdmNFY25MKzhydXBoTzNMajVtSUdHUjY5d3NBOGxqcWlPSTBk?=
 =?utf-8?B?Q2U3NGZ5aWtJRVcyc0FUVFZtSFczN1pQVFd0RmtvRis0VGdrYXFHK3p0Wldv?=
 =?utf-8?B?eTFJdmlSeGRyaTk2L2FzZEh3M3JQUVlKZG1HRk93bUpVRVlxVk9ZUmNzbkpp?=
 =?utf-8?B?WjJYMkhjWU83TlY5V1p5dm1XbDBYRXp6NldhbVZoVS9wUmJhUk1TSFpxT1VZ?=
 =?utf-8?B?MldzSGZzWHVweGhVbXkrZ29QY0hLWjdKZHJzc3A3NHFzUjJQSWlBcEhUYlhU?=
 =?utf-8?B?S1dWUWcxNXgwRjk1ZDIyVFQ1bm5leW90Tk5EYjdLNTlHeUdnVHN2aFlEWlFu?=
 =?utf-8?B?M205ZFhVTmJJNDlTYUpobHVHdmJiaEZPTzIzVE9seUp6RWhKdG93OUovWmJN?=
 =?utf-8?B?Q3A4eXYxbWIwTXNGSGhFOEs1Z2srblA0WHRnWHRqajFSUjIzQmh2djBQamJz?=
 =?utf-8?Q?hrVbxW+gosYByq4Nq/95QLKHIZ/N87oS3/bKPAIuJQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916634ac-705e-4200-45fe-08d99ecf2fdc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:38:14.8925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8GdZsZcIZ7FAlQFNqw5BcmilrSKy8+CiAiuunk2rXdgYdpmCGP7uHcdGq/R96Tm2OBl8t1Y3hXLhUbhRBWPqleRXglWJdqFi1bjTRxeXOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3287
Received-SPF: pass client-ip=2a01:111:f400:fe09::72a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.528, SPF_HELO_PASS=-0.001,
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

27.10.2021 08:22, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On Mon, Oct 25, 2021 at 12:24 AM Markus Armbruster <armbru@redhat.com>
>> wrote:
>>
>>> Several moons ago, Vladimir posted
>>>
>>>      Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
>>>      Date: Wed,  5 May 2021 16:58:03 +0300
>>>      Message-Id: <20210505135803.67896-4-vsementsov@virtuozzo.com>
>>>      https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html
>>>
>>> with this
>>>
>>>      TODO: We also need to deprecate drive-backup transaction action..
>>>      But union members in QAPI doesn't support 'deprecated' feature. I tried
>>>      to dig a bit, but failed :/ Markus, could you please help with it? At
>>>      least by advice?
>>>
>>> This is one way to resolve it.  Sorry it took so long.
>>>
>>>
>> I'll share the blame for not pushing back on the other series, but ...
>>
>>
>>> John explored another way, namely adding feature flags to union
>>> branches.  Could also be useful, say to add different features to
>>> branches in multiple unions sharing the same tag enum.
>>>
>>>
>> ... this way seems simpler for now, and I trust your intuition on what's
>> easier to support as I don't have a solid grasp of the C interfaces at play
>> for actually parsing the input. We can always revisit the other thing later
>> if/when we need it.
>>
>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>   qapi/transaction.json | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/qapi/transaction.json b/qapi/transaction.json
>>> index d175b5f863..381a2df782 100644
>>> --- a/qapi/transaction.json
>>> +++ b/qapi/transaction.json
>>> @@ -54,6 +54,10 @@
>>>   # @blockdev-snapshot-sync: since 1.1
>>>   # @drive-backup: Since 1.6
>>>   #
>>> +# Features:
>>> +# @deprecated: Member @drive-backup is deprecated.  Use member
>>> +#              @blockdev-backup instead.
>>> +#
>>>   # Since: 1.1
>>>   ##
>>>   { 'enum': 'TransactionActionKind',
>>> @@ -62,7 +66,7 @@
>>>               'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
>>>               'blockdev-backup', 'blockdev-snapshot',
>>>               'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
>>> -            'drive-backup' ] }
>>> +            { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
>>>
>>>   ##
>>>   # @AbortWrapper:
>>> --
>>> 2.31.1
>>>
>>>
>> Seems pretty clean to me overall. What's the reason for wanting it to be
>> RFC?
> 
> I believe it depends on the remainder of Vladimir's series.
> 


Sorry, I didn't help with reviewing as promised :\

So, seems the only missing bit is v3 of my original series deprecating backup? I've sent it just now: "[PATCH v3 0/3] qapi & doc: deprecate drive-backup".

If it is OK and if it is convenient for you Markus, you can just take it into your series between 04 and 05 and pull through your tree.

-- 
Best regards,
Vladimir

