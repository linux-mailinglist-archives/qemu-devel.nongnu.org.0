Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA737B650
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 08:43:48 +0200 (CEST)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgiax-0003Yo-Ai
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 02:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgiXF-0000vX-5g; Wed, 12 May 2021 02:39:57 -0400
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:55164 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgiXD-0003qB-2l; Wed, 12 May 2021 02:39:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPD873SKlHtcts1xYZ/2Pfwi68EccIgX1jeQt4FeUkLmwFrzMY6LJpr/gKsQEohQrjSpAhmvVVfnZIzfS776o8z7ggtdBQSZq5HF1PoWN8zjQF0Hb/BAoaYa9rIYTtLqF+o59WPfXMn/ipqtpOegvB3l5mFDJpK9oMxHTejRNoqZ8JMPfnP2Mg/Y79n4oyKduZfsDERPX+LFfbHTHMAeisrRLX1pQrjPFDXu3puh4tVNaRNXQN3uvy3A3RnP6qyC7b9VN7BHKF6tAWlyi2/9BfPLxBOlcMLnizOD3n1wewKPZySzJvYWtzmY/QsRPYqsA08uOCbrn4MC4SqkjhIeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmqbOLWX1b8jKnhaDMRqQ239ZTSfD0STWx+qYmTaYcw=;
 b=F5qVK9gN6Cd9/Y/inKY47ALl8Hrb9hIVRsCysB24rnO+p0VPgUDg1djpFNeH4sfx5ktg1gk7Olk/j2m4rW2yZ7Av8nkF9DHsh9q51MUgKWDVhC0HXopLEj+yx9mXUUotULmA5m3IfqNLRidKz3KRud7Ab4lPsQRBXkDN8sJn3caCUjWyAaC1NPrUOojvwriNJN4t6aygXi5vG6+3cWgZLs4YuO7xo4DsNMevGCm4ygO1mYkLcUGdkAuZbQPjsHbnpWFXnKRcex6WCGBWKRtcHL/h3U3D3AZkXb816nMVSGH4P1S0IjA8xqxwFbzXBDEMDM3BVyp6TaWUaGW17QL33A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmqbOLWX1b8jKnhaDMRqQ239ZTSfD0STWx+qYmTaYcw=;
 b=L3BbQpbVY7O5n/PDSlYPiXyHG7HlYDH7BI4kvX/kHb/7le3nReIxvzQIcEpyelM6jER6oJDhVh8rM/H5Fea00Zwm+LuMOOC+gi3Q7LBj2QBggwMOV9VDR4wkWztflkR6UTtDJlYHETwlJlieA5eRNwcoIXB/rrEyvSUnNC+TDww=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5383.eurprd08.prod.outlook.com (2603:10a6:20b:102::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 06:39:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 06:39:51 +0000
Subject: Re: [PATCH v3 18/33] nbd/client-connection: shutdown connection on
 release
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-19-vsementsov@virtuozzo.com>
 <YJryStl6HOR9VJIa@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fec856de-514f-f83f-0043-81e603746d59@virtuozzo.com>
Date: Wed, 12 May 2021 09:39:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJryStl6HOR9VJIa@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: PR3P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 PR3P195CA0026.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 06:39:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 609b54b7-2654-423b-da2c-08d91510beb1
X-MS-TrafficTypeDiagnostic: AM7PR08MB5383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5383C5CC74274DDDFD19B29AC1529@AM7PR08MB5383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UFWgfqVUdqEuyzAxbt3vqbNVjMI2F9Aht1znxHt+aSfwEWlpR9gkgMirkGyn7Eqpo3M8/EXe8eIcoYwiRdtZiwBMXFUyWbbS1uy38iO0e8vd89/ISPnXBCvX68AIf9Ozk5rSruRUUgO+joh5bVxCA7cn5vVHt5wp6Gtrm7Iaka8P+EdwEfbKp6lRskl7CKKZJvM2KoftTYdp+Sa7bQan/Dn5w0tDeQNzFUh7Gl45pyHXTFqEeZvWgfYAbdAta5lnXOHVLkyFAvYXJNwMy4/6KXtaww2Fb5V4I+RK4zBEUXncRADD/Zak7EHBv0Y4k4Zf4BGqib7OhbEUgQCgJ+ln87vLt6cgUaq9KLSs/89q6yWtYhNZ4plHifhKd63S3utfJcpMY5WP58xsbi0ivP4WS+iYdGTThEYfQsb0xzDcvJDXtBlh7Kl+pzgHroMbjWlVZi5C1/q2vZ8H97E8diY6RmhHaxtYzJtI29zGIfmFRfyqPMvfntO6ezv8y82KTTrmRyjSFH1ilb+nTSyshF4VVqu/LU+lc0fKtbPiNqngrqr+BqKLDcBUXq+pM8z2l3bMcCLd04qKMPYvPrFSxmEtbSVN179xDC1hfw4AFhqBDg4zLj7OAh6utL2MGNTeLFpov03vcEFqjWtads2mL7Olt3iuCEYVbf4q0uY7KCE18ZYXLH1mUTtXundW3t9zI7rVnlPrnoYJaLokbVU8EcYnJSIvQ7uEbnMJBjE1Cslr45E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39830400003)(366004)(396003)(376002)(66946007)(8936002)(31696002)(16576012)(66556008)(478600001)(6486002)(5660300002)(36756003)(83380400001)(186003)(16526019)(66476007)(316002)(86362001)(2906002)(52116002)(38100700002)(8676002)(26005)(38350700002)(31686004)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bkZ5WFZicVJaTW9jOUxndzkzaHNrNzFndW1zNU5idUV4MDNRaFd6S0NCd1lU?=
 =?utf-8?B?dWVhNEgvQzNUZWVmZjdSUmV4NDlSZW05WnJZNFFYZVUzMGpQMWxBL09sNGNp?=
 =?utf-8?B?MUhNVGx3ekdIR0Y5Y0laZEgwQ3hPWGhPcFIrT0F6QXl3dmRhK2hUbFhRK2FD?=
 =?utf-8?B?bHRvTlVHZzcrNTB1UDJxNXpGZHVqNmlBLzZHcnZINjNwalJrQlFYemFNQ1ZE?=
 =?utf-8?B?V25Ea1JIUXo1TkRjS0pDNC9OeDlXelZFeWp2MndMT3p4V2t2L0ZOWkh4R3ZU?=
 =?utf-8?B?cjYrcDJTSWdqaThzdGpuMG5ueEwzV0JWd3M5b3UvMlZ3M29Gak5rc01aRWRW?=
 =?utf-8?B?TDVEV3liZjhzem1TeVk4Mk1wZG0xdzkvbmpnWWJOWVF1bmlkYUN2VnVWNmRn?=
 =?utf-8?B?alVOZ3RFUytzZ0pXNzRKclFXdFVOUGRqV2RqcUVTWDJpcFZseWFWRzE0SnJn?=
 =?utf-8?B?cDFXQWlNMTg2dEsvb3k5WmpDMlUrWUpTaG5EeHR6RzBMM0dHVnB6ZC9wbThC?=
 =?utf-8?B?RHJ6NFVGNjFGOEdOQWlXbkI2YVlhM0puK0hPQWFKUmN3aDQ5QUk4RU1JbHNy?=
 =?utf-8?B?azIrcmMxakhQMjRYM0hRcHJJZW44b1JLYWZ6QzNDQmhvUVNiOVAxZng3MjZs?=
 =?utf-8?B?RHNxNVJZRVBpRUI1REdVNDZQSWgwbkY4OEVVS0JydW5wdkFXZUxiRjJHUkkw?=
 =?utf-8?B?SnZiSTN4UHY0UC9LYUgvR2NyRml1amhtVngvbm1uSTc5WjE3Z3I1SWhZMEw4?=
 =?utf-8?B?ZTJGM2FwRE11U1JJTHBSL1QxdXh6Qm1Cc0pCUWlHUWNCbVhuVFJqUFVMOXhM?=
 =?utf-8?B?YmdGY09UcEVuOE5GcW1kdjdPV1RIU3l4WGJFbW5icmJ6NVQzbHd4eUZuQW1B?=
 =?utf-8?B?amdRditva1BrKy8wbDJtbkNQZDBMSzhTdlJscW9ySjB4bC8yd1lQWVh6eDgy?=
 =?utf-8?B?Vy93THU1SEQ1UUlZRjVHc2NyY2kvRnNwcnpvVFhwd2pqWjF5Nzk0UVpEa3Q1?=
 =?utf-8?B?c3g0Q0lTL2ZFQmo3eGdTNmZaU2hBWjl0NTZCZ1BlZDJDODhVa2pTRFdqVjNV?=
 =?utf-8?B?NGIxL1RDZ2NCR2UrbURIbEpoZkFZQ1dybUtsemY3WkVWQ0lLWUVySTM4ZG9B?=
 =?utf-8?B?Qlg4dkpUZWJMWFhXbzNRNTJvQ2I2Nlp0d21PRlBubjNRZ3VxemlyUDNNL3BG?=
 =?utf-8?B?ZmRMUFBMY2FwbXhVcGg3czBQK0RqZ3pJSnl6N0JxaVJyN1VndGowUm5FeTlH?=
 =?utf-8?B?REM4US9Zb2hMdjBsR2xiMG1YOTdEZEVPN3R3V1prUGFmM3dHNFptMWhuQWFH?=
 =?utf-8?B?RExNZGxyVFdpRFBNVGxqZ2wxT3BlOURsZjI1U0FxaUVCK21KbTc0UXpJRnFJ?=
 =?utf-8?B?RUtDWXRqbDYzd0ZVR0FCRnJjUXhjMVV1N3I3cmJUUnU3V1Q0SXBGeHVCdUdr?=
 =?utf-8?B?NE9MU2wyYW1ZVElNQnN4Wkw0MldOMWNqWEttNy9iTE80ZzFFV244d0NUMmRr?=
 =?utf-8?B?UVV3ci9KcWp0SUh3cU5tK042N1ZzdGx4bjlXODVMSGhveEZYTVViMzlRUGdS?=
 =?utf-8?B?UEJ4RG9seTBQMGw0Zlc0SFRWcTJMNnlnWUZwWlZERW8vUlh1eU8xL2xFZkFw?=
 =?utf-8?B?ZlV2dVQ1eDA2TkwzbFVwOTJEUnJSbEdrQzhzclhrQXAvSCtGWXZjeHBzMGd4?=
 =?utf-8?B?Rkl4bEJMV0JKQlRtU3A3QmgvK2xlNFpXZnpHYW8xMTYxRjNJemliQURlbmVt?=
 =?utf-8?Q?zk2H9jiGCizvRyfjEZvAotQFqU/hGI6FuloDfWL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609b54b7-2654-423b-da2c-08d91510beb1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 06:39:51.3538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmPmPsX4l2TqWy5Coq++YjWwxTq8QbFdjmQDSymck+IvFHloCSqXeppPJAh8+OqgebQ4CZ76rfHqYQJhkNBtD71PKRwV6PsUEgE7IOS88PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5383
