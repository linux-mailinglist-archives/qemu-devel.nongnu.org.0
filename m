Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F62F4855
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:10:33 +0100 (CET)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzd6m-00013x-Ej
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzd4u-00009s-Q6; Wed, 13 Jan 2021 05:08:36 -0500
Received: from mail-vi1eur05on2108.outbound.protection.outlook.com
 ([40.107.21.108]:49136 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzd4n-0003WE-En; Wed, 13 Jan 2021 05:08:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OP3opQkGe3jGi/GAyoXf9dmK8/3kDBqyZPWF+JaqjQDdBgt4f1jCTFxQa+j/kJHdlAG02H4wTIQYuAIi4tMgVbdSAHNRFltH8i+4YhE3dmwQpy4PfjhnkO8Cag1nkhbyvQ0UK4JQyDuaoJTjmyKX+WS+iRyG2tBhsdMgCQWGuXJL/sbZyysMA5o8kvMg6OxZNAoJ6ciFVpfHz8qAKonY9KORVvBrYsgBrzzH0aJWQB7iq2JV+M8t0IQ7VbNKWptcrQ7lgPn1jXsm/1hpJbw66oyvMlukHMmNZFD6yRVKbts+1fja4JmbGh5o96U2j5+v0gmJWdKDOwy/Yp4fmjCqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMKwvmimuiyorgzhFyvHIs7kD12RTecXASWXjGFdWP8=;
 b=J8WHng25UsD0YZXhHPezJxP3iERahPqTyGfIw6orWKpR8/9Q2ff2eY/197xainBXpRhbhydCcTt4LOP5PTloV75JOr56px5hLimb0uMIHNa+d2dqk/2O+2dYXuu5H1IPnzohlGmNU5xTEJJ6b0RnVSlzwZBrA3Xn9Z1zWlZw9s0+glG9Zu19mBmyttWa9vuslc4/+T8S1s1WmBa1L/hkFJH6aHgdfXop3c8lcSJWAVdLq0LSNgQaX7xpOW7LoTW8uo/0ikxNHKKgnJMkDEjm1ViNw7/qa0/oXi3LhXvgsq0+XB7vp2zRobvQFjj46yqjNmtzacZpSMfkjtve0VakZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMKwvmimuiyorgzhFyvHIs7kD12RTecXASWXjGFdWP8=;
 b=qbZskAfvi8CPFtQUshfAeaZo+evVNF2RWhvYySD3bpPYjpKSn3hQxM2swH4m5L/jpU9pwHYQPwnAbMXeGJYn/4dSTjpeci6KM1tqH7GCGfQ8hwUnktsElGiTaE+zCXQInjZ8y9ORmVU/6izPSVjduOMsEwpL7DTS4+jeUjMpuNU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4279.eurprd08.prod.outlook.com (2603:10a6:20b:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 13 Jan
 2021 09:53:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 09:53:23 +0000
Subject: Re: iotest 129
To: Max Reitz <mreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>
References: <6e00b90e-5c95-8b02-23c2-0acfe9862f6a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4474f468-dc8c-8e53-2d46-183823918863@virtuozzo.com>
Date: Wed, 13 Jan 2021 12:53:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <6e00b90e-5c95-8b02-23c2-0acfe9862f6a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM8P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM8P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 09:53:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9807e79-4da6-434e-9f46-08d8b7a910b5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4279:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4279B86E1741595CBDD7275DC1A90@AM6PR08MB4279.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dael88dlDS9Kh/TVAXjgC0Y275xB1/qZtIiDIyHLyZCWsNlb3/Kb/T6vCXlJamvPCFAmxN/44HYvUaw9NwSRuB4+cDVX4vDXnW5jNzBAyWKrcwOG+Sjc24hvDA5at75aXhV4aISeFJmFewD4OdkbKrZlFOJCVAcmBdR1g7dMYrKTDetx693vYOWyMFbfFl9OtHiWVDpYAx+NTezHymsamOCEUk3n1sCi1TpWt905Njf8TUDx6FRnQ8n/JuNuVMwVCZ2Yfpwaw8iHYqoAJtgSIGwLwCXXvtlJPxvTZcUHhi7h+xlMAxR9gKSrIe+5AKNYzP9ygnDW7DBXBDA6rhbTvWrVaZYLN3VtIq/OFOvCvs3aw6S8EiLKGWXtAtCLMwceFges4adMhYE1dEimmSliQ33Woj+CFN2vG7BKAIKvWflNmT9yAMoN9pqR1IMVe4P18VEQEmnoqX2/VNlo9q8smAc2yS32zLWKe+JkEkr1Iao83GYhVp26Hn9aW82eWCVmT8kTOFvkRYiN+siqcYnJWEfP+t9sdHC3ePD+eW3woyTOPqX6JZHgvrfqFfuGz57J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(39840400004)(136003)(6486002)(54906003)(26005)(110136005)(2616005)(316002)(16576012)(956004)(36756003)(52116002)(66556008)(478600001)(66946007)(186003)(8936002)(5660300002)(31686004)(2906002)(16526019)(86362001)(4326008)(7116003)(31696002)(66476007)(8676002)(83380400001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ekJMUW9MS2pvcmNqUlByaDU0cFB6VGU4SFY2NlRHMDI5TzlZMXNZSlpFa2hW?=
 =?utf-8?B?bkkrM29PRGN2bERnUUYzMWF3SGg2UjF0TDRNeHEzL0RadXBOd052VU9RM0dk?=
 =?utf-8?B?TkpjV283ZExBTWpxZ2l6UXQ4L1U2RHRKU1Q0WmptcXZHd2ZjVUZhOTB2Y3ky?=
 =?utf-8?B?NTZWV0NpMXFUQVpZb3hab005ajFKQlVndlU2azM4RVY3MHJ6Zm1lQUV3RXBy?=
 =?utf-8?B?ZmN2VXlYUnpvMXFHQUliUTkzQ0lEM3ZGeVdzaEdSWDk3VnFIT29FbFVJb0JQ?=
 =?utf-8?B?UEV0ME9NaEd3a25hcVBrZ0RmSlZiWGpDM3h1enFtbmQxaXRlamtUNXR6bEpX?=
 =?utf-8?B?OWlZMEppU0hHN29BNkNibCtnenhzb1hmV2ZCT1ZoVkpYR2cyWEVtK2lESU54?=
 =?utf-8?B?ZFJNVlZFbHJWSEVHdlF5UzdEN2JPWXd1QTBXSi8zdmwvdFBYczdiS2N0TXMy?=
 =?utf-8?B?RkpwdElpNFRQdU1wZDdZeWJncElTMVRNOHY0SHprWHFHWVczdjU0M2FNSVVr?=
 =?utf-8?B?VXpycnlxU0Y5UWlwSk50RUUvamRNUXlldWMvcmV3WDhKSjlsMDFzalEzT3FS?=
 =?utf-8?B?S0pPZk5qUW1ZMGY5a05CVUpkUlpUL3o4b2gyS2hTOERENDhLWlFnUHFDQXM1?=
 =?utf-8?B?dWs1MmU1Tnp2N1BSWkc1Z3czbzVpa3U0NlQ4aTJkSyt1eU4rcEZYeTROalZm?=
 =?utf-8?B?TjNDdURxYnpCejRJdXdxK1ZNSElGdk1wRWNDcGFBSTg0UHNmcDgvUUNDb1pL?=
 =?utf-8?B?bVRuL3V5WWtNUlJyVTBOT1hKWWloajJHVVdpYyt1b0RwWWhDa015TWNjQlVW?=
 =?utf-8?B?MUFmSmJzdlEwRnQ0SzVqcHh2eURaQ2xhSkk0dmZ3SGNmeHpPekFXdllpblMr?=
 =?utf-8?B?VHl0VHNOVHFMNDFkQk5jSzRXTzZ4WDNESFJ3Q2RnRmpPaFdOZ01DcUJzamtl?=
 =?utf-8?B?UUVKTWFhVzFDRlg5RVhIQXlHWEtudFdFT0dWZ1hOeXFJbHFNY1B0M0tHMm1L?=
 =?utf-8?B?T0ZDRGp3QmNWNmdLWnBwZkVWMk5KbmdlWE13RnVDNWJTV3FLdnI4eFJDbnBP?=
 =?utf-8?B?SVB1cWxSZVJxMktKNS9JU3c1K1dZK25VR0ttNjRGeFpqMkNsRXJRZkI1b0pJ?=
 =?utf-8?B?SC9KMHZybXN0NVNFWjVEaGdVNk9KMDcrN1Z5MnZsem9tdnp6Z0x1Y1JBTFhV?=
 =?utf-8?B?aVZhYU9KUW1LbVozSWgrblVmbk8xS29sb1I0dlcyMm1FWlE4Y3MwQVRZSUxq?=
 =?utf-8?B?Z1JyQXFzeGwxNElRVnc1ZVU4eEFxQThQT2U5MnJXOTJpSWoyQmlWbkdGOXYv?=
 =?utf-8?Q?sAxL8kbkOmjozgoWn8ewz8+jbSeE8UC8CD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 09:53:22.9464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d9807e79-4da6-434e-9f46-08d8b7a910b5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKJL+mfLSto489Wr7w5SyFIe7brfphth2SstLrM5FXKcJPsLrGn6ceSzOvrRj3fibXP4uGoqa2QnygAncCLf8jiHzX+xP7nulDnTEb8qOfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4279
Received-SPF: pass client-ip=40.107.21.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 20:44, Max Reitz wrote:
> Hi,
> 
> tl;dr: I have some troubles debugging what’s wrong with iotest 129.  It wants to check that 'stop' does not drain a block job, but to me it seems like that’s exactly what’s happening with the mirror job.
> 
> 
> For quite some time, I’ve had 129 disabled in my test branch because it fails all the time for me.  Now it came up again in Vladimir’s async backup series, and so I tried my hands at debugging it once again.
> 
> Recap: 129 writes 128M to some image, then runs a block job from there (while the source drive is supposedly throttled), then issues a stop command, and checks that the job is not drained.  I.e., still running.
> 
> (It checks the “running” state via @busy, which is probably wrong; it should verify that @state == 'running' (which wasn’t available back in 2015), but that’s not really why I’m writing this mail.)
> 
> Like the last time I tried
> (https://lists.nongnu.org/archive/html/qemu-block/2019-06/msg00499.html) I can see that block jobs completely ignore BB throttling: If you apply the attachment show-progress.patch, you’ll probably see some progress made while the test waits for five seconds.  (Here, on tmpfs, mirror and commit get to READY, and backup completes.)
> 
> OK, so now that block jobs don’t completely break with filters, you can instead use a filter node on the source (as I tried in the patch referenced above).  And to fully fix the test, we’d also replace the @busy == True check by @status == 'running'.  That’s the attachment filter-node-show-progress.patch.
> 
> If I apply that, I can see that now there actually is some throttling. After the time.sleep(5), mirror and commit get to exactly 1 MB, and backup gets to 1.0625 MB.  Good.
> 
> However, after the stop is issued, backup stays at 1.2 MB (good), but mirror and commit progress obviously without throttling to 30, 40, 50 MB, whatever.  So it appears to me they are drained by the stop.  I.e., precisely what the iotest is trying to prove not to happen.

I don't follow.. Increasing of progress means that jobs are drained?

> 
> 
> I plan to continue investigating, but I just wanted to send this mail to see whether perhaps someone has an idea on what’s going on.
> 
> (My main problem is that bisecting this is hard.  AFAIK the throttling applied in master:129 has been broken ever since blockdev throttling was moved to the BB.  Even without the “Deal with filters” series, you can use at least mirror sync=full from filter nodes, so I tried to use filter-node-show-progress.patch for just test_drive_mirror(), but that only works back until fe4f0614ef9e361d (or rather 0f12264e7a4145 if you prefer not to get a SIGABRT).  Before that commit, it hangs.)
> 
> Max


Hmm, in show-progress.patch you call "stop" the second time.. It's a mistake I think..

Also, on current master x-bps-total I can find only in iotests.. Where is it defined o_O? If I change it to be bps-total, it fails.. Strange.

I've run the test with your patch with throttling filter (and a bit more logging).. Interesting. It looks like throttling just don't work noramlly after stop.. I see that mirror does one 1M request, and it obviously overflow throttle limit, so during your next 5 seconds it does nothing (and we see progress of 1M). But immediately after "stop" command all 16 read requests pending for throttling goes, and then a lot more read requests (hmm, exactly 31) are issued and not throttled at all (but goes through throttle node). And then new 16 requests are issued and throttled. I've looked at throttle_group_co_io_limits_intercept() and I just don't understand how it works)


-- 
Best regards,
Vladimir

