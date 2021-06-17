Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774063ABBE8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:34:02 +0200 (CEST)
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwq1-0000Ak-9Y
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ltwoG-0007jg-DN; Thu, 17 Jun 2021 14:32:12 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:16032 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ltwoD-00063c-9S; Thu, 17 Jun 2021 14:32:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntu32pMgGrXExKyDFGPuEDqGe671HOMyWNZME7UagkXOnnV5XUrzTxul/Mszu6jXIJ6HzLscMIPe2LeBH/aaNaex51yamaVf/+K+R67SzoVfkSxT2Cwh/PKuSamM+cta7skS2zu6KPaCZ7/lEdY0TJN+P4FURWSG/CPkG0Ty1KzFy6PtzbVAu2uagphn6h2jgSFTklOG42LKifnefIE2dMCFZB8VLk2rd6SVRHPn8/2k+k9K4a6xOMQR5fAeWun6N7Mx9YzF26WZQo6NlApSXMkfig1oBYB8a7JCRe6j43GiAE9nzL0QDmTPdgmp5jkri2biODEmQ2w32NMAe68dDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH8o6G4ZtmKQ+iC5+vSbgxMHBNw5IBtkXG6IYtfmiKU=;
 b=XmYtYkuiRAV9jtc9m7m1whRDgVu9gk7hkydQgPhucXr/VxHPMgFD1EP4vnpXAjkB1owLYL7y6qwvSP4CUVleFBp7z/3dE5oXw9Yu0ehJsgGLwRvgGerOZV0Z6vsi+/Tkthu2alAP2B24V7uy1KUxp8L693v4Khgkg3tHD6FQ8ta6BlNAzbb4+4JG4rxYSIBOtroXoq6oMFidfxOfBsOzJ5pek0LcheS5htZ3GtK1rDfoUu9ca+iREfyzFxlGzridgcHZw0EqLg4+quNuRXVeO3WPvSb+sflYwlpQfVfZW8LOR3fln79Ku9phijt6+KNo9MOxV19BycZmBoG5WG1Kaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH8o6G4ZtmKQ+iC5+vSbgxMHBNw5IBtkXG6IYtfmiKU=;
 b=K6AGBFjJzVffv2bvKm2APWymKqQhcBPlQel2J7eiPNYnjiwJh47wx4Ho/mZ08TWJgJh//jlf7sSjdA9zQhROryR3ZQgURR9g9sBP+F42HD1NVYvCQcVhnLzsJhl0Qm52KEAOe9xEOj/0wTraEAI1xjuTi1oL0JTJnkeFct3tIKA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1906.eurprd08.prod.outlook.com (2603:10a6:203:48::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 18:32:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 18:32:03 +0000
Subject: Re: [PULL 28/34] nbd/client-connection: return only one io channel
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
References: <20210615204756.281505-1-eblake@redhat.com>
 <20210615204756.281505-29-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4a756fb6-fb78-7420-482d-a529480bb3f2@virtuozzo.com>
