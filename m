Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3631515D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:16:36 +0100 (CET)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Tof-0007p4-JP
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9TjR-0003Ou-AK; Tue, 09 Feb 2021 09:11:13 -0500
Received: from mail-eopbgr80100.outbound.protection.outlook.com
 ([40.107.8.100]:34790 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9TjM-0004hS-Qy; Tue, 09 Feb 2021 09:11:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDJV8+4R3J34b7bX22tGS/NXcED65I3jIfZQXzTRXBUj/6d/j3kPeRCo8HxfX/Vrq9RJXiOCyLfNchQy2E/MyJ/DAd9uj8Ut8RGremEU71k1A2g0UMdC2VokQcOVLLurDM5ly+sL7L//jcpkaBkus+QgQ54LkyHW2D1+DTtHdSyCqGVCDTbaeseXGkgLifYyED6swpuiS5MZ8HsPe4FPLMT9W6BQbf0KJjKViluaB4TVKGKltMcxRVjfqgWHmRy0H2aN/Fe8O0z5EH1UCLfKLb7wfHnstiWCTIvX8rrZ1Ts4CKuevNu69GHPhbzMd2g4p0Ptx5zSm/fCcumMF6qNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfqgWev6m75h1ZT7rfu7PH5SsCv3qL2eo2ijoqkKnEE=;
 b=ebmoy8eZuJmqyIs+U3bE1tdD5WrYMkyI6NgTf4i/T/VZg5nrj/J4Wsr8c6U4ZfVt0lkJrUlX0ip7K4uFv8lHotNcsHo1ZOwJOig32E9zebhGjoWjvaNGYJTIjkyAGVl2XM2nThCfGKaB/daNmMelgEJab9gm9lfbs7qx3zL92pr8T2ZGjXhYBDlgov6twfujLycgEoE2vlXLdx4yIXqnxpobbak1C4m+lhPrxY+J2u9l/tua8YVoBIZkOdrHh0jgjZcncyeR6Og3wfffxxAtyrUdfuplOGf11x1zaay58b5aYlgucmOAwOlIzTMgzItPfpNiYVynu3eyPcuUQplErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfqgWev6m75h1ZT7rfu7PH5SsCv3qL2eo2ijoqkKnEE=;
 b=EuyuLq5tjtmVrXiXX/aKLN8ZRkp7TtVw6aO9XNgbXyHSOSm5vs49oQVwaGSsBKKzSHMkqZD5mg09Fj8WybW7uwzUy701mdvfSCnzHPvvxRoUeJAlK7mw5ku0qva6ypa0CmJLqESg9HNrjeNtWoWRIdim+Qqtfn7aaq1SZ7f+/cM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Tue, 9 Feb
 2021 14:10:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 14:10:59 +0000
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <745c4617-01bc-c888-b6da-95a705cf0c1e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0669a5e8-bcff-ffb1-23b0-0af9ce20ad27@virtuozzo.com>
Date: Tue, 9 Feb 2021 17:10:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <745c4617-01bc-c888-b6da-95a705cf0c1e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR07CA0026.eurprd07.prod.outlook.com (2603:10a6:208:ac::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Tue, 9 Feb 2021 14:10:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0312be78-ef21-4cd3-0401-08d8cd04862c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6102:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61026590879C06BB8B0EF00CC18E9@AS8PR08MB6102.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QKQ1ACgNyxuY/83bBnv24A4AQawBOn9q3gAC8he7Pkc2DJp7eDgNtK3KOA+lMb85NWsYlugARI7dK8v2k20LeQWgHBxQZpoa3dFDH0dYm0gdNf+6EnWdNy/EmAUWZcttqnO/coxJdVHS6HrA/D0Hyw8pjQMfrrcJ7JxyIJYuCL4cDl/im5+NpYdul/oWH2W8QWLiR6xKbSG8Srtj8ubT+FTxdmFXD+5cxyS4Lt0RvpNSX3t/5dvbwV8jOuf2WPO/53Q3WcBZ2VlkEBzX3NhZn6ybu8qVRYo7gMewYkBm6+AdgWCZ79gMnCcCnk45R46IaCsxxCB3a8SGzhJ4LxSxzw6Ytv+5ub//CvvS7DLh7ZNewcWc/j/ot/8rG3yi3jjeryp0BpUNMhVsATvsYOO5m8pkg9YHsM+0b9IdknKlIIKNfUcmmGbgjlb5d2Xx9NNLvyMR4eLqckM9WCbLx8hvRPDREODfmhMzZ0glA2EZNkH8sOUjhPSr85gdzHuVmntyniWQ3ZLNn4dsTaj2HZdv9vjuLFTLbIZEltvb0p+VrHMJaEOpV0yk40AkQdVIqYiUmm6B/Klqk1oYEW3TuHkWzncTaEMo7NwgdwlBcs1EIpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(366004)(136003)(376002)(346002)(2616005)(5660300002)(107886003)(16526019)(6486002)(52116002)(316002)(53546011)(2906002)(956004)(86362001)(8676002)(4326008)(36756003)(8936002)(16576012)(66946007)(31696002)(186003)(66556008)(66476007)(478600001)(31686004)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTRNRy9FYkw4TU9nZklQa0lTeTcwQks1eEp1bEgyUFpFQzg2UGlSK2FkTnBa?=
 =?utf-8?B?REVTN0p5QU96ZGFrVE0xVFFHanB6aUU2WGd2Sk1CMUxTZUp5dUw1R2pJaWlI?=
 =?utf-8?B?WE9NUEYwMGkzQTVGbk5qS2xkaVNWQUlON2pJY0h1MWxZOE9iaXpuN1g2aU11?=
 =?utf-8?B?M3pWOVk3S2tKY2djeWVRK3F0MFRJdTZ5V09aUkZXN1hsWlp1UXJKcVNxcEFr?=
 =?utf-8?B?TmtrRVF5NmdzSkpOUldaTDJ6aE9jQ20zMVgrNk1KRzZXbTlEVXd0V254MEtt?=
 =?utf-8?B?Qzd3VVFIalRrOXdFa1FmVW5hTncyUWNsYmEraFdwNVQ2QTZhRXBLSEFoT0VZ?=
 =?utf-8?B?VEkzcGEzdndLZi8vckxEZDZCRXBPUUdEekQ5YUtvUHVsajl1WkNZdW1JeWFG?=
 =?utf-8?B?NEd1TzNPR09KM2FFMUpDcnpXVExRSHJURDlGSDg3cXZOOUtxWmFwZDJON2wz?=
 =?utf-8?B?UzM4MmtFMW0wUzZYZ3ZDVUhRTEp1dUNnRTBYRjFMb3F6OXpZczV0YUdibU9M?=
 =?utf-8?B?Wm56d2l4TDZvNkcvZWs1c2JYL2toSUtZSVZmRjRZdDZ0dHNuV293S2NhNEVE?=
 =?utf-8?B?M2laUEhobmQyWW4rcGJrdGFCVTNvTXV4RFhTSzJNNnRuZnZrRllSc2I2ZWlv?=
 =?utf-8?B?bWRVaTh3a0lLSnVPOXVvbDdmUVhZb0tITnowOUpLTFB1SjNheVhna0toQjgy?=
 =?utf-8?B?aTJVMzNFUkdmRzBydTAzanY2SVBEeWZkOUEzVGsxbFhrdEZlVDl6QUgwNEUy?=
 =?utf-8?B?VHYzcGc5ZGtXdU9wVEs0ODdHQWhtVVIvZzhSQlFRcUxnQ1Vaem9jRFVOR3Vk?=
 =?utf-8?B?WC8wMXpNa09pOUZWajhhaWswOWwvcEZtRU1yYjZJaktjLzRUbmVKYTQxdm5z?=
 =?utf-8?B?a3BiWGpsWW5vNWVab3h6YUZCR2tjL2FOQm5jV3F1U2gwMExxN3lGUVZLMkEz?=
 =?utf-8?B?dkh1bmg4RmNWRTNBUXlGcWlLaUFZZGhNRU15c2tuS0h6eHUvVC9oRmpoTG1F?=
 =?utf-8?B?SEdtQ0RPM2M0ZFdOUi9CV0tUYW9oSFFYUTJ3b3JSeEVlcmkxdzZ5dkhoS2p4?=
 =?utf-8?B?MTNoRG8wMWR1T01OK0FhRWdua2tWTUZBUXR1VXlKYXVpSnJBNUoxc3JZMExB?=
 =?utf-8?B?QWNsZmo5S1ZRdGRXNzgzRUFldTFQUlROTU1odVcvQVl3MWQ2NmNNWDBhemNw?=
 =?utf-8?B?TzFkbHdvREkzSlB6R1FjZlVxY2ZtUlZUbjBhalJKRkgxWUo4bHZCbFRzVlJJ?=
 =?utf-8?B?WG9rOTFveXhLcUdCMjhYcjNKNHhOL25TdE9NbnE3UWY0ZGE1WloyRmdpNzFz?=
 =?utf-8?B?azdqNFQ0enpSSDEyZnppZHNJVU9oK0dtYlQvSUgrMW5NMEt3UUw5NmhqdWxO?=
 =?utf-8?B?b1Y2TFVVYWd2ak9LUkxZUkYvTDVVRll0VUNicUV4Tnl0eGw4RlhtVFY2bUZu?=
 =?utf-8?B?dDlTUmp1NFRTMjV4eGZvSlVNRVdrUUI1ODd0MERBWHhJMVNsaW5MOU5yQUYy?=
 =?utf-8?B?Q2IwMDRlT25xSjFxNHQvUjhaNjVETVVnV2ZmMlRkdE5PcUsydzdqeVI5ajQ0?=
 =?utf-8?B?cDRrdmE5dEp6ckx4cS9ZWFRLRVFHeDRNbGdDdTlqNE5MNE4rTG5qUGVKWFkr?=
 =?utf-8?B?akY4bmsxVVgyWUlJcnc1R0Y3ak5RcEczMVpVYU16OTA5QVBYMzExb0l0R3dR?=
 =?utf-8?B?ZHVpaDJqQmZGSi8xdWhEYWgxUTZBWW9PRmhRWExUN3lDbENpbXNnLzZ1aGhR?=
 =?utf-8?Q?b8pO7XFIDgTg/013XA6fpzmCYNyJZC3AUV7NowT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0312be78-ef21-4cd3-0401-08d8cd04862c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:10:58.9600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mqMo1KMyaoxaKu922aIttRcOrteI6BS1NswodPj7RULeFW9ZgHW0e5gowDtjDy7Ys2mqGt8hIqVRTW9kkVrIg00rrICoTIH4Y70H+06ZsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
Received-SPF: pass client-ip=40.107.8.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001,
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

09.02.2021 16:25, Max Reitz wrote:
> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> I know, I have several series waiting for a resend, but I had to switch
>> to another task spawned from our customer's bug.
>>
>> Original problem: we use O_DIRECT for all vm images in our product, it's
>> the policy. The only exclusion is backup target qcow2 image for
>> compressed backup, because compressed backup is extremely slow with
>> O_DIRECT (due to unaligned writes). Customer complains that backup
>> produces a lot of pagecache.
>>
>> So we can either implement some internal cache or use fadvise somehow.
>> Backup has several async workes, which writes simultaneously, so in both
>> ways we have to track host cluster filling (before dropping the cache
>> corresponding to the cluster).  So, if we have to track anyway, let's
>> try to implement the cache.
> 
> I wanted to be excited here, because that sounds like it would be very easy to implement caching.  Like, just keep the cluster at free_byte_offset cached until the cluster it points to changes, then flush the cluster.

The problem is that chunks are written asynchronously.. That's why this all is not so easy.

> 
> But then I see like 900 new lines of code, and I’m much less excited...
> 
>> Idea is simple: cache small unaligned write and flush the cluster when
>> filled.
>>
>> Performance result is very good (results in a table is time of
>> compressed backup of 1000M disk filled with ones in seconds):
> 
> “Filled with ones” really is an edge case, though.

Yes, I think, all clusters are compressed to rather small chunks :)

> 
>> ---------------  -----------  -----------
>>                   backup(old)  backup(new)
>> ssd:hdd(direct)  3e+02        4.4
>>                                  -99%
>> ssd:hdd(cached)  5.7          5.4
>>                                  -5%
>> ---------------  -----------  -----------
>>
>> So, we have benefit even for cached mode! And the fastest thing is
>> O_DIRECT with new implemented cache. So, I suggest to enable the new
>> cache by default (which is done by the series).
> 
> First, I’m not sure how O_DIRECT really is relevant, because I don’t really see the point for writing compressed images.

compressed backup is a point

> 
> Second, I find it a bit cheating if you say there is a huge improvement for the no-cache case, when actually, well, you just added a cache.  So the no-cache case just became faster because there is a cache now.

Still, performance comparison is relevant to show that O_DIRECT as is unusable for compressed backup.

> 
> Well, I suppose I could follow that if O_DIRECT doesn’t make much sense for compressed images, qemu’s format drivers are free to introduce some caching (because technically the cache.direct option only applies to the protocol driver) for collecting compressed writes.

Yes I thought in this way, enabling the cache by default.

> That conclusion makes both of my complaints kind of moot.
> 
> *shrug*
> 
> Third, what is the real-world impact on the page cache?  You described that that’s the reason why you need the cache in qemu, because otherwise the page cache is polluted too much.  How much is the difference really?  (I don’t know how good the compression ratio is for real-world images.)

Hm. I don't know the ratio.. Customer reported that most of RAM is polluted by Qemu's cache, and we use O_DIRECT for everything except for target of compressed backup.. Still the pollution may relate to several backups and of course it is simple enough to drop the cache after each backup. But I think that even one backup of 16T disk may pollute RAM enough.

> 
> Related to that, I remember a long time ago we had some discussion about letting qemu-img convert set a special cache mode for the target image that would make Linux drop everything before the last offset written (i.e., I suppose fadvise() with POSIX_FADV_SEQUENTIAL).  You discard that idea based on the fact that implementing a cache in qemu would be simple, but it isn’t, really.  What would the impact of POSIX_FADV_SEQUENTIAL be?  (One advantage of using that would be that we could reuse it for non-compressed images that are written by backup or qemu-img convert.)

The problem is that writes are async. And therefore, not sequential. So I have to track the writes and wait until the whole cluster is filled. It's simple use fadvise as an option to my cache: instead of caching data and write when cluster is filled we can instead mark cluster POSIX_FADV_DONTNEED.

> 
> (I don’t remember why that qemu-img discussion died back then.)
> 
> 
> Fourth, regarding the code, would it be simpler if it were a pure write cache?  I.e., on read, everything is flushed, so we don’t have to deal with that.  I don’t think there are many valid cases where a compressed image is both written to and read from at the same time.  (Just asking, because I’d really want this code to be simpler.  I can imagine that reading from the cache is the least bit of complexity, but perhaps...)
> 

Hm. I really didn't want to support reads, and do it only to make it possible to enable the cache by default.. Still read function is really simple, and I don't think that dropping it will simplify the code significantly.


-- 
Best regards,
Vladimir

