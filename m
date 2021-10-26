Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DFF43ADFB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:28:53 +0200 (CEST)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHpE-0008W2-B5
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mfHH2-0002T1-DQ; Tue, 26 Oct 2021 03:53:33 -0400
Received: from mail-eopbgr10130.outbound.protection.outlook.com
 ([40.107.1.130]:28119 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mfHGs-0000xe-8j; Tue, 26 Oct 2021 03:53:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeeHJdt1j7vEa0MEX48zFjVETZGlz7YfeZFN0BXXA3Gl+sN4TmEF0rV7YcFXfCYTO/IPUHLk5R0U9mJzgyDv7Pw2RaRnyMpb0r9bB6jvZWO0kpFq1h+6X1QuSkWuyjjfDmsLXrzhgpRnRRTFwisoRY5MGq9cIoj215oS+b/TEYNeMR1uAc0ojG8RId2PKp49yWYdWQGAHFdIeQORAIsArXjg9oh4K23CWqzORrqmbOl1/jYMPfc7S5FZXObCColPuyZaVoYOBw3t0hSq9yfu6/N9nt3b04mpbgUX9/LIkX8vDvZPHd4LERTvW+WOUX0bO3RIzKL6e5o3lyhMWtF7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrN5QBs6CZiLvbcN5UrJZnCsYdsuQ+G2iT2KR2gzAsI=;
 b=jJ3qU/WH/NqNd4qnrG/bkr7y2ZCvLccKrC0fDewRQlZDu03i0oeHNzxYtkFaOWvGHYhHt8LWevMSZg5A4DKXYuZaUDviEuNMUu4H4tJINwflynkrT1ASedi1OUmUgHrPm3HjZzT7kvqUBLlTlaA3qAGD2nIzo7V7sb9691gKGAFF4mV8TVHUou2wzQLSFhohZBV3Es/mtGRRs/UcXvAHM2jSlSPsOkMCJGh/MrPKqXv+NHLFe3qJ3D5rsxnuGBWvHgIW7m+XDsRLzD3ElBbqLjg+C39A1/94zPtzLCadF77fMnnUsJV+rvLaZ1xPmkLCqzXS+drJB/iBJg0bMlDUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrN5QBs6CZiLvbcN5UrJZnCsYdsuQ+G2iT2KR2gzAsI=;
 b=BNEQk/dIdXBQSoJ4PFElEsy6iN8IK61YLIzWnHm5c2GKAzhiTqT7Ew1kI7I6l8+iMJ6KODY8M1lv8SXr/3CCECIubL+itpS3c2EJbRjcvktCv3hY8Wjn+FvAOXVuNBXkA9NjKFPVlr85RCPkerwJqeUcq0TMDA5XW72P42b7aXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 07:53:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 07:53:13 +0000
Message-ID: <e8d99b0a-f46d-1d9d-11a3-5c04de1c3904@virtuozzo.com>
Date: Tue, 26 Oct 2021 10:53:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/4] qemu-img: implement compare --stat
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, nsoffer@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, den@openvz.org,
 nikita.lapshin@virtuozzo.com
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
 <20211021101236.1144824-2-vsementsov@virtuozzo.com>
 <f9559937-f077-f8d5-4a5a-2c583c2131f5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <f9559937-f077-f8d5-4a5a-2c583c2131f5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0036.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.244) by
 AM6P194CA0036.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 07:53:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f294e805-d992-42d5-a509-08d99855a902
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-Microsoft-Antispam-PRVS: <AS8PR08MB63744B823F39CBFEF767CFE7C1849@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mfmb+LaJ2xLONOkpe0bIsX+RAvShmWD+nwFmHFm6nbvm2xYu+jmDFsb4gFkqOpYrfBi53ziSjdi1PYUTcOg3lhhVseDzfgnUuhsuCBWqqgEs0bQnf0HVmh73ylztMrTyZNgmOzwK+EZ1y3IRTUdi/RD5GDTvAhIJhBzWJwir98t2ePVtFPS3/ypHUURW1FdOSJeVx5mhGIVlJ/uM83iQsfuj9dI+JNn31paN5Zt/7pZHTI6vz4J3ExvN1lW5kgYULKgKewJJnuGKOSc0QQ/gaV2Neafba7E8/c8w6N0nT243Ybbpkl0zkF0cdqAeCJu6GATuV0S0GU19wlouTrLt3C5QNiD9KBaM7lC7d3Dr/tWR1Z375RllDnC11QMFj4GvrlDyz6d3zDtB92QZ1tARTFS5xWGS0h8jM7Xt2jPFIh7Mru8gEFY4aJJFjeIDKUB3mLJN0r6xDed7k7Zz7STnKjCpQghNevaVxT0PPeQf0S4s648y5tbjRAmvvIfCeMpBj0/4JIzuTwz0+ihBa/Of00Q+qFejpwdV/NTvjkaw4XAczveQVV/swkAwglTPnFZShoS8VAYih+ikZ5t+1ZdRZIWjTykkoKlPeL4arFtseobLzH6D+yQ7LijclJR2ohnYLOzNCq9pWH4cW+7RSARnMpE9kmOWLC1KkHwjjOp3eQGP0aIAJYYasEHeFF6ZwwuE2YtydxqjaX0dfGwpFlQTYXTpcqpUkR07Yvy2Lvowj+PxbcKeYyS1PNCeQIgrgphwJgipA+bshVwk967ugzgZ7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(66476007)(66556008)(66946007)(53546011)(8676002)(8936002)(107886003)(508600001)(2616005)(186003)(956004)(4326008)(38350700002)(6486002)(38100700002)(2906002)(16576012)(316002)(5660300002)(83380400001)(86362001)(31696002)(31686004)(52116002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3FHSmZDT1JqU2dDK0h4c1gxWUZ6cUFVYWk3anBRYm83N2M0cjhXYlJFNzFz?=
 =?utf-8?B?YldIcjJmRWQyT01hOUFkaC85Q2lsbGp1Y3JxcEFFYmVOOVZSNU9vR1M4dzIy?=
 =?utf-8?B?VHp6bStQMUo3YVhzTWxYRnp5YktLWTV3VUdGNUd0a1VtekNzSlI0TVVPQ0g3?=
 =?utf-8?B?TGJFRkYweDBMS2hidUdnOXhDUmVWSDE4UDBjcG1Fbk1SVnFyZEdQemtuT3Zh?=
 =?utf-8?B?cmFqZnZpckZ3QU9IZ0FZbG1Uek81bkpWaXlFKzZQbWVRbVdaUWRYR2x3Ukhj?=
 =?utf-8?B?TjBOaXJEdE0yRFl6KytaNCtjTVg3L3RzRDRqSkJrQWlUaEllcmJJYWR4My96?=
 =?utf-8?B?K2FmSjl0OXhVM3c5R2k4M1VXRHg2NXlUcllZRHFuY0oyZUtPM0UrV3lUMk4w?=
 =?utf-8?B?N2pSckRwRUtxbFQxUjRucmEzYklCTTJjZWw0SnJNUDNXTHlXZE9WeFFUaW5l?=
 =?utf-8?B?YUJESERUSTNvb2FmYitQeFdIbVhiM0NqUVovUzZEZzYrOC9Xdmk4Umg0U2ZG?=
 =?utf-8?B?WEh0aEJCSVZ2SmlYbUprMGZsMWxHQjU1eXI3czgrMXp4M1JrUGhoZnlMQ2hB?=
 =?utf-8?B?UmlBSW51Z0VVRi9RcFYwa01zYzN4LzF3ZjNLNy9wUm1PRDg0WlhwTVlDait1?=
 =?utf-8?B?VHBxR1BBWnhqQnVWMVFqQk1SYVhZZTU0cFNsSy8rbDFiK0R5VUNvZlNEU1d5?=
 =?utf-8?B?dGtYT0dKNi9MNTlndVQxVUsxamRDQnhndFo3YUZxNldQbDZ5aitPVUtWMmlt?=
 =?utf-8?B?NFNvdkdFR1VaN0VWT1QxSnBrZCtDelFGcjdqcTc5TXg4c3JyMHdVYlI2MHIx?=
 =?utf-8?B?T2lFYzg0SVNHNDVUY1RXVVBRMm9UTTRHVTNPZkJyeUhXVHZlRXM5ZEV3RTVk?=
 =?utf-8?B?OWhNY3ZhZFZra0VSb09JYUdpSit4Q1FmZkVlbXFaczhta2RiWGJ0QW93YVpn?=
 =?utf-8?B?RCswZUxtQ25naWZkOGdkUlpPZjh1VHlHb1JBc0cydmFUbyt2VGI0TTVuSFZC?=
 =?utf-8?B?KzNwbi9YSWZVY1BPNlBvSjZNc0pSK28wWEh1MUxCR2lvSTg2MU1ac1N2clpY?=
 =?utf-8?B?eUNZTW01aWROYitsaVhZTElVam5jUEtXaDhmOUdKSGt1YzBtdERCQ2hDZG1K?=
 =?utf-8?B?d0R4cWdEaEozT293N2xjbUlIVkZEOGdrUjZNVDNyNjdjYXFMaVFPN3p6dnc1?=
 =?utf-8?B?UkJGVEh2Z0FQc2ZRSkRObm9wcWMzd2xvSDMwQWNlSWhZcFZWNmNMNTdxa2Fh?=
 =?utf-8?B?TGtGU3pvb2FLWGxiUit0bUdpMDhYUlc3a3JMTWhxbVBhTW9sSms2QVRGR0pa?=
 =?utf-8?B?NVJrSlAwRS8yMnhYT0ZOdHowRStGMXBRQWRCZFUzOTQ3dUdRUnZBU1ZZa1Nu?=
 =?utf-8?B?amdjR1MrK005QnhxQ1VsaGRSQWtWSUQ3QzdyeWhDb3IzNlNqSlprZUdYdUUx?=
 =?utf-8?B?WG5ZUWdObGk2NXl1cWExWUg1d0ttTjBHUmhOQ1QzV2F3OTdXSTI4RjZIaC9J?=
 =?utf-8?B?ZlFBZUZlYjVBVFNlTFNOdUZiaUx2RHYwcVZmSnhQSWhrMEpOZ3lQVjAyL1I2?=
 =?utf-8?B?YjZFRXZEUVlUNjExa3ljS2h3SkFpMVNWQ1NMbWtxMVBOdi9IcWdZMVBqWHRZ?=
 =?utf-8?B?QTZpdjZ1Y0lRQzc4cncrbmRxQnFWTmJoZmdMTU1rVEkvM2t4WFBab1JLY213?=
 =?utf-8?B?TFM2M3MvN1o2Y09VdTNKVG1RYWE2QThLU09XOFNoSFEwbG41WDJPZjAvck04?=
 =?utf-8?B?NW9keExEUjU3b0xLbjYvTzZDdzlJa29kUmR0YUVCdi9nNFdib3BpNmU1ZVlT?=
 =?utf-8?B?UWx3RThsR3FpcEZFQ1U5Y0l5QjVpWXVsMGtRNlNqRThQRXU4clFzd0IweHZ0?=
 =?utf-8?B?RGJqTFhUTEhFa20rQW02WnBoVGVYcFNJaTU5M21DbnpLb25QbDlyZWVoYnQ2?=
 =?utf-8?B?d2lGVGtwdHBuNXZ2Y2FHRFF6cEl1NWRranZ3cjF0emJRbkpHYUhxR2E3aXdB?=
 =?utf-8?B?OXhKOXBLWG42YnhsaE9aRmR3U3NHZmpkVG1DQ1lXWUkwYjRkb3RZNjBETTRQ?=
 =?utf-8?B?WUFQcnZ3eHF3aXZhL1EvOVYzR2ZBaXVLQVJ4ZUdvMHczQ3p4TVRVbzA4Vm5Z?=
 =?utf-8?B?cEFGZU1UcVVlRDVHYnZtQVlHeVcwNXoxNjc2VG9BN2xZWmliTXZEbmVxSzNS?=
 =?utf-8?B?UTdUTUdoVDJ3bjhabUFsTVJXTDFJb1lRQjRhNnNJVWRIZ3BIOGdwS2hKK09S?=
 =?utf-8?B?aHNjM0I2dC9udUZsRjZvMlFrM2F3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f294e805-d992-42d5-a509-08d99855a902
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 07:53:12.9340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTGRRQe84yH8KhIQD4A8mvCIUw3wJTgf2nvocmesubxku8brl6HbMUMFDRcPF0HhuHmv9ZRfhPT5tF9MsqQnGN/IMV6/v0uL9rKKnqqJ8ZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.1.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.037,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.10.2021 19:40, Hanna Reitz wrote:
> On 21.10.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
>> With new option qemu-img compare will not stop at first mismatch, but
>> instead calculate statistics: how many clusters with different data,
>> how many clusters with equal data, how many clusters were unallocated
>> but become data and so on.
>>
>> We compare images chunk by chunk. Chunk size depends on what
>> block_status returns for both images. It may return less than cluster
>> (remember about qcow2 subclusters), it may return more than cluster (if
>> several consecutive clusters share same status). Finally images may
>> have different cluster sizes. This all leads to ambiguity in how to
>> finally compare the data.
>>
>> What we can say for sure is that, when we compare two qcow2 images with
>> same cluster size, we should compare clusters with data separately.
>> Otherwise, if we for example compare 10 consecutive clusters of data
>> where only one byte differs we'll report 10 different clusters.
>> Expected result in this case is 1 different cluster and 9 equal ones.
>>
>> So, to serve this case and just to have some defined rule let's do the
>> following:
>>
>> 1. Select some block-size for compare procedure. In this commit it must
>>     be specified by user, next commit will add some automatic logic and
>>     make --block-size optional.
>>
>> 2. Go chunk-by-chunk using block_status as we do now with only one
>>     differency:
>>     If block_status() returns DATA region that intersects block-size
>>     aligned boundary, crop this region at this boundary.
>>
>> This way it's still possible to compare less than cluster and report
>> subcluster-level accuracy, but we newer compare more than one cluster
>> of data.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/tools/qemu-img.rst |  18 +++-
>>   qemu-img.c              | 206 +++++++++++++++++++++++++++++++++++++---
>>   qemu-img-cmds.hx        |   4 +-
>>   3 files changed, 212 insertions(+), 16 deletions(-)
> 
> Looks good to me overall!  Just some technical comments below.
> 
>> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>> index d58980aef8..21164253d4 100644
>> --- a/docs/tools/qemu-img.rst
>> +++ b/docs/tools/qemu-img.rst
>> @@ -159,6 +159,18 @@ Parameters to compare subcommand:
>>     Strict mode - fail on different image size or sector allocation
>> +.. option:: --stat
>> +
>> +  Instead of exit on first mismatch compare the whole images and print
>> +  statistics on amount of different pairs of clusters, based on their
>> +  block-status and are they equal or not.
> 
> I’d phrase this as:
> 
> Instead of exiting on the first mismatch, compare the whole images and print statistics on how much they differ in terms of block status (i.e. are blocks allocated or not, do they contain data, are they marked as containing only zeroes) and block content (a block of data that contains only zero still has the same content as a marked-zero block).

For me the rest starting from "and block content" sounds unclear, seems doesn't add any information to previous (i.e. are blocks allocated ...)

> 
>> +
>> +.. option:: --block-size BLOCK_SIZE
>> +
>> +  Block size for comparing with ``--stat``. This doesn't guarantee exact
>> +  size of comparing chunks, but that guarantee that data chunks being
>> +  compared will never cross aligned block-size boundary.
> 
> I’d do just some minor tweaks to the second sentence:
> 
> This doesn't guarantee an exact size for comparing chunks, but it does guarantee that those chunks will never cross a block-size-aligned boundary.

OK, sounds good

> 
>> +
>>   Parameters to convert subcommand:
>>   .. program:: qemu-img-convert
> 
> [...]
> 
>> diff --git a/qemu-img.c b/qemu-img.c
>> index f036a1d428..79a0589167 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -83,6 +83,8 @@ enum {
>>       OPTION_BITMAPS = 275,
>>       OPTION_FORCE = 276,
>>       OPTION_SKIP_BROKEN = 277,
>> +    OPTION_STAT = 277,
> 
> That doesn’t look ideal, I believe `OPTION_STAT` should have a different value than `OPTION_SKIP_BROKEN`.  (I guess a rebase is to blame?)

Oops

> 
>> +    OPTION_BLOCK_SIZE = 278,
>>   };
>>   typedef enum OutputFormat {
>> @@ -1304,6 +1306,107 @@ static int check_empty_sectors(BlockBackend *blk, int64_t offset,
>>       return 0;
>>   }
>> +#define IMG_CMP_STATUS_MASK (BDRV_BLOCK_DATA | BDRV_BLOCK_ZERO | \
>> +                             BDRV_BLOCK_ALLOCATED)
>> +#define IMG_CMP_STATUS_MAX (IMG_CMP_STATUS_MASK | BDRV_BLOCK_EOF)
>> +
>> +typedef struct ImgCmpStat {
>> +    /* stat: [ret: 0 is equal, 1 is not][status1][status2] -> n_bytes */
>> +    uint64_t stat[2][IMG_CMP_STATUS_MAX + 1][IMG_CMP_STATUS_MAX + 1];
> 
> `IMG_CMP_STATUS_MAX` isn’t packed tightly because it only has four bits set (0x33).  That in itself isn’t a problem, but it means that `IMG_CMP_STATUS_MAX + 1` is 52, and so this array’s size is 52 * 52 * 2 * sizeof(uint64_t) = 43264.  Again, that isn’t a problem in itself (although it is a bit sad that this could fit into 16 * 16 * 2 * 8 = 4 kB), but in `img_compare()` [1], you put this structure on the stack, and I believe it’s too big for that.

Hmm. May be, it's better just use GHashTables and don't bother with these sparse arrays

> 
>> +} ImgCmpStat;
> 
> [...]
> 
>> +static void cmp_stat_print_agenda(void)
>> +{
>> +    printf("Compare stats:\n"
>> +           "Agenda\n"
> 
> I’m more used to the term “Key” for this, but my experience is mostly limited to the git-backport-diff output, so it’s not that strong.

I don't care, "key" is OK for me.

> 
>> +           "D: DATA\n"
>> +           "Z: ZERO\n"
>> +           "A: ALLOCATED\n"
>> +           "E: after end of file\n\n");
>> +}
> 
> [...]
> 
>> @@ -1331,6 +1436,9 @@ static int img_compare(int argc, char **argv)
>>       uint64_t progress_base;
>>       bool image_opts = false;
>>       bool force_share = false;
>> +    ImgCmpStat stat = {0};
> 
> [1] (Here is where `ImgCmpStat` goes on the stack, which it shouldn’t, considering it’s over 40 kB in size.)
> 
>> +    bool do_stat;
>> +    int64_t block_size = 0;
>>       cache = BDRV_DEFAULT_CACHE;
>>       for (;;) {
> 
> [...]
> 
>> @@ -1395,6 +1505,15 @@ static int img_compare(int argc, char **argv)
>>           case OPTION_IMAGE_OPTS:
>>               image_opts = true;
>>               break;
>> +        case OPTION_STAT:
>> +            do_stat = true;
>> +            break;
>> +        case OPTION_BLOCK_SIZE:
>> +            block_size = cvtnum_full("block size", optarg, 1, INT64_MAX);
>> +            if (block_size < 0) {
>> +                exit(EXIT_SUCCESS);
> 
> Shouldn’t this be 2 instead of `EXIT_SUCCESS`?

Oops, right, it should be an error

> 
> (Above for --object we use `EXIT_SUCCESS`, but only for the case where a help text was printed.  When parsing fails, we exit with 2, which is documented as the error code (“>1”).)
> 
>> +            }
>> +            break;
>>           }
>>       }
>> @@ -1410,6 +1529,20 @@ static int img_compare(int argc, char **argv)
>>       filename1 = argv[optind++];
>>       filename2 = argv[optind++];
>> +    if (!do_stat && block_size) {
>> +        error_report("--block-size can be used only together with --stat");
>> +        ret = 1;
> 
> 2 is the error code, 1 means “success, but images differ”.

Will fix

> 
>> +        goto out;
> 
> The `out` label frees `buf1` and `buf2`, and unrefs `blk1` and `blk2`. My gcc complains that `blk1` and `blk2` have not been initialized by this point, though.  I believe we should go to `out3` here.
> 
>> +    }
>> +
>> +    if (do_stat && !block_size) {
>> +        /* TODO: make block-size optional */
>> +        error_report("You must specify --block-size together with --stat");
>> +        ret = 1;
>> +        goto out;
> 
> Same here.
> 
>> +    }
>> +
>> +
>>       /* Initialize before goto out */
>>       qemu_progress_init(progress, 2.0);
> 
> [...]
> 
>> @@ -1486,11 +1623,15 @@ static int img_compare(int argc, char **argv)
>>               goto out;
>>           }
>>           allocated2 = status2 & BDRV_BLOCK_ALLOCATED;
>> +        if (do_stat && (status2 & BDRV_BLOCK_DATA)) {
>> +            /* Don't compare cross-block data */
>> +            pnum2 = MIN(block_end, offset + pnum2) - offset;
>> +        }
>>           assert(pnum1 && pnum2);
>>           chunk = MIN(pnum1, pnum2);
>> -        if (strict) {
>> +        if (strict && !do_stat) {
> 
> Question is, do we want to allow strict mode together with --stat at all?  I think I’d prefer making it an outright error.
> 

Hmm. I think, I tend to agree, will do.

> 
>>               if (status1 != status2) {
>>                   ret = 1;
>>                   qprintf(quiet, "Strict mode: Offset %" PRId64
> 


Thanks!

-- 
Best regards,
Vladimir

