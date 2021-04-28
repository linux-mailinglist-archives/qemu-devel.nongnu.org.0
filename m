Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF336D3C3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 10:16:25 +0200 (CEST)
Received: from localhost ([::1]:39046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbfMt-0006YI-S7
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 04:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbfLY-000679-1E; Wed, 28 Apr 2021 04:15:00 -0400
Received: from mail-db8eur05on2126.outbound.protection.outlook.com
 ([40.107.20.126]:44513 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbfLR-0006qp-Jw; Wed, 28 Apr 2021 04:14:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRBv66hnf0q9I0fg+wU2i3LTrwJKva3PUJJAiW7AUhvHDTd3UTqaeQVI6pOGq3AzlqoiE/rRjgtaTREVSfttLN4+coHA23Nwq10HI9KmeNMLMy1rr4gzujV9InDxTH3NodDahlitbztPblGY4y2eAg3iRsQwjpo14jX2Mr0PzDmUnw3ogVXTV2J3bz034YHUCaPKvb2jNBIkKZfIpaCopqkSM5GR20ky/F9LenD89G5iK1Sh9pTfdwfuNS57UNTwu/OfLXOt/sQCaoXVGnORxvEZRd45seVbK97JpFFtcgz+h442Yav/7+lPWvaTiwrxXm669boR7KuwOL/2djkh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ7dtrjnlFVQNq+cH4BAdC6PJ+GyEfAm+OW7Vhq5HLY=;
 b=DARrLTw+anLOdqH1cuvCkKWGHLhI/Mfm4rWQeUqwO74384KQ0rhuFhxPH+tOVprhQ21b68BZ0szf/B5VJuP5eVlFqHkDutQPnOt5+G34USHwUJ4QBA0Ph09lAmOc2ylJ/+pEVr5rsbJR8qnonBOwhyd9iVF0h4p1e5keKkgMoHjFCeLwVkrQLn03ps3JFoJZLjcuiTKd3D0V9bKk5kNORbSSowKOb1AoUH6FfMSS/sQRdHUNQg12ru1vtuza4YWEfSrMDqx0NUfD986kAoCVqQovbmr2C2JnRoyPKJlPuRi+dQ7NT+nCbK4FxdxwVLFSLDzQOtMA/oo9glL923obFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ7dtrjnlFVQNq+cH4BAdC6PJ+GyEfAm+OW7Vhq5HLY=;
 b=WvdQyb2KYCPThZOpkCZwpnJ3233efI1Mu4WJ5quTFFruxQl9DGjtEfkh0PxF8hAfFqx9dDSwJZ64OpYEiO2xCMBLC8fSsiA/ivG94V6gME4g7esoJfJOz+emF2+0Mpb7cF7uHVumiHHtEBhPdrBTWUGAyZ6jfE+3cAXHRuaJ6zM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 08:14:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 08:14:47 +0000
Subject: Re: [PATCH v3 14/33] nbd: move connection code from block/nbd to
 nbd/client-connection
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-15-vsementsov@virtuozzo.com>
 <YIiUH3m0GYUajo5P@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <84aaa2dc-7a86-c540-fd82-6729d568cd50@virtuozzo.com>
Date: Wed, 28 Apr 2021 11:14:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIiUH3m0GYUajo5P@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR1P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR1P264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Wed, 28 Apr 2021 08:14:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a825a8e-596d-45c0-f966-08d90a1db020
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38615C4D1BFE4E46DA1582D7C1409@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeoLGWsUhGyLWuzE45YTtA6B0LBLHXAw6dz9BImrLVVBBFez4U87BoRIm+LKtssdX9B6+zTt2hanK1fQjp5AjR8sbwWZjmoqn+MeZwinobxqSwfE/C/IjJamYIw8EwCsK6rgV6NsJEJAQ/fDv2GfV08zKbF2N775pWhPvmLg8NljxGfpVCLviqvUC8nbtzHqcKKTN8emE+Fzijvm/gFpEHX1X9ABbcMrX1ypsiGki3afs7N/9LNqCfXTQkiqgvsIvTeJW5576Ci326ptV0aJAPdn/YX2XkSp5zZP2IksKXg8gJzRPm8gbdnHMyw66KGsPDoO2WIvIi3yVuE3882exz07Ik0lkoXej12Ve9ADHAdAT6DL6KPjxKyEnutBvKrRBf2Bd7yb+Ddfq3YT5jY0Y+J3E5Uivowf5ZvgTVuCtRgiJTJGRWvDSNyQclSyC5NIjP+PKE4AMLZtyMVc0/8ljHegDbTTC64kW5Uwi16LZlYoe54Y+a4pYOBNO8GKGWTUYL7mUMpcODyFcN6xa7xAZvGQ0DCVfjHCWyYORCgIuu7+lV5qWrYM/VrSsflaCEdlz9N+wdz6cIJ0xaAmQPvSGVNqvQQFk0iB33YRDAFHorTFvxtavD+fba3I0cVKA6DSvat6UGESAPFYXAaOzmQ3G2KSBw3txh/Rp0ENBWeO2YZziaWOftzH2fpZQecUR6ILKlpGknbxt2g3ArCbdInACEXUWfEzDQjfxYQj1avabrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(366004)(396003)(136003)(376002)(346002)(8936002)(66946007)(66476007)(66556008)(8676002)(38100700002)(86362001)(956004)(6486002)(2616005)(31696002)(38350700002)(52116002)(16576012)(36756003)(478600001)(316002)(2906002)(5660300002)(186003)(26005)(30864003)(83380400001)(31686004)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SlpINGlsdlR2ZVJWTE5jWkRtaGo2RWx4RlUzTTlGbW9oQ0xNeVpCZDJUdy9k?=
 =?utf-8?B?SkdpUG4wb1h2UjBTZ2tvUGFXUENsUTRlbXVhY3VlbStUcXd4eXVXaTBZemJH?=
 =?utf-8?B?dFM5Q09ITi83NXZ4bVNDNjg1MFFhSU5RUVVxTm0rR0E3cXZERlpUZTdEbjhs?=
 =?utf-8?B?Rmp3ZHpBRlhPaXlIa3pOUGN2Ry9tMGxrZEROano2M21DbzJ2L0I4L2dxM1ZI?=
 =?utf-8?B?aFpMYWpCcUVtdUxkTTQzQS9iRmRnSDNxelhkN0RNNHd1RzFvRW03TUJacHRS?=
 =?utf-8?B?MklZeWMvS0V6S29KdG1IdWtFWkR1VmplMk5TMXlqMytoSjc0ejlSQXpSa0h5?=
 =?utf-8?B?cGJNMFdrNEFrenZCb3VFMDhjaDJCcEV5ZWd2eGlyMk5hcUhZRkhtMDlDUlNV?=
 =?utf-8?B?T3hMN1p0aVl6RUQ3bDRlVVVsYVNMSVkvM2QzRGY1aFU2KzBNazRkdVZ6cmtX?=
 =?utf-8?B?aC9rSjk2a1NrVnhQckdTZXZuU21rbWNoVEFNeUpzWW8zYy91ZDRVZ0EybEV4?=
 =?utf-8?B?MWFVSXlpNXI3NG4zVEtiQXc1NmNobHgwUm5tR3RjNHBERjAvTjV5azVDN0py?=
 =?utf-8?B?cW1OaDdvVCtXd3U1WkVLRHNzQmoyTXhRZlNhcDdpMG16VkZUUDZEUzBxNEhh?=
 =?utf-8?B?UEVMUmw5QlVyNnlqNnNwZ0IvOGc2UUd1Vkg0bVZ6T1JPSW4rZmFzZFp4NXZx?=
 =?utf-8?B?amZ2THhpMTdkVmtTZjJWdnVUdkhXTUE2djhBaml3T1lRbExBTjFKR01nalE1?=
 =?utf-8?B?QjZzT0xUWkJNcWR2ZHdrQ2p6MHJaTzFBMzNiWU1tazc0cnFqQWdEQXpuSmhS?=
 =?utf-8?B?SDB2QUtJM3Ryck02YytDdHBybWRXMS9CTHpPRlpENkd3Nmt2enBLdXUxYnJK?=
 =?utf-8?B?RDRkY2dTOU5tMzZaR09aSFErYXV5WkRSZVkzSEYwcFg3S0xsYmJXME1STWQy?=
 =?utf-8?B?QWhHckRJSEVnYmVjK0dBOVVrZnJWM3RoTWEzQmNnQ1kyb0NKWDArQkxleGFO?=
 =?utf-8?B?cFBIZCthYlh0SG9BQ2RDOHdOcWNnMGo2eXVnZDRiblpJWTFZbUorbmxOVngy?=
 =?utf-8?B?Sko2cVl1NUhsZjdtNy9ocWNJT2dvZjBDNXgwUWdMemFxTWZTQlRXVzBOYndD?=
 =?utf-8?B?Rk9IZkRScDhaVFZuWnV4ZVI3d0VYd24xUUJiV3RjNlRVMU5iNWtHcnVoSkpL?=
 =?utf-8?B?aGJaT08yOU54RWloMm1UMVJlUkxzVmxBZUw4RzdTM3NrSTN1dURGM25OTFg0?=
 =?utf-8?B?cDFRSFZubWZZNWZ5ZGdWSkdTanQ3QlFKY25zS2t3VmwvaVdEU3pwQ1NVR3Fr?=
 =?utf-8?B?amcwUVAyOEY1c1NmUy9CUUdaT3ZPWFlNMzV0T2ZEby94NUdzVkJWV01yUVRE?=
 =?utf-8?B?OGlsWlcra0lvR212QTFJUzFodytaRWRCak1BNndSTEJ2SDh5NDlaZFQxRUJa?=
 =?utf-8?B?NXE0ZXVTdzBhSWtTbGFqZmpZenZnZmVBTE15M3JrV1JVdnl3L0JTQVhxeXlm?=
 =?utf-8?B?TXZ5OEdtYkptekZhOXYxZGIycTI2UWZaZmZVKzQ1L0FSM2ZTWFlRUE5UN0tM?=
 =?utf-8?B?STRaVHF4VWN5MjZxN0NySFJrUWViT0ZTLzBxaWlmRGYxQnJPSzU4R3YwVUY4?=
 =?utf-8?B?MTBtU1VIb3RYN0FQd1ZHcjhKR3o3WFRuZFdUclVjT1YzZkpXdjlSa2VQVnBp?=
 =?utf-8?B?U2oxMGdDTDhrOS9Fam9QTkNUN1U4b01idDF2Njg1ZDFSVGF5K0k2MUpXRWNT?=
 =?utf-8?Q?5jQOiK0Gco27MWbpFg0s0wbTXHv1rdx0Y0oJ5Cf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a825a8e-596d-45c0-f966-08d90a1db020
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 08:14:47.6763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV/xw/NR2qLXNdxDX55d+VM1BUIsdh7FyJBRCDSETFpk0hhVzxmevwhjGkfVcRr6+tNKsVWkOBnQiNrdcG9Ke4zBZ3+ATWaNpoIGGsaKYuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.20.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

28.04.2021 01:45, Roman Kagan wrote:
> On Fri, Apr 16, 2021 at 11:08:52AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We now have bs-independent connection API, which consists of four
>> functions:
>>
>>    nbd_client_connection_new()
>>    nbd_client_connection_unref()
>>    nbd_co_establish_connection()
>>    nbd_co_establish_connection_cancel()
>>
>> Move them to a separate file together with NBDClientConnection
>> structure which becomes private to the new API.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/nbd.h     |  11 +++
>>   block/nbd.c             | 187 -----------------------------------
>>   nbd/client-connection.c | 212 ++++++++++++++++++++++++++++++++++++++++
>>   nbd/meson.build         |   1 +
>>   4 files changed, 224 insertions(+), 187 deletions(-)
>>   create mode 100644 nbd/client-connection.c
>>
>> diff --git a/include/block/nbd.h b/include/block/nbd.h
>> index 5f34d23bb0..57381be76f 100644
>> --- a/include/block/nbd.h
>> +++ b/include/block/nbd.h
>> @@ -406,4 +406,15 @@ const char *nbd_info_lookup(uint16_t info);
>>   const char *nbd_cmd_lookup(uint16_t info);
>>   const char *nbd_err_lookup(int err);
>>   
>> +/* nbd/client-connection.c */
>> +typedef struct NBDClientConnection NBDClientConnection;
>> +
>> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
>> +void nbd_client_connection_release(NBDClientConnection *conn);
>> +
>> +QIOChannelSocket *coroutine_fn
>> +nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
>> +
>> +void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
>> +
>>   #endif
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 8531d019b2..9bd68dcf10 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -66,24 +66,6 @@ typedef enum NBDClientState {
>>       NBD_CLIENT_QUIT
>>   } NBDClientState;
>>   
>> -typedef struct NBDClientConnection {
>> -    /* Initialization constants */
>> -    SocketAddress *saddr; /* address to connect to */
>> -
>> -    /*
>> -     * Result of last attempt. Valid in FAIL and SUCCESS states.
>> -     * If you want to steal error, don't forget to set pointer to NULL.
>> -     */
>> -    QIOChannelSocket *sioc;
>> -    Error *err;
>> -
>> -    QemuMutex mutex;
>> -    /* All further fields are protected by mutex */
>> -    bool running; /* thread is running now */
>> -    bool detached; /* thread is detached and should cleanup the state */
>> -    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>> -} NBDClientConnection;
>> -
>>   typedef struct BDRVNBDState {
>>       QIOChannelSocket *sioc; /* The master data channel */
>>       QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
>> @@ -118,12 +100,8 @@ typedef struct BDRVNBDState {
>>       NBDClientConnection *conn;
>>   } BDRVNBDState;
>>   
>> -static void nbd_client_connection_release(NBDClientConnection *conn);
>>   static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
>>                                       Error **errp);
>> -static coroutine_fn QIOChannelSocket *
>> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
>> -static void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
>>   static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
>>   static void nbd_yank(void *opaque);
>>   
>> @@ -340,171 +318,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
>>       return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
>>   }
>>   
>> -static NBDClientConnection *
>> -nbd_client_connection_new(const SocketAddress *saddr)
>> -{
>> -    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
>> -
>> -    *conn = (NBDClientConnection) {
>> -        .saddr = QAPI_CLONE(SocketAddress, saddr),
>> -    };
>> -
>> -    qemu_mutex_init(&conn->mutex);
>> -
>> -    return conn;
>> -}
>> -
>> -static void nbd_client_connection_do_free(NBDClientConnection *conn)
>> -{
>> -    if (conn->sioc) {
>> -        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
>> -        object_unref(OBJECT(conn->sioc));
>> -    }
>> -    error_free(conn->err);
>> -    qapi_free_SocketAddress(conn->saddr);
>> -    g_free(conn);
>> -}
>> -
>> -static void *connect_thread_func(void *opaque)
>> -{
>> -    NBDClientConnection *conn = opaque;
>> -    bool do_free;
>> -    int ret;
>> -
>> -    conn->sioc = qio_channel_socket_new();
>> -
>> -    error_free(conn->err);
>> -    conn->err = NULL;
>> -    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
>> -    if (ret < 0) {
>> -        object_unref(OBJECT(conn->sioc));
>> -        conn->sioc = NULL;
>> -    }
>> -
>> -    qemu_mutex_lock(&conn->mutex);
>> -
>> -    assert(conn->running);
>> -    conn->running = false;
>> -    if (conn->wait_co) {
>> -        aio_co_schedule(NULL, conn->wait_co);
>> -        conn->wait_co = NULL;
>> -    }
>> -    do_free = conn->detached;
>> -
>> -    qemu_mutex_unlock(&conn->mutex);
>> -
>> -    if (do_free) {
>> -        nbd_client_connection_do_free(conn);
>> -    }
>> -
>> -    return NULL;
>> -}
>> -
>> -static void nbd_client_connection_release(NBDClientConnection *conn)
>> -{
>> -    bool do_free;
>> -
>> -    if (!conn) {
>> -        return;
>> -    }
>> -
>> -    qemu_mutex_lock(&conn->mutex);
>> -    if (conn->running) {
>> -        conn->detached = true;
>> -    }
>> -    do_free = !conn->running && !conn->detached;
>> -    qemu_mutex_unlock(&conn->mutex);
>> -
>> -    if (do_free) {
>> -        nbd_client_connection_do_free(conn);
>> -    }
>> -}
>> -
>> -/*
>> - * Get a new connection in context of @conn:
>> - *   if thread is running, wait for completion
>> - *   if thread is already succeeded in background, and user didn't get the
>> - *     result, just return it now
>> - *   otherwise if thread is not running, start a thread and wait for completion
>> - */
>> -static coroutine_fn QIOChannelSocket *
>> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>> -{
>> -    QIOChannelSocket *sioc = NULL;
>> -    QemuThread thread;
>> -
>> -    qemu_mutex_lock(&conn->mutex);
>> -
>> -    /*
>> -     * Don't call nbd_co_establish_connection() in several coroutines in
>> -     * parallel. Only one call at once is supported.
>> -     */
>> -    assert(!conn->wait_co);
>> -
>> -    if (!conn->running) {
>> -        if (conn->sioc) {
>> -            /* Previous attempt finally succeeded in background */
>> -            sioc = g_steal_pointer(&conn->sioc);
>> -            qemu_mutex_unlock(&conn->mutex);
>> -
>> -            return sioc;
>> -        }
>> -
>> -        conn->running = true;
>> -        error_free(conn->err);
>> -        conn->err = NULL;
>> -        qemu_thread_create(&thread, "nbd-connect",
>> -                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
>> -    }
>> -
>> -    conn->wait_co = qemu_coroutine_self();
>> -
>> -    qemu_mutex_unlock(&conn->mutex);
>> -
>> -    /*
>> -     * We are going to wait for connect-thread finish, but
>> -     * nbd_co_establish_connection_cancel() can interrupt.
>> -     */
>> -    qemu_coroutine_yield();
>> -
>> -    qemu_mutex_lock(&conn->mutex);
>> -
>> -    if (conn->running) {
>> -        /*
>> -         * Obviously, drained section wants to start. Report the attempt as
>> -         * failed. Still connect thread is executing in background, and its
>> -         * result may be used for next connection attempt.
>> -         */
>> -        error_setg(errp, "Connection attempt cancelled by other operation");
>> -    } else {
>> -        error_propagate(errp, conn->err);
>> -        conn->err = NULL;
>> -        sioc = g_steal_pointer(&conn->sioc);
>> -    }
>> -
>> -    qemu_mutex_unlock(&conn->mutex);
>> -
>> -    return sioc;
>> -}
>> -
>> -/*
>> - * nbd_co_establish_connection_cancel
>> - * Cancel nbd_co_establish_connection() asynchronously. Note, that it doesn't
>> - * stop the thread itself neither close the socket. It just safely wakes
>> - * nbd_co_establish_connection() sleeping in the yield().
>> - */
>> -static void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
>> -{
>> -    qemu_mutex_lock(&conn->mutex);
>> -
>> -    if (conn->wait_co) {
>> -        aio_co_schedule(NULL, conn->wait_co);
>> -        conn->wait_co = NULL;
>> -    }
>> -
>> -    qemu_mutex_unlock(&conn->mutex);
>> -}
>> -
>>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>>   {
>>       int ret;
>> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
>> new file mode 100644
>> index 0000000000..4e39a5b1af
>> --- /dev/null
>> +++ b/nbd/client-connection.c
>> @@ -0,0 +1,212 @@
>> +/*
>> + * QEMU Block driver for  NBD
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
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "block/nbd.h"
>> +
>> +#include "qapi/qapi-visit-sockets.h"
>> +#include "qapi/clone-visitor.h"
>> +
>> +struct NBDClientConnection {
>> +    /* Initialization constants */
>> +    SocketAddress *saddr; /* address to connect to */
>> +
>> +    /*
>> +     * Result of last attempt. Valid in FAIL and SUCCESS states.
>> +     * If you want to steal error, don't forget to set pointer to NULL.
>> +     */
>> +    QIOChannelSocket *sioc;
>> +    Error *err;
> 
> These two are also manipulated under the mutex.  Consider also updating
> the comment: both these pointers are to be "stolen" by the caller, with
> the former being valid when the connection succeeds and the latter
> otherwise.
> 

Hmm. I should move mutex and "All further" comment above these two fields.

Ok, I'll think on updating the comment (probably as an additional patch, to keep this as a simple movement). I don't like to document that they are stolen by caller(). For me it sounds like caller is user of the interface. And caller of nbd_co_establish_connection() doesn't stole anything: the structure is private now..

> 
>> +
>> +    QemuMutex mutex;
>> +    /* All further fields are protected by mutex */
>> +    bool running; /* thread is running now */
>> +    bool detached; /* thread is detached and should cleanup the state */
>> +    Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>> +};
>> +
>> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
>> +{
>> +    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
>> +
>> +    *conn = (NBDClientConnection) {
>> +        .saddr = QAPI_CLONE(SocketAddress, saddr),
>> +    };
>> +
>> +    qemu_mutex_init(&conn->mutex);
>> +
>> +    return conn;
>> +}
>> +
>> +static void nbd_client_connection_do_free(NBDClientConnection *conn)
>> +{
>> +    if (conn->sioc) {
>> +        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
>> +        object_unref(OBJECT(conn->sioc));
>> +    }
>> +    error_free(conn->err);
>> +    qapi_free_SocketAddress(conn->saddr);
>> +    g_free(conn);
>> +}
>> +
>> +static void *connect_thread_func(void *opaque)
>> +{
>> +    NBDClientConnection *conn = opaque;
>> +    bool do_free;
>> +    int ret;
>> +
>> +    conn->sioc = qio_channel_socket_new();
>> +
>> +    error_free(conn->err);
>> +    conn->err = NULL;
>> +    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
>> +    if (ret < 0) {
>> +        object_unref(OBJECT(conn->sioc));
>> +        conn->sioc = NULL;
>> +    }
>> +
>> +    qemu_mutex_lock(&conn->mutex);
>> +
>> +    assert(conn->running);
>> +    conn->running = false;
>> +    if (conn->wait_co) {
>> +        aio_co_schedule(NULL, conn->wait_co);
>> +        conn->wait_co = NULL;
>> +    }
>> +    do_free = conn->detached;
>> +
>> +    qemu_mutex_unlock(&conn->mutex);
>> +
>> +    if (do_free) {
>> +        nbd_client_connection_do_free(conn);
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +void nbd_client_connection_release(NBDClientConnection *conn)
>> +{
>> +    bool do_free;
>> +
>> +    if (!conn) {
>> +        return;
>> +    }
>> +
>> +    qemu_mutex_lock(&conn->mutex);
>> +    if (conn->running) {
>> +        conn->detached = true;
>> +    }
>> +    do_free = !conn->running && !conn->detached;
>> +    qemu_mutex_unlock(&conn->mutex);
>> +
>> +    if (do_free) {
>> +        nbd_client_connection_do_free(conn);
>> +    }
>> +}
>> +
>> +/*
>> + * Get a new connection in context of @conn:
>> + *   if thread is running, wait for completion
>> + *   if thread is already succeeded in background, and user didn't get the
>> + *     result, just return it now
>> + *   otherwise if thread is not running, start a thread and wait for completion
>> + */
>> +QIOChannelSocket *coroutine_fn
>> +nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>> +{
>> +    QIOChannelSocket *sioc = NULL;
>> +    QemuThread thread;
>> +
>> +    qemu_mutex_lock(&conn->mutex);
>> +
>> +    /*
>> +     * Don't call nbd_co_establish_connection() in several coroutines in
>> +     * parallel. Only one call at once is supported.
>> +     */
>> +    assert(!conn->wait_co);
>> +
>> +    if (!conn->running) {
>> +        if (conn->sioc) {
>> +            /* Previous attempt finally succeeded in background */
>> +            sioc = g_steal_pointer(&conn->sioc);
>> +            qemu_mutex_unlock(&conn->mutex);
>> +
>> +            return sioc;
>> +        }
>> +
>> +        conn->running = true;
>> +        error_free(conn->err);
>> +        conn->err = NULL;
>> +        qemu_thread_create(&thread, "nbd-connect",
>> +                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
>> +    }
>> +
>> +    conn->wait_co = qemu_coroutine_self();
>> +
>> +    qemu_mutex_unlock(&conn->mutex);
>> +
>> +    /*
>> +     * We are going to wait for connect-thread finish, but
>> +     * nbd_co_establish_connection_cancel() can interrupt.
>> +     */
>> +    qemu_coroutine_yield();
>> +
>> +    qemu_mutex_lock(&conn->mutex);
>> +
>> +    if (conn->running) {
>> +        /*
>> +         * Obviously, drained section wants to start. Report the attempt as
>> +         * failed. Still connect thread is executing in background, and its
>> +         * result may be used for next connection attempt.
>> +         */
>> +        error_setg(errp, "Connection attempt cancelled by other operation");
>> +    } else {
>> +        error_propagate(errp, conn->err);
>> +        conn->err = NULL;
>> +        sioc = g_steal_pointer(&conn->sioc);
>> +    }
>> +
>> +    qemu_mutex_unlock(&conn->mutex);
>> +
>> +    return sioc;
>> +}
>> +
>> +/*
>> + * nbd_co_establish_connection_cancel
>> + * Cancel nbd_co_establish_connection() asynchronously. Note, that it doesn't
>> + * stop the thread itself neither close the socket. It just safely wakes
>> + * nbd_co_establish_connection() sleeping in the yield().
>> + */
>> +void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn)
>> +{
>> +    qemu_mutex_lock(&conn->mutex);
>> +
>> +    if (conn->wait_co) {
>> +        aio_co_schedule(NULL, conn->wait_co);
>> +        conn->wait_co = NULL;
>> +    }
>> +
>> +    qemu_mutex_unlock(&conn->mutex);
>> +}
>> diff --git a/nbd/meson.build b/nbd/meson.build
>> index 2baaa36948..b26d70565e 100644
>> --- a/nbd/meson.build
>> +++ b/nbd/meson.build
>> @@ -1,5 +1,6 @@
>>   block_ss.add(files(
>>     'client.c',
>> +  'client-connection.c',
>>     'common.c',
>>   ))
>>   blockdev_ss.add(files(
>> -- 
>> 2.29.2
>>


-- 
Best regards,
Vladimir

