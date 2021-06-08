Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A5A3A036A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:24:30 +0200 (CEST)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhKv-0001Q1-6K
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqhJo-0000dI-HH; Tue, 08 Jun 2021 15:23:20 -0400
Received: from mail-eopbgr80098.outbound.protection.outlook.com
 ([40.107.8.98]:3553 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqhJk-0004cu-NZ; Tue, 08 Jun 2021 15:23:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe63WaKynM9lh0mRwbuX/I0GUBq4oVEzgDd9wkupQRL5q7pXm0t+T6rPyOXAyP3xU77wUe3yTycVgTM/Qqwt24JsR4KMi/xxUt2AvxpS1vSra3zsPJDtW8yC+cxIvWOPWB6yBaCOOb3G0tD7RCD175dhVTRHchvde4h7h0Y6RhtzmCaOyfkJ1ocBnZ5e4tObs6fGUKiHd6kHW+1l48/X5J465CALokaCheLdON1zc02A6BD/x3kcWh13BE2NXm8GenTRNhIT5HYVijH5jtr3ezdPwnWKCUK3kWI0/JqZcvUuFRZEcNbKTZBpB2wVM/oO9HoGgb/Mfgo6weUY78YZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgACaZbrO0vd/RqQupgK2XdVvIkAuB5jhDHTn7vf19I=;
 b=EmOaP2OivqiTw5zaqAEhuOUXWUIKaem8thY26DO5ku5hYVvRTTi8EszQWWJTimesJninYoL4JVlL46k+mzDztJREgdx+JUSCRyWxBClS+6/wR3SonieESwbHrU027ILMSSpGP5WoULfZnc4W23aC5zHwlLFaUSC8UhPDHCWjDjIw4div9tsrJ80qJHQy7Gm3g+LlhD4f063jfWE53HuPeDPzE9grjNtYnq0/WRiH4cBbRA5UN5b12YLcwn5i6RvNdyk3wSoL8muS0yoLt7NhWOtxw3UB893Q/6zykHgpY299xVfrIt/p92O+Rv2qjwVsbB63MEPn/g2qNxDYpi4otA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgACaZbrO0vd/RqQupgK2XdVvIkAuB5jhDHTn7vf19I=;
 b=GCRNtkreLqe0Je4kZoMr2eaVfxH/nbFBgVsPa4Rq47xWvb3HfNsR8E20nQUwblVqC71W18vuPifYCPSAtPLeMHzRxfi25jB0024bZTBK2kTlQwgGxUzphyCwLQIcGMOkcdVJxecyb1wgkT5+ELpgh5EjtS0ytkk1rVrfsywnVIw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 19:23:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 19:23:13 +0000
Subject: Re: [PATCH v3 16/33] nbd/client-connection: add possibility of
 negotiation
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-17-vsementsov@virtuozzo.com>
 <YJpgQ3/9buUGwTMC@rvkaganb.lan>
 <a75b4a98-5a9e-56bf-0606-0cfa8b7dd41e@virtuozzo.com>
Message-ID: <30b7efce-7769-7740-0652-9ba4bbd38fec@virtuozzo.com>
Date: Tue, 8 Jun 2021 22:23:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a75b4a98-5a9e-56bf-0606-0cfa8b7dd41e@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR05CA0076.eurprd05.prod.outlook.com
 (2603:10a6:208:136::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR05CA0076.eurprd05.prod.outlook.com (2603:10a6:208:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Tue, 8 Jun 2021 19:23:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8a63e3c-4f9d-41fb-9d64-08d92ab2dc2e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693588CF5953AA2C9316B3CC1379@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:295;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1KpCNIM8BHtjxXPgquH9TgcYtwmxe+T6XfRcv593mdiRDuCYornS0r2DhX409yo82Hh5MKGmU7S21q98zUT/Ky0tTFoBczvqgDhcUjA4bon/VEw8I3jBhj2zf/zbRMhMaPL/DcBomrvVItwRlMFTECJUI26nwuoxDhup26DBouG/l862Jc8WpyUto6VHIPRy6ccuHx6sZlTpLpreMGCs+GJYBFjSxmb4nxgnLTDfiLE4FzH3xQRJlm323Tz1n+wugDrryFWqNvZaNQSmqoIEWeCeD/QDd7hrHuYThJ0GviA0g22INOJA32tvZom9iVipKIcytQRY8fTlMPQ13Jr2rUZ6mPShXrl2o+9BebfGPJk4bm6HTDMUfKX68LRH/8cXbZud2liC/iX+UAvssB6v4W2wrZrgJCflCOxQZ2EmDZh8y430F2cpHwrxMgyUK7PhOoGp0u1G9q0u0wwD+1oSrJes6hk+MCP8Gyck+a1iEO4RjhSSqFIubxK5qv3tBGes1kBv5ZcYojdHReA/OQRTWq0lBYHOIPo0mOAFZxWOhORedb/P/scQfafEOoDbr9h8ieVMnttQWRhTUht5SIO6f4iumtgIiO8TNQoaenMJ4Ckb/hAsKu71mcd0VcZngqlV5t7ld154N7ym4N//QYY6Nwcp7NxrN5Ia7EJ5WFfL/+qBUiZcP50O/yTVME0DReRfjW1XnoOmVgIM0cfFhV1jwuxoWpePcNMEuyBsBIoENs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(136003)(376002)(366004)(8676002)(956004)(66556008)(2616005)(478600001)(83380400001)(66476007)(31686004)(86362001)(8936002)(52116002)(38350700002)(36756003)(31696002)(316002)(2906002)(26005)(5660300002)(16576012)(66946007)(16526019)(6486002)(186003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2ZBSkY4cjNVV2w4SFlpalkwd0xMZ0I2a0l4anZjdzFQVGFhVjJpbnV6d2w0?=
 =?utf-8?B?SEpxUVZhaXk1OTNUSkdmK3hXZ2dKQVYwY1VsaWs2c2ZVd1MwK2NVWVgybDND?=
 =?utf-8?B?YTNucFJJTXVTenk1WnYyWWNUVHhkMHlSQmZ3NnJqTUMzOHNldkJycXFWZXVz?=
 =?utf-8?B?RzlWbGE3aTZTZE1qb2k1TFBKWmJ5UnlDcHdteWNzU2E2ekZMb3I3WWtFRFZH?=
 =?utf-8?B?cm9qL3JSSnFPUWFwZFpFSHJIaFp6b080V1A4NTFFaWJJcFV6ckp2U2h0UWZj?=
 =?utf-8?B?eC9MdmdlaHFmMldkaUR0STdNV0xGekEvZzBPelpZWG5DSWh5aGd6OHlsajA5?=
 =?utf-8?B?Sy9SUEhCZE50TFp6bDE3TXYrM1pwZVFjV0xMUkZJN2F0UFlpWjBqSnVOTWZn?=
 =?utf-8?B?TjgxV2pKdkVCVS93S25oVUp4MnBkN1lDLy90eElWcHBRU1ZTdmpybzJMSHBo?=
 =?utf-8?B?cmFQTzRYWGNuakJZQitUdlhtUkhabVJqYWVpZHNuWlhhaDUxODA0RmVCNlBU?=
 =?utf-8?B?S1kvczQxODdmRHBmQ3puUHpGOERleDdnakdJdWd2OG1pUkFZU2k5dktpWnRN?=
 =?utf-8?B?bGp3NGQ2b0wreHZzUlptWWNBZGRJRE1WTzgwMHNvVUpCZVpuS2R2ZThZazdM?=
 =?utf-8?B?aXJJVG05K1lOSGhyWmI1MmRXeFBEWnlTdEFDdU1tTWp3cnlXZ1RhM1JiYWwz?=
 =?utf-8?B?WDZBYjBXVlZhQUhtN0dvVURFaURENTlsM1ZxaHdOQjhkaXpsd0VVQ0Z2Y0FO?=
 =?utf-8?B?MVBHYytWc3E1YlZ1dHhlRVFWN0twalI0dFRIUlJwUU1NZjdsY2V1S0FYUUwr?=
 =?utf-8?B?QS9zM2V0Z2JWaWhlTTRTOVQwKzJNclNFc2QydFV1UTZ6ZnZIOC9DODZLSVFw?=
 =?utf-8?B?WFF2dlpwSlB0dUtHNndNNWVIZ09wcWhOY2NHMnVCWW5ZaDRIU0RKSE43bDNP?=
 =?utf-8?B?NFlldmdVR2s0bnhKaE1IdVVKQjF0aWF1NFYvUTR1S2NBeGJEdjNmRk4rTDV4?=
 =?utf-8?B?dGREQkkxNjZJQ3VFMUVyZVQrZHFHbmR6VzBKQVNMcVdJK2RmQVZ5U3hucDNO?=
 =?utf-8?B?S1lWLzg3c0VzSDNHNFlvVzN4amE4NVExNnd4WXpOdjJ3aFFTN3NxcW9MbnM0?=
 =?utf-8?B?d0JDdzc4ZGk4OW1OR3JObXVXT2syS0dPVmozejVnOFlkTDRSZVMyMEdvT2pS?=
 =?utf-8?B?QXpZbWVwZ08zbzFodkwvcEt6UHpyc3NQZVY2U2dublV1VTl4RnRISnF4aGJw?=
 =?utf-8?B?T0hQbnlaMGVYdmw0SjZjZmJsbjV4NzVITy83djBNaE9TdmZCTWlLWmlOUlVJ?=
 =?utf-8?B?bVhiM3JXaFdLQm5IbFAvTWRodzVjSldySitpQTRaTkxvclZFeVF4TTF5ZGcw?=
 =?utf-8?B?akFXYkZlSEdLa2NaSTBwQ2FXZTUzVEV1cWQ5MXZyV2MwZFZYL1hOZmtVWTJS?=
 =?utf-8?B?TVhhYTZDME5NY2srZmgwUlFVeUc5bUgxMUNLek9MVmh0ZFgvb2ZkVWNYTHo2?=
 =?utf-8?B?YnN3K0FrSVZycWcrUkZWTkhmcnZOdEFOZmdJRVpWM2h4OHE5UG5SOW0xSkZY?=
 =?utf-8?B?M0VBNi9yVlEwbk5TZG1DTlgyZ2FBNklRa0hHTUpCQkpJUFpzSnpXcGhVT3pI?=
 =?utf-8?B?Y3UrVFY0N1VRejVvSXBUZEJUTGpxaU5Cb2pNK0tkVy82U05pWmZGb1UrYjBm?=
 =?utf-8?B?ZFBNZnVFRkNtcWZOcnlkdWM1MFRRb2tVeXJIWENFNDFWNnc1UGFQYlJSSFNN?=
 =?utf-8?Q?+xAoRd91DnYybIu20qOaiaI84Lrv3x5HY0eE1/3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a63e3c-4f9d-41fb-9d64-08d92ab2dc2e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 19:23:13.7527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XO5/s4oCHbn01HxD/0GlOoz9BbGBNOKQF7o3/9bDWAXduy6MeDX6p53bMouoJvyHGiW5mbcWDRjFpA08/FsOwfHNQ28NjOIjhF+caGhzERg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.8.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

12.05.2021 09:42, Vladimir Sementsov-Ogievskiy wrote:
> 11.05.2021 13:45, Roman Kagan wrote:
>> On Fri, Apr 16, 2021 at 11:08:54AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> Add arguments and logic to support nbd negotiation in the same thread
>>> after successful connection.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   include/block/nbd.h     |   9 +++-
>>>   block/nbd.c             |   4 +-
>>>   nbd/client-connection.c | 105 ++++++++++++++++++++++++++++++++++++++--
>>>   3 files changed, 109 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/include/block/nbd.h b/include/block/nbd.h
>>> index 57381be76f..5d86e6a393 100644
>>> --- a/include/block/nbd.h
>>> +++ b/include/block/nbd.h
>>> @@ -409,11 +409,16 @@ const char *nbd_err_lookup(int err);
>>>   /* nbd/client-connection.c */
>>>   typedef struct NBDClientConnection NBDClientConnection;
>>> -NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
>>> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>>> +                                               bool do_negotiation,
>>> +                                               const char *export_name,
>>> +                                               const char *x_dirty_bitmap,
>>> +                                               QCryptoTLSCreds *tlscreds);
>>>   void nbd_client_connection_release(NBDClientConnection *conn);
>>>   QIOChannelSocket *coroutine_fn
>>> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
>>> +nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>>> +                            QIOChannel **ioc, Error **errp);
>>>   void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
>>> diff --git a/block/nbd.c b/block/nbd.c
>>> index 9bd68dcf10..5e63caaf4b 100644
>>> --- a/block/nbd.c
>>> +++ b/block/nbd.c
>>> @@ -361,7 +361,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>>>           s->ioc = NULL;
>>>       }
>>> -    s->sioc = nbd_co_establish_connection(s->conn, NULL);
>>> +    s->sioc = nbd_co_establish_connection(s->conn, NULL, NULL, NULL);
>>>       if (!s->sioc) {
>>>           ret = -ECONNREFUSED;
>>>           goto out;
>>> @@ -2033,7 +2033,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>>>           goto fail;
>>>       }
>>> -    s->conn = nbd_client_connection_new(s->saddr);
>>> +    s->conn = nbd_client_connection_new(s->saddr, false, NULL, NULL, NULL);
>>>       /*
>>>        * establish TCP connection, return error if it fails
>>> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
>>> index b45a0bd5f6..ae4a77f826 100644
>>> --- a/nbd/client-connection.c
>>> +++ b/nbd/client-connection.c
>>> @@ -30,14 +30,19 @@
>>>   #include "qapi/clone-visitor.h"
>>>   struct NBDClientConnection {
>>> -    /* Initialization constants */
>>> +    /* Initialization constants, never change */
>>>       SocketAddress *saddr; /* address to connect to */
>>> +    QCryptoTLSCreds *tlscreds;
>>> +    NBDExportInfo initial_info;
>>> +    bool do_negotiation;
>>>       /*
>>>        * Result of last attempt. Valid in FAIL and SUCCESS states.
>>>        * If you want to steal error, don't forget to set pointer to NULL.
>>>        */
>>> +    NBDExportInfo updated_info;
>>>       QIOChannelSocket *sioc;
>>> +    QIOChannel *ioc;
>>>       Error *err;
>>>       QemuMutex mutex;
>>> @@ -47,12 +52,25 @@ struct NBDClientConnection {
>>>       Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>>>   };
>>> -NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
>>> +NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>>> +                                               bool do_negotiation,
>>> +                                               const char *export_name,
>>> +                                               const char *x_dirty_bitmap,
>>> +                                               QCryptoTLSCreds *tlscreds)
>>>   {
>>>       NBDClientConnection *conn = g_new(NBDClientConnection, 1);
>>> +    object_ref(OBJECT(tlscreds));
>>>       *conn = (NBDClientConnection) {
>>>           .saddr = QAPI_CLONE(SocketAddress, saddr),
>>> +        .tlscreds = tlscreds,
>>> +        .do_negotiation = do_negotiation,
>>> +
>>> +        .initial_info.request_sizes = true,
>>> +        .initial_info.structured_reply = true,
>>> +        .initial_info.base_allocation = true,
>>> +        .initial_info.x_dirty_bitmap = g_strdup(x_dirty_bitmap),
>>> +        .initial_info.name = g_strdup(export_name ?: "")
>>>       };
>>>       qemu_mutex_init(&conn->mutex);
>>> @@ -68,9 +86,59 @@ static void nbd_client_connection_do_free(NBDClientConnection *conn)
>>>       }
>>>       error_free(conn->err);
>>>       qapi_free_SocketAddress(conn->saddr);
>>> +    object_unref(OBJECT(conn->tlscreds));
>>> +    g_free(conn->initial_info.x_dirty_bitmap);
>>> +    g_free(conn->initial_info.name);
>>>       g_free(conn);
>>>   }
>>> +/*
>>> + * Connect to @addr and do NBD negotiation if @info is not null. If @tlscreds
>>> + * given @outioc is provided. @outioc is provided only on success.  The call may
>>
>> s/given/are given/
>> s/provided/returned/g
>>
>>> + * be cancelled in parallel by simply qio_channel_shutdown(sioc).
>>
>> I assume by "in parallel" you mean "from another thread", I'd suggest to
>> spell this out.  I'm also wondering how safe it really is.  In general
>> sockets should be fine with concurrent send()/recv() and shutdown(): the
>> sender/receiver will be woken up with an error.  Dunno if it's true for
>> an arbitrary qio_channel.
> 
> Hmm.. Good notice. I'll look at it.

At least, it should be safe, as in documentation of qio_channel_shutdown() I read:


      This function is thread-safe, terminates quickly and does not block

> 
>>  Also it may be worth documenting that the
>> code path that cancels must leave all the cleanup up to the negotiation
>> code, otherwise it risks conflicting.
>>
>>> + */
>>> +static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
>>> +                       NBDExportInfo *info, QCryptoTLSCreds *tlscreds,
>>> +                       QIOChannel **outioc, Error **errp)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (outioc) {
>>> +        *outioc = NULL;
>>> +    }
>>> +
>>> +    ret = qio_channel_socket_connect_sync(sioc, addr, errp);
>>> +    if (ret < 0) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (!info) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc), tlscreds,
>>> +                                tlscreds ? addr->u.inet.host : NULL,
>>> +                                outioc, info, errp);
>>> +    if (ret < 0) {
>>> +        /*
>>> +         * nbd_receive_negotiate() may setup tls ioc and return it even on
>>> +         * failure path. In this case we should use it instead of original
>>> +         * channel.
>>> +         */
>>> +        if (outioc && *outioc) {
>>> +            qio_channel_close(QIO_CHANNEL(*outioc), NULL);
>>> +            object_unref(OBJECT(*outioc));
>>> +            *outioc = NULL;
>>> +        } else {
>>> +            qio_channel_close(QIO_CHANNEL(sioc), NULL);
>>> +        }
>>> +
>>> +        return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static void *connect_thread_func(void *opaque)
>>>   {
>>>       NBDClientConnection *conn = opaque;
>>> @@ -81,12 +149,19 @@ static void *connect_thread_func(void *opaque)
>>>       error_free(conn->err);
>>>       conn->err = NULL;
>>> -    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
>>> +    conn->updated_info = conn->initial_info;
>>> +
>>> +    ret = nbd_connect(conn->sioc, conn->saddr,
>>> +                      conn->do_negotiation ? &conn->updated_info : NULL,
>>> +                      conn->tlscreds, &conn->ioc, &conn->err);
>>>       if (ret < 0) {
>>>           object_unref(OBJECT(conn->sioc));
>>>           conn->sioc = NULL;
>>>       }
>>> +    conn->updated_info.x_dirty_bitmap = NULL;
>>> +    conn->updated_info.name = NULL;
>>> +
>>>       WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>>>           assert(conn->running);
>>>           conn->running = false;
>>> @@ -94,8 +169,8 @@ static void *connect_thread_func(void *opaque)
>>>               aio_co_schedule(NULL, conn->wait_co);
>>>               conn->wait_co = NULL;
>>>           }
>>> +        do_free = conn->detached;
>>>       }
>>> -    do_free = conn->detached;
>>
>> This looks like the response to my earlier comment ;)  This hunk just
>> needs to be squashed into the previous patch.
>>
>>>       if (do_free) {
>>> @@ -131,12 +206,24 @@ void nbd_client_connection_release(NBDClientConnection *conn)
>>>    *   if thread is already succeeded in background, and user didn't get the
>>>    *     result, just return it now
>>>    *   otherwise if thread is not running, start a thread and wait for completion
>>> + *
>>> + * If @info is not NULL, also do nbd-negotiation after successful connection.
>>> + * In this case info is used only as out parameter, and is fully initialized by
>>> + * nbd_co_establish_connection(). "IN" fields of info as well as related only to
>>> + * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
>>> + * include/block/nbd.h).
>>>    */
>>>   QIOChannelSocket *coroutine_fn
>>> -nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>>> +nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>>> +                            QIOChannel **ioc, Error **errp)
>>>   {
>>>       QemuThread thread;
>>> +    if (conn->do_negotiation) {
>>> +        assert(info);
>>> +        assert(ioc);
>>> +    }
>>> +
>>>       WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>>>           /*
>>>            * Don't call nbd_co_establish_connection() in several coroutines in
>>> @@ -147,6 +234,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>>>           if (!conn->running) {
>>>               if (conn->sioc) {
>>>                   /* Previous attempt finally succeeded in background */
>>> +                if (conn->do_negotiation) {
>>> +                    *ioc = g_steal_pointer(&conn->ioc);
>>> +                    memcpy(info, &conn->updated_info, sizeof(*info));
>>> +                }
>>>                   return g_steal_pointer(&conn->sioc);
>>>               }
>>> @@ -178,6 +269,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>>>           } else {
>>>               error_propagate(errp, conn->err);
>>>               conn->err = NULL;
>>> +            if (conn->sioc && conn->do_negotiation) {
>>> +                *ioc = g_steal_pointer(&conn->ioc);
>>> +                memcpy(info, &conn->updated_info, sizeof(*info));
>>> +            }
>>>               return g_steal_pointer(&conn->sioc);
>>>           }
>>>       }
>>> -- 
>>> 2.29.2
>>>
> 
> 


-- 
Best regards,
Vladimir

