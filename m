Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1FB39F344
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:14:16 +0200 (CEST)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYkR-0005Cy-5D
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqYie-0004OJ-Il; Tue, 08 Jun 2021 06:12:24 -0400
Received: from mail-eopbgr80112.outbound.protection.outlook.com
 ([40.107.8.112]:45863 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqYiY-0004kd-Nz; Tue, 08 Jun 2021 06:12:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAchOciRS+ah60BBAlrRnWLRDLzLpcbYahxf1QmqAtQU9viqe2l6J62qjPq5Qe6lf5hODymogmB6BupdJEcX0maavSGVPrMBWzjFAed1m4MIpf4VHiPR5vUXHtkBdbHHllp3Wto9R7egfdkQqex8STV/z2TqXNIJlJq+WBcdPRGQ1JW2Wh1FBuULrFFydeaA2Sd+S1Q1KCwVIsSJ5Qb2etMa0z/PLzd0bMJSitkjoPB4UChCCLT6A6rDhT8hMJ+GPXbndpUYt5+xkdAjErUmCb8XXppYAk2CItEpCMARXku4kXLgfrm8poMxuDAwhMKnblgX5c4Ctn+UvX8bQ1+5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFHnBvm2ph3z/IjQAm8Fzne1/YHyW4sh2sH/PLEiJMk=;
 b=AF0AebL3ZbrTI9t/jTHlOoi5wMuw0y6GZZGLDGA0fgVpKodQAv6duZGwY5jqnOqjzzTs8hPFdAZxZ0zL+oXdWs8V1Rbj2b7YuKW/RF5kp8OITMT8GSUYznN97gQpsYU6KeDRz6ou8J3pu26et+oHK2mSj88Uxak3akMvv9IqSdhmKVj6D/S4yL/8R5EjZn3uYwC087AncnaNu8uUik/PP19VeFzAfsnBMsVpJFUN/jUE1YUDifd1IJ3p1ZwKsfsrQvG93Nm/Gbcx6gM1lFeDbJi8LP95sVu4fDByr9JEkpSJcd7fEUEmuOhHYT5++SxD9F68n4eJ8UK5UP3V5xjP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFHnBvm2ph3z/IjQAm8Fzne1/YHyW4sh2sH/PLEiJMk=;
 b=CUWzBTcEXSvoi6WbuCTjFd1DIcJr0pkJ2B9066lqhhXIaw8RJBephAGhNf7V28034acc4hnE3fwuwYtmiFyqujPB7GHdd6o2eksN7k/d0G824yAnZ0IHjf8dVfNObs+n5djqsvQNuigC/9GSpJK8SktFr+FdNX5i3Iq7klTW7AE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 10:12:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 10:12:14 +0000
Subject: Re: [PATCH v3 09/33] block/nbd: bs-independent interface for
 nbd_co_establish_connection()
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-10-vsementsov@virtuozzo.com>
 <20210602191425.lljb7anvjjjakpzr@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6c1342cf-85b4-1c3c-da56-ccaef67779c2@virtuozzo.com>
Date: Tue, 8 Jun 2021 13:12:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210602191425.lljb7anvjjjakpzr@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3PR09CA0014.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:102:b7::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 10:12:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f575f2fb-72b2-4cc7-6fa4-08d92a65e378
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494024D61AB12A67D934B01C1379@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PyMwBDG+GowcVG6OcqA889+/Tkp+WOJAuuVEFwjY50entNZtgHXPe2iGlNcODjZ4zQPjx0Jwc8md0Vgqp1PWyuo1tdlIwblhPy3fLNL+GF6pGYUktBs5idEkqJjGA+xbrBzWdSoc4LOfAvdlhkG3CHOO5LyPnB2wL56b+WuDvInZwBV4fFVHIpoSYEGMWC/3o5oP45ElsIJWxlfNCxl8l7I/YVwNcBqJHpaaQt0wk5cNl7VC/0u/DnIeTtsJEsKas8WWy6k8GReMqncL/eDUPhj8LjkFS8yMJ6vAQ0XJEL0o6NfDKmgB/gq+CIyplwvpQXrTOlbzM1mNG2MMT3qSgR8TzlsC8B48lhTy0u4xlyRuKE7QNBvomTCgnOJx8dxd65dyv8inYweXVsuSLpt/J6e4meagOVh6IYkcy+yhlB9F/LGfELEfaCx70x+ia7w57u9Q98G/jRo39I8oVdujQODFHvOrRFe+4uxKJy7Uft97GRnLl7Z5CuMzc2Y3Dm39CJaTxo+9r1Qe2CcWrELNQOTG8Ve7OR00d1MenneJ1J79YNiSoqwab5TdjmhhrXz20H7V56xYpvoKpMjBSy17Lz6Lrd2k8BXmmOara2MxzRSoJ4r7BlimNAPHGlCzg4N0Xl8iYNX9oZwijTU8FxfsPNzKnd/SVifOekAXHdpplC5MX9lP32f1DPvg5ZQajGfd8G7DkZ+q0vVCW7bh3oa80gjhHdRLHBM6V2C6S6fw/nY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(396003)(346002)(4326008)(8936002)(31696002)(38100700002)(16576012)(66476007)(66556008)(66946007)(107886003)(16526019)(36756003)(86362001)(8676002)(6916009)(26005)(2616005)(52116002)(478600001)(5660300002)(2906002)(956004)(316002)(83380400001)(6486002)(186003)(38350700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y1cxenBzZ3prUk9HWFlBZ1JIRTV5NXhwb0JMWS9pWXRFSFZFNllmVDZvcDMz?=
 =?utf-8?B?Y3NXYmVTd3ZQd0ZCS0NtQXIxcHhFa2tBMy82STNuYmtYMG5wbmJaVDdxUUN5?=
 =?utf-8?B?ZlFaT0o0SENhYk1PRW5GWDRxRVh5amFuOU0vMU5LcGQ0Y3BDc1RadzY3ZmYr?=
 =?utf-8?B?UVB1eHVzWTBwT3ZMTWh1bmtGaW10Ri9HUHVCcXFrek5tZkdaMU1GODVrV0Z5?=
 =?utf-8?B?MWMxcEZ0bGowRDN2R1liKzFHNXkwM3Y4L2VjK0NmT3JkclhNdkJ6eWlkREMx?=
 =?utf-8?B?WXhGaUFEemM3L3phb01GOFRkYVNia1QwYjcwdTk1aE5xaS9wOXFvbFhTSC9E?=
 =?utf-8?B?Uy9qTGtlNHFodUZSL2ZCcXlDWXM1M3NGd2cxMGMrRm04V0hNUGV1NnBnd05R?=
 =?utf-8?B?T0RuK3d6eExyT0tycktqc1ZBWUphSlZtcjgwZzgxMDlHQ25MQnlEZEVJQXdV?=
 =?utf-8?B?aVpRc294MjNIS0wwTWgyNThIYUFLczJlRFhHd0o3QnI0Q21JSWpQaHoyQm1H?=
 =?utf-8?B?cU9uMXNOOVdSbnJqbEw5WXRoNzFiWStVUzB3a1R5STdkVVowb1ZUYUIybFJ3?=
 =?utf-8?B?R2xmVzNpaVBXZWU5MUhVc3ZGRHZDbVhvYmlwNEdMZEtBK2FkSHRnUFJ6R2hz?=
 =?utf-8?B?U2c0b3JsM1I5UVdpT0pjdjR6U2VDcDBmWWxheFNJQUpyZVBCR1pMRURYWDJT?=
 =?utf-8?B?SjExRUorZkxmbCtJblg5UXpDMkJMcWdSaEpROWxVdzFwa2x0R3VGQmIvbUMz?=
 =?utf-8?B?M1BQajVMUEgrODFkdXlmbXlzdXVsR3Z4OHpsNEQ4L043M3BVRS9KTXpDd2s4?=
 =?utf-8?B?WDk0Mm9NQ2kzWUFnTS92ellmRGpac0ZiaVJZaW03UnJHVXVpTWdVTVNhMFh6?=
 =?utf-8?B?WW9HdFRlb2U5OTFwb3BtbmVyWkJvSkhOWXU2N0Z6NWI3WC9oQVk1Z2dqeTMv?=
 =?utf-8?B?OTRZTU05dWl5TnEyNWxhQzBGaUZPRmNyaEtkTVM0cVNxalVuajArN1JKTlNO?=
 =?utf-8?B?Q29oWG45ZXVtLzlaZWh5YjJXVG1nK0ZNOFNsZEVmNlNZNE1hc0s5bWZlYUJ4?=
 =?utf-8?B?VVFKUm50VUJPZEwzZklWUzB1R2duSS9mT2l4ZERHYnV1R0llRUhIZlNoaW1C?=
 =?utf-8?B?bytVN3Y4NlhiaG5zV0s5VFhRc3NpWFJSR0lpTXgrNkU4Z1hobHJ1VHg2Wmgz?=
 =?utf-8?B?bml4b3BpaW14OG50NEUzeEhjWGZwWk40VGh2VmFuaGxLU25ueldSNGVjVG40?=
 =?utf-8?B?Zk0yOXU1dU1QTHZlZk42dUh1RkxQTnhQWUl5RDNQcWQweW5Oekk2Y3A3UXZS?=
 =?utf-8?B?YXBiVzhRQkVUNDl0NExoVjYxVStSTmxMUSszbVBNV3B6ZFhLenpQckpFZGcw?=
 =?utf-8?B?TnpUQkkwbmI3V3QrWkxZZW1uRTJXZWxVbVhscVNEbnAySTZrUUFtMWVuSXU5?=
 =?utf-8?B?c2tYbVJrdzBqUWkzVlZ3akZzcHlKUHA1SjVXb2hhRkU1anBDQmhpNzlFQjhC?=
 =?utf-8?B?bDFYdkdtSS8xbGFGQUpLaTIrYjFaVUx2bWlPNFQrRlhva0FwRWR6ZDlsWlI3?=
 =?utf-8?B?Y1FHY2k1c29GWmVTRzgrYWg1Q0M4cU9MakkzaHhWNjlNM2txb1p1VklZSFo1?=
 =?utf-8?B?bGVVOGVpVWNySFZYQ2xTb2NoZmhmVUtVcCtXZ3d5VDdKMHo3bDlMeDZRUUxW?=
 =?utf-8?B?TDJxQ3FJQ2dnT3g0UWJtbk10MG1DOU56VUlVLzIyK2haNjZSQW1OTU1hRnFZ?=
 =?utf-8?Q?een0mHQ4Sqyt6f5c6HX8RbMfMppccibQIiQUNfL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f575f2fb-72b2-4cc7-6fa4-08d92a65e378
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 10:12:14.7852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umisLtE/mr2d6RVTeHoqAuB4oTOpcOGqF2AeGLNdrUIXZodIuyxUA/hxlHTieltpBC78fRH4OtQ9V4I40fTg+RPZeW8bd7mZ5vXUw9tjvaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.8.112;
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

02.06.2021 22:14, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:08:47AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to split connection code to separate file. Now we are
> 
> to a separate
> 
>> ready to give nbd_co_establish_connection() clean and bs-independent
>> interface.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
>> ---
>>   block/nbd.c | 49 +++++++++++++++++++++++++++++++------------------
>>   1 file changed, 31 insertions(+), 18 deletions(-)
>>
> 
>> -static int coroutine_fn
>> -nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>> +/*
>> + * Get a new connection in context of @thr:
>> + *   if thread is running, wait for completion
> 
> if the thread is running,...
> 
>> + *   if thread is already succeeded in background, and user didn't get the
> 
> if the thread already succeeded in the background,...
> 
>> + *     result, just return it now
>> + *   otherwise if thread is not running, start a thread and wait for completion
> 
> otherwise, the thread is not running, so start...
> 
>> + */
>> +static coroutine_fn QIOChannelSocket *
>> +nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
>>   {
>> +    QIOChannelSocket *sioc = NULL;
>>       QemuThread thread;
>> -    BDRVNBDState *s = bs->opaque;
>> -    NBDConnectThread *thr = s->connect_thread;
>> -
>> -    assert(!s->sioc);
>>   
>>       qemu_mutex_lock(&thr->mutex);
>>   
>> +    /*
>> +     * Don't call nbd_co_establish_connection() in several coroutines in
>> +     * parallel. Only one call at once is supported.
>> +     */
>> +    assert(!thr->wait_co);
>> +
>>       if (!thr->running) {
>>           if (thr->sioc) {
>>               /* Previous attempt finally succeeded in background */
>> -            goto out;
>> +            sioc = g_steal_pointer(&thr->sioc);
>> +            qemu_mutex_unlock(&thr->mutex);
> 
> Worth using QEMU_LOCK_GUARD() here?

Refactored together with other critical sections in patch 15

> 
>> +
>> +            return sioc;
>>           }
>> +
>>           thr->running = true;
>>           error_free(thr->err);
>>           thr->err = NULL;
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

