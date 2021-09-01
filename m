Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F83FD5CA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:42:00 +0200 (CEST)
Received: from localhost ([::1]:50386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLol-0008Hk-6h
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLLmA-0006WV-Mu; Wed, 01 Sep 2021 04:39:19 -0400
Received: from mail-eopbgr140104.outbound.protection.outlook.com
 ([40.107.14.104]:3950 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLLm3-0005p1-Fu; Wed, 01 Sep 2021 04:39:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zmmh2Zsxvtu7xcguZKO2GQbJbapaXTwv0kqw6g2hE0s/Fd/qQxJIG/rxkgF1O0al4fLBuQRNcfkTFRT39gDScxvcMAxtw5xmpOAqDEHp10c0Lpx7LxaSCWafK3m4E0cpagZWFjaQAXKzg6aBZoZSHPxs2OY6rxd5ZGPZ6w1IeOdLOle9jSo6VCGM8/HsjArQfiF7wlLNC2Jpk/qo2JKWH4qKuv0e7Yeh1hY6oUCf14Jwuaj+tR75h1Wkm8Y6UFCcSBZbBE84EQT2faSy0gAnr390wyVe4sHr+BBpYu2agLAqUYJP45PuoDcQLsjrj7GIjf90gGOzDQ5TmLJ/rix4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7uk9FQTPJA7ljjESGpNnveY6YBAjSlbm9t6ZJanECs0=;
 b=UMeeeMnbZkoSMgKgo6CTHj9dlpniqvhvm17IiLK4E3Fq24bnjqIPyLRm7BdNZCAmoprEcrXrrqSOEn580fIpLFbVjsW9V1VM35NtXcENaALjjcaOXxmrg8+igm/BsKltxlnU7qfXFRGaYsI7gOfSuHP1fIj5T/5YERUH6qvb3WnwxxT8k6TyEmu5H3W+yAJ1/WBzhSyCGG9rWwMtvwRGHIc+fkcmP7jfbecjvLBj77DlVVld1BYwyt9gQC0IaNbYEFkl7xvJg2ZyudaXMIfosaO14YzdKx1lf2Ey0/5feALJFs5klTvj/K8VUwqtNgTb57ne8OOcJNY9S/deq7HW8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uk9FQTPJA7ljjESGpNnveY6YBAjSlbm9t6ZJanECs0=;
 b=YV4wEhLSruZvQ991WsKobXldRSJKpf6UIAy8jdRv+BM5paHv863hUU2ryRzkBsUjGWcP6lE6oQY12GDb9BVtJguxNTSDnESt/4ydQ1K7o88I30cLsRm4oc2G4SMvlQF/+84aEJRKWPOuO9BDlPZq2Rd3ovvlDHAFt9u2EeNrjF0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB2687.eurprd08.prod.outlook.com (2603:10a6:802:25::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 08:39:05 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 08:39:04 +0000
Subject: Re: [PATCH] nbd/server: Advertise MULTI_CONN for shared writable
 exports
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: rjones@redhat.com, nsoffer@redhat.com, kwolf@redhat.com,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210827150916.532260-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <73147f33-7875-d399-758a-09031ad95858@virtuozzo.com>
Date: Wed, 1 Sep 2021 11:39:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210827150916.532260-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0010.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::23) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:208:3e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 08:39:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db6bc2bd-4d85-46fb-61e9-08d96d23f4b1
X-MS-TrafficTypeDiagnostic: VI1PR08MB2687:
X-Microsoft-Antispam-PRVS: <VI1PR08MB2687B2C889392582793C4209C1CD9@VI1PR08MB2687.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xOy8kpb6fQCwdOMi0yJ/8GkaA3WoofkYjMTdaIDq647NLy/IisvhDOfkBR8PQHd8QQvCnNV8xnIfmC0WVphXJXchBO+we5Bl18vXQXr4Fq9Cv7+u4tYyVhOUAAEdbILox9vsNV51Wd8kcLt358wfyKPfJhcW/bSKSWnfDf7i4YaM4C589XiMk2XLxScMrrETJB8Dif/QTvG0Q9yZhiaqbGrnDn6LnpC8VhfqmR5OoAyhmBo4LKAV46IpwmnxiBKEJQNZcHMP0qR0zRlx7YF84MhrteqSa032ZumhLydVMdSlPJo81o7wIKy2ki7cQ434alMrq5M2wWSdeadx+4QXvGgJSD5yN7N5ghLokYiXzPq/2jkiBse6jKoYYx5tvLler4L3wZ/3lO+pwXU1rG7h99qLdoTOZEEfn7nCbpfx7q28dcZ/qCpR/bsBzveTTdqze/VafrxKDFpQUIctt03eWYGkVJcYwRzwOo0oOZrVtD6pvtOg9ZQLMX12XwYNPlyCsCdZLJZQY7sNrugOAu7h9tORpB8tHNg6wY9Vq6PelGoCx0gdPPrZaeK/ZEIwJ0HX2AfsjGVSofOwAasoVn46VYH8bw3szHmily6QOrAAF598EUszGA5XwrFIoIbueHNViaGjuV3SEuiyAMXXAecXikVoEhCkp0Zs919a26DhhlSGAV6+KG8p9UjqzMs9aID7kxlC85LTaVY3F1oPmuKxS6vIMn1ookBGJPV9tLbZccKyDaEba4kcXLT3HFzoyA9P2gw6pGUVaZTuC1MvCIfLJIVD+uZvTthky3n3hzlzj3AF9WKGbyDW3Jk/0sezFhm0XoI/kTGQkg49NVkQypv6cMTyir72X+noHvpon4f5o7YVbWX3pMTYKcqcD8EGpD51Rqhmt0jsdZuN+AOSbZ+/Wj5kwb+HlaurV3w4vB1Y9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(136003)(366004)(52116002)(956004)(38350700002)(8676002)(2906002)(38100700002)(6486002)(86362001)(2616005)(4326008)(30864003)(8936002)(478600001)(31686004)(966005)(66556008)(66946007)(5660300002)(31696002)(26005)(54906003)(66476007)(36756003)(16576012)(83380400001)(186003)(316002)(21314003)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck5zdW8wMzRQVVdUTCtXTU5MWlRocW05eE9vZE14RXp0V1dqOERjcVJiZUQ3?=
 =?utf-8?B?NnNRY25UWncxdEg3UHlEUEFjanh0TFpTUmJNc1RNMWtIdXJLK3V1ZTVQZ0F0?=
 =?utf-8?B?bHMzMCsrU3hYdlJ3Z3RTV0hLNzRucWI0UnFhbEhRTDd5M005cFFnMUxNZisr?=
 =?utf-8?B?M09rTlFnQXdVQ0JTYjJGR2V4OGM5T3lMMENKNFVtVUVVckV6M3pTWmpueC8v?=
 =?utf-8?B?YVlQM0Q2OXVMM3V4YUFFckg0ZlpUdVZmT2VHdmEyK2loMWh2dkU0QXA3VFBx?=
 =?utf-8?B?NUE3bm02RVNYeC9FK2M3WW4rbTFLenVscUpucjZJWE9uOEdTZ0hkbklJMGpQ?=
 =?utf-8?B?ZHB2RUVJV1FRazA1aVZPRGVKYVBsODBNc0lvaGNqdEF4b0cybXJzSXFoSEdi?=
 =?utf-8?B?TTBVN3ZNS0hHTXFJdENZV3BWRmRYUkhrWk5SNFF2WTlqeEduZzhHRTRleEI3?=
 =?utf-8?B?aWF0eC9MNHkwU2laUXFidVNqVU1FS2paSXBqMWwrbitUT2tSOUx0c2pFOWRy?=
 =?utf-8?B?ZStxQUJDNFp5MUhodndLZ2xLd25xVmxPYXljM2podTh1ZlhnVjdOdmxZUUFk?=
 =?utf-8?B?Y1NCSGlPbzk1bVBSd1l1WFUxWFJpQXZDWnZGNUtBckZWZC8vM0FIWERUOXJQ?=
 =?utf-8?B?STgwVmE2SWNsYlkySHdqenZqdkR0NHJlNHN4QkZCeU9jUk1FNTFHZUszeTB0?=
 =?utf-8?B?TjZNQm8zTFRwTjdTdUJYcU5ITU00ZkNJb2pxYmxLWWRxMUYzS3VudUFkN3NC?=
 =?utf-8?B?Y1F5TGRZcU1zaGhoV2xhd0dUSnRNWXdhOHorOUdpOW9XdWZIVVR5NVBXR293?=
 =?utf-8?B?U2Z0WUVZS3E3aG9tSHpMS0dVQXlhTks4U1d6ek10bVJVYzdIQzZoNEFOY3VR?=
 =?utf-8?B?WEtzejZOODJkK3hkK2ZYbEIyTVdpNmVQL2w2cXpjNFhyK1RqRk1xM3V3ZzFp?=
 =?utf-8?B?R25lYXp1YWZqRWlWTTZzRzc1QlVZVGFKL3ZxNTZKWHQrTldyWk03a1pHN2po?=
 =?utf-8?B?eW1aTU4vZnM3aFd1VnhnNmFZeWZGeVYwMWNLaWcwMHlNTGxOT1ZEYXQwRUNo?=
 =?utf-8?B?U28vNXYxRDZKM01haFVoQVZQcFdDa3RqM2JHWFc1cG5VeDhXM0F6V1J6T2tR?=
 =?utf-8?B?bWdwY0ZoM2tGKzRySlVEVzM1ODQzWUtsSVY5TTA2OEp6RkhLZmpKcFdsR2hh?=
 =?utf-8?B?RnlpT1NsMklVeE9lOUVCenptU3p2UEtmMEo2R2Y3b2M3Z0VycHVxWitPSnB3?=
 =?utf-8?B?NWU4TEcxVmd5akxVaE12VGNIVmNJZ3lmZGFaVlhyMUdzY3J4SFFLNitjUjNK?=
 =?utf-8?B?aDQydWsyekF6WS83ZUNOUlplWHZuUW9XZklnbDhUVDRmYU9nalBIS2x2UU82?=
 =?utf-8?B?WGd3ZlZRVnl4c3RhQzRwUjRZTHVWdW8zVDU4SGZwb2Qzank4MlJBY2p2TXc1?=
 =?utf-8?B?cndWYmY4Wm5xS2dhNVVVVlNwQVZ3eWFzNUtjaDk1SHZaa0d2Nms3UUoyOGJu?=
 =?utf-8?B?b1h0Y1QwTjg1Nm5nZm5QbWdTdVNPMytRU2t2M3hXaUt4ZlJkekkwaVpXT1NP?=
 =?utf-8?B?OTBPY1BxMHBKbEx1Yit3N0l6cGRtRE91OHVjcGcyWHZJaHQ5aVpSZG8yZEdM?=
 =?utf-8?B?aFo2L2ZOakJ4b05PQ2Z0NndtK05mOXFuN0FXNW1vZ0cvK043TnJSYXBTdklK?=
 =?utf-8?B?ZWVPaUdzbnluYUV6UktaYW9Ta3loRHY3c3pxdHNwRkNLWG5BdXdlQ2ZzVjUx?=
 =?utf-8?Q?bifeaAYUDyEC6mIirrA6Em6XfqMeVbvfIblp+3b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6bc2bd-4d85-46fb-61e9-08d96d23f4b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:39:04.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRTDbi2r8PeWSnSVRwdRniJrH3wBtraLlaCLnoqBWcdwbETtdQLNQ0lUIwRJXFuFeVtiGsieRPzN8vQ7V5p3kSIG64C0y6u9wOZKIfoswQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2687
Received-SPF: pass client-ip=40.107.14.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_NONE=-0.0001,
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

27.08.2021 18:09, Eric Blake wrote:
> According to the NBD spec, a server advertising
> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> not see any cache inconsistencies: when properly separated by a single
> flush, actions performed by one client will be visible to another
> client, regardless of which client did the flush.  We satisfy these
> conditions in qemu because our block layer serializes any overlapping
> operations (see bdrv_find_conflicting_request and friends): no matter
> which client performs a flush, parallel requests coming from distinct
> NBD clients will still be well-ordered by the time they are passed on
> to the underlying device, with no caching in qemu proper to allow
> stale results to leak after a flush.
> 
> We don't want to advertise MULTI_CONN when we know that a second
> client can connect (which is the default for qemu-nbd, but not for QMP
> nbd-server-add), so it does require a QAPI addition.  But other than
> that, the actual change to advertise the bit for writable servers is
> fairly small.  The harder part of this patch is setting up an iotest
> to demonstrate behavior of multiple NBD clients to a single server.
> It might be possible with parallel qemu-io processes, but concisely
> managing that in shell is painful.  I found it easier to do by relying
> on the libnbd project's nbdsh, which means this test will be skipped
> on platforms where that is not available.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   docs/interop/nbd.txt                       |  1 +
>   docs/tools/qemu-nbd.rst                    |  3 +-
>   qapi/block-export.json                     |  6 +-
>   blockdev-nbd.c                             |  4 +
>   nbd/server.c                               | 10 +--
>   qemu-nbd.c                                 |  2 +
>   MAINTAINERS                                |  1 +
>   tests/qemu-iotests/tests/nbd-multiconn     | 91 ++++++++++++++++++++++
>   tests/qemu-iotests/tests/nbd-multiconn.out | 14 ++++
>   9 files changed, 124 insertions(+), 8 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
>   create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out
> 
> diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
> index 10ce098a29bf..d03910f1e9eb 100644
> --- a/docs/interop/nbd.txt
> +++ b/docs/interop/nbd.txt
> @@ -68,3 +68,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
>   * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
>   NBD_CMD_FLAG_FAST_ZERO
>   * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
> +* 6.2: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports
> diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> index 5643da26e982..81be32164a55 100644
> --- a/docs/tools/qemu-nbd.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -138,8 +138,7 @@ driver options if ``--image-opts`` is specified.
>   .. option:: -e, --shared=NUM
> 
>     Allow up to *NUM* clients to share the device (default
> -  ``1``), 0 for unlimited. Safe for readers, but for now,
> -  consistency is not guaranteed between multiple writers.
> +  ``1``), 0 for unlimited.
> 
>   .. option:: -t, --persistent
> 
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index 0ed63442a819..b2085a9fdd4c 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -95,11 +95,15 @@
>   #                    the metadata context name "qemu:allocation-depth" to
>   #                    inspect allocation details. (since 5.2)
>   #
> +# @shared: True if the server should advertise that multiple clients may
> +#          connect, default false. (since 6.2)
> +#
>   # Since: 5.2
>   ##
>   { 'struct': 'BlockExportOptionsNbd',
>     'base': 'BlockExportOptionsNbdBase',
> -  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool' } }
> +  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool',
> +             '*shared': 'bool' } }
> 
>   ##
>   # @BlockExportOptionsVhostUserBlk:
> diff --git a/blockdev-nbd.c b/blockdev-nbd.c
> index bdfa7ed3a5a9..258feaa76e02 100644
> --- a/blockdev-nbd.c
> +++ b/blockdev-nbd.c
> @@ -221,6 +221,10 @@ void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
>           QAPI_LIST_PREPEND(export_opts->u.nbd.bitmaps, g_strdup(arg->bitmap));
>       }
> 
> +    /* nbd-server-add always permits parallel clients */
> +    export_opts->u.nbd.has_shared = true;
> +    export_opts->u.nbd.shared = true;

