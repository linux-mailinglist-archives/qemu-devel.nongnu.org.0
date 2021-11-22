Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F7D4593E0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 18:19:22 +0100 (CET)
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpCyP-0004LP-7d
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 12:19:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mpCwr-0003XH-BH; Mon, 22 Nov 2021 12:17:45 -0500
Received: from mail-eopbgr60124.outbound.protection.outlook.com
 ([40.107.6.124]:60641 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mpCwn-0005i1-MI; Mon, 22 Nov 2021 12:17:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+NEmx1Z8u5kER4t51ceqg94fSQ2FKHjjEL/3aX1/mU5RdJQHu+OZ2h8XEfg8zLGgnsn3sfDfo5IZtlQM1k8NrLl9I0VEv9uiThYjwgIqOXXIQPQ75DlZNK3tqLthVJTYU4roibiruCSlBb099RqPIrd4VWBo3lFCGaqQMqOXpYqjCqrU4jAJJhyL9gyRj56y9Jr+ApkX9fN2Rmf6tkNG8XZkMSc9Q4iv6VixgzvaqkU9Nbd33gJCurRWjs31os4/aOn5uVucWeu4if/SgJJU8D+9UCCf4+4Q/kwXhvA1wBq1HM5kUHGDlfh1W//T8nhCoFLr49N+8xwthQiVH5UnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hpI43zUQFFvfCpBheHuj95y8ES5RbjBd2idMdKgGBE=;
 b=O5rmDl7IEI9Pw7HQMno20X7I4sONT2JhhYZprlvy3yVTIQjV1quHjBd4hy5O08YyE2QMalxfbjAthZ5LDV0FTLvtfYwLYkARUW50RbME3w4Ie5YbAQWVl3k77ul8sCALoGxJrdX2l5npWWsLmUaAwIHnw7373BS2dw4z8qoLTmTtQJeNCaIeWgvQYZQ5UMSepxUMiB9lS+8YNbCg+WskJpm+qSmfrVF1kmGtTFPWRdX/rDL0XTLHvM2k8tR4MT1BS1X2lop4pGsU0VEz7is6tyG//uzL1+VGLLvAjjJ3Xev6L9Tl693gzjobUa/6rU0tV8JmsCKLBySC7dqokXDpNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hpI43zUQFFvfCpBheHuj95y8ES5RbjBd2idMdKgGBE=;
 b=qOHaIB5OFSzhSc4jqtnZddYcZ3l9My4t7m0pv8RjGDQHa2F6NpRMPX4okXFieixxxig15EyoGRr4T9+ioNgj7i1l+84FtzxoVxnrAlgjZ2ZXbBxY+5gIBwdcfmIl8tBZJVf3XVEaHDEVXrH4q+i9R/pZdnpnafieWJ5cSxbc0ds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3572.eurprd08.prod.outlook.com (2603:10a6:208:e1::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 17:17:36 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Mon, 22 Nov 2021
 17:17:36 +0000
Message-ID: <fca77dff-caba-907b-6ab2-91ed9987760f@virtuozzo.com>
Date: Mon, 22 Nov 2021 20:17:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 20/32] nbd/client-connection: implement connection retry
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-21-vsementsov@virtuozzo.com>
 <20211122163001.ahvcby7rrg4hc23n@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211122163001.ahvcby7rrg4hc23n@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::28) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.233) by
 AM7PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:110::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 17:17:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7870b52c-51e1-46a0-ff26-08d9addbfa61
