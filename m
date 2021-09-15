Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F1040C052
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 09:18:10 +0200 (CEST)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQPBJ-0001z5-QX
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 03:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQP8t-0008Ux-TP; Wed, 15 Sep 2021 03:15:39 -0400
Received: from mail-db8eur05on2135.outbound.protection.outlook.com
 ([40.107.20.135]:45024 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQP8h-0004nz-Da; Wed, 15 Sep 2021 03:15:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2QmfI3qXZEMwQYRnjKsRJ4QmwPt8y5txbz8tYQ6xd+XqHvykRb0ueMalarFxOehCMvWO2SaE2pzzcGeMWIPD5/uTwx8807AXPZCIxUEB9EmxYn/KVm8/LICB9Yj/QXkLq8HdUwN9Vff2Ujl02iXnBPcsKmw2QOBTcmHUyGZKlxKQtgOIaibUcFaS7mDUOAoCvoFEhergAKyecDleDDMfMCcERAyRaa9O3l/Z5XLqZlik1QdYdqCRP1ltoYT9kSkv8+iCC/rjBpcJhOv6lQRwNYTedWQRUn+FH3CsqtK/nJylqs0VYktx8Kfsdq6C1+Lwqp0LocQnMIbiHc9GMVTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=mdgqCdJAQN0vPlkOtFviaUdSN8+A2L13zn5D7l64UI8=;
 b=EpYlDiS9TJ2mUuwTzFrzOOqncn24rK+Pei3hzQSxs/mp7XSR7cvVvtBowF1rDwUc9hZGxMzYQz6+MH0z2iCh+F078qZsMb3bTXQGVcJcYyO0kVwf/K7l7H96Lmq6558+aIDFPhs5il2mmXAQN7J3ZjIXac99dSYIw8A2vVPoJiVA+jlyEhABrXh7sUmg+Wht1EadEhIJZdv3zVQDvn50edS/vEaJ0R7aoWvx4D7vS0uYwdCNXHMeMQFZ9NnkHfEYXtDIyf8ssFd+BFGtQ0qRvscKDd5ar07DMNPFan8hF+cSYf7in8Cxcc1jxluEksSptqgZg9QfMsm8dPe0hFtU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdgqCdJAQN0vPlkOtFviaUdSN8+A2L13zn5D7l64UI8=;
 b=LNb6Ga25JiRitgiZt1Wunyy7fQDL+S8Lp1SDeuKo9k6SUIAXWnPtq+chn9uMmW0dWf86j4TX1bq48bQ4wr/EOEvLLtMPFcJoJZS3kK1KI220yg0T8DnNyI+Gq8JHaA009AFT03iyREdQZ2DNhgkbsBsFIQVW2urYRhfJ+EEB4kY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4914.eurprd08.prod.outlook.com (2603:10a6:20b:cf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 07:15:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 07:15:22 +0000
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 eblake@redhat.com
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
 <20210914145200.GJ26415@redhat.com>
 <997fe8b4-3610-2336-c7f3-67a0e2cbf34e@virtuozzo.com>
 <20210914163232.GN26415@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0bdef3d9-df05-f49d-038c-9930c2677f54@virtuozzo.com>
Date: Wed, 15 Sep 2021 10:15:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210914163232.GN26415@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Wed, 15 Sep 2021 07:15:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b60a08d4-fcab-468a-6b39-08d9781894e4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4914:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4914F284C194FBECD341DF0DC1DB9@AM6PR08MB4914.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rwaevk1xHPQMlmVlhwzQXrM1NZmZF6bQn+5KM/xD7FVvwOs2r6OkGBR6dmKQQ4LLH1pU3NYL3o+r85Q8d+Y6k9TX9/fzBLX7KjnE/0d/7JbhCPdFyZ8CY622jObgxZz+wuVBR51E2k75Bpo83FVB4ac3jnE1wHaMoUQCG6a1BPHq0C2u1xl2qi4v56Yf49L7i7B7t6Rd9BZ5klBiAEjD1QLPD5rrnnh3O1p2UzrU9m2C+VvPc01iSbMO4zlL1KDkhjV6TYAZAoXITUsGzNFw7IVYMHbLyZtVH+zGfIZThue1EUDkR5oaKeEDL9Gb+C3FVwz6rxW/fwHO41DU6fYg9QTBovvbdbtvaFT2jsTo0lLHnUsElLLY5TP8UTIlqU0afCMlZI218XIBm2y0VOwvvoo9jo8pTtd8CgEDV+YomBQ/C6qk7nyfES+RN9+5SQjUVfVDVobQb5YUyAJ5bJvqvatDl6pExyyqyt8PcP0bABX1q3D7Oeg5JmdSXYCvJXtHKeJYcrKAzS6GYpUFt+LU5/l7LS/F6hT3yCAAs3c5UQfwOdJkEF3iP7nFZr0/JmNNaKtj/c10RTRVu3pUtVQiEEam5B28f1Oc2LrgY0Z07JVlDNpiyenoVtu4H/kOacs1xgYoscUPbLrSL4oqQkSYtFJJ22e97XyOHCNywcWalKlDqaQpCzlQ4rolYYfp1x0sW0PcigdvCX6DJzm/uAhI/I71iOwVOPsrY550tXxjuJYXh/6egHgiC1BxzUZUJFSBDaJ6RT+XBq6OoPDqsjWc4HgsMyzGxuaeEctqhKuCwGILdqwmeNtq5PHoL4gC8WeDZaFhhKzIubzbEvZ5Dw8a7moHC7T8pSK30EGC893pRwE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(316002)(16576012)(6486002)(4326008)(66946007)(5660300002)(36756003)(38350700002)(8936002)(38100700002)(956004)(26005)(8676002)(66556008)(66476007)(86362001)(52116002)(6916009)(186003)(2616005)(2906002)(66574015)(966005)(508600001)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3Rqb3Q5b1hRc3l6T2pCcW9rRitVVEVJVE5ocDgvbTRDNkxyWDduRHliRjJC?=
 =?utf-8?B?bUlsZFlZRWZ4V05sV29KVnZSSHpINUR2ZzVUZDVYTHlUbW96VG1wempzMnVs?=
 =?utf-8?B?MG9zMW02RG9uVXM0ZkhlR0dUR25SYlZXOUdaZHFlZzJKYmVlNVp2ZWliRlU3?=
 =?utf-8?B?U093V1N2SDJsRmtNVmJsdWNJbCtVMk5UejFkTkovOXBlTW9UZ3JnTytGL1Vp?=
 =?utf-8?B?OVlGOWFKSnB6Qkl0WUVpK25mQUdGQ2lzN2FFQmdSaVpwL2trOXJ3S0VOcTNh?=
 =?utf-8?B?TXd5UjNYUFhDaWJwRWlwaWVtTVlVQW5aTFdFSnp3QjkxVWF4a1RhVS9kWTZK?=
 =?utf-8?B?RlR0OGVES0lPdWJQSW5ndHdKcFJWVkV2ZzNuQ2xVZ055RVE4Tlk2RHhCOE54?=
 =?utf-8?B?T3VuREFMS1RDYnM2N1R0NU1ycFF2TEh1UVZFZFlrWmlZWS85REVvdGJXVnNW?=
 =?utf-8?B?KzhUc3UwUEo0aEE0MElpTVdZTnNXazZqMUJsUWJRWHB1WHA3S2ZiYld2bUdS?=
 =?utf-8?B?VHc1ZlhrSVBDQlhlaXkzTzIwWGppeVdkRmpWaVdmcnVCVG4zajRZL2NGU0J4?=
 =?utf-8?B?ZmQzY2xraHdUL3ZmR2VYb3lTcm4yWDlTWW9oVXR2TlYvb05HQThQRUtDcEVv?=
 =?utf-8?B?NE9RU1MwR1lMZEcxQWsvNFJybjhEV3V1TEZqVWJXNGdMNXQzZjRKaFk5dU9O?=
 =?utf-8?B?ZnBvb0NjMFVPRFE3dFA5L2lyMS9KN04rOS9rWldqZVdsZGJDcExQdjUwTUpS?=
 =?utf-8?B?eXFSaUl2eWFNeDdxZG1rbWY0cStLQUNzRW5HZVhGWmMwNUNoVEFLTjhuK1BZ?=
 =?utf-8?B?TzdXQTVKK2t3UjFxWjZjUVUxVTFwK2VheWRkL0ppOU8rdWVIY1ZWT0JwejZI?=
 =?utf-8?B?eVloNW55WDBDV21IbVZYYk41bjBBM3ltVnJLbElqSXpTQ0JoVHF3VjNMN0Vn?=
 =?utf-8?B?bWYrZE9qb0dZTHBUUTZrdDM3L2JvdUxUWTNUL0ZkeFFReG8zVzd5L2pzZHdq?=
 =?utf-8?B?LzQzbWhDeHY5OUkxVzlLa1ZYRzFEdER5OHZZcEJoSzd4RndUekVzZ25wMWZx?=
 =?utf-8?B?M3kwUjF6Y2Q0THR2Skx3NzY3RmRKS2VNbHE4RVZjTnpKeHRRaTU4Z1lCa1lz?=
 =?utf-8?B?STBLWnAxTzR3UWJHYmlTZFNEaEkvMXlPOFZzeHM4dlh3Vmt2MTM1MHVsMlp2?=
 =?utf-8?B?STVxRHNPcVNFSjE3a3UxTUxpdFNvUXZBRnRlT3dDZ2dPWXBLcm1UdGVsbGJ4?=
 =?utf-8?B?L05yZ0o4TTlydSsxWmxBWU5TWWVsQWdQVi8reVJKMURrQTZOb2Y4TDdjenla?=
 =?utf-8?B?Ylo3OHpOMktDdFFzUy8rdWJCQkdBV0FzMk5SRTdOWS9JSDMwVWdiTHp0NndH?=
 =?utf-8?B?YStQbTREdUNHbnJoaUt6U3VGQUFTQ2tqQVRqdDNpQ0RxbEJnUnNKczJNZXl5?=
 =?utf-8?B?REsrWDFVcm50eTd5WVlTRnhNYnlpZGM2YnIwQmJMNTdFQlBNbjJINU1zRlc2?=
 =?utf-8?B?Qi9tbGtDVWJ5Vzk2TFVJSXZUTWpjR21xaE16N1hyeHpaVGIxZW9XRVZzU0U4?=
 =?utf-8?B?ZzRTakFUY2c4b3RicUdzYnAxWGU1L1ZFOStISnBnOG5FQ243VHdURTdaWnFM?=
 =?utf-8?B?OHZKZUlwTjYybEpsNmlIdDVpS2I1V0FiNE5oUXo5TTNxbHVjRHhUczRqOHlO?=
 =?utf-8?B?M3doMWVHRTI1SUhGa0FwSU9tT0RPNmdUaEkrL1ZvNEloMDhPMWNHZzlzK1dG?=
 =?utf-8?Q?SM5/9d99utU6ry8BWLTShC/nBE1Ziv4AmUOe+tP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60a08d4-fcab-468a-6b39-08d9781894e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 07:15:22.3251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1Adnb7OPI7PuYvgw8rUG3CjImTW/6pNHw3DZK0flWfTAW5Z0e4GrD8mSbFwjId2g2zZ6qSMnyzLI3cuG0vq5pRoIECfcdRV/KN8QBhxqOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4914
Received-SPF: pass client-ip=40.107.20.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

14.09.2021 19:32, Richard W.M. Jones wrote:
> On Tue, Sep 14, 2021 at 06:21:58PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 14.09.2021 17:52, Richard W.M. Jones wrote:
>>> On the
>>> server side when the server receives NBD_CMD_DISC it must complete any
>>> in-flight requests, but there's no requirement for the server to
>>> commit anything to disk.  IOW you can still lose data even though you
>>> took the time to disconnect.
>>>
>>> So I don't think there's any reason for libnbd to always gracefully
>>
>> Hmm. Me go to NBD spec :)
>>
>> I think, there is a reason:
>>
>> "The client and the server MUST NOT initiate any form of disconnect other than in one of the above circumstances."
>>
>> And the only possibility for client to initiate a hard disconnect listed above is "if it detects a violation by the other party of a mandatory condition within this document".
>>
>> So at least, nbdsh violates NBD protocol. May be spec should be updated to satisfy your needs.
> 
> I would say the spec is at best contradictory, but if you read other
> parts of the spec, then it's pretty clear that we're allowed to drop
> the connection whenever we like.  This section says as much:
> 
> https://github.com/NetworkBlockDevice/nbd/blob/5805b25ad3da96e7c0b3160cda51ea19eb518d5b/doc/proto.md#terminating-the-transmission-phase

Hmm, that was exactly the section I read and quoted :)

