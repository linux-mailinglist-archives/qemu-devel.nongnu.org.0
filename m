Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD18C36D3A6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 10:08:33 +0200 (CEST)
Received: from localhost ([::1]:34414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbfFI-0004LZ-W4
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 04:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbfDo-0003N8-J3; Wed, 28 Apr 2021 04:07:00 -0400
Received: from mail-eopbgr00098.outbound.protection.outlook.com
 ([40.107.0.98]:50934 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbfDm-00022c-5Y; Wed, 28 Apr 2021 04:07:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjUhuxvhm6pZXehf5bKjZDXJM2HIzwLXC0Hqp5488ao4uJe4ixtlMziRUIBaB3jIOnDPofDUQ9sgcZeDGQsouXgFfR+AFK1Bv3VGO4GLAGjwYK9MPRWbUHjBW0WDTfKmrffMlTLK27jK3jEo7pGy89lvuGwg1AH4NHs7ZNhcDvEB4fR99jWXvs1wsWl9P1zt32OZG5m5NSHBQcBGmT/YwFB5xMc6z4vWJfqHj3eTKaHTUpw7V+mTUPbPHY35DVRAvDtjj7aloTdPiNrgBAT7w07xxmn8B5qlQrQ9+9whrH//+wATeGk7jn3pO8n0PgVNotPSYcam3pZm7ENyUddpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvqdkRHEBUacz7tX+7Cq24hTuIOGnP3R+IfXT4yRIhE=;
 b=DTCCY4UjI7FQaK/z39UgPIrtRMGxO8GzI+ND062rTt5+jhngdf4QCwBvzODRyACaskDcEj4Ust4KIQTGQbPxbENy8yHYQYLgpHZqR87o/cmNhvXZS96a5r4JWKM0yckehdZdnEJBXlNcS+mTSzu5HfC++zwXZbQzdqTaOUNR8QS8ASFPkGSznSFc1srfle0kdIoJr8DCypKPCT9lSKy3tXzC97Zeek+ukcn+UUFtrACRmlbgFN0z07EpguQBvlenT2GynbRsINnJMW41uWxjs0BbRPQj9KgTMrYeGxBxe7CMbOu1culyILxoosTMQrSKLykS7rM5lyShcFpGHantFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvqdkRHEBUacz7tX+7Cq24hTuIOGnP3R+IfXT4yRIhE=;
 b=Sy3cCicIdDVK3eDT4qmWNm6PNX8lFRDxCwtUjZSPtHxvc83vY9Wm/3146zodjyWff/wXaVyrfiZQ3/RvZwVu0Z0QLnaX0tcC17oxvVy4zBnDCXpnn9gHo4yiEDd18SzSTA6PbZdkiSyE68iZkdN6PZJ2NcRzbNNSpFFAhEADZk8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Wed, 28 Apr
 2021 08:06:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 08:06:54 +0000
Subject: Re: [PATCH v3 13/33] block/nbd: introduce
 nbd_client_connection_release()
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-14-vsementsov@virtuozzo.com>
 <YIiRqLT56H0BUtgA@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3531e32c-7334-f5e0-b985-23ab8bca9fed@virtuozzo.com>
Date: Wed, 28 Apr 2021 11:06:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIiRqLT56H0BUtgA@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: AM0PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 AM0PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:208:ac::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.8 via Frontend Transport; Wed, 28 Apr 2021 08:06:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00fc0182-ede4-4c81-9e78-08d90a1c964c
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5256B26B667120DDA4131B7AC1409@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oOlXhkwcwXFgcVHc+Px/doJmAyFuEJb0Q80t06zo6Zmsd4WlOE6P9W9vT9JAUr8XoGxH0fHJk0GMpn5s+J6ttzoYZyp+tMvWGjlNYGHDCUb8Vr+aocjxpiaYlB9Z6jN/EYrq9mZQcqlbFSqhYSo5G+xj3zzqOFkovFEQ42g9G/lSPedrcZktMFH9mW9vZOe2VfeVmt6ywE9WryxzO0UiCRkvUSji8Wh00r+rgeGEcJTN3RCrmljOAW2fQ0q/v2ZIx3CygBDZIXx1yMrZv/CAX1Aef9O64/XgAK+HNgg7Nr9WfhhqHkUmWb21/ux7pM4DJCfU6GlL7oWB2aB3iOJKCo5SOqnbVp/J6DAmtP3jCDXepKIjA7ZVzF4KG5CdCan0H27OWIuudjgF/OnfRVQc+0PEbNXOidqmSwPgtmqIN8S6PXeGfb4xbLWPQdTZE+bpyD0rTj5iROeADW4WTjhAFi/ApSQDUW15JbkZNJq9dDw97wb5JyIP0AnqYrvhFy/4FHIe0r1/JcU2zt+uU4KH0Ee2jQ+vvbk2G0uOfX+CEfTrSld4InM7rjLpONZovSLoMqCMBhZD/9a8oS5cPgHCCvTN+6PAULO90PRbUeyME1YxPn1y8dl/G0acUXmmgSdWI7jBzV7ZfB2qHStFmdHxRmgtbimUNjtjkB0GWeWgEp//Rluv7jTnuiJUpegkW3dSWPe2MRmUBqmtS1V450HPuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39830400003)(396003)(366004)(346002)(86362001)(2906002)(316002)(16576012)(36756003)(16526019)(186003)(5660300002)(83380400001)(956004)(26005)(8936002)(66476007)(6486002)(38100700002)(38350700002)(31696002)(2616005)(8676002)(478600001)(31686004)(66556008)(52116002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmhXNld2V2JYN2NaeVE5MFI2aHY5MTIzTlF1ZjJVcW9oTUJOZUpQb3pxcnkz?=
 =?utf-8?B?UW8yQkxyUGhVYXJIZEo2aGF5cEc4ZDRiRWgrMEgzYmN5cHdpbTVzdjdJOE8v?=
 =?utf-8?B?STFxazd6ZHhYWFA4YUpudDQwZmlDOWt0cHpzOGpORldsTmE3amtGaWw3VVh1?=
 =?utf-8?B?YXRyL1FWRUFBMWxTcXo5Nm9sVUxxZFBac0VsOTBjNVJ3NmlML2RQSmtrSnVj?=
 =?utf-8?B?WGtXaXJwT3NiaHhmS1BrMGd1eCtCYjh3TUxBMUxOOGZVcGdYcldrSVdhcXd6?=
 =?utf-8?B?TkhMWi94TCtvd3ROZWZNTlZOYVk2cGdZd09FUTdUWE9RVXZaRFBocDBHY1pt?=
 =?utf-8?B?bDdKTEJFNnFRTTdDT1QvOW8vTVB2cndVMXBwSFgxdTFBQXNKaGkxaW84SFEw?=
 =?utf-8?B?MUJ4cUdsMzJvSEhSSTVxSXV5YmhQbE43NUIwTHdxSnB0S040M0tKM0xxVDRv?=
 =?utf-8?B?dnNpd1RBS1A2amNyZ3plRnA3UjZudEIyM0RwUnc3Q1UwSWNQMC9JSldIZ3By?=
 =?utf-8?B?K09wTlVVVlgrbGdVZmxzSnBYajdGVkJvNDVqcXV5Wmd4RDNORzY2c1FDYTB0?=
 =?utf-8?B?WEVFQlFlL005QURtMTNpZGZVVFJ5N0JCTVFXa2lvcUM3cW9iNGhjS3Faa0VV?=
 =?utf-8?B?bDJSbXZkWTVRNWxJUTV0NmdwQ1FoNlowbUJtcTRxcEIvOXNGam9hcm03SUVG?=
 =?utf-8?B?S1BtcGFGKzJTcFpsR25KTzdWeC91TG84dno5cU1OK3hZenpTVTFxMkswSHhX?=
 =?utf-8?B?OWlCUGVrTVFxZVZ6UklURWhBN1Nickx2SCtzd1dQQk43VzBORUtCUTlKRVVt?=
 =?utf-8?B?d3YxaUNzSk1NRXZ1cUxKcjNKVGpnRDR1VFdyWE9mNE9EdXlkZVhUZDZjSU9x?=
 =?utf-8?B?Nyt2YzRKTE1XMVIzWW5XMGpkdmVLT0o2Wm1hbTRZU0VvL1QwdTZ1UjJFWStU?=
 =?utf-8?B?cVBpMFJ5UTAyOFNDV1QrUlBxbVBVMTBMR1ZDY05uc1IraWZGZ0hvZDVxUTI4?=
 =?utf-8?B?bEFzbXBNa2JyL2JHdFBSbXRkOEUwMFpLeXp2cmNZdThneHlyVGV5NWpBTlRH?=
 =?utf-8?B?RWR5UlcxSlYzWitnQkZkME5ZcE1mSWZVUml1ZmRXVWdBZk9pME9kU1dldjFv?=
 =?utf-8?B?STY2c1J5REpaWHA3cVFPYm9IM2RlbzdqM2lUZnpHcjZCRGorSTZDK1N0MUNx?=
 =?utf-8?B?dXRJb2FrM2w2NkRQYjIxdXo5WFZudFhhRlNSUGZIZGZEQU9xa1dmZEhqYlhp?=
 =?utf-8?B?dFlWc1JuVzVieVVITlVMazRzNm5tZ1Y0a0NGV0Fod0tqTldPMGZ5K1M3TzYw?=
 =?utf-8?B?QzRNWGJSY1FqNExsRVpNMVIxdGM0eUVSbDFkK2VnMC9XTS9Cb3pNOURYTFpF?=
 =?utf-8?B?Q1FpazFzSkt1ZzNnSHY0OUJYdVYwWFdwRVdmZm9QV0tnRmZYajNpYU1YdEJn?=
 =?utf-8?B?dFkyaUxCVG15aDFTU3Q3QVQ1ZlE4SjhUQWU5YTNraEZXNzcxeE1MVHFSODJk?=
 =?utf-8?B?VStFcSszalVrN2tiRVBnVVZqVFg5RDVrUkRxTWJobWZZT3A3amRycHhXVEZ0?=
 =?utf-8?B?MUhkZFQwVmZoMFJhUy9WL3NGM2dRemt1SU1DaWNIWFVodHJGL21kYmpQTStN?=
 =?utf-8?B?bnhLL2oxaEUxUHNNd0dwOXdFSlRESDJUYWxxeWRBU3dkL2lZb0lOVUs1Mitr?=
 =?utf-8?B?QzN4TzhDR3EwMjk2RDZ1ZHZEeVo2bVpWdDhOd0t5eTJOckZsbU04NGVTUnZl?=
 =?utf-8?Q?Bx8xmwyS3PQcjdqxl/GeLGkJ5AJAa+OoGgTqS5c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fc0182-ede4-4c81-9e78-08d90a1c964c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 08:06:54.7627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJ1qTvrL26RbTOtNFHIXklko7rOjoBHqzg9Vud+JNRK0vreQe/VRxcgruWRtK6yA0PweiyO1wgvIge5YS+gBl87o9fzExn1yYeE6Rtw1Yzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256
Received-SPF: pass client-ip=40.107.0.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

28.04.2021 01:35, Roman Kagan wrote:
> On Fri, Apr 16, 2021 at 11:08:51AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 43 ++++++++++++++++++++++++++-----------------
>>   1 file changed, 26 insertions(+), 17 deletions(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 21a4039359..8531d019b2 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -118,7 +118,7 @@ typedef struct BDRVNBDState {
>>       NBDClientConnection *conn;
>>   } BDRVNBDState;
>>   
>> -static void nbd_free_connect_thread(NBDClientConnection *conn);
>> +static void nbd_client_connection_release(NBDClientConnection *conn);
>>   static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
>>                                       Error **errp);
>>   static coroutine_fn QIOChannelSocket *
>> @@ -130,20 +130,9 @@ static void nbd_yank(void *opaque);
>>   static void nbd_clear_bdrvstate(BlockDriverState *bs)
>>   {
>>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>> -    NBDClientConnection *conn = s->conn;
>> -    bool do_free;
>> -
>> -    qemu_mutex_lock(&conn->mutex);
>> -    if (conn->running) {
>> -        conn->detached = true;
>> -    }
>> -    do_free = !conn->running && !conn->detached;
>> -    qemu_mutex_unlock(&conn->mutex);
>>   
>> -    /* the runaway thread will clean it up itself */
>> -    if (do_free) {
>> -        nbd_free_connect_thread(conn);
>> -    }
>> +    nbd_client_connection_release(s->conn);
>> +    s->conn = NULL;
>>   
>>       yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
>>   
>> @@ -365,7 +354,7 @@ nbd_client_connection_new(const SocketAddress *saddr)
>>       return conn;
>>   }
>>   
>> -static void nbd_free_connect_thread(NBDClientConnection *conn)
>> +static void nbd_client_connection_do_free(NBDClientConnection *conn)
>>   {
>>       if (conn->sioc) {
>>           qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
>> @@ -379,8 +368,8 @@ static void nbd_free_connect_thread(NBDClientConnection *conn)
>>   static void *connect_thread_func(void *opaque)
>>   {
>>       NBDClientConnection *conn = opaque;
>> +    bool do_free;
>>       int ret;
>> -    bool do_free = false;
>>   
> 
> This hunk belongs in patch 8.
> 

Agree

> 
>>       conn->sioc = qio_channel_socket_new();
>>   
>> @@ -405,12 +394,32 @@ static void *connect_thread_func(void *opaque)
>>       qemu_mutex_unlock(&conn->mutex);
>>   
>>       if (do_free) {
>> -        nbd_free_connect_thread(conn);
>> +        nbd_client_connection_do_free(conn);
>>       }
>>   
>>       return NULL;
>>   }
>>   
>> +static void nbd_client_connection_release(NBDClientConnection *conn)
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
>>   /*
>>    * Get a new connection in context of @conn:
>>    *   if thread is running, wait for completion
>> -- 
>> 2.29.2
>>


-- 
Best regards,
Vladimir