X-MS-TrafficTypeDiagnostic: AM0PR08MB3572:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3572B766860C3CC27DB3E2ACC19F9@AM0PR08MB3572.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U/sr8mVrj+lP2zkjaAX7Q3fSb0VG+0k/3NoM73HJ072XHWFju9dxUNU0cYiPEMcMLt0c4FsYKT+jtlBanxNuTAm7ExVxTyPv6uXxtluRw/KZyDVWSB4sH3KFUHSMgmpvo7Gdv8CRfwE1vBVCyssSKEzgFKejdKdTgn/6h4HfqLZLhv6U/+OX75qC0KX7aMbhHP7s78BcFMrSsGcLNgNIA3hYpncWv9WjbDyWh6aOO1AEqPDdjNYmwdRUg0Z7YdJHaYKE16jjT2fSLeyBnBFDvQlObXvdRRy52IKA0RIRynodb7eQ2ua4/jkNXmfd+fJvNnrjgc1zdoadz393K18CyTneer6R7+Box5pDMl4Hvei67C0aym0Soq8DdOHTBxOebjL+QCo5p8YCImwlE7WxEqaoHSGFGujHitBnqBUDNzfLBZEiq6fmLApZ7e70zzTEZTdPFU//Ya660VGSrO2HC3ro2rDJxJwdxjn7ywjfJdsxvYGxilS9tumMnmaOxth7giMlOC8DfoG8YtRONjYWp+s300G2K0gORiRTpBHguMJFtblKTRUMbRWlj/L0i1kKq4IAHWqXTHscRe1rBhFrZSGCFMMQz6fPUoZcm0OMDJ7ueHeSXVglAwTQCLn5oUpqUKjBRTmYmDVV9o1Y6dmQnGcMeTQGfKWEI9+jCCnMlDDXsQfiRY9DOhJEjG2kb3rhfEAL5JO/dzHzIib1/crEiN6+2hsjOGzM/5bi5xVlfsAODeL1h82/CbPqPQGw/2w8FS7neQxqhAf7qx8KPPyuwUK9BQ3w6EPAXQxRoId/Wk0oLLErwNxOs3Z3sI/SjE583ct2lypqSBUKoUr2/kJ2TN5OfsxV/8tnzHA0fNkuZ8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(66946007)(6916009)(186003)(966005)(508600001)(31686004)(16576012)(6486002)(66476007)(66556008)(36756003)(316002)(52116002)(8936002)(956004)(86362001)(2616005)(38350700002)(2906002)(8676002)(26005)(38100700002)(5660300002)(4326008)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU9MbjJjY2NYSjV3dmRJNTZNQlZIZ2cxUXJGY2I0dFc2cCsyZkMybm52THd1?=
 =?utf-8?B?eklVblREQmhRS3JOYTcyemdiVlltR3NrcGlnUW9kRUVSVUJZSUtGZ2V4djgr?=
 =?utf-8?B?c29ndTd6aFJXd0VuaWoyQ0djN3EwQTdFTnY2UzNBRnR6aEo1Z09OeGNUVGcv?=
 =?utf-8?B?aHFOdDhlaUFRNmlPZUEyT0ZQYlJtTjRFSjBMS3VZU3dORGUrT2J1K1Y4NHVv?=
 =?utf-8?B?SndkUFJNL1p4anFOOTI0OERSY2loM0JEeG5nMDQyN0F3V1FtalVWajZyZTZ0?=
 =?utf-8?B?bEs2T0lJUU1MTE1yWmtrNGRrVW8rNThwVEp3K0M3Rld4cUV1QkttSnBma2hF?=
 =?utf-8?B?dlU1RTJMc2hqdkEwUWlESmtwNkQ0REpjbURyYkV5ajNIUER3QjRiRlB6ZkFh?=
 =?utf-8?B?NVZhVDAxTXd0M2xXR1c3VkpocHZ3M3puazRNZWpDbmFMQXVqaStSM0lOYytZ?=
 =?utf-8?B?NGNzM0MrYVBJNGhzQTlvOFVEQkE0aUxsTjhxR3ZFdG9Kbk9ObFhSckEyYkhN?=
 =?utf-8?B?SFRaYWFpakF2NnhvVjNFOG1VY3V5bVVmVXV0cXRWVWc4VkNGVVBiT3daOGxx?=
 =?utf-8?B?SnJoSi8wTUhJTy93N2pLZjFQQzVDYnpkRnc5bmV6eUFiN1pBUW5SZGl4bWRH?=
 =?utf-8?B?eENBS1c5dTR3eDFhNkxUM2lCdXdBVHJzTUhMZWNscUNTOGZJS3pCRC8vL0Ev?=
 =?utf-8?B?Z0oxMlZoZklIdTlkZVAzTzNZZWJKbEZMUzEwYzlXTmRyOXQrNk1PbmZURGJO?=
 =?utf-8?B?L3h4THd1dE9qaGxFNWV0TEU5aEVBM1pYL1VCK2JWU3pPMkIzNk9DWWxpcWRB?=
 =?utf-8?B?eHRtRk8xZmlkdzl3K1g1Z3J4RFlFZXo0MkVMZDhkczhPdU9ETGhuVkNwaW9y?=
 =?utf-8?B?bUwvRHJhdklEaUQrVVE2YzZpTTM2NXdHdENLZXNNRU00L2xpSzJtUmlnM3Zo?=
 =?utf-8?B?dm5mcTJ2NDJDd2RHRUhKU3gxeGNJTkJQY2krUTJJQzhvV0Zyd0x2SEZOdWsw?=
 =?utf-8?B?MGI2UEVXUXI1c1pyV2VVb0hYNWtITmJJY1FERkpFWUNYdHJ2ZHNFRW1mRUFj?=
 =?utf-8?B?L2hGeVRka3crQ2NCeCtKL2RwZ1d5NjhaWkpMSlY0OU9aaFVweXpxVTd4RldU?=
 =?utf-8?B?aTdidDg0dXZRMXBiNURrTUFIekVsMjlxcjhVK3ZqTjBwTFovdUF2azgrbVYv?=
 =?utf-8?B?LzdXeFF1MFZaeU9GQU4za0M1Vll5QS9XanA3N2Flb1BLQzJWZWFmUm4vYjcy?=
 =?utf-8?B?bUdJM21qaEVXeW9PVkNGV3BBbnBiSkVPSDRQL1J4MDV5L1NDTXUwcTVYMkV3?=
 =?utf-8?B?TW9vYTZWSFQvK28vQy9VWUduTTRsbzB1c2RrVzhxUXRYc1BKdlBmZk9ZZmlX?=
 =?utf-8?B?aWR1RFNsbzczam9DSDR6WDIxa1ZoRHRlS202ZnBxbWM4a2p6b3F4R3N6VWhw?=
 =?utf-8?B?bTduQVMzOW13cFFZRDlZdUFkZGp2dFdxUWRZUlR3RXJ1dUM5N3V5cUozbGs5?=
 =?utf-8?B?alRrdVBZWlhZc05VWlRsRGJtQTliQ0djTnl0ZC95M3ltSXBqQUpmZnRhM1R1?=
 =?utf-8?B?OXNyR2M0S1p5ekVOemZWSC9rN1IvQy83c1RoakVvUFNwcjNGaXRkeG91WUNZ?=
 =?utf-8?B?dEFKMSt4Z3NRcUthd0RhL0h4enpEZmRYYnZNd2kzVSt2RStvbmlNUWx2ZG10?=
 =?utf-8?B?WWcyL0V5cG5GV0pZTEMxUjdJMndtU2hBRTBYaUQrREJLYVVJc3E3WGtnNTM0?=
 =?utf-8?B?ZDI2N3B3bUpYNTlxUmI3cDRuYmYvWkI1c09iQ1E1THJwUzRxSTRUMHJFQ29W?=
 =?utf-8?B?WWtDcmY2aEdWeGRDRXFNb1VOWlpkakk0NThTbGZVTU9CMTdobEZ4dU9aK2kx?=
 =?utf-8?B?SWV5MkRJczVvVjVJNjZldGQyRm9kcndLVlZqWGJ0VE85WmpNWkNJTTlsSzJC?=
 =?utf-8?B?K3d5MzZmQ1JMMDRoZURJYWxwTXg1a1FKYUNkTVBPWTFKdFhDS0pmbVhuMmpp?=
 =?utf-8?B?YWpvUFAyb0FUdWRhUEluNnlWZldVZ3VsVEpINk95ZXc5eWZIazV0UmJuVlN0?=
 =?utf-8?B?ODdRNVgrVEptaitUUHMwTHNMZXE2R3g3Y2ZoRmlMakNqR05vWDFqbUFOOVFw?=
 =?utf-8?B?anU3ZHBCTm5UUGpCU2F1djV5YnFacW5kemJIbXpuT2NvSDV0MVVDdU5COVpo?=
 =?utf-8?B?UW1FTVZuNE9QbVRnc3FwWDBGM2lwRlhOUTl0RVhpdnhoK1RvSnpXc2gvR1dN?=
 =?utf-8?Q?wEFeoOOs3F/H3xHUgpxavMdFGrc4h7THdRyAQnyXuM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7870b52c-51e1-46a0-ff26-08d9addbfa61
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 17:17:36.5042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENeFJn2/nIsdu3zkaQiOH6cYbtZEeI4pkEj46XVvA8rDxuetUkdsFTCM5EJnF0UvNlaJ82CiiWOdPe93F0HcVGQZHZnhaQslSlB5+bw7YlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3572
Received-SPF: pass client-ip=40.107.6.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

