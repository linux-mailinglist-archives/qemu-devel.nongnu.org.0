Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5846ECD7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 17:11:25 +0100 (CET)
Received: from localhost ([::1]:39008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvM0x-00023x-IA
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 11:11:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvLz8-0000eU-Bd; Thu, 09 Dec 2021 11:09:30 -0500
Received: from [2a01:111:f400:7d00::72e] (port=47201
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvLz5-0007sl-9x; Thu, 09 Dec 2021 11:09:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avCUOSo/kaS1hjuGL5qzBXZTvP/+d1KQCtoDsghfweynrIPT8ONV3f+Jvse2oxcG+PRw+aRGosU3s3wmWSEvvwszdoGpw4cXgR/8O5bEclrCF9HgAlDHdptYFZGVfzZ8nBLje2h8+VGmoomNAs5eGznmGFZSzJBmERwWVmgP6Zq2WIbcj/8nVz587/nZ2Ne7XjIN20EPT1to9SjWl8uZo9TAqRHaOnyylStVe0RX6dO1vtlun5q9Fp28ZKTPqqgBEPr35Yp9vAOKATFgg2TcJAHslePlw+vWgOxUjeflgpAa4oWOdF+JyHIM/4GEXTzWK/wlz/hEmly3V52u4fh/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDRQiCGDI8RQvshShXHnmQgGEobiZyJ0CnK/8vVlOls=;
 b=E20s4GRg4uUd9xaPYSppPMTaGn/+4xDGW+3EsKO17ii09dyXBAtOzZc7A8wMMfzmbiwkfZcr1stmMts5q7GuWO57Gyo5dPVDdUgYOfGi5ag1Dj2e0+UqyyUkkVmYHwWyvcLagch6ces+4zGiCpBLnHk4fw+ZODqTEs7b7GaaYHq5PMyKAAuu1V8YsbN/tj6vQdvyGo0tV8s4JIfNL8Z8iP0+gnhR5EkHj6bU4uYcaiL85+wV1PwnXbih3hJNtPNw+RA67/hLlQs3rM7NNHJwBhgQVbrCbPyGPZ0NdMmcEg3Tl6hZKkypmxkqmfsAkJIBL92ve/8J/aqiONEe6sZSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDRQiCGDI8RQvshShXHnmQgGEobiZyJ0CnK/8vVlOls=;
 b=j9KUSw5kVUbm5fAFVtktLFi1uixbYTiUsXwSnwkwlSsxKcK/n/CySLAV2/iqN2JU5uAoxwjnSM74uQdV9OaX7+SyLXIVerWqixCVTADxwEldpx9BrcB4uT2Osn5wTIQssIxVkVZSXayNzwRkgj9d0RetSTonj/bN+jHCOhk5vVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4274.eurprd08.prod.outlook.com (2603:10a6:208:148::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Thu, 9 Dec
 2021 16:09:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 9 Dec 2021
 16:09:21 +0000
Message-ID: <ee2be516-c8ad-43d7-fcba-d8b862b1293f@virtuozzo.com>
Date: Thu, 9 Dec 2021 19:09:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC] block-backend: prevent dangling BDS pointer in blk_drain()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211209142304.381253-1-stefanha@redhat.com>
 <404e8b66-b64a-fded-db53-81eef675fc33@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <404e8b66-b64a-fded-db53-81eef675fc33@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 16:09:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d9167b-5683-444f-f693-08d9bb2e4254
X-MS-TrafficTypeDiagnostic: AM0PR08MB4274:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4274045A132339EF399AE001C1709@AM0PR08MB4274.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w0mDqRUsg5EhHhLg5sEZOO51fgTRo35nPOOzNUAo9/I6Kg4mYTpm1g1FxaGZlj/kECfuXxTWuh263KDDeM0tj1pYsFw4P136MI3KG2N/M7dnnAB6jz0omhSqWa72fazj3JutTPm3iw73s/0WN67coGhn1Hm7AhkDZQr61Zgr0f1M2lEhbNAkOqscfbmcPZtcBDTMgNljKKpMdNQHmKIeo9e5pUVBRSXpaGRHKq7Tlpk3YaKBqHJL7EJamxShdKnlaO9ZZe+j3YkpSwMo4FjqeezhVH0tBMyHw4F6/IuS0obPR8DHSz5hWRpzz7gTJZURJw6Rq6+tHPLd5A+wC4S1VsYmK3/8M5hSpD6Bxa0OTT19tAEI43a/xAEneRviDcwOkkBwaRRjXLddu063GUd1LPOOxvhB57SxuQHDOa1Hsaxr1ypj+wqMYG8EYsf+qb2kUyOytsumC/TrXhLFY/xRHySUsp4scFcfCExMTcqcHU5bl7b0yaY+Axdx6nQ+NIGW1hv3ZTqPU/fLX2Yymk/EFmkWvO8YmkjnMRAd8ETjLgcH5fxbVyyZNouhJCpD4Sz/jQzqJBttNaOhEU0xESunn0JywLErcXtUhEIfzI6HMRA/m7w7CJbXQBEoMnf00nECFZ+JsoZqKv9KyX3J2LfRp8ZE7nGze8XTKSCQLS2kcn8TWsQ0t5MxvC1uj6EEQMb0FzHH/76xbIbPcEwsjxEeSucFBD0gjwlFZUMwulp6R6vkOECRtYnm7yYYAStQ6KvSr5LxE5RH8k6r8btxgo6zJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(53546011)(2906002)(52116002)(5660300002)(83380400001)(66556008)(316002)(16576012)(8936002)(8676002)(86362001)(31686004)(36756003)(31696002)(6486002)(4326008)(2616005)(110136005)(26005)(186003)(956004)(66476007)(38350700002)(38100700002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enBLcDM2MklLd25UYTZmOEV4R3docVhoekFWMUFrYThvT0VtK2hVMVNhVW9G?=
 =?utf-8?B?Q0Y0NzRXYXREOUJpamxuS2hBazRQRGwvc1FBalBiNGpsMXJWakFmSyt3YzJl?=
 =?utf-8?B?elBWVFFWZFB0ZVJqS2tOS25iN1BPYTg2bGtMTVBYQzJJb3FOMmFGcVVQREZI?=
 =?utf-8?B?RnVPS2ZjaER4eTl1bEZWbDFRS0Z2TVRtQU96Qmo2UEo1RXEvd041RjRwL3A5?=
 =?utf-8?B?N1FJYzdIK0VLSUJRYkZVUkg3OVMycngvd3FuUERBckpZbkoxeEpVeGRVZkJk?=
 =?utf-8?B?TkNkL24wTWJXdmtUMkw1dTFVL2RySWhZdGU3bzByU0JnaVg3a3NxWlRibk1V?=
 =?utf-8?B?T0pJSVRXeXFvTFVUM1BhMCtCL3pWRFZsRWc4OHhFZ0ZRTWl3blliZTlnNG93?=
 =?utf-8?B?c0srci9KTEJEb0pDYzNwTDhpV2FBSjNSWnU3d1lWdGE4NnRsdTlaMG9hdGVt?=
 =?utf-8?B?UWxyU1laNnJ2TzdULzN5eU5ZVVcwNWh6VU5nVldxamx1dXRKSVhMZkN5QmQ2?=
 =?utf-8?B?SGVnM1c0bDVRbnlQbmFsTlNhOHVWZ0xqNW9GdHlPNGtYdzhvZE1lM1ByYkhM?=
 =?utf-8?B?dGJTcEJsUUxzTC9VZ0NMVHh2TE9Mb2ttVVpTL0lpemRVRFRDREwvLzVsSHUw?=
 =?utf-8?B?R2plUmt2dTRzSGpwNFFHczFrT1hjODZRSmxwZkR5TEg5eklPYU5Rd2NrV2RX?=
 =?utf-8?B?QWhvK1JFQis0SVprQVc2UWs3MVYzTStmeGFQaUg2b1RsQ0JSYlgyRG1DVmxa?=
 =?utf-8?B?emkxMDRhdm1Ka252M2cxUHhlU1lFNFN1aiswRjRMb2RGZmljSVVEb1BNOXUw?=
 =?utf-8?B?TmJ2VzFUQjZTV1RmMHdJSkY2ZkpheEpIbWVlUXpxcEh4ZE5yMkoyb3VyS2dq?=
 =?utf-8?B?RlpNR2daeHJZdjN0azE4NjhmakxRSkllU3V6dUdnTGxaZ1ArRnBqMUx0ZWE0?=
 =?utf-8?B?UUI4UlBLSkRmQmVMTm1Denp3VFhjQUc5MVdlNFVJVVovc1ZXTHZtY0hGYkha?=
 =?utf-8?B?cGl3UEtsUm5ZNUV6aE92d3M1TVQzeFhNc2UzcmdTb3U5R3oxaUZrUXRhWUFv?=
 =?utf-8?B?aTRMRmN6cmJQOGtZL2RwamI5cmJTM1E5b0RQTGZqd2kxN3B5RDZlQXdyazl4?=
 =?utf-8?B?Ynk3Z2xUY055QnV2L09hb2xaQkprYUtHWHkvdHhQT1NmMldhMUJHSGZKeXNO?=
 =?utf-8?B?ZXNPU012WWp3eGNCTTQ3VnIyc05IS09jOU9uZlBudCtRWlE2d1hsWTg2WjR6?=
 =?utf-8?B?a3FBY3dHZEpiS3F4THdxcWgvNWNkZmlHVitPYzJNdXNITXYrOHl3cDk0bkIw?=
 =?utf-8?B?d1QraWdSc0hnVGVUYlpEUVorcG42RXFkYkJ1S01VSVRKSHQyemJVNTFMUnU1?=
 =?utf-8?B?eXVsV1ZseGdBQ1dXRlJFNldqUW8yR3htcDE5OU1zSTVRQUlweDJkWkdhQXZz?=
 =?utf-8?B?TmpGWTNOUmNud0xiOC8yUGFWMkhBWDhPcXJQU2JXRnJON25iUGxFdDc0UHpD?=
 =?utf-8?B?TGtRWmxpQW1CUE4zYXVsVDloL2wyY2J4ejdiQzhMbmNkbVc1ZlVkNm9XdnpR?=
 =?utf-8?B?YTE5SzI5R0doN0NDVm94WldkYkNXU09OUm1EdUNmaUo4YUVLTjlXbkt4cGQr?=
 =?utf-8?B?V1IvdC9lQmJSNEt2MndYWFRTSkdEVHlxTk1yWkxsZE1vNGJCZnRERHo3Qnov?=
 =?utf-8?B?Z25Yd2tCY0NnWHlGZ0RJU1AxcVJveXFuYzltTDhLeHdjVVJPQ25MakZEYlRp?=
 =?utf-8?B?Q1VaS3o4ZzczSGU4OUsyMkxLOEJkdmI1Qmo3djVaRFE3a09kTjAxMEZFZVBN?=
 =?utf-8?B?amJyRjI0RnVBaDdublAxZVpGa0dDTU9aK0s1bzdDeVlMRUVxd1VZenFDRzdZ?=
 =?utf-8?B?NHBYbGFjeDBPWHJlaWFpdEp6Wk5LZmJPZVUxeXJLYUZzbHRXWjgxcmpEdmp3?=
 =?utf-8?B?ZktGZldqZnpDN3AvSXFvOE1PWUJQeFdLak5LS08xYTZ3ZVhFbCtzZGxOVm1O?=
 =?utf-8?B?L1FPSmNjLzBWcWtjQ2Njd1d1cG50QzVMWFhwWUY0aWdsczh2c04zcEdSZDVv?=
 =?utf-8?B?K2NUZ1lXakd2UzlSN3V0cnBLV1o1azNjU2pteDhJcVNQTWwreUdGQmtYWksx?=
 =?utf-8?B?YVpsQm1NRUZrZklUU0JJODRESXZhZ1Yrei9OakcrM25DVFh4VFJ3NUxZZm1k?=
 =?utf-8?B?WUNSWHhzamR2Q3lxaVEwTENpTlhLNVFYSFIzSmpVSmFHa3pOak1Hd0RUR29l?=
 =?utf-8?Q?9VbGUX3EBjuohGQJm2SAYc/jF0nkWc6/qiRYJWO8Cc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d9167b-5683-444f-f693-08d9bb2e4254
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 16:09:21.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ko4jaMsDJGVtSBtuGIN8Gv/NGdjL/IkR6zjU+SzAtuTzESC3mph3VijGzs+kFHvYbLG2pavHyeWM41MMImAemBk4akHxEI2GA/SxxsNFKLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4274
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.803, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

09.12.2021 18:45, Hanna Reitz wrote:
> On 09.12.21 15:23, Stefan Hajnoczi wrote:
>> The BlockBackend root child can change during bdrv_drained_begin() when
>> aio_poll() is invoked. In fact the BlockDriverState can reach refcnt 0
>> and blk_drain() is left with a dangling BDS pointer.
>>
>> One example is scsi_device_purge_requests(), which calls blk_drain() to
>> wait for in-flight requests to cancel. If the backup blockjob is active,
>> then the BlockBackend root child is a temporary filter BDS owned by the
>> blockjob. The blockjob can complete during bdrv_drained_begin() and the
>> last reference to the BDS is released when the temporary filter node is
>> removed. This results in a use-after-free when blk_drain() calls
>> bdrv_drained_end(bs) on the dangling pointer.
>>
>> The general problem is that a function and its callers must not assume
>> that bs is still valid across aio_poll(). Explicitly hold a reference to
>> bs in blk_drain() to avoid the dangling pointer.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>> I found that BDS nodes are sometimes deleted with bs->quiesce_counter >
>> 0 (at least when running "make check"), so it is currently not possible
>> to put the bdrv_ref/unref() calls in bdrv_do_drained_begin() and
>> bdrv_do_drained_end() because they will be unbalanced. That would have
>> been a more general solution than only fixing blk_drain().
> 
> Deleting nodes that have a `quiesce_counter > 0` doesn’t seem wrong to me – deleting only depends on strong references, and so I’d expect that anything that increases the quiesce_counter also has a strong reference to the node if the former wants the latter to stay around.
> 
> I suppose we could make it so that both the quiesce_counter and the refcnt need to be 0 before a BDS is deleted (and then deletion can happen both from bdrv_unref() and drained_end), but I don’t know whether that’s really necessary.  I’d rather leave it to the caller to ensure they keep a strong reference throughout the drain.

Agree. Better to keep the ref-count behavior obvious.

> 
> The question is, how often do we have a situation like this, where we take a weak reference for draining, because we assume there’s a strong reference backing us up (namely the one through blk->root), but that strong reference then can go away due to draining...
> 
>> Any suggestions for a better fix?
> 
> The fix makes sense to me.
> 
> One alternative that comes to my mind is to instead re-fetch `bs = blk_bs(blk);` after the AIO_WAIT_WHILE() loop.  But that might be wrong, because if the node attached to the BB changed (i.e. isn’t `bs`, and isn’t `NULL`), then we’d end the drain on the wrong node.
> 
> So I think your fix is the right one.
> 

I agree.

Interesting how many code paths that care to take a strong reference are actually prepared to the fact that block-graph may change, and this bs may be in some other place, with changed permissions, children and parents :/

Is graph modifying during drain is safe? Hmm, we probably always do graph modification in drained section for purpose) As I understand, all the logic about quiesce_counter is to support exactly this. And the only logic that seems correct is to finish drain on same node where it was started.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

