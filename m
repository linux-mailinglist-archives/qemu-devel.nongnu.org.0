Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AF732536F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:25:32 +0100 (CET)
Received: from localhost ([::1]:39196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJSE-0007r8-MA
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFJQg-00074q-2v; Thu, 25 Feb 2021 11:23:54 -0500
Received: from mail-eopbgr40121.outbound.protection.outlook.com
 ([40.107.4.121]:48094 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFJQc-0006Zd-7C; Thu, 25 Feb 2021 11:23:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoncMOJOWF6IVkBE88DC3uCzzuUo8LpWaSgwPHezd8udhqMCy3dusQPIokRjPuwMfvxaw7VjnerqJ7HxapbbJfCGMC1ZFiVNbEfur9PVN/ZWtPtl22NW/I0LfKCGVEtSgzb7bGJsmAuXrVeWuEeV9K2Ddu+iYTOGJRl5hA78EaneQVaAh/LpR1+UkGk5FScYvua32ctKdB29IadjRlJXxCGJeWtLi+5yOASBq64gBEnBQgn3+u1jAmBbFSkIvxnHOo+yJqgmkzkJ6In4kDRqjot76BpvVDQu74kC2xK8JhDgwvfFwXs5EIJqgbe7sC0gjHUFbjG0uJauSUKla2aLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyRptnw+vzIHuYF8xItMauoqSo5hzo30rIQ2MbBbD5w=;
 b=ntsaFuyPxphdjK2eU/PiQPLtZp/Yzl0PQIMfd8X92AOh8npMA5PLAdbUP93rTwlPv7plxIfGr5+cchj8MzoMmGao8x2og4fEeIFHAeWi0UHMwckMKsQDiHJb3/iUzqSmvzIPJki7VlGSMs1eM/29Q6coGtIBY/aKaDSsyNtTZy3OtHA2qDI+o5N30f0XQJkcLoS7WB5q6aaamIrtQkyjbLTq1jrdvwvoC+qhSPEsHzEzH9460ApxgzB0lGzv21fczVdqz9mkGBMXubyOs2OfK1O0c0Jk4T+R3PHqSTjJG0cVC8w/wJGFM0TcIY63AgxJMa2CRyql5NwKfOIxLav2mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyRptnw+vzIHuYF8xItMauoqSo5hzo30rIQ2MbBbD5w=;
 b=YxSfTBy8ozcywSA81Okkxn0/DApd+aot34/3lmFwQ1EvhZee/IYuKTz/DQ783wO9KeUaZ+Pq2fjGTrvH46NSNRYvwL/Fqhu56tYNRl22lZrimllp6kTC3nNHzovX0iiaIJ16deiz33LUnTuL3NIijtEk3uipf0b2hkl5CIRrkEE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6709.eurprd08.prod.outlook.com (2603:10a6:20b:395::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 16:23:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 16:23:45 +0000
Subject: Re: [PATCH 2/5] block: Fix BDRV_BLOCK_RAW status to honor alignment
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210218201528.127099-1-eblake@redhat.com>
 <20210218201528.127099-3-eblake@redhat.com>
 <35c70ab7-e536-9893-9575-a471e19497ec@virtuozzo.com>
 <aa338b81-9e89-ac40-a3da-aff9c8b512ee@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <537c23fc-9b49-03b0-9648-400764a776aa@virtuozzo.com>
Date: Thu, 25 Feb 2021 19:23:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <aa338b81-9e89-ac40-a3da-aff9c8b512ee@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR05CA0325.eurprd05.prod.outlook.com
 (2603:10a6:7:92::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR05CA0325.eurprd05.prod.outlook.com (2603:10a6:7:92::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 16:23:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99b921fd-5b1e-4e4d-c006-08d8d9a9b920
X-MS-TrafficTypeDiagnostic: AS8PR08MB6709:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6709286C1DF405626B8D9A62C19E9@AS8PR08MB6709.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: blJ7bLijcG66ZFz+uw09abHYeBNQraYuNPMTEm0elZDqfMPZV2P53dE3aTA9jNe1Qsrk7I5nirVr37WueW2EJ9TorjRuhgkHEeQxVUP0PU+Ypiq96uumdbzmyTatxHRI0UfYj9+PLCohuyDA3a1UnfEhz1WWC3BIHT5QjJWr4LT37MRDeJFOjSu9Lhkfyu3fDlTO2CO7bw1BeKY8oswoJe0wvJcqxQzp9eMyzg6cvkoXL3fBvsNfEFupPx+mlMRMJgvVwxjWvcKJR6/blkwqSoO82Am/WGDYtjyYZl0V0qWl/9GplypOuxhZxAbsxk0q3Mif/++W9zfcHFnxKzHnN4LjqCT1ofrfTtf0w14wPHe2gaAAumyG1gdfeMnTlYWyvmkbvPAq3dM48tt3LRa6FWfA7MqI3An64vAVfIqic6owU6FE+OG3GlnAYWd+jyEmWn+WgFssjulpyazLQvDrBXs+MV3biKS8R0BnIRAvTEOMuBON+nd8hAt+W/ypv8i+BaTSzIqtTdYUyMTnpmGL9DDbKI6ngas0DyFeKJh/t8s6FjdR8QYrCW5CEqYhGEwSX3EsRJ4JX/mAIWKaYyS95HJT7p2pWQ6n07Rd7cA3SIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(136003)(346002)(396003)(366004)(186003)(66476007)(66556008)(2906002)(66946007)(6486002)(26005)(4326008)(16526019)(31686004)(16576012)(5660300002)(54906003)(83380400001)(53546011)(6666004)(31696002)(478600001)(8936002)(86362001)(8676002)(52116002)(956004)(36756003)(2616005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWZ5Ym1SdlFDTHhqL3o4b1Uya3VhbzRpbFlQRGFnNWIwOHZ1cjBJTkFiMzlG?=
 =?utf-8?B?aVRGZlBtOVJxSW8yNzlHcThpNThKRWh3MEpHTTFMQ1JJUDdYbzF2djJUMWdp?=
 =?utf-8?B?em9QekMzalBobXRFN2JpdXBUM29PaW96MzAwTXZMcW94OS9CL1pWSEhPa0Vm?=
 =?utf-8?B?dWpLU011OFl2TXpzOHlsQzZ5em16MFF6dW5CaTNTd29Vc21RNndaYTRDVGNz?=
 =?utf-8?B?U1Q5ck5reDN6d0hkdTQ5NzZlQmZQaEFibTh3VVlUY0RWNDNFK3BEKzhDNGwr?=
 =?utf-8?B?bTZwYUZlZmhYcFl0SWdRTTQyQmZHK3hqZDNQdDBvYTFZQTRhdnNiUUhVQzEr?=
 =?utf-8?B?RVpleCsrazB3WERobTlKMlhXbGJPejlaTXlmOXUrUVZGSVdqWFlzRXR3cHJa?=
 =?utf-8?B?K3JoRDV4MVNvOTArTnFSREhOU3BDZ21vOS9CeUdyVjN5TDU4S2I2bXNGUThs?=
 =?utf-8?B?OEZsV25nRnAzRWgrWHJxUlVwRlJDczRraFcwTy96NXpxcG5HU0ZSenkwdDB1?=
 =?utf-8?B?SnpnUk1obGpFUW5RRG5wV0t1K2UxSDl3aUFmMWJaS3BHVWZ1MjJISmxhZjF5?=
 =?utf-8?B?cTI0MUdHV1JBWlFsVGhraHp4VXpnK0lUWUNNVHplYVgydXprMjhZb0xKdWtQ?=
 =?utf-8?B?M0s1V3JseTdSZk5iSGc2citWUGZEeGlVeUdkeFpDbXdSSFVoN0Fna216T2dO?=
 =?utf-8?B?MXJHMklSYnlsL1lIeFhzNCtpdjRzTkh1NFFYWFJBV0NNMjJQM1ZZWW9RVWJt?=
 =?utf-8?B?Q3cycS9wcFdXU1NjUUU5UFpTdnRTV0U0YmxDd1VmeUhRczcya1BmMGhiTHZR?=
 =?utf-8?B?cG5BUUZkdURVN08rK2ZaNDQrRE0wY3M5ZjN0WXBUdXBoOG5jdjJ0NlZCU05T?=
 =?utf-8?B?cTBxaDRJWVhrZDlaS2EwdzFRTjdzNTZYWFlZYVUvS0V6VDB6SkxkZmgwV2lS?=
 =?utf-8?B?ZjR4UVA1eXFsbnFObW94UEZOMU0xb3NiK21oOVo3WkFOZm5xNWZIWXVmb2sz?=
 =?utf-8?B?MGQ3REk0RWZ6VkRQQnBPYzlyd0VFRVptR1BXcWNUejNEd05pTEtSZ2ZKbW5U?=
 =?utf-8?B?UEF3L1RYbExNZ2M4V2N2WjNqV2JBcEVtR1puZmF0QUVnaTQ1dGJTMW5TUGF5?=
 =?utf-8?B?dXhHbUhEQlc0R0RnNUxncDk3dTFNdFI4NDQrNmVaRUVRb2xwT2pxVnNFYmZ2?=
 =?utf-8?B?REhORzkxbXRicnNkWTJrM1hlMmI4TlZrRzBMMmFnaTNFRURJZ1UzZHBEeEcx?=
 =?utf-8?B?VURBcmFtQ0pRTUR2SFU4TWtTWWJ4U2N5VUxLQXF1RWZzV0xjOUVwTmc0TUUz?=
 =?utf-8?B?b09NYVNlZkRScUdGT3R0aC9sWVVEaHRGYU5kdE1zYUJvc05idXhyWit4VllR?=
 =?utf-8?B?aXdmZEtFK2swaXFtZDdRNVhiRlZrcWFzbUFkeFZJa1RKcWI1cHpiUUczV1hn?=
 =?utf-8?B?WlFpMW0xOVhhSkFmMmZQeWNpMnhZWEVqRnR0MTMzZGpiTGkvb1N3djVRNHlK?=
 =?utf-8?B?aWliOGc3eFZDSzhrMndRcndIMmRSWk43c1dGYmRzdEIvcmZXQVloa0U5Y3BN?=
 =?utf-8?B?akMzMjhsQlZRZ1ptc052WFUvSzhRZFVNVWtzczMwSnlBQ2w3cmtvTjNoaSsy?=
 =?utf-8?B?Wlp6M2hkUWFEaGNuK1A2Tm1BcUpHRTJrei9hMk5NSW1KaUx1YUhUVXQ2bVND?=
 =?utf-8?B?SlA3eTgvaC8vTDVnMlpHZks5UUg5Wlg0OTNNeUQ1VmwzUFZkTHhrOFFDV1Bl?=
 =?utf-8?Q?B7AXNxAYdP0fHoUbNoHjbdRPboEY0dyHD3vWRhl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b921fd-5b1e-4e4d-c006-08d8d9a9b920
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:23:45.4663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1Qi1I6UijiEzzSA3hilfZevF8p8ER8iqpnFMUz24WuCpqs5RZevmCMkaTI3wq8MfjWHqSHgF1TpO1AYNtDOYa+7fS7jnFZ+bCD/3h6mlkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6709
Received-SPF: pass client-ip=40.107.4.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.02.2021 19:03, Eric Blake wrote:
> On 2/25/21 8:55 AM, Vladimir Sementsov-Ogievskiy wrote:
>> 18.02.2021 23:15, Eric Blake wrote:
>>> Previous patches mentioned how the blkdebug filter driver demonstrates
>>> a bug present in our NBD server (for example, commit b0245d64); the
>>> bug is also present with the raw format driver when probing
>>> occurs. Basically, if we specify a particular alignment > 1, but defer
>>> the actual block status to the underlying file, and the underlying
>>> file has a smaller alignment, then the use of BDRV_BLOCK_RAW to defer
>>> to the underlying file can end up with status split at an alignment
>>> unacceptable to our layer.  Many callers don't care, but NBD does - it
>>> is a violation of the NBD protocol to send status or read results
>>> split on an unaligned boundary (in 737d3f5244, we taught our 4.0
>>> client to be tolerant of such violations because the problem was even
>>> more pronounced with qemu 3.1 as server; but we still need to fix our
>>> server for the sake of other stricter clients).
>>>
> 
>>> + * - BDRV_BLOCK_ALLOCATED is set if the flag is set for at least one
>>> subregion
>>
>> Hmm about this..
>>
>> We already have mess around ALLOCATED:
>>
>>   [1] for format drivers it means that "read is handled by this layer,
>> not by backing", i.e. data (or zero) is placed exactly on that layer of
>> backing-chain
> 
> If we're reading at a given granularity, then the 4k read is satisfied
> at this layer even if portions of the read came from lower layers.  So
> the logic works here.

Hmm.. I can't agree. This way we can say that everything is satisfied at this layer. Even if no data in it, we read from this layer and it somehow takes data from lower layers.

It's all about terminology of course and we can use same terms for different things. For me ALLOCATED for format layer works as follows:

The whole layer is split into clusters. Each cluster is either ALLOCATED (format layer produces data on read somehow not touching backing child), or UNALLOCATED (format layer just calls read() on backing child with same offset.

And before your patch block_status request never combined clusters with different ALLOCATED status.

ALLOCATED status of blocks at some layer of backing chain is significant for block-jobs, and if we have several sequential chunks with different ALLOCATED status, we can't just consider all of them as ALLOCATED, because in some scenarios it will lead to data loss.

> 
>>
>>   [2] for protocol drivers it's up to the driver, which may always report
>> ALLOCATED (being more compatible with format drivers) or it may
>> sometimes return UNALLOCATED to show that data is not allocated in FS..
> 
> We've been moving away from this particular overload.  What's more, most
> protocol drivers that set it at all set it for every single byte,
> because protocol layers don't have a notion of a backing file; which
> means that if it is set at all, it will be set for every byte anyway, so
> the logic works here.
> 
>>
>> And this way, bdrv_co_block_status_aligned() is compatible with protocol
>> drivers but not with format drivers (as you can't combine
>> "go-to-backing" information of several flags, as for some scenarios it's
>> safer to consider the whole region ALLOCATED and for another it's safer
>> to consider it UNALLOCATED.
>>
>> For example for stream target it's safer to consider target block
>> UNALLOCATED and do extra copy-on-read operation. And for stream base
>> it's safer to consider block ALLOCATED (and again do extra copying, not
>> missing something significant).
>>
>>
>> I think, to avoid increasing of the mess, we should first split [1] from
>> [2] somehow..
>> Assume we change it to BDRV_BLOCK_PROTOCOL_ALLOCATED and
>> BDRV_BLOCK_GO_TO_BACKING.
> 
> Maybe it is indeed worth splitting out two different flags to fully
> distinguish between the two overloaded meanings, but that seems like an
> independent patch to this series.
> 
>>
>> Then, for BDRV_BLOCK_PROTOCOL_ALLOCATED we probably can just report
>> BDRV_BLOCK_PROTOCOL_ALLOCATED if at least one of extents reports
>> BDRV_BLOCK_PROTOCOL_ALLOCATED. (probably we don't need
>> BDRV_BLOCK_PROTOCOL_ALLOCATED at all and can drop this logic)
>>
>> But for BDRV_BLOCK_GO_TO_BACKING we'll have to also add
>> BDRV_BLOCK_GO_TO_BACKING_VALID and report
>>
>>   * BDRV_BLOCK_GO_TO_BACKING | BDRV_BLOCK_GO_TO_BACKING_VALID if all
>> extents report BDRV_BLOCK_GO_TO_BACKING
>>   
>>   * BDRV_BLOCK_GO_TO_BACKING if all extents report no
>> BDRV_BLOCK_GO_TO_BACKING
>>
>>   * <nothing> if some extents report BDRV_BLOCK_GO_TO_BACKING but others
>> not.
>>
>>
>> Hmm.. And, I think that there is a problem is in NBD protocol. Actually,
>> with allocation-depth context we started to report internal layers of
>> backing chain. And if we have layers with different request-alignment
>> it's not correct to report allocation-depth "aligned" to top image
>> request-alignment.. So, for allocation-depth to work correctly we should
>> extend NBD protocol to allow unaligned chunks in BLOCK_STATUS report.
> 
> The NBD protocol says that base:allocation must obey allocation rules.
> If we want to declare that "because qemu:allocation-depth is an
> extension, we choose to NOT obey allocation rules, and if your client
> connects to our extension, it MUST be prepared for what would normally
> be non-compliant responses to NBD_CMD_BLOCK_STATUS", then we are free to
> do so (it is our extension, after all).  Particularly since the only way
> I could actually trigger it was with blkdebug (most format layers
> support byte-level access, even when layered on top of a protocol layer
> with a 512 or 4k minimum byte access).

Hmm, NBD spec says in description of NBD_CMD_BLOCK_STATUS:

The server SHOULD use descriptor lengths that are ..., and MUST use descriptor lengths that are an integer multiple of any advertised minimum block size.

> 
> So if you think it is better for me to respin the patch to fix ONLY
> base:allocation bugs, but not qemu:allocation-depth, and instead merely
> document the issue there, I could be persuaded to do so.
> 
>>
>> So, finally:
>>
>> 1. making bitmap export extents aligned is a separate simple thing -
>> that's OK
>>
>> 2. making base:allocation aligned is possible due to good NBD_STATE_HOLE
>> definition. So for it it's correct to combine BDRV_BLOCK_ALLOCATED as
>> you do even keeping in mind format layers. We call block_status_above
>> for the whole chain. ALLOCATED=0 only if all format layers refer to
>> backing and bottom protocol driver(if exists) reports "unallocated in
>> FS" so that correspond to
>>
>> "If an extent is marked with NBD_STATE_HOLE at that context, this means
>> that the given extent is not allocated in the backend storage, and that
>> writing to the extent MAY result in the NBD_ENOSPC error"
>>
>>     And this way, I'd prefer to fix exactly base:allocation context
>> handling in nbd-server not touching generic block_status which already
>> has enough mess.
>>
>> 3. fixing qemu:allocation-depth I think is impossible without allowing
>> unaligned chunks in NBD spec (really, why we should restrict all
>> possible metadata contexts so hard?) Or, if we are still going to align
>> allocation-depth results to top layer request-alignment we should change
>> allocation-depth specification so that that's not "actual allocation
>> depth" but something >= than actual allocation depth of all subchunks...
>> And that becomes useless.
>>
> 


-- 
Best regards,
Vladimir

