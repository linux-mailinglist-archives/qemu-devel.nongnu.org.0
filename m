Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9946ED30
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 17:36:17 +0100 (CET)
Received: from localhost ([::1]:58960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvMP2-0007lW-4l
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 11:36:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvMMo-0005wx-Fz; Thu, 09 Dec 2021 11:33:58 -0500
Received: from mail-am6eur05on2092.outbound.protection.outlook.com
 ([40.107.22.92]:59776 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvMMh-00062j-CN; Thu, 09 Dec 2021 11:33:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0Nh/PWsIjdTvwTa9sDpp3HtDfrIU8YNS7rlCNmRQQipRgMQghTTaoxSCyWGcsgGUGAyeIFJm1/X6vB5x0qqMxaoZW5WQdMUYk4ogvtt+V9CDxsGhWL32wRw7YNKpOSIrdz9/YqYOqvtjR6ogJayxdvtY7ULEe4jPvTihnTTsL8gK6nSfpxNlJ1Y/lJe1MIwI5QTV+erSw/uwoJgxEEEB4ZayIxRPW6/tdLhodHLpaxi/l54YNXY0h9rkmngOnv5zhx6xb9YvCMFsRG+r4MC3Qt6ofEstioPnHyDjXVid4aRrU0wtJi9TJN2bHft5+ioYcmC6InqzhwnQbR9sbLDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR9BujRxQYEDqcI0OlfU6UbxGI7FqjhDKaZYQ7JeQGk=;
 b=EjqkwXdFBN9LBbGUlg1tL0Em6kIv9E5MF7yRoacWCHZ9wYgRZwU+bUDb3DQWANIReJXhL6XiQXRErVGAX67zxgjQH01k+1vdNStSLYBqGmj5TRw63Xslnjm0iptDuY/h7/AjUB5bH09jZkjTH83jhjNiHaviJjVDQR5EDLoIfwP1jNMOQLN3YWa+z4f1tPiaTDtkrzWkr1xrQQXDQyYkfo2fJWDXO2TTHBqRCEAMJi1HI3CbGWM+I11D+qYTDKV95f8mIsEqU72TwE3FyL1PvCw4f0fLgbMOUfX2/ehuCju0o8rUpX40w0CGU7LqB9MrfJEDed+9/AOl79ge6dEACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR9BujRxQYEDqcI0OlfU6UbxGI7FqjhDKaZYQ7JeQGk=;
 b=d+zmDkDLq6GsonkyG8yrmFLJboax4pp+fLs3RkOvfpJNQjE/djUVyKx09yGj83F/eKtEJQ7uCEZTJlMjmCJyHTbGvHwii5n7UuwqfPRBhoFTre1ND+0csaiqLdSEnJSM5d/rlUcjx99ws4PpH9bpFuJdXJYSnpwIkhgCNsuKN3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6227.eurprd08.prod.outlook.com (2603:10a6:20b:285::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 16:33:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 9 Dec 2021
 16:33:45 +0000
Message-ID: <8cc392bf-d096-bda4-f2d1-b37465475616@virtuozzo.com>
Date: Thu, 9 Dec 2021 19:33:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] mirror: Avoid assertion failed in mirror_run
Content-Language: en-US
To: wang.yi59@zte.com.cn, hreitz@redhat.com
Cc: qemu-devel@nongnu.org, long.yunjian@zte.com.cn, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, qemu-block@nongnu.org, kwolf@redhat.com,
 jsnow@redhat.com
References: <202112081752032511235@zte.com.cn>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <202112081752032511235@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 16:33:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b30fd7f-0083-4028-4a78-08d9bb31ab58
X-MS-TrafficTypeDiagnostic: AM9PR08MB6227:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB62270CD04093D1247BB0A6ECC1709@AM9PR08MB6227.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3UeegM571IhiV4LKjw2lLfIfC8kh/lbOthppnaevUJYlX17HHh5Is99pYOw47vxeJlTOeUacUcqSg85WjQOHMOtzZXbUGialDvcYjBak9ZWkErSzHX778cxZc7h+uBSzOUTRYYjVw230EfyZW3uh4CEemNaJVv5WgP5tvBFK+N8B1Rp9XvOcFKhRnF2utycVKoPo8dsslkbGJ/LampwExR5dlwMDT7BUeSIXn2f00Dv8jAjUikQlvI/AZhnKRYZs+CMQZRiZB+3sx2+4fkxY9yB92eTjK0OzWxeHD3jR9ZhvDEYmzyVAaabiYnxPS9xNiyZ7+xClxtjU9qj9B2S5C8GWDIsaEunDneWAhDr69EQNQgj7cykWqgs19U4UFIDLoJ2uvUbJVIH0OrOnyVxhHdpOuaT1SUWtLiDjArQkzo5K3KLPPfKTQ28jk4fe0xMlzVWcbdcENWTclBx609q/RNpzSHoUSLuue95PdCC4K/rl9/qlVhjTUqFSV70QsG4BV2BjT3/6kTVpWXpN4c5fpMH52/VonRj6tm1Nr3Jp85YGr4YX7NxSflTc4AXpnf+S00uhhMSgMOKfgK8jlTylRqDlfcPfVKLiiTQ1oEOvjDWLvf+HY6Lfn/gsEcHHRRxdFJJtjGgNdCKZ7GPrFdElqqfD90RAJvgusZYU9yu2ZtaLJ0SKTnAtvxvpoqn807xuEqmR0o2iGx+Iog4QVeTYwtcQx0wJI47tYEaKo3R/jNgiWjWRmy63HdkJwvClSm63xkigEL3SJCH7jNi6qG/EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(186003)(66946007)(508600001)(66476007)(4326008)(36756003)(956004)(31686004)(6486002)(2616005)(53546011)(66556008)(86362001)(2906002)(38100700002)(83380400001)(38350700002)(8676002)(31696002)(8936002)(316002)(16576012)(5660300002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTdMY004RHlQcFRETXRKTXRwamJ0OEsxck45Z0RRdWtMOU1sVDJ3WGRMN1Ra?=
 =?utf-8?B?eERHUkpudHFIT2xDRldKNGJXQnhjKzc1SDROeVZnZWJwanI2SWFDVHQ5anJn?=
 =?utf-8?B?b0xaV3hMZmVsL1ZZL2RxcFI4QllCUHdxNjVpVnNLY21TVHlvK3Q5YWlyUHFP?=
 =?utf-8?B?YzcvUUdsU0JTUHdOdEcyNllEUDdObmJSNnVEemd3UWxyMkFjVW1lNnJHRkZj?=
 =?utf-8?B?ZWVtcEM0UHlrZHJ5TzdOWUtjaVhXcEJnb2Z5dDNZZTJsbkJqYjNQdVpwbVlz?=
 =?utf-8?B?UXU4UnVzZ2tkK1Q1cUoxaS84UC9nVnpvUDduU3ZpN1dDVUdrbVRRTDE0eTd2?=
 =?utf-8?B?cDI3QzE3VmJPY1loLzVQcURRS3VYYW9pdEk2R0puaW8yNG1INm1vOWNKZENB?=
 =?utf-8?B?MTlOWFp4aE9LbUs2WGIwM2V4enBwRGkrZkRVN3o2WjczMitPa0NwdStpemVS?=
 =?utf-8?B?a052bUhqbjdGV2Z3TGhPL3JLUVR0S3g1dTVRYkFSTk5kanlXNXA1U1FncWxR?=
 =?utf-8?B?dStYaTRjSjVjcm83Ung0dDZVaXN1enM3UHFyT1ZXT1loc0RaQ3Y4dnBOS29Z?=
 =?utf-8?B?c2lYQWxqVmhLM0ZkNmFIUHNrTmtxSm9HdXprNzRLaHIxMG16dHFCS0JaeWti?=
 =?utf-8?B?dHc1L1RPdi9tbnY5aFhjQ3NyVXh3QzZWODhCMGZBUTkxVWJWVFN0NWk1OVly?=
 =?utf-8?B?cDg5eGVxUmJMVHJTMzRiZ0tjWFovclNxcG9nY2lGUWh1aXowYkZMNzdCRUtV?=
 =?utf-8?B?SG1uMzhWQTVYeDNPeW5ubkF3ZkF6WC9kaGFDWk05NHJuODFSd1ZZNXh4KzUz?=
 =?utf-8?B?TE93RmxZTWh6MXFYTFliQ2VyU01weGFvY3FXYUx1bi8zK2Urc3hlN0VsREZR?=
 =?utf-8?B?cHRGMURpSWVyU2FjZyszMDZUcVZlaStzbzU5R3FqRkxqTFFscFhYbXdwWHZX?=
 =?utf-8?B?czF1TUI4RHBVWTZlMWsxU20rbVhYWDZrbiszQWpDdzJzd0Y0aGFHYjBDTW4w?=
 =?utf-8?B?ZGNyV3NqNE8rY0hkVUtJZ25CVnpLMkVTS2g2OE52RVpaZGpnTzhKQ2pvallU?=
 =?utf-8?B?d2swTEZuUW1DSHAvWDRDRDdUU2VvT1VGZUFEVGNpbmttQjNodGFRVVVhQ2lO?=
 =?utf-8?B?VlVUTUhXRmtuSUFBN094eUVJWFN3ZzNBWmVGalpMdEhXKzhJTTY5ZHRDRUdi?=
 =?utf-8?B?TUdxMGdkWnhEU25RZWM0dlpMbWMxM2IvNXkya0tUcVVIUUhSRzFVSWhRMWY5?=
 =?utf-8?B?cm95RVJsYXBMUDgyRVhsQUJEdU5UNEdYNHduTDR6c25MUXZMeXpqVGkwSkYy?=
 =?utf-8?B?a0o3bVR1TFpkSnhwY3ZKS3E4VDRjSFMxY004cDQvaExFdE5iQXhzRFFjTExz?=
 =?utf-8?B?bzJHWXBnWWtXa2tTR3NndDlJejQ5TXk4Nk9ndUgwTUhaU3JLNmhFVVZqY0hY?=
 =?utf-8?B?MnNFUHRnV2ZyM2paQ2VuT1JtY3Q0M0VmbWVKdGVBMEp5VU94NG80OVBPTHFS?=
 =?utf-8?B?OTFhcGtKQnlnVytjUnhVVkRJeklaMEJoZ3hxanpxWVRPSkZQUHZpOFlWaUs4?=
 =?utf-8?B?ZGFQSy91elIxaWR4bU1qT0ovNWZiOUlwam5XZGFrc1I1enZYakpzMVlXRmpC?=
 =?utf-8?B?eVU0d2VZVWVaeE44Q1IxeG5xSFVoWGhjQTJobE9NMXZOYlJla1VrbXBQWnpo?=
 =?utf-8?B?N1NEcVNuWUlOek1TeWk2UE4vVUo3ZUhENXpDZUdnOUpvUVRKbXdBMVFqZjRv?=
 =?utf-8?B?ZDJubEg1TWdzbW9sV21qVXlab3ZNU1NFTEZ3Snl5bE9UWS9CcjRqeTVsNEtC?=
 =?utf-8?B?NHdIYjNmbHpmQzFFMVlKckkzWEFGQVVnMlQxdEl1Z2Y0WHh5cmZnSXZqeXhH?=
 =?utf-8?B?dTNPenNoNmNMUWcrQ0VrNEhOUEVaeDFyUDhKcmRFRXNOTkdQdCt3WnZHbjZF?=
 =?utf-8?B?ODB0VDhiRUJVNVJYbnMrRXhwUjFqNCtSd1diUmpQcVhKVy9leFNNNHF6VXh3?=
 =?utf-8?B?TkNmd1F2M25xbzB2Qjd4UklNMVNrYnBlRHRyT2Q5K1VGWi9hZ0pUdGxVREcv?=
 =?utf-8?B?anVZRlRpaWJSdXJBdC9tendNcndlOUU3LzlBSlMza3VHTW9KdExBVi9mUmwz?=
 =?utf-8?B?emU5K0ZOTGtuMDczSUswTjVualpublJNb0l1RTEvNUp6T3JyS2tVeVJBVlVH?=
 =?utf-8?B?Vzhvdy9PUkRQS2hCUWd1UUpwdXdOSmNUQzFsRVNVSzdyNUo3cVpXQysrclkx?=
 =?utf-8?Q?mCJrtC60CO98OOW2MLqdAL8SPFXRg5ddDcrcDWrbLE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b30fd7f-0083-4028-4a78-08d9bb31ab58
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 16:33:45.4088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gb8zzKQ4YBEZ/hmd8Gh8Va5xuQu0/Nd2wB/S8bb/ilXTKOVxPrdS6KioF5gntlUbdsrXg4ePi76i0FYQG0JvNdhzHFFLZ65P5ErVtqiojx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6227
Received-SPF: pass client-ip=40.107.22.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

08.12.2021 12:52, wang.yi59@zte.com.cn wrote:
>> [CC-ing qemu-block, Vladimir, Kevin, and John – when sending patches,
>> please look into the MAINTAINERS file or use the
>> scripts/get_maintainer.pl script to find out who to CC on them.  It’s
>> very to overlook patches on qemu-devel :/]
>>
>> On 07.12.21 11:56, Yi Wang wrote:
>>> From: Long YunJian <long.yunjian@zte.com.cn>
>>>
>>> when blockcommit from active leaf node, sometimes, we get assertion failed with
>>> "mirror_run: Assertion `QLIST_EMPTY(&bs->tracked_requests)' failed" messages.
>>> According to the core file, we find bs->tracked_requests has IO request,
>>> so assertion failed.
>>> (gdb) bt
>>> #0  0x00007f410df707cf in raise () from /lib64/libc.so.6
>>> #1  0x00007f410df5ac05 in abort () from /lib64/libc.so.6
>>> #2  0x00007f410df5aad9 in __assert_fail_base.cold.0 () from /lib64/libc..so.6
>>> #3  0x00007f410df68db6 in __assert_fail () from /lib64/libc.so.6
>>> #4  0x0000556915635371 in mirror_run (job=0x556916ff8600, errp=<optimized out>) at block/mirror.c:1092
>>> #5  0x00005569155e6c53 in job_co_entry (opaque=0x556916ff8600) at job..c:904
>>> #6  0x00005569156d9483 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at util/coroutine-ucontext.c:115
>>> (gdb) p s->mirror_top_bs->backing->bs->tracked_requests
>>> $12 = {lh_first = 0x7f3f07bfb8b0}
>>> (gdb) p s->mirror_top_bs->backing->bs->tracked_requests->lh_first
>>> $13 = (struct BdrvTrackedRequest *) 0x7f3f07bfb8b0
>>>
>>> Actually, before excuting assert(QLIST_EMPTY(&bs->tracked_requests)),
>>> it will excute mirror_flush(s). It may handle new I/O request and maybe
>>> pending I/O during this flush. Just likes in bdrv_close fuction,
>>> bdrv_drain(bs) followed by bdrv_flush(bs), we should add bdrv_drain fuction
>>> to handle pending I/O after mirror_flush.
>>
>> Oh.  How is that happening, though?  I would have expected that flushing
>> the target BB (and associated BDS) only flushes requests to the OS and
>> lower layers, but the source node (which is `bs`) should (in the case of
>> commit) always be above the target, so I wouldn’t have expected it to
>> get any new requests due to this flush.
>>
>> Do you have a reproducer for this?
> 
> As i know, flush maybe will do some thring write, and then in qcow2_co_pwritev function,
> if others aready hold "s->lock" lock, qemu_co_mutex_lock(&s->lock) will go to qemu_coroutine_yield,
> and do some other things. Maybe, it will handle new I/O now.

No, they must not, as we are in a drained section.. All possible producers of new io requests should be aware of it and should not create new requests. Still, the history knows bugs, when requests were created during drained section, look at cf3129323f900ef5ddbccbe8 commit.

So, if in drained section (after bdrv_drain_begin() call returned) we see something in bs->tracked_requests - that's probably a deeper bug, and we shouldn't try to mask it by additional bdrv_drain(). bdrv_drain() inside a drained section for same bs should be a no-op.

Could you investigate a bit more? The simplest thing to do is to look at this tracked request coroutine, it may help to catch the source of this request. To do this, you can use scripts/qemu-gdb.py's coroutine command that shows backtrace for coroutine. Unfortunately it doesn't work for coredumps, only for alive process.

So, you'll need:

1. start your vm
2. attach with gdb to qemu process, and in gdb do "source /path/to/qemu/scripts/qemu-gdb.py"
3. do the reproduce
4. In gdb, run command "qemu coroutine COROUTINE_POINTER". And COROUTINE_POINTER you'll find inside s->mirror_top_bs->backing->bs->tracked_requests->lh_first, it is its .co field.

It should print back-trace of the coroutine.

Another approach could be try to set a breakpoint on adding an element to tracked_requests with a condition that bs->quiesce_counter > 0  (which is, as I understand, a kind of "drain counter" actually)

-- 
Best regards,
Vladimir

