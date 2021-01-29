Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F2F308547
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:39:05 +0100 (CET)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5MUp-0006td-PJ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5MTQ-0005zO-Hp; Fri, 29 Jan 2021 00:37:36 -0500
Received: from mail-he1eur04on072e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::72e]:55300
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5MTN-0000tJ-QJ; Fri, 29 Jan 2021 00:37:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMx9sQMwvuH5NtXb72vheJBiqyIqj13j+QpsqYKnlFn+GIpNrNRgal/riyKvCI3pcxFQb8d1t3Gq5LxfRgqEJoiYdN8Woh6RVXauDHDmI0Sq9WD/0+KjwUGqcVd5O+wKJZKK1AxHobq7W+ge9yeZZYvIc9Fl1ITHHv8W1Et0m2hNvu5EpVSNVNU6UrdvE4Vnkj+LHeNr4uSoAl2q0eqnnuhmrx/0sQeDFifXd/rOVPn7tSounc0U5avhdvrB7teyPtxCKH+iaiLvU2omYMQfU+bFv0LG8tVLgW0QjUUNZUMozfXkWzilsEJzaAuqsJRz1y9Jg8+qKsGz3v6N+UDjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Oct214cTon07LlY/hqb6O5pXUApItnlDQu9/Qoyp7U=;
 b=ZPljz9YzpZDW+SZSGdOBgjHpQhW+jc1uJH691AJIzh0k3u8AOGFyKP/N/Pke2SzxeAmtUpYp+oUo7zQjWjxhW2ZSRXzZftS8GUj/UMWTkc5XYah6VdGXDfY60vxoQigh2fE4MVKhkso2XHWwoa1qrOK3BtSwGKfviFeBrh8UK9HX4PlH1ab9M7XjIinVzEcYK2v185VISH12Dm32d5YW4Hzt+lAJfxKsNnlYKJYVGkrD4sa5gsQX9BFGuE5vi8oEfhslGVTAwsZo4Usbey9cDHDVlNFEqrdXTW91LblGpZDxfKHwWOyKAQcj0sKiehar4ScIaRvg3yFJABXu47NNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Oct214cTon07LlY/hqb6O5pXUApItnlDQu9/Qoyp7U=;
 b=tVUytqqRTkBODBn3VgcVvPqTseYqO77Q1ebOemBkCiSVrmgUmtGIXi2AID72pT4oKJCGkrTFg7ToZKCS0QYAWqum8hEt0T9JnrdWCGy5dTBJ85On3GOI0bFPmDWDKZXWtI3C5wE3N9V0JWfEqKmMhK/HfBF53I3AWYa4JAHfMlA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 05:37:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 05:37:16 +0000
Subject: Re: [PATCH 1/3] block/nbd: only detach existing iochannel from
 aio_context
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210128201418.607640-1-rvkagan@yandex-team.ru>
 <20210128201418.607640-2-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8b3ec104-420d-1504-454c-3f6560850087@virtuozzo.com>
