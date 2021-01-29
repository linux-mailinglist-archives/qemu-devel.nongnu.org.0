Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B164308549
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:42:25 +0100 (CET)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5MY4-0008NB-Cp
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5MWC-0007Z9-P2; Fri, 29 Jan 2021 00:40:29 -0500
Received: from mail-eopbgr70132.outbound.protection.outlook.com
 ([40.107.7.132]:21828 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5MW8-00028k-Ii; Fri, 29 Jan 2021 00:40:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck1Vn5mgJ2yggoFtitH93O+Azh1JymsYPgC9DKV0VBW/h10H7mpufcAMN/uA6AqWb5RXqd5MWOVdI1o18oYprEBU6tW9ERGdtNAs+VvtwMdHrfwOkLz7L73zuMWeXLAfnyGjO+wEL4C/POKwWyyZhyvMB5wSrExQbpqiDEGkt1qjoIpNfHpEZEI4Sc6H6Lo3gpSm71nqvVw+nyBAsUWBhArDA9wQco3funvuLgMcFPa494St0P0GrIsioWL5w5jyFOllM2ubDlGq4s1dUvo3Cr9/SB8tS4APG5waDwyQhBCXOlOcJXFGNK/zVVL4tJtwiBjtRuHVvtHRyD/I2s8RmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSU9mJtpBS8PR3qAKrNEahFKCrUZlxFDU8CJJt0TlHE=;
 b=BDuSY0nvF4w+G6ceg7dbTeanvNUAz0T7C2uddmccvA3xxL6ONijodN7SmXRKvKmbbJoGr2e2DBMtrLQMcqC6iwL9C9kFiVkapS2Dj6Glmyp9crtNWfuIEW3WYad3dPvtjbq9Cr+mLBxVyhwe81bJgWl22AhBGEXkJ+MTFhB+UuyeKuw/6sxVivpu2Epk2hu+DvCjPCgTPgktprEUTgEQ9wWxykslOTes5xBsKparP/ipJ8y1N3yvmW4tDC0SCYMsobS/CWSvnfYKqoOgctcYi7W27/RlVZWhsFt/PO5W7lO+yOeWsDEmw2UM15kocDokl2eCZTstWrvVn+ZNYDMLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSU9mJtpBS8PR3qAKrNEahFKCrUZlxFDU8CJJt0TlHE=;
 b=UU/VcX6hCUocZf5L39EL0E9wgDOAlgsKO65JuirZZgmO223/Bc0hBOx0oS53aNkJi0QnMw7I6hvuGa7UgFqWPz+f9YxLdibHSBR/iE4ZMlWh8PMK41Dw9sBDA5rqDCfgpzxHeksmxjeQZ2bYszZVr9AS+gQV98uEZgFOfREnAAE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 05:40:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 05:40:21 +0000
Subject: Re: [PATCH 2/3] block/nbd: only enter connection coroutine if it's
 present
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210128201418.607640-1-rvkagan@yandex-team.ru>
 <20210128201418.607640-3-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f635145d-d2bb-103e-f28a-21b174eb676b@virtuozzo.com>
Date: Fri, 29 Jan 2021 08:40:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210128201418.607640-3-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.77.43]
X-ClientProxiedBy: AM0PR10CA0081.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.193] (178.176.77.43) by
 AM0PR10CA0081.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Fri, 29 Jan 2021 05:40:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 518d07e5-2247-46a5-ad75-08d8c4185e4e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6102:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61020A1D0A8F77A369B7A0EEC1B99@AS8PR08MB6102.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xFoTJc3RHRq6afxUzwN3Km1GhP5rx/v+u8XFU9a2u3x6vrcS/y2E3IgBW1qTKKw80N22e7QNjIUqLqp3vV84G1sCmkq/5N5sCs/EXS5Ym3yAOQJ/QHln+4EKTzNa7kXZxlU2lj1rQBPWYYEii0zpRiW25PjQsJpOUneEElE6lGSxwLMiGWAe3WI80LBk4nLiKVrWecsP8w0F9k2Zwa7m55vmD6qW2lnbjt0OwFmzwg8pMXb1EPD69OgXAs4zI0GNX2flntIY8qkK5QSE8E0AIvhFay2qo1AxUQDJDPfylFOQMjMYCYUE2mHE2eI9j3WQ1U4rr/hX9tGbYwaLFrxr6GYh+QYj5/k41NPHwqcEihNo3vxd39uGA+F8N6opp3AGcyr8fFUd+6onmdJ6C9/JjhBrX3hDjX17Uk3/BHZC7NJ9aqn3a/buX+tFlMKfZO213D5AHHdaqIZibA3x1UtihwzQcCZOL//yfK8NarxQ0g76/rHv29jkK9Z0VpIOFmhGFBJAqKOLItT0IQYtQ2r7OcQt2f2psCVA067BOG+NZlTDf9/Y8Vb1vgz1DiK5ePxkQtTQQO82ar3kSMOP4OyrFPat7CIgUl86dpNIXPs03Io=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39840400004)(136003)(956004)(54906003)(83380400001)(16576012)(2616005)(316002)(6486002)(36756003)(26005)(16526019)(66946007)(8676002)(5660300002)(186003)(31686004)(66476007)(2906002)(31696002)(478600001)(4326008)(66556008)(8936002)(52116002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aXZ2QjhmYXJLcG1VY09EaXhyNzVQdXAzNko3L3U3aG5sL21OSlFhUDBLVTZz?=
 =?utf-8?B?Q3pTV3pQRmwxam5SclNPNXZvUGlrMU1ENEptVU9XSlJoVzNLWTUzc3h0dXFi?=
 =?utf-8?B?S0lKK3JEb0sya25TMEswazM0YVRvUEhzNXMxL3Z0NDV4YktFTSsxd0Z6alBM?=
 =?utf-8?B?OVUyNGZxdE5xUS9WaXh0N1hHdDI4MmhqSlRUdmM1MFAwdDNHTUE0YW5MeXFZ?=
 =?utf-8?B?WnRDbUdCZFhSbS9aS3htdjdsZlg1SHVnVkxFNjJyTEFCQmEyUFgvZDFaWjFV?=
 =?utf-8?B?Z3c0TUZSYnhMWlFCWWpsS0hGLzYwQnVwSU1YaU1RNkk2QURScGVSeHRkSnVS?=
 =?utf-8?B?YUtjUG5ZbGNWa1JaMEN4cHF4SEYra3BaN2NpaUZPdDNGV0R3RmRjUStOMFBl?=
 =?utf-8?B?VFZObS84Z0tDclRER2dsaWxaZmpDUGhaeWFLcGo3ZkJGU3ZSR3REWGdhb1hp?=
 =?utf-8?B?STdiRGY2SW1WVHNpWjhNVExmVzZzd1NuU1FrYzlhZE9oUTlONWgycER3d3Fz?=
 =?utf-8?B?Q2VXeWo0WXIxNFpGd2lmTkczODBvUXNveTN6QXZUYUxHdDdETlJ0eCsvV1A3?=
 =?utf-8?B?a2FQNnhVVXo2MXR0Vlo4SWI3YS9oNU5TMVBRL1JqbzlWVFZEZFdiRVdOaUJs?=
 =?utf-8?B?VWR4ekRKYWxranN5NjRZMlc4R3FIZXBNaW15Y2dUekdoWEJJRS91SVJlVnd6?=
 =?utf-8?B?YzZWcUxBaXFSWnJoRmlSdXRoRVFpNUh6cU5ZNUEzSDhlNkovWW5WbVlDNkRK?=
 =?utf-8?B?UXdIQWNMd3VvWmZvcGplYkJsOUFaVkpJUm94MjdMNEJSUlc5QkJwK3NjTDhu?=
 =?utf-8?B?UUY3TGxmNCtmNnNBY1krTVhrWTU2QWxING5oeWh6ZDlFQUZMRkJHeW5tWWFx?=
 =?utf-8?B?TU5qTnZodkY5L1Nyb0pxN1ZsZ2RRNWQweU5haWYzaWxWSmN2SGJUbHpFOFZR?=
 =?utf-8?B?QTB1Q2xEYzFLam0vNCtHY3h0S3d1UkRROWQrMCtJeVJ2N1dkTWRWd2R1emhq?=
 =?utf-8?B?TkIwSFNUUzUyTDdaZ1pMd0VkUlJYZU9wTDJTeTVyMTVWVEdJWHF1NzlWVC9H?=
 =?utf-8?B?V3lWQ0dVVFYvaU9BZHZLZ0NuUkdvVUk5T3NwZXFvelJQSjdQNFhZTkxtdDJa?=
 =?utf-8?B?YnN3S2cyUUFZdjlDZ0VOeHBqRUdhZHlQcVRHbzhrN2VoblVaWUoyOWVjaWQy?=
 =?utf-8?B?RFhTOENod3ZsR0xvVUZSSFA2MDhFMkViKzBnTFZHWmxYNkZtdUlCd2V4UHZG?=
 =?utf-8?B?UGExVmpxMDBBakFON2FkT3FtUnNRdEc0eVJWTllBN1ZIYkwvK051V2dZL2R6?=
 =?utf-8?B?K2x3ZWxRQ1BkN2JpTUs0T3JBQURFMjI5MWlvTnpTMzdQVVRTUzlyRCsrd1FE?=
 =?utf-8?B?cmljcCt0K2xIak5PMTNtWHhaOFlJYUZYNFZDZVhDM2hWdk9yVFFFaDZVLzZr?=
 =?utf-8?Q?Bp3wT21m?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518d07e5-2247-46a5-ad75-08d8c4185e4e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 05:40:21.4374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22QxMpBi6BhAYVEpc2inUPBexuRjwhLCaxLCr+DAXk6bajE7CeV1Fgk3T3ljBblSSVu8Udo8K7gglLYiNmyE1aMVbFhnUgLSGBfqxc6zlCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
