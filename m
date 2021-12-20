Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C4F47B0FA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:19:44 +0100 (CET)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLO2-0003ao-IL
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mzK27-0003Rl-SI; Mon, 20 Dec 2021 09:53:00 -0500
Received: from [2a01:111:f400:7e1b::71f] (port=52289
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mzK1m-0005FX-FV; Mon, 20 Dec 2021 09:52:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqDWXKrHfLtTHA8SclpEMfhY7j7Tpz0/aE2DvjiGp9Ozz5om+9Myx4yHExUeiluVPG1NTNCMe37A/uhUPbGXvqKWN7zAr7rs5mHeCVygSt+XjmOlwRKcfYlzK8n9CRIfbD20Au8+Bky1wSnCgUKhlGuOM6/76DYuz3nmO9kZ9htvJMTzm+bYe00zTFkhjBIGaSviMHyf5KKyrgZvP50iBCYL/Yhj3y17uLdwQy7+J/3LWZ+LovkV+iWnYen8LgL0cRAeCqclw6WT2vz219Lsw6juga/LevBe+bla//fm5A0BwdLiYgs6LPfuzBR7OmaKi3JrrR8oM5d2YGEF2XDuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmClK1Kny45yHo4Lpb8HDWWDg0J3D3u+u+BbU277TQc=;
 b=Ls61So9q1ksqxoqeSCvVF+rYmDwJi+f140a3/yGSqZctbGccNJONcGUhMfefRhLsa1ACeteD8ViMpmab+Kc+aLMG5XpBUZP/8b7rTjNToUo9TRrMR1wFACBjBQ/ZaWvNS0zJPJPOgyZdbaCAnWTv73xOdjaaliRf7KujBX1n3gtoXyCRB5pMLU+THCSjiAl97y3oft5FP/2gkAy4YmEMkRCuRMkN8wghSMmeV4K1h7RltMhTHssvVNIUOZbi5k9mtRmJ5p5G+9A44uIVuaOfpwclBXJUFdMWJZJxlHe5sPHiS8q4fs7nHAxATBBWD0f0A+KLyvKvsqkS2TqcFakqPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmClK1Kny45yHo4Lpb8HDWWDg0J3D3u+u+BbU277TQc=;
 b=BLPNIMjkOq9kYqSyrtS9SEUb7V2eVhaIWz9bljxcHtkl/HwBT7u2WVaXCDTtDpa+jLFzzO6qqbPwF9yE8qETbQIRO5YlONE9f7mzgV70oy12xF6S5hkwv7fj2p8Lc8yZS/3EDm1QwNJk6vqZRJfCl0kFvjuZlKrzND/3L1CWzPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by DB9PR08MB6524.eurprd08.prod.outlook.com (2603:10a6:10:251::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 11:48:34 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 11:48:34 +0000
Content-Type: multipart/alternative;
 boundary="------------luTZlpxMAzdqzTs0TKYvmclp"
Message-ID: <f2537739-08c8-5d0d-9194-65d002857873@virtuozzo.com>
Date: Mon, 20 Dec 2021 14:48:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 7/7] iotests: add nbd-reconnect-on-open test
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
 <20211213153240.480103-8-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20211213153240.480103-8-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AS9PR06CA0220.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::23) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d17d7ff8-5434-45c7-76bd-08d9c3aea735