Date: Fri, 29 Jan 2021 08:37:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210128201418.607640-2-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.77.43]
X-ClientProxiedBy: AM4PR0902CA0013.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.193] (178.176.77.43) by
 AM4PR0902CA0013.eurprd09.prod.outlook.com (2603:10a6:200:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Fri, 29 Jan 2021 05:37:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36dd304-ede5-493e-0e34-08d8c417efed
X-MS-TrafficTypeDiagnostic: AS8PR08MB6102:
X-Microsoft-Antispam-PRVS: <AS8PR08MB610226434CF5B3D3F36FA73DC1B99@AS8PR08MB6102.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4llMTJRgu0ibbd6sL36YncIJ2WNoP20Wuxq+TuWJU4wlDfQRqTNFEHsnaZw0G3TNK7JDw9yLAteu0fwV8uN4RMZUFV2bqHewK9B2zfIcpBMMuVS5Pp3ynVXS+lP7UUfGNZjAN3nsVaB0ALSsBDLrfrBuGJfeMycW77y81Ue9cA+VlORamqcdaQ5svLQccd2cT5Z3W5t3GwapoEHGZ34ejJbeuYvTr5xBISFWyOXT1ohSQGcJkqRMoHUlwS929TcFc1nWOgFBFwMISpVrUHt1xLxKl5hiPi44a9fy3joNRkshOfTniVC6G3rL/MeNy+GzMOeO0oHF2M2cF/+wubdRtBH+xUZco5a6cfjp0SEmiYyBQ/d59a09sWrTZS7ElSqxjSPRa6kA5E2Hclzyn7gguZEAkeLp3d/nEeaDvtMpgl7k0/ggkBjn/a0l1xjJYYrzSd5D1oXrOF0R9kc9U/tfY6bRcCgudasIXMzIw6SyOEMiM0haj1eaupa9BO0YoXIf51qj9FZl8vFJRhaXMnueZHitq5eZAtt/ybc/AEFnBlJqa00mTgFR+27CzEka2pLJx1Df/Xy4TyG0zHTkn1yEhEymRUoboS5f5lnyJja9vUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39840400004)(136003)(956004)(54906003)(83380400001)(16576012)(2616005)(316002)(6486002)(36756003)(26005)(16526019)(66946007)(8676002)(5660300002)(186003)(31686004)(66476007)(2906002)(31696002)(478600001)(4326008)(66556008)(8936002)(52116002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UHFrVmFnV3puSzFJbWtwc3FVMEFHY2RBNkY4aHZDSFlIR3ZTK0J5OVhaWUFB?=
 =?utf-8?B?VTdGLy9tZndBNGdiSnFzYjRxTUNnRXY2Y2lzTDVncjRkVEJNdGY4L3hvWXlY?=
 =?utf-8?B?R2Z2TE1tRWQ5OFdUSXZDMWphVHRxY1ovM2I3MFliSUt5VWZmcFJCVHd5aGFn?=
 =?utf-8?B?NFExOXV0cGJ5TlU1VTB4UzJqTkYvN1lKOE5ucmJkeTBUK0tkSGx0VnNJWmp3?=
 =?utf-8?B?UDBCcGZnMTN6QUpCbzV4bkc4RFNSMlJnN3lSSzJHVFZvWGVwV3I5c1lqY0Z5?=
 =?utf-8?B?elR1V1pRVWZJenZzRjN4dHkwb3ZoZ0lxV24rdUY0elBUaGlROEgzTVFRU0J4?=
 =?utf-8?B?ZE5XUGduNVBGRUVBVk5QS3BLOWp2ZmtxRWxhUHFxVHBXdlY3ZXQ1eVBzT1dB?=
 =?utf-8?B?S3BRaXlySGErMHovM0JYUzVqS010cTV4cXkxUUhMcS9kbTA1ay82dUtCc2hZ?=
 =?utf-8?B?KzVxYkRsV05GZ0syUE5DajJxbE9PeVFzSlRtQjVlR1grSG5VVWJ4bDhnRGpR?=
 =?utf-8?B?dVB1eFRWVGxRMXJJRG01dG9LZlJ6OW5lRCswYUp5ZmlIZzVmeFVqYUR6amJn?=
 =?utf-8?B?UVN6dWwxWTIwWjlKaFd3eVJvRnZLY0hWcXUyMkE0QzJxazBCbFNUNkd2MU5l?=
 =?utf-8?B?QXBZOVEwM0hMRUhhK21qR1FOVDlseThGbHMrSm1KSFB5SG9kYTErNHFFYmlv?=
 =?utf-8?B?elZleUtpVFpnSUpQVDBNY2pxUlh4RCtyRDFBTHpOZk43Tm5zalhHT1cxNEpm?=
 =?utf-8?B?UkxCVDRVUzRSSTVhc256QVpOejVWTFFNalBVemFCQlRNSjE0dlNPZmJYL0RY?=
 =?utf-8?B?MGxsbE1zZmJuNWU5Q3pNdndKZ0F0OURnQkEwRnpjU2gxUUloQ2RlWGtXV1Rr?=
 =?utf-8?B?c3NUc2NHU1dwUjJuKzFJV2FSY3o3K3Z5NzI5b21PUkx4RkhjUUlNQVRFa3J4?=
 =?utf-8?B?SVo4VW0rMW9IK01GY2RDeENVUE40KzVnYkxhbWZKbm9UYTZNK2MrQXRMdTZ0?=
 =?utf-8?B?Q1lIRTgwS3N1bUMwTmZ4TnMwbkdYVmpWaW5LaHdFenZVeGZ0Y2tZRmN0Y1By?=
 =?utf-8?B?WVFaYXc0YlB4aDZnNWJETFZsY3plbjBsTTZMN0NTVStSUDRZVGVkUGhjdnhP?=
 =?utf-8?B?ZWJOMTYwQ3RXTU45S1E3RVRqMXRuWDlKSnZOdE0yVUFSMjE1aVlVSGtsemFX?=
 =?utf-8?B?SDZYK3hyTDRsRmRxWTh5S0pOMlJscmtXSHQzc3JIa0d2YlJEN0k1TjcrTW4z?=
 =?utf-8?B?QUVwNDFaOCs2ajVDM3RhUlF4dmJ1SHJHYXhaSlN1TkpSTnJRWmpVSW93SDNS?=
 =?utf-8?B?aHNhbmJDWFdIQ0dHUkRkeU50ZHRlVS9tc1RESS9LQnZvWjRoczZhYlFiclhC?=
 =?utf-8?B?dlpQUDJZTHNoS1dGbXBQckw4M0EwT0VkQkFaK2V0blY3VHlYSXpTNzNhb1dj?=
 =?utf-8?Q?JHwvulc0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36dd304-ede5-493e-0e34-08d8c417efed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 05:37:16.2443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDwLzwoW7LIbUIgJlR1RWfy8ZEQtg/KT9EsQAkaHHM2hxrm4+aqLI6HVxPx30QM12Zqht2PHu4WjptmERgJJ2Yta2kmretNRtPEkgBjGwzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
Received-SPF: pass client-ip=2a01:111:f400:fe0d::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 23:14, Roman Kagan wrote:
> When the reconnect in NBD client is in progress, the iochannel used for
> NBD connection doesn't exist.  Therefore an attempt to detach it from
> the aio_context of the parent BlockDriverState results in a NULL pointer
> dereference.
> 
> The problem is triggerable, in particular, when an outgoing migration is
> about to finish, and stopping the dataplane tries to move the
> BlockDriverState from the iothread aio_context to the main loop.  If the
> NBD connection is lost before this point, and the NBD client has entered
> the reconnect procedure, QEMU crashes:
> 
>      at /build/qemu-gYtjVn/qemu-5.0.1/io/channel.c:452
>      at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6151
>      new_context=new_context@entry=0x562a260c9580,
>      ignore=ignore@entry=0x7feeadc9b780)
>      at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6230
>      (bs=bs@entry=0x562a268d6a00, ctx=0x562a260c9580,
>      ignore_child=<optimized out>, errp=<optimized out>)
>      at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6332
>      new_context=0x562a260c9580,
>      update_root_node=update_root_node@entry=true, errp=errp@entry=0x0)
>      at /build/qemu-gYtjVn/qemu-5.0.1/block/block-backend.c:1989
>      new_context=<optimized out>, errp=errp@entry=0x0)
>      at /build/qemu-gYtjVn/qemu-5.0.1/block/block-backend.c:2010
>      out>)
>      at /build/qemu-gYtjVn/qemu-5.0.1/hw/block/dataplane/virtio-blk.c:292
>      at /build/qemu-gYtjVn/qemu-5.0.1/hw/virtio/virtio-bus.c:245
>      running=0, state=<optimized out>)
>      at /build/qemu-gYtjVn/qemu-5.0.1/hw/virtio/virtio.c:3220
>      state=state@entry=RUN_STATE_FINISH_MIGRATE)
>      at /build/qemu-gYtjVn/qemu-5.0.1/softmmu/vl.c:1275
>      send_stop=<optimized out>)
>      at /build/qemu-gYtjVn/qemu-5.0.1/cpus.c:1032
>      at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:2914
>      at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:3275
>      at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:3439
>      at /build/qemu-gYtjVn/qemu-5.0.1/util/qemu-thread-posix.c:519
>      at pthread_create.c:333
>      oldval=0x562a2452b138, oldlenp=0x0, newval=0x562a2452c5e0
>      <__func__.28102>, newlen=0)
>      at ../sysdeps/unix/sysv/linux/sysctl.c:30

function names are somehow lost :(

> 
> Fix it by checking that the iochannel is non-null before trying to
> detach it from the aio_context.  If it is null, no detaching is needed,
> and it will get reattached in the proper aio_context once the connection
> is reestablished.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>

Thanks!

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   block/nbd.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 42e10c7c93..bcd6641e90 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -235,7 +235,14 @@ static void nbd_client_detach_aio_context(BlockDriverState *bs)
>   
>       /* Timer is deleted in nbd_client_co_drain_begin() */
>       assert(!s->reconnect_delay_timer);
> -    qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
> +    /*
> +     * If reconnect is in progress we may have no ->ioc.  It will be
> +     * re-instantiated in the proper aio context once the connection is
> +     * reestablished.
> +     */
> +    if (s->ioc) {
> +        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
> +    }
>   }
>   
>   static void nbd_client_attach_aio_context_bh(void *opaque)
> 


-- 
Best regards,
Vladimir

