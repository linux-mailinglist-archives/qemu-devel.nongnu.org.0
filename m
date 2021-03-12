Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB733886A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:17:18 +0100 (CET)
Received: from localhost ([::1]:42038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdv3-0001F6-3J
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKdnc-0001cj-Vh; Fri, 12 Mar 2021 04:09:37 -0500
Received: from mail-eopbgr60135.outbound.protection.outlook.com
 ([40.107.6.135]:2948 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKdnX-0004ej-Bo; Fri, 12 Mar 2021 04:09:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kk5euAJ+9xqVquOyKGKfeKiZAX/KzYIFSuCNqHJg7INXfexEwLjU2gUCJIlCINq4UQHSo8WgRVpx+j0eIk3VvyuNSD5YUF9PxJ14T69ECYmjq/P6lmE2A/EgzOmnFnpDTfS4VjsNH6VB66w3tpLSMsocEmP7dcxWwcvLVr/V0f771f3+iWrp5UezFmfPCAh1kq0fgcpVFkly7XdTrY7w7u5d2rCVhRORs8gLlStdHSpJeDvUL03iKIfmtlpF/h18WdJUvwrckjyhWcctaFTRmwwIESXypsk/bcDxVa5firJYgy3tiP8vho2kuptb+MjYqRKKI1CtDTTBGmyKEO3VcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+i0zaa8wqUMQEFYjaW5HhYr7qnA1FR5m8nZ4TplV/+s=;
 b=J1nqdwxVE+dQ0HeA4tlOnR6re5hCXvBP0S3Z4e1OzJTQv3vSJTaeLE+K90Qc9dp5/aLsNtgZe/vU44YJ9FOBMCfzppVoZwav8Qrpk4OUfuaugJGDevqWzh9JQUP5wuy/T5e6N22oupGBVWsJQHhq3WrG3pCfT8anzWQ5w/keaCUYH69z/pIRx1qA6QeCbhRcWDRMHS4wPLNOJ584z6DJIozFMZf+Zbg/yTjeCubLRBJd2HMoSz/vYDs63R9XYwgfuW2ut0OZSJCYtJTFIQeN1hZDq+A9MDrpe6XvE9lXTjEzaD09/TsX2YEXDmRdZHA30IvcgQmbGKXJ9XikqprxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+i0zaa8wqUMQEFYjaW5HhYr7qnA1FR5m8nZ4TplV/+s=;
 b=RJTywe91puPq18YEHiqmWT9tJAPTKBHYWOkzaWBV+GLX+eHHFuf4JDvnbXPBkY+QKY3oUfPuf6GNPVyavwilu/1RukeQQKCqiiD8otvtzxG/DbfjcjuyCiZD5i9OuWdYQhPgGVEuhrq2o3tLsMVLK6KVDA5MFLSKGVSqLuzYcwc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2530.eurprd08.prod.outlook.com (2603:10a6:203:98::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 09:09:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 09:09:27 +0000
Subject: Re: [PATCH v3 3/6] block/qcow2: introduce inflight writes counters:
 fix discard
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-4-vsementsov@virtuozzo.com>
 <72a42f79-a608-6605-c0e1-8f35303b9c81@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3f4e3e81-8750-cbe2-0d54-d7c9e0055d38@virtuozzo.com>
Date: Fri, 12 Mar 2021 12:09:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <72a42f79-a608-6605-c0e1-8f35303b9c81@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0P190CA0022.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 09:09:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 387d2073-aa88-44fb-9261-08d8e53689a5
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2530:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25303CE58000F0E4E49F71D5C16F9@AM5PR0802MB2530.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0P3IALK2nSSSLU6L8QXZiG/7GcIDhERgGFb4+M3gQkn0sgycd9NMSyrW4AQnoluoPgG2/yvV5QxoF/k5SJFyF5Sc03ELdEUl7H+0AuREV3sq70vc3qbrB9B2TwFYpLCJ8Z3PoTeZKFGdYwsjFOxhJ9126LTfbdexQiuzj/4MDI9e4JNz0VlGdR3SZKu9jA84xiFsSqOnQrgDI2gazdXUB6pdNEZMybL9eg1rHjZlI6CAbBqykoes2Ej40kVJnMBxPAW/CUoDK+yBjTEVjAfwtKmovphEu6SzfSryPs4Zp8ao+O7kfo9nlP0rlPjsu++dGhd3z0uF9oyrsLWr1ti1aP7BLMScumffPUSpIokdWqJmAikjtPauAurZHCEAi8AsplMAnp4bnDvgV49qWaH/QbiagNzSy10c3DlieCui97iPu10JMj19+N5xyd0ohZpJlhakdZ1wkbOBT+qId6GuB2NQ0nHc8T+sgU6+I93TYvI5jrDX+XUbCrb9Lzio2evAoXabZrxvOxNoT4bZi9Lw6Ust8jKLcnLrqvyguaf5GN8W4AzUPmIYruRstepciCZ3sIqcmSp0gRLV7kxvYupBSfkW3P+JQLd/8Yw/Ts/WZCTBGFVFWGye1umO1NLkjzZaF0/2uqNDnr74OHCfE/VD5qw3PPxl7Emin2FNPtTgJGyaIBsOBuZ6rG7PuWnYQIf9g2MKQK3oc1o9TerrYTxMkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(39840400004)(136003)(83380400001)(53546011)(86362001)(2616005)(5660300002)(956004)(30864003)(16526019)(186003)(52116002)(31696002)(31686004)(2906002)(19627235002)(6486002)(8676002)(8936002)(4326008)(36756003)(316002)(66556008)(66946007)(66476007)(26005)(16576012)(478600001)(21314003)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUFNSUZoL21Uc0Z3NTduT2pTT1NpNW00cG9CSzdGSXN5S2dLb25VRG5LVWZr?=
 =?utf-8?B?djJkYmtqQmZqTHIrZEp3d2xZeDNVenRsL2ovbVQwVlJTb2NVdG8xblV0Z1Mz?=
 =?utf-8?B?Z29ZeXk2NForc1JURjdCcnB5bjJESDdvVGRoM25GZ3o5ZmRuRmlydlVyTlpH?=
 =?utf-8?B?WGQ1aEJLUTc1eHB2eW5LdFN4WFlCNS9TY29EMUZIZzVacXliNk94YlRqT3VS?=
 =?utf-8?B?MzJvUkJ0aDhZNWVsVWFYQ3VhVTJHR3h1QTZHUnJWdnF5N0xCMHRZWUVmZHpT?=
 =?utf-8?B?NHJCdVhXN0ZHaVNWNTZWU041eCtEOWpieHFpMlpNMXZUc0Z5VXMyTEgwdjlY?=
 =?utf-8?B?SkllaGI5bWVvTTEwYWdtcFFaVGQ2T2lhVUx0ZDE0clJBY3JHUXdVaW1OR3JL?=
 =?utf-8?B?WjRYZGlGUmxKZFp5cnNuZWpzZXY2L2JlM0hJUFJyNk1BbVNUSXIxQWM2WHcr?=
 =?utf-8?B?bUIzVVFRY2ZnUGRlamtSK25qZnNVWll5UkNadWtKYm1BSUVwdmlyL21ESncx?=
 =?utf-8?B?WHkrLzl4RUZGdFZBMDREQ0hpbC9UR2pnWUhQNlJwSHRjZlZLM3V1Vis1KzhU?=
 =?utf-8?B?NWprZ2gxeTRTNG5JK2o4NU1Hc3Y2N1VqY0s4MStuUjVJbStkT051SDBkUlJw?=
 =?utf-8?B?dVRZTS93R1JjR1hpWDRsOG15elljbU1heE9RQ0FRVU9mWHo0bXJyU0tuYy8y?=
 =?utf-8?B?QW0rc0crZWtwRktzTENUY08xT1NQbWVENkRxVWJpYzlqcGpFM1kwdlhKWkZj?=
 =?utf-8?B?WDIweExtSEdCL0VhRk1FT2dwckFVaEVuSkRnY2NUMGxyRC9jVkovS3RJd3Fh?=
 =?utf-8?B?Zjc2WGxzNzBLRXNCdEg4N1UxcVZLaDViTG9EbkVEcXRzTmZCWjVzd2wvaUVl?=
 =?utf-8?B?Z2dDY3dNK1lNVFd0NjJvYk5MMVJRQXBHcnpCR21JdjRINjFsRGYxVllLZzBp?=
 =?utf-8?B?U2hYeGd4VG5BOTVtTkhBWGcvSTN6Sk93bUVYUk4wRkJ4RDBhQ2ZLRUJvK3NC?=
 =?utf-8?B?emV6Q3NwWmwyNUEvSGg5Z3hYQjRYc0RydGhoU1FvZDVad3dwemlublJVVk9r?=
 =?utf-8?B?elh6Uk5WTVV0cWs4M1hCb3NSYWNOWW16ejhYZ2FjbU1oSmJhQ2E5aGdZblJW?=
 =?utf-8?B?YkZYV2VxbmVKWTk4dCtzNmZ6cXkzWWcyaS9LQWM4MTVCS3kvTkdWQWZtK1ZQ?=
 =?utf-8?B?NmJQWnpqbEs2ODhHekNWa2JkVE9BWk81Q0ZWaVFPMGwvckx0cGVSaWQ3UFlr?=
 =?utf-8?B?Q25lU2ZxM0RVUGE0aGJJS1NVbCtjbXAvcTJFd3V1dzJyKzZLdHVzSnZSWlhu?=
 =?utf-8?B?N1lhUjJxLy8xdzBuQmJDMkFaQ0kxNjFKTTNjZG5ubXNPQ0IzcFZnU3R6Qmhq?=
 =?utf-8?B?YzdpRkZBbmh6NncwQnAvODBIWCtFMkVPUEZYVjFxZzFZVDB0Nm5CODd6VU9I?=
 =?utf-8?B?c2NWRTB0cXZMa3Q0T0pKNjl6UnQ3TTRITUpRQnBzQ0JqUU1lZndURnpZQ25I?=
 =?utf-8?B?QXg2T2VLKzNMekJ0M0F0eXZNQlJJbVNwTWpLSWc0R0ZSNjViZzJTdnp0OG1G?=
 =?utf-8?B?SXNma2tpamJ1RHppdDFuRVAvWTRtVTYvSms0cUpaeW92UVhUU0t1S3JnaHBm?=
 =?utf-8?B?VlNLTkhPTUNvZHZjTWxOWjdYSTIzZllZMkdDZktJUFJYaXdFS2dzUnV1azFo?=
 =?utf-8?B?Y3ZvUHZxTEJ3UzB1WmptTC8zYmNoalYxNHF2Q2lSejhjeUZPOEp5QUtsV21t?=
 =?utf-8?Q?EggkP00kGSHNbZg4RcXbcY/awPgr77JBB2SCfKa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387d2073-aa88-44fb-9261-08d8e53689a5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 09:09:27.5409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZd1iB8PlOTBuwZ8wY0Yrf4qHB1w+ZN3t/ChlyrEu2cUCyvx2T0WWVaSUsQZjPb9rSK5CNA8UvklGMqllnWONKL3ZWoYhouzIywBYvQWZCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2530
Received-SPF: pass client-ip=40.107.6.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

11.03.2021 22:58, Max Reitz wrote:
> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>> There is a bug in qcow2: host cluster can be discarded (refcount
>> becomes 0) and reused during data write. In this case data write may
>> pollute another cluster (recently allocated) or even metadata.
> 
> I was about to ask whether we couldn’t somehow let discard requests check overlapping I/O with the tracked_request infrastructure from block/io.c (or perhaps even just let them be serializing).
> 
> But I suppose there may be other reasons for clusters being discarded other than explicit discard requests, so we have to have something in qcow2...

For example, host cluster which contain exactly one compressed cluster may be discarded when corresponding guest cluster is rewritten by non-compressed write.

Also, (not very good argument for fixing existing bug but still) serializing will not help with compressed-cache, because with compressed cache we'll have data writes (cache flushes) not related to current in-flight request. And that leads us to something like serializing of operations with .file child of qcow2 node. But we can't do it, as "discarding" a host cluster is operation with metadata, which may do no operation with underlying .file child.

> 
>> To fix the issue let's track inflight writes to host cluster in the
>> hash table and consider new counter when discarding and reusing host
>> clusters.
> 
> This didn’t really explain anything that would help me understand what’s going on in this patch.  The patch itself doesn’t really help me with comments either.  It’s possible that I’m just daft, but honestly I have a hard time really understanding what’s supposed to be going on.

Sorry for this. I believe into your experience of understanding my patches, so that shows that something is wrong with the patch itself)

> 
> Coming back from jumping all over this patch, I also wonder why this isn’t split in multiple patches, where the first introduces the infrastructure and explains exactly what’s going on, and the next patches make use of it so I could understand what each check etc. is supposed to represent and do.

OK

> 
> 
> To serve as an example, after reading through the patch, I still have no idea how it prevents that discard problem you’re trying to fix.  Maybe I’m lazy, but I would have liked exactly that to be explained by this commit message.  Actually, I don’t even understand the problem just from this commit message alone, but I could resort to HEAD^ and some thinking.  Not sure if that’s ideal, though.

The problem:

1. Start write to qcow2. Assume guest cluster G and corresponding host cluster is H.

2. The write requests come to the point of data writing to .file. The write to .file is started and qcow2 mutex is unlocked.

3. At this time refcount of H becomes 0. For example, it may be due to discard operation on qcow2 node, or rewriting compressed data by normal write, or some operation with snapshots..

4. Next, some operations occurs and leads to allocation of H for some other needs: it may be another write-to-qcow2-node operation, or allocation of L2 table or some other data or metadata cluster allocation.

5. So, at this point H is used for something other. Assume, L2 table is written into H.

6. And now, our write from [2] finishes. And pollutes L2 table in H. That's a bug.


The problem becomes more possible with compressed write cache, because any flush operation may trigger deferred data writes, so problem can be reproduced like:

1. Write to guest cluster G2, which triggers flushing of data to host cluster H, which is unrelated to G2.

2. Discard cluster G in parallel

[...]

So, problem is simply triggered by parallel write and discard to different guest clusters. That's why I should do something with this old (and most probably never triggered) problem in qcow2 driver prior to implementing compressed cache.


Hmm, probably we can avoid all these difficulties by implementing compressed cache as a filter driver between qcow2 and its .file nodes.. I tried to do it, encountered some problems, but I don't remember what exactly. Probably I should return to this try. Some obvious problems:

1. Metadata write will go through cache, and we should handle it somehow to not break the sequence of unaligned chunks. Simplest way is to add BDRV_REQ_COLORED flag and do compressed data writes to .file with this flag. And cache filter would track this flag for sequential caching.

2. We can't enable caching by default this way, so user will have to explicitly add a filter.. And actually, it's a real problem of qcow2 driver that in O_DIRECT mode it writes compressed data by small unaligned chunks. So, good to fix it inside qcow2..

With filter we avoid the problem of parallel reuse of host cluster, as all writes go through the cache and flushes will be serialized. So, the problem in qcow2 driver is not enlarged by the cache and we can leave it unfixed..

> 
> So the commit message says that “host cluster can be discarded and reused during data write”, which to me just seems like the exact behavior we want.  The second sentence describes a problem, but doesn’t say how reclaiming discarded clusters leads there.
> 
> I suppose what leads to the problem is that there first needs to be a background write even before the discard that is settled only after the re-claiming write (which isn’t mentioned).
> 
> As far as I understand, this patch addresses that problem by preventing the discarded clusters from being allocated while said background write is not settled yet.  This is done by keeping track of all host clusters that are currently the target of some write operation, and preventing them from being allocated.  OK, makes sense.
> (This latter part does roughly correspond to the second paragraph of this commit message, but I couldn’t make sense of it without understanding why we’d do it.  What’s notably missing from my explanation is the part that you hinted at with “when discarding”, but my problem is that that I just don’t understand what that means at all.  Perhaps it has to do with how I don’t understand the change to update_refcount(), and consequently the whole “slow path” in update_inflight_write_cnt().)


Let me explain:

What is the problem? User uses dynamic object, and the object disappear during the usage. Use-after-free follows. This means that we probably want reference counting for the object, so that user will keep the reference during usage, and object is freed when refcount becomes 0. But for qcow2 host clusters we already have reference counting! Still, we don't want to simply reuse qcow2 refcounts as normal reference counters for two reasons:

1. qcow2 refcounts is part of qcow2 metadata and strictly defined. Qcow2 refcounts shows only usage of the host cluster by other objects in qcow2 metadata. But what we want is usage by the process of writing data.
2. we don't want to do additional read/write of refcounts from/to physical drive

So, what comes to my mind is and additional "dynamic" in-RAM reference counter for host cluster. So that actual full reference count of host cluster is qcow2-refcount + inflight-write-cnt. So, what we need for this:

1. calculate these new inflight-write-cnt, increase it before data write and decrease after.

2. update the core thing of reference counting: freeing the object. Currently the object is "freed" when qcow2-refcoutn becomes 0, that's the code in update_recounts(). But we want to postpone freeing until full reference count becomes zero, i.e. both qcow2-refcount is zero and inflight-write-cnt is zero. So, if qcow2-refcount becomes zero but inflight-write-cnt is nonzero, we postpone discarding the cluster, storing needed information in Qcow2InFlightRefcount. And when inflight-write-cnt becomes zero (and we see this information) we call update_refcount(addend=0) to trigger actual discarding of the cluster.

3. we should consider full reference count when search for free host clusters.

> 
> 
> Side note: Intuitively, this hash table feels like an unnecessarily big hammer to me, but I can’t think of a better solution either, so.  (I mainly don’t like how every write request will result in one allocation and hash table entry per cluster it touches, even when no data cluster is ever discarded.)

We can have a list of inflight-data-writes instead. I afraid, we can't reuse tracked requests of underlying .file node, because we should add inflight-write to the list before releasing the qcow2 mutex.

> 
>> Enable qcow2-discard-during-rewrite as it is fixed.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/qcow2.h                                 |   9 ++
>>   block/qcow2-refcount.c                        | 149 +++++++++++++++++-
>>   block/qcow2.c                                 |  26 ++-
>>   .../tests/qcow2-discard-during-rewrite        |   2 +-
>>   4 files changed, 181 insertions(+), 5 deletions(-)
>>
>> diff --git a/block/qcow2.h b/block/qcow2.h
>> index 0678073b74..e18d8dfbae 100644
>> --- a/block/qcow2.h
>> +++ b/block/qcow2.h
>> @@ -420,6 +420,8 @@ typedef struct BDRVQcow2State {
>>        * is to convert the image with the desired compression type set.
>>        */
>>       Qcow2CompressionType compression_type;
>> +
>> +    GHashTable *inflight_writes_counters;
>>   } BDRVQcow2State;
>>   typedef struct Qcow2COWRegion {
>> @@ -896,6 +898,13 @@ int qcow2_shrink_reftable(BlockDriverState *bs);
>>   int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
>>   int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
>> +int qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
>> +                              int64_t length);
>> +int qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
>> +                              int64_t length);
>> +int qcow2_inflight_writes_dec_locked(BlockDriverState *bs, int64_t offset,
>> +                                     int64_t length);
>> +
>>   /* qcow2-cluster.c functions */
>>   int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
>>                           bool exact_size);
>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>> index 8e649b008e..464d133368 100644
>> --- a/block/qcow2-refcount.c
>> +++ b/block/qcow2-refcount.c
>> @@ -799,6 +799,140 @@ found:
>>       }
>>   }
>> +/*
>> + * Qcow2InFlightRefcount is a type for values of s->inflight_writes_counters
>> + * hasm map. And it's keys are cluster indices.
> 
> *hash, *its
> 
> I’d rather document this for s->inflight_writes_counters, though (like “/* cluster index (int64_t) -> Qcow2InFlightRefcount */”)
> 
>> + */
>> +typedef struct Qcow2InFlightRefcount {
>> +    /*
>> +     * Number of in-flight writes to the cluster, always > 0, as when becomes
> 
> s/when becomes/when it becomes/
> 
>> +     * 0 the entry is removed from s->inflight_writes_counters.
>> +     */
>> +    uint64_t inflight_writes_cnt;
>> +
>> +    /* Cluster refcount is known to be zero */
>> +    bool refcount_zero;
>> +
>> +    /* Cluster refcount was made zero with this discard-type */
>> +    enum qcow2_discard_type type;
>> +} Qcow2InFlightRefcount;
>> +
>> +static Qcow2InFlightRefcount *find_infl_wr(BDRVQcow2State *s,
>> +                                           int64_t cluster_index)
>> +{
>> +    Qcow2InFlightRefcount *infl;
>> +
>> +    if (!s->inflight_writes_counters) {
>> +        return NULL;
>> +    }
>> +
>> +    infl = g_hash_table_lookup(s->inflight_writes_counters, &cluster_index);
>> +
>> +    if (infl) {
>> +        assert(infl->inflight_writes_cnt > 0);
>> +    }
>> +
>> +    return infl;
>> +}
>> +
>> +/*
>> + * Returns true if there are any in-flight writes to the cluster blocking
>> + * its reallocation.
>> + */
>> +static bool has_infl_wr(BDRVQcow2State *s, int64_t cluster_index)
>> +{
>> +    return !!find_infl_wr(s, cluster_index);
> 
> I wonder if g_hash_table_contains() would be quicker. *shrug*
> 
>> +}
>> +
>> +static int update_inflight_write_cnt(BlockDriverState *bs,
>> +                                     int64_t offset, int64_t length,
>> +                                     bool decrease, bool locked)
>> +{
>> +    BDRVQcow2State *s = bs->opaque;
>> +    int64_t start, last, cluster_offset;
>> +
>> +    if (locked) {
>> +        qemu_co_mutex_assert_locked(&s->lock);
>> +    }
>> +
>> +    start = start_of_cluster(s, offset);
>> +    last = start_of_cluster(s, offset + length - 1);
>> +    for (cluster_offset = start; cluster_offset <= last;
>> +         cluster_offset += s->cluster_size)
>> +    {
>> +        int64_t cluster_index = cluster_offset >> s->cluster_bits;
>> +        Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>> +
>> +        if (!infl) {
>> +            infl = g_new0(Qcow2InFlightRefcount, 1);
>> +            g_hash_table_insert(s->inflight_writes_counters,
>> +                                g_memdup(&cluster_index, sizeof(cluster_index)),
>> +                                infl);
> 
> I suppose we could save one allocation by putting the cluster index into Qcow2InFlightRefcount and then giving the key as &infl->cluster_index. Not sure if that’s too nasty, though.

Allocations are a lot faster than IO.. So, I don't think we'll see the difference in normal cases.

> 
>> +        }
>> +
>> +        if (decrease) {
>> +            assert(infl->inflight_writes_cnt >= 1);
>> +            infl->inflight_writes_cnt--;
>> +        } else {
>> +            infl->inflight_writes_cnt++;
>> +        }
>> +
>> +        if (infl->inflight_writes_cnt == 0) {
>> +            bool refcount_zero = infl->refcount_zero;
>> +            enum qcow2_discard_type type = infl->type;
>> +
>> +            g_hash_table_remove(s->inflight_writes_counters, &cluster_index);
>> +
>> +            if (refcount_zero) {
>> +                /*
>> +                 * Slow path. We must reset normal refcount to actually release
> 
> I don’t understand what “slow path” means in this context.  (Nor do I really understand the rest, but more on that below.)


In most cases inc/dev of inflight-writes-cnt is fast: it only update in-memory structure. But when full reference count of the cluster becomes zero we call real update_refcount to trigger discarding of the cluster.. This may be slower. Probably the needed code should be moved from update_refcount to separate function like host_cluster_free(), to not cheat with addend=0.


> 
>> +                 * the cluster.
>> +                 */
>> +                int ret;
>> +
>> +                if (!locked) {
>> +                    qemu_co_mutex_lock(&s->lock);
>> +                }
>> +                ret = qcow2_update_cluster_refcount(bs, cluster_index, 0,
>> +                                                    true, type);
> 
> I don’t understand this, but then again I’m writing this very early in my review, and at this point I don’t understand anything, really.  (The comment doesn’t explain to me what’s happening here.)
> 
> Revisiting later, refcount_zero is set by update_refcount() when the refcount drops to zero, so invoking this function here will finalize the change.  I don’t quite understand what’s going on in update_refcount(), though.
> 
> (And even after finding out why, I don’t understand why the comment doesn’t explain why we must invoke qcow2_update_cluster_refcount() with addend=0.)

Sorry for the mess. Here we want to trigger the code in update_refcount() that is freeing host cluster.. I.e. the code that runs when refcount becomes zero.

> 
>> +                if (!locked) {
>> +                    qemu_co_mutex_unlock(&s->lock);
>> +                }
>> +
>> +                if (ret < 0) {
>> +                    return ret;
>> +                }
>> +            }
>> +        }
>> +
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
>> +                              int64_t length)
>> +{
>> +    return update_inflight_write_cnt(bs, offset, length, false, false);
>> +}
>> +
>> +/*
>> + * Called with s->lock not locked by caller. Will take s->lock only if need to
>> + * release the cluster (refcount is 0 and inflight-write-cnt becomes zero).
>> + */
> 
> Why doesn’t qcow2_inflight_writes_inc() get the same comment?
> 
> ...Oh, because @locked doesn’t have an influence there.  Why isn’t it worth a comment that *_inc() works both with a locked and an unlocked mutex?

OK, it worth

> 
>> +int qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
>> +                              int64_t length)
>> +{
>> +    return update_inflight_write_cnt(bs, offset, length, true, false);
>> +}
>> +
>> +/* Called with s->lock locked. */
>> +int qcow2_inflight_writes_dec_locked(BlockDriverState *bs, int64_t offset,
>> +                                     int64_t length)
>> +{
>> +    return update_inflight_write_cnt(bs, offset, length, true, true);
>> +}
>> +
>>   /* XXX: cache several refcount block clusters ? */
>>   /* @addend is the absolute value of the addend; if @decrease is set, @addend
>>    * will be subtracted from the current refcount, otherwise it will be added */
>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>           if (refcount == 0) {
>>               void *table;
>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>> +
>> +            if (infl) {
>> +                infl->refcount_zero = true;
>> +                infl->type = type;
>> +                continue;
>> +            }
> 
> I don’t understand what this is supposed to do exactly.  It seems like it wants to keep metadata structures in the cache that are still in use (because dropping them from the caches is what happens next), but users of metadata structures won’t set in-flight counters for those metadata structures, will they?

Don't follow.

We want the code in "if (refcount == 0)" to be triggered only when full reference count of the host cluster becomes 0, including inflight-write-cnt. So, if at this point inflight-write-cnt is not 0, we postpone freeing the host cluster, it will be done later from "slow path" in update_inflight_write_cnt().

> 
> (I also wondered why the continue wasn’t put before the s->set_refcount() call, but I suppose the same effect is had by the has_infl_wr() check in alloc_clusters_noref() and qcow2_alloc_clusters_at().)

The only change of update_refcount() logic is postponing of freeing the cluster. So, handling of qcow2-refacount is kept as is. qcow2-refcount becomes zero, and s->set_refcount() is called. inflight-write-cnt is a separate thing, not the cache for qcow2-refcount.

> 
>>               table = qcow2_cache_is_table_offset(s->refcount_block_cache,
>>                                                   offset);
>> @@ -983,7 +1124,7 @@ retry:
>>           if (ret < 0) {
>>               return ret;
>> -        } else if (refcount != 0) {
>> +        } else if (refcount != 0 || has_infl_wr(s, next_cluster_index)) {
>>               goto retry;
>>           }
>>       }
>> @@ -1046,7 +1187,7 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
>>               ret = qcow2_get_refcount(bs, cluster_index++, &refcount);
>>               if (ret < 0) {
>>                   return ret;
>> -            } else if (refcount != 0) {
>> +            } else if (refcount != 0 || has_infl_wr(s, cluster_index)) {
>>                   break;
>>               }
>>           }
>> @@ -2294,7 +2435,9 @@ static int64_t alloc_clusters_imrt(BlockDriverState *bs,
>>            contiguous_free_clusters < cluster_count;
>>            cluster++)
>>       {
>> -        if (!s->get_refcount(*refcount_table, cluster)) {
>> +        if (!s->get_refcount(*refcount_table, cluster) &&
>> +            !has_infl_wr(s, cluster))
> 
> Is this really necessary?

Yes. Everywhere when we want free cluster, we should check that full reference count is zero, which is qcow2-refcount + inflight-write-cnt.. Which is equal to check that both qcow2-refcount and inflight-write-cnt are zero. And for for zero inflight-write-cnt it must just be absent in the hash.

> 
>> +        {
>>               contiguous_free_clusters++;
>>               if (first_gap) {
>>                   /* If this is the first free cluster found, update
>> diff --git a/block/qcow2.c b/block/qcow2.c
>> index d9f49a52e7..6ee94421e0 100644
>> --- a/block/qcow2.c
>> +++ b/block/qcow2.c
> 
> [...]
> 
>> @@ -4536,13 +4553,20 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
>>       }
>>       ret = qcow2_pre_write_overlap_check(bs, 0, cluster_offset, out_len, true);
>> -    qemu_co_mutex_unlock(&s->lock);
>>       if (ret < 0) {
>> +        qemu_co_mutex_unlock(&s->lock);
>>           goto fail;
>>       }
>> +    qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
> 
> It was my impression that this function could be called either with or without a lock, that it wouldn’t really matter.  Well, at least that’s what I figured out for lack of a comment regarding the contract how it is to be invoked.
> 

I'm sorry:(


-- 
Best regards,
Vladimir