Received-SPF: pass client-ip=40.107.20.120;
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

12.05.2021 00:08, Roman Kagan wrote:
> On Fri, Apr 16, 2021 at 11:08:56AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Now, when thread can do negotiation and retry, it may run relatively
>> long. We need a mechanism to stop it, when user is not interested in
>> result anymore. So, on nbd_client_connection_release() let's shutdown
>> the socked, and do not retry connection if thread is detached.
> 
> This kinda answers my question to the previous patch about reconnect
> cancellation.
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   nbd/client-connection.c | 36 ++++++++++++++++++++++++++----------
>>   1 file changed, 26 insertions(+), 10 deletions(-)
>>
>> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
>> index 002bd91f42..54f73c6c24 100644
>> --- a/nbd/client-connection.c
>> +++ b/nbd/client-connection.c
>> @@ -158,9 +158,13 @@ static void *connect_thread_func(void *opaque)
>>       uint64_t timeout = 1;
>>       uint64_t max_timeout = 16;
>>   
>> -    while (true) {
>> +    qemu_mutex_lock(&conn->mutex);
>> +    while (!conn->detached) {
>> +        assert(!conn->sioc);
>>           conn->sioc = qio_channel_socket_new();
>>   
>> +        qemu_mutex_unlock(&conn->mutex);
>> +
>>           error_free(conn->err);
>>           conn->err = NULL;
>>           conn->updated_info = conn->initial_info;
>> @@ -171,14 +175,20 @@ static void *connect_thread_func(void *opaque)
>>           conn->updated_info.x_dirty_bitmap = NULL;
>>           conn->updated_info.name = NULL;
>>   
>> +        qemu_mutex_lock(&conn->mutex);
>> +
>>           if (ret < 0) {
>>               object_unref(OBJECT(conn->sioc));
>>               conn->sioc = NULL;
>> -            if (conn->do_retry) {
>> +            if (conn->do_retry && !conn->detached) {
>> +                qemu_mutex_unlock(&conn->mutex);
>> +
>>                   sleep(timeout);
>>                   if (timeout < max_timeout) {
>>                       timeout *= 2;
>>                   }
>> +
>> +                qemu_mutex_lock(&conn->mutex);
>>                   continue;
>>               }
>>           }
>> @@ -186,15 +196,17 @@ static void *connect_thread_func(void *opaque)
>>           break;
>>       }
>>   
>> -    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>> -        assert(conn->running);
>> -        conn->running = false;
>> -        if (conn->wait_co) {
>> -            aio_co_schedule(NULL, conn->wait_co);
>> -            conn->wait_co = NULL;
>> -        }
>> -        do_free = conn->detached;
>> +    /* mutex is locked */
>> +
>> +    assert(conn->running);
>> +    conn->running = false;
>> +    if (conn->wait_co) {
>> +        aio_co_schedule(NULL, conn->wait_co);
>> +        conn->wait_co = NULL;
>>       }
>> +    do_free = conn->detached;
>> +
>> +    qemu_mutex_unlock(&conn->mutex);
> 
> This basically reverts some hunks from patch 15 "nbd/client-connection:
> use QEMU_LOCK_GUARD".  How about dropping them there (they weren't an
> obvious improvement even then).
> 

OK, will do

> 
>>   
>>       if (do_free) {
>>           nbd_client_connection_do_free(conn);
>> @@ -215,6 +227,10 @@ void nbd_client_connection_release(NBDClientConnection *conn)
>>       if (conn->running) {
>>           conn->detached = true;
>>       }
>> +    if (conn->sioc) {
>> +        qio_channel_shutdown(QIO_CHANNEL(conn->sioc),
>> +                             QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
>> +    }
>>       do_free = !conn->running && !conn->detached;
>>       qemu_mutex_unlock(&conn->mutex);
>>   
>> -- 
>> 2.29.2
>>


-- 
Best regards,
Vladimir

