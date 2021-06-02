Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7943988F4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:07:41 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPeu-00021G-Ca
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loPdX-0001DH-CV; Wed, 02 Jun 2021 08:06:15 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:4259 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loPdR-0005Cg-N6; Wed, 02 Jun 2021 08:06:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWeDz0BjIkyDSKIOSAHKGPH8d10y9BS8xMD22yyX28HHL/rVtlB5afd1rHjn/4Z4NAF3LyCjnhD+95brSPXB3znAWYrEqn4Xfd8YvV7M05b5oC/wq890QpZt7cKrF88mEgqTgTLOMOcLxo+UpscPN5GCKEL8yN1cXWV+YMJsg3n2OwqL6js+6a9cBn8uCYCrDV4BrLd6Z2cERcjtMkxo6vW1aGijkPBnfit/EMehp80x56TJsaevscI+dKm5Wfg/sPMYso773FJsAmglJX2EnTMd1EHqrkOiqbrc5C5pBV95zCcnn2+RSACHG9f+6sB2bFcsXcmeWfs78gcm4OrfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjNP19nvNGs7nnpNSBeBIHkGF+HvVfP5/HBllhs2RiU=;
 b=KPYnWszWWH5CnrITUKBG6BSo8H91U3HgZ5m4vR6AqqoWxQdzlHm1DUD0qRQyj8QdwGVbnGP5BIZaPZ9OO4heuEtxfrqCG++LWwgQ8pO+ZzjcYYTi17YO86zajJSvxKML9hg3hSQrcK+q54rQ9mv8pTVOl2cJMG6+Ak7oK4pstdUy4JYHvlh69OxyK2n0R+DwMLj+xDRZcPHWEbcCg8+rYr+Rv7OFFzTzivARzoJBv8y/EwS28lQGAAcsllz6AB1M+KPlW1YZi/exbgFqAQGua4vT6nYh4YzRFyhNCQeAF1H80Ac/2lAq6lk2cILOIVB1cbtIG5eY/5R+AMq9NTZnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjNP19nvNGs7nnpNSBeBIHkGF+HvVfP5/HBllhs2RiU=;
 b=vwn3TROJ6NCBuuCnNr9Rz0T80SZKzNyJDfxsW20NWMhPAu1LVbfZuxKmAJD0RThsPwTk4oN/TS/7QIfLqH1UBt9H6XUn3HNKO/VfwB0/Qt5c0BqzSIWlb58/+IKw/ma9rfYUZy6d8umHaVJaDrkCFJfbxSmGfKf6YMW0PnYmDPI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 2 Jun
 2021 12:06:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 12:06:03 +0000
Subject: Re: [PATCH v2 2/2] nbd/server: Use drained block ops to quiesce the
 server
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Nir Soffer <nsoffer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210602060552.17433-1-slp@redhat.com>
 <20210602060552.17433-3-slp@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <631d21ed-52e7-9d9c-4692-ca3212fdbdd9@virtuozzo.com>
