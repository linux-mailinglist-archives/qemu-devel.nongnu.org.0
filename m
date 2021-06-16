Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5F3A9670
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:40:49 +0200 (CEST)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltS2P-0003kY-GC
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ltS1T-0002yL-1t; Wed, 16 Jun 2021 05:39:47 -0400
Received: from mail-eopbgr70095.outbound.protection.outlook.com
 ([40.107.7.95]:1725 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ltS1P-0002zr-9V; Wed, 16 Jun 2021 05:39:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiiTzY2eFL9oRBGhMN21hVN5Q830WxnPYZ8Zfw24u7e0KvMNShbX0nLi57pSDGdlCztUDcFeYy/ZjpzHl2xHz+rzp//tPSh7URcv91oNWP+s8Hwes9wmJ9jK4u650PdZI0lv4T3TL1ix68DHjA+BPfCcUKJz5EE/9TvHM2PaRhjzgm1c2S/fQYXnIDhaoSO2Hlt2cQi0dza32pfD0QA6YouQHWYBmGtPZgpx/EuMW4tu66/P1Ccgkk9hJVivJxt8PyKh1BoW/Zl0KMTrXgZXfxJ14wy30l4NMUIZEAJlouLqRpX68gEzo1QoniGke0oRPUVEF7Mlge1xsiuVunFJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0e83cw77WuxwBKJAn8T2bOLv5S3FpFL6zX79u/raZI=;
 b=kF5F+ONVlrSjbgpw4NYrnCwDj/FPfndlxu2dDPDvJX2ytaP4+1kpYlJJIZP+blKzbDvY5+0gFAZjl7050WejzrZo3+DKZ507SQObnRwF8/8JUblXacCcgZhM/LCt6RVJb0MMfmRqp8FiR/2Z7KRHxEWWM4WBckh0OZYiLBMtNHa5E7BSgGEVy6PHtKgD3Q+1X+82cx/UeVWVjd3ZCjMrWQpEfllF1tmV6R3NDmC5RdshzIENN7sFsMpvaM3abR/wRof+Atv3VXY/e94wdu7azAYWIqogqf+OFmfqR/2Don3G25QXiyQ0FZKxWFuDjzygpcvEzEvBGH8b0aO3RHS94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0e83cw77WuxwBKJAn8T2bOLv5S3FpFL6zX79u/raZI=;
 b=KEEL3JvElRTcddLoC3rWnA/1RfumI6IOZwb9xPnIPWylmAxghsYN22/mMPep1Yqi/aRPBOksieKdi2LD7H1wjk1iIkOiTwGiAvd3A0FVU1fGrCj3o43luBF43nl7FtJGmpfBZBtCSBOVMOAs7eB+PhMY6/kbfQAq3ZPGgkn8aSE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3541.eurprd08.prod.outlook.com (2603:10a6:20b:51::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 16 Jun
 2021 09:39:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.025; Wed, 16 Jun 2021
 09:39:37 +0000
Subject: Re: [PATCH v5 06/16] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
 <20210604091723.13419-7-eesposit@redhat.com>
 <879584c2-48cb-c81e-ef9c-141db1c5a67f@redhat.com>
 <f68fa8d3-a70a-7f30-9fd1-913730e2b024@virtuozzo.com>
 <c968bda1-f7ef-101f-3e41-2181587884fd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4d6757b3-bbeb-b12f-5f3d-e261e284acb0@virtuozzo.com>
Date: Wed, 16 Jun 2021 12:39:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c968bda1-f7ef-101f-3e41-2181587884fd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.224]
X-ClientProxiedBy: PR3P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.224) by
 PR3P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Wed, 16 Jun 2021 09:39:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ed29b26-2da5-47d4-b9b5-08d930aaa849
