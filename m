Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD147B0C3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:56:55 +0100 (CET)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzL1y-0006A4-G9
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:56:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mzKKc-0007Kb-Rj; Mon, 20 Dec 2021 10:12:07 -0500
Received: from mail-eopbgr150095.outbound.protection.outlook.com
 ([40.107.15.95]:15819 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mzKKW-0001qz-J3; Mon, 20 Dec 2021 10:12:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoHqIWdlxBWyKwyuMFrHp/47OSSyCEilIMt92h5jqgkdUOc1U5wu6k9f+/tKofJLiT2nLzPTrg+dGruEmrf9dD7BY2Xzyq7DuEINpw5YktXwmzt3F4KkI6OrvBDSskMt5Vyy844E906GVrdMnHBLs8tufV6nMofP5Wxv9eHHTY6uDongsaCUxjOi4+Ac0RVO0SAw9Gr7V59bs2f4p/cosd3ddRERTbljBFY7sUn8uN3xlvdAPUg/PKjHMUUy5wUE2lSMpEggfJTs94oR6MWOmNejaN+5e6+vkswvsxBPJkzONkzK8GS/pfiOHK4512lM961VQeyJ6GQsRLkeKhnBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbGuH5DrwjJPOQCVWBCw+XJyBpZnK8lS3CA3f9INl48=;
 b=fA39QQasaa3JWBC9yUdvoaCUKvLMkLK5HkKedrFfZ7Gpk2YcX7XBQiQaAEh+5AdOdvIVHFWBr46LVBmk36BAO1nG1ZV7iNYp9uwTPSICkyMQR7PCMZJ9XI49pmV1nksNIq2apkaP1QXfDY+RcG7aL8iRxIZgGgDr2jtZY22dpI47qzorE/hdjT4l1ZhsKUL+tQjoScFpnqvp/n7Unz21ufJvr7iCcftD8HbWkRAkMjZ0tnVHrcnkKKe1Er5PsSvup/Tuz4izJm+7JgNWQJZy525XxRmgXAP1IlTWFG36xxUv/zG/PumYQvKQwRzUIbSSryLV7yveWModLEq8TrehpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbGuH5DrwjJPOQCVWBCw+XJyBpZnK8lS3CA3f9INl48=;
 b=FmsvvqLW9QIpnHfmNk4ONbZk9CSRZ1soZjm4BkX1unYd+fua9CSanXtnUmE8S1PNOg66d4blLGzmG+/nBBeJSxaQvIIpzUWxrR3Rsmt9h1W8EGXt6WErQELEbuqkP27O88SLv14aNQ4aTwk9pVcTUCAGaJS2fhPA2qNxZHxb6bg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by DB6PR0802MB2502.eurprd08.prod.outlook.com (2603:10a6:4:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Mon, 20 Dec
 2021 11:45:24 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 11:45:24 +0000
Content-Type: multipart/alternative;
 boundary="------------3vnLHjSmgzRLqTHj3BvrrGuv"
Message-ID: <d314452e-90a8-f7e3-6f0b-ce45f03a60e6@virtuozzo.com>
Date: Mon, 20 Dec 2021 14:45:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 4/7] iotests.py: add qemu_tool_popen()
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
 <20211213153240.480103-5-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20211213153240.480103-5-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AS9PR06CA0043.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::19) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c20fe66f-0158-4247-d0de-08d9c3ae359f
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2502:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2502FD9CA588780F9E91E97E867B9@DB6PR0802MB2502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxAlA4WNlLAdUPb8/QZgNjTzVOMuHMgFUtueZweXFWMQ4N2tL+4vg/OmYo0AUtC6erKZrKVf+4wox8JlPSYShShzTZaxXDzHldDTQQksBABVdo8/LDhsQN3VWHYCBuQ7AQnyp1Cb7vcAaBSFt1jdQIoBfhoAppduPZ4PZ6k69XYQhk4N0ruJZNtRz7fR4S3T7f6C6J49w8F0J2hXDpFxGREnIXBMdz7WM8zbvQjfAAqIyWS5+jLr+26rUKxAGYYay/mLN7N173C2fMru+FyYnR0CN2XD6zYsCwEHCt1EEcV4mqHZORQov0OPJN3/EZEXGkN6Dia6IdW0rKo2ATZ/kepJ46LfjpTDjhiH5Xqq3s+dYJq2TLHAa2m4ZlIsTQtPHU0Ucl7TVNNi+oEPyW3ScE9wb44W7J+pyfxKgC55sA5iHK3L0OkOoGS6recmrIDjGAT8iOszdNln3nfgSCrSZ7TherPZi9cLZaROWSTaiz3QiurVw5MGdZlmXfOdUHqOgo7EQxG05e4Qa5i2zYth86mf5Cuvb/Aqwty4Zuhp4FmAhCRiDzwtS23LF80QHGUDFtHCNy84VX56PwAbDraLxS6HlIx4ncWuzfwY5iC9vz/Cz2yR51egBYFJxxXHc9tcMdv2zGsie5kndz4iJayBVbVSW8tkJneiUr3aYyWFo1aTAsXombNUGAZgWRAhLRMzWIs9I9+oXV/tS5BECjSgIACsFaLjKHEBzP6XW0GB2uCdzKK7bZsoH/lOy3ubiYuNSWauAlfecRHLZRGb4PEKew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(8676002)(186003)(26005)(6486002)(38100700002)(5660300002)(86362001)(66476007)(508600001)(66946007)(31696002)(8936002)(316002)(38350700002)(66556008)(6666004)(6506007)(2616005)(33964004)(53546011)(4326008)(36756003)(2906002)(31686004)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTBWOFk0NW5tUlU2V3JyaGxzcVdqb0VQcGpFSWt4YTNqV1RTYmltb1YzQks2?=
 =?utf-8?B?VEVHK0VZT2VUMnNPU2JLVWxkWFdUNVp3ZHhaV2JhbVdaWHhEY2dETCtwR1ZL?=
 =?utf-8?B?Y21lOVdYNXhvV3Z1bnZ6VkZETG1xZDRiVGF0ZkRqdEV0d0VqZk9KUU1malR1?=
 =?utf-8?B?M2FPMVg3TVdRODh6Z01DQVVBYzVQa2w3S2d0SVVrS2N0czZSWUo1UUlKekNv?=
 =?utf-8?B?ZXN5dzJIQzZzUHIySFA4cG9VM0NuaDBtVnJKV3JGcnRHQW5xNkVLOVpaOW16?=
 =?utf-8?B?L0J2alhIZzIrbUFuWnB4Rk91eUFuMGVSZEdqQTNYbWNRY1RXM0l5OXEwY281?=
 =?utf-8?B?QStLUTNVUlNjbHdGMSsvMFNzekc1cndIVVF1Wm1ZK1F0d0E4ZDczdDE2U3o4?=
 =?utf-8?B?SWhiaWtHbFVjRklnQnRRSERDVmwzT3kyMnB4Q1JzWForRDI4dXhCTE0rLzZ3?=
 =?utf-8?B?MFNGS3ZXZzdmS1V2dFprL2tPR0xKOXhudkxMVUZucXZQZzVlMVErVjRkSWs1?=
 =?utf-8?B?Q1Z2RENGRXBmTDk3L1J6a1d3b2RxOHJ5Zk5Cd1FEZG51VmFYQVU2ZUVBVm5K?=
 =?utf-8?B?aHRzaUtVMTRXNGhWV3hpbzNwcW9mU0JaNnZsQjBvRmtEaW4zaWFxOGJ0WTI2?=
 =?utf-8?B?ZnpkcW8zM3Vvck54dlQ4RG1wRy9ONzduQ0NMdHhTK25iUzhacHdZSEF6Z2JM?=
 =?utf-8?B?Mkhkck5RNG1kYmloR01xRm5BU1lKbjQrY1diMW9RUktId1JxZzlMSDE1QjBY?=
 =?utf-8?B?NlFxTG9NOWJGOWRzRlBGMHdocGcyaGREbmgwUmVCaytyS05BSXdYWXloNXNq?=
 =?utf-8?B?UXBkSXZDN0FFUDdtWG5oWFVKQUlTOTRpTmRuUkhYL3FjSGhSbm1PODNIZWxs?=
 =?utf-8?B?d2EwRUhwNTU2TmpvVFdxU3ZvdjJIWkdRYnYzM3pNUUtnVlM3SlBKd1A1MGRV?=
 =?utf-8?B?Vy9tbUlqUjNYZHZIVTk0anNzeHFTWHlrMXpFbmdjZDZwa3M4M0Y0ODcxWFBC?=
 =?utf-8?B?VjA1N2RWdHhQeks4V0pGNHNTRVdVUkVnMFhBbngvcGd5bHZCY1ZrRkdYNm53?=
 =?utf-8?B?ME5Objd4akZtNmUzd09XNzJmWFZpRkFqQjhYc2FzL0xsMmJVdnE3TlUzNkJn?=
 =?utf-8?B?bHpuZzUvbnVsU1hrcDlyVnA0dWFsclF6TjJqSXdrVlhRV0Y4eTNHZkllVXJs?=
 =?utf-8?B?OExQVnFXVjdIVHEzaTJkZVZ3ck9zOXNOTHptYWpGVTM1VldmVjJTK3ExeFUv?=
 =?utf-8?B?enVmaDd1emdFNnNnUkxieVY0TERiWDFUWmVjTStueFMrNmNaMUp6WmlWK3pN?=
 =?utf-8?B?T0dOSFhvWWRpcTFSWGg1QUNVTGVsdExvMFludjRnSEdoUlJKMHRIMEhucXRl?=
 =?utf-8?B?VkljTWgwczBMWkZBNzN2ZUJjSWRDY0VOWlFIQ0JYdHhQUy9rczhOc3pHY0Vm?=
 =?utf-8?B?TUFGbStMb0dNdm9jVVlsQVpwM0JDSjI3WVBneVc3WGpoSjNoUEFHSkFMK2dZ?=
 =?utf-8?B?MlMwaWhlWm9ORnArWXFCZmZ1cVhmK2hoZTBYb3UxV2U0Z0JxeG9DdWhuNyt1?=
 =?utf-8?B?VEYyTnNuYlIva2ZzYlJhTWJheVBFb3Q5UzNZNWt6b1JsRXhsU0xrUjBJeU1K?=
 =?utf-8?B?cW9TaGRDWnBoOEtWVkZjeVJTaHQzMTNpeDN3QnQxR2ozQ25CQlBpZE5abzNi?=
 =?utf-8?B?S2dnQU8vRElLUzY0K3Rva3I1ME5TVytETjFqMU9SQ3BILzBkdXgyNjhzSkFD?=
 =?utf-8?B?UUUxS2xuSXZwR3hlcXY5ZUJYL3psMVF0Ym90Skl6NkNSYTFwTkFWSjFRbjJD?=
 =?utf-8?B?SG9MOU5BU1dzRmtGNEc5eVc5TEN1djJsTTRkaUxZekVGaFNTWlNVZHpnTXlB?=
 =?utf-8?B?QlgxSXI5cm5xT2xWRmZyMFlYY2tvN1ZTRWVhUTNtaVh4R2ttODJrVGx5cnl2?=
 =?utf-8?B?Nm1CYnVZMUIrUGdyQUxNcWo4VXI3WjRIZWcvcGV0QytjL2R3RzdEYXRIcVRS?=
 =?utf-8?B?cGsxeGluSmdMZDVWYU4zdUR2YXpQOFYya1NjV1VqdFlNemtqZnNIMXIxN2ZE?=
 =?utf-8?B?ZHJkUkVEbzk5aHFSNk1kUHNlN1dTUXpNZVQzMVF1WlhkdHNaWW1LMk8weGcr?=
 =?utf-8?B?ZnQyaVMvWnlBalBNR2hMRmZjOVVUVWd0TGMxeVNyU1JiMEpzSmVTNDY2T2Mz?=
 =?utf-8?B?b3RxSEVWQlFLUFNoSHRJSlBHenVGU0tMTDVDY2dRK0NRNUxLUXhDTnM4REVF?=
 =?utf-8?B?Q1IwTy9nVHNiUmdSVjc0My9tSXF3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20fe66f-0158-4247-d0de-08d9c3ae359f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 11:45:24.4385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8iqQSQrCZkSNnw/bQdzMQW9rE7JwfCX+G3NmMIaTX7SBXd0v0dKZTUp+FA2WJDqXnoJYv1ojqRCVQZNx8+BROdGqWKk2PsLhORtI8FFj6kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2502
Received-SPF: pass client-ip=40.107.15.95;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------3vnLHjSmgzRLqTHj3BvrrGuv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/13/21 18:32, Vladimir Sementsov-Ogievskiy wrote:

> Split qemu_tool_popen() from qemu_tool_pipe_and_status() to be used
> separately.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>


Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

--------------3vnLHjSmgzRLqTHj3BvrrGuv
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
    <blockquote type="cite" cite="mid:20211213153240.480103-5-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">Split qemu_tool_popen() from qemu_tool_pipe_and_status() to be used
separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <a class="moz-txt-link-rfc2396E" href="mailto:vsementsov@virtuozzo.com">&lt;vsementsov@virtuozzo.com&gt;</a></pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-quote-pre" wrap="">Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
  </body>
</html>
--------------3vnLHjSmgzRLqTHj3BvrrGuv--

