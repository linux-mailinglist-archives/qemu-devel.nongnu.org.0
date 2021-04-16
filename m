Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5BD361BA4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:40:05 +0200 (CEST)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXK1E-0003V3-Un
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJcd-0007KP-I7; Fri, 16 Apr 2021 04:14:40 -0400
Received: from mail-eopbgr30111.outbound.protection.outlook.com
 ([40.107.3.111]:31015 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJcb-0002GU-HU; Fri, 16 Apr 2021 04:14:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg4XrX2yvpqxVfCjYSj/0Ly/dke93vt9xOy/EYsTowM0r8aei8qACuUTtCKkgntLAcTVvT2muVOeXx1umCDELVYUFCU7lk43wT8NR6CZ8Rz1SR/x3BRLt1kltqpbbNtRZ56UKjwWDuhrcddjtIxiAsV586gqrLQp8SxwnTLf9bpn6bDOPOBvQ0eHjIa8QpzEU4Z5QY2Rs/JsTTLDugg7TOp+Okg6QMRIoORzNhufo5BI7Wgf3sN9tvqbPmN5r3O4xsfuEHGoXMGpijIU5L+sdJwfFwo/RkneMWOH85PoCafeBm8gt5jYseI4xg4AWqRoeb/0RMYTaZqSVs1gn7FSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbP4YU8g2sNLg5HI/H3sa1GTX+jTRsPWISkFNmtEu2A=;
 b=JOm7UyRL5ZKCOTWvcK5XxhhKwOCEzhjbKJ9xABtSz+Otij4n9KRlGLrJJtulVTH1RmBg2B2dG/E/hbs7t+i0viBvUyWJ81N5oJ307MHvLNYSHBJrErafmfjQul7hOIEtZCwJn26DVZw1Btg++ydbqxxCmNNY4Axbj5yGtr7VtFa1n8hsUXTRu8YsvsFUP4GfRuX2VFLvIeASzC5odqmW5N8TMe/XibgVTpnDM4Hcy9XNVuIm6brVxWwoeUt00F7RAx1e8o3HE/6+rsFlTl81qq4xIkQpm9DoylxnG2XCL2NhA1u08vcO+p8l7MtJclwA29lhADBPi/Z80/26WOmUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbP4YU8g2sNLg5HI/H3sa1GTX+jTRsPWISkFNmtEu2A=;
 b=smrPJhKzdZnO1GUYQomT80FsF/zEfVoG8YVkxwQEh4cA53KXEZbDnw8mdGUof47J6IPgq3CZlXzm+HtPuVWewg01zykYEpgpsGpjjLOPZCBjlpTKGeobFGml9SFoMMFiELoTvJFlVvVWCtm6irCBAHEGH8GjirnNUq2O9tYxJOo=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 08:14:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:14:34 +0000
Subject: Re: [PATCH v3 33/33] block/nbd: drop connection_co
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-34-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cb5f5d0c-0ec2-c8d3-9077-5ed006989371@virtuozzo.com>
Date: Fri, 16 Apr 2021 11:14:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210416080911.83197-34-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: AM0PR02CA0213.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 AM0PR02CA0213.eurprd02.prod.outlook.com (2603:10a6:20b:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19 via Frontend
 Transport; Fri, 16 Apr 2021 08:14:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b5e8611-3215-4407-7ebf-08d900afab80
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB434165A1424B591F7834605FC14C9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5rokmyvMhdmgaFbrApTd2DkU40xHHpQ5n51EeN2ajoLAVE0yMnAKcsNQ8FzC+WoZKdxbWGqcJRpzeH9N5Y7ZNcS8KbNCfU/YWJxntbFOxKnx97t3zGiDTXupWD2sSrnRz3z7tlAmIis4lQAmLlQYFwxKwpkaHn9ZUe5Fsm5dEzb5IQiAD2IZVr2TpcsU5XZQ7fn6fYirpgY/UYWpoe70fO6Z5v2xCBb/cptGljMP5GrC2c/9ts3zYdVZzOJpWKj2jEukpLqpMuHdB8R3F0FUqge4zyu/fVbs9LqdmncgfQppCO+O2tnmHvCFxSnbd9ocsVd35F5/AkMR2SIk1FJ/e5FBlt5LImMshetNA2vqI8Aqu0dJTtkU8dgNNYsjC+Jy/0Yhsr+ND91j0+Ht8GJy/SnE1dGCsWi9O+gD83hkytO5r8n6dBCa8EulYA3qzc/RhTO8SMmh+SJSRdrF98s7WdaoXU9xKPkOLrCHzFSgZNn2kmhMOTVFFUzgXrxPh1LAhTz+Qw84ubGK9j1gPT/1TtCvhqy8BPzvZEuGWxISgD3MYTk7Vp/t1qPZ14u5C0vNuMIWtkXjZ4aNAbM+S9msuKidGdRSQYsmUXzbw31DuCVAT33XgR007yK9JT1la39Zf7Wdy9DCkk+7AU8MBV0BT9uIaK//pGYQDsiNDIhaf9+8vh3rS72TyPw4IKEwsJ15BZNQFeALOcI4szKQzQVIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(396003)(136003)(376002)(366004)(8936002)(52116002)(107886003)(31686004)(38100700002)(38350700002)(36756003)(83380400001)(956004)(2616005)(6916009)(478600001)(316002)(16576012)(186003)(8676002)(16526019)(86362001)(6486002)(4326008)(26005)(31696002)(5660300002)(66476007)(66556008)(66946007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWlaZG9LZVhMWWpNR3ZWbldzMGFGNVZ2MkhWVUVLL0NnOThva0krVFNSRnhp?=
 =?utf-8?B?bW1peW8yZ0xOV2E5bFJBaVV6RSt5cld3amxSdG56RWVLQ29YSk53TUVhc0FZ?=
 =?utf-8?B?MUNJTWVIRUhaV3RmZWxCaWxubUE5TVFlZzlXOHFab1pvWFQyL1ZCQzJJbU9X?=
 =?utf-8?B?S1JrR0pnTWV3NExHS2xBakdnNThlV05RUVROQzQvaXRldDllV3FjZ1lvMHdN?=
 =?utf-8?B?UVRtWWtQVXFZdUpIaStiTDJMWlcybG9DTUlUQmF1OWYza3JqcUh1K0VMUjdW?=
 =?utf-8?B?MFBLMnJjL3ZqUXRUZDJoYlF6TmFycXliRzY4VTdUZnQ1RjNramRNV2hoZ1N4?=
 =?utf-8?B?cGF5bW5UYWNJUUlLemorc0RoaGhGckxYZXhZUkN2UmRxNWNhT3F0MFIydHFH?=
 =?utf-8?B?aEpVbVdObVpsMUp0cXNLZVBjRVlSaUdXMHB5b0FsYXRwQ252b2dtU3BJSE5H?=
 =?utf-8?B?T2VHOU1TL016OUxlSE1PdVFBMnhJM3hUeTA2M0NGd1B6ZHVqT3BNb29QbDNl?=
 =?utf-8?B?SUZ4YW5kdGp4TkVHNkZydEFmanNGaTZ3MUxEU1EwSDN2TDlrZzNuSURuMSts?=
 =?utf-8?B?eG9qU1JDb0wvMGM5bFlhR21DZ3htWkxXV3BCSjRxZGErS2MxYnRrZnBKWTZs?=
 =?utf-8?B?bEZWWWNnNlIwZWNGSldnM01IRmlQVUxvV0tSVS9zK1ZBeFV2UEVPNnZ3ajJh?=
 =?utf-8?B?UHd0dmtRY2srSThPY0ZPN3lvVmR2aXBxSE81YmRVR0l1MHpMQS91QnAvd0Rz?=
 =?utf-8?B?ZGd5c3hZSy9Ydi9UcEozTXlsYWE5Y014UFhmTDN2L2tURnlobGE0Qzh0ZC96?=
 =?utf-8?B?WTdmaDBTYXNiaVVSaEhMU1JYUG4zeFN3R2pjdE9KMW01bmJqWE05MU8xd0pt?=
 =?utf-8?B?bDZubWlKM25scEluRW5vN1RkNkhWMjY4MDZFdlg1L0V0ZHo4VDBRTWVsaVB4?=
 =?utf-8?B?dHVmM2dCS2dEMVduVnlWNGowaHBRYkJyM29DcFRCQnBIdG5QZXpab0tSUEtQ?=
 =?utf-8?B?a3YyYkhWcGhnckc1WE4wdnArZ0NNMWR4K1BxUGRqZ1ZrK2hOSVdvYjRvVXpM?=
 =?utf-8?B?YWp5eUhXR1VhaUtPNjZtaWl2bFhZZ0RqOXNHK0tiTEE3WmxXNkVWem1kTUtB?=
 =?utf-8?B?UkhtT0FEakJhQmZBeFFWNVdnaFRYWjBicGFIaTZIdTNNdzlJa20xaXcvN0d0?=
 =?utf-8?B?M2swZDkwNHJFTWhLRzNTcjBTOC93cy85UFp1RkQ0QkZDVWhiditCZENrK21D?=
 =?utf-8?B?YlVSaVVFVGU5Q3dTVlAwL1czQmJGb2hBVG5iaWwvOWdrL3BJbyt6NVlqRWh1?=
 =?utf-8?B?dGprQWdVRjc1WHl6Y1dXOExLc3FBZ2tLelVlM3pZMkt5VFBlMXdjOEdhSFE0?=
 =?utf-8?B?UC9KeldGM3dsbU8yVm94MjZodmk0YXBIQ28yV0ZNam82RU9HOWJIeG9icGY5?=
 =?utf-8?B?emZxTXNSR1BxL3B2YWU1WTRUSGVuOEVuckJ4MWIxLzEzellQVTJHeXJxMXBt?=
 =?utf-8?B?U2RGV0p5NUJNakErVmVYQ1NnakF4V1Y5NlUxLzRFcTU4Q05TRVBlaGpRVTRE?=
 =?utf-8?B?eFQxbFRpaVI3M2xmMy9RUHI5ZnJXUlgwY2VSNnRDbzdkcWQxaDNndUFLZW5I?=
 =?utf-8?B?eEpXaGZESXhadzVmRU9LNjM5SlAyZWg1TlJ0enZDR1NINnlUNlNnazhWRHFp?=
 =?utf-8?B?cGk2TmVsaWxnRWJwamxyTUx6VWRxdll5ajQ4bGdMZlNSZFIvanJ4bDN4N09r?=
 =?utf-8?Q?VFf5JdK7tQzIXCdi0LEZq00R0wUkJ0Wo8toBm6R?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5e8611-3215-4407-7ebf-08d900afab80
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:14:34.7362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PqOJ7gC425+0oJOUSAdYk0p7fSKCiJoMdyDddPwV+eNRRkVsrM/VxqE2AhvvUS8SHVGOM4LchGaj90JxeMA4aK6fVELf/85rI1AjoV0/cE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.3.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

16.04.2021 11:09, Vladimir Sementsov-Ogievskiy wrote:
> OK, that's a big rewrite of the logic.
> 
> Pre-patch we have an always running coroutine - connection_co. It does
> reply receiving and reconnecting. And it leads to a lot of difficult
> and unobvious code around drained sections and context switch. We also
> abuse bs->in_flight counter which is increased for connection_co and
> temporary decreased in points where we want to allow drained section to
> begin. One of these place is in another file: in nbd_read_eof() in
> nbd/client.c.
> 
> We also cancel reconnect and requests waiting for reconnect on drained
> begin which is not correct.
> 
> Let's finally drop this always running coroutine and go another way:
> 
> 1. reconnect_attempt() goes to nbd_co_send_request and called under
>     send_mutex
> 
> 2. We do receive headers in request coroutine. But we also should
>     dispatch replies for another pending requests. So,
>     nbd_connection_entry() is turned into nbd_receive_replies(), which
>     does reply dispatching until it receive another request headers, and
>     returns when it receive the requested header.
> 
> 3. All old staff around drained sections and context switch is dropped.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>

Please consider this last patch as RFC for now:

1. It is complicated, and doesn't have good documentation. Please look through and ask everything that is not obvious, I'll explain. Don't waste your time trying to understand what is not clean.

2. I also failed to image, how to split the patch into smaller simple patches.. Ideas are welcome.

3. It actually reverts what was done in

commit 8c517de24a8a1dcbeb54e7e12b5b0fda42a90ace
Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Date:   Thu Sep 3 22:02:58 2020 +0300

     block/nbd: fix drain dead-lock because of nbd reconnect-delay

and I didn't check yet, does this dead-lock still here or not. Even if it still here I believe that nbd driver is a wrong place to workaround this bug, but I should check it first at least.

-- 
Best regards,
Vladimir

