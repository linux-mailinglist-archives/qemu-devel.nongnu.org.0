Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4E4378C90
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:08:58 +0200 (CEST)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5ec-00035R-2e
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg5dH-0000pK-D8; Mon, 10 May 2021 09:07:37 -0400
Received: from mail-eopbgr00120.outbound.protection.outlook.com
 ([40.107.0.120]:9814 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg5dC-0001rN-Mf; Mon, 10 May 2021 09:07:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEXzUOOg9ctkZuf2DBqaqInun8YIAX6+bdel0gmJH6LE6A/ysvVmdU+P3IAAmBYupbGBfYwK9ZrVdBhTHaJ+6TSEEAeUHeJv91wKuQYrB6F2Ok4LncZv2hdyMzQ+k/JDU96VA1tXefuUgJ62VAUKQdnsiwZEhURFiEzFzHZpYpfec2s7sZBLs/ZEbekHMce5Z0RiTLjOgzBqM1guBjRgf/zYgMhnzic8nLhcXQPUGH37BMA/nuajBj4oZfesz+Q5+QBaWNWrslo8doGe1A+GnQXH4CmCF2O0w211hLOOo2aPXtIIEON1f6l08gvIvUiBtUaUEb+pjfbcKfEHCg1L7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAFX5ZG4Qqp2DTi8FkLP18IjOB4bqRUgraSX+W2oWQo=;
 b=QkmZ1pORApjKKyKFjOuCC5MI5l7bSQA9zAJy6NhPlLwb9M3JuBCgCQI4eszdyRbEuGnF4M/UCnHE/mrBKy+sXC/IyUkFmGhQFvRqk4A9Ds/XgUjuf+CG8pH8q8W+YEgn4/lhO9qd1eDN/wiysEh8Z3iV0ElKx6nZUdXJZwaSt5paXTXWwRnfUqAvJ2ez5rBAe3UnmQxWmUJHe+i41kF+RMIP+KItyJ+4VFakJdLdhXJAB3nqcqmOT2Fm612aw124xcd7MeoK9BK0p55OSH1dGvH4Jg5DcKI56qWYPw1F5esv1u0LI7uAF1+PV1e7a6DaXro2MnfsObkl1yuGjdhCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAFX5ZG4Qqp2DTi8FkLP18IjOB4bqRUgraSX+W2oWQo=;
 b=ZOzlPAvQ3SBCTXNmfddy2vI2OiG4mWrTA/lxVEPgKlwLW9eMRHubNcUMC5XGg2Dj3uhXBOnqbfWMRuNyg0dxdb3VJ21D8m4fbyF9o/Vqj3RZGNusEeYJf0P3qBJJxYwMxlMCkUmNX9XpuBjmXfai1DljhkhDsr8beSyNYcf5Gl8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Mon, 10 May
 2021 13:07:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 13:07:26 +0000
Subject: Re: [PATCH v6 00/12] qcow2: fix parallel rewrite and discard
 (lockless)
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <29c89914-dd9e-1426-3596-7f8d8684b68d@virtuozzo.com>
Date: Mon, 10 May 2021 16:07:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.12 via Frontend Transport; Mon, 10 May 2021 13:07:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22f9388e-8c65-4aa9-5325-08d913b48f14
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB447006848F8331639C06C2BBC1549@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NreX2WWmn6L3TwY++mOWR4ZmLUhnuHmd/930w4oLptqXF1EbAr2xjjVFnPv0LzRkJ7TTwHFjkipIZAPy5fONWbs0R0+SiQoUauPI6IPc/726Z6J6U0B8iJJHm91saQI+6Il+OSMD+FyIR2uojp105/ODoNccp2AqLBl9IBEGvESV2isWZLPs9AnDWNYIDr0FV2YlQAuQPyqQvEyXajxm/lf/oWeTPXt9MPToeh2nS4qCQjzWp7j0hrtHRgy1l2M6AM2f3VCTXuUxZ8G2dr4Lgpaq+9wa1h/CZrRCcZ2xwSY8emIACPdr2VWs4J4LDGAO9IQz2NAMFkoSjlpsZOeQ9JeD/o2H1ToW99TGDcKdDbkAhdjJMbQ0nhbJDg+RzqImLLyjvE6k+/TBoB2p3OkLq4HPAeGGd7WLqqnRcoeJp31+RjHpKj1dIzP/XyoEI6yzblKzwF4maWb7/NIe1rMeE+Dhi5AkuZ6L8irQyMwOjjYCBcrN1y/nN0imFYnjcrCprHUdo48PLvg/E4nHxQQkB1SRC2T8CRviI07VdBB0BCTko1mx4BgmHnxe0sRHmqh6E/s6DfIMIaQWgXErWQtKNkOu97SK7SCr6JhSevTutAjJ/siwV7pTAxH8V0SI7Bugf84taqLulgSsrHvR6kArIWgEg9TfB+SqckiZPff8hmQL40fclvr4AbI2eTTC3oqmrw2ZmBEopiLxdu/w+x9GiTbejpQLJMJLwgxcWzw54EA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(396003)(376002)(366004)(346002)(478600001)(16526019)(8676002)(6916009)(4326008)(316002)(16576012)(186003)(36756003)(8936002)(5660300002)(66476007)(66556008)(66946007)(6486002)(2906002)(38100700002)(38350700002)(31686004)(52116002)(107886003)(83380400001)(31696002)(26005)(86362001)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SE13ZnQ1K3hEVHJOSmRyZnBHZnZ6enVJVlBYbkQ3djRRY2srNUlJTGtwUS9z?=
 =?utf-8?B?cDg5NVpGL3dVZkczUzlGcWV3bDlVdXJUNWJxMnRGL1hnUEFTMWxRSlZoMWFz?=
 =?utf-8?B?emlrdUlpalZjRFBoUmo1d3BBblhMMkFyUExqM2FFRWxYNnNka1IxODF1dUV3?=
 =?utf-8?B?QVNTQ0dJVjh2clh3OTNmT3kvRnhnN1VFc1BtNGJQQzFvM2RHQzFGUWNpczgw?=
 =?utf-8?B?cUwySUlldGJGTGlJZTQ3cFc2SnVtYVdSTWpUdVZBaCtIOHlGZmM3M1Zvb1h5?=
 =?utf-8?B?OHYxOW1FVnZUdHNueWxqMVlHZ3ZVMDE4aDRoNVprTy9BL2ZPeVB0Z1h0Yndk?=
 =?utf-8?B?aENsZzliT0VjMDlyUThVWGY0R2JpZU5NbVlBTXJROG0wRjFpOXNIbm9lYWl3?=
 =?utf-8?B?STMxakFTK090dUZldFl6WDRrWFJTamlsRnd2ejV2NmQxOXFJSDkrcDQzNHQ1?=
 =?utf-8?B?YlV6THoyUVUrTGhOelJETWZ5ZnFaUzBpZWNpUmhLTVRkbFcvTk4xMG5MTEEv?=
 =?utf-8?B?bWp0YjlqY2FvU0k4eTVGc3grdWpRUTE5VmZPVXFXSWlPZFMvc3JvZEd0Nnlu?=
 =?utf-8?B?SXNDcllSa1d3VEh1VC9CYTZtL1Z4d1UwOTRQVDRSRHBKSmpMOGxvQzdOTjVP?=
 =?utf-8?B?TmJSZ3EwbHpSeXAzUWI1SEJSMEJJK1pqMkhvbmdwUnY0bWpOS0RGMkhPMFZS?=
 =?utf-8?B?MWpiZ0ZlRk1qTS9NaFJWL0RKUk5yMnYxWCttQUYrbkZEZURsZFdRVThGVlc5?=
 =?utf-8?B?Q2hvVEdIKzcyRmI2OG1aLzgvekg3Q25jekE2dGpjSDFtbHlLcnBCMytNdTdF?=
 =?utf-8?B?SHpFb0VPYmtVcHVoOHp5Uy9QdXRDSHRwUTJoUFhrcEd3VlY0elRBRWNYNWho?=
 =?utf-8?B?MUR3TGQ4K080dFpUL0tTZDljM2ZvTEdhbyt4cVlVcTlBNnhTd3BvaVJwNGpE?=
 =?utf-8?B?UmlXL1FBMUlqZkhSZmVTQXBXeW1BeWVOcFFVenloNFVodFhaZkt0ZVdQTjdO?=
 =?utf-8?B?ZG4zQVNFNGVHdGptYkt4bEtzVnRwNjJWdzRQUGNtaFlwSmF2YmxWSDBYOEJl?=
 =?utf-8?B?bXVGSktlU2ovV0VmZTk5UlVMT2N5Q3NtVzRJdGV2Y2VOdjRwTlRMZzVFUkJS?=
 =?utf-8?B?a3JGb1ZBS1Y4OW1sdEtTVGM2Z1BUS2lIdGxib2doZ2Ezb2NrMExhamVBdXpG?=
 =?utf-8?B?Q2V4QXIwci9GZGQzdDd6L1VMNW5qMkxDWFlQdTNkYm1qbk9CaE5xMFF6UnJZ?=
 =?utf-8?B?RnVLM3MxdDJEVXpyL0t3RzlabmVkaUZYUXVVSTRRZERCcm5TQ3Q4RzQyWXlM?=
 =?utf-8?B?RmlSMWY5TnpNVjRJRkdiVDNVaDZHL2ZUZE1qNTVaTFpoMjVObE81dGlUb0M4?=
 =?utf-8?B?d0dLRnpnWjNtdXl5MlNNdVVWMjFTb1VwOGl6QUd6SEYvVGNxbWJ5NERkeHZ4?=
 =?utf-8?B?ZEdsTS8xblhPc3dxd252b013K2xtU0kvVUt1V0dYc0M3alBNU0RjZ21XTzht?=
 =?utf-8?B?RlZZQit1bEk4WEd2NGlHa1J2dDR2d3BuR01ZRllwcktncmllYlF1R3ZucEtO?=
 =?utf-8?B?VHpSMndoZXRvTE40bU1CYUxnWi9FQUVLcjJRajhYRFU4YzM3Q2IrZE9qSHUr?=
 =?utf-8?B?UWxoQ0JoSUtwNW9BbG5CczBKYmZqb2wrMWNlYlNqNGdFTFhxejhINnNFTFZp?=
 =?utf-8?B?dWJ1U0tudFNhUHpwODh3aFZSUGtBaWxnVWFuSll2SUQvZ1I3UDBIYXRWYlVI?=
 =?utf-8?Q?DZNVFB8U2rImG1JALTFdy8kCzHxNIiJZDhzOL19?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f9388e-8c65-4aa9-5325-08d913b48f14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 13:07:26.6574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edglBJdFgv2If/uexL9T87R79vE62miCKMQIZ71+qE2CQzm7fmErnXpj9UF6mU080Vp/lKQWucXV1UjA+UG6Y2JL5HAbCtla9LRYYCBCDyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.0.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Hi!

Kevin, what do think on this now? Do you think "[PATCH v4 0/3] qcow2: fix parallel rewrite and discard (rw-lock)" still worth to update to cover reads and resend? (consider also my replies to "[PATCH v4 0/3] qcow2: fix parallel rewrite and discard (rw-lock)" branch)

22.04.2021 19:30, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> It's an alternative lock-less solution to
>    [PATCH v4 0/3] qcow2: fix parallel rewrite and discard (rw-lock)
> 
> In v6 a lot of things are rewritten.
> 
> What is changed:
> 
> 1. rename the feature to host_range_refcnt, move it to separate file
> 2. better naming for everything (I hope)
> 3. cover reads, not only writes
> 4. do "ref" in qcow2_get_host_offset(), qcow2_alloc_host_offset(),
>      qcow2_alloc_compressed_cluster_offset().
>     and callers do "unref" appropriately.
> 
> Vladimir Sementsov-Ogievskiy (12):
>    iotests: add qcow2-discard-during-rewrite
>    qcow2: fix cache discarding in update_refcount()
>    block/qcow2-cluster: assert no data_file on compressed write path
>    block/qcow2-refcount: rename and publish update_refcount_discard()
>    block/qcow2: introduce qcow2_parse_compressed_cluster_descriptor()
>    block/qcow2: refactor qcow2_co_preadv_task() to have one return
>    block/qcow2: qcow2_co_pwrite_zeroes: use QEMU_LOCK_GUARD
>    qcow2: introduce is_cluster_free() helper
>    qcow2: introduce host-range-refs
>    qcow2: introduce qcow2_host_cluster_postponed_discard()
>    qcow2: protect data writing by host range reference
>    qcow2: protect data reading by host range reference
> 
>   block/qcow2.h                                 |  26 +++
>   block/qcow2-cluster.c                         |  55 +++++-
>   block/qcow2-host-range-refs.c                 | 174 ++++++++++++++++++
>   block/qcow2-refcount.c                        |  61 ++++--
>   block/qcow2.c                                 | 118 ++++++++----
>   block/meson.build                             |   1 +
>   .../tests/qcow2-discard-during-rewrite        |  72 ++++++++
>   .../tests/qcow2-discard-during-rewrite.out    |  21 +++
>   8 files changed, 475 insertions(+), 53 deletions(-)
>   create mode 100644 block/qcow2-host-range-refs.c
>   create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
>   create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out
> 


-- 
Best regards,
Vladimir