Date: Wed, 2 Jun 2021 15:06:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210602060552.17433-3-slp@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: AM0PR04CA0132.eurprd04.prod.outlook.com
 (2603:10a6:208:55::37) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.211) by
 AM0PR04CA0132.eurprd04.prod.outlook.com (2603:10a6:208:55::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 12:06:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0df328d6-2c57-48f7-87f4-08d925becb42
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-Microsoft-Antispam-PRVS: <AS8PR08MB621627548236288903346B92C13D9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VPDnMXtls79nkwyfzdMwNhQ6Zjtq31ha6AoIj6kx6VP7dS28QwrsrfbpKuhsbPBwVIgCMtOgPk5n/HlLSTlfnxVnm2gexZFskaXvNhFUctkd4+RXddNIpET13gXVes8e58Aigu9K2jV2C9QCs7a24lDAgGC9yF/DFwjZejmJqwz1iLAJ38GP4W+K//dGgdpc7xitKtfCm9arZzlT6upXRJSxwgVe/GFT4bbZAW1qjbB33fApBo6ky2tN8rXkgjX49jZA0zo+Qn5VZxAxJJbVhVlI/43x0nbY5KjK5JoTK5uVmLJepstC65CRFdCG7XO6mWsY4Fl/mqjhE16FgFaVVklGdkIIqjWSWi2D9253maVMdzTBB+cA9FXfyLqbpAxqPkpXR1sEKCEh9sn0zL7eMcLO8MDUmgBMILg4aIwO7kvSLmvR/AJMaErp5EyvW9+sdMXuYQcQAg6s6w6hJaoE0SaYXsbAyERk5T8D8mN7USpJB2Lb4Y4VUUxeyGnkrHxBghdLM1I3uZ1UEMUedyHGN6iQBq+8I6bux7oWeAJaMn6C9zLnltYLU7R0pSR5HRsVdxOczCFHMb0xGsLjbcpmui05Awil+XcsMLVcspbZrsocmLyam6xBBPiLFGOS8va6f9VbVn1+80V6gQi1HvKvinmuHV3D4P0LodTvDDszwpVITeOjpReeu3WJUTVDkizJFTQYb4w937Y30tYl/FfAkyPhGD+HWYG3Dw0bT5nKQDrqU2Y/O7rp48cpgDgVVL7ZsxSIi28yMOrOH+t3UDfLGw/W9r8ojSYAts18aYqjTyLQqFsSibV2Mu8bUWq2NiXBmKDzZDOHHTIP2tuCdaccXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(346002)(366004)(376002)(136003)(52116002)(31696002)(5660300002)(186003)(26005)(478600001)(31686004)(2906002)(8936002)(86362001)(8676002)(4326008)(54906003)(66476007)(6486002)(2616005)(66946007)(956004)(38100700002)(36756003)(83380400001)(38350700002)(16526019)(66556008)(966005)(16576012)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?REZMOVFkS3FNQWNIVHlTbFduSm1iWXpHcmpIdDJwUkh6M2hxTHVySDM0aE1i?=
 =?utf-8?B?N29kZjVSNER4b2x1czhGQXdTcERSdVVaRngwTDRJYVNjZFhjQm1IR3ZWa0ky?=
 =?utf-8?B?ekdTalE5VHAyQzkzSXR4ZllUM3RLNXpPSmlhQUVEOEdxWXZYNHFSTzNBMWRW?=
 =?utf-8?B?UWMwTCtVMWx0YVFDZ0I2OG1wN1NzbVJtcFdRSzhJdjduUllvcTN3NjFFcXdV?=
 =?utf-8?B?bUxnZ0ZnNXo1RnJNL3pJS0llVWFqTk1GUFNMQnN5YTlVWDlQNjJaM2NVM0ND?=
 =?utf-8?B?dlgyQ1Y3TmNYS3VDOGYwWm8rZU5jM2YrdFFuM0UyK2YrVXo4amRXbnk3S2tF?=
 =?utf-8?B?RVJENHQrMzBaRXBmVWZ1S0FZaHJiejgyVVRFd1RzU3d4Z2NjclpjeDJHSnhO?=
 =?utf-8?B?OVZyT3ZEdUhTck5DWFQ2WCtJb3B0NUVKVGhLQzlwZmNPZm5CUFAvNkprWHR6?=
 =?utf-8?B?TlBrSVc0L3lkSmtNYXlmTXorUlFzUzRZTERJMkxxdXBtLzZRZ2ViV2dDZ2hp?=
 =?utf-8?B?RlJpL0ZwVVBwV1I4dWg0WGpVcmdjZkdOYWl6QzNacHpWRW9VWkpIU1N5L011?=
 =?utf-8?B?enhmN0tmQkF2OEZIMHdNN05HWTZ2TzZGNUc4S2pyQzZ1bEZYZFR3WjhiUXl6?=
 =?utf-8?B?VUNaU1NLT25FZG9LeEloT1JCakZIUDRmZXUrMTVCKzJ3b05iNlVkdDlnNlZC?=
 =?utf-8?B?VDE3ZzRsSjE0eThIdDRmRUo0bnFSd0cyOFR0ZmMvSEpNUTA0NnJoaHFHbEM3?=
 =?utf-8?B?czJSY0ZJdG9UWG9TdSt5Y1NZT04yMjRxMTlKL2h5SUNCL0U2MW13NE5XYUVH?=
 =?utf-8?B?b2x2aGhaSkxMQ1pqNk5STWF2dWRxRVltOEI0TWkwZWZNQ1hvK0dLNjhMeHN0?=
 =?utf-8?B?cld1VEp5SENQQkRQUHcwSExQSTUxY0lkRzBPVmRsY2R4YUI3bzBoaXl1aUMx?=
 =?utf-8?B?L3NaT3BncEFtbXVSTG1DeFNnOXZtU1ppSjVia3RCOSs3SzIwS0RiWXB1Um1H?=
 =?utf-8?B?ckdJWWhQdjQrQWdQRDNVV3g5aHRRTFlOdUxvN0dUemY4azNDQkg5VnBkNExJ?=
 =?utf-8?B?SkZ5NWV5dDk2THN3dVloS1JQNml0R0ZLeEJmMVlmSDBlQkNjV2t6OHpYWmd2?=
 =?utf-8?B?SXFMNDhsdjRQc0xRaVpMQkdGQWlNaXd6SWNQYUJvYmp3WmU0VXlNZk5VSldw?=
 =?utf-8?B?Q1Q2SnhsamNiL041RkVlZ0VQMTBpcGNXVWJNQitwbElrbVE0ZFN0a2Z0dE5E?=
 =?utf-8?B?M2FXT0hsa05ZRk1vNGNPQlgvTFY1MEFhMVpMWTVMMWhPeTVzNFlPM1I0LzNJ?=
 =?utf-8?B?RnhwaDhXWG1jdEF6bWJlcjFkVUhuekhueWg1Y0l6RDhVazQ2ZkkrajR1NDNS?=
 =?utf-8?B?N0l4ZU9BK0x2bGVjMjY1TEp6R21FTjRCaTZOazg4Q1ZnTy82TUxCTndoMVBF?=
 =?utf-8?B?SXhIR3h3c0M1MjQ0Q0hmalVuZnR6clVzbkI4OGcyaDkwV0JZTWViSGFyc0FU?=
 =?utf-8?B?M2N2ejR3RElLbmpCRVVLYlgzbWNWY1BUUG0vRjN2dUtleDBkOTRZMEhtUUlF?=
 =?utf-8?B?K2wyNDNpaVVub2s5ZkpFdTBWb2I2N2x4RTlRWGJCcG1MVzMxVmdCK2cwTWN2?=
 =?utf-8?B?V0xyVkhVTTVuZ2dNRE11aXZtMGR6T1ZHQm1FSW9jR1ZNUXVwN0pQbldoZjhh?=
 =?utf-8?B?ZjVEeDNZVllOckgzVE53d1BBL1NHMEk4Z3p1eWk2eVRXdzMveStNWE1XOE9C?=
 =?utf-8?Q?yzkRZky9jqbxlDFks8yWY7wP3Ty7C5vkM8UWCbB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df328d6-2c57-48f7-87f4-08d925becb42
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 12:06:03.4601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UycyfvC2uIqsBDl2PCby7O8WfbxqvEXB9ExoZ7sRI3mTpA1nYWlrQZ5XUGGjOEIBVXbixFMTjmutXsaAbKSmYWMhgZr4qlcJITDaqdsnZRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.6.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

02.06.2021 09:05, Sergio Lopez wrote:
> Before switching between AioContexts we need to make sure that we're
> fully quiesced ("nb_requests == 0" for every client) when entering the
> drained section.
> 
> To do this, we set "quiescing = true" for every client on
> ".drained_begin" to prevent new coroutines from being created, and
> check if "nb_requests == 0" on ".drained_poll". Finally, once we're
> exiting the drained section, on ".drained_end" we set "quiescing =
> false" and call "nbd_client_receive_next_request()" to resume the
> processing of new requests.
> 
> With these changes, "blk_aio_attach()" and "blk_aio_detach()" can be
> reverted to be as simple as they were before f148ae7d36.
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1960137
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>   nbd/server.c | 82 ++++++++++++++++++++++++++++++++++++++--------------
>   1 file changed, 61 insertions(+), 21 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index 86a44a9b41..b60ebc3ab6 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -1513,6 +1513,11 @@ static void nbd_request_put(NBDRequestData *req)
>       g_free(req);
>   
>       client->nb_requests--;
> +
> +    if (client->quiescing && client->nb_requests == 0) {
> +        aio_wait_kick();
> +    }
> +
>       nbd_client_receive_next_request(client);
>   
>       nbd_client_put(client);
> @@ -1530,49 +1535,68 @@ static void blk_aio_attached(AioContext *ctx, void *opaque)
>       QTAILQ_FOREACH(client, &exp->clients, next) {
>           qio_channel_attach_aio_context(client->ioc, ctx);
>   
> +        assert(client->nb_requests == 0);
>           assert(client->recv_coroutine == NULL);
>           assert(client->send_coroutine == NULL);
> -
> -        if (client->quiescing) {
> -            client->quiescing = false;
> -            nbd_client_receive_next_request(client);
> -        }
>       }
>   }
>   
> -static void nbd_aio_detach_bh(void *opaque)
> +static void blk_aio_detach(void *opaque)
>   {
>       NBDExport *exp = opaque;
>       NBDClient *client;
>   
> +    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
> +
>       QTAILQ_FOREACH(client, &exp->clients, next) {
>           qio_channel_detach_aio_context(client->ioc);
> +    }
> +
> +    exp->common.ctx = NULL;
> +}
> +
> +static void nbd_drained_begin(void *opaque)
> +{
> +    NBDExport *exp = opaque;
> +    NBDClient *client;
> +
> +    QTAILQ_FOREACH(client, &exp->clients, next) {
>           client->quiescing = true;
> +    }
> +}
>   
> -        if (client->recv_coroutine) {
> -            if (client->read_yielding) {
> -                qemu_aio_coroutine_enter(exp->common.ctx,
> -                                         client->recv_coroutine);
> -            } else {
> -                AIO_WAIT_WHILE(exp->common.ctx, client->recv_coroutine != NULL);
> -            }
> -        }
> +static void nbd_drained_end(void *opaque)
> +{
> +    NBDExport *exp = opaque;
> +    NBDClient *client;
>   
> -        if (client->send_coroutine) {
> -            AIO_WAIT_WHILE(exp->common.ctx, client->send_coroutine != NULL);
> -        }
> +    QTAILQ_FOREACH(client, &exp->clients, next) {
> +        client->quiescing = false;
> +        nbd_client_receive_next_request(client);
>       }
>   }
>   
> -static void blk_aio_detach(void *opaque)
> +static bool nbd_drained_poll(void *opaque)
>   {
>       NBDExport *exp = opaque;
> +    NBDClient *client;
>   
> -    trace_nbd_blk_aio_detach(exp->name, exp->common.ctx);
> +    QTAILQ_FOREACH(client, &exp->clients, next) {
> +        if (client->nb_requests != 0) {
> +            /*
> +             * If there's a coroutine waiting for a request on nbd_read_eof()
> +             * enter it here so we don't depend on the client to wake it up.
> +             */
> +            if (client->recv_coroutine != NULL && client->read_yielding) {
> +                qemu_aio_coroutine_enter(exp->common.ctx,
> +                                         client->recv_coroutine);
> +            }
>   
> -    aio_wait_bh_oneshot(exp->common.ctx, nbd_aio_detach_bh, exp);
> +            return true;
> +        }
> +    }
>   
> -    exp->common.ctx = NULL;
> +    return false;
>   }
>   
>   static void nbd_eject_notifier(Notifier *n, void *data)
> @@ -1594,6 +1618,12 @@ void nbd_export_set_on_eject_blk(BlockExport *exp, BlockBackend *blk)
>       blk_add_remove_bs_notifier(blk, &nbd_exp->eject_notifier);
>   }
>   
> +static const BlockDevOps nbd_block_ops = {
> +    .drained_begin = nbd_drained_begin,
> +    .drained_end = nbd_drained_end,
> +    .drained_poll = nbd_drained_poll,
> +};
> +
>   static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
>                                Error **errp)
>   {
> @@ -1715,8 +1745,17 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
>   
>       exp->allocation_depth = arg->allocation_depth;
>   
> +    /*
> +     * We need to inhibit request queuing in the block layer to ensure we can
> +     * be properly quiesced when entering a drained section, as our coroutines
> +     * servicing pending requests might enter blk_pread().
> +     */

Not very understandable to me :(. What's bad in queuing requests at blk layer during drained section?

> +    blk_set_disable_request_queuing(blk, true);
> +
>       blk_add_aio_context_notifier(blk, blk_aio_attached, blk_aio_detach, exp);
>   
> +    blk_set_dev_ops(blk, &nbd_block_ops, exp);
> +
>       QTAILQ_INSERT_TAIL(&exports, exp, next);
>   
>       return 0;
> @@ -1788,6 +1827,7 @@ static void nbd_export_delete(BlockExport *blk_exp)
>           }
>           blk_remove_aio_context_notifier(exp->common.blk, blk_aio_attached,
>                                           blk_aio_detach, exp);
> +        blk_set_disable_request_queuing(exp->common.blk, false);
>       }
>   
>       for (i = 0; i < exp->nr_export_bitmaps; i++) {
> 

I don't follow the whole logic of clients quiescing, but overall looks good to me. As I understand, prior to patch we have a kind of drain_begin realization in blk_aio_detach handler, and after patch we instead utilize generic code of drained sections with help of appropriate devops handlers.

weak:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