Hmm, I don't follow.. Before the patch we allowed multicon only for readonly exports. Now with nbd-server-add we allow it for any kind of export?

> +
>       /*
>        * nbd-server-add doesn't complain when a read-only device should be
>        * exported as writable, but simply downgrades it. This is an error with
> diff --git a/nbd/server.c b/nbd/server.c
> index 3927f7789dcf..1646796a4798 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -1,5 +1,5 @@
>   /*
> - *  Copyright (C) 2016-2020 Red Hat, Inc.
> + *  Copyright (C) 2016-2021 Red Hat, Inc.
>    *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
>    *
>    *  Network Block Device Server Side
> @@ -1634,7 +1634,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
>       int64_t size;
>       uint64_t perm, shared_perm;
>       bool readonly = !exp_args->writable;
> -    bool shared = !exp_args->writable;
> +    bool shared = arg->shared;
>       strList *bitmaps;
>       size_t i;
>       int ret;
> @@ -1685,11 +1685,11 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
>       exp->description = g_strdup(arg->description);
>       exp->nbdflags = (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_FLUSH |
>                        NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);
> +    if (shared) {
> +        exp->nbdflags |= NBD_FLAG_CAN_MULTI_CONN;
> +    }
>       if (readonly) {
>           exp->nbdflags |= NBD_FLAG_READ_ONLY;
> -        if (shared) {
> -            exp->nbdflags |= NBD_FLAG_CAN_MULTI_CONN;
> -        }

And here, before the patch we allowed multicon for any readonly export. Now in case of block-export-add, the default behavior for readonly export changes.. Is it OK?

More compatible way would be modify with new option only behavior of writable exports and keep readonly exports as is.

>       } else {
>           exp->nbdflags |= (NBD_FLAG_SEND_TRIM | NBD_FLAG_SEND_WRITE_ZEROES |
>                             NBD_FLAG_SEND_FAST_ZERO);
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index f68fcceadd9e..198b1c55729d 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -1084,6 +1084,8 @@ int main(int argc, char **argv)
>               .bitmaps              = bitmaps,
>               .has_allocation_depth = alloc_depth,
>               .allocation_depth     = alloc_depth,
> +            .has_shared           = true,
> +            .shared               = shared != 1,
>           },
>       };
>       blk_exp_add(export_opts, &error_fatal);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6b3697962c1b..6eab82e6b982 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3142,6 +3142,7 @@ F: qemu-nbd.*
>   F: blockdev-nbd.c
>   F: docs/interop/nbd.txt
>   F: docs/tools/qemu-nbd.rst
> +F: tests/qemu-iotests/tests/*nbd*
>   T: git https://repo.or.cz/qemu/ericb.git nbd
>   T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd
> 
> diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
> new file mode 100755
> index 000000000000..66b410546e2f
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/nbd-multiconn
> @@ -0,0 +1,91 @@
> +#!/usr/bin/env bash
> +# group: rw auto quick
> +#
> +# Test that qemu-nbd MULTI_CONN works
> +#
> +# Copyright (C) 2018-2021 Red Hat, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +seq="$(basename $0)"
> +echo "QA output created by $seq"
> +
> +status=1 # failure is the default!
> +
> +_cleanup()
> +{
> +    _cleanup_test_img
> +    nbd_server_stop
> +}
> +trap "_cleanup; exit \$status" 0 1 2 3 15
> +
> +# get standard environment, filters and checks
> +cd ..
> +. ./common.rc
> +. ./common.filter
> +. ./common.nbd
> +
> +_supported_fmt qcow2
> +_supported_proto file
> +_supported_os Linux
> +_require_command QEMU_NBD
> +
> +# Parallel client connections are easier with libnbd than qemu-io:
> +if ! (nbdsh --version) >/dev/null 2>&1; then
> +    _notrun "nbdsh utility required, skipped this test"
> +fi
> +
> +echo
> +echo "=== Initial image setup ==="
> +echo
> +
> +_make_test_img 4M
> +$QEMU_IO -c 'w -P 1 0 2M' -c 'w -P 2 2M 2M' "$TEST_IMG" | _filter_qemu_io
> +IMG="driver=nbd,server.type=unix,server.path=$nbd_unix_socket"
> +nbd_server_start_unix_socket -f qcow2 -e 5 "$TEST_IMG"
> +
> +echo
> +echo "=== Demonstrate parallel clients ==="
> +echo
> +
> +export nbd_unix_socket
> +nbdsh -c '
> +import os
> +sock = os.getenv("nbd_unix_socket")
> +h = []
> +
> +for i in range(3):
> +  h.append(nbd.NBD())
> +  h[i].connect_unix(sock)
> +  assert h[i].can_multi_conn()
> +
> +buf1 = h[0].pread(1024 * 1024, 0)
> +if buf1 != b"\x01" * 1024 * 1024:
> +  print("Unexpected initial read")
> +buf2 = b"\x03" * 1024 * 1024
> +h[1].pwrite(buf2, 0)
> +h[2].flush()
> +buf1 = h[0].pread(1024 * 1024, 0)
> +if buf1 == buf2:
> +  print("Flush appears to be consistent across connections")
> +
> +for i in range(3):
> +  h[i].shutdown()
> +'
> +
> +# success, all done
> +echo '*** done'
> +rm -f $seq.full
> +status=0
> diff --git a/tests/qemu-iotests/tests/nbd-multiconn.out b/tests/qemu-iotests/tests/nbd-multiconn.out
> new file mode 100644
> index 000000000000..4554099e4d62
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/nbd-multiconn.out
> @@ -0,0 +1,14 @@
> +QA output created by nbd-multiconn
> +
> +=== Initial image setup ===
> +
> +Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4194304
> +wrote 2097152/2097152 bytes at offset 0
> +2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +wrote 2097152/2097152 bytes at offset 2097152
> +2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
> +=== Demonstrate parallel clients ===
> +
> +Flush appears to be consistent across connections
> +*** done
> 


-- 
Best regards,
Vladimir