Date: Thu, 17 Jun 2021 21:32:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210615204756.281505-29-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Thu, 17 Jun 2021 18:32:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fda88d11-cf63-4ea7-07ec-08d931be3416
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1906:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19066585418AE94EE5C5D06DC10E9@AM5PR0801MB1906.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Y/MLN5nskBJIkZirEKhObzpJo2zUREDb2V/ViXH2iSikWqM531Mm7Aftrgtt7d33ExbcqV/1j52pS0D+HJPsgAwyQUiKSxEtdPbKtbZpQPLf58MKtiGRESi6f91goaM1pNHcwDmqVSfbIu6XGhTDy+Mp1oP/Jb45ZYS5Sa0AXSNFEW+nr3NZNjsZZBCAEiVGjOoKaF5ZmP8muwy4M560Ze+Q94sP30jkfl5+kECglX6R9sxIUalNZ6NgEsEvSiy+4IMF8NwGzNCcfuxlyrc3NOMQu4rzgoT8Nay1QbuZh3x8GMHpt4+NaS4hI6I59+CUlMdStU5ChW0h+/K0zU4UC1r1oX5ClczcmaV04VV8PI2hPdqq4cIcR48z47dql0R1IwHZf8MVR3DIK11Ci0FCywT5WJApIAtvhoTGr2hV/eygZkGuV020xt7b/gVOPHmEHzUPlhftyEBEC1NMJyju8oq7ByYsWwHBoEhHw4PQ8ExTv2KZLK26yQP14dwn6wzS80V0+l53u/q6z/9sYaRjz47zVtWipWxHA0dv/umMaR5MytACVNFyi7gVQlqw5oEy4Tr85rD2bZ+m2psNV+jMVtSTi/A5Z/OAFfTSTjIHQtSstMxhAzerpvAZ21N6/VQLi4KzJf2maK+6MGAY3JMAbEBLMAfVQaNpRteP/fiftMlEudo7LrVrerk3C68Wmo2AdsksO3kEuTFxOYxo2iD+zVDoUlQ3ehLGGaIKmtCxes=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39840400004)(366004)(66476007)(66556008)(66946007)(8936002)(956004)(31686004)(4326008)(38350700002)(86362001)(38100700002)(8676002)(5660300002)(478600001)(2906002)(316002)(16526019)(54906003)(31696002)(52116002)(83380400001)(6486002)(186003)(26005)(16576012)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkNGRHRDRnpoNWdUUUdLZjlDMkJjT0ZKZWxMbUE2ZVpBbVZMWnUydncyZVhV?=
 =?utf-8?B?eExPdWFaUG9vNUQxeDcrSktrUHFBRFBLbnZZMllMb2lXU3lXMFpKb3Rtb3hl?=
 =?utf-8?B?ZWxuUDdIRHpYM1N3QzJqajVndFFHNmRZdUdYcG0ySk9QQXd5bEdzVUd4bnVz?=
 =?utf-8?B?em85cndsRnlkQ3hFY1BLWE1TQkp6enRJVmM2cGw1TVZPQlBCLzlKbXJBbmtZ?=
 =?utf-8?B?RmVZaThzeFp1UXk2RXBQcFRrRjlWeWtyVjBOSWU5cldnWUd3bU55ZGhXNVdt?=
 =?utf-8?B?Z1lWRzE5LzZzaHIzYkdwK3lYQWJkS2t1WjBra0lCVkxIUFNyTXFuSWdnQ1hr?=
 =?utf-8?B?WmkrNktteEhQbEJqNWNPWG5kTG01cDBSTlZ2dGxrejYvVXNXQ05Ea3pDbGhF?=
 =?utf-8?B?T3RzOEV3dmlnaERiSC9xWGNuY295VUxXRXJHWUpLU2xiZnY3amFRdlpuWGtn?=
 =?utf-8?B?MzNTaS83SzVCbFVzU0g2ZGFmb2pBTldzTFlIRTdtUHRaU0ozQksvT1k5blAy?=
 =?utf-8?B?REFqMEFhbHZTT3FHd0lLczY3ZW9ieGJJNTRtS3pCS2dkNnlhYTlNc0h0UGFq?=
 =?utf-8?B?Z0MxQXo1bFEzRVcxaEI1Uzl3TWJDZ0JwU0ZuWFd5bFhqME1JeWFDZUFCbW05?=
 =?utf-8?B?Tk84Ui80eSswTzRqRjBQQVU1UHhyNmgrdnNWeFVSeDN2WkRhUEdsTmdaUlRx?=
 =?utf-8?B?YlVNd0ZtQUdhM1FnVTFheU9aTDN6RWNlcm5rS3gwckVLdDJBZ21ZdFVUWmNk?=
 =?utf-8?B?RXdGcGFNeWJ2MHprd29DajF6eTdLQ2wrcm5vbFZka0tKeDkySm9FRXQwb3FI?=
 =?utf-8?B?dWNNTXJBUkU3a3Uzb3hhOWdDSGhFZHpCaFVkbHVuRVArSmZZWEdOSUp4WkxV?=
 =?utf-8?B?RE9reW9MUEJRNUNVOWdmelljYkhEcndpeGdzVjRhSVRRMmh0UVZXM1luNWRB?=
 =?utf-8?B?eXJ3ekN2RmJURGVKQzlHZ25PdktWaWNCTkQ1N2VUcURXdFZ5MWRQaGpxZ0Rx?=
 =?utf-8?B?T0V4NUlpM05YRFlsVE1tTGxURGlVajdYVDhUNW5PdjdwY3FHQzZ6QWVrZVdW?=
 =?utf-8?B?TUJYbGVuMXNpQ1llK2wvN2hHU3lVSm0yK1g5QmNkS2FEWEREYjQzL0Y4cnB5?=
 =?utf-8?B?Sm1XbXlXcEhJdmtBU3pIVTJCclVBU3pEbllCbWVXdEdFZ2tzTjJHU0RzUllx?=
 =?utf-8?B?QU9QOUl5MkxTdDhwTFd0L0p1MWk3b3RadHZNTzlJRTR6dkozWXNMbW5UUXRR?=
 =?utf-8?B?Q2JHL3VwRFlocXhHbkpEVWN6NXhDRU1HMGhGOWNFQUt2dzQvS3NMNXVnNUtq?=
 =?utf-8?B?dWxDY2YvQnFvanJxUWJWbFNDWm1VRDdQaGdBM045ejJERWorN3dINUplNTBC?=
 =?utf-8?B?RU93U2gvTDllbzl5dXkrTWhyVmJ6UXFiYkhSdE9ubkVlU0tab0lRbi9SVWhr?=
 =?utf-8?B?ZGJOUnM1TmwzYmowbXJ3d29nekJvMFVHKzE0U1ZsOEQ4UktITVBDUW9aTkR6?=
 =?utf-8?B?VVFhLyt2aDdaaHEyVXFsUisxSEsydTNxc05lVERYWHJqR1RxQnE4Mmh3N1pC?=
 =?utf-8?B?U0ptQ1hVeXNOaVZHNmlrK1p0S1VwSUlabTNnbWlrQWs5YnluWVo5MXpIM1Vn?=
 =?utf-8?B?UitIMENhZXdGTktOeUNnUjljeEJvNXZMSnRyREExTlppN3RqdWlZVWg3dHRH?=
 =?utf-8?B?SDNpUFpQTmRucVpVN2JQWTUwZzBKOHlteis2TEpVNlJWckc0UkV2eldDalFI?=
 =?utf-8?Q?6TBRiu1+5FhVPesSsYmyzvsji21GMeIvx+ubKpB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda88d11-cf63-4ea7-07ec-08d931be3416
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 18:32:03.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5DwUF9hH0+qVdWvDBwCQZKG5p6G+KjtRC/cvgrjPmeo23kvZ4okyPxLtlm9aBVJZjBtf3SYjehH7g2LR5e8vTRY4gcGM7kNB+887+r1RUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1906
Received-SPF: pass client-ip=40.107.21.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7,
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

