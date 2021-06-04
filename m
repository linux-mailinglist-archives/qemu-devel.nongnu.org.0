Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9437639B21A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 07:41:24 +0200 (CEST)
Received: from localhost ([::1]:41138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp2aB-0004dN-KW
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 01:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2Yh-0003no-GA; Fri, 04 Jun 2021 01:39:54 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:20961 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp2Yf-00010f-Fd; Fri, 04 Jun 2021 01:39:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBjDNexuCDlpJVVBg5G6q4Qj7dHI2kYQcFwbR27mUQQhNxboSFFvT0Ae6OfmoTKGC5JjIoNOZWLgR5Mql0DIr/L2gNP9Bu9n7HeffZuKbX32zJelyWct6VcZHGvU6VfGV5nQp+Niuzc8mJHzB8Ubwe6yb+792WEHjprGEBNC6TkwTzQV+oer2pzdnjkXUgT+Ep5sHYh/7zDBJeIoGE2c9Eb5mnuvqZuFb9Tqe0YUczJi6xHmywLnJ4NLvkZSO1y3VVQQBqhBn6tscX2HNNwnPX5Mtx4VRAOV3HkV26Ei+udkahNXNr7EYdDY0lmpamBSFgjpjQc3YMo92gJcmLaUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pkf0coJDMgcrtBrTMAW+qIBJgthbc4EoVaSPlAbV3dc=;
 b=B1I7R0oB1ThgtUJzlrY+eE2GlP53cgk7KYBBmGjS139jbbuhvMKb6lWouXDQhOa5MygNYUdsAvsvzYJKG75hj8CU6ezukZuSnmK8ccTWLtBs8Gb9kksUFD6owAyKFWoOiI4xrBe3sNjAv1i8RwoZVSMKH65JMUeX9UQhFuIEtAKGXWqukMA8eM88RzLkWYse2HTzcobxyj3qe9hJFwtN8rwX08IYsWNimbN7unj1/n2EYo2d3DJJBCkZCiaAcTvQ816fFDi32+sYsXy6DuPdf7sypLLaxO9jRuUWs/AT1ReQegZU/ScZ8au4sud7Il1fQS0fL85tWJcq2yOR8d6Svw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pkf0coJDMgcrtBrTMAW+qIBJgthbc4EoVaSPlAbV3dc=;
 b=At7DlJBY97ckSxRe8fYwbigk0tEzQ+gQjFmRkTPGB+WC+bu25VhSew1jyHZG/e/V7HpAGreW5qL/zp5AVrISJk+HPpTLS8304nuIVae4eYJalcsf1JGDyCH6MT2EreqlcRxePPQubL5RFwN942NNpWIp3RLKEWPfYOg/zhaNdew=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6742.eurprd08.prod.outlook.com (2603:10a6:20b:351::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 05:39:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 05:39:45 +0000
Subject: Re: [PATCH v3 33/33] block/nbd: drop connection_co
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-34-vsementsov@virtuozzo.com>
 <20210603212746.45kjkbxit62w3hup@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ccaecc79-c8bf-deb1-4910-f42b504d55ce@virtuozzo.com>
Date: Fri, 4 Jun 2021 08:39:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210603212746.45kjkbxit62w3hup@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: PR0P264CA0198.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 PR0P264CA0198.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Fri, 4 Jun 2021 05:39:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 401543f0-9214-4bf4-ba76-08d9271b2895
X-MS-TrafficTypeDiagnostic: AS8PR08MB6742:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB67420BD440FD16C2220F427CC13B9@AS8PR08MB6742.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +5+pGCAATkjn6I/7SzzisadVr0a3PqOnoO+2thd6tXM/k6QLfTtZs6u4h8cfGy2V67j4waAhVP1dvIJV3l90N9tT5kawyoXs6Tqfwxl2wJno7NWIT42IqSjWLeTk2fIzybvr6w8XmLq3WDZnSuo/KYGEfwTmxZ08d9B3QXOYm3nq51kueDFKZT5iMu0GQH4RM5N6HKpsLDvrfe3p0HjdKZ2QHmqfuR+nyWhEOY+zHhN5XC8Y8WGhVpgGb4ptrweY8QBosJOebFLkRG/UZ30bjI4+LPkM6agarLypeAx4HwfZkGWpIC+Ouje/GaSlYu7ELkFF6GP3sm1K6MLqyepo0b/ByCi3qcfPwHYyiaX8MEOCCPbyNJIqyKp2xQ5gOeoroKmK5xZVEENy9+PbUsSQ38V/lHUSEUZR0XY0kAMoesjXqYF5Zrk5zQ8jWonrKngWrsy8qR6QJzuzlX5iiFOzhIi0Z1Rf2KM/2bUbO3w+H9xlZeE/IFfdkjOhFyr1EnCSjCQ7svCF4I/pf3p8Krv9Mb/GibTz3eEDiPUWG/g5+g5OXWP3uRJR+bQWufrrT0GB5f/HjGA/YAjRSjGFDdfqv7LVpYMTB1r5AnHA1JIJFzqYfI9CPeKf06PlvKWQUkJzcgbg1V03HHfXMm66zo4TvIBhxNuNRziPqRLivTdU24TZ5XlLZSyAqECnpIoppZZ++Rp9gnHaXdZRBDD2Yp3KRcZiDndqpv1Dwrrjrg4633c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39840400004)(396003)(36756003)(16526019)(186003)(8936002)(6916009)(31696002)(6486002)(316002)(86362001)(5660300002)(38100700002)(38350700002)(8676002)(478600001)(26005)(2906002)(52116002)(4326008)(16576012)(107886003)(83380400001)(31686004)(956004)(66476007)(66946007)(2616005)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YytBTEJmYXNmcURvd0pZTjl5S2UzNmtoOGI5QWJKYzhFdmRyTE9BZUZLRVBq?=
 =?utf-8?B?WTZjSHN2RUIycGhweTdhM0N4SElMSlptdkRuaWgveVdCVzBpcnRjQzROTXpR?=
 =?utf-8?B?QUw4MnZtYzVWNDVCWENkd2dMWUcwVWVxZ1pGYWx4S1RrRVJKdzFhWWJjS2w2?=
 =?utf-8?B?UGs3VDZCOUtSNGRtU0RpQXdhY3BKZ1JCY3VWczFIcTNKNlloQkdtdEI1TlZQ?=
 =?utf-8?B?OE53RG43WHhRRDJuWFBWZDdFbVZqMVdvaEYxTGxCTmE1QXBZN0tXSDI4Slc2?=
 =?utf-8?B?K0F5blRaZVZNbmVkNEdCU2xhdU9iWWk5VjRDa2lrNTk1L1BQUUhRS3QwTE5M?=
 =?utf-8?B?NUZBUmE2WlYrZEN1aEVmNU9YM21qQkZtTUJGV0VjQ3RFUDVrR1FYQktsak91?=
 =?utf-8?B?Qjdra0F4WFZFWWJTdFdTWXRxN3dHaHFiU1lmYTlic1c5NVZIeVpYdXdiYnB3?=
 =?utf-8?B?NXllTEFwVnVlTmxKMDdoUU9GNW9jZzczYzdWQVY3QUFoNjV6T1lXL2k2NVd4?=
 =?utf-8?B?L2FaQnBaSVp1bVZNVnhkWDc2OEd5TXZnS1VZTkhXTGlxRW1Rb2RmcWNscGo3?=
 =?utf-8?B?Y1hOM1NzYjFwWi9ham41a3M0M2Znb3UzWDR6VE5zSlpOR0Viejd4K1NLQ01v?=
 =?utf-8?B?S2d2T0Rjb204ZWxsR243N01BOHBtcnNWWm1SVnc0MHBxS1JiRjBNNWxmRnln?=
 =?utf-8?B?UlRjOThDbHFlaWE2bFJQbE43ZjZpWFRtZHczMks0K000ZXJ5OVZtUjJtb0pE?=
 =?utf-8?B?b3FaTFdWTEZQRGZUelkrSHFidmU5VzZGRjVQSGtMWFl1bWREUUo1NHcwS2Fh?=
 =?utf-8?B?Q0dHODFzTkdDVnBQd0V2N1RhM3I1bWZZUThxWHVETEN3b3BJSzdTZG1zbEVy?=
 =?utf-8?B?UTV5ZmMxNFVxOVlZeFduU29qc1R0d2hBc3Y5UlVNMWRIdkdmY244aWRLeSs2?=
 =?utf-8?B?aXJPSm40aERSRTkwOUxBWFJ2N3cyUWJwam52angvSnhCUGxZL0JZMVhuZVht?=
 =?utf-8?B?YlFZOVB5VWp4ZDViNmpmSzk4TkhZcHVFMHFGcTQ2SGJTRVhxNEluSk9RTjVT?=
 =?utf-8?B?M1hUeVY3UVBBeHU1WCtLVzBNdjZDQkJ1WHhBTXJkcGJNTDdTOHpOU0RVWS9t?=
 =?utf-8?B?VjQ5c0JBT0FScTNWVjNqc0k5eEtXcElGeGV1T211MVUrcThocDdLOGZOVmlH?=
 =?utf-8?B?T2dJeWRtM0VBMDluUlN4WERFUXZiMUxvbWxKZ3RiRkxGTktxbUEvL1Z4bEwv?=
 =?utf-8?B?aExWc0h2dmlVSnpHWHNCaUFtaEdpNCtaN2NBTStadzlSdmlVY09Od253S0lO?=
 =?utf-8?B?TkY4aW4ySjRyaGl3Qm1JZXJJdmloSEhWNXRhRVNkenlpMmFaZHlKd05PaTRT?=
 =?utf-8?B?UFloSTd1REhKNngyamJzSG9oRG5sQkhMQjVHUDVmUEVOaUdIWmZ2dyt2VHVB?=
 =?utf-8?B?UEhsOEl3Z2txRDhlUndTaW9jL2U0Q0tkU1dwV085Z1pwdHlKeWdPcG56c3h1?=
 =?utf-8?B?ek41ZUNGc2hSNUZwU3J2SlJTaG4rN09UNFl3d0x6aVlDUFhRNkZwejZqWEpu?=
 =?utf-8?B?L0VyeTQwMGNoSENXWTZaYjY1RmprVmhFSEpzY0o0RkFqQVNtbzZMUjhjSE1W?=
 =?utf-8?B?SGlwamxMendIUDRIZ1JaOFBzOGc4cDhIamZKMTNRRUZRNy9aa3JVRXc0Q2Mw?=
 =?utf-8?B?aW9DSHY0alFRUTRZNnIyaVhGNUwyQ0lVaHVQTGY4NVJhMzgzT2NpR2lwaEN2?=
 =?utf-8?Q?rVP7ZOLNT39Yji5s88UJxpsAZCFf/n8fWNOug4g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401543f0-9214-4bf4-ba76-08d9271b2895
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 05:39:44.9013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsAzWUeURWx4bHLBaaOLujRJG2rqMUzMdZXjd69KJ5kBbpoC5N8RXLkmI5x7f/RhFgkfH4vaBbEk1UL8eR3sOEWKCzYqkKnv+bD/dI7hLDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6742
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7,
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

04.06.2021 00:27, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:09:11AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> OK, that's a big rewrite of the logic.
>>
>> Pre-patch we have an always running coroutine - connection_co. It does
>> reply receiving and reconnecting. And it leads to a lot of difficult
>> and unobvious code around drained sections and context switch. We also
>> abuse bs->in_flight counter which is increased for connection_co and
>> temporary decreased in points where we want to allow drained section to
>> begin. One of these place is in another file: in nbd_read_eof() in
>> nbd/client.c.
>>
>> We also cancel reconnect and requests waiting for reconnect on drained
>> begin which is not correct.
>>
>> Let's finally drop this always running coroutine and go another way:
>>
>> 1. reconnect_attempt() goes to nbd_co_send_request and called under
>>     send_mutex
>>
>> 2. We do receive headers in request coroutine. But we also should
>>     dispatch replies for another pending requests. So,
>>     nbd_connection_entry() is turned into nbd_receive_replies(), which
>>     does reply dispatching until it receive another request headers, and
>>     returns when it receive the requested header.
>>
>> 3. All old staff around drained sections and context switch is dropped.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c  | 376 ++++++++++++++++-----------------------------------
>>   nbd/client.c |   2 -
>>   2 files changed, 119 insertions(+), 259 deletions(-)
>>
> 
>> -static coroutine_fn void nbd_connection_entry(void *opaque)
>> +static coroutine_fn void nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
>>   {
>> -    BDRVNBDState *s = opaque;
>>       uint64_t i;
>>       int ret = 0;
>>       Error *local_err = NULL;
>>   
>> -    while (qatomic_load_acquire(&s->state) != NBD_CLIENT_QUIT) {
>> -        /*
>> -         * The NBD client can only really be considered idle when it has
>> -         * yielded from qio_channel_readv_all_eof(), waiting for data. This is
>> -         * the point where the additional scheduled coroutine entry happens
>> -         * after nbd_client_attach_aio_context().
>> -         *
>> -         * Therefore we keep an additional in_flight reference all the time and
>> -         * only drop it temporarily here.
>> -         */
>> +    i = HANDLE_TO_INDEX(s, handle);
>> +    if (s->receive_co) {
>> +        assert(s->receive_co != qemu_coroutine_self());
>>   
>> -        if (nbd_client_connecting(s)) {
>> -            nbd_co_reconnect_loop(s);
>> -        }
>> +        /* Another request coroutine is receiving now */
>> +        s->requests[i].receiving = true;
>> +        qemu_coroutine_yield();
>> +        assert(!s->requests[i].receiving);
>>   
>> -        if (!nbd_client_connected(s)) {
>> -            continue;
>> +        if (s->receive_co != qemu_coroutine_self()) {
>> +            /*
>> +             * We are either failed or done, caller uses nbd_client_connected()
>> +             * to distinguish.
>> +             */
>> +            return;
>>           }
>> +    }
>> +
>> +    assert(s->receive_co == 0 || s->receive_co == qemu_coroutine_self());
> 
> s/0/NULL/ here
> 
>> +    s->receive_co = qemu_coroutine_self();
>>   
>> +    while (nbd_client_connected(s)) {
>>           assert(s->reply.handle == 0);
>>           ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, &local_err);
>>   
>> @@ -522,8 +380,21 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
>>               local_err = NULL;
>>           }
>>           if (ret <= 0) {
>> -            nbd_channel_error(s, ret ? ret : -EIO);
>> -            continue;
>> +            ret = ret ? ret : -EIO;
>> +            nbd_channel_error(s, ret);
>> +            goto out;
>> +        }
>> +
>> +        if (!nbd_client_connected(s)) {
>> +            ret = -EIO;
>> +            goto out;
>> +        }
>> +
>> +        i = HANDLE_TO_INDEX(s, s->reply.handle);
>> +
>> +        if (s->reply.handle == handle) {
>> +            ret = 0;
>> +            goto out;
>>           }
>>   
>>           /*
> 
> I know your followup said there is more work to do before v4, but I
> look forward to seeing it.
> 


Great thanks for reviewing this huge series! Now is my turn to make v4.

-- 
Best regards,
Vladimir

