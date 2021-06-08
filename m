Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CBE39F3CC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:41:15 +0200 (CEST)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZAX-0005e8-JH
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqZ8R-0003g5-GT; Tue, 08 Jun 2021 06:39:03 -0400
Received: from mail-eopbgr150121.outbound.protection.outlook.com
 ([40.107.15.121]:22493 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqZ8N-0005On-Im; Tue, 08 Jun 2021 06:39:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHdvOlFJKjrPRbwupSOTCri84nVcjzuMC6FfjycR4cT0ZcqB93ztk2AejbLy/tF/QW7YLK7QwREY7JYGasbjOWBV5UN13VKtheJhLHrvnNHVBbIRFWrj6QOj6wi7NRcmNgJgLRSRuZ+tLvOYFLjYnMHewj1wnabDOluZp6RsVWbpQDMrVFF1xpArn9WqVRBa2nhSXC1nk7CwcIK74weE/ixSYLROUoIgGtxKtY+AS+mWQS2xFfdHC9x56hzoinQAGDlj2pZfPVKl3oUH1G87VQQ8w2i7Uk49X/g0EAJouW5y80bJ0wa4PZHtHuKF4vGK1asJo6fF4LTE1XPxmcWu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q55Y1QAEJRbQTDyow/2y0YJ1LkY7URsnswxLHd00tYE=;
 b=IVMkMF0yUlGfJlp3OLwCNa87kPVZZNZ46mCpEzI4wJL2wkiY2uAoiH8TceKwxrPwC++gOcV+ujlwZ0OazEM5/BTROKaP3/qt0tyTburtlk7kTS+UsoB6MV2hVQgXk8eHmgbyoZ5GJdIsetT8Jvs8AWLO6hXFUykFj8QTXunLyUaDwOP0KmiS+n4GaTZoAOwIEn4abnZ//Wp20umY0DL11OdYQu6VC5lJiaAbGRfn7eXfVDkx03rQH1Hqx+piyN6JwGAr5rWiqi/OD7QHmL1esIvkkaDn03SPcZXGBoILBDJgRw9kjdNtD9NQOA2gfLdPZ6OoB98Wr9fMs5+Nw1gZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q55Y1QAEJRbQTDyow/2y0YJ1LkY7URsnswxLHd00tYE=;
 b=kzjgOr4d85APAReYfp//wBz++ylwibXnBijBxwdt+Pot8HCNbyXI30l9P07AQvyTGxLtTYVoO/TlKFSKPf+jfTY6R3IQr+zaoAIPiRUVTEDGXH7/pd3gqqx9G0hrULdDbvV87aHEkicBK4tOlnWc2Ofd90diNvTMsznjzZyNNaY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 10:38:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 10:38:56 +0000
Subject: Re: [PATCH v3 17/33] nbd/client-connection: implement connection retry
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-18-vsementsov@virtuozzo.com>
 <20210603161722.benugy4v7jsropwv@redhat.com>
 <a7848468-3932-4ed6-884d-64a1b1813ec4@virtuozzo.com>
Message-ID: <16fe00fa-ed1c-1bc9-e3e8-fc51c280ea45@virtuozzo.com>
Date: Tue, 8 Jun 2021 13:38:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a7848468-3932-4ed6-884d-64a1b1813ec4@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR1PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::37) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR1PR01CA0024.eurprd01.prod.exchangelabs.com (2603:10a6:102::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Tue, 8 Jun 2021 10:38:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa33551e-b738-47ca-c9d9-08d92a699e21
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54940F322C3E5E32B48309ECC1379@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7rdbx5+Ru3a6glkcPHUphT20b5q5ozOImFiV6oYC+dt3duJSX97bSGPhmBuL61UdoXNX2iFfAhUIbF/0Aycn8JUroJjjhz0DE6nZoLZ8WV2bEexKzaE7AHblBdv02/ifk6XpHOcuUYbWs4idVHf0sVQwZ7M15OeU0Cnrmj+aTzBlNOAqSElE8E5LK7TngE0SIIIgey/fqghqd4kSDoSc6ArvrZOm8C48a9+zLGGIj1JNVweuGOwGRUb/t44xx0Wh3QocUpNI7cxAqs7HLJ+W0d/CJbvY3kBjduppsQRv9dSul3kVoGWWAg8U/S4WcDlM6EDryBqMek87uVe266rforCjKqva7lDTcGs3PJUxVQck7Bk+wOXNNyu5lz7I2RpUMGfEOM9qUxvLINa+4SeOfU+UUzMjtJeSr8jPkIUIc3OvchNOsmzjyECPHLcrp7rZL/M7+5ySpWyhxD51RQEG9sfHKIrOPhCrIuiYy8m6mHFohFX72JekwWu8I86BlBy1Il9LtBMff6v63hSEGroh2fU0fUodczB9Albqow9295ZlkZ90dL9C68BlGsNIZ8fHlzoBxJWQk9+506xrd1Lxo05fUiWWO16rhbuvCiuAB7rsn2+L3C0+eYvshUGR3MyTi7mpTX9DotVuajUvL9Z5x+ZjKWCxo5ssYsFCmRM9L1FXtO8ZB0E55pSk/PY3Nnh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(346002)(396003)(136003)(4326008)(8936002)(31696002)(38100700002)(16576012)(66476007)(66556008)(66946007)(16526019)(107886003)(36756003)(86362001)(8676002)(26005)(6916009)(2616005)(52116002)(478600001)(5660300002)(2906002)(956004)(316002)(83380400001)(6486002)(186003)(38350700002)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ekpUU1p1STRTMzZ2ZGs3TmE2aEFLRnRkbmprOE9uUXJTK2NhL2lIcnJaTnY1?=
 =?utf-8?B?WE14OER6djdJckVSUDVCN3FDNUxpNXoyUkVaL2YyRU5tcmZkY0NuTEQxQnMw?=
 =?utf-8?B?MjdvTHlpWi9odnduN1VGcUw5M2hlVHlhcTU1TFNPODBSNURUSDBPYldvRHZm?=
 =?utf-8?B?cVErSk43UUpzbE95NTZUcUhuN0V3dEpZZG1yTjhzdk1SU2owWnF2emNSb2V2?=
 =?utf-8?B?S2tEREdxUWRmeSsxKzRWN3hIUW44YWhpYldmUElDS2ZhMEk1UkY3RmdpNWhZ?=
 =?utf-8?B?dXBHc0NpV3ovRzdCeU1iL2xuL1FOQURnNkViR281UithYjJDbFJFWFpKL1A2?=
 =?utf-8?B?TkpMMnVQc0U4NHN6clpaWUE1a3hBNTI3MWFxdGdlSTRNWkNHQkNMRjVNYUgz?=
 =?utf-8?B?RFVKd3dLQldWaHNwUEVSOFhTTTlGdlZMQUpDUmh3Zmt2cFJPeVZxM2tBR0VX?=
 =?utf-8?B?aEhQYU5wWXlXZE9NTXZ5QldFeGlneVZieklFQ29pcFhSdlZXZzhMbElkcHRo?=
 =?utf-8?B?b0s5d1ZYQlhRR3E4ZDd4QlU2Tk45aURwYnlGSFpWY1FreVg4endyREF2Wmli?=
 =?utf-8?B?M0oyN21LMEJVVGFheElabjY2NFRaZFRleUdhM3kvQ2lCVUdoZnpqV3h1TTJ4?=
 =?utf-8?B?WTh3NUhDT1E2d0FZTEc0NTJnMFp6dm5KcHFVYW1xK0RrK1E1WWpvSFhoZHlU?=
 =?utf-8?B?cW5WQXMxcUxKcXduTXZMV0p3STRTa3MwdDJGaTdqdlI3eVVrdStlb3dycldR?=
 =?utf-8?B?ODd5OXAzdTU5SzlhMGlkS1RCZ3d5aEhzS1l5L21CcmtpOTcrM1RHdC8xMTZE?=
 =?utf-8?B?SDQzd2NFUXIzS3cwYkFxc05LRGN1SGZYa1hsWm1QM29IOGdvNkYvaURzOS93?=
 =?utf-8?B?amlaamxsbncrbHdSNm9UblEzWE1EbjhVdDdwajR1aUFjZERhY21McTdGVG0r?=
 =?utf-8?B?a0tWSk1XejNvdUNIeG5jTEsvY0Q4SUZ5VTRuOG83Qm1zbDVoWVFtRHhzQVRi?=
 =?utf-8?B?VFlJazFXT1dQZDM0WHEwU2VhMG9CZ251ckZVVTN0c2xwWUcxd0cwbnNvOHNL?=
 =?utf-8?B?TDYwaFZGMmRkMlNCUVBpeWdibFVQMWNGNFBBZlMvVFZxekVNS1lCUkFMb2wx?=
 =?utf-8?B?M1NzMmNTVFNCdExPRmd1QlJQNnA4RVlVZkNkSUZMekRvMWxQS0dmMmlIMm1Q?=
 =?utf-8?B?bU5FM094ck1OK2g2NThrbUlVNjBIZ3pJREp5T1NabFRpY3FqTzU1bHhhdERO?=
 =?utf-8?B?Z1BmK3h2UGNHOGZ4cHQ2QjA3Qlpyb1kwWGt2bjErZmhEbVAxSlRGTXo0NW0z?=
 =?utf-8?B?UmZkS3NTc3N3UzlScm5EblgvYmhkWU16NHhlL0tYMk1HeXFrTFc3cWRQR1kv?=
 =?utf-8?B?a1lXd2g5RWozRVlsKytCbDBnTFp5UVNKTHdSb293Z1VWL1JNU1JxVDRyNVRL?=
 =?utf-8?B?L1ljdWhqS0VlbFo3VkNrVkp1d1VISEtvK0VjM2V5NGpQVDRqemxHcG43TkRZ?=
 =?utf-8?B?dnF4elpXVFRHbnN0VjU4SzVPTEVQUFkwZ2dLYmUyem5KdnlObStQTElubUJj?=
 =?utf-8?B?aVNQQlI4bUg5UjRrR2Y2REUwdms4eGZvL1lDWkU4R285dmJzUmxtdGVyNWVu?=
 =?utf-8?B?cDhjb1FmWUdLVGVESHNFOVdZZzdBUVBtZE1NS3d4bE9wVDk2dEhzZTRBV0hq?=
 =?utf-8?B?MTZYeEdSSWF3cUc5c1pSV3VkbWNtNDBROHNKYm9FUXptUVNsZFo4WkdIZk9v?=
 =?utf-8?Q?CGVSNWBRBK3mlZqNjQesORs5oUzaXGXrWQRJitA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa33551e-b738-47ca-c9d9-08d92a699e21
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 10:38:56.3708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGlhAMaItui1nPuhXnR//5Q2nb0+jQlWvqrBV1uNXnIoO9U4un1pRWXq+dzfXfsvYe+OHu1zETIME+1m+XNAjiWLhuTAzyUPBkeppsVXBak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.15.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

03.06.2021 20:49, Vladimir Sementsov-Ogievskiy wrote:
> 03.06.2021 19:17, Eric Blake wrote:
>> On Fri, Apr 16, 2021 at 11:08:55AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> Add an option for thread to retry connection until success. We'll use
>>
>> for a thread to retry connection until it succeeds.
>>
>>> nbd/client-connection both for reconnect and for initial connection in
>>> nbd_open(), so we need a possibility to use same NBDClientConnection
>>> instance to connect once in nbd_open() and then use retry semantics for
>>> reconnect.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   include/block/nbd.h     |  2 ++
>>>   nbd/client-connection.c | 55 +++++++++++++++++++++++++++++------------
>>>   2 files changed, 41 insertions(+), 16 deletions(-)
>>>
>>> +++ b/nbd/client-connection.c
>>> @@ -36,6 +36,8 @@ struct NBDClientConnection {
>>>       NBDExportInfo initial_info;
>>>       bool do_negotiation;
>>> +    bool do_retry;
>>> +
>>>       /*
>>>        * Result of last attempt. Valid in FAIL and SUCCESS states.
>>>        * If you want to steal error, don't forget to set pointer to NULL.
>>> @@ -52,6 +54,15 @@ struct NBDClientConnection {
>>>       Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>>>   };
>>> +/*
>>> + * The function isn't protected by any mutex, so call it when thread is not
>>
>> so only call it when the thread is not yet running
>>
>> or maybe even
>>
>> only call it when the client connection attempt has not yet started
>>
>>> + * running.
>>> + */
>>> +void nbd_client_connection_enable_retry(NBDClientConnection *conn)
>>> +{
>>> +    conn->do_retry = true;
>>> +}
>>> +
>>>   NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>>>                                                  bool do_negotiation,
>>>                                                  const char *export_name,
>>> @@ -144,24 +155,37 @@ static void *connect_thread_func(void *opaque)
>>>       NBDClientConnection *conn = opaque;
>>>       bool do_free;
>>>       int ret;
>>> +    uint64_t timeout = 1;
>>> +    uint64_t max_timeout = 16;
>>> +
>>> +    while (true) {
>>> +        conn->sioc = qio_channel_socket_new();
>>> +
>>> +        error_free(conn->err);
>>> +        conn->err = NULL;
>>> +        conn->updated_info = conn->initial_info;
>>> +
>>> +        ret = nbd_connect(conn->sioc, conn->saddr,
>>> +                          conn->do_negotiation ? &conn->updated_info : NULL,
>>> +                          conn->tlscreds, &conn->ioc, &conn->err);
>>> +        conn->updated_info.x_dirty_bitmap = NULL;
>>> +        conn->updated_info.name = NULL;
>>
>> I'm not quite sure I follow the allocation here: if we passed in
>> &conn->updated_info which got modified in-place by nbd_connect, then
>> are we risking a memory leak by ignoring the x_dirty_bitmap and name
>> set by that call?
> 
> Yes, that looks strange :\. Will check when prepare new version and fix or leave a comment here.

x_dirty_bitmap and name are not set by nbd_connect, they are IN parameters of nbd_receive_negotiate(). Their allocations are owned by conn->initial_info. So, here we've copied pointers into conn->updated_info. And then zero out them, when they are not needed anymore (and actually, to not store them and not finally return to the user our internal allocations). I'll add a comment here.

> 
>>
>>> +
>>> +        if (ret < 0) {
>>> +            object_unref(OBJECT(conn->sioc));
>>> +            conn->sioc = NULL;
>>> +            if (conn->do_retry) {
>>> +                sleep(timeout);
>>
>> This is a bare sleep in a function not marked as coroutine_fn.  Do we
>> need to instead use coroutine sleep for better response to an early
>> exit if initialization is taking too long?
> 
> We are in a separate, by-hand created thread, which knows nothing about coroutines, iothreads, aio contexts etc.. I think bare sleep is what should be here.
> 
>>
>>> +                if (timeout < max_timeout) {
>>> +                    timeout *= 2;
>>> +                }
>>> +                continue;
>>> +            }
>>> +        }
>>> -    conn->sioc = qio_channel_socket_new();
>>> -
>>> -    error_free(conn->err);
>>> -    conn->err = NULL;
>>> -    conn->updated_info = conn->initial_info;
>>> -
>>> -    ret = nbd_connect(conn->sioc, conn->saddr,
>>> -                      conn->do_negotiation ? &conn->updated_info : NULL,
>>> -                      conn->tlscreds, &conn->ioc, &conn->err);
>>> -    if (ret < 0) {
>>> -        object_unref(OBJECT(conn->sioc));
>>> -        conn->sioc = NULL;
>>> +        break;
>>>       }
>>> -    conn->updated_info.x_dirty_bitmap = NULL;
>>> -    conn->updated_info.name = NULL;
>>> -
>>>       WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>>>           assert(conn->running);
>>>           conn->running = false;
>>> @@ -172,7 +196,6 @@ static void *connect_thread_func(void *opaque)
>>>           do_free = conn->detached;
>>>       }
>>> -
>>>       if (do_free) {
>>>           nbd_client_connection_do_free(conn);
>>
>> Spurious hunk?
>>
> 
> wull drop
> 


-- 
Best regards,
Vladimir

