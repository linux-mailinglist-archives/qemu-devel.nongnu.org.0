Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E1315649
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:50:32 +0100 (CET)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y5k-0000DD-RV
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1l9Xwj-0000TM-VW; Tue, 09 Feb 2021 13:41:11 -0500
Received: from mail-am6eur05on2125.outbound.protection.outlook.com
 ([40.107.22.125]:47169 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1l9Xwg-000389-JF; Tue, 09 Feb 2021 13:41:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V63Aw/5hArHGlYBWiY+syCRi6AbmmiditPTu10xx8fHPOrBGWlLxoLJyM6ZFD0pnVoIeM6oDdM7khm8Bwx/bX0oyrVqjtJBEFdyfSkoPgL9gypczdj+NxyImqQq11zyZJhhSXU+6RzQP5SE1LYBQpQiJ11sgAQ+WXHHtjXjNY8M7GDjQfskxDdkKjyHMODwruF/uP528Ar7wQ6Gzusdh2v7wAL6NMDPKggPVnvOod1xrX9D+UH7NAwPiu3ztKGbJ3pMasnUSt4PbuGVCXjObFYORwqas0DaDAwozVOHMMiWtIb0BdqlvYFoh3MrOk1doXk4FaY7ZE0JiEFq545D8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us+fj7aE4a8b10FiAi8bDQ121yeK4F/ybMLxATOuLF0=;
 b=CmNv22itl5vvYzL8eY2BAqPUwf47hYHB+MvvR5VMoxGZ7tpwMyVF+w3750Qv2gGTNPWyyu32bsRBX3WtXnnnb9uG5W6ncXmQkRRKVP9SrdscFUiLS0Q7quBzDQkAEqvKjXCe1Tz132dHv7UfE5gXmWef9Kx9H3rYOpGA1oPmIA9S2TKo5uIkEuVZ7RqTaAOc04mPNOZjRdAiUJgoa7/9s/lA33gtdKYMUVRlcs2L0G9FOfa4I/r9nvVvr69kXXp766kw8OEhBd2Sg5p7n87ElnA7edEq3Z2QpKlxArd/f/mPbViX1hJ5H9hUnfkkeO4yWNCPXv2TZSTBNZKOUB2X8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us+fj7aE4a8b10FiAi8bDQ121yeK4F/ybMLxATOuLF0=;
 b=OjCfgVMr1MQgcc42TasmwGD9N1fbpXOESe+O8Xqw10XakC+eoJ2OWbT2lSgpLs7ky8mhE7vxN8vydbNsKiRDDukApNnHN/V5hbNBPbasr6cq3WPcpb6stET6j5rP81eYUR9NEwlQuZ0Q1M4k4N559Wuv1B01V0ciR78qjqBJS+A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21; Tue, 9 Feb
 2021 18:41:02 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 18:41:02 +0000
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <745c4617-01bc-c888-b6da-95a705cf0c1e@redhat.com>
 <0669a5e8-bcff-ffb1-23b0-0af9ce20ad27@virtuozzo.com>
 <476836f5-09d8-976d-bc3c-afb05befddbd@redhat.com>
 <df5f3aac-b43f-85f8-8210-6b0b527ac343@virtuozzo.com>
 <1b4ad0ed-e1a7-d592-cb76-8a204fbbd585@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <a3f741fd-8ab7-3721-38cc-be855b538afd@openvz.org>
Date: Tue, 9 Feb 2021 21:41:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1b4ad0ed-e1a7-d592-cb76-8a204fbbd585@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM8P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::35) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.63] (31.148.204.195) by
 AM8P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 9 Feb 2021 18:41:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22a4c448-11cd-42de-86d8-08d8cd2a4035
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334A9B8F97EDBF0FB7E69F1B68E9@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uv08Evxr+6+EI+7rq7pPXRoFpZIW4PO12Q3ZMge3ahRq8zg8OEDYDoP+laD+iJnKdpMMV3fT8t4ZpJesknPbWkbG+8qiCmFAQMgzqsvfJdTMptpgNVBmtDyVcBPbFAxBASQyy7v7XwiD3vVZTQEwd2jP9TSnaBW0aqG4OAIz8r68iK80eanFWXPf1qnXXxoGrN8CIHMtLmFzgCT8ta70IOe1rqlFS7VrPU82wU1S5g7nIPiEgTl2/6eh3jEss/1ilCFJMFq/K7BNoBw0bRcM2515TE+IIjnsVmmDGPQD821b3yFdIh++KTmUwC+aHzdxwByTCNtfzJtTzXV1CccVQQSbsavDDePfpKS35Q33Fk+BToLpko14ikZ+M9bJJ+SO9TLzcsteIWMUvWqSVyvC0wmyWjBqqQCSq+SQkCc4sGtnt7NrTl00Uk0rNE9GRo39nHjCENfRceNF+NEdyOrG/wd5eRsI9TQblOnHfPXz82EbqwHHfvd1xsUU71A0JcVYXwlFZbsYgwdtucFMulqxH+DEVXZnBshQOfnO4EyPG3yYuev7wZaOowfwRdsbBZm8I2ftScy3qETjwBrW0bxJ6gZZfB0VkLKehQefYnOSk2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39840400004)(376002)(136003)(186003)(36756003)(956004)(16526019)(66556008)(66946007)(110136005)(31686004)(53546011)(31696002)(66476007)(6486002)(83380400001)(2906002)(83170400001)(316002)(26005)(16576012)(30864003)(52116002)(478600001)(8676002)(4326008)(8936002)(2616005)(5660300002)(42882007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cDVCRmlZdGhrNExRSXpqKzFtbFBPMlBpSkFqdGY2cGJDR0doRGFialJhNE83?=
 =?utf-8?B?V0tjL25Sb0JlUUFvTGYzOVVkeFJoVmdkdDZTU2w1b3FvNlJHTXNGd2lVTHYz?=
 =?utf-8?B?aTRuMUhGdFAyaUxBM0tuaDNDdDdMZ2dERVhqNFhDUmFCWmJXRzhWd25QVDYy?=
 =?utf-8?B?eWhYb2UvQ0RGeDNyK1FVclRkS1pJdVZoT29hMyt2SklDTTlweCtZOER5VTBN?=
 =?utf-8?B?RUFkOSsreGtpdS8zWUFhajhNNmV4bDYrL09KUGZjTW96dzRxb0ptWnA1WnBO?=
 =?utf-8?B?NFd3ZTNMd3hTejBUNWpINXQ1ZjRPdE5lNWZqZWJnemhiZWV2TnRKZjhTOURM?=
 =?utf-8?B?MWt4MzkwcGI1NEZSYUt4bmp4M2NZdmJrUTM2c1hsTTlHdlpEUC9EWWxGWUpa?=
 =?utf-8?B?dTBFUUhuR1hmeEhFTFJTcjhqRkRkWVJHams2UlF5NE8yWkhCd2dUTit2ME1H?=
 =?utf-8?B?LzZPem5INFkzbkdBbEhncXIxMlBXVUl5NXRGOXdPQ2EvOG5oQ2YrYXN5RndI?=
 =?utf-8?B?R3IrVnhaWnEwNTc4WDVwOXJuRnQ4eTZQTnhYTmYxUkI4Q3dEQ2JSaUFxNmEy?=
 =?utf-8?B?RUVDL3BiTWlrYWxGem11VkpOcnpPb1dyZEVFb1AzUjNIUHVDRkUzYTc1SUpS?=
 =?utf-8?B?a0VZMkF4YTkya0RoUXAvTnRhSkQ5MUliN0JRUFl3UWhXQkpFaFRIQldBam05?=
 =?utf-8?B?MkxNTDVoQVVyc3J2ampIeDVOUkduLzlIajdhaHZXcGtCa0x2cmdRajVsVi9Y?=
 =?utf-8?B?d2d5d1FRbHZEN2d5YjBsT0NlU25xMi83YkZ0ZG4vV1JpRHJESDlNOFYrQnVM?=
 =?utf-8?B?c0R0VnMzUVUxSEV2akExTTNoVDN1dkkwekZFdU1PdTNkbXN3YjBBWVV5cTBX?=
 =?utf-8?B?QkFmdTRlYmtybFdBRHFVcTRxWW94QmJ3SFh3ZUJ0MmNxWExHTmhzMjJkK3k4?=
 =?utf-8?B?ck1VWEpFY3gweUUzS2FyVkZNZ21nQTh3M0lSOVFwS3VPaEpwYitkK0dzVHdr?=
 =?utf-8?B?ZTAra1Bud1pnWDhZUTNZQU5GVUVaeWdrUVhxSDBsYm1ybG4xWVF3YmRDVFVV?=
 =?utf-8?B?T3NGOC92OVBHbGJFbTBxczZkdFl5Z2pENzkycVk2UE4rWjhLY2UyQW5nd25J?=
 =?utf-8?B?ZUNBazBhMnBzUGVxUEhPN0hST0RzajMvT3M3djdpZFlEaHVIVHFKaTVCWUJu?=
 =?utf-8?B?cXoyenRiMFN0aXdmUHQ4NFlLT1JscCtsYmtaUlhBaXZ6SkFCWkZIalVBQVJ0?=
 =?utf-8?B?Wit5ZVl1K1NmOGdWYkkycmVmS0x1VGd2bDZmaEJSUkhtU0FqUGF2ZExwL045?=
 =?utf-8?B?ekt4V2wxK0t6VWZyaTZMWFdTSFR4ZWltZWwxNDgrL2w1NlRKZW1GUHptVzlk?=
 =?utf-8?B?OTQ4RkJUVzJHY2ZrcDZhV203bTlvTXdNaFlaQ0kyY2dRM0R0VmNURzJ3eElC?=
 =?utf-8?B?aGlNeHc2K3RMNmoxbkRYK2tDWlp2RmI5Uy9kTFhhbWxaNU1jbjV1dlJ3SU5N?=
 =?utf-8?B?ZzltTWhxSTdrbzhSeEJDd0hEVmcremNTcVpkOHdOWXh5Y01WbHcrcDZoY3Jj?=
 =?utf-8?B?QnA0MlFENXg2VkljdzZWVU5VYXp2RVE0R2xWdTVYSmNzSGZ5bW1ERzZ3aXU5?=
 =?utf-8?B?NGNYK0d0S1Q1dC96RmdnYjgxcXdub0FkRlVuVDNrSlh6TFBKTGNXM1lPVmpi?=
 =?utf-8?B?amUrQmdYQlM2ZkhORk0rODFzVm5ma0s2ZFpraTdZUnVaUnh1V1poaFl5K1ds?=
 =?utf-8?Q?dvnw+Bi/FQ+pZ/2kf8DwJgHIlRlTJeX0jFhxuRc?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a4c448-11cd-42de-86d8-08d8cd2a4035
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 18:41:02.4944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlOeZAZHxMbqquB7oectjJ5DxjHn6X3g/xyLfFqyG5yncwBs11a8BSUzZqaGMw6ZhVkrl9ZDR6LDIQgEtz9J0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.22.125; envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 9:36 PM, Vladimir Sementsov-Ogievskiy wrote:
> 09.02.2021 19:39, Vladimir Sementsov-Ogievskiy wrote:
>> 09.02.2021 17:47, Max Reitz wrote:
>>> On 09.02.21 15:10, Vladimir Sementsov-Ogievskiy wrote:
>>>> 09.02.2021 16:25, Max Reitz wrote:
>>>>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> Hi all!
>>>>>>
>>>>>> I know, I have several series waiting for a resend, but I had to
>>>>>> switch
>>>>>> to another task spawned from our customer's bug.
>>>>>>
>>>>>> Original problem: we use O_DIRECT for all vm images in our
>>>>>> product, it's
>>>>>> the policy. The only exclusion is backup target qcow2 image for
>>>>>> compressed backup, because compressed backup is extremely slow with
>>>>>> O_DIRECT (due to unaligned writes). Customer complains that backup
>>>>>> produces a lot of pagecache.
>>>>>>
>>>>>> So we can either implement some internal cache or use fadvise
>>>>>> somehow.
>>>>>> Backup has several async workes, which writes simultaneously, so
>>>>>> in both
>>>>>> ways we have to track host cluster filling (before dropping the
>>>>>> cache
>>>>>> corresponding to the cluster).  So, if we have to track anyway,
>>>>>> let's
>>>>>> try to implement the cache.
>>>>>
>>>>> I wanted to be excited here, because that sounds like it would be
>>>>> very easy to implement caching.  Like, just keep the cluster at
>>>>> free_byte_offset cached until the cluster it points to changes,
>>>>> then flush the cluster.
>>>>
>>>> The problem is that chunks are written asynchronously.. That's why
>>>> this all is not so easy.
>>>>
>>>>>
>>>>> But then I see like 900 new lines of code, and I’m much less
>>>>> excited...
>>>>>
>>>>>> Idea is simple: cache small unaligned write and flush the cluster
>>>>>> when
>>>>>> filled.
>>>>>>
>>>>>> Performance result is very good (results in a table is time of
>>>>>> compressed backup of 1000M disk filled with ones in seconds):
>>>>>
>>>>> “Filled with ones” really is an edge case, though.
>>>>
>>>> Yes, I think, all clusters are compressed to rather small chunks :)
>>>>
>>>>>
>>>>>> ---------------  -----------  -----------
>>>>>>                   backup(old)  backup(new)
>>>>>> ssd:hdd(direct)  3e+02        4.4
>>>>>>                                  -99%
>>>>>> ssd:hdd(cached)  5.7          5.4
>>>>>>                                  -5%
>>>>>> ---------------  -----------  -----------
>>>>>>
>>>>>> So, we have benefit even for cached mode! And the fastest thing is
>>>>>> O_DIRECT with new implemented cache. So, I suggest to enable the new
>>>>>> cache by default (which is done by the series).
>>>>>
>>>>> First, I’m not sure how O_DIRECT really is relevant, because I
>>>>> don’t really see the point for writing compressed images.
>>>>
>>>> compressed backup is a point
>>>
>>> (Perhaps irrelevant, but just to be clear:) I meant the point of
>>> using O_DIRECT, which one can decide to not use for backup targets
>>> (as you have done already).
>>>
>>>>> Second, I find it a bit cheating if you say there is a huge
>>>>> improvement for the no-cache case, when actually, well, you just
>>>>> added a cache.  So the no-cache case just became faster because
>>>>> there is a cache now.
>>>>
>>>> Still, performance comparison is relevant to show that O_DIRECT as
>>>> is unusable for compressed backup.
>>>
>>> (Again, perhaps irrelevant, but:) Yes, but my first point was
>>> exactly whether O_DIRECT is even relevant for writing compressed
>>> images.
>>>
>>>>> Well, I suppose I could follow that if O_DIRECT doesn’t make much
>>>>> sense for compressed images, qemu’s format drivers are free to
>>>>> introduce some caching (because technically the cache.direct
>>>>> option only applies to the protocol driver) for collecting
>>>>> compressed writes.
>>>>
>>>> Yes I thought in this way, enabling the cache by default.
>>>>
>>>>> That conclusion makes both of my complaints kind of moot.
>>>>>
>>>>> *shrug*
>>>>>
>>>>> Third, what is the real-world impact on the page cache?  You
>>>>> described that that’s the reason why you need the cache in qemu,
>>>>> because otherwise the page cache is polluted too much.  How much
>>>>> is the difference really?  (I don’t know how good the compression
>>>>> ratio is for real-world images.)
>>>>
>>>> Hm. I don't know the ratio.. Customer reported that most of RAM is
>>>> polluted by Qemu's cache, and we use O_DIRECT for everything except
>>>> for target of compressed backup.. Still the pollution may relate to
>>>> several backups and of course it is simple enough to drop the cache
>>>> after each backup. But I think that even one backup of 16T disk may
>>>> pollute RAM enough.
>>>
>>> Oh, sorry, I just realized I had a brain fart there.  I was
>>> referring to whether this series improves the page cache pollution. 
>>> But obviously it will if it allows you to re-enable O_DIRECT.
>>>
>>>>> Related to that, I remember a long time ago we had some discussion
>>>>> about letting qemu-img convert set a special cache mode for the
>>>>> target image that would make Linux drop everything before the last
>>>>> offset written (i.e., I suppose fadvise() with
>>>>> POSIX_FADV_SEQUENTIAL).  You discard that idea based on the fact
>>>>> that implementing a cache in qemu would be simple, but it isn’t,
>>>>> really.  What would the impact of POSIX_FADV_SEQUENTIAL be?  (One
>>>>> advantage of using that would be that we could reuse it for
>>>>> non-compressed images that are written by backup or qemu-img
>>>>> convert.)
>>>>
>>>> The problem is that writes are async. And therefore, not sequential.
>>>
>>> In theory, yes, but all compressed writes still goes through
>>> qcow2_alloc_bytes() right before submitting the write, so I wonder
>>> whether in practice the writes aren’t usually sufficiently
>>> sequential to make POSIX_FADV_SEQUENTIAL work fine.
>>
>> Yes, allocation is sequential. But writes are not.. Reasonable, I
>> should at least bench it. So we should set POSIX_FADV_SEQUENTIAL for
>> the whole backup target before the backup? Will try. Still, I expect
>> that my cache will show better performance anyway. Actually,
>> comparing cached (by pagecache) vs my cache we have 5.7 -> 4.4, i.e.
>> 20% faster, which is significant (still, yes, would be good to check
>> it on more real case than all-ones).
>>
>>>
>>>> So
>>>> I have to track the writes and wait until the whole cluster is
>>>> filled. It's simple use fadvise as an option to my cache: instead
>>>> of caching data and write when cluster is filled we can instead
>>>> mark cluster POSIX_FADV_DONTNEED.
>>>>
>>>>>
>>>>> (I don’t remember why that qemu-img discussion died back then.)
>>>>>
>>>>>
>>>>> Fourth, regarding the code, would it be simpler if it were a pure
>>>>> write cache?  I.e., on read, everything is flushed, so we don’t
>>>>> have to deal with that.  I don’t think there are many valid cases
>>>>> where a compressed image is both written to and read from at the
>>>>> same time. (Just asking, because I’d really want this code to be
>>>>> simpler.  I can imagine that reading from the cache is the least
>>>>> bit of complexity, but perhaps...)
>>>>>
>>>>
>>>> Hm. I really didn't want to support reads, and do it only to make
>>>> it possible to enable the cache by default.. Still read function is
>>>> really simple, and I don't think that dropping it will simplify the
>>>> code significantly.
>>>
>>> That’s too bad.
>>>
>>> So the only question I have left is what POSIX_FADV_SEQUENTIAL
>>> actually would do in practice.
>>
>> will check.
>>
>
> Checked that if I mark the whole file by FADV_SEQUENTIAL, cache is not
> removed.
>
> Test:
> [root@kvm fadvise]# cat a.c
> #define _GNU_SOURCE
> #include <fcntl.h>
> #include <unistd.h>
> #include <stdio.h>
> #include <getopt.h>
> #include <string.h>
> #include <stdbool.h>
>
> int main(int argc, char *argv[])
> {
>     int fd;
>     int i;
>     char mb[1024 * 1024];
>     int open_flags = O_RDWR | O_CREAT | O_EXCL;
>     int fadv_flags = 0;
>     int fadv_final_flags = 0;
>     int len = 1024 * 1024;
>     bool do_fsync = false;
>
>     for (i = 1; i < argc - 1; i++) {
>         const char *arg = argv[i];
>
>         if (!strcmp(arg, "direct")) {
>             open_flags |= O_DIRECT;
>         } else if (!strcmp(arg, "seq")) {
>             fadv_flags = POSIX_FADV_SEQUENTIAL;
>         } else if (!strcmp(arg, "dontneed")) {
>             fadv_flags = POSIX_FADV_DONTNEED;
>         } else if (!strcmp(arg, "final-dontneed")) {
>             fadv_final_flags = POSIX_FADV_DONTNEED;
>         } else if (!strcmp(arg, "fsync")) {
>             do_fsync = true;
>         } else {
>             fprintf(stderr, "unknown: %s\n", arg);
>             return 1;
>         }
>     }
>
>     fd = open(argv[argc - 1], open_flags);
>
>     if (fd < 0) {
>         fprintf(stderr, "failed to open\n");
>         return 1;
>     }
>
>     if (fadv_flags) {
>         posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_flags);
>     }
>     for (i = 0; i < 100; i++) {
>         write(fd, mb, len);
>     }
>     if (fadv_final_flags) {
>         posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_final_flags);
>     }
>     if (do_fsync) {
>         fsync(fd);
>     }
>
>     close(fd);
> }
>
>
>
> [root@kvm fadvise]# gcc a.c
> [root@kvm fadvise]# rm -f x; ./a.out seq x; fincore x
>   RES PAGES  SIZE FILE
>  100M 25600  100M x
> [root@kvm fadvise]# rm -f x; ./a.out dontneed x; fincore x
>   RES PAGES  SIZE FILE
>  100M 25600  100M x
> [root@kvm fadvise]# rm -f x; ./a.out final-dontneed x; fincore x
>   RES PAGES  SIZE FILE
>   36M  9216  100M x
> [root@kvm fadvise]# rm -f x; ./a.out seq fsync x; fincore x
>   RES PAGES  SIZE FILE
>  100M 25600  100M x
> [root@kvm fadvise]# rm -f x; ./a.out dontneed fsync x; fincore x
>   RES PAGES  SIZE FILE
>  100M 25600  100M x
> [root@kvm fadvise]# rm -f x; ./a.out final-dontneed fsync x; fincore x
>   RES PAGES  SIZE FILE
>   36M  9216  100M x
> [root@kvm fadvise]# rm -f x; ./a.out direct x; fincore x
> RES PAGES SIZE FILE
>  0B     0   0B x
>
>
>
> Backup-generated pagecache is a formal trash, it will be never used.
> And it's bad that it can displace another good pagecache. So the best
> thing for backup is direct mode + proposed cache.
>
>
I think that the original intention of Max is about POSIX_FADV_DONTNEED
One should call this fadvise for just fully written cluster. Though this is
a bit buggy and from performance point of view will be slower.

This call could be slow and thus it should be created as delegate to
co-routine. We have though on this, but the amount of work to
implement even if seems lower, is not really lower and the result
would not be as great.

Den

