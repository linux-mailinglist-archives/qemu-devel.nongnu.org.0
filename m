Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5464534E90F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:27:33 +0200 (CEST)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lREP6-0007sq-Di
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRENK-0006aw-Qi; Tue, 30 Mar 2021 09:25:43 -0400
Received: from mail-vi1eur05on2099.outbound.protection.outlook.com
 ([40.107.21.99]:10849 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRENH-0003MT-Mz; Tue, 30 Mar 2021 09:25:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ox83MtfvRT2Uiz4wWqTArdhuGdMeXZBuH8ABf8UNLqxD97+FBBRTz8kGXyb5wcNKr9BOntVskHlSrYN4KySYarbTnZYAeCW8rG8tFOKamudXUQ1/U3cDmWVTAHOOPMSDG5sTiJeNzZbccCjubnNVXZZyG2cgxeFsmCivFiPb9dxm7zdCuPTwSjYDC2i4tQcE0jUK3jsTx90QjmuC+cWGpm277gkHqGauDlvoJ9KNeazL1ch1fv6qac7HZ01mUjMuX3MRJ35/pZzhStM+7Phaybw2Jzcp73Fgh8I9z98tHTeJbPgLrnb/LgDZRP3Dq71yaL4mG+FOOPunNkYksBnU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yxk5DHP36rewIGK0xZB0X/jnRXCrt4nINR7NXEZ0t0=;
 b=KRR5RhPl0lz1tA0M/IHQGU26WfvWfDIFYMP+OF2D/xZ8Cc2yZU0UJzJv2+DRxEW26CJRva8ioxW1lvMxURrDm2wgBsm2hf8yXTHCWYwhyERw6vMAQCuq6z1xjjLYY1gRyq2NDFcP7LJRZkV0+xoloIsFyVEsfWqGU5yFSMXopkWN/GOD+sKOIlOw2/6mfHBfp6seBWn4vSZ30VOYlEWzPdfUgt1CdX6W+JPgFFw/qfTnYg4ZAcWys5lfeOsjH7YtcvyBlAb9NbhjBQpPreGOjOdGhD+dfMSLby01NU4Z6IMDf05XPHl0dUX+dfSNk0X6WxEUJx756e5EhtSwSoknHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yxk5DHP36rewIGK0xZB0X/jnRXCrt4nINR7NXEZ0t0=;
 b=r875el0H9egzkgyjl2ZR5CcWXUI+yspVgxQ4Pl0kZCt27cMCtOF4+suVbRxeBhi6KuSIt7Df+sZ/59lWsohXo/ualPqJFQFRvVTigVpWJsDRGg3lTPvSsAwm1IOdbogHK5QvVkeIbYC33V5nf9vgIOp+nIKpFXg0/SXAKtM7/1M=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6503.eurprd08.prod.outlook.com (2603:10a6:20b:33b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Tue, 30 Mar
 2021 13:25:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 13:25:33 +0000
Subject: Re: [PATCH v4 for-6.0? 0/3] qcow2: fix parallel rewrite and discard
 (rw-lock)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
 <f16e8ea3-5af7-abc2-bf1c-7fd997ecf651@virtuozzo.com>
 <c3c2ea3a-9475-69f2-b9d7-e88001d822c0@redhat.com>
 <166496e1-f855-5813-2fe8-88035fb85a26@virtuozzo.com>
 <80e4838f-772b-28e1-3bdb-10a5d7e72ec0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <09d7683a-0e1f-58dd-3f24-02591a5d7ac8@virtuozzo.com>
Date: Tue, 30 Mar 2021 16:25:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <80e4838f-772b-28e1-3bdb-10a5d7e72ec0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM4PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:205::28)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM4PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:205::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 13:25:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48f53763-6cee-4de4-0c65-08d8f37f4c10
X-MS-TrafficTypeDiagnostic: AS8PR08MB6503:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65039D1ECB157C9E79926691C17D9@AS8PR08MB6503.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9sCXHQwnV4tcP54uKAqk1MmVOi9vvv53OvFC2Ezoc1tsnE10NDAkctxjlrI5Si8jgbz8A//3XAvbKlwVreglCgDPSBg+PMBk+N+sN06C0EclwDSu+NaChz5WO7pXIFLXwfrgsXEVqYBKro9LmV429hqoeYEHouT3TrdQe6IYxhfkkSNsMV4AO0CESd5e36lk0MiQjgKPiGHufd8PyD4diFRMRqLfAkotr5EksMoZTnxbDby4OXa+vpSEhDKUVet+UsCqATRHiLj8co7qoXEjQecpN7fyir55Ake+LVKtnQ4X2BqIwZXynqLuNg/1gi5VUDRfjd9mclyo+gNOdNXJsWBbL1F/G2CJzSDB2HE77ha5xDwNDKO1s3A4175LniHZKt7Scn5y4CQT9mPefWkTrfw44LmpHgU/iHRWmOGwOO5t5z6qI+mrPGBRpQPg7ykld7UtTi2/2/Zx2XqM+l0I4+zuvUQyAQfQXy5FQ92j3KFtm4yNQX5NB7WB01RdYX15n2bKyyQklq9VUe5MoPdRCGzJg+OPdIwjQARL0hrtNUL1I8lYW80UPUwYdT0lHVP9SKgCSteEDJq9cqGxDnp/JoC9ZSZF9D0huXpLTnczSTIHrvLQ1bod2sTTU9mWcAabCnFs3B6sPQ3fW0v9RTi3qwsFMp/J66BX9Hzp/aDmMvnpcxHxxqhh+sBqPXe5OG727gTcm+OAr9H1bRmJ+WjlKWZAgczuQ3inrSqpM5d9Fx0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(376002)(366004)(136003)(346002)(956004)(16576012)(83380400001)(316002)(8936002)(2616005)(38100700001)(36756003)(86362001)(8676002)(52116002)(5660300002)(66946007)(107886003)(478600001)(53546011)(31696002)(6486002)(2906002)(4326008)(66476007)(31686004)(186003)(66556008)(26005)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R1Q5ZnoxbmFBRDlRNGlRMXM4WUd1RXpBaHNxanZyUTRSSVhjQTV6bWRhcWt3?=
 =?utf-8?B?ZTlFbjlJcVVOa2xKSU40b0lUR1BDb1lCMlNNS3VzekNOZGpzYTJzNHdKNmc2?=
 =?utf-8?B?aWI1UXhoZ2pNQzJYd2x3bitxWEkvbERyOHFJcXMxaExhT0hWWnkrT0NzSmVm?=
 =?utf-8?B?VGxWeEZUWkQ1NGNOZm1IRXdkSnZuQXV0TVd1eHJteU5PbktaL090ZWFtMG5G?=
 =?utf-8?B?eWFBakMxVll6V0JlY3dmTjFCdlA2V2ZLcTZobWpsVElMQnZoRWxDalVDL0dS?=
 =?utf-8?B?MzV6UEZxSitVMnFTa1pQQzcyakhuSFRtcXpVQmZjVzByNitIZmx2dmdqV1po?=
 =?utf-8?B?T2loenFRYWpUd2FFUStobFA0TE5Ma3hUdmpHSkU2SU1LdmdHUDRSMnRlZGdN?=
 =?utf-8?B?NmRHcG53UEIwZ1Ruc3pKcTFYREJlT3doVUtkVEhQTGNRdTdPbkV6SElvMjcz?=
 =?utf-8?B?VEJWNEhaZVpobFE0elVjR01XOWoybW9EQmRxazREdjNvZ2llY2wyV2VTYXJw?=
 =?utf-8?B?Wlc2VWxWY08wMGRudnlGazRzTnJqbklCbHQ4K0FyQnJVVExmbUZpMGl5MjZ5?=
 =?utf-8?B?OEs3Ym1vSjAwSENrMHRSMnJtdzdJYXhQU1pMYTBQT0lHK0l1YmJFekRUaEp2?=
 =?utf-8?B?K0JsU1pMNHJKbDB1Tkg2R0xsY0NhNVRoWmc2bzBOdnZlZ1praGRTdS9qcG93?=
 =?utf-8?B?QWZ4Y21uQXNQdzdGL1ZoS1d5elh3WnJnc0FuSE9wYWI5RnRIMmZxRFliQVBB?=
 =?utf-8?B?MThWMXJJc2dHWTlWc2NtOFJQM0FqektRb1pUNnpNMm9nVXA5d3hRdDkvQUpG?=
 =?utf-8?B?aE5sY3Q5UkkyNStJVWtzM09TM3BBU3BTMk8wOEtLRUc3UVRYa3BPK1ZscC9x?=
 =?utf-8?B?NldyT3g5QjJWeUkwczNYSWE5NC9Gd3BLdVd1anhBMzY1ZXRwbWFiTVBKSzBY?=
 =?utf-8?B?VHBwN1FCaDI4Wjk1UkE2YmJaNTRkeVNmNmY0bU1WKzRlY0JsNDNUMEt3Y1BZ?=
 =?utf-8?B?Qk9sWVVReGdQNnY0YzUwZ2Fzd1c4N0FzV3hlU3hkYVZIbXJwbytyOFRtTXFZ?=
 =?utf-8?B?RzRTT2prYU9YUmVzeXpKN0RXQUpZMitSU1FRY0RId1VTaDdaODIwOWZJT1pX?=
 =?utf-8?B?NVVTZlV3TklGR2FaK0t1SG9iMFBibmo2eWRtTk84N2YyWmtZenF4bkdHOUZY?=
 =?utf-8?B?TXhXWWFrMWVKMnQ3akQ3Um90R2k4UGxQbWJGRVd2eUMzQ2NkMVJnMVRwWjl2?=
 =?utf-8?B?TXp6WEpuYTJTQk84OHZMTTNSVmpaMU84ZDhmbUxPbG1ETWFmQjFzaWprQ0tU?=
 =?utf-8?B?UnJodUVQanBtenVrM1ZZV2kvTnlxYnpHUklyQzBmMFU0eDN1YVR4RzNPaXJV?=
 =?utf-8?B?S1RiWkgvRjJIb0V2VURFSmNpK0tSRWVodnk5WGhRTk8rQVpCOCttMHRSZnRJ?=
 =?utf-8?B?cTMzcThMNGl0NXdxYStwWWlZUy9xV1dHc1pEQVZlaUROV3JUODhKV0NIb0ZR?=
 =?utf-8?B?cTBTRGRucEwxRGdaM1B4aE9yZDlRa0JJbzRXYTBFK1hZVXlaanpwSjNqVEd6?=
 =?utf-8?B?QVZNd01uWlRpZlJ0c3phWmhWNmtScE8xVWFKczB2NUZtcmR6c2dBS3pOQy83?=
 =?utf-8?B?aUtpZnhEMEdJQVFNOWxKekFic0J2a2JWWk5UMk9yZjdnaHhjdWRMUlZDZ0o4?=
 =?utf-8?B?SHVXNkdtQ2RQTXlGVTBkR09rUm9hMFNSb1VUWGlhTUJUU2REdHpRQklHQWw1?=
 =?utf-8?Q?FJWqAlCEvAzb1QAu51jxfC4itSS3ab6gwpur8dF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f53763-6cee-4de4-0c65-08d8f37f4c10
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 13:25:33.6795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtTTDXuE5JVGCjPwDipZRh5uGbkX/L2/rht1Ose69Jq8W2QVqqUMavfqxvH0J9znomlv1XG8DYeLNJP100k4BMhzzULMSj93DvjkQVf093s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6503
Received-SPF: pass client-ip=40.107.21.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

30.03.2021 15:51, Max Reitz wrote:
> On 30.03.21 12:51, Vladimir Sementsov-Ogievskiy wrote:
>> 30.03.2021 12:49, Max Reitz wrote:
>>> On 25.03.21 20:12, Vladimir Sementsov-Ogievskiy wrote:
>>>> ping. Do we want it for 6.0?
>>>
>>> I’d rather wait.  I think the conclusion was that guests shouldn’t hit this because they serialize discards?
>>
>> I think, that we never had bugs, so we of course can wait.
>>
>>>
>>> There’s also something Kevin wrote on IRC a couple of weeks ago, for which I had hoped he’d sent an email but I don’t think he did, so I’ll try to remember and paraphrase as well as I can...
>>>
>>> He basically asked whether it wouldn’t be conceptually simpler to take a reference to some cluster in get_cluster_offset() and later release it with a to-be-added put_cluster_offset().
>>>
>>> He also noted that reading is problematic, too, because if you read a discarded and reused cluster, this might result in an information leak (some guest application might be able to read data it isn’t allowed to read); that’s why making get_cluster_offset() the point of locking clusters against discarding would be better.
>>
>> Yes, I thought about read too, (RFCed in cover letter of [PATCH v5 0/6] qcow2: fix parallel rewrite and discard (lockless))
>>
>>>
>>> This would probably work with both of your solutions.  For the in-memory solutions, you’d take a refcount to an actual cluster; in the CoRwLock solution, you’d take that lock.
>>>
>>> What do you think?
>>>
>>
>> Hmm. What do you mean? Just rename my qcow2_inflight_writes_inc() and qcow2_inflight_writes_dec() to get_cluster_offset()/put_cluster_offset(), to make it more native to use for read operations as well?
> 
> Hm.  Our discussion wasn’t so detailed.
> 
> I interpreted it to mean all qcow2 functions that find an offset to a qcow2 cluster, namely qcow2_get_host_offset(), qcow2_alloc_host_offset(), and qcow2_alloc_compressed_cluster_offset().

What about qcow2_alloc_clusters() ?

> 
> When those functions return an offset (in)to some cluster, that cluster (or the image as a whole) should be locked against discards.  Every offset received this way would require an accompanying qcow2_put_host_offset().
> 
>> Or to update any kind of "getting cluster offset" in the whole qcow2 driver to take a kind of "dynamic reference count" by get_cluster_offset() and then call corresponding put() somewhere? In this case I'm afraid it's a lot more work..
> 
> Hm, really?  I would have assumed we need to do some locking in all functions that get a cluster offset this way, so it should be less work to take the lock in the functions they invoke to get the offset.
> 
>> It would be also the problem that a lot of paths in qcow2 are not in coroutine and don't even take s->lock when they actually should.
> 
> I’m not sure what you mean here, because all functions that invoke any of the three functions I listed above are coroutine_fns (or, well, I didn’t look it up, but they all have *_co_* in their name).

qcow2_alloc_clusters() has a lot more callers..

> 
>> This will also mean that we do same job as normal qcow2 refcounts already do: no sense in keeping additional "dynamic refcount" for L2 table cluster while reading it, as we already have non-zero qcow2 normal refcount for it..
> 
> I’m afraid I don’t understand how normal refcounts relate to this.  For example, qcow2_get_host_offset() doesn’t touch refcounts at all.
> 

I mean the following: remember our discussion about what is free-cluster. If we add "dynamic-refcount", or "infligth-write-counter" thing only to count inflight data-writing (or, as discussed, we should count data-reads as well) operations, than "full reference count" of the cluster is inflight-write-count + qcow2-metadata-refcount.

But if we add a kind of "dynamic refcount" for any use of host cluster, for example reading of L2 table, than we duplicate the reference in qcow2-metadata to this L2 table (represented as refcount) by our "dynamic refcount", and we don't have a concept of "full reference count" as the sum above.. We still should treat a cluster as free when both "dynamic refcount" and qcow2-metadata-refcount are zero, but their sum doesn't have a good sense. Not a problem maybe.. But looks like a complication with no benefit.


==

OK, I think now that you didn't mean qcow2_alloc_clusters(). So, we are saying about only functions returning an offset to cluster with "guest data", not to any kind of host cluster. Than what you propose looks like this to me:

  - take my v5
  - rename qcow2_inflight_writes_dec() to put_cluster_offset()
  - call qcow2_inflight_writes_inc() from the three functions you mention

That make sense to me. Still, put_cluster_offset() name doesn't make it obvious that it's only for clusters with "guest data", and we shouldn't call it when work with metadata clusters.

-- 
Best regards,
Vladimir