> 
>    There are two methods of terminating the transmission phase:
>    ...
>    "The client or the server drops the TCP session (in which case it
>    SHOULD shut down the TLS session first). This is referred to as
>    'initiating a hard disconnect'."

Right. Here the method is defined, no word that client can do it at any time.

Next, in same section:

    Either side MAY initiate a hard disconnect if it detects a violation by the other party of a mandatory condition within this document.

Next
    
    The client MAY issue a soft disconnect at any time

And finally:

    The client and the server MUST NOT initiate any form of disconnect other than in one of the above circumstances.


Or do you mean some other spec section I missed?

> 
> Anyway we're dropping the TCP connection because sometimes we are just
> interrogating an NBD server eg to find out what it supports, and doing
> a graceful shutdown is a waste of time and internet.
> 
>>> shut down (especially in this case where there are no in-flight
>>> requests), and anyway it would break ABI to make that change and slow
>>> down the client in cases when there's nothing to clean up.
>>
>> Which ABI will it break?
> 
> Our contract with callers using nbd_close(3), if nbd_shutdown(3) is
> not called beforehand.
> https://libguestfs.org/nbd_shutdown.3.html
> https://libguestfs.org/nbd_create.3.html (really nbd_close ...)
> 
> Rich.
> 


-- 
Best regards,
Vladimir

