Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B336D39B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 10:02:54 +0200 (CEST)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbf9p-0001D8-LY
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 04:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbf8m-0000io-PZ; Wed, 28 Apr 2021 04:01:48 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:46881 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbf8j-0007NT-2A; Wed, 28 Apr 2021 04:01:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXWqW8drWBIO8RL3HQCc0XirwUOpl75qdRObl7bjAp+Syc6t8p10cY2JvzIvQcVzxhz75/TB04f+4zKsz5+l8ZtpS1SM7BOmapkTXfXLb/wQ8bZNsTCHhOJFVVeT46Wnd9zXsm9PvHU/jcDxUeks0elIpHoRv6g/iF9byl3TGDSe7D5ZkaiING1pG3HlaYVdgsO7xOUgR5wYstQhMlw3Mjnt2qZyxSA4+bLe+jZ9X9kQWN/AX0JJ+TidzgrxhTHYvtCjnOUqOsVGAiag46hXLGW8iHJjfJW+5S3DOOuxTerEEoCncr2WjzNBSGdeh4W7f+iE3BuSWRZ61RjHHc0LGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG55r5Ks1HEdn1We8BgFniAXADyLrQOA47lxw9Xuuv8=;
 b=D+b4JxArvxWruu+1APK+vFicaytmvwOvDCFdeRRz+ygxWji7t4wEY//Y0gaVtMa1sti6k8DO6toDGT2qQpla5clpOIJfS99QxdtKMyzTadYzAONNd8KG+tUU/cvYhlZOc//uj0M3idsSS2Rr2aC+YsPZKnnoLF4CjJ9vclYNdrHoRVUqP71gYzQR1JphmnYNlqGEjrxNQukDzWaf7X3ME4o14zOEVyj8YHcbNXkCZnvE3XTeVIb8ag+BH4AAg28bo3eJNJLsZQcoqSEYpf6D2/8IRAgCDIMIrCLe4z7XGJgUa69RxXgxcNV83Rp7sPMcX8fz3tRp9AaAHhkiEryiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG55r5Ks1HEdn1We8BgFniAXADyLrQOA47lxw9Xuuv8=;
 b=RaJhu40kLQ1Gd6wy8FUy0YiBSB0ftbugyJ2v5GGUYk9r47qy/CbdZspDIoyi5qOT8TqQFdalKXmsnMlrpItnzJiVMBDuW+itGSX2pX5jKiT9NBJR/Ncd8EIv5wKBc+oIeXGAySLj8bzBaviK6qhrwzy7OTU8EZs6WvYNBOZwU7g=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Wed, 28 Apr
 2021 08:01:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 08:01:40 +0000
Subject: Re: [PATCH v3 08/33] block/nbd: drop thr->state
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-9-vsementsov@virtuozzo.com>
 <YIiO72OAtvRD4XBC@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <13997837-dc74-9699-572e-8b4ab17a9ddc@virtuozzo.com>