Received-SPF: pass client-ip=40.107.7.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 23:14, Roman Kagan wrote:
> When an NBD block driver state is moved from one aio_context to another
> (e.g. when doing a drain in a migration thread),
> nbd_client_attach_aio_context_bh is executed that enters the connection
> coroutine.
> 
> However, the assumption that ->connection_co is always present here
> appears incorrect: the connection may have encountered an error other
> than -EIO in the underlying transport, and thus may have decided to quit
> rather than keep trying to reconnect, and therefore it may have
> terminated the connection coroutine.  As a result an attempt to reassign
> the client in this state (NBD_CLIENT_QUIT) to a different aio_context
> leads to a null pointer dereference:
> 
>      at /build/qemu-6MF7tq/qemu-5.0.1/util/qemu-coroutine.c:109
>      opaque=0x561805ed4c00) at /build/qemu-6MF7tq/qemu-5.0.1/block/nbd.c:164
>      at /build/qemu-6MF7tq/qemu-5.0.1/util/aio-wait.c:55
>      at /build/qemu-6MF7tq/qemu-5.0.1/util/async.c:136
>      at /build/qemu-6MF7tq/qemu-5.0.1/util/async.c:164
>      blocking=blocking@entry=true)
>      at /build/qemu-6MF7tq/qemu-5.0.1/util/aio-posix.c:650
>      cb=<optimized out>, opaque=<optimized out>)
>      at /build/qemu-6MF7tq/qemu-5.0.1/util/aio-wait.c:71
>      bs=0x561805ed4c00) at /build/qemu-6MF7tq/qemu-5.0.1/block.c:6172
>      new_context=new_context@entry=0x5618056c7580,
>      ignore=ignore@entry=0x7f60e1e63780)
>      at /build/qemu-6MF7tq/qemu-5.0.1/block.c:6237
>      bs=bs@entry=0x561805ed4c00, ctx=0x5618056c7580,
>      ignore_child=<optimized out>, errp=<optimized out>)
>      at /build/qemu-6MF7tq/qemu-5.0.1/block.c:6332
>      new_context=0x5618056c7580, update_root_node=update_root_node@entry=true,
>      errp=errp@entry=0x0)
>      at /build/qemu-6MF7tq/qemu-5.0.1/block/block-backend.c:1989
>      new_context=<optimized out>, errp=errp@entry=0x0)
>      at /build/qemu-6MF7tq/qemu-5.0.1/block/block-backend.c:2010
>      at /build/qemu-6MF7tq/qemu-5.0.1/hw/block/dataplane/virtio-blk.c:292
>      at /build/qemu-6MF7tq/qemu-5.0.1/hw/virtio/virtio-bus.c:245
>      running=0, state=<optimized out>)
>      at /build/qemu-6MF7tq/qemu-5.0.1/hw/virtio/virtio.c:3220
>      state=state@entry=RUN_STATE_FINISH_MIGRATE)
>      at /build/qemu-6MF7tq/qemu-5.0.1/softmmu/vl.c:1275
>      send_stop=<optimized out>) at /build/qemu-6MF7tq/qemu-5.0.1/cpus.c:1032
>      at /build/qemu-6MF7tq/qemu-5.0.1/migration/migration.c:2914
>      at /build/qemu-6MF7tq/qemu-5.0.1/migration/migration.c:3275
>      at /build/qemu-6MF7tq/qemu-5.0.1/migration/migration.c:3439
>      at /build/qemu-6MF7tq/qemu-5.0.1/util/qemu-thread-posix.c:519
>     from /lib/x86_64-linux-gnu/libpthread.so.0
> 
> Fix it by checking that the connection coroutine is non-null before
> trying to enter it.  If it is null, no entering is needed, as the
> connection is probably going down anyway.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   block/nbd.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index bcd6641e90..b3cbbeb4b0 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -250,13 +250,15 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
>       BlockDriverState *bs = opaque;
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>   
> -    /*
> -     * The node is still drained, so we know the coroutine has yielded in
> -     * nbd_read_eof(), the only place where bs->in_flight can reach 0, or it is
> -     * entered for the first time. Both places are safe for entering the
> -     * coroutine.
> -     */
> -    qemu_aio_coroutine_enter(bs->aio_context, s->connection_co);
> +    if (s->connection_co) {
> +        /*
> +         * The node is still drained, so we know the coroutine has yielded in
> +         * nbd_read_eof(), the only place where bs->in_flight can reach 0, or
> +         * it is entered for the first time. Both places are safe for entering
> +         * the coroutine.
> +         */
> +        qemu_aio_coroutine_enter(bs->aio_context, s->connection_co);
> +    }
>       bdrv_dec_in_flight(bs);
>   }
>   
> 


-- 
Best regards,
Vladimir

