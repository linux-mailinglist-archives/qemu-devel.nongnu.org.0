Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CF3A19D8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:34:50 +0200 (CEST)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0ED-0005LQ-E8
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqzmM-0000pB-5U; Wed, 09 Jun 2021 11:06:02 -0400
Received: from mail-am6eur05on2102.outbound.protection.outlook.com
 ([40.107.22.102]:18656 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqzmK-0001CZ-Cb; Wed, 09 Jun 2021 11:06:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ij4KSoAaEwnU69ZO5RheMN1lufR8LHmPFASM0ZuhNpkZAW5Xip08PZ45ZqE37J8y6AA2k6Zh7zaVh8g60Mf5XAilvGb2kalFITJ92j9UhdhVOMT3tNYXB5GsBp5l8lQhwQLFJU3JgmVjgrSKxq9wS11B4ZW3ZlKULJxMhsgxG9Vam3pCmzIw1S9xhQc4XfSK+dLxXRUxumYVgdnBBZgc2icS5i3Bi68yxkNvc4kKEFDpDhymAoy4AIc++7lWMXONEeU3mOXXotN7gGD7LpX8O71hcgAkkEcshmGYgJEwdX+uBFTIqIzzQui6f3fanPYUme/rkH4isWa+cT3Y2RHP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvyb2amfHEx93kNx91V9LEEYOkc1Ibvi3bn2wzLbMq8=;
 b=Fwj1vZoWInbprc52EKSZvm3kfY00E1G5Gq+j2qJdFY+c57GxzQMzfOKjjczUHM2a23wXWy2SRVnjtFT4CZPuEyeNbRBFsVFOiSuJ8vMvGPztm0XLAgVVlTPsMxmL/3bIuIJav+Aao3O4/Fcbe9Y0Zbf538rX1qrUPtuM/8ZT8eHar7uuauDCSxhAEiNdxx4n0x0DcOtbyTHQIJhl2EF42O/QFeb+olyaoPo1ZOl2Uv3ju0CXPZWuKL08zaEFzRUerD7GtDPdLJyXlpJSQ//Q7zl8jOLoZNEjMQv0BVrVHzJo6AkWzdt2WDUmqR7QPzvlVzwr7uXYja9mJr3q/+tv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvyb2amfHEx93kNx91V9LEEYOkc1Ibvi3bn2wzLbMq8=;
 b=hPmg5jeoz1KrYELR7a55/IrL8yaLPj17mwMZyb+oMtoDa7YVaa8c7LC61wau5soc9X0alHH5VUMBzB+XAx0G3Ou8x9KivByiaRQo3UUebqG1iSXL7pkEk8pujwDh6X1aeolLDFAPIIfIwBpHsMJAaVo+39enJW/S0BY1O3tDkT8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 9 Jun
 2021 15:05:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 15:05:57 +0000
Subject: Re: [PATCH v2] async: the main AioContext is only "current" if under
 the BQL
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, eesposit@redhat.com, qemu-block@nongnu.org,
 stefanha@redhat.com
References: <20210609122234.544153-1-pbonzini@redhat.com>
 <YMC7z/86LurXvAQ6@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <34f62f4c-ee79-33d7-aa4a-3eca74164863@virtuozzo.com>
Date: Wed, 9 Jun 2021 18:05:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMC7z/86LurXvAQ6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P189CA0063.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P189CA0063.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 15:05:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 715df3a8-0bd6-4da2-36f3-08d92b5815c4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6839C2A0758E9C6AA97E6AF8C1369@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gMWr47t3NwzX/OWMJKWizUNIjggEXp32XrJRdsR+aqo8m3ir6eCOWQAzz8rjF/Hfzm8zevq6tJROwa1hNJNj7hGLNL75wV/wERUaldloQi/oLinJmAoAYtaRq8UaHRZOkareGWGCU0VBzyIgotqXJGSn8zKZiudXdeTtpA0Ss/qMuxlyZoGmxaGWRPCoizC51HAeyq1lRefc38OGbppIU+Uzl2YpmXrrcIcqvxJ2M4DXY9F5FuriV52V2o+evZrwfkE5eZVvx/yoWfXxHJoeZ/qQEVxSpC7Auk7zy608V/MboSO62GTxExrTLy0yJQ1RTfUB7e+tx3eaPKpVz9Xq+UIHFMbPPfDJBtE0by4x2zk7gu81YRdeFNpqMA5ocR1dj1ZI6eDUn9pjgg8q4qQm8SG6NRBLfmWMD+1fUiHM/H+Xt6ItNoeU6o09P4yD4DBa5JZDRObsY+oNttpi7C9nC/ljgGaHV1K0JcxR2q3wcWKufoYm8xKLzfNAYPmlRqYLF5PclqpzgeWfjTnqilNyoVIhRJfGw7donn4ZjhpRD63rp6iUKeofvRVVGafp/iJ3AzjRjghhJheK9wwJHkrM1YTqHRTEJyAMWh4ijE2/BgLM00IkukIFi693l+Wj1YCkNaAtirBFmBiKFhbR0kk1blQNLLS+B8RnK0CSNU9Ogqp3Bji/jxCTSJlzzNf5DbbFeD165z+UUCFgTiyMDuqNpX4MG38nsPHZ3hjTXQLeJpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39830400003)(366004)(2906002)(36756003)(86362001)(5660300002)(26005)(31686004)(16526019)(186003)(956004)(110136005)(6486002)(8676002)(83380400001)(16576012)(52116002)(4326008)(66946007)(38100700002)(66476007)(38350700002)(478600001)(31696002)(316002)(66556008)(8936002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?KzlTU0JPR213UTY0TmZUY0Z3RXJkWGs3T3BxcndDZlI3emNsam93UnNCVDF0?=
 =?utf-8?B?YlVnUkFOZUhyOVhSY1R4MkRNb0xCZzREQ3RiYXdrOHhPVFVTQ3FJSlVyUGd3?=
 =?utf-8?B?SmtmZXkxYjdzTTg2L1l0Q3RJUnZQVkVMTlhKQ2ZpY2QwbU00K0kxMkZBbG5H?=
 =?utf-8?B?d1pMK1VGMyszYU8zUmQ3ZUR0STFHNWhHNDRXanpqWlZBRFhsRlB3a3VYWVhE?=
 =?utf-8?B?Vm5mYUs5WnJEaUQ0YkRqTkxuNTJaMFRQUHpDT0RXZEVhWTBuWEdOUTkvY29E?=
 =?utf-8?B?YmZWSndEaExUVU9FbXc2bEVRYVJ6TFFvOUpZRnROOGxneDdlUmZ1TDVFSVVZ?=
 =?utf-8?B?d0N6TjNZU1RaajZGS1hhQkhadzZ3K2QzWVM0NDhBdjd4R08xV0YyWjZKdll2?=
 =?utf-8?B?azkvZWVMdkxxTFA1TVpRSnRwK2prZEI3VSt6enozVDg0ejdzSVkyb25Mdkdp?=
 =?utf-8?B?S1RVNW83L2hQc1NvWG1KN1pubndRTldjMXdiL0YrWVdjSU0yMU5pY1pvQXYz?=
 =?utf-8?B?enNIWGhPSlRUdEdSd21CWWoyNmtDV1BQS1Z0bjR3Yk5ETTdFU29RRThsbDlS?=
 =?utf-8?B?Q0F6bmpLc3NSUXg5SjIva2NYUE54cGZ5U2VnOVRuNDhkZG9DR0RSMFhPZk9S?=
 =?utf-8?B?N2pRSSsvdURURzBkYU5DVFRqV3o1VXNiN1Y4V1JxdlFpMlR1NXRnRHFNNGMw?=
 =?utf-8?B?eXk1OXV3eFJxc0VJWjIrcUZ4czRJNnZ5ckRreDFQbFc4elhvN2xXK3BtR0pK?=
 =?utf-8?B?YTNwbUY5cGdXbHltRitHT0s4OXhERXZQcnRiZ1VTYU5nTU5NeERhcjBZK0h3?=
 =?utf-8?B?TlZUZWRzQTRuOHdjNEF5L29VeUxHc2diWEZNQzZCR29IaW1TOWhNRHFteDNk?=
 =?utf-8?B?MzlBbXpDbWlTRWI0N2Q5aDZZb3g1ajZpeXNDT1JnVVA0dU9xTisrcW1VMkdw?=
 =?utf-8?B?VUMzb1ZQc2QybFZGNHhJOFBSMGRpN2dNZzQ2dmFaMU1wK1Zabmc4OUpKWHli?=
 =?utf-8?B?U0l1UWJVMnJ1eS9HVTB6WktKQS9RSlArZ3Nnc2tZRXBQb1E1RXlwUFowQklL?=
 =?utf-8?B?N3cyR2pnV0xwU2lkWngycFdZZjhYa0txamd0T050Qy9jck9SSE9xNHZ0OXFz?=
 =?utf-8?B?TkwzeTYwWkdWMFBrT013UXdWYnpOT0c4dGhYRUE0cWJVMVY3YXlIRndpOUhw?=
 =?utf-8?B?czI4TVUvRkVrc3ZrYWU4QmNPSlNHUDJOa1JIVUQ0bVlUOStzVWUwSlhXZW9n?=
 =?utf-8?B?dVRIWi8xSHhYZEdzS1A3M2JYTkhKU1ptQ2NMczZCMVRQUHpsTjVEa3lCcUZE?=
 =?utf-8?B?Q21BcjBZOGFaUS9vK2xMVkJzU2xIREJFTVlOUjNvY2IyejBEemJKK0FJeUdN?=
 =?utf-8?B?MjlzdHdYV1JDRFRTOS9rNHNPUTdWcXBzc3ZKL2F4TmVYTkEveW54N1MwY2lH?=
 =?utf-8?B?M08wSkttRk5GeVZLYjNhclRKcWpwUVVEeFRJdlRFbXR6dUkveWk3MTdocWJI?=
 =?utf-8?B?bkpJR1cxZ1FjQ2h4Yjg4Qm5GbzMrYUFqQXc4L2NiUU1TeVJNU09SNXdDVTV2?=
 =?utf-8?B?RHBrdnJhYThnUko3dVQ4TmR0a2lNb09yZGNXeDhFdytlcGYzU0dQYklBZlA1?=
 =?utf-8?B?KzRZSUc5bmxKOFRQK1hTV1BydGthV0JFT0swNWtWRHYxR3N4RVRLRUtsa2I5?=
 =?utf-8?B?QnhUR3NLdDBsVVlVaWdCRjczSnJ4Vnp5aUJkcUJOaHg3SGFPUWZpZHdOdG5Y?=
 =?utf-8?Q?Z8G28j2oqdom92n2voaEsM9Qy7BEk2E7P+xep0r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715df3a8-0bd6-4da2-36f3-08d92b5815c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 15:05:57.2609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEWvIsbuGHIyBb2dLCB2U9jDe5FSaDTbyNjA5MJvREXYzTNRyXXgvOy/9OHkhl/4EYzbGg+elGSVv+5BlnfXG4iWozQSn4Iulx2v2TcDhvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.22.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

09.06.2021 16:02, Kevin Wolf wrote:
> Am 09.06.2021 um 14:22 hat Paolo Bonzini geschrieben:
>> If we want to wake up a coroutine from a worker thread, aio_co_wake()
>> currently does not work.  In that scenario, aio_co_wake() calls
>> aio_co_enter(), but there is no current AioContext and therefore
>> qemu_get_current_aio_context() returns the main thread.  aio_co_wake()
>> then attempts to call aio_context_acquire() instead of going through
>> aio_co_schedule().
>>
>> The default case of qemu_get_current_aio_context() was added to cover
>> synchronous I/O started from the vCPU thread, but the main and vCPU
>> threads are quite different.  The main thread is an I/O thread itself,
>> only running a more complicated event loop; the vCPU thread instead
>> is essentially a worker thread that occasionally calls
>> qemu_mutex_lock_iothread().  It is only in those critical sections
>> that it acts as if it were the home thread of the main AioContext.
>>
>> Therefore, this patch detaches qemu_get_current_aio_context() from
>> iothreads, which is a useless complication.  The AioContext pointer
>> is stored directly in the thread-local variable, including for the
>> main loop.  Worker threads (including vCPU threads) optionally behave
>> as temporary home threads if they have taken the big QEMU lock,
>> but if that is not the case they will always schedule coroutines
>> on remote threads via aio_co_schedule().
>>
>> With this change, qemu_mutex_iothread_locked() must be changed from
>> true to false.  The previous value of true was needed because the
>> main thread did not have an AioContext in the thread-local variable,
>> but now it does have one.
>>
>> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> The commit message doesn't specify, but in the buggy case, are we
> talking about calling aio_co_wake() for a coroutine in the main context
> specifically, right? Could we have a unit test for this scenario?
> 
> But the change looks reasonable to me.
> 

Yes the root case is: we have a coroutine in the main context sleeping in the yield point. We want to wake it by aio_co_wake() from another thread (which is not an iothread). My series "block/nbd: rework client connection" hangs on iotest 058 without that fix, because I exactly use this case.


-- 
Best regards,
Vladimir

