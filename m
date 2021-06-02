Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC064398A05
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:50:24 +0200 (CEST)
Received: from localhost ([::1]:46458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQKF-0000nC-Uk
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQIy-0008P8-Vc; Wed, 02 Jun 2021 08:49:05 -0400
Received: from mail-am6eur05on2111.outbound.protection.outlook.com
 ([40.107.22.111]:46561 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQIr-0005hs-2m; Wed, 02 Jun 2021 08:49:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP+YPh5pA7eJ5e8WecpWvkuaRmsaoIPWeUieY7GbHu6U7+/P+IJn/2xFxTddK2HU6sPSf13Ti0J1eBLu78wSJGw3handVUIleA0O4CVhDXQ2snZzSrepk937NRWBXxnWzvYj3Lynvd7Hq0FpKljLWJY7JkOr0qrnH9ruFytZ6O4Ck2Zhl/skxj1oV2xdtd1ls8lCvAIMV0/FGYQn91xx1RgLqvgCAHehhTiHkgyoIdZHkNnZiuDQVlXmwS6ubKVVBMpzB//CTKk1DQGDNh1riGYE3k5fGP+UA5fjMwXeYIfEzQC/N1yq0CA9RTv342XeCurIrzmPidFyhKe8Q0Yh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFGtdXLufWw4L3tR7i9n3weMeATo3tXZmXxbVxBMEuI=;
 b=eNg2YTJlS7aFQxLMFY0bsXpwg9jRm2KrRO29vAxzIZDorO3vDC70l4neyGwFbaLBxicn73YuLkKy+kmGvUSR7iX7tfjmx1K3P8OvbeuTfJ4dzCHnxqYGGsl1y97nNVPoQ9+FdAiOIUy0z4RAVL9qV0ZURZV0UyNGOKu1X+texDn0U3Wfbg9M3g+VXRVG5d7SvWaNctKAC1OcSnO75hjjPcRU5CAjAXjQngYfIBisY50DsgdsYMN539NxTY3eUNnZo1R0NVV4lfUcyhGDW9HArohrQiAfejISt5LL0EoUDobQO4SzH9OurwS1RA520sWVMJ9tgewkaMnU9Dt90rrziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFGtdXLufWw4L3tR7i9n3weMeATo3tXZmXxbVxBMEuI=;
 b=dosAjEll2aytq7xG867NHIwmtQE2O6MBzgIAB1GVQd/hAM4M4JaJ7thk1wI4Ui9k5KQU/qTSxVV1b6kS/TX3cw11Jg1u0n0omFfcEsHh+o6rF8bW/RD/HyKaxL+j+ggfENY4irgFEl/c6FiuKKR0MzCMcsFy79XVLg9hGdpFK18=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 12:48:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 12:48:53 +0000
Subject: Re: [PATCH v2 2/2] nbd/server: Use drained block ops to quiesce the
 server
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Nir Soffer <nsoffer@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20210602060552.17433-1-slp@redhat.com>
 <20210602060552.17433-3-slp@redhat.com>
 <631d21ed-52e7-9d9c-4692-ca3212fdbdd9@virtuozzo.com>
 <20210602124430.7v6jbeydyie4as26@mhamilton>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f251a366-fd4b-d39c-704d-96b6edfa743a@virtuozzo.com>
Date: Wed, 2 Jun 2021 15:48:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210602124430.7v6jbeydyie4as26@mhamilton>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: PR3P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.211) by
 PR3P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 12:48:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73f2806d-2df7-4412-b6f6-08d925c4c72f
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59114C63D6E7F9CE8746BE06C13D9@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UvtPMFLhlDk56hsWAFE7RQw21CDzXJdBB/3W0UKG7e9XEPMOt6U18GKHfNd6nsFRnM48K5lSlhLXvNRFkDkW4GNedj1PlIXv9vQjAQEKz98T4+QeWv+yoXMrKXsX0ESSwOn6qkO8e5nhAwiW+DaZ9krqW3FPXKlY7BovDk0wsIk9dvPnywSMscSR0uD05NfWlB95rqgSdeDYg2xAu0w/lqGK5KWJqqNlkQiDabQTMATB1dPNk4ELxazo+JL5BcURSGYJknO5ODa7RZCZB+1e5PVEkq1VgA+fjx70/qvDB4mazAHMKWxi0U8CLr383fbiujrIVmhPyXRSGuEqthTLEWCsoEJeFY1RPWQzYZwAGp+kJ+lmnlfJMb8umu9Ykh1laRgvHaiPGUW7y5+HpZ4ZQTVb1wW62rAPeKkNtgr5S0zNlhUuROhWlafCq/tpxFfhRg/UDvD3GyFwMpw7tqjL/Cloqxz1Qv0ALaAUzFtTJYEMKEGz3DirQoBX8e1HZorGu0TSSqD7Vb9F1UY/3qP8B+Jdne7lakiBA4w696vIrSQ+e1FVBQMp7cc2YlhufcJeClS5oJSl2kPHS0lezRUJ1bRFLD32F+Ix0nJaGAGJvtzArq+F2srEkgNqAzC1zgIStbsudCtqwFLqK/v79ps2VlPNrD+c+IbtI8c2tHsVVdzyZqje5mzhXW3epgHBwapMh3CiezWrjyfecggMo+M+efZbRI2qeK4K92RO/N/Ql2M8aoDpXJg9CplqCIf+X//BNDWTwdBjLOtcxnvBuWlDyGD1XvPBdeNvNQuLTYy0LBb2sS8SeAV/g9ABZDKH3UZweIvEJBr7zBhHRHqRFx5C5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39840400004)(366004)(66476007)(66556008)(66946007)(83380400001)(6486002)(54906003)(2906002)(4326008)(31696002)(86362001)(8936002)(38100700002)(38350700002)(16576012)(6916009)(956004)(8676002)(186003)(966005)(2616005)(478600001)(5660300002)(52116002)(36756003)(26005)(316002)(31686004)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?kh96syjWPytloLdhbv4c/raZCK+Z5zC/FfCilsnBagGbSxjY/BLtwHUQ?=
 =?Windows-1252?Q?gUAOXtxI1CpZVIDsr+aoRgOnTXxqp2WnIr2Gpu9fKbBKRF8HMv1kQBT6?=
 =?Windows-1252?Q?9PZWIAydG1Nja9L9DR5+O5QfMszRQOz2+7FAlWgahPWXOKJQd1HBI7+O?=
 =?Windows-1252?Q?gzcPeJS3PlJjr2G43BnXYrhqsJ61ZfRAPsb0ERNE1YoZD/mCjC5XOQop?=
 =?Windows-1252?Q?g3903jTfdyxmNNOTTMeCnGpFjmWz7khKMU4ImzPHASkNwotlL6okjVBt?=
 =?Windows-1252?Q?fkjFf4zpuAuVbOd/s9HzaVUr7z0Q2DCOz5L7fEDkQcrtGDbJIXRGP11E?=
 =?Windows-1252?Q?DW4ZBiF9bvMTnRH+doRIXIye+LWbbtKZsvtYT1xUigfber0WbQAW+byR?=
 =?Windows-1252?Q?TsJl5YnMwpy1Yj6RZ8atK0D5VjPxDlV6zrIKBO4QWEy/ZFlvrD8NCkaW?=
 =?Windows-1252?Q?Kb49EvC+nYMuxDplBaGaydikNPe+SMSlaUSUGj/Dq0keXKDk71fsRZ//?=
 =?Windows-1252?Q?q864AoycYk6wu6hjLYDBsxh4WU9ectfgBMmd3pw7IX0puTPJZFumbnyf?=
 =?Windows-1252?Q?0mkgYZnQdvyZVoLrsYLxrzD8aItGftPfM7sWA5sr9TxUoMJofRMrCAQz?=
 =?Windows-1252?Q?EkWufOsu+JAJveCVEcZrDGu7BeKqNbmSU8/MkungYtZi8XG+6zTGBmnk?=
 =?Windows-1252?Q?oiGoNsVRSdhmyCUiEc21ZKijqLlYSptrWrPv2vioEzjx7E1xUMEjm3qJ?=
 =?Windows-1252?Q?A72/OunSrps0tXvYf2Z4Zfu/NX7BYC1C/87b6m+iimOZBG1g+Lme4fUy?=
 =?Windows-1252?Q?KMYywK2tASqF2zA4y+zORAkxaLZmLC08sSvHcGZiOOno4Zyh2ZhminYY?=
 =?Windows-1252?Q?q+qcbqpSgLKH5VJzTzyERkddmhtitM4rhrhynw67eICKUGA8KNVPc2j1?=
 =?Windows-1252?Q?QHE2YjmJ0YPPaGNR8A9FDGYm5b/nu4Pi9ep+vHrKD2RxA6CjlAZWrOxp?=
 =?Windows-1252?Q?/5K5YaoGvIRSzbIwq8JWBJupchE/6FJ6J2vcxhJzKb/AgS1EsDCOkkVy?=
 =?Windows-1252?Q?JZLBbZDr0+r5iYpMA16n+D+ATuSOkvVVeFrH0chYoPj9KsnBVgehU2yv?=
 =?Windows-1252?Q?WVTj1NaOpiQNi5MVJspkrzbTkL9Hx4CZI8iPSjzEg7B6N19rT1b/B/A4?=
 =?Windows-1252?Q?CljKApZZTa1bqIcRycfyGqIV0BIHJbtyGdhrcfX2wRljDYTB+S1jrDx6?=
 =?Windows-1252?Q?ysshbHYrMvwzOQ6lj5i5m0insl0Y3ewD9wUMCPo25KZFv31eGhSkIquc?=
 =?Windows-1252?Q?2B1nhvr3QKbzsJPR/kzxUsJDETKF03BigQ5AzhAicIhPFWYm6egZDjrc?=
 =?Windows-1252?Q?sqEcq+XYZniL+iJJGsourP7BXgLRtxf8HgluozHvg3LA15ptzucDxI6S?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f2806d-2df7-4412-b6f6-08d925c4c72f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 12:48:53.6341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oG1p6aQuhXlLeK4y2dkTdwbKYOtOVOW24TcCNjwokbNkD9rwT0XvJu5/Qr4sQKYj8SmeMsBD0j+Rd5Ma86d1mQTfdmjy/TyVR+BCHbB0GSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.22.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_NONE=-0.0001,
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

02.06.2021 15:44, Sergio Lopez wrote:
> On Wed, Jun 02, 2021 at 03:06:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 02.06.2021 09:05, Sergio Lopez wrote:
>>> Before switching between AioContexts we need to make sure that we're
>>> fully quiesced ("nb_requests == 0" for every client) when entering the
>>> drained section.
>>>
>>> To do this, we set "quiescing = true" for every client on
>>> ".drained_begin" to prevent new coroutines from being created, and
>>> check if "nb_requests == 0" on ".drained_poll". Finally, once we're
>>> exiting the drained section, on ".drained_end" we set "quiescing =
>>> false" and call "nbd_client_receive_next_request()" to resume the
>>> processing of new requests.
>>>
>>> With these changes, "blk_aio_attach()" and "blk_aio_detach()" can be
>>> reverted to be as simple as they were before f148ae7d36.
>>>
>>> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1960137
>>> Suggested-by: Kevin Wolf <kwolf@redhat.com>
>>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>>> ---
>>>    nbd/server.c | 82 ++++++++++++++++++++++++++++++++++++++--------------
>>>    1 file changed, 61 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/nbd/server.c b/nbd/server.c
>>> index 86a44a9b41..b60ebc3ab6 100644
>>> --- a/nbd/server.c
>>> +++ b/nbd/server.c
>>> @@ -1513,6 +1513,11 @@ static void nbd_request_put(NBDRequestData *req)
>>>        g_free(req);
>>>        client->nb_requests--;
>>> +
>>> +    if (client->quiescing && client->nb_requests == 0) {
>>> +        aio_wait_kick();
>>> +    }
>>> +
>>>        nbd_client_receive_next_request(client);
>>>        nbd_client_put(client);
>>> @@ -1530,49 +1535,68 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
>>>        QTAILQ_FOREACH(client, &exp->clients, next) {
>>>            qio_channel_attach_aio_context(client->ioc, ctx);
>>> +        assert(client->nb_requests == 0);
>>>            assert(client->recv_coroutine == NULL);
>>>            assert(client->send_coroutine == NULL);
>>> -
>>> -        if (client->quiescing) {
>>> -            client->quiescing = false;
>>> -            nbd_client_receive_next_request(client);
>>> -        }
>>>        }
>>>    }
>>> -static void nbd_aio_detach_bh(void *opaque)
>>> +static void blk_aio_detach(void *opaque)
>>>    {
>>>        NBDExport *exp = opaque;
>>>        NBDClient *client;
>>> +    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
>>> +
>>>        QTAILQ_FOREACH(client, &exp->clients, next) {
>>>            qio_channel_detach_aio_context(client->ioc);
>>> +    }
>>> +
>>> +    exp->common.ctx = NULL;
>>> +}
>>> +
>>> +static void nbd_drained_begin(void *opaque)
>>> +{
>>> +    NBDExport *exp = opaque;
>>> +    NBDClient *client;
>>> +
>>> +    QTAILQ_FOREACH(client, &exp->clients, next) {
>>>            client->quiescing = true;
>>> +    }
>>> +}
>>> -        if (client->recv_coroutine) {
>>> -            if (client->read_yielding) {
>>> -                qemu_aio_coroutine_enter(exp->common.ctx,
>>> -                                         client->recv_coroutine);
>>> -            } else {
>>> -                AIO_WAIT_WHILE(exp->common.ctx, client->recv_coroutine != NULL);
>>> -            }
>>> -        }
>>> +static void nbd_drained_end(void *opaque)
>>> +{
>>> +    NBDExport *exp = opaque;
>>> +    NBDClient *client;
>>> -        if (client->send_coroutine) {
>>> -            AIO_WAIT_WHILE(exp->common.ctx, client->send_coroutine != NULL);
>>> -        }
>>> +    QTAILQ_FOREACH(client, &exp->clients, next) {
>>> +        client->quiescing = false;
>>> +        nbd_client_receive_next_request(client);
>>>        }
>>>    }
>>> -static void blk_aio_detach(void *opaque)
>>> +static bool nbd_drained_poll(void *opaque)
>>>    {
>>>        NBDExport *exp = opaque;
>>> +    NBDClient *client;
>>> -    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
>>> +    QTAILQ_FOREACH(client, &exp->clients, next) {
>>> +        if (client->nb_requests != 0) {
>>> +            /*
>>> +             * If there's a coroutine waiting for a request on nbd_read_eof()
>>> +             * enter it here so we don't depend on the client to wake it up.
>>> +             */
>>> +            if (client->recv_coroutine != NULL && client->read_yielding) {
>>> +                qemu_aio_coroutine_enter(exp->common.ctx,
>>> +                                         client->recv_coroutine);
>>> +            }
>>> -    aio_wait_bh_oneshot(exp->common.ctx, nbd_aio_detach_bh, exp);
>>> +            return true;
>>> +        }
>>> +    }
>>> -    exp->common.ctx = NULL;
>>> +    return false;
>>>    }
>>>    static void nbd_eject_notifier(Notifier *n, void *data)
>>> @@ -1594,6 +1618,12 @@ void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk)
>>>        blk_add_remove_bs_notifier(blk, &nbd_exp->eject_notifier);
>>>    }
>>> +static const BlockDevOps nbd_block_ops = {
>>> +    .drained_begin = nbd_drained_begin,
>>> +    .drained_end = nbd_drained_end,
>>> +    .drained_poll = nbd_drained_poll,
>>> +};
>>> +
>>>    static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
>>>                                 Error **errp)
>>>    {
>>> @@ -1715,8 +1745,17 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
>>>        exp->allocation_depth = arg->allocation_depth;
>>> +    /*
>>> +     * We need to inhibit request queuing in the block layer to ensure we can
>>> +     * be properly quiesced when entering a drained section, as our coroutines
>>> +     * servicing pending requests might enter blk_pread().
>>> +     */
>>
>> Not very understandable to me :(. What's bad in queuing requests at blk layer during drained section?
> 
> We need to make sure that all coroutines in the NBD server have
> finished (client->nb_requests == 0) before detaching from the
> AioContext. If we don't inhibit request queuing, some coroutines may
> get stuck in blk_pread()->...->blk_wait_while_drained(), causing
> nbd_drained_poll() to always return that we're busy.

Ah, OK. Thanks for explanation.

> 
>>> +    blk_set_disable_request_queuing(blk, true);
>>> +
>>>        blk_add_aio_context_notifier(blk, blk_aio_attached, blk_aio_detach, exp);
>>> +    blk_set_dev_ops(blk, &nbd_block_ops, exp);
>>> +
>>>        QTAILQ_INSERT_TAIL(&exports, exp, next);
>>>        return 0;
>>> @@ -1788,6 +1827,7 @@ static void nbd_export_delete(BlockExport *blk_exp)
>>>            }
>>>            blk_remove_aio_context_notifier(exp->common.blk, blk_aio_attached,
>>>                                            blk_aio_detach, exp);
>>> +        blk_set_disable_request_queuing(exp->common.blk, false);
>>>        }
>>>        for (i = 0; i < exp->nr_export_bitmaps; i++) {
>>>
>>
>> I don't follow the whole logic of clients quiescing, but overall looks good to me. As I understand, prior to patch we have a kind of drain_begin realization in blk_aio_detach handler, and after patch we instead utilize generic code of drained sections with help of appropriate devops handlers.
> 
> Doing that in blk_aio_detach() was a bit too late since we were
> already in the drained section, and as stated above, we need it alive
> to ensure that all of the NBD server coroutines finish properly.
> 
> Also, .drained_poll allows us to align quiescing the NBD server with
> the block layer.
> 
> Thanks,
> Sergio.
> 
>> weak:
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>>
>> -- 
>> Best regards,
>> Vladimir
>>


-- 
Best regards,
Vladimir