15.06.2021 23:47, Eric Blake wrote:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> block/nbd doesn't need underlying sioc channel anymore. So, we can
> update nbd/client-connection interface to return only one top-most io
> channel, which is more straight forward.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Message-Id: <20210610100802.5888-27-vsementsov@virtuozzo.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   include/block/nbd.h     |  4 ++--
>   block/nbd.c             | 13 ++-----------
>   nbd/client-connection.c | 33 +++++++++++++++++++++++++--------
>   3 files changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 5bb54d831c8a..10c8a0bcca80 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -418,9 +418,9 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>                                                  QCryptoTLSCreds *tlscreds);
>   void nbd_client_connection_release(NBDClientConnection *conn);
> 
> -QIOChannelSocket *coroutine_fn
> +QIOChannel *coroutine_fn
>   nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
> -                            QIOChannel **ioc, Error **errp);
> +                            Error **errp);
> 
>   void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 9f193d130bcd..411435c1559e 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -360,7 +360,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>   {
>       int ret;
>       AioContext *aio_context = bdrv_get_aio_context(s->bs);
> -    QIOChannelSocket *sioc;
> 
>       if (!nbd_client_connecting(s)) {
>           return;
> @@ -399,20 +398,12 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>           s->ioc = NULL;
>       }
> 
> -    sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
> -    if (!sioc) {
> +    s->ioc = nbd_co_establish_connection(s->conn, &s->info, NULL);
> +    if (!s->ioc) {
>           ret = -ECONNREFUSED;
>           goto out;
>       }
> 
> -    if (s->ioc) {
> -        /* sioc is referenced by s->ioc */
> -        object_unref(OBJECT(sioc));
> -    } else {
> -        s->ioc = QIO_CHANNEL(sioc);
> -    }
> -    sioc = NULL;
> -
>       qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
>       qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
> 
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 883f9cf158cb..72138a5ff74a 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -272,15 +272,15 @@ void nbd_client_connection_release(NBDClientConnection *conn)
>    * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
>    * include/block/nbd.h).
>    */
> -QIOChannelSocket *coroutine_fn
> +QIOChannel *coroutine_fn
>   nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
> -                            QIOChannel **ioc, Error **errp)
> +                            Error **errp)
>   {
> +    QIOChannel *ioc;
>       QemuThread thread;
> 
>       if (conn->do_negotiation) {
>           assert(info);
> -        assert(ioc);
>       }
> 
>       WITH_QEMU_LOCK_GUARD(&conn->mutex) {
> @@ -294,10 +294,17 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>               if (conn->sioc) {
>                   /* Previous attempt finally succeeded in background */
>                   if (conn->do_negotiation) {
> -                    *ioc = g_steal_pointer(&conn->ioc);
> +                    ioc = g_steal_pointer(&conn->ioc);
>                       memcpy(info, &conn->updated_info, sizeof(*info));
>                   }
> -                return g_steal_pointer(&conn->sioc);
> +                if (ioc) {
> +                    /* TLS channel now has own reference to parent */
> +                    object_unref(OBJECT(conn->sioc));
> +                } else {
> +                    ioc = QIO_CHANNEL(conn->sioc);
> +                }
> +                conn->sioc = NULL;
> +                return ioc;
>               }
> 
>               conn->running = true;
> @@ -329,11 +336,21 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>           } else {
>               error_propagate(errp, conn->err);
>               conn->err = NULL;
> -            if (conn->sioc && conn->do_negotiation) {
> -                *ioc = g_steal_pointer(&conn->ioc);
> +            if (!conn->sioc) {
> +                return NULL;
> +            }
> +            if (conn->do_negotiation) {
> +                ioc = g_steal_pointer(&conn->ioc);
>                   memcpy(info, &conn->updated_info, sizeof(*info));
>               }
> -            return g_steal_pointer(&conn->sioc);
> +            if (ioc) {
> +                /* TLS channel now has own reference to parent */
> +                object_unref(OBJECT(conn->sioc));
> +            } else {
> +                ioc = QIO_CHANNEL(conn->sioc);
> +            }
> +            conn->sioc = NULL;
> +            return ioc;
>           }
>       }
> 

Logic is wrong and uninitialized use of ioc really possible, as Peter (and clang) reports.

So, I propose the following squash-in. It doesn't conflict with following patches.

squash-in:

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 500b8591e8..396d7f17f0 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -275,7 +275,6 @@ QIOChannel *coroutine_fn
  nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
                              Error **errp)
  {
-    QIOChannel *ioc;
      QemuThread thread;
  
      if (conn->do_negotiation) {
@@ -293,17 +292,19 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
              if (conn->sioc) {
                  /* Previous attempt finally succeeded in background */
                  if (conn->do_negotiation) {
-                    ioc = g_steal_pointer(&conn->ioc);
                      memcpy(info, &conn->updated_info, sizeof(*info));
+                    if (conn->ioc) {
+                        /* TLS channel now has own reference to parent */
+                        object_unref(OBJECT(conn->sioc));
+                        conn->sioc = NULL;
+
+                        return g_steal_pointer(&conn->ioc);
+                    }
                  }
-                if (ioc) {
-                    /* TLS channel now has own reference to parent */
-                    object_unref(OBJECT(conn->sioc));
-                } else {
-                    ioc = QIO_CHANNEL(conn->sioc);
-                }
-                conn->sioc = NULL;
-                return ioc;
+
+                assert(!conn->ioc);
+
+                return QIO_CHANNEL(g_steal_pointer(&conn->sioc));
              }
  
              conn->running = true;
@@ -339,17 +340,19 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
                  return NULL;
              }
              if (conn->do_negotiation) {
-                ioc = g_steal_pointer(&conn->ioc);
                  memcpy(info, &conn->updated_info, sizeof(*info));
+                if (conn->ioc) {
+                    /* TLS channel now has own reference to parent */
+                    object_unref(OBJECT(conn->sioc));
+                    conn->sioc = NULL;
+
+                    return g_steal_pointer(&conn->ioc);
+                }
              }
-            if (ioc) {
-                /* TLS channel now has own reference to parent */
-                object_unref(OBJECT(conn->sioc));
-            } else {
-                ioc = QIO_CHANNEL(conn->sioc);
-            }
-            conn->sioc = NULL;
-            return ioc;
+
+            assert(!conn->ioc);
+
+            return QIO_CHANNEL(g_steal_pointer(&conn->sioc));
          }
      }
  




-- 
Best regards,
Vladimir