X-MS-TrafficTypeDiagnostic: AM6PR08MB3541:
X-Microsoft-Antispam-PRVS: <AM6PR08MB354125B4B8045E502BA2CB21C10F9@AM6PR08MB3541.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqDX4g2kaqfcBHHvgBAUHsXxnX9/LwysII40LXQPYhG1Akq7uWxP8VWbI/7uS838IObQQc0vweqbHrGD9jAs/f43zzFDEJv+S92QYCbAKHw8aWf3IQXjm3JSyz8SHpCwiU7NF7KyEAFZjCLTDFYl0YtPda6Bwn5Rk2PRETQgNF9D7vdXYHAaq+DlgGEc+9hSBPUc2jL02nlpEuxnYH8gBxUPYnNCmgCooKKCzFIPr8Ck6rsKueCKYZU77zwRY4DXkVSesNpTxTBhad1xWhguauj8Tx6+fFGURCf1PoTchhyGdnLCglFsj/r77TORQss6wGWvXjK4aE3GbCt4Z0KPqCNk5Eoj0A9gF2Dm1QU+mkRo9ynAGcJjh8HAbows1huVg5ewhwWJQYnT9S5+6LD68XndqzsvVsau06blI3cHyXy2Hk6AZm5WqF6Gu9wWoLi90IUD+8WAAwe/XtBYuAITh+/mDnGYeaB6WFs9sSe8dSdJREdprrrY+cXZiMO4eyv1IFHbUzIoWj10+e165K4Mbi+ZW0WhtBBcfG8yLytq/PQu/HCDuy9YlW+Xb494jj66dDgMBaZyIg1GZrKpPA1ZGqceg3E0jsdCYJQtlSreT18kCTBIxg8+jKgtOvt5J4+7Hc4wY5hUVsl/6tiNO3+lHerMHYXEG66o9lqw7Pt8OyPHkxopUFbDXfwOJJEvVZUnigW7Z7ZpweY+uH1YG/Hw0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(136003)(366004)(346002)(396003)(31686004)(186003)(6486002)(26005)(16526019)(31696002)(54906003)(956004)(53546011)(478600001)(2906002)(4326008)(8936002)(38350700002)(38100700002)(66946007)(316002)(86362001)(66476007)(36756003)(8676002)(52116002)(16576012)(2616005)(5660300002)(83380400001)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTdEWDBiak55aDFaSjlWNlNFMGxtRE8wTnpFOUs0OFpWTlpNcm1BKytsK3gz?=
 =?utf-8?B?WFEvNHRsRXdRWW5MUGppMDdmNUxmZjAzdGJEM1RZYmNlMlM2TjVqTzhvcncw?=
 =?utf-8?B?WXp1N3dPYXROSEkvWThLTjF3cjNxdXBEMFIrbTZFWVNwbXEzNDRrWU4vOXdK?=
 =?utf-8?B?eG92QmtqRGxDNGVIS1o1cHRUUHp4Q0cyMmxxQ1ZNUlk2ajdDUFpzSGVKMDJw?=
 =?utf-8?B?S00zT016ZklqVllTM3hkSVNiRkhYOHFWYjlRbTZ1WXhkdXppU2FDZkNvUmVX?=
 =?utf-8?B?NTFrcnpsem9hMVV6RzJQczl0NzN2eWxtQk9pSzM1RFJCcHRGTG1kWXhEWTlI?=
 =?utf-8?B?MFJiYzB1T2orTCtvRWszb3FCUmFaajRlL0tkdGdsSDR2VEpENlY3TXRmaDNC?=
 =?utf-8?B?TWF0WjZGa3krNGI5NzFUZmVMSmpsRnZ3SjBtL2NLSUVCV2ZuNTNpUDBrckpa?=
 =?utf-8?B?amUybHpibGNGQ2JRaEhBZWFaM1owamZrM0RqRHhoMFZONTVnVjg2VkEwWlVN?=
 =?utf-8?B?d0xZeUlpZUppTHlvSnZxMXhhcWRibG1YYjd6V2NjQzRhZTArU05sdDk5amJ5?=
 =?utf-8?B?bmMyc2F1SUpMdkszdm1wa1k1Zk1EMTZxbWp0RlhCNXZJb2dvZWp4NWxhNTN4?=
 =?utf-8?B?Njc2TllKcmVMd0JZYlFNdVBRcWhhamF1elFCT1lxbmgrdjl5dEUranR5QVgx?=
 =?utf-8?B?RjNaUnRGbjRra2tHejNqSGsweWlFTDlBZDU2SmJsY2hnM0pBUTVwNEU2WWd0?=
 =?utf-8?B?TVFNTUxNYk5Kc1o4dTJNYjhMWEdaVHhZV01VYkkzcS9RaTVVR2hLOFZXZWhx?=
 =?utf-8?B?TktzOThNZENtaGEyWjJ4c2JNYU14WVhob2hYdG9DZjMwWCttbk12MWZBTEtM?=
 =?utf-8?B?aFFZbSt0ekVrWStUWFZ2Rm5EYTkxcGMwQlBua0RYSkxUL1NlVWo1YXJscTZ6?=
 =?utf-8?B?bWppR08ySktLZC83M0JQNENJMDNkN2cydU5XYzBCQWdmU3M1MUdzQWtTUzUr?=
 =?utf-8?B?bEFmekZCbW9TL0xoUCtEWEI0S2hqTWE3U3ZEaTJ1cFBjRjg0WUZiQTlTbEEz?=
 =?utf-8?B?RUJmYWRpYUVkNGZoYjBqaUlRVUV2TkJPS3l1emNOdTRkdjB2MzVLOS9MRUVy?=
 =?utf-8?B?dDRxOTRWQ1RQTGhtNjRXWGh2RkF4anlLL2QrcFVJLytCT0hUTERLTGxRdU0y?=
 =?utf-8?B?RURzYVN6ajJJRi83Lytmek5wdDEraUl5alAyL3lRQ0xSMitVM2ZvL3REbkl3?=
 =?utf-8?B?dTJHQmNPTnNBUmdyemxYdmpFREZYbGxuWEdpVFNmMkpQTzQzOVBkYkY1OWE4?=
 =?utf-8?B?RFlIRllCczBLVksvMjRDUndPTEw5NzB5K1V3c3Q5T0VaNUI2UnJONmtjZHV1?=
 =?utf-8?B?aXUrcU9JY05mMEFkeU1Dd0tUZk1ZcExIV2UwMkZ5bWdGMWNvWlhNVGRFUkdT?=
 =?utf-8?B?dE0zcU9DaHZxSlZuTkNPc2hRZDJJeGhsVnVpQ3Qvc3NvTnpoVkpQaVZ2WDdi?=
 =?utf-8?B?YXdRVSthZUJzRWMweEU1bkJreXZWNkcvWlJyaFNMTm90TFVXaHhwbllVdStm?=
 =?utf-8?B?emU2NHNFeFNRMzBaTHgxNXl5ZzROMnBFQW5iUFNscmR0TnRlNVAxanNQenJM?=
 =?utf-8?B?YUhNQWg0RVl5dkFEd29MdWQzUGxqQVYvbi9yUDNYNU5uMFJ4MkFPcDRVbS8z?=
 =?utf-8?B?QnNDYjR4OUtXb3FDTi9oT1RLdDdudnZkQ0U2MVVlTFdManVtR29CdWpRTUZn?=
 =?utf-8?Q?3B8tKD3zhRYwzcVbdX0tW7wc3YOf1Tv/zS5UNjn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed29b26-2da5-47d4-b9b5-08d930aaa849
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 09:39:37.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aANN3cVJ7OTyUqVAzL0pxynjpWzl3zsG5g5YUhw1HXkVqsD3lkb6y0/yjLPaUcI5pr3CumjBDblwYHiAS1xRWBGtexrDKMUIhGkYHW7tStY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3541
Received-SPF: pass client-ip=40.107.7.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7,
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

