Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC9739A98D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:50:57 +0200 (CEST)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorUe-0000qZ-IV
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lorTi-0008RP-Qo; Thu, 03 Jun 2021 13:49:58 -0400
Received: from mail-am6eur05on2128.outbound.protection.outlook.com
 ([40.107.22.128]:2240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lorTf-0001Oq-9x; Thu, 03 Jun 2021 13:49:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0qwH4eslUwHXULjA1apW4rMaohBDKU5mIOTb7YA/FnEuyNqkV7uF/K+Te3lE/1tp9P+gGgzVAUobUJ8EhSpwA2PyO8NmASs2zrN17flPERFZL2DELzjAAxDQsstmISwQsY4urxi1fOOxQzJW0f7SHQLuJFiAMQakQQu8TKiIkr4lGFKDBvfOJs89jMx7HPRtwFFI3+G1ZpAH3/3I3s7fWUPqUk6fwUGwpNGtWDGeae0sNeBFLM6jB/ET898mN5Mb8VCrHMxlRU4jEEvztGS9EKiJa3BhwTcwNrLdVDYTWv90H6AQEDIn+GnqzEyw4BhW+VlTUN4vwpwkNhOuU2gng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQz59KY/QBkWHUe0OndlTUSAEi1PdG7KzF74L2EXLO8=;
 b=UEw2A8rra+w7FDrRV0qQlyKObQvBJ07mAtS5TtMxim0Tqxk3+qFMrFzmkmR1tsDs+GKzvUSvfTFn+EVbMz+/P+0qCqA6O6bidVoRX/GbobiO3kyKp+fe0MTcA2aHg3FsBw1n4EJUrFGpSnVNWjEZdUZE7FD4zXmM9a8IgyZddvFmR3UAc0jPnsoJ+41hmoMUYRNdS8kZQD56s0oMEPTEMGluVCjvna/GiK1ZZo1rsmg6Rp9IAh8Y0H4S+nsYQ4o30H1VjNeQD8QJbdAZXjNisjBpzMZgLo7pgnFgIRnOnBdkT/LmDZG5a0AJ2OPRFZ+y1yXybb3tRTGkbiAA+MDYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQz59KY/QBkWHUe0OndlTUSAEi1PdG7KzF74L2EXLO8=;
 b=my9AhzEsDsvYUZKy7iUrQcPlnIYskjmm4UHjZ5kgGgudGoyR2L4FBLDHSQc5STdqPzbZWP1RIIIsFafR9mdgpWD736hqWlN4132luUPOdWanDT/0nKGPbNAUJ2tpxNEDh1JLM6ArLR3iS8g6l8iDAGddmEG3B6GDBAiTF08iWUk=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Thu, 3 Jun
 2021 17:49:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 17:49:52 +0000
Subject: Re: [PATCH v3 17/33] nbd/client-connection: implement connection retry
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-18-vsementsov@virtuozzo.com>
 <20210603161722.benugy4v7jsropwv@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a7848468-3932-4ed6-884d-64a1b1813ec4@virtuozzo.com>
Date: Thu, 3 Jun 2021 20:49:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210603161722.benugy4v7jsropwv@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.243]
X-ClientProxiedBy: PR1P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.243) by
 PR1P264CA0028.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Thu, 3 Jun 2021 17:49:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1321502f-35bf-4beb-9952-08d926b7fd40
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB178033DBF223B2021D82CA11C13C9@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eIHlHc3jCHTia+Y7etVYlHBj97vP3gPr0yZ/lUy3YLh5KzZ1o7daU93ZLojqnY3T3w1NIAhSTUix7hb39JThnO1WZ9Ga8X42mmIOjm53qB4UNlN1syKyWw5W5/NQr79WinNVl9OisH7Y5CqnMy5rKFN/OlXP9fYwNkDuUCkTg97HnNOhICkdh/NtwGOLM7C2lGT0GhLLF0qDCXeTkWihotoiClC/nk65bHqTghS7L+irAT96oUWxQzbN9xVZ3gKn5/JLcQbEfdlQrzIDFdeaj5RG/eLL512mD/BQnA5mAaRI+1pmuMWUOK0DLChu8qlW0WTZ4WFRg8U51/huOaYU/3jaHA/cu8LcBp23+ptZBkbHf80HX5T89BOOPKebDdjIuVq6n940AUglGrkrVHvk6DPWIuwyatQhnZgTwKikGnmYVGiJR0ufG1MIQnd593jIGpRCvWGAIJK0upyUzcKRvIOitwn2Af96d44yf2PGlr5mOmE+Oz6QMiFQYqf7n1wPsD5ukpPg+yR/PqkMLQcJaDwQKxKVyzegwkpdGvWZODxH9P3PnSOy6Sq0Tb5VHxhSuBcJ/txGRztxLMFh7J1eZVN+v6cnmDrMODU8YO5x170ctwFacy6eErcbI6AOUr6YIyasO3KpWIsJhu2El58Mp7k10TsKmnAsOWHWPW0pRSmuAgmTJsggVmLoUXZiXQkXs4ZgXKYDeSfHCVMTMJehScywYF0jwGWBE5W4gsNho1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(39840400004)(346002)(5660300002)(2906002)(31696002)(6486002)(36756003)(66946007)(2616005)(956004)(4326008)(186003)(478600001)(86362001)(52116002)(66476007)(8936002)(16576012)(6916009)(31686004)(316002)(8676002)(38100700002)(38350700002)(66556008)(83380400001)(26005)(16526019)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TjVCTHZ4VHQxUmRlVVVFRktxS2lCdGMycnpSSmNtOC9VSjRsZWZhNTdXOTJS?=
 =?utf-8?B?MlhUMnozc0MwNlM1ZDIxYldRV1QvWjl6NHhVQ044TjRzUHBjK2R5eUdhVEpp?=
 =?utf-8?B?dHZxejZPbi9VMi9HR1d0VGVxS1Y2bzNFWW5XZ29uKzI1U0xSNDZSNU9JQS9X?=
 =?utf-8?B?VSs3NlZKNDVTaWN1NGtHMVJwM1ZaT2IySEt5Z1hka3FtM3BsQm5XRURodEdJ?=
 =?utf-8?B?OTlTdWk1RUI3WHlQaXZqWWF5ckQ4OUJMRDBESytjOVBMOEFhbFNQQmpqdXNs?=
 =?utf-8?B?dU9IelVmUGFOZHhaMEpYRmcwOVYyNVk2V1k3YVZXWGwybmxjcGdnTTQvSm0y?=
 =?utf-8?B?SEEvOXFZMU43NlpqeVp4VE8xMkVRSmFMQU9yeHdiUkFhdm8vd2NQTDUwUXY0?=
 =?utf-8?B?NVN1UkxWMUcxOXFPcUdTV2NERnRHMEdJTlBSR3Uya2RvNUJTTVpNUUZyTTFZ?=
 =?utf-8?B?TVhObVhDenk1dC83ci9KNDJ4OW9Vc3JGaTdneC9QSjlnR3NwampOQ1NDVnJa?=
 =?utf-8?B?cmJ5am9raHhlOG5JYXNOdVgyOXE2bnJkRzZsUDZkZXEyV1pua01ta2RmQmxx?=
 =?utf-8?B?bFcxNEZONElVa0dncTBKM2tnbk9HRzZnbHdLTE1LdldyMzZudlpWd2ZMSDVj?=
 =?utf-8?B?R3dYRDh0VEdRMmtJZjlsekg3ZUhnL1NDbUdoaHcxcEZsbFlreWZ5MlUwcU9y?=
 =?utf-8?B?UUtQR3YvR1Nvc3VNWGdXWDhtOUhhblBtNWZ1dE9KYlFKeElON0RWbUFNZUNy?=
 =?utf-8?B?akRpYUVGT2FCc0EyOXUvSVNML0xxSWN5SE9CM1RjVDJ6MkNka05xbHpmVUZr?=
 =?utf-8?B?YldWYVBsUUgySjBKT0M5d3UxcVY3cnA4VEVWdnk2Vmw5ZUxhUEFlYTJJSWp2?=
 =?utf-8?B?eXdCKzBQNUNzclUxV2kxd3R4ZWRCQ1VHL3JJbjg1bHE1V1NCYXpld21EU3Js?=
 =?utf-8?B?OU1kY1VEakN6RUdRME80eFMyZW9GK0NqS3B0YllvZ2o2azY2M1crV0pCK0JB?=
 =?utf-8?B?NGErTUJJdDlybSszdFc3eWtoWFlkQWpjTS9heW5qNWpvbkF4ZEN0SW5LVU9m?=
 =?utf-8?B?M1hQOHhkeVZNTHB2MEFrSmdweXVRNWFWMklNckwwK04wVFJGSjdmanVxY21z?=
 =?utf-8?B?U2JVb092UUpLdTJGNURSOVR0RjRXclBvdVJiR3JVNVVRaWJhQlJwSVJmN2VP?=
 =?utf-8?B?RzROdVV1ZjRqbzRxN1pVVmFmbXUrMXMwTllVUEp0R1JxblczTkdOd1FEdzZS?=
 =?utf-8?B?bkh4U2RCaURDc1F0NWtRWnZodHk4STNVMDlPZHFYZ1FTT2tBU1M0YjVPdEg2?=
 =?utf-8?B?Zi92ZVBYeHZ3SWhZdjBZZitrb2JQdnJlQ2RNUlg2ZWE4U2pZZTJFRmhZUkhE?=
 =?utf-8?B?M0dpdjRTYlU2Q2x0aWVsTEl2UHNVSVFKejJnaXdiNXhjei9FNXRqNXJQSnRj?=
 =?utf-8?B?ejlaZ1RVWlo5TTNxQmwzdkVaMVJITWRQZHZOMytsMUM1TTVWblRnNkdYenRT?=
 =?utf-8?B?NWFrb3VCb2VWRy9XcGlBbnQreXNyaXJMQnI4YlpkaHpNZFVhQ2tQNS9UOTZ4?=
 =?utf-8?B?QzdYRzhjUTVJdi9sUWFyelVTVzY2N0VZVEJWVnhEQkcxSmtCTnlCcFpTOVg5?=
 =?utf-8?B?T1JCV1ZaNEhRRHFwRHo3WDFEbEtSejlzUkh3TEgwYlVwTXIyQW16Z3VBTjRT?=
 =?utf-8?B?dFRRVS9YRHVDRVlTMVVic3ZNMzk1MDJZd3hVV0E1UDdPeXprVEpkRDdpRzJ4?=
 =?utf-8?Q?tCXMrS4zMGzlr8czvKiKGiR+iWTiHWJuuyuzixN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1321502f-35bf-4beb-9952-08d926b7fd40
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 17:49:52.0948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIwzMccIQTLc3cPdNqzDAQeq0atW5rrOv27l6WRMzNgpKvBEVmisKlXbHgQCNKsAcKhl5ba+KYUAIYqiJZer1H/CZo/dqHlcisacfUC8jvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.22.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.06.2021 19:17, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:08:55AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Add an option for thread to retry connection until success. We'll use
> 
> for a thread to retry connection until it succeeds.
> 
>> nbd/client-connection both for reconnect and for initial connection in
>> nbd_open(), so we need a possibility to use same NBDClientConnection
>> instance to connect once in nbd_open() and then use retry semantics for
>> reconnect.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/nbd.h     |  2 ++
>>   nbd/client-connection.c | 55 +++++++++++++++++++++++++++++------------
>>   2 files changed, 41 insertions(+), 16 deletions(-)
>>
>> +++ b/nbd/client-connection.c
>> @@ -36,6 +36,8 @@ struct NBDClientConnection {
>>       NBDExportInfo initial_info;
>>       bool do_negotiation;
>>   
>> +    bool do_retry;
>> +
>>       /*
>>        * Result of last attempt. Valid in FAIL and SUCCESS states.
>>        * If you want to steal error, don't forget to set pointer to NULL.
>> @@ -52,6 +54,15 @@ struct NBDClientConnection {
>>       Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>>   };
>>   
>> +/*
>> + * The function isn't protected by any mutex, so call it when thread is not
> 
> so only call it when the thread is not yet running
> 
> or maybe even
> 
> only call it when the client connection attempt has not yet started
> 
>> + * running.
>> + */
>> +void nbd_client_connection_enable_retry(NBDClientConnection *conn)
>> +{
>> +    conn->do_retry = true;
>> +}
>> +
>>   NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>>                                                  bool do_negotiation,
>>                                                  const char *export_name,
>> @@ -144,24 +155,37 @@ static void *connect_thread_func(void *opaque)
>>       NBDClientConnection *conn = opaque;
>>       bool do_free;
>>       int ret;
>> +    uint64_t timeout = 1;
>> +    uint64_t max_timeout = 16;
>> +
>> +    while (true) {
>> +        conn->sioc = qio_channel_socket_new();
>> +
>> +        error_free(conn->err);
>> +        conn->err = NULL;
>> +        conn->updated_info = conn->initial_info;
>> +
>> +        ret = nbd_connect(conn->sioc, conn->saddr,
>> +                          conn->do_negotiation ? &conn->updated_info : NULL,
>> +                          conn->tlscreds, &conn->ioc, &conn->err);
>> +        conn->updated_info.x_dirty_bitmap = NULL;
>> +        conn->updated_info.name = NULL;
> 
> I'm not quite sure I follow the allocation here: if we passed in
> &conn->updated_info which got modified in-place by nbd_connect, then
> are we risking a memory leak by ignoring the x_dirty_bitmap and name
> set by that call?

Yes, that looks strange :\. Will check when prepare new version and fix or leave a comment here.

> 
>> +
>> +        if (ret < 0) {
>> +            object_unref(OBJECT(conn->sioc));
>> +            conn->sioc = NULL;
>> +            if (conn->do_retry) {
>> +                sleep(timeout);
> 
> This is a bare sleep in a function not marked as coroutine_fn.  Do we
> need to instead use coroutine sleep for better response to an early
> exit if initialization is taking too long?

We are in a separate, by-hand created thread, which knows nothing about coroutines, iothreads, aio contexts etc.. I think bare sleep is what should be here.

> 
>> +                if (timeout < max_timeout) {
>> +                    timeout *= 2;
>> +                }
>> +                continue;
>> +            }
>> +        }
>>   
>> -    conn->sioc = qio_channel_socket_new();
>> -
>> -    error_free(conn->err);
>> -    conn->err = NULL;
>> -    conn->updated_info = conn->initial_info;
>> -
>> -    ret = nbd_connect(conn->sioc, conn->saddr,
>> -                      conn->do_negotiation ? &conn->updated_info : NULL,
>> -                      conn->tlscreds, &conn->ioc, &conn->err);
>> -    if (ret < 0) {
>> -        object_unref(OBJECT(conn->sioc));
>> -        conn->sioc = NULL;
>> +        break;
>>       }
>>   
>> -    conn->updated_info.x_dirty_bitmap = NULL;
>> -    conn->updated_info.name = NULL;
>> -
>>       WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>>           assert(conn->running);
>>           conn->running = false;
>> @@ -172,7 +196,6 @@ static void *connect_thread_func(void *opaque)
>>           do_free = conn->detached;
>>       }
>>   
>> -
>>       if (do_free) {
>>           nbd_client_connection_do_free(conn);
> 
> Spurious hunk?
> 

wull drop

-- 
Best regards,
Vladimir

