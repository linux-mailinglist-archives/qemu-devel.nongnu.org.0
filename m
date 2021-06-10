Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97C13A2BAA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:32:44 +0200 (CEST)
Received: from localhost ([::1]:53950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJrX-0004g6-EG
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJpO-0003gP-2h; Thu, 10 Jun 2021 08:30:30 -0400
Received: from mail-eopbgr80098.outbound.protection.outlook.com
 ([40.107.8.98]:15830 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJpG-0003Zi-D9; Thu, 10 Jun 2021 08:30:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECiNY4PK2vHBO2SS0g4Q+xH6/CrIiCE+4yW2UCxsBpi3rJfEaGq3d7osaF0TRqwie6n98xZzMZS+perM3KZdFb+jddWjQHVu8UbiXe8Yr62Crc68dmZ6rp3A4lwf01UABdidw2k3ER7ZYvwUNVw0e2ItHgBGHeWDYFimJsXcEIo50zjvcwe/bZyQXZSMapa58lqW3T6YUF2g40HEjca/8PzAdVD15ikKAfr87sFdq+wOjPJItRtPooDxKzjKD10V/97c3HewPVQJsXiPKc4/+OK87LJpuy69x0Vv3HUJ1EHzBmN4/++fd9y0+v3i5Z5zmM3ZwO0U/9M421MGvoAeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yzi2UHftJNV3vT68zcDIbJs1NRzbeciSrijbCf7wl/k=;
 b=UbSLfaFyZtWotFTNb1AU3+FzVvDs22iOx2XktaES5Y4mMCmkwxwbhf1pokIpa/vUA3FAiQjSJLXQ5NOngB86J967jiYX9uygUSZR3epv2bhq0X2U9b1t4fgK6ZJZENO3w+W5a22ZrAA8Bwy/UYNjeyFqSGJednAyWaACiCY1qWsb2FXZVAb4Mkl5mGMvswTMgvzG7LrD9vlZ1+rwFLXoIu7EhB3hc2CxEbpd9kk65mdtVByv9AfY3wDiuYTkUyalL+4KcuqdArZnXSgx27ARB8iR58PxZJUmiIdsiOGMHDG0pSUqDZfxnxONNHZfO8GDKJ2qNvtHNu9qC0je1lWmBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yzi2UHftJNV3vT68zcDIbJs1NRzbeciSrijbCf7wl/k=;
 b=kiHgJ4qli4JZlWq0+fGenFQOhuwuJQBweMLNqSMLlj88LqHhEh4c3VCo1sqFVSBQqpWTtl73Ui+Si2o4WijHzWBtld/AiIby3In+eO0arlZFKYQb3ThjmedCMzJzr/8/bQzOi57FVWKmGo2XpEkrwesOXgbcLbeYYliu0BAP6zk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3960.eurprd08.prod.outlook.com (2603:10a6:20b:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 12:30:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:30:18 +0000
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
To: Nir Soffer <nsoffer@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, libguestfs@redhat.com,
 qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
 <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5563d5eb-c90b-6f09-e550-3b39cd76b641@virtuozzo.com>
Date: Thu, 10 Jun 2021 15:30:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR04CA0056.eurprd04.prod.outlook.com
 (2603:10a6:208:1::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:208:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.23 via Frontend Transport; Thu, 10 Jun 2021 12:30:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5ca3fde-8b5d-4a8e-7262-08d92c0b81f2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3960:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3960D00C086990B38AE59CD3C1359@AM6PR08MB3960.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6uj3aIfiqPEjhlKsK/J6f44554IQ0kumJbQHL6hOdYUL9/cfq/kwkEtbyDqA4B6rgHWOaPAK9Lzm/W1bjbmX0aw+IA6kKLuwFf4pCyUGILI5ZsDdRLxRLFWzwf2ns9AioHNPmhSkdekEz6C8hlO6g0UXns4ZELDza14KMbgF+UOLTdRitXWNlA7Pr1fxqWziwOJDG1Q9g2b4FT4vxQZpnJMISExjC3lVFb7ZPnbsuVOls70FkNrL9NRgVniXkLSVvenivYFV8hg2eQs/WeqgULrAuJQ0OV9Lx4wdErkJ+EkjIH+OWIPyZY0k6WBAypHriueDZxecPu7smk1GUjikuUnKkop5pa2zs4TDtmFxK4mMklnJwlQbmnOoqz8Ga4E76mMaPG8CODedHPHvMVQdYf/IhO8akvl8IpK1rcQVvFzqqYWxumhB/p3EONm78xPrIGiY7jaH/CKFWfwVJv/+L0rvboq/FG6d69Q26jOWeeaMtZ7G4fNNLIogRQ2hR4duNvnRkYAa63n/JrhZ0ODslbtaZ7eQRF7FRWsdkEUvgl/sg3suR5sHG+ZjqA7lGDS3ZpiQuw19nwG57VQWM+bicqmr7uD++29xobVwE99FeTXFUioP+dMpP0p1rLhLK5yhsonISf0wVMPIjwSnS8bV/GaDjqOHVBwbCEFrRbPfunVW4e0pr6UIJKeoiBJPHGqnflHA/5u+g5VZZznwokQ6vsHGkgeRWbCVXtDO/JDlhPgekOGlBDhAwun3qRMsb5r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39840400004)(31686004)(2906002)(8936002)(86362001)(316002)(54906003)(110136005)(478600001)(16576012)(6486002)(2616005)(16526019)(4326008)(36756003)(8676002)(66556008)(66946007)(66476007)(53546011)(83380400001)(38100700002)(52116002)(38350700002)(26005)(31696002)(956004)(186003)(5660300002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZnFhbTZxL2g1dERjT0tCMk80SDFWZzdTSXZtU2dmYStJSG90MTgzRHh4ZUNE?=
 =?utf-8?B?aEl5M2dxaEhQMVhSZWZnc3gvTEtabTFuZVp0WjJiMzJrNnUramV5Wi9sdkZF?=
 =?utf-8?B?a2pSZGNzdXVxeWc3TUMyTVBFVEJEQ3Y0b1Uzam9uK1AyMWkrVTcyRll1Qklp?=
 =?utf-8?B?UHdzRXh6OXVFQzhiNmMzTEV0aWxTcXQ2WERYZDkrL0JhVENGa2lmV2NJVDJV?=
 =?utf-8?B?NHRITU9UcC9vMkR5SWlKV2hXVER4OHc4WXF0Qk1WVmY1WlZsb1FsaE5vOUhW?=
 =?utf-8?B?YjBWU29zdlVXUU40L2piVmlYOUNHcVRUcm5TeWJrakp4SmpKUTNqKytaK3pq?=
 =?utf-8?B?NlVnYS9CMGdVWEEyZlp4SmVZaWdCSkZkY3lYTHhPWGNUYVk3dmQrMHhQcFFE?=
 =?utf-8?B?KzQ5Nmg3cVhLY1hKNkVkWkRYMEFCakIwL2I1bDRNajZhbmpLQ3duMEtVU2pa?=
 =?utf-8?B?K3RIa0h4SSt5T2t3SldaaGhwMW1LYWtaTjNiRk1wa0F0MU8ra0p4T084VjBP?=
 =?utf-8?B?VWxVWnlNZkhLWllRb3pESm1PbkFmckJIWXBtcU5KU3JjWExjbG5Gd3dZYkky?=
 =?utf-8?B?eTRqMzNDV0FqVHdzWFZ5TVdUdE1KUVUxd0NLMjdNc25WSTMybWxDMmZadW8x?=
 =?utf-8?B?aW9xeFQzYzdmS2tnVVBxTmpuSkNPalFuRGtYV2pYVVltYnAwbmRzUFhqWnI5?=
 =?utf-8?B?TjQ4anF1QU9GNEhWM0QramExSXNqTFB2SmpVb1VWUUtCUWhqYWlRZFVCWnN5?=
 =?utf-8?B?MGFlaWE1ZE1Wd3UwZTJ6MUhQS3ZVaWJpL0xxUVZKc0dJVFZnU1l1d2R3VUxj?=
 =?utf-8?B?RVVKcUtXMTloSm4vZHhHdUFscktiayt1ZDJpd3R2SnpJbTZqdHNVUlBvTmlD?=
 =?utf-8?B?TnVqY2ZRaTNNaFJSQzVWWTQvZmlHQk5CT1dzeXVNaTltZXJqWHJtRTFjNjhp?=
 =?utf-8?B?ME1naHo0MU9nb1lNTnRLZEhLWDEyM2ljaU9XM2x4bkdYTGxSdlgzcEFxOVlN?=
 =?utf-8?B?OHpubnNLcWx6cW1DYnIzekJsVmpINThwKzE1SW1raVAvMTdEUWpwUnpSK1ll?=
 =?utf-8?B?czJ2Z0gyR0xJYUlnOWo4Rlgvb1NkT0ZNTmlkQUdlenZPcmo2WDZhWkd5TU5y?=
 =?utf-8?B?RE52aCtDNENPRjZtVlJrOVlyKy9kZUZJQkRkQktkY0ZueTM0cGVGbUdWSjhN?=
 =?utf-8?B?dldydnp2WEhwWTZ4TlQ2NkduV1VUbFV1TTh3eStqKzlGQzR5eWpLa1dwM1Vv?=
 =?utf-8?B?cTZvdUtXcjBLbVV2T3ErSFpyWTd6d2lPVVRDV0gzdTZvSFJGZitreDdsT082?=
 =?utf-8?B?NWFEYTVQN1dwbmNrS1NiODMvcGZ3OUE5UW4rU0loY2xhblE2ejhuSklsODh6?=
 =?utf-8?B?Sy9HN0hhdS9wZmFsK3N2M0tseWhzR0NyY1pLcjRzcFllbmlUY0dhTjdrc1Z4?=
 =?utf-8?B?Q1Zjb2V5SkVCdWFQbUE0MWN3clB3bzBhbi9ZdGJieTBEaURNaW1vM3Z2Z0tT?=
 =?utf-8?B?TGlzQmFVK3duaXdFRFByY3Y5T3RqVDVLSjB5Y1h2aWgvL0NRZ2J0dDh3OXBk?=
 =?utf-8?B?Qk5xVEs2S3BWTUlkNk9UVGpVcWlNK0dJQSt2Nlh2MkZMKzNtSFAxdE5GZDBD?=
 =?utf-8?B?UFJiL1YwQy9mTE1RQVE4RTVGRVQxeHVYWHhqM0lmV3d3L1FTOGpGR3NXSmE5?=
 =?utf-8?B?RTVCZFZkSHVIeFRNM1Q2bkxyWGw4NEdyU282MjRYNkN1UWVtTzlvS0pob0tJ?=
 =?utf-8?Q?dMm4ZQxTfqlLC4cuuIwuVpZnA09AT21USMMtsEh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ca3fde-8b5d-4a8e-7262-08d92c0b81f2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:30:18.8059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awrDJ6qZrhuh2pEja8L51HP4BGhXySvbqVYScxg/CBZNyLFS+P7uvpYXGOV0lSpZeOVc8y2jzg3VpxaQwYKNac8/Fw1dzFNiieOjwxCWXF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3960
Received-SPF: pass client-ip=40.107.8.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

10.06.2021 02:52, Nir Soffer wrote:
> On Wed, Jun 9, 2021 at 9:01 PM Eric Blake<eblake@redhat.com>  wrote:
>> When trying to reconstruct a qcow2 chain using information provided
>> over NBD, ovirt had been relying on an unsafe assumption that any
>> portion of the qcow2 file advertised as sparse would defer to the
>> backing image; this worked with what qemu 5.2 reports for a qcow2 BSD
>> loaded with "backing":null.  However, in 6.0, commit 0da9856851 (nbd:
>> server: Report holes for raw images) also had a side-effect of
>> reporting unallocated zero clusters in qcow2 files as sparse.  This
>> change is correct from the NBD spec perspective (advertising bits has
>> always been optional based on how much information the server has
>> available, and should only be used to optimize behavior when a bit is
>> set, while not assuming semantics merely because a bit is clear), but
>> means that a qcow2 file that uses an unallocated zero cluster to
>> override a backing file now shows up as sparse over NBD, and causes
>> ovirt to fail to reproduce that cluster (ie. ovirt was assuming it
>> only had to write clusters where the bit was clear, and the 6.0
>> behavior change shows the flaw in that assumption).
>>
>> The correct fix is for ovirt to additionally use the
>> qemu:allocation-depth metadata context added in 5.2: after all, the
>> actual determination for what is needed to recreate a qcow2 file is
>> not whether a cluster is sparse, but whether the allocation-depth
>> shows the cluster to be local.  But reproducing an image is more
>> efficient when handling known-zero clusters, which means that ovirt
>> has to track both base:allocation and qemu:allocation-depth metadata
>> contexts simultaneously.  While NBD_CMD_BLOCK_STATUS is just fine
>> sending back information for two contexts in parallel, it comes with
>> some bookkeeping overhead at the client side: the two contexts need
>> not report the same length of replies, and it involves more network
>> traffic.

Aren't both context described in one reply? Or what do you mean by not the same length?

>>
>> So, as a convenience, we can provide yet another metadata context,
>> "qemu:joint-allocation", which provides the bulk of the same
>> information already available from using "base:allocation" and
>> "qemu:allocation-depth" in parallel; the only difference is that an
>> allocation depth larger than one is collapsed to a single bit, rather
>> than remaining an integer representing actual depth.  By connecting to
>> just this context, a client has less work to perform while still
>> getting at all pieces of information needed to recreate a qcow2
>> backing chain.
> Providing extended allocation is awsome, and makes client life much
> easier. But I'm not sure about the name, that comes from "joining"
> "base:allocation" and "qemu:allocation-depth". This is correct when
> thinking about qemu internals, but this is not really getting both, since
> "qemu:allocation-depth" is reduced to local and backing.
> 
>  From a client point of view, I think this is best described as "qemu:allocation"
> which is an extension to NBD protocol, providing the same HOLE and ZERO
> bits, and qemu specific info LOCAL, BACKING. Using different "namespace"
> ("qemu" vs "base") makes it clear that this is not the same.
> 
> We discussed in the past the option to expose also the dirty status of every
> block in the response. Again this info is available using
> "qemu:dirty-bitmap:xxx"
> but just like allocation depth and base allocation, merging the results is hard
> and if we could expose also the dirty bit, this can make clients life
> even better.
> In this case I'm not sure "qemu:allocation" is the best name, maybe something
> more generic like "qemu:extents" or "qemu:block-status" is even better.
> 

Oops. Could you please describe, what's the problem with parsing several context simultaneously?

This all sound to me as we are going to implement "joint" combined conexts for every useful combination of existing contexts that user wants. So, it's a kind of workaround of inconvenient protocol we have invented in the past.

Doesn't it mean that we instead should rework, how we export several contexts? Maybe we can improve generic export of several contexts simultaneously, so that it will be convenient for the client? Than we don't need any additional combined contexts.

-- 
Best regards,
Vladimir