X-MS-TrafficTypeDiagnostic: DB9PR08MB6524:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB652432428CB81F738FE8EED0867B9@DB9PR08MB6524.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bAYsA1hV2mBdeEtY3b+H8nGTe0d/cvil1ATtXTddL4t2yhVP0fFRAIVMBkF0eK+DOe34TKLAxrKpPF6AJZogdY+EJROTxBFYjOcoWYG3hn9TJ0n0G0wWRmVW/351PwEdDSm0m64/bkG/tHLnQgyAeng+DPsQc86R7ud5YjLYcpNeW7+GaIxDFeRT1B4q6qs0WhZK/MZOG01fNHUY/BkjqyWCm7U7IZIPyCfGGGwf4ZCCoU8pDb8C3MbbSGFOVjpTrXQn5AL4q3xYi1aVvsnQB23uQP7tWvobF5ixx8fOrZENbC5O1OlrwqAnq18gBMm/rv3VoENGHQc+0t1rgTHspxr5pKmuXZNfPcs2ut2J+H7gIp6ISPHhCjPwRgXlds53mZdk5DUKsqVwad5xkNjbeKebY+hpQ1uLVMcWnZhjPwfYE2I6Oq3wLCz0K9T1ji3BRawjWM2JEWtDjKFnYZO8Hp3RBm8h7WuAqu73ge+/xhLSb7Bp2eL+Xphh4CTlqneiASKt8tmBDcpnMnpE06rX90ud2ijuQTOvvo+1gB4+f9fkvSB2KD5dZqKiTTtj++cNJ9OSNDCkf/a18fbbVbM96zOL+Yxg/7sq28J3UuY1ltlBo/W8FxNdyFWS00T6sm0aEYDTjNx+6f41twYiSGtbqwSfFiPnPHPtBqxVknTYCUOutbD8KdFPadQjFZcT2GVbtMgj1Orf7poCdnoPoXdrqbMBn/T+7G9L/n4uHF2FTETxTuvnx+a6q4tAwk27UCt9nsFvfMSflPEnIfj1BkvDOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(2616005)(8676002)(53546011)(33964004)(5660300002)(86362001)(316002)(31686004)(6666004)(8936002)(52116002)(4326008)(36756003)(6512007)(66476007)(186003)(508600001)(6486002)(66946007)(31696002)(26005)(2906002)(38100700002)(38350700002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFFaZ1lKVjhDYjdGc0tobkpaQkVxUmlUT1kzL2VMajl2cWp0L1FkUkdTa2Ev?=
 =?utf-8?B?Ym5uVzBzRm9sNnZ4WTY3RzdpZGhMSXRiSkIzNzBpLzg0QWxyVjRGZjJXc1RH?=
 =?utf-8?B?WDcveGRmazd3dCtJTkZERkFwcUxsQVlTVnZOSkhYQjR1N1grR3o2c0NvRDUv?=
 =?utf-8?B?QllyeGJjRTl5Q1BhR0gzQWdYRkQzTWZSQnJwM2FGL2VacUJDMFdCa3IreEsw?=
 =?utf-8?B?ODR3NmVaL2NmamdUNC9RelF4bzNJRkRCeFBKMGhUN3hsOGdLdXI0YTM0QVZV?=
 =?utf-8?B?RWIraWUvalplMytDcmVQQ0ZlWXpHZFZzTUo2Mk5ESnZ1Rmg4OGkwT0xvL2hn?=
 =?utf-8?B?ZVNrWGpwdUtPcWRCWVNNQWFBQzEyYXBYb2J5aG1lMWF4V3MrQ1crZHhmMzh5?=
 =?utf-8?B?SE1lZmFkcTRaajFIY3FzRjk5cGxQdEdtQzZMVUZSMXFYUDNoS2E2MGxUTHJF?=
 =?utf-8?B?NTgrVmFZaW1MUG40cGJsWnhTT1BQSVJkek0xOFI2WVluMDZRUjY5QkY5emNF?=
 =?utf-8?B?TU05K01kVEV1aUt2SVUwWUN0K1RaZjFZU1BOYk9tZHpIeU1uR3g4alJ4eTJi?=
 =?utf-8?B?eUcvQ2h6QXVmSlZ4NzRLZ2FjRTVkQjdqcEV2MWF2UmZoVEc3QmhUQlVRNkFs?=
 =?utf-8?B?TitzT1Mrb0lqN3l1MWg3SWFSOUU0SUNYdCtVYjdqcGsxM3d6UGNyS2QwYU5U?=
 =?utf-8?B?eFNCZ0pUMEtWMnZYWXNrVzh4Wm8xcTNjWXpvQUgvY2svdGY4RVNvL0MrYTRt?=
 =?utf-8?B?cXlGWGdDVThNa0c2WDV4aDVaUFU3dXM1NVJWVWM0SjdBZVZWZWsxaW1WZHlY?=
 =?utf-8?B?ZEpZazhHMnBUNWxzL05RdndqMnlydExOcXFRK1krMk9LYVVza1g1dmJFNjR2?=
 =?utf-8?B?ZjlMODV3N0lNRnl5cHB1cmwzaVpsYWFyWmRXYmNKZHpSYTFjbkUra2duSG9E?=
 =?utf-8?B?SjFKemY5eVUxaEtzY0wwL2pMQVQ1OEJTbTc2UVgvYjVib0VDbGZENTNTZHBB?=
 =?utf-8?B?a0hmanpFY1lsZTNmNllqSHVpTkU2NkR6SzJVb3daSXhLRVh0WnM1aTBicUdI?=
 =?utf-8?B?T0RXRzhTUFArTXJlK01OYzBNSHBUSXdLOFBvM0MzbEtWTTRvSVJSd1FXakt2?=
 =?utf-8?B?bS9QR3FDeEJWbHV3djRFclNuRTFROUh2NHNob1Z6ZnhLMWROU2lmOUM1OXM3?=
 =?utf-8?B?aWQ5S2VsRElhaVYwYnJqRmg5Y1A3TXRxZi9SNDRQbmRaR0hJc1F4MWROZEtW?=
 =?utf-8?B?THpQQzduWHQzMGM4Wmx0U1psYi92WjRveTF6a0Q3UDk2RmJvNnNBc2dqcHli?=
 =?utf-8?B?S0laZERua0l6T3FmRGlOY0g0MngzWVF3Q2REallReFk3djlYY0xRU0RIdEkz?=
 =?utf-8?B?eHdMd2pVTDVLamYzQ2JQK095VkJmK05ZdEZPYkJxbGVnd2pGSGZzYnQxQzIy?=
 =?utf-8?B?SXcrRm9PRDB2aW9YQU9DdXNOOVQvUUN2WGxpN3REYVpuTmNtTEJkRW0rbUxK?=
 =?utf-8?B?Q1R6MzQ5T0V0TjNjYkZ4a0NrUUxGSEpMSy90bEtMbGlPbVN2VUovZ2dIQ2JR?=
 =?utf-8?B?ek8wc0JScWJnR0s4WXZRMlBwTUxwRXI2ME4xTkRYTkJUOVlOZG5uTU1XaUpG?=
 =?utf-8?B?bmxYUk5CTjhxbmNJSFJ5RGtrN21leHdVeE9Kak5kb054T2RMRTlEb1ZFekUz?=
 =?utf-8?B?K1RxZElGS09saDNmbUZ6SGc4Rzh2ZS82cWRQNXhYTGlEYWVHcTRGemVLejJy?=
 =?utf-8?B?VFpXdHNBb2Rzalhhei92NlQ2L2dTZnJ2ejNmVE5rUDgwRU9OUkhUOUpMdGFP?=
 =?utf-8?B?WFlOUkJFRDUwWWx6SzR0ZDJwYnlFaGpES3VrOXozWWJ2RDY0NEdVbXhrK1g4?=
 =?utf-8?B?YnRDOCtxSDdyWGFMZldmR2dnR3NURUI1aWhHWXZEYlhsOHpUdGdveUZsVERU?=
 =?utf-8?B?VDVwb25ndDYxK0JnUCswbnEzeTMzdll0aE1HR0lGM3hxMS9Hays4Q2hkYmlH?=
 =?utf-8?B?OFdvTWgzTWFJdlFGUzM3Q3Q1Y2t0NnIwRDUvcW1aSnFzMVd5akxFMk5UUzZE?=
 =?utf-8?B?SzJHZXdCdndjdmZJRjRTM09yOWlGclNGWEtuSGQzNDB3WnZydnNVbWp5d2Vt?=
 =?utf-8?B?VFRlSml1YndJcEpYL3k2NnlmalliZkNwUmJVNTFkYmd1R0pMVCtrVlVTUzFu?=
 =?utf-8?B?c016dzBFeWx5aHB0bWhTd2xTQjdEc3ovY3daRWpjcWY1Y3BScGlyd1JodWVQ?=
 =?utf-8?B?cENYb24xd3VidVRHTVVZTFcvUlBnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17d7ff8-5434-45c7-76bd-08d9c3aea735
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 11:48:34.7909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVIoaH1s6dAEnKza3LiidaFahNVnjEzJ0GoOLqNHd5a/1c6mCKeCpqrhaqmtc62TZMgh+ln1hsNtnoGMvrXPb6Ulxv8QXkKCrHPJVZP8PtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6524
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::71f
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::71f;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--------------luTZlpxMAzdqzTs0TKYvmclp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/13/21 18:32, Vladimir Sementsov-Ogievskiy wrote:

> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>

Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

--------------luTZlpxMAzdqzTs0TKYvmclp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 12/13/21 18:32, Vladimir Sementsov-Ogievskiy wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20211213153240.480103-8-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Vladimir Sementsov-Ogievskiy <a class="moz-txt-link-rfc2396E" href="mailto:vsementsov@virtuozzo.com">&lt;vsementsov@virtuozzo.com&gt;</a>
</pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
  </body>
</html>
--------------luTZlpxMAzdqzTs0TKYvmclp--

