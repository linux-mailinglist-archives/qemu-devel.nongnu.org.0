Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC535752D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 21:51:07 +0200 (CEST)
Received: from localhost ([::1]:52036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUECg-0007dy-Cr
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 15:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUE9o-000619-Ax; Wed, 07 Apr 2021 15:48:08 -0400
Received: from mail-db8eur05on2122.outbound.protection.outlook.com
 ([40.107.20.122]:14145 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUE9l-0000hF-Dd; Wed, 07 Apr 2021 15:48:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0q1PZ/ERF0BCt7VEscIO6S75b3dQSnERGwEtt+v3mi8Biv62yAYQrigNEBrO1SE8nLDMyPrWzhXFv6kNTv1zP1K4EKq0W7gP6L0GAscm4RIcSY4C/s4bLCygqxP8F9orG+Cs7MpB6r92ovubvhNrb3ZsUaokNb9GOqvFJ3L4tXAwz4PZan3TfosUYCHuqJ7Kgy8+cHY4NNe+QMdxkBFS1EK492P98jAgnvB3fKpsbockYdFCOw4TD/UnYJDxoUMDJsCwcnNaRPp2jrMJYOpnH2C6+ZPIDvkgCYZu1XBRRl94I5JmERFywziRCygdMNRw7CAQHSfj7MDoUiVggm4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ESh79huuSDLGghs5F+rj8C/O+6tdpC1qQEDMifq5mA=;
 b=TkasISEBNAQea01KgQbtRz36UwnPIwPnO6yK2KZaaIOANX+uq3xJDKGkVaUiG2wKY1UvHwTtrj2p8LzVXwjjr84weVBKBMuBoKr2Xi6BohGev5nAzyUQWcdsa8DRVT6uMca8ScR6LASXA0y7jQTXwWxlew694pXrnn9RPDC9vuip13hYaKUFoTvGHaAO9FavUk8kXtLice/g44zp+/Q4zBc1Sfp3TsgiVVxou/poNK6ke0JAl32P5+o3s+GaAYw5p7lwHkf0sEqfSMtepMXcBOwRkO9zcqdxZ48sEvdtBVhMO9OSwWKCniSrLhonotubl0xgreKbVWsTeQvTx9KXqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ESh79huuSDLGghs5F+rj8C/O+6tdpC1qQEDMifq5mA=;
 b=Uu45OZAkhwfHadmsRvr7pp3My3uuQSCF5/73RWEXS8rlz5Yau8TUHooeG1IOltlG0C1XXXPYgmYG/zvSUomeWOdauTrIh/nAFyAbO+8y/5Kr+NCH8AGsFL1iTvrS51jwybu+n+6FfbKC0WRCi34V6oHdI+HmJwELR3/mSDMsglE=
Authentication-Results: yandex-team.ru; dkim=none (message not signed)
 header.d=none;yandex-team.ru; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 19:48:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 19:48:00 +0000
Subject: Re: [PATCH for-6.0] block/nbd: fix possible use after free of
 s->connect_thread
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
References: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
 <861cfad0-8eef-2932-1c7f-821fa0d0d629@virtuozzo.com>
Message-ID: <58596711-cede-3146-af3e-4b13dfae572d@virtuozzo.com>
Date: Wed, 7 Apr 2021 22:47:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <861cfad0-8eef-2932-1c7f-821fa0d0d629@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Wed, 7 Apr 2021 19:47:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3182563c-029b-4e52-a637-08d8f9fe0c82
X-MS-TrafficTypeDiagnostic: AM7PR08MB5381:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53813FF6359593E1D314EE57C1759@AM7PR08MB5381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vHDO//HIt00hByF2pY9gV6nqypOjjpfYp23t4h7kwcVj7Tt+9fhyvgj2A9AxpigFvuJcy7n3a6MjkHz8wvDWhbHiOdvpm+0mDELyD1yL1T195qfaR258aOFJNxkVQjXT2TkPpfET+U+pmccFYIIiWx6tFjfX0zuHZGLb5/7pCIYW6gCK9pIAubfD4WXBf1KuU0H4z798e6RjgiSl4Uchx1sJNv72Ov6wK8jo/8CQ4wb2Q/7b0tlthpUP+nYT0DwR9KPWs6Id8fDFru4aBsjXzj79kccXV8aaF3eDN4R9z1e7ZtWZ3zo0ScnVfYiqxsM4Y3oydkCmV5Xw/+s+QzymScPi9FxLd84TwYkHTSbjLzZOojr99r4vLKLLTruDtdCR6blgUOFo+HO/R4X8RhAyYqestj42SAuvbWu4dFOM00unnopSqhIwEQU+tsQNlfB49lsodtFDnGO6eeFjK8Jw2LxFnNQrFpqcxFwMtKwH+xFMrJWQuSC4POJQ4Gc1MZlVAENiYhGv/lCLOWJ7Iq0h+5M1lHOEpB6HQvkd4stAVTJtUrRbStdNZjc6FN1rzQLEyFo44GpASfoEpCqhlrThh2nXO67I/tHBl1hGnESJ2G64QwshPSsfHYO8XO2Cqfs6pHqjHrAlSnetN02QCiqA9ldn8x5vvU8Q4RjcaJwm35rdu9WtEBtu1c5vDEcbx0cIEl43OC39jnoCn3+omF4iVtcQcwJsXKTspR9hitqre6LYOqA97Lj6uH2bzsPWoOrf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(39840400004)(346002)(5660300002)(2616005)(4326008)(36756003)(26005)(956004)(186003)(8936002)(38100700001)(16526019)(2906002)(16576012)(83380400001)(66476007)(66556008)(6916009)(38350700001)(478600001)(8676002)(66946007)(52116002)(31696002)(6486002)(31686004)(86362001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlBPSEE4aURMU0MvTGI3WnY1Y0xxNGJOSTllNm16ZDJmYTFYYTVjWExaV3Yy?=
 =?utf-8?B?V2xqSS82ZGtNWlNXS0dPclFhTFRSUzlxZmliMTR3WTNyY3dCK2xaVkl3Qklo?=
 =?utf-8?B?M1FRdm4xcVBrRlltd2wyQjFyOWN2YTRXQkYzcmVWQVh1aEt6ZmphMTkzd0d3?=
 =?utf-8?B?V3lRTGx5MFIzS0tDZ3dMdVFLSXoyaXFGbGpYZk1jek9Xemg1bmlpSk8rMG1P?=
 =?utf-8?B?SUhkZ2NObDZYVFdkSk1PTlZoMjZJQXVQV0RCcWZGMWJXM0p3QWxxM2xkSU91?=
 =?utf-8?B?K3ZURWM2YzFrNW5UMlNTR0xzbnVaZTl2emFpVGo2QlFLNTIrNVB1M0xhL3pD?=
 =?utf-8?B?NGcvUVN1S29ZbWoyNThoT1ZHOFdicE5PQnRDSXhmdXErTzFxcFdhT21ZcXNF?=
 =?utf-8?B?QlQ1eVJhYm9UdUh0UHEzendaV05aZnFCMEZYQnVRNGdLT0NLbFIzRDQwNUow?=
 =?utf-8?B?aElNbEJ3bWFFdWVUR2JCcGluTTZUbWV3amQ3M0JjSVM5MlA0V2ZzczlKTWJu?=
 =?utf-8?B?TlNjcmRBMmRMVHBWZ2p2MDlQamo3YXFGWUpicUY2QTF0MmNtdnUyeDdyZGcx?=
 =?utf-8?B?UGsvUm5KWjZtc09YSE1nb3RkRkp2WW5RZ0JGUlQvMWpnbDB2dllyT2NFQ25Z?=
 =?utf-8?B?MUt5ZVJUUGRydnpjSGNPMUZQREdVTkk1VVcyZTRHYkNGY09Ddi9GTDk1ODU4?=
 =?utf-8?B?MmZ3Um5JMVdFTG1UcEJzUkRpMFN2dFJLWHlYd0lWSEZhUW55TVNUT0I1QUty?=
 =?utf-8?B?NmhUdlcrcW1tM1BBb1Ntb0YraGNxalFqd24yTTA4ZDAySXNaelYwcE1HVXhN?=
 =?utf-8?B?bnoxVVJQNTVIbTBSY3piM2xaWTdFWVhyazZIdHowODJvM3FDdyt2MUtmTnIw?=
 =?utf-8?B?dHNpMjc4ZGdTaC9GLytDRDV3MFJTRXIrU1FQWnEvM05wZWdQcFUyZ1dvTVli?=
 =?utf-8?B?QnA2Q3JoNGY1VElBWEJMYnlreG15Ui9pdjRYcVZwQllGNDlWcFBjbm5rSi93?=
 =?utf-8?B?c3AzcDJRcGRUQkFaNjFDOHdFRGRQQ2U0ei9UVGpoVGF6YTkzS0taMGhoNi9P?=
 =?utf-8?B?SWtsRnFrYjM1alI5NGJHSzNEQ3NkbHB2MW5oY2JRRnRveXYvSXBTWkZ0aUdo?=
 =?utf-8?B?VFZXTisyRGhBZHNsUGZRa3Ryb2RmMkpEbnU1WnpWTmJ4S25EV012aVlla2FE?=
 =?utf-8?B?bFFXZGhBUmwrU2NndEN4Rzd0MmhvZlBiNmtvREUvY0lVdjlPSGpjSVZqVGVK?=
 =?utf-8?B?WmQvNTBuZm5XLzJRbDVzc2NDSFIvN1Bma29YdjRNcjdGMVovZlpDVU9qcmhC?=
 =?utf-8?B?WmRCQmswZTBodnQrMVRBdzRuYzNRWTZLczlqcFVIZUNheVp4aEU4TndMZmJE?=
 =?utf-8?B?T1BTeFpsOWNSbkRsWHEybXlPS3NoeGZiYU9YbndIZTdyMmcrR0tGbzFrMmgr?=
 =?utf-8?B?SitKRzUydWZ1bDNoVnZjY2tPYTJvVmtDWnFOR1V0cVRFaHYvZzQwNVExRG5S?=
 =?utf-8?B?OUNJTXUzV3ZLaTlNanN4MkFqeXRDbHhZLzdZZWpYNE1kejdWNDlSWTZLV0pr?=
 =?utf-8?B?VGVRNS9UbkNiSWhRb0RQT0JvaVlLb1psMkFyVDVVajI5ZEI5dzBSbW5MYTdz?=
 =?utf-8?B?VXFyVU9vTTA0MXlYR0hrdVpNMXN5dUhXUTFjVkNCZjVTVGFhS0VBODI4VWdr?=
 =?utf-8?B?blhXVWNocVdNTTJMOW5DWlJoamJCK1QxZTU4ZlNHMkQ5c0ZPZzZpSHo1Rndu?=
 =?utf-8?Q?Kx1HRSgMKjyjRoxYoi9JRZRPKBAb6v8JB/bdCaz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3182563c-029b-4e52-a637-08d8f9fe0c82
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 19:48:00.1515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5i7y4mIxg0cPAFV16ozsVyrb3RxvU6oGWzj/oQ2xLHICNF4m5He+a8zh2BKsxPL5sLTW3bB+AJ35BJL+stq/X50zVjuWxQrK6pJcJfUC0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
Received-SPF: pass client-ip=40.107.20.122;
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

06.04.2021 19:20, Vladimir Sementsov-Ogievskiy wrote:
> 06.04.2021 18:51, Vladimir Sementsov-Ogievskiy wrote:
>> If on nbd_close() we detach the thread (in
>> nbd_co_establish_connection_cancel() thr->state becomes
>> CONNECT_THREAD_RUNNING_DETACHED), after that point we should not use
>> s->connect_thread (which is set to NULL), as running thread may free it
>> at any time.
>>
>> Still nbd_co_establish_connection() does exactly this: it saves
>> s->connect_thread to local variable (just for better code style) and
>> use it even after yield point, when thread may be already detached.
>>
>> Fix that. Also check thr to be non-NULL on
>> nbd_co_establish_connection() start for safety.
>>
>> After this patch "case CONNECT_THREAD_RUNNING_DETACHED" becomes
>> impossible in the second switch in nbd_co_establish_connection().
>> Still, don't add extra abort() just before the release. If it somehow
>> possible to reach this "case:" it won't hurt. Anyway, good refactoring
>> of all this reconnect mess will come soon.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>> ---
>>
>> Hi all! I faced a crash, just running 277 iotest in a loop. I can't
>> reproduce it on master, it reproduces only on my branch with nbd
>> reconnect refactorings.
>>
>> Still, it seems very possible that it may crash under some conditions.
>> So I propose this patch for 6.0. It's written so that it's obvious that
>> it will not hurt:
>>
>>   pre-patch, on first hunk we'll just crash if thr is NULL,
>>   on second hunk it's safe to return -1, and using thr when
>>   s->connect_thread is already zeroed is obviously wrong.
> 
> Ha, occasionally I reinvented what Roman already does in "[PATCH 1/7] block/nbd: avoid touching freed connect_thread".
> 
> My additional first hunk actually is not needed, as nbd_co_establish_connection is called after if (!nbd_clisent_connecting(s)) { return; }, so we should not be here after  nbd_co_establish_connection_cancel(bs, true); which is called with s->state set to NBD_CLIENT_QUIT.
> 
> So, it would be more honest to take Roman's patch "[PATCH 1/7] block/nbd: avoid touching freed connect_thread" :)

Still, I like my variant, because it make obvious that s->connect_thread may change only to NULL, not to some new pointer.

> 
> Eric, could you take a look? If there no more pending block patches, I can try to send pull-request myself
> 

Kevin, I see you've staged several patches for rc3.. This one is quite simple, could you add it too?

-- 
Best regards,
Vladimir

