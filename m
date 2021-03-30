Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2E34F10B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 20:34:52 +0200 (CEST)
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRJCV-0005r3-RM
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 14:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRJBD-0005I8-Hd; Tue, 30 Mar 2021 14:33:33 -0400
Received: from mail-eopbgr130095.outbound.protection.outlook.com
 ([40.107.13.95]:35076 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRJB6-000225-1g; Tue, 30 Mar 2021 14:33:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuZNhQE52CNFNfqxkHF6PGnvcWPJordPR/SnSmarzorZF+RrUUuenQH6pCPxUsl3vzUr3cMX7+zpeclMRKsuc42Nie6KQ4VMg+u0k0prrhMcxFMUHKbVlyNQok7rhzuK8JDbnyjGOs74yv3s4hitLKsYufVex5YjGfPXICqWS9RCaBU+hzlo5YPFCcRB/A9ccCH/UtUo2UzzsSrWfNGfGZTISq9kP0uXYGIOhlChl9RW1hmR4tRr+YbPiuJD9Chi18K5fbyrBUY//GABcoVRSJehKfVpemznSrMwGn5La46kwQfSgeZYCq0+iqfU0kEyKyBqG1NB8JQF5krqkeGPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YED2cibvrpMgN4od7L/8PT0knz5x0dKXQv+vfvwUYhw=;
 b=bgRyUVq2XrMVeyh8snaO1dEC0AaP3cmeMqHLgqnf7lpSoWu07Fz3ylePmbThGEGLLOSHu5ckw35OJSHUBHIwJpwSCYYnuk33gnYkgRMjg8fg6rLgeAcIKkwl8ibqSx1Wr4EjdAHIocso+I1YAbgEbn32w6yy+PzVumrQpJlvplH3QoZBUsfx12GtyZ27AT5L8u7Q5H0CPzBg6fzljhgL6kWE+9UMZCMeon8AH6lZGpLsifPEIqMd650A5bErRCyR/KhFsXWwcWswp0KXvDrrZ4RSyDeVGQ4liPPw2EumiC83OuXLu9JSdbbuujYmwiEDB9ZlMwovMRB+GLo8OWqDuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YED2cibvrpMgN4od7L/8PT0knz5x0dKXQv+vfvwUYhw=;
 b=ixahkCfA5k9DdGw74hQTv3oBE1OjtnOrqgT4FtgormbiPDVvJOrsu8ekMifNKdEAEiyg8MBG6+VG9E/mSV1g5oVWpbMKf/cfX8pu6tYf4HrAKUxltVBzAzG+09vLDIpN7f6Ro5ECKvJyj+FTWOJRbIn/Us0MoYNfFGJrVHzJ7fk=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4952.eurprd08.prod.outlook.com (2603:10a6:20b:e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 18:33:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 18:33:19 +0000
Subject: Re: [PATCH v4 for-6.0? 0/3] qcow2: fix parallel rewrite and discard
 (rw-lock)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
 <f16e8ea3-5af7-abc2-bf1c-7fd997ecf651@virtuozzo.com>
 <c3c2ea3a-9475-69f2-b9d7-e88001d822c0@redhat.com>
 <166496e1-f855-5813-2fe8-88035fb85a26@virtuozzo.com>
 <80e4838f-772b-28e1-3bdb-10a5d7e72ec0@redhat.com>
 <09d7683a-0e1f-58dd-3f24-02591a5d7ac8@virtuozzo.com>
 <61a00c13-3000-249e-8081-7b55ce5832bd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dc0958d5-373f-154b-3f4f-660358500b3b@virtuozzo.com>
Date: Tue, 30 Mar 2021 21:33:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <61a00c13-3000-249e-8081-7b55ce5832bd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.15 via Frontend Transport; Tue, 30 Mar 2021 18:33:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74dad189-50c4-440e-dc62-08d8f3aa4a75
X-MS-TrafficTypeDiagnostic: AM6PR08MB4952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB495206601847D67946010BD4C17D9@AM6PR08MB4952.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Nj0EeebGp3T6ry0x6fkw/8dFuvAHxtLQU1gnFrzHelBCreiiw9+PimCQdZeYIcWlHIQhEN0Y8rOXOivxsCHpTovNkcbg5ExnlnWvoyvUR2kaVzqiENsAsZW6aGDQyTcWp0UnwvxeCkPOnM/+jaKDTPsza04USBGKxx4edds+99zydconULq2m7dQbzh35vbXtnHemhWV12XKQekIZebekA4Hz1Ds+vM+iSyIPco7pJ30/0DZpyeq2AQQHqjNSJIKPbwQ19qbcbZb5wFXfmH+o/yXua/cfMQ6MFjTj7I3Hv6LI4roJrQpHX5WESZozs/Aubpzsk3iHuSfzCk+nTc4pK5JHC4nDCYBBLpI2vUy1bHOzdndw2rNFH9Mq63uBKTzanMC25AvWVXidCgtEH3nrybkRPFPmyDlt0IOX/AJPSzp9f3IZQt7kVhvpYOCgVNffqGA3X+1k6UUDM6PBJz0PL9OF6Od/71hMwBmxAyS2Q0TdsELFL58lJRAE14OlDOdVpf2UKRaCUTMg4YFLpDZCyrxsc1opyIsmq7D1pQAW4IsBDpR+eAh43SPHSi5uiaTsmFZnAXop8931yP6idrOb/lLYXI1O+6pscx0ddWN79gH0jkisoY/kUtFEP+x06JuEjUzyRBvw7Bziw1pHKIR3VbJDP1TOLa5KR6VrDMfN56Kq+B8Av5VzAai5z1H0/gJ/RkLpRH0jmy0zma9VsYuQ2f7pN6765e4ZB3kbQKxEozJbPxGNkzPuo728sp1qO4+AWTdWA7VJcCRqlclg8lDJlMCFXPamOs5wYcNOHwTyPuUtJ+0wUKznXYVZdl5Ztg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39840400004)(396003)(136003)(66946007)(66556008)(31686004)(107886003)(16526019)(186003)(66476007)(36756003)(26005)(52116002)(31696002)(478600001)(316002)(83380400001)(6486002)(16576012)(53546011)(5660300002)(2906002)(966005)(86362001)(2616005)(956004)(4326008)(8936002)(38100700001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WkFTNnp1dFZmdWlpQjBvaEV2Y1hBY3Vodnd1WnhHaUVpdnc0cFhIb3RLd1V1?=
 =?utf-8?B?OWZldU5iMnlmQ2ptZm5FWm1GVW9kdlNZL1JRZW9xbTlwd04rQ1RhTUc5WVU4?=
 =?utf-8?B?OFhIa3BPT0ZQbHMySGJoRnRrY1krOEkxVjcxdW1ZWWgvRGdnS3VONWVjWTN3?=
 =?utf-8?B?ZWdhVDhHS2pXNGVmRFZhZFZDSitEcllEMDE0N1lqMlB2VitsSWZGZzR0Q3FD?=
 =?utf-8?B?UDFNc0QvejZYbDNYRmVWbUdybjVNeFNNc3VUcXZ0cnZySHdyTVZxRUl6a2Nv?=
 =?utf-8?B?M1BRRXlON3NodVR4b01XMXpoYldwYkdmRFpCWEIxYWl2WS8va00zaFNjUGFV?=
 =?utf-8?B?bG5waW4xZXdZUDVFa1Bkc1Bnc00xbnIvVmZCQW1uN1hNMjNrN090VDNzekM5?=
 =?utf-8?B?WEJ2SHpJY3hWZ1duTk5GcjdyQVpYYjNha3ZhdHl1RnBIdjBRU2tuVHMrTnFN?=
 =?utf-8?B?SFF5OG40dmRKTlEwYWxZK2FHdnA4TEQwNS83QnRyV3FhdzVqR1A0SUhuVzlR?=
 =?utf-8?B?c1FvRjNleVhPNEVPZDE3VVErd2hmb3VlZmZkeCsxNXp6MEdnWEpqcGJ3Uy9G?=
 =?utf-8?B?dmZicWNWaUV0WnFYZ0t6UGhSYjlWUG5ydnh4ZXdTenJvc3lBTkFiZmlsT3ZP?=
 =?utf-8?B?aXQvY09hMlBXM1F6bWFoNjVVdWpmaDlCZW5ENFdoRjVEQjZ5SmJ5UkdzMjVs?=
 =?utf-8?B?RjhITUdkYlV3K3dnaHFscmRtbXJtT2lFSm9zZElidlVVUFVLL1NCTGE0UEhl?=
 =?utf-8?B?S0poS1E4NXNkeVd5VldQS1o4Si9XM2V6MEdTUWtJTnFGcGs3ZDZna1hNMWpw?=
 =?utf-8?B?bkQ1YXI5bTE0QzZPdFUyY3JvSTR0NGpTUG0yQTF0SjcyazU1WDNTREZsWmVt?=
 =?utf-8?B?aEQzR3Qrc0dhd1ZUV2gvUmdxRUMyMGtCMUwwQ0lESStzOXVoRzBKZHZvMEZy?=
 =?utf-8?B?dXdkTHYzbGFSd1VUR3VvWVZ4azd5Wjdyd1J0K1FXWWpJQllTcTRKRWk2RC9t?=
 =?utf-8?B?RWloZmRRc0RleFZVMS9vVzhjZ0xoMnEzY2FzVnpaYmpBWHpEYTh3aUREMStu?=
 =?utf-8?B?a2JGbXhKU0NTVDhkZ0t2ektBZHFwcEZiTjY1YXh5US9GZ2NLb2d0OUhuSG9j?=
 =?utf-8?B?cW1UbmhCSm0wOW41VW0wUGlEMHA2Q2RnRW9TcFhhdTNMK2EyQzhITzAxSnNj?=
 =?utf-8?B?UEZ6Mnhqd2c2bTdObWNRN29DMmVoTW9ycjd6TWxBM0RnUUtEWFdFOExuQjBh?=
 =?utf-8?B?cm9qNC9odWcxYXM5Q09mZ1NwTmcwU3VhZmZuWE1FTFBqZVNpL3lncWZtaDlO?=
 =?utf-8?B?NkFwcmJMWlJBSGhaSUJyNzUrT2FuWmRQWG9iTldmVkxmZVR3S1pmZ3pyZEdO?=
 =?utf-8?B?c3QxeEpzR0JwOTR3UVhySXcvMVJkckxIYU9HcHFBWXdQODJXemYrK0pteU91?=
 =?utf-8?B?WkMrcnhWY21maXdYSURjRno1cVFRRXNBUmxJRUdoOU5XNFI2L2M3ZFdGZng0?=
 =?utf-8?B?MjBpTFVjWlJVVC85bFlDWXVXd0dtM3Rmc2c1VHIzcGlGNCtQTm9hdERXZkc2?=
 =?utf-8?B?dndscEZ2YTlURUxEWStKcGczMmREQ2FRWHl4REQ0NjRqdGNaNmZoSWI5YjR0?=
 =?utf-8?B?eDk5eTh5aHN1aWhBZzg5SThHR3VYWEc2ZG9QUVVTcXMvemlkcW1rM2hITis3?=
 =?utf-8?B?N3I2NUEvVVI0YjUzN1RsaWw1Rzh0T2VyaElFWkdXRkRORis1bXNMR1lDcUc4?=
 =?utf-8?Q?oxhzMAlcbZ+sR8Fr8P1HnTWHtac9ymWtXimjl+n?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74dad189-50c4-440e-dc62-08d8f3aa4a75
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 18:33:19.3417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3HrOZ2Ej3qGBCjA7kB5aj5WWjj02JwVRxcfrQEYLgqX0qHXac0mPq6iB8YKGpkmtvWxmp+MPrmqtttBD9QD5GxwDVzJg1CVXhjwbxvgKi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4952
Received-SPF: pass client-ip=40.107.13.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

30.03.2021 19:39, Max Reitz wrote:
> On 30.03.21 15:25, Vladimir Sementsov-Ogievskiy wrote:
>> 30.03.2021 15:51, Max Reitz wrote:
>>> On 30.03.21 12:51, Vladimir Sementsov-Ogievskiy wrote:
>>>> 30.03.2021 12:49, Max Reitz wrote:
>>>>> On 25.03.21 20:12, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> ping. Do we want it for 6.0?
>>>>>
>>>>> I’d rather wait.  I think the conclusion was that guests shouldn’t hit this because they serialize discards?
>>>>
>>>> I think, that we never had bugs, so we of course can wait.
>>>>
>>>>>
>>>>> There’s also something Kevin wrote on IRC a couple of weeks ago, for which I had hoped he’d sent an email but I don’t think he did, so I’ll try to remember and paraphrase as well as I can...
>>>>>
>>>>> He basically asked whether it wouldn’t be conceptually simpler to take a reference to some cluster in get_cluster_offset() and later release it with a to-be-added put_cluster_offset().
>>>>>
>>>>> He also noted that reading is problematic, too, because if you read a discarded and reused cluster, this might result in an information leak (some guest application might be able to read data it isn’t allowed to read); that’s why making get_cluster_offset() the point of locking clusters against discarding would be better.
>>>>
>>>> Yes, I thought about read too, (RFCed in cover letter of [PATCH v5 0/6] qcow2: fix parallel rewrite and discard (lockless))
>>>>
>>>>>
>>>>> This would probably work with both of your solutions.  For the in-memory solutions, you’d take a refcount to an actual cluster; in the CoRwLock solution, you’d take that lock.
>>>>>
>>>>> What do you think?
>>>>>
>>>>
>>>> Hmm. What do you mean? Just rename my qcow2_inflight_writes_inc() and qcow2_inflight_writes_dec() to get_cluster_offset()/put_cluster_offset(), to make it more native to use for read operations as well?
>>>
>>> Hm.  Our discussion wasn’t so detailed.
>>>
>>> I interpreted it to mean all qcow2 functions that find an offset to a qcow2 cluster, namely qcow2_get_host_offset(), qcow2_alloc_host_offset(), and qcow2_alloc_compressed_cluster_offset().
>>
>> What about qcow2_alloc_clusters() ?
> 
> Seems like all callers for that but do_alloc_cluster_offset() call it to allocate metadata clusters, which cannot be discarded from the guest.
> 
> Is it really possible that some metadata cluster is used while qcow2 discards it internally at the same time, or isn’t all of this only a problem for data clusters?

It's a good question which I think doesn't have fast answer.

I think:

1. On normal code paths we usually handle qcow2 metadata always under s->lock mutex. So, we can't decrease refcount to zero in parallel, as update_refcount() should be called under s->lock too.

2. [1] is violated at least by code paths that are not in coroutine (for example qcow2-snapshots). But seems that on these paths we are guarded by other things (like drained section).. For sure we should move the whole qcow2 driver to coroutine and do every metadata update under s->lock.

3. Does [1] violated on some coroutine paths I don't know. But I hope that it doesn't, otherwise we should have bugs..

In future we'll probably want to work with metadata without s->lock, at least for IO. Then we'll need same mechanisms like we are now inventing for data writes.. But I'm not sure that for metadata it will be so simple (as for now mutex prevents not only parallel write & discard of metadata, but also parallel updates. (And for parallel guest writes to same cluster we don't care, it's a problem of the guest)

> 
>>> When those functions return an offset (in)to some cluster, that cluster (or the image as a whole) should be locked against discards. Every offset received this way would require an accompanying qcow2_put_host_offset().
>>>
>>>> Or to update any kind of "getting cluster offset" in the whole qcow2 driver to take a kind of "dynamic reference count" by get_cluster_offset() and then call corresponding put() somewhere? In this case I'm afraid it's a lot more work..
>>>
>>> Hm, really?  I would have assumed we need to do some locking in all functions that get a cluster offset this way, so it should be less work to take the lock in the functions they invoke to get the offset.
>>>
>>>> It would be also the problem that a lot of paths in qcow2 are not in coroutine and don't even take s->lock when they actually should.
>>>
>>> I’m not sure what you mean here, because all functions that invoke any of the three functions I listed above are coroutine_fns (or, well, I didn’t look it up, but they all have *_co_* in their name).
>>
>> qcow2_alloc_clusters() has a lot more callers..
> 
> Let’s hope we don’t need to worry about it then. O:)
> 
>>>> This will also mean that we do same job as normal qcow2 refcounts already do: no sense in keeping additional "dynamic refcount" for L2 table cluster while reading it, as we already have non-zero qcow2 normal refcount for it..
>>>
>>> I’m afraid I don’t understand how normal refcounts relate to this. For example, qcow2_get_host_offset() doesn’t touch refcounts at all.
>>>
>>
>> I mean the following: remember our discussion about what is free-cluster. If we add "dynamic-refcount", or "infligth-write-counter" thing only to count inflight data-writing (or, as discussed, we should count data-reads as well) operations, than "full reference count" of the cluster is inflight-write-count + qcow2-metadata-refcount.
>>
>> But if we add a kind of "dynamic refcount" for any use of host cluster, for example reading of L2 table, than we duplicate the reference in qcow2-metadata to this L2 table (represented as refcount) by our "dynamic refcount", and we don't have a concept of "full reference count" as the sum above.. We still should treat a cluster as free when both "dynamic refcount" and qcow2-metadata-refcount are zero, but their sum doesn't have a good sense. Not a problem maybe.. But looks like a complication with no benefit.
> 
> You’re right, but I don’t think that’s a real problem.  Perhaps the sum was even a false equivalency.  There is a difference between the dynamic refcount and the on-disk refcount: We must wait with discarding until the the dynamic refcount is 0, and discarding will then drop the on-disk refcount to 0, too.  I think.  So I’m not sure whether the sum really means anything.
> 
> But if metadata isn’t a problem and that means we don’t have ask these questions at all, well, that’ll be even better.
> 
>> ==
>>
>> OK, I think now that you didn't mean qcow2_alloc_clusters(). So, we are saying about only functions returning an offset to cluster with "guest data", not to any kind of host cluster. Than what you propose looks like this to me:
>>
>>   - take my v5
>>   - rename qcow2_inflight_writes_dec() to put_cluster_offset()
>>   - call qcow2_inflight_writes_inc() from the three functions you mention
> 
> Yes, I think so.  Or you take the CoRwLock in those three functions, depending on which implementation we want.

Yes.

> 
> Sorry if we’ve discussed this before and I just forgot, but: What are the performance implications of either solution?  As far as I remember, the inflight-write-counter solution had the problem of always doing stuff on every I/O access.  You said the impact was small and yes, it is, but it’s still there.

Yes. I think, I can measure it on tmpfs, and if degradation less than 1%, I'd just ignore it. Still inflight-counter solution is more complicated.

Hmm, note that CoRwLock solution has one non-trivial thing too: moving the lock to task coroutine. With inflight-counters we don't need such thing.

> I haven’t looked at the CoRwLock solution but it I would assume it’s basically zero cost for common cases, right?  I.e. the case where the guest already serializes discards from other accesses, which I thought is what e.g. Linux does.  (And even if it doesn’t, I would assume that concurrent I/O and discards are rather rare.)

With CoRwLock any kind of host-cluster-discard becomes blocking. We block the guest io (remember that we want to protect reads too), wait until all operations completed, then we do discard, than unfreeze the whole io.. What about removing persistent dirty bitmap? It becomes such an operation.. Hmm. Can I imagine another example? Switch-to-snapshot should be in a drained section anyway.. Rewriting compressed cluster to normal cluster is rare case. Hmm what else?

We don't have it now, but what about a feature like this:

  During block-commit, discard clusters that are already committed to base from all intermediate images: thus we avoid increasing of disk-usage during commit job.

But, anyway, we don't have such feature yet.

So, I think that in general lockless solution is better.. But currently we don't have a significant use-case which would be a show-stopper for CoRwLock solution. Or at least I can't imagine it.

Ha, or, I have one in mind: mirror. mirror does discards (it has MIRROR_METHOD_DISCARD). Honestly, I always doubt about that fact. I think that mirror job should not use discard at all, it should either write or write-zeroes, nothing else.. But it's my opinion, probably I don't know the use-case. Anyway, with current implementation of mirror-job write-lock on discard may reduce performance of mirror job (and of guest as well) in cases when mirror does discard operations.. Mirror does discard when block_status return neither ZERO nor DATA. And accordingly to my old mail https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg05136.html , only iscsi may reasonably report such block status... Hmm. Any thoughts?


> 
>> That make sense to me. Still, put_cluster_offset() name doesn't make it obvious that it's only for clusters with "guest data", and we shouldn't call it when work with metadata clusters.
> 
> Yeah, it was meant for symmetry with qcow2_get_host_offset() (i.e. it would be named “qcow2_put_host_offset()”).  Now that there are three functions that would take a reference, it should get some other name.  I don’t know.  qcow2_put_data_cluster_offset()?
> 
> Max
> 


-- 
Best regards,
Vladimir

