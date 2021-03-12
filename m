Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD17339031
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:41:48 +0100 (CET)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiz5-0005Wz-53
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKivM-0003Zy-PV; Fri, 12 Mar 2021 09:37:57 -0500
Received: from mail-eopbgr60112.outbound.protection.outlook.com
 ([40.107.6.112]:65049 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKivG-0003G0-8G; Fri, 12 Mar 2021 09:37:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bl84aw2y9+r1F/D/numcZ1KfOs+JDWu7KoMFfo6Jxxf+P9gL9wVBlV/jqwZXxd1e0Lc3AxTfWj094eQ49XvNArEI3RS/Nrn2TBnHjZlUHiJXwlhnH6OZgFWW9+VeR377ukSPBnsbpNS9+3BQrLVAOrKd9Td4TXUkVgk91I6xu/kXq607h3m++fxuC4Jpmlf9CfoQ8fh+6tELgafR+worSq5Wjn5c1tb4piW4E5SK3+hkAOkSrRzqrOmggcfKkAgrkeKh+xIuWnL6OV1fxVlEL3AuBiChyOsg9BtgDWqr8XsEg0MpSJCPJUcvtx37eg/mOj0Xz0ihcSw5XqN0ivBhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1/yDCCj6Ne8/0XqcqChXLvJuA+T/lNLGvl/z69vZ2I=;
 b=XNYM2ZdgNdQTYWyt9iwAjgpsWHdNIA0hstuJfq/WN2J+xErZF8sg1P31hArYq7yaurQdbyUpuHkHMovYPqhMqjjDqGvE8JQ3jpctObIIaCT86aXrsISOvSnEobRlneXG8FYu9pwyRuMtCWi/OlsqbPx0EznhpSMjELXyaby9c67BRk3PfX/V/xQBqNpVGr/IxSJHMtkue8Le5tofjWd+BsWfpnAYVbI5mNiPCI1X2/+R9PvN2DE9TnQWXam4Mb9tCs6chyq/5xE1KGxRWQ99kKLXFIxKQAX74iXKwTXTjngvH/hD1egxn2DK5B6IX/ZfK2EA7Vqie94xgKPMmK+n3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1/yDCCj6Ne8/0XqcqChXLvJuA+T/lNLGvl/z69vZ2I=;
 b=HMklcJgYwt+uRtNYTHJXmwUS4T8Y2bTXPRmj/0yGtK9AOOnMvkbqZ68w2zWuaSBEdtVdACtPBJKcBLKzM9S/BIyCgNSsNMowslr/ik+iOinL7XDhuICKh6NcBSh7l6UvrV3wei0yWwv8Ht/rjgP9v5We3pw7YSXlyYIXlnGtjA0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1970.eurprd08.prod.outlook.com (2603:10a6:203:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 12 Mar
 2021 14:37:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 14:37:44 +0000
Subject: Re: [PATCH v3 4/6] util: implement seqcache
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-5-vsementsov@virtuozzo.com>
 <d9a75e53-0791-2cd7-f530-d07ea59fbe59@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f0acd8b3-4f43-1a37-b08c-27f710fb3a60@virtuozzo.com>
Date: Fri, 12 Mar 2021 17:37:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d9a75e53-0791-2cd7-f530-d07ea59fbe59@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR04CA0108.eurprd04.prod.outlook.com
 (2603:10a6:208:be::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR04CA0108.eurprd04.prod.outlook.com (2603:10a6:208:be::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 14:37:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27264115-3494-475b-6a88-08d8e564659e
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1970:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19700C805F5379D46908113EC16F9@AM5PR0801MB1970.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YqdX3Tb/QBZo6b2HnVYMSnGLZMrg2iurbauvKTdNBFVQr31GCEiWjGdFljeBuGpbMIJZxH8ZsW7ctfukNlvVShpbZ90PrfGZKUMhZgSz4QOY1Xfl7Icj/f8dl7btO+o1fCxpcUurdle9Fw6acc7FLN5IHtm2mvBYgZt4imRUChrNYSn0rPRjFpDSdZZ0woWMQpxl611Vz+69VIrd9olI8xlH6utfPrFhl8rzseAnBEoRmdiVGlvSs4RAHPwKBq5eG2UL3fyJkO5hu8uD9Dsp2E7u7BrdBhsh2GUDtL6v3YHJCVYMkWDRiIQIPjsBFhObt96bFErryu9h1sIooEBkmwa7U3sS217jU1jdRSM0+zBbjIfBvE8fCLQ8NozHVIM3pYq4T2mIhupxv2g+DJPfAOOKptkgOneE81EPSTnNAMzIIVcmrfIiPQ2t+8OsSJD94OzyPKCpTwbBUW/eHaC6G58AHQB1LrJqKQoU5S1o5RUr/H3vtsKWOeHHmAPsYMJQCe749yunrdHQJ0nXxw8dOZquqBOp3/qrYv9AImw8YKtdGItuMOObXmWhFOiiR+ULDLBDklzeSO+HJi43+6AkzjK5v9ZgqdCPNrbuI2qUtWo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(376002)(396003)(346002)(4326008)(52116002)(53546011)(16576012)(5660300002)(2616005)(956004)(86362001)(316002)(66476007)(83380400001)(66556008)(30864003)(2906002)(186003)(6486002)(31686004)(66946007)(26005)(31696002)(36756003)(8936002)(478600001)(16526019)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N1htcVZMeE1WbWIra2ZMWC9WbnRadmtmWTFEYnFvYVRTbFZ3MWpFd1QzSnJs?=
 =?utf-8?B?NzVaTURjL0FiNkR6eGFJRkNJV3E1dnYvMmxDYURpMmVYWkc0bDdGQW1QZERQ?=
 =?utf-8?B?Vzlnd2NwUFpGT0s0a2NwS29sTWl2ajRvbFVaaFk4S00vTzdydzdRanJaMlNl?=
 =?utf-8?B?cjQvMTVDalhiSmVIa0Vqd3pIOE1lMVg1QlpqT3NtN2owN04xN1lSMHgzYVJ3?=
 =?utf-8?B?Vm9NTkxiSGE2dm9mN2tGMHpKbEtCUFhpRmpVcUF4ZW05ZUVHZ0hhM0k1cEps?=
 =?utf-8?B?TUZ3Wnh5OTZMZGZhcHljQU9NdU8vUzhaZDRpRHJTeUUzTDdkb25ub1czTXlT?=
 =?utf-8?B?alh0RVFrcmxIbkgrL25hcmpIbnlRdU1aL1BLbHltWkxqWW82Z2ZKNWtLdGhr?=
 =?utf-8?B?VHo2ZitnOVhDUXYrMDVDZTBMTWZ5R3lsYmh1QnJGcUtyb25MOUEzK3Z5Z2I0?=
 =?utf-8?B?Q2hZSkdQWHZVbU1zRDRQMGJqRVl5ZkdrSXNWVHNIcXlQTVFpc0VlS1JrOGpk?=
 =?utf-8?B?MWd5UEQwQ2dxK0RvelQyU3Q3d0d6VjB5NWM5SkJia0lUblpiOHNJV3ROM1NY?=
 =?utf-8?B?S1NjdGE5aEdYb2NrRWxUWFNvY3FPbExab25xRzNpRlVJYmpxeElJdVBNOEpJ?=
 =?utf-8?B?d3BDTDZZWjhnNGlWMitHVEZuUHlWR3hqWURQZHk5c2xRTWE3SjkyTWpIblp5?=
 =?utf-8?B?bXRPbTJtVFRuWTFoRFlzWU1GaUpJSVdJSHF4Qm92b0pETFhZVkkwWWU5cXp6?=
 =?utf-8?B?TERpQndUdDQ3RTFxWUQwY2pvdEhQeXdQUk11QzlvZDFVeGgwSWQ0MXI3L056?=
 =?utf-8?B?UTdXMDVhSUU2RFdjRGl2WGNrQzdkWnBOQUNhc2dJQkE2RktYZmkwbG1TaFM0?=
 =?utf-8?B?NCtkMlZGeUlFQ2drNmFCN29ndU4rUklzSlVmZUkza1g1K2xIQ080UkdiekxD?=
 =?utf-8?B?aU82eE0zRjU3azNTSy82cWoxbkFMelhuZHZNQWN4T096dnhkZkZucVUyUnQx?=
 =?utf-8?B?bUsxZnFYVnJYVzBrZUFuVFNjeU1UYjhYSFJDRXJmcmN5L0pha3doMm9YRlky?=
 =?utf-8?B?WmF5ZHY0RSt0UWFtNFkrOGZZVDFwMmlwaE9pdkU0Mys3VlFhZ1hYS0lwMkxB?=
 =?utf-8?B?RFNHNnJ5aXQyYWVsTC9qUVdJQi9WODV0TDJLdWw1cmtIM3RQSmpZTS9rdGpS?=
 =?utf-8?B?L1dTNmdRdUI4R1N4MVplTEpPbHFZUmpIQkpnTnVaMFI1VE82ZHZRYjAyeXVC?=
 =?utf-8?B?Y05mSjI4ZTdadU4xN2VZWnRGNmRVVjc1N0xLSlN0MXVSYTluaHZqWXlzQ2Mw?=
 =?utf-8?B?M0poUk1NSytEQXpOK2NZdHNvZ1YxYWZkUlZjMmxFNFBXZmg4anBMUlZZUUlU?=
 =?utf-8?B?N25MYjRHTDNaWm1UN2ZpSWRrU1VSVGhrZXc4WXdqdm1pZEhMWVZ1V0xvL2hh?=
 =?utf-8?B?YXdNdVQranJ2WDdLL3hSaVAwY1ZCREI1RjJEMGNodTlYNjhCWHVXN0Y3anhv?=
 =?utf-8?B?UXh5SDQ1QWFzK2ZlOWhudlNvTFh0RklBRG1JVzJxYmM4QVRZS1ZsdExMZ0lH?=
 =?utf-8?B?WFFIbmZ0MUdsV2tCUUhLdm9zemR6N2Frd1IvRlMrQmNTTXBtODlUaFduNVNh?=
 =?utf-8?B?N3pCc1dTQTl2anBENjdVMEJ6VzRCOUIxOWlBUndLOVBNbmgyUmlSbEE4aUQz?=
 =?utf-8?B?MEphYVVNelRhdzBNbWtxSnZmeExoUWVydXk3cXYwSHRDekJocGcrYVU4S01n?=
 =?utf-8?Q?K9GydiBDTWXQMMUX66Ae/kVBc0twAwC3u0NbHIN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27264115-3494-475b-6a88-08d8e564659e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 14:37:43.9173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21FCB535m56DL7+1adP3h0WqjQtZWcYM279GQeu3p79gmU9aGT+Gn3CsC5Y1X9IrLNB9QxXRceIZ05t53sUP4kY0OPFhPLjD/FZy2Bbsp9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1970
Received-SPF: pass client-ip=40.107.6.112;
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

12.03.2021 16:41, Max Reitz wrote:
> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>> Implement cache for small sequential unaligned writes, so that they may
>> be cached until we get a complete cluster and then write it.
>>
>> The cache is intended to be used for backup to qcow2 compressed target
>> opened in O_DIRECT mode, but can be reused for any similar (even not
>> block-layer related) task.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/qemu/seqcache.h |  42 +++++
>>   util/seqcache.c         | 361 ++++++++++++++++++++++++++++++++++++++++
>>   MAINTAINERS             |   6 +
>>   util/meson.build        |   1 +
>>   4 files changed, 410 insertions(+)
>>   create mode 100644 include/qemu/seqcache.h
>>   create mode 100644 util/seqcache.c
> 
> Looks quite good to me, thanks.  Nice explanations, too. :)
> 
> The only design question I have is whether there’s a reason you’re using a list again instead of a hash table.  I suppose we do need the list anyway because of the next_flush iterator, so using a hash table would only complicate the implementation, but still.

Yes, it seems correct for flush iterator go in same order as writes comes, so we need a list. We can add a hash table, it will only help on read.. But for compressed cache in qcow2 we try to flush often enough, so there should not be many clusters in the cache. So I think addition of hash table may be done later if needed.

> 
> [...]
> 
>> diff --git a/util/seqcache.c b/util/seqcache.c
>> new file mode 100644
>> index 0000000000..d923560eab
>> --- /dev/null
>> +++ b/util/seqcache.c
>> @@ -0,0 +1,361 @@
>> +/*
>> + * Cache for small sequential write requests.
>> + *
>> + * Copyright (c) 2021 Virtuozzo International GmbH.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + *
>> + *
>> + * = Description =
>> + *
>> + * SeqCache is an abbreviation for Sequential Cache.
>> + *
>> + * The Cache is intended to improve performance of small unaligned sequential
>> + * writes. Cache has a cluster_size parameter and the unit of caching is aligned
>> + * cluster.  Cache has a list of cached clusters, several "finished" ones and at
>> + * most one "unfinished". "unfinished" cluster is a cluster where last byte of
>> + * last write operation is cached and there is a free place after that byte to
>> + * the end of cluster. "finished" clusters are just stored in cache to be read
>> + * or flushed and don't allow any writes to them.
>> + *
>> + * If write to the cache intersects cluster bounds, it's splat into several
> 
> *split
> 
> (Though I like “splat”.  Sounds like a wet blotch.)
> 
>> + * requests by cluster bounds. So, consider a write that doesn't intersect
>> + * cluster bounds to describe the whole picture:
>> + *
>> + * There are two cases allowed:
>> + *
>> + * 1. Sequential write to "unfinished" cluster. Actually it's a write sequential
>> + *    previous write. The data goes to "unfinished" cluster. If "unfinished" is
>> + *    filled up to the cluster bound it becomes "finished".
>> + *
>> + * 2. Write to new cluster, not existing in the cache. It may be sequential to
>> + *    previous write or not. Current "unfinshed" cluster (if exists) becomes
> 
> *unfinished
> 
>> + *    "finished" and new "unfinished" cluster is started. Note also that offset
>> + *    of the write to new cluster is not required to be aligned.
>> + *
>> + *    Any other write operation (non-sequential write to "unfinished" cluster
>> + *    or write to any of "finished" clusters) will crash.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "qemu/queue.h"
>> +#include "qemu/seqcache.h"
>> +
>> +/*
>> + * Cluster
>> + *
>> + * Representation of one cached cluster, aligned to SeqCache::cluster_size.
>> + * Caches only one subregion of the cluster, started at @offset (may be
>> + * unaligned to cluster_size) and of @bytes length (may be unaligned as well).
>> + * The whole subregion always lay in one aligned cluster:
>> + *
>> + *      QEMU_ALIGN_DOWN(offset, cluster_size) ==
>> + *          QEMU_ALIGN_DOWN(offset + bytes - 1, cluster_size)
>> + *
>> + * @buf is allocated to be able to fill the cluster up to the cluster end, i.e.
>> + * allocated @buf length is at least:
>> + *
>> + *      cluster_size - offset % cluster_size
>> + */
>> +typedef struct Cluster {
>> +   int64_t offset;
>> +   int64_t bytes;
>> +   uint8_t *buf;
>> +   QSIMPLEQ_ENTRY(Cluster) entry;
>> +} Cluster;
>> +
>> +/*
>> + * SeqCache caches small sequential writes into "unfinished" @cur_write cluster,
>> + * until entire cluster (of @cluster_size bytes) is filled by seqcache_write()
>> + * calls.
>> + *
>> + * @cur_write->offset may be unaligned to @cluster_size if first write offset is
>> + * not aligned (for example, if there was a flush request and cache was flushed,
>> + * then we continue from the middle of the cluster with an empty cache).
>> + *
>> + * @cur_write may be NULL, which means we don't have current cluster and next
>> + * seqcache_write() will start a new one.
>> + *
>> + * @all is a list of all clusters cached in the cache, some "finished" and one
>> + * "unfinished" @cur_write (if exists). If @cur_write is not NULL it is a last
>> + * one in the list.
>> + *
>> + * @nb_clusters is number of elements in @all list.
>> + *
>> + * @next_flush is an iterator for flushing. SeqCache knows nothing about how
>> + * data should be flushing, so for flush user calls seqcache_get_next_flush()
> 
> s/flushing/flushed/
> 
>> + * (which moves @next_flush iterator) and when data is flushed somehow and cache
>> + * is not needed anymore, user can call seqcache_discard_cluster().
> 
> AFAIU, next_flush always points to the first finished cluster that has not yet been returned by seqcache_get_next_flush(), is that correct?

Yes, right.

  (Yes, at least the latter part is implied by this comment, I’m just asking for clarity, because I want to be sure the simple
> 
>    s->next_flush = QSIMPLEQ_NEXT(s->next_flush, entry);
> 
> in seqcache_get_next_flush() does what I think it does, which is never to let s->next_flush be NULL even though there are still flushable clusters somewhere.)
> 
>> + */
>> +typedef struct SeqCache {
>> +    int64_t cluster_size;
>> +    int64_t nb_clusters;
>> +    Cluster *cur_write;
>> +    Cluster *next_flush;
>> +    QSIMPLEQ_HEAD(, Cluster) all;
>> +} SeqCache;
> 
> [...]
> 
>> +/* Align down @offset to s->cluster_size and search for corresponding cluster */
>> +static Cluster *seqcache_find_cluster(SeqCache *s, int64_t offset)
>> +{
>> +    Cluster *cl;
>> +    int64_t cl_start = cluster_start(s, offset);
>> +
>> +    QSIMPLEQ_FOREACH(cl, &s->all, entry) {
>> +        if (cluster_start(s, cl->offset) == cl_start) {
>> +            return cl;
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +/* Makes current "unfinished" cluster the "finished" one. */
> 
> This sounds a bit like there’d be only a single finished cluster, so I’d rather write it as “Mark the current "unfinished" cluster as "finished".”
> 
>> +static void seqcache_finalize_current_cluster(SeqCache *s)
>> +{
>> +    if (s->cur_write && !s->next_flush) {
>> +        s->next_flush = s->cur_write;
>> +    }
>> +    s->cur_write = NULL;
>> +}
>> +
>> +/*
>> + * Write an @offset, @bytes, @buf request into the cache. The requests MUST not
> 
> s/requests/request/
> 
>> + * intersect cluster bounds.
>> + */
>> +static void seqcache_write_one(SeqCache *s, int64_t offset, int64_t bytes,
>> +                               uint8_t *buf)
> 
> Could use a const, though not a must.
> 
>> +{
>> +    assert(bytes > 0);
>> +    assert(cluster_start(s, offset) == cluster_start(s, offset + bytes - 1));
>> +
>> +    if (s->cur_write && offset == cached_end(s->cur_write)) {
>> +        /* Continue sequential process */
>> +        memcpy(s->cur_write->buf + s->cur_write->bytes, buf, bytes);
>> +        s->cur_write->bytes += bytes;
>> +
>> +        if (cached_end(s->cur_write) == cluster_end(s, s->cur_write->offset)) {
>> +            seqcache_finalize_current_cluster(s);
>> +        }
>> +
>> +        return;
>> +    }
>> +
>> +    /* We are starting a new cluster. Check that it's really new */
>> +    assert(!seqcache_find_cluster(s, offset));
>> +
>> +    seqcache_finalize_current_cluster(s);
>> +
>> +    s->cur_write = g_new(Cluster, 1);
>> +    *s->cur_write = (Cluster) {
>> +        .offset = offset,
>> +        .bytes = bytes,
>> +        .buf = g_malloc(s->cluster_size),
> 
> I have to ask: Why not s->cluster_size - offset % s->cluster_size as advertised by the comment describing Cluster?

I just didn't care, it should be rare case. But for generic code better be precise. I'll update it.

> 
> More practical question: Should we use qemu_memalign() (aligning either at the cluster size or at the block alignment, which would need to be passed to seqcache_new()) when offset is aligned to the cluster size? (Or with a custom alignment, if it is aligned to that.)
> 
> I feel that for O_DIRECT images it might be kind of important to align the buffer to the host block size.

Will do

> 
>> +    };
>> +
>> +    memcpy(s->cur_write->buf, buf, bytes);
>> +    QSIMPLEQ_INSERT_TAIL(&s->all, s->cur_write, entry);
>> +    s->nb_clusters++;
>> +}
>> +
>> +/* Write an @offset, @bytes, @buf request into the cache. */
>> +void seqcache_write(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf)
> 
> “const” might again find its place here.
> 
>> +{
>> +    while (bytes) {
>> +        int64_t cl_end = cluster_end(s, offset);
>> +        int64_t chunk = MIN(bytes, cl_end - offset);
>> +
>> +        seqcache_write_one(s, offset, chunk, buf);
>> +        offset += chunk;
>> +        bytes -= chunk;
>> +        buf += chunk;
>> +    }
>> +}
> 
> [...]
> 
>> +/*
>> + * Get next region for flushing. @offset, @bytes and @buf are out-parameters
>> + * to return the region.
>> + *
>> + * @unfinished is in-out argument which means that user is interested in
>> + * flushing unfinished cluster too:
>> + *
>> + * If there are "finished" clusters, "finished" cluster is returned and
>> + * *@unfinished is set to false, independently of its original value.
>> + *
>> + * If there are no "finished" clusters but "unfinished" exists (i.e.
>> + * s->cur_write != NULL and it is the only element of s->all), then *@unfinished
>> + * value remains the same and the following logic works:
>> + *
>> + *    If *@unfinished:
>> + *       return s->cur_write unfinished cluster for flushing
>> + *    Else
>> + *       return nothing
>> + *
>> + *
>> + * Returns true and set @offset, @bytes, @buf and @unfinished if there is
>> + * something to flush (accordingly to @unfinished value), returns false
>> + * otherwise.
>> + *
>> + * Nothing is removed from the cache.
> 
> Out of curiosity, mainly, is that because the returned *buf is only valid as long as the entry is still in the cache, or is there a different reason that I’m missing?
> 
> (Hm, perhaps the fact that the user may want to keep it available for reading through seqcache_read()?)

Yes, that's for read. This way reads are not blocked by in-flight cache flush. We just read from cache if data in the cache, and if not read from the image. We don't have to wait for intersecting in-flight write to finish.

> 
>> + */
>> +bool seqcache_get_next_flush(SeqCache *s, int64_t *offset, int64_t *bytes,
>> +                             uint8_t **buf, bool *unfinished)
> 
> Could be “uint8_t *const *buf”, I suppose.  Don’t know how much the callers would hate that, though.

Will do. And actually I wrote quite big explanation but missed the fact that caller don't get ownership on buf, it should be mentioned.

> 
>> +{
>> +    Cluster *req = s->next_flush;
>> +
>> +    if (s->next_flush) {
>> +        *unfinished = false;
>> +        req = s->next_flush;
>> +        s->next_flush = QSIMPLEQ_NEXT(req, entry);
>> +        if (s->next_flush == s->cur_write) {
>> +            s->next_flush = NULL;
>> +        }
>> +    } else if (s->cur_write && *unfinished) {
>> +        req = s->cur_write;
> 
> I was wondering whether flushing an unfinished cluster wouldn’t kind of finalize it, but I suppose the problem with that would be that you can’t add data to a finished cluster, which wouldn’t be that great if you’re just flushing the cache without wanting to drop it all.
> 
> (The problem I see is that flushing it later will mean all the data that already has been written here will have to be rewritten.  Not that bad, I suppose.)

Yes that's all correct. Also there is additional strong reason: qcow2 depends on the fact that clusters become "finished" by defined rules: only when it really finished up the the end or when qcow2 starts writing another cluster.

For "finished" clusters with unaligned end we can safely align this end up to some good alignment writing a bit more data than needed. It's safe because tail of the cluster is never used. And we'll perform better with aligned write avoiding RMW.

But when flushing "unfinished" cluster, we should write exactly what we have in the cache, as there may happen parallel write to the same cluster, which will continue the sequential process.

> 
>> +    } else {
>> +        return false;
>> +    }
>> +
>> +    *offset = req->offset;
>> +    *bytes = req->bytes;
>> +    *buf = req->buf;
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + * Find corresponding cluster and drop it. No matter does requested @offset is
>> + * cached itself or not.
> 
> The second sentence sounds strange grammatically, if I understand correctly, I’d change this to something like “Find the cluster corresponding to @offset and drop it.  It does not matter whether @offset itself is actually within that cluster’s cached range or not.”
> 

Right, thanks for good rewording. I'm afraid, I often use russian language constructions with english words.

-- 
Best regards,
Vladimir