16.06.2021 10:09, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 15/06/2021 09:57, Vladimir Sementsov-Ogievskiy wrote:
>> 14.06.2021 13:36, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> On 04/06/2021 11:17, Emanuele Giuseppe Esposito wrote:
>>>> Attaching gdbserver implies that the qmp socket
>>>> should wait indefinitely for an answer from QEMU.
>>>>
>>>> For Timeout class, create a @contextmanager that
>>>> switches Timeout with NoTimeout (empty context manager)
>>>> so that if --gdb is set, no timeout will be triggered.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   tests/qemu-iotests/iotests.py | 9 ++++++++-
>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>>>> index c86f239d81..d4bfd8f1d6 100644
>>>> --- a/tests/qemu-iotests/iotests.py
>>>> +++ b/tests/qemu-iotests/iotests.py
>>>> @@ -486,6 +486,13 @@ def __exit__(self, exc_type, value, traceback):
>>>>       def timeout(self, signum, frame):
>>>>           raise Exception(self.errmsg)
>>>> +@contextmanager
>>>> +def NoTimeout():
>>>> +    yield
>>>> +
>>>> +if qemu_gdb:
>>>> +    Timeout = NoTimeout
>>>> +
>>>
>>> @Vladimir or anyone expert enough in python:
>>> This fix above works, but I just noticed that makes pylint (test 297) fail. My bad, I should have tried it before.
>>
>> I think, just make mypy ignore it, like:
>>
>>     Timeout = NoTimeout # type: ignore
>>
>>
> 
> I think I am going to drop this change.
> This series already has patch 2 to ignore another pylint warning, plus another separate patch was sent to silence a warning that pops out with newer versions of pylint.

pylint complains should not be a reason for bad pattern. Shadowing the whole class is not good too, but it's at least a separate small hack, instead of silencing the whole logic of existing well-defined class internally with help of global variable.

-- 
Best regards,
Vladimir

