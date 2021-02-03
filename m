Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B351030DAB7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:12:46 +0100 (CET)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Hxc-0001Ek-B6
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7Hvs-0000f8-8i; Wed, 03 Feb 2021 08:10:56 -0500
Received: from mail-db8eur05on2114.outbound.protection.outlook.com
 ([40.107.20.114]:13664 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7Hvm-0000VF-4l; Wed, 03 Feb 2021 08:10:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5PB+i11MaASpZLyq4VX6oQtckcSQV+f41l5svotMU8JEInD7j2Wxgz2V5XmtO2DCDkG3BoelPDpzz3BfaG9dix38HbJCSEayvN2PHNSvcozyC7wt+xkBxeoGCtyYISTYjUEkiYPWkPE7BpluBlUlE5Jix23kbFSI5xnwD0SK7mJ4k8UI3GUIqtm8ECjM3n2yNy0dAqO9JK5lSPeuPidVnE/0godtZ/0/QrX1mIB9kjzKHLr1URJgkhi+CiAohsOO/J01jLxAkkUsh24YKChWDkavJoADLOULVkFceJX9tJW/N5bkM/mj7drl6N2ems5Iz54cmjvvGODYMR8Gwoieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f8oN1BRhfR/MRUfrBbgdnxtJM+vBglqi0bFsC6DkfU=;
 b=Duc+Uw/w1aZBzmFjRToxfuOwJ3No4KqAKeAxwws7QTutHiXpJwNl1SqYW0ylEm2b4QWQE5hK4V16ODaVzoQeXePnFEG8tU4y38XgLlbEotnXRuP+CAv6VkS2nH9zULL5YFXnQPdh5EjqVAsssjcBRrxWI/npwuY9e9J4WrLSDH0dMjcCj3XAJXlzfcjxkRDYDwPomXy1ElhGYgHKCZ0N4ed8Y/QJ4TuCxY0LlGVjfKqgFe68bnhpItsJYzXUCtMT7C/6iabOkMVBuSkF6MKQ18YRpgmHeJXr0ukxMDcnSkscaGHsMZhC+Vy5yI68xdBhHyXlZdMmBVGONfZ1mYJ5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f8oN1BRhfR/MRUfrBbgdnxtJM+vBglqi0bFsC6DkfU=;
 b=DCQf4MLiHeipZOISZBo/jUUTH0un36hLBnYJFGvHLGpVU3vGoEQG1ypNJ2xlVtRqVqZmfbphpkW6QwYVcftoUNEqq+4trdNGhZwnVMaPy5bZat5Yg3dQESZsTKwoK7HwmZAzDZrUDkf6DQ6D/q792zDJGfypJKxD5qIou1aiOa0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Wed, 3 Feb
 2021 13:10:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Wed, 3 Feb 2021
 13:10:42 +0000
Subject: Re: [PATCH 1/4] block/nbd: fix drain dead-lock because of nbd
 reconnect-delay
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, den@openvz.org
References: <20200903190301.367620-1-vsementsov@virtuozzo.com>
 <20200903190301.367620-2-vsementsov@virtuozzo.com>
 <20210203105305.GA113539@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <903d9c6f-b6ed-cff7-b2d3-29945165f6d0@virtuozzo.com>
Date: Wed, 3 Feb 2021 16:10:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203105305.GA113539@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM8P190CA0003.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM8P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.20 via Frontend Transport; Wed, 3 Feb 2021 13:10:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e2bf058-4cc0-4057-990d-08d8c8451c57
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6374B9BC16F4BB9A2659E07DC1B49@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:214;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ECP3fD6+G68Kpv7/jpixEvEwxdV9vKfUVWpEWR9sj6TraxB72M3QkX738JJEnXeae17EN3SgRJvCm/uyp00vsrT0PQC6UJ4fut7WPtYkqYKAm87q6eogDarRuDXJ53QeaOh5NVbSCKUclVP+OEcNIbt3Tim8aIyse5YKuOBIEZWYN4ZrGmZfUb4qgKEZw7Uv2/Uj/3v++ZRPYVwZdza17EEJdXfm037EgTc7qkILhXAVBFEj29P9lBor+rhllGd8xMPKFUaY7L3e9jrZO7Lf1rlyg2HgJraHKV9EdTZY948YDd5J/r2Ei5RX3yFe5r+smGgW2Bc3/i5W5z976amJMqStTuX5qrlXUOw0N3B2ENbmsfKUvrOa2z5rhyf4Z7WTWP95xgVuyrxO42iR7I3jhkWpqMmVLQz9+7TL4xkzZnYcmbvx+YJsp9wj7tBoEuPxGydbe8JYApe5uMAGqZBOYyQiF4n/s7D/yY6Am2JvQ0GC8P291iJUNvf4PQwxYALJNGrfCry9oypCgnGncwew4FrM05oISezApJDliA/GeRCH5pGpnQJcku8iZGuJm13pqoJxA+v36S+t/SJgXD9+stuuCJzqFhIJESM9wJdMkTQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(39840400004)(346002)(2906002)(52116002)(478600001)(66476007)(2616005)(66946007)(86362001)(956004)(8936002)(8676002)(26005)(31686004)(6486002)(16576012)(36756003)(16526019)(186003)(316002)(5660300002)(31696002)(83380400001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UkZUcWtpWUZDRDQzd2JpRFlseEt4dFM2am5QMHNVZHUzK1kySi91T3RseWRU?=
 =?utf-8?B?aGJrR2ZrMVdSUVBtRHorT0c0d2NkdElpV29mOGttb0YxbUlib1BITkRRZmlu?=
 =?utf-8?B?VDlZeVkrNDU5ZmI2dHp6Tnk5OXNMb3l0dGpxYUY3UHdUNHNHY01EUEgzTndB?=
 =?utf-8?B?TzhWUENKSHVMS2hrNkoydFZqQzRlQU5jT0JVdnNlU3N5bVdGV2xpeTdCZ09Z?=
 =?utf-8?B?bHlvbDdJNkhhMW5MQ3lzbzZwN3h1M1lwMWRCVzFmemVGWWh4Uzg2blBOanky?=
 =?utf-8?B?TkROcnpEejNGK0o4K2lSS3JsanZVQnozc3ZId2FMSVpBQXErSnVsdGIvMTU1?=
 =?utf-8?B?SVhWNmI3Q2dsVVh5VlJZMVZJYStZOVkxTG9vT0J0Rk1vb0tJK0J3QjJDVlZ6?=
 =?utf-8?B?QzVPZnZ1bjBPVUJidGpENTNydE5hTU1vVnk3Z3RzcW83N1BMSVlkTWFDOFU2?=
 =?utf-8?B?cFVkbzhOaHlaYjZuU0VxMXh2WGtTNWVuSDJoOXpuU2VrUVI0MVRSOW5ienAr?=
 =?utf-8?B?L082c2R6MlBiQk1wWUpSenZrYlVld1NsMUg4V3RoVGU0M0luK05KVUUzRDdy?=
 =?utf-8?B?T1V3WUo5MTNSMmhGS0lYQ0U0dGYrNXNtai9WeGZGbzZJaWtlbCtCQVY2VWdK?=
 =?utf-8?B?b25MWDNzVkVkU2xqZkR4eTU0SlJIRU5VOTRMOUpJdVdaSERRM3NyVHFiYjlS?=
 =?utf-8?B?Y2RLS0hnZGlFTVdkbGcyM0NQRWNMbVFPMGxGblBIM09CRGlLQ0xvSjBrTFVa?=
 =?utf-8?B?RjdSd05BUmZrNGw0clhFODFBU2NJWU5hK1lYb0N4OTFUc0dQSUhTY0w5UUNh?=
 =?utf-8?B?OC9CRWpUQXRmeFdpU1pMaG9mcWc1NjF5RkpkMEcycGFWaGJxUUg3UmJ3T2d2?=
 =?utf-8?B?c0VjSStZSENCS0lYN0c4R2tyR1NHdEsrbitHcmprU0JNVysxbU80dHlDaCtu?=
 =?utf-8?B?S0VVb3pjV2c4VUhUdzlFT3QyWUttR1lQUDZXZHE1OHVDaWFnZFZpeVdiOVlP?=
 =?utf-8?B?UnhXajdxU0c3cFh0OXBjb2RmSU5pTllrVTlRam9ieU1qdENvdWQrWjgzM014?=
 =?utf-8?B?MFdSM2xHRzIzZlk3eWxZMUxSYVJxVUp4M1BkRXVobjVUckxDaEVlbUZIbEZr?=
 =?utf-8?B?VGVKS0daTW9OZzNzQTV4NERFU0FlbDNlemtwUTdVd24wT0MxUDNBSTJlY01k?=
 =?utf-8?B?cHA1RkZ6R25ITkxwUERzMHQvTlNNNC9sSXhEMXhmR2l6cHJPdUo1SnBwYnZJ?=
 =?utf-8?B?dnBjY2JKT0ZDSzFXUTU5dE5XQUROeENyenhMWE5oL2E4UmV5M2Z1b0pFTmcx?=
 =?utf-8?B?OEViVUZMSGhBMGozWEhjbE1WcDdWVkNiM2lqeWpNT3FYQUdqNmQrRG5LcXBl?=
 =?utf-8?B?Q1ZYaHB5Uzh3azFJTnlmaEJWaW56UXFUWml5b1JMVGRITy9ZVEpPWGwyNm9V?=
 =?utf-8?B?cnVVbUFnQ3F0RFluU0ZYTzJESlc5TE1LS1NlRzJBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2bf058-4cc0-4057-990d-08d8c8451c57
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 13:10:42.8767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5FffnnwKaJC5IPSV9J1CAxZEjO6ZlJHkA+jS2iC0jbtalOjKEXEQN/tBqpTe4mGQRhKuX+FT+w+8Y+UsFS0zL/o6OGDbWnyJXLwFmbQE/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.20.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7,
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

03.02.2021 13:53, Roman Kagan wrote:
> On Thu, Sep 03, 2020 at 10:02:58PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We pause reconnect process during drained section. So, if we have some
>> requests, waiting for reconnect we should cancel them, otherwise they
>> deadlock the drained section.
>>
>> How to reproduce:
>>
>> 1. Create an image:
>>     qemu-img create -f qcow2 xx 100M
>>
>> 2. Start NBD server:
>>     qemu-nbd xx
>>
>> 3. Start vm with second nbd disk on node2, like this:
>>
>>    ./build/x86_64-softmmu/qemu-system-x86_64 -nodefaults -drive \
>>       file=/work/images/cent7.qcow2 -drive \
>>       driver=nbd,server.type=inet,server.host=192.168.100.5,server.port=10809,reconnect-delay=60 \
>>       -vnc :0 -m 2G -enable-kvm -vga std
>>
>> 4. Access the vm through vnc (or some other way?), and check that NBD
>>     drive works:
>>
>>     dd if=/dev/sdb of=/dev/null bs=1M count=10
>>
>>     - the command should succeed.
>>
>> 5. Now, kill the nbd server, and run dd in the guest again:
>>
>>     dd if=/dev/sdb of=/dev/null bs=1M count=10
>>
>> Now Qemu is trying to reconnect, and dd-generated requests are waiting
>> for the connection (they will wait up to 60 seconds (see
>> reconnect-delay option above) and than fail). But suddenly, vm may
>> totally hang in the deadlock. You may need to increase reconnect-delay
>> period to catch the dead-lock.
>>
>> VM doesn't respond because drain dead-lock happens in cpu thread with
>> global mutex taken. That's not good thing by itself and is not fixed
>> by this commit (true way is using iothreads). Still this commit fixes
>> drain dead-lock itself.
>>
>> Note: probably, we can instead continue to reconnect during drained
>> section. To achieve this, we may move negotiation to the connect thread
>> to make it independent of bs aio context. But expanding drained section
>> doesn't seem good anyway. So, let's now fix the bug the simplest way.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 9daf003bea..912ea27be7 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -242,6 +242,11 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
>>       }
>>   
>>       nbd_co_establish_connection_cancel(bs, false);
>> +
>> +    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
>> +        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
>> +        qemu_co_queue_restart_all(&s->free_sema);
>> +    }
>>   }
>>   
>>   static void coroutine_fn nbd_client_co_drain_end(BlockDriverState *bs)
> 
> This basically defeats the whole purpose of reconnect: if the nbd client
> is trying to reconnect, drain effectively cancels that and makes all
> in-flight requests to complete with an error.
> 
> I'm not suggesting to revert this patch (it's now in the tree as commit
> 8c517de24a), because the deadlock is no better, but I'm afraid the only
> real fix is to implement reconnect during the drain section.  I'm still
> trying to get my head around it so no patch yet, but I just wanted to
> bring this up in case anybody beats me to it.
> 


What do you mean by "reconnect during drained section"? Trying to establish the connection? Or keeping in-flight requests instead of cancelling them? We can't keep in-flight requests during drained section, as it's the whole sense of drained-section: no in-flight requests. So we'll have to wait for them at drain_begin (waiting up to reconnect-delay, which doesn't seem good and triggers dead-lock for non-iothread environment) or just cancel them..

Do you argue that waiting on drained-begin is somehow better than cancelling?

Or, the problem is that after drained section (assume it was short) we are in NBD_CLIENT_CONNECTING_NOWAIT ?  Fixing it should be simple enough, we just need to check the time at drained_end and if the delay is not expired enable NBD_CLIENT_CONNECTING_WAIT agaub,,


-- 
Best regards,
Vladimir