22.11.2021 19:30, Eric Blake wrote:
> Reviving this thread, as a good as place as any for my question:
> 
> On Thu, Jun 10, 2021 at 01:07:50PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Add an option for a thread to retry connection until succeeds. We'll
>> use nbd/client-connection both for reconnect and for initial connection
>> in nbd_open(), so we need a possibility to use same NBDClientConnection
>> instance to connect once in nbd_open() and then use retry semantics for
>> reconnect.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/nbd.h     |  2 ++
>>   nbd/client-connection.c | 56 +++++++++++++++++++++++++++++++----------
>>   2 files changed, 45 insertions(+), 13 deletions(-)
> 
>>   NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>>                                                  bool do_negotiation,
>>                                                  const char *export_name,
>> @@ -154,23 +164,43 @@ static void *connect_thread_func(void *opaque)
>>       NBDClientConnection *conn = opaque;
>>       int ret;
>>       bool do_free;
>> +    uint64_t timeout = 1;
>> +    uint64_t max_timeout = 16;
>>   
>> -    conn->sioc = qio_channel_socket_new();
>> +    while (true) {
>> +        conn->sioc = qio_channel_socket_new();
>>   
>> -    error_free(conn->err);
>> -    conn->err = NULL;
>> -    conn->updated_info = conn->initial_info;
>> +        error_free(conn->err);
>> +        conn->err = NULL;
>> +        conn->updated_info = conn->initial_info;
>>   
>> -    ret = nbd_connect(conn->sioc, conn->saddr,
>> -                      conn->do_negotiation ? &conn->updated_info : NULL,
>> -                      conn->tlscreds, &conn->ioc, &conn->err);
> 
> This says that on each retry attempt, we reset whether to ask the
> server for structured replies back to our original initial_info
> values.
> 
> But when dealing with NBD retries in general, I suspect we have a bug.
> Consider what happens if our first connection requests structured
> replies and base:allocation block status, and we are successful.  But
> later, the server disconnects, triggering a retry.  Suppose that on
> our retry, we encounter a different server that no longer supports
> structured replies.  We would no longer be justified in sending
> NBD_CMD_BLOCK_STATUS requests to the reconnected server.  But I can't
> find anywhere in the code base that ensures that on a reconnect, the
> new server supplies at least as many extensions as the original
> server, nor anywhere that we would be able to gracefully handle an
> in-flight block status command that can no longer be successfully
> continued because the reconnect landed on a downgraded server.
> 
> In general, you don't expect a server to downgrade its capabilities
> across restarts, so assuming that a retried connection will hit a
> server at least as capable as the original server is typical, even if
> unsafe.  But it is easy enough to use nbdkit to write a server that
> purposefully downgrades its abilities after the first client
> connection, for testing how qemu falls apart if it continues making
> assumptions about the current server based solely on what it learned
> prior to retrying from the first server.
> 
> Is this something we need to address quickly for inclusion in 6.2?
> Maybe by having a retry connect fail if the new server does not have
> the same capabilities as the old?  Do we also need to care about a
> server reporting a different size export than the old server?
> 

Yes that's a problem. We previously noted it here https://lists.gnu.org/archive/html/qemu-block/2021-06/msg00458.html

Honestly, I didn't start any fix for that :(.. I agree, it would be good to fix it somehow in 6.2. I'll try to make something simple this week. Or did you already started doing some fix?


-- 
Best regards,
Vladimir