Date: Wed, 28 Apr 2021 11:01:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIiO72OAtvRD4XBC@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR3PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR3PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:102:b7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Wed, 28 Apr 2021 08:01:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c66ea2cd-f82e-426d-8ec8-08d90a1bda84
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59127C289F90B55B25F6E6D7C1409@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQaRfPczYPaywlT3xqYxXdFI+aTQQ0f1CAbZxCXQUmUtMK1A0/3rX3Hqh7DGuV+zQsw3D/GSn+BooLDQQuLGd7RJ3gPjjpUX55Jl1mwpL7K4CcyFIpLvN01nb9PcpRbuyNnYV/JOJNqUfrgeA6Ucygh5PPDzjcekC/2OHOLtNaGq9bD5G+CbE0y7xyq/dJgEXyP/XBipS+lieDl9nq+C/Pts8M9mCvyFht4Ml9cbBpArtlRpTUD5wdakfLC3fodX5iRN7XNgNZNZm7Z/fs6koNV2Tvtf1X33lxR+N6FqRxEYVuOivo/+4IQoeqRQpJG6yJtwOa+L5gW4NjaHEPo10PQv5tWCAbocruVCeXJ7H8BjqhKXJZiMfDpkm4ksPSvZ3haou39IX6VdzNgRRnGy+smVGbA5bMky6VV+hPmUNcm5cSFlrdGE5sL3WPj6J/HtfBAcG6D8XgvtaQIIYuAalTXvvrlx05IAMXq8Dk773q9adku566Xy1/BPaRhuI7XWOOIf/ZB1/Bauq+wtNNcSASjhHuYRnvo1NokTWwP71Wz9QCNArYoMr5oV1rCO4y9IKc8X2BjSWXr2Xl9h2wb563YF5wb7Y6sHyPxb8J19/prAqxHJ89wmtfXHMMx7U061tgb9TFEdTvVmfrUhZur86sj853E1rxXJlhUa1CXIT2dl6KPNNN5p8i5iPslGy07vEoU1ye21kPDDCgKYgS7NydHT9MTOVH5dqiISwHl9JSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(39830400003)(136003)(38100700002)(38350700002)(5660300002)(478600001)(26005)(36756003)(6486002)(2906002)(83380400001)(86362001)(8676002)(16526019)(956004)(66556008)(2616005)(52116002)(316002)(8936002)(31686004)(16576012)(66946007)(66476007)(186003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3ltT1Y1NEVRUGpENVJhZmxNQzROZHZDRDR3UGVHbEZKam1kc0VLSitjbnV5?=
 =?utf-8?B?dEpzWkhlTnpSVkZIWTFaNythbFJJZm9WYU9xQlY4MzdSMzhtMzdnd2RQNndZ?=
 =?utf-8?B?bjRvdHRpWTJEUHp2RjdobjdyUHNScm5BS1JWUU5ZZjd4VExiR2lQTHhONEMz?=
 =?utf-8?B?d24rQVJnL0lBR0J0a2RKcWYxQm42NjJRb2JFYkVZNEZKaGFDVWozS2xKRHpx?=
 =?utf-8?B?bWk5MFFsb25ESXN6OW1OZXQvYmtvNFBYMzdHKzBqRldhVE4xMklxeXJFaHNs?=
 =?utf-8?B?SEdrNko1UE5ud1dCZFp1NzFvMmRUL0YvYmRsNVkwRktUek5IMWdTZUhFQnBM?=
 =?utf-8?B?RnRIckUyOUlUNWl4N1NaVkc0M3gzUXhiT2p3eGUrNmJNeTlOWHEyUUNZVTlT?=
 =?utf-8?B?WG1uV3cwcGQzc09zazJrSTN6TStBU2ZHTkJaNXM1RW9QTGVtaGxpM2hyV1Er?=
 =?utf-8?B?Ri8wbGplOExIclNsSzdqS0pxeUxTMnI1WDdGeGZtV2drS2NQZi81c0FFbDFx?=
 =?utf-8?B?aG04d1F0NkVDTSs0Nms2ZC9QT21aU2VJOWZXSWdNZ2F4K1JwTThXeEhPZ1hS?=
 =?utf-8?B?d1NmdVhqVXR3M2JURGJtMjJOMnBaZjBZTDJCRnVIb0lwdDVCZUp6OE9xS2tt?=
 =?utf-8?B?Qng1aFdDTU9kd0toS0pRNHVhZ0VkNkNIRExobU5ObVBXNEo3Z0xNTXRCRFRu?=
 =?utf-8?B?b0llVHFwd2FyVHBUTkd1WWFwQktmQXB6OXZSODR4OUhpSHJsNExyRjJadTMr?=
 =?utf-8?B?ams3VHExZkNJbGd6TXBGZHAxQ2tpcGxDcTBkQVJUK055OFlVZ0NSMnlxNDVC?=
 =?utf-8?B?VXlkaDlHQUJ3cUc1SXFTUzdsTWVlZ2VsR1FYd1l5V3FqM29ydFdTLzBIOHRC?=
 =?utf-8?B?QkRob01BanNDZURwUFBXUTR3Z1dHTU5iSXpyTU0wZStXeDQySCtScmhEbkRB?=
 =?utf-8?B?UFZNZHdFQXFHWjJVRE1TS3REN2FJYktXMC90OTkxU3FOUks4L1U5Yjl3cXJn?=
 =?utf-8?B?NkFkKzVDVytadVlZb1lOc05QL05tZjBCUmVZUzkxYVBwZWlHRkpnWmNsU0dm?=
 =?utf-8?B?RUVTMUdHQzdjRHJnbitUeDBDV2tWSURKdEd1am5mcmJuUGlDSUNoT1VmYVA3?=
 =?utf-8?B?cWNmbm1jYjhXUHhCczNkNzR2U0FoQWE4cHE1bmJPdVJRakNrQ1lvRW1na2VS?=
 =?utf-8?B?a3U0d2VTSHFzeTIwRGhjR3hqSS93NDFWRk9Xck1sbTR3d2xkOG1mUE5lMml2?=
 =?utf-8?B?YU5xaHE0dlZUSnltQlJtNnVGdlJuODk4VmlxdWRZcDN5RE55WkdZcWdSWldM?=
 =?utf-8?B?d2UrSzkvM25ERkoyVlpaTmtOMTFCa2lSVVRIbFNDbm5ydWVmNFpIejV5VDBW?=
 =?utf-8?B?bDZid284RU1PMGZrWWp4bFpsK1d2b1c4VG1xRjNlY3dSUk5sK0F5L0JyN29q?=
 =?utf-8?B?WjFGMG5BZU5HTGtNUHU2Qk9rRXRtT1NjbmZTSkQ1Tm16S3ZUMDJoK2ZZSDdi?=
 =?utf-8?B?cGt5bzgxYlJWWUZIWmszeG5kMW1WWGhwckZLQVFkSzRZRVhybmwyQy9UZ0s3?=
 =?utf-8?B?VGQ2amVsMWRaenFkaFVNbEhmSDJ3VkVBYnVkTVRUcXcvNG5qcktEYjlGNDd3?=
 =?utf-8?B?VENKaWh3eW81M2dZbmNtVEVrSGZER0VXM3pLRFl2ZVFOTGlSUUpvQUIwVlFW?=
 =?utf-8?B?KzF2MU9na3B3QWRzSmJrSVVHajBoQ3V5NktrNjZ3SzJmeWMyVTZzWHpubStw?=
 =?utf-8?Q?pg7l/QtGdMkoVwwUK3Cg36ry2zHnU2Df+QZLMyE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66ea2cd-f82e-426d-8ec8-08d90a1bda84
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 08:01:39.9068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrAsSJhQRLgJ/U/rBJWilUU3EXG7uUPFMnLFEFbISvuUez7j2SfMQfzIfT4v8Y8Pn2M9hr23+MSCdr3jQFj7da2KD4y6xUk4GJqk0cbkoQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

28.04.2021 01:23, Roman Kagan wrote:
> On Fri, Apr 16, 2021 at 11:08:46AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We don't need all these states. The code refactored to use two boolean
>> variables looks simpler.
> 
> Indeed.
> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 125 ++++++++++++++--------------------------------------
>>   1 file changed, 34 insertions(+), 91 deletions(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index e1f39eda6c..2b26a033a4 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -66,24 +66,6 @@ typedef enum NBDClientState {
>>       NBD_CLIENT_QUIT
>>   } NBDClientState;
>>   
>> -typedef enum NBDConnectThreadState {
>> -    /* No thread, no pending results */
>> -    CONNECT_THREAD_NONE,
>> -
>> -    /* Thread is running, no results for now */
>> -    CONNECT_THREAD_RUNNING,
>> -
>> -    /*
>> -     * Thread is running, but requestor exited. Thread should close
>> -     * the new socket and free the connect state on exit.
>> -     */
>> -    CONNECT_THREAD_RUNNING_DETACHED,
>> -
>> -    /* Thread finished, results are stored in a state */
>> -    CONNECT_THREAD_FAIL,
>> -    CONNECT_THREAD_SUCCESS
>> -} NBDConnectThreadState;
>> -
>>   typedef struct NBDConnectThread {
>>       /* Initialization constants */
>>       SocketAddress *saddr; /* address to connect to */
>> @@ -97,7 +79,8 @@ typedef struct NBDConnectThread {
>>   
>>       QemuMutex mutex;
>>       /* All further fields are protected by mutex */
>> -    NBDConnectThreadState state; /* current state of the thread */
>> +    bool running; /* thread is running now */
>> +    bool detached; /* thread is detached and should cleanup the state */
>>       Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
>>   } NBDConnectThread;
>>   
>> @@ -147,17 +130,17 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
>>   {
>>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>>       NBDConnectThread *thr = s->connect_thread;
>> -    bool thr_running;
>> +    bool do_free;
>>   
>>       qemu_mutex_lock(&thr->mutex);
>> -    thr_running = thr->state == CONNECT_THREAD_RUNNING;
>> -    if (thr_running) {
>> -        thr->state = CONNECT_THREAD_RUNNING_DETACHED;
>> +    if (thr->running) {
>> +        thr->detached = true;
>>       }
>> +    do_free = !thr->running && !thr->detached;
> 
> This is redundant.  You can unconditionally set ->detached and only
> depend on ->running for the rest of this function.

Still, I don't want to set ->detached unconditionally, just to not break its meaning (even before freeing). And that fact that detached is set only once worth assertion. So, I think:

assert(!thr->detached);
if (thr->running) {
   thr->detached = true;
} else {
   do_free = true;
}

> 
>>       qemu_mutex_unlock(&thr->mutex);
>>   
>>       /* the runaway thread will clean it up itself */
>> -    if (!thr_running) {
>> +    if (do_free) {
>>           nbd_free_connect_thread(thr);
>>       }
>>   
>> @@ -373,7 +356,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
>>   
>>       *s->connect_thread = (NBDConnectThread) {
>>           .saddr = QAPI_CLONE(SocketAddress, s->saddr),
>> -        .state = CONNECT_THREAD_NONE,
>>       };
>>   
>>       qemu_mutex_init(&s->connect_thread->mutex);
>> @@ -408,20 +390,13 @@ static void *connect_thread_func(void *opaque)
>>   
>>       qemu_mutex_lock(&thr->mutex);
>>   
>> -    switch (thr->state) {
>> -    case CONNECT_THREAD_RUNNING:
>> -        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
>> -        if (thr->wait_co) {
>> -            aio_co_schedule(NULL, thr->wait_co);
>> -            thr->wait_co = NULL;
>> -        }
>> -        break;
>> -    case CONNECT_THREAD_RUNNING_DETACHED:
>> -        do_free = true;
>> -        break;
>> -    default:
>> -        abort();
>> +    assert(thr->running);
>> +    thr->running = false;
>> +    if (thr->wait_co) {
>> +        aio_co_schedule(NULL, thr->wait_co);
>> +        thr->wait_co = NULL;
>>       }
>> +    do_free = thr->detached;
>>   
>>       qemu_mutex_unlock(&thr->mutex);
>>   
>> @@ -435,36 +410,24 @@ static void *connect_thread_func(void *opaque)
>>   static int coroutine_fn
>>   nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>>   {
>> -    int ret;
>>       QemuThread thread;
>>       BDRVNBDState *s = bs->opaque;
>>       NBDConnectThread *thr = s->connect_thread;
>>   
>> +    assert(!s->sioc);
>> +
>>       qemu_mutex_lock(&thr->mutex);
>>   
>> -    switch (thr->state) {
>> -    case CONNECT_THREAD_FAIL:
>> -    case CONNECT_THREAD_NONE:
>> +    if (!thr->running) {
>> +        if (thr->sioc) {
>> +            /* Previous attempt finally succeeded in background */
>> +            goto out;
>> +        }
>> +        thr->running = true;
>>           error_free(thr->err);
>>           thr->err = NULL;
>> -        thr->state = CONNECT_THREAD_RUNNING;
>>           qemu_thread_create(&thread, "nbd-connect",
>>                              connect_thread_func, thr, QEMU_THREAD_DETACHED);
>> -        break;
>> -    case CONNECT_THREAD_SUCCESS:
>> -        /* Previous attempt finally succeeded in background */
>> -        thr->state = CONNECT_THREAD_NONE;
>> -        s->sioc = thr->sioc;
>> -        thr->sioc = NULL;
>> -        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
>> -                               nbd_yank, bs);
>> -        qemu_mutex_unlock(&thr->mutex);
>> -        return 0;
>> -    case CONNECT_THREAD_RUNNING:
>> -        /* Already running, will wait */
>> -        break;
>> -    default:
>> -        abort();
>>       }
>>   
>>       thr->wait_co = qemu_coroutine_self();
>> @@ -479,10 +442,15 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>>   
>>       qemu_mutex_lock(&thr->mutex);
>>   
>> -    switch (thr->state) {
>> -    case CONNECT_THREAD_SUCCESS:
>> -    case CONNECT_THREAD_FAIL:
>> -        thr->state = CONNECT_THREAD_NONE;
>> +out:
>> +    if (thr->running) {
>> +        /*
>> +         * Obviously, drained section wants to start. Report the attempt as
>> +         * failed. Still connect thread is executing in background, and its
>> +         * result may be used for next connection attempt.
>> +         */
> 
> I must admit this wasn't quite obvious to me when I started looking at
> this code.  While you're moving this comment, can you please consider
> rephrasing it?  How about this:
> 
>          /*
> 	 * The connection attempt was canceled and the coroutine resumed
> 	 * before the connection thread finished its job.  Report the
> 	 * attempt as failed, but leave the connection thread running,
> 	 * to reuse it for the next connection attempt.
> 	 */

Yes agree. Moreover, when code is moved to separate file, it shouldn't care _why_ it is cancelled, and comment should not mention drained sections. It's cancelled because user cancel it.

> 
>> +        error_setg(errp, "Connection attempt cancelled by other operation");
>> +    } else {
>>           error_propagate(errp, thr->err);
>>           thr->err = NULL;
>>           s->sioc = thr->sioc;
>> @@ -491,33 +459,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>>               yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
>>                                      nbd_yank, bs);
>>           }
>> -        ret = (s->sioc ? 0 : -1);
>> -        break;
>> -    case CONNECT_THREAD_RUNNING:
>> -    case CONNECT_THREAD_RUNNING_DETACHED:
>> -        /*
>> -         * Obviously, drained section wants to start. Report the attempt as
>> -         * failed. Still connect thread is executing in background, and its
>> -         * result may be used for next connection attempt.
>> -         */
>> -        ret = -1;
>> -        error_setg(errp, "Connection attempt cancelled by other operation");
>> -        break;
>> -
>> -    case CONNECT_THREAD_NONE:
>> -        /*
>> -         * Impossible. We've seen this thread running. So it should be
>> -         * running or at least give some results.
>> -         */
>> -        abort();
>> -
>> -    default:
>> -        abort();
>>       }
>>   
>>       qemu_mutex_unlock(&thr->mutex);
>>   
>> -    return ret;
>> +    return s->sioc ? 0 : -1;
>>   }
>>   
>>   /*
>> @@ -532,12 +478,9 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs)
>>   
>>       qemu_mutex_lock(&thr->mutex);
>>   
>> -    if (thr->state == CONNECT_THREAD_RUNNING) {
>> -        /* We can cancel only in running state, when bh is not yet scheduled */
>> -        if (thr->wait_co) {
>> -            aio_co_schedule(NULL, thr->wait_co);
>> -            thr->wait_co = NULL;
>> -        }
>> +    if (thr->wait_co) {
>> +        aio_co_schedule(NULL, thr->wait_co);
>> +        thr->wait_co = NULL;
> 
> Ah, so you get rid of this redundant check in this patch.  Fine by me;
> please disregard my comment on this matter to the previous patch, then.
> 
> Roman.
>>       }
>>   
>>       qemu_mutex_unlock(&thr->mutex);
>> -- 
>> 2.29.2
>>


-- 
Best regards,
Vladimir

