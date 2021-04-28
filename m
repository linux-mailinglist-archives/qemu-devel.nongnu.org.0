Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD236D3C9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 10:18:44 +0200 (CEST)
Received: from localhost ([::1]:41614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbfPA-0007ij-16
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 04:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbfO0-0007ED-Rz; Wed, 28 Apr 2021 04:17:33 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:14174 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbfNv-00009I-NK; Wed, 28 Apr 2021 04:17:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m54CXs7TTtVldxYFoBRoorf23MsnCzOVIWtswhNT0uJ/fttx6/Q/1YHOKaF36mWVFLM0bj7I1QHAGmogwL7XvQRCs2ufM3nTzvnVt8W5ElKNWUoyqCrJjT9ssDPN/IDHl7xjQSRedVGlntU2FMXsmvWmwnWhoBp8Vn8ZmeZKxS1NLHkONHt8cCRslssvVY9hSoPZWGynHWGCpzFEn34gKw+VQYe8/+GbdSxPf3qNK1E/oN2IAe7eIGjsg3XyIqA8paPR03XYpB5em4M2HLzvnq6mtrAASunWMdp8PFwuwuoql/o0nWXVkZ5SVLMhPtQ22I7vuY4fFTU22/FCtbBJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wLRx78fGdE+LGJ2aDSHuYo0bgBNyjjPPSYwRAVjNYA=;
 b=dgUKZu568WL9TTyuYjW4S16aaFTTqDLxzhm+Ru/03J+Z3U5dRIkpKSAnU2kknzwtvtDBUbQORLuMBAf9Ej2swI8jTCdnTGtUExpn22H8KnDQ/7nKVjz3ChqRR7G3SD8wsIakiRtJbYuzrg1eKDKsgymt3Qt6CANOPyYQWk/zTerwHxbhLSYqFh/Xd2F+ObAYqX6N7T8HM693S+YneDmfge6TEDEDzeNcVbqJO8FEjlalh2Ka0ApApubNadW3cy7Zv8xKq39uJT/URzPyl/x3FjaBwGpNM7PThhTfuPQA0FVltrZnk7uVgu1utdRM5cMnVQX2gGGiocnakrzpD/oUrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wLRx78fGdE+LGJ2aDSHuYo0bgBNyjjPPSYwRAVjNYA=;
 b=DXpuO4W9ePPMlEh1th/N+SA37EYJKO3g9hTi8xKE30oTdvNXraMWNG/ctVqCFblAbQoD+dkWdxmSTxLmVq0z7vwjEu8tQyljJ8ZWQbqh/c8AxVyE5w/AxCB+mx0tJO3GksnbsqnpdGIYmHDLUiui96fd6KynUxzmQE6mGnYZsJw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Wed, 28 Apr
 2021 08:17:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 08:17:23 +0000
Subject: Re: [PATCH v3 15/33] nbd/client-connection: use QEMU_LOCK_GUARD
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-16-vsementsov@virtuozzo.com>
 <YIj760DlBIIE3pIR@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4d4b978e-c1a6-d20b-c34a-d25d0999b29c@virtuozzo.com>
Date: Wed, 28 Apr 2021 11:17:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIj760DlBIIE3pIR@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.19 via Frontend Transport; Wed, 28 Apr 2021 08:17:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 648af31f-33b4-4d70-60cf-08d90a1e0d2b
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59440C66262EF530201812B8C1409@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6T1H8py53vRBbNV0Zi/gLXlfpHsDKeidoI5efqaIbnpp/q5ex3nlbSJzxd/ZdyOEUBLQ6mGHVoJoXkScgz/8Z1/bDe1gzoqvqTEAoQUXcbDzXJT2coYv2mNcWKFAy5Ey1ogSpcwwEZTIfdsXjck6f/mFp7h2BCtB/9J257BH7ysr2VFW2wx4/NgVs/HThNjLt8gYEpD2KHfbTb1Cu6aMHcBn1F3KKntkSddUkgWhT9bFW28r/O/QCxDWzpfVsvETwjhFKBGyJCdxlgpzeXI2uwzYqM4FyaTLr/WGqfUgDstilZ/Ivg6+hkVsRJgVbfBvzd+K0AJnKzizhLylnb16ZI4dMDiD1dpEeDtu7LvvMYPnCEy97qyFWKTSKTAOTCQ376pfnjAXv5TcZ6Hnt24f9FA2Xp8NA30pTtxVKLgspnOBGMejlMkTGDSFhziB3LZaz6/ufua7G5yB/rQEDpQ75OPfSMP/IXNdh5+rrtWfjmcxv1hR1tYU+wKLyuAxWHTIhWJAp3ZygpJnPI/PED7FWgPeTO3EkXtFIs0mrZ55xil0HfRgTVlLOw5HPQjKYYlmWCWKclc9gTta+jYcw3v+rjc5bDHLtPMzewkKAFmKt+2emmBcSQ0ykLoMxO9hVltUCGvW41L/c0jdkcVznfQn4xIDubGMVwOcU3RoHQIt+MPnuYhxFCRmmjcjosAQvlHsYcGvKuO2srBQ5zdfqybig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(346002)(376002)(366004)(136003)(8936002)(478600001)(31686004)(2906002)(38350700002)(52116002)(8676002)(38100700002)(16576012)(36756003)(2616005)(66476007)(956004)(31696002)(316002)(16526019)(186003)(66946007)(66556008)(26005)(5660300002)(6486002)(83380400001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGE5NUhQaG8wY0JoN3ZSUTU2dThwTGNMbFpUUnpOc1VFNmRlQjlLaWpHbGtB?=
 =?utf-8?B?VEFHNFNSbnhrN1ExNUdhY0VGYit5WFVPWnN1WHgyckVlWUk0QTVPR1VvMFp3?=
 =?utf-8?B?YUdUSUVENXJrd2JCQk13ODVoM08vNVQ3SUt6aTF3RHd4UWhEUmZpSU1EY2ow?=
 =?utf-8?B?T0dKdTdlTDV4ZVMrazk1YmxjZFpWTDBSYUo1U2tZcXBOUURkd29WZ2x3eEc2?=
 =?utf-8?B?clVLZkRCR0UwWEFNRXlVYUxRMXgrWGNFQlV0bmU5R0ZDSXpReTMvNFl0K2Fw?=
 =?utf-8?B?eWQrMXBOQzM2UW4wS3ZqN2ltQW5hOHJVZGdNenk4RVNuaithbUs2R1RmSHIz?=
 =?utf-8?B?Qm81bXNTSHdPbGkwWnJ0Z1FpTTZNT3hEYkFjUzNCT3AyOU53eHo2VTEyZGRj?=
 =?utf-8?B?aUtBMEthTWRoQWtYQjZlOXB3YlhsZXdhSVZHWXVoaDJJMUR5QSt5NCtOSU4r?=
 =?utf-8?B?R3hFQVZUbU5obnZDOUJBbHg1RDhET2k0ZHZLbnk2MlVSdTFlcjNGQmc0VFA5?=
 =?utf-8?B?VWdVQWs5ZXVpQXZwcHRSbVZBZWhiWCtxT0o1L0tnaFdId2VsVHZCbXJwcXF5?=
 =?utf-8?B?cys0SExZai9zczJGT2NHa3VySXJqY2dPbElzbCtSV2xaS3I1TXZ2UFdnN1dn?=
 =?utf-8?B?QTRlOUpQcE56bC9PbkVOQmEvOHVKNTVpdlpDMlIzek1IU3dJWDBJd3lVanIx?=
 =?utf-8?B?QURscXZmam5aeHlXSi9scjdUb0hsZDB1eFFxMVdwWTZYSDVhSDkySThYSDB1?=
 =?utf-8?B?aVhjb1hBSTgvTzF5Q0pnamQxK3JWVmF4UmtHVmQ5QlNlR0F2KzVOajRwUytl?=
 =?utf-8?B?SmxoelRUclBJU1BLdjdzbXFialZOTmdSNDdMak1YaGNteUVlckNmMm1LdHlv?=
 =?utf-8?B?enVVbjlHM044MFZOL2krdE1tZnZoZlFLY1dQN0c1aUhaSGVXR0N4Qm1UaFpE?=
 =?utf-8?B?eXRXVXJiM2NDRU1ML2FJVXJOcml3WDBvQnFmQ00rWVFPL2pRQ0NtK2crdkZV?=
 =?utf-8?B?Skx0ek5tSk1wdmtxS3NjVy9IdTdUSEhJdFJRZTA4UmZhZWhRR0gzYW5HOHNw?=
 =?utf-8?B?aVYwb2NVTUJMR1dzL0NGTDNESFUzV25WSVVZK1NyWGZHbFBZa2VSSDlHMmNl?=
 =?utf-8?B?cjdUampIMEFIRVg4YUtRd3ZhYUZPMDJkMnZqV253L1hBYXRRdStMMUVQb1kx?=
 =?utf-8?B?MGRVTWJDZUM1QzdkRjZvQ2NNcG91MkxqT21jTXdpS2l6U3pDRDRHdUZ3ZGJa?=
 =?utf-8?B?dUtoM0hnN3FjSU5kNU9OK2I0amxPbHdEc1lIbldWSEtEWEgwVjd2TUgrT3RJ?=
 =?utf-8?B?RjhLN2MyaEk2WW5OTVJ3bHpWVlFzdk1lVGpIamE1UW93TjhaZ1JtZEVpYXZj?=
 =?utf-8?B?TCtMSkN0V1dNZldCS09RRW9FK0oyaXA4bGJqTWhJeFdoUXpoTkp1NEloNWdR?=
 =?utf-8?B?L0pwa0VXMXU0ZDU4cVlMOStOYUhJcDZCN2FiNEZydjEzM3dwbDJYY2IvUFB2?=
 =?utf-8?B?YVdMNnAvMGJJblhYMTlkc1dZRUtENEwzQ0VZYU0xNFhSQzZxM1lsbXZQNmZ3?=
 =?utf-8?B?R1BBQ0hTNEMwK0ZpZkU5MzNkK1JnRzdFOXVXaEpHYVB2NStucHNYV0k3dHEy?=
 =?utf-8?B?cjR2WHluWVNjUGVXUkJkZlNLY0Z3c201bzFMb21RVEZwN2FWUjgyNEYxL0pW?=
 =?utf-8?B?Y29XUUFmSkJ2eGEyWVViNEpmUEVTV0w5Sko3dm5vQW5RMXRlWWxvaGI3VWRa?=
 =?utf-8?Q?5R087X8ULeQ4fpXyvgVptlN6K/WdirHGLFFF9Np?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648af31f-33b4-4d70-60cf-08d90a1e0d2b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 08:17:23.6994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XggL4yrmXLMThRmwPfQVVLu/znXV42HFGbzw7z01bPTgz9pv7YxBK3IFjRmnBoFOwQdvdCPRl9wWJLZYPXR3+wEGSMapQX4VWbQyUFYxA3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

28.04.2021 09:08, Roman Kagan wrote:
> On Fri, Apr 16, 2021 at 11:08:53AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   nbd/client-connection.c | 94 ++++++++++++++++++-----------------------
>>   1 file changed, 42 insertions(+), 52 deletions(-)
>>
>> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
>> index 4e39a5b1af..b45a0bd5f6 100644
>> --- a/nbd/client-connection.c
>> +++ b/nbd/client-connection.c
>> @@ -87,17 +87,16 @@ static void *connect_thread_func(void *opaque)
>>           conn->sioc = NULL;
>>       }
>>   
>> -    qemu_mutex_lock(&conn->mutex);
>> -
>> -    assert(conn->running);
>> -    conn->running = false;
>> -    if (conn->wait_co) {
>> -        aio_co_schedule(NULL, conn->wait_co);
>> -        conn->wait_co = NULL;
>> +    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>> +        assert(conn->running);
>> +        conn->running = false;
>> +        if (conn->wait_co) {
>> +            aio_co_schedule(NULL, conn->wait_co);
>> +            conn->wait_co = NULL;
>> +        }
>>       }
>>       do_free = conn->detached;
> 
> ->detached is now accessed outside the mutex

Oops. Will fix.

> 
>>   
>> -    qemu_mutex_unlock(&conn->mutex);
>>   
>>       if (do_free) {
>>           nbd_client_connection_do_free(conn);
>> @@ -136,61 +135,54 @@ void nbd_client_connection_release(NBDClientConnection *conn)
>>   QIOChannelSocket *coroutine_fn
>>   nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>>   {
>> -    QIOChannelSocket *sioc = NULL;
>>       QemuThread thread;
>>   
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
>> +    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>> +        /*
>> +         * Don't call nbd_co_establish_connection() in several coroutines in
>> +         * parallel. Only one call at once is supported.
>> +         */
>> +        assert(!conn->wait_co);
>> +
>> +        if (!conn->running) {
>> +            if (conn->sioc) {
>> +                /* Previous attempt finally succeeded in background */
>> +                return g_steal_pointer(&conn->sioc);
>> +            }
>> +
>> +            conn->running = true;
>> +            error_free(conn->err);
>> +            conn->err = NULL;
>> +            qemu_thread_create(&thread, "nbd-connect",
>> +                               connect_thread_func, conn, QEMU_THREAD_DETACHED);
>>           }
>>   
>> -        conn->running = true;
>> -        error_free(conn->err);
>> -        conn->err = NULL;
>> -        qemu_thread_create(&thread, "nbd-connect",
>> -                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
>> +        conn->wait_co = qemu_coroutine_self();
>>       }
>>   
>> -    conn->wait_co = qemu_coroutine_self();
>> -
>> -    qemu_mutex_unlock(&conn->mutex);
>> -
>>       /*
>>        * We are going to wait for connect-thread finish, but
>>        * nbd_co_establish_connection_cancel() can interrupt.
>>        */
>>       qemu_coroutine_yield();
>>   
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
>> +    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
>> +        if (conn->running) {
>> +            /*
>> +             * Obviously, drained section wants to start. Report the attempt as
>> +             * failed. Still connect thread is executing in background, and its
>> +             * result may be used for next connection attempt.
>> +             */
>> +            error_setg(errp, "Connection attempt cancelled by other operation");
>> +            return NULL;
>> +        } else {
>> +            error_propagate(errp, conn->err);
>> +            conn->err = NULL;
>> +            return g_steal_pointer(&conn->sioc);
>> +        }
>>       }
>>   
>> -    qemu_mutex_unlock(&conn->mutex);
>> -
>> -    return sioc;
>> +    abort(); /* unreachable */
>>   }
>>   
>>   /*
>> @@ -201,12 +193,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
>>    */
>>   void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn)
>>   {
>> -    qemu_mutex_lock(&conn->mutex);
>> +    QEMU_LOCK_GUARD(&conn->mutex);
>>   
>>       if (conn->wait_co) {
>>           aio_co_schedule(NULL, conn->wait_co);
>>           conn->wait_co = NULL;
>>       }
>> -
>> -    qemu_mutex_unlock(&conn->mutex);
>>   }
>> -- 
>> 2.29.2
>>


-- 
Best regards,
Vladimir

