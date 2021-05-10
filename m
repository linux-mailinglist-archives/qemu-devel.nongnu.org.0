Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83205377F6E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:32:41 +0200 (CEST)
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2HI-0000bN-L9
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2G9-0007XH-2Q; Mon, 10 May 2021 05:31:29 -0400
Received: from mail-he1eur04on0717.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::717]:1245
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2G6-0007Iz-C8; Mon, 10 May 2021 05:31:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhbFMaUezbe6UqvYUg+/dd1f15iv27ytAyKCDZa4Ap/wGxkmOkSLowSx0AMOpn6c+8HCZ9FftgwWvG3h9tsiTN88APvPLHsIyyNSGdtl7aXNgkyLazYCI+Q3ra9M0UpOwzA5ro/1lDyViJRoi8yOGojC/hOxBPlcv8mCk/h7Z+ha/KWJXU28x1+xpcXxO/U2gmS0/A2nShVAjGST2ToWsovXdoC7BelU6n0yOHVEePEmer+Jut9uFXIN2OvieOgQ0R7lbmwxwO/l+9bYkXYVMPAiacaGv/QHTB0aVRWLBA317ipNNj61tKYs1uinKQEjuSR4up9459k9I/mwgKzzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZJ4r9MHy+KxLnKPZRX6Mb3sTjzMw92YMjz293uYRMU=;
 b=KQBzmR2kHG8pKAUvFW4vr/Eu1R3u9GheEpv5Cbq77OqJGdWd6iskvsUz01m1xo5Kcp1xjo0FXlgIt4wi4ZlJGXGTPtYs9NbchgBcUp9Qwi0+Nn9WVd7tmMERq3wuRRN9LCNOTFqikgQy0/+xEKVWz2+V3aXA708MIdIeHJoKWWVf2jS0IMYI7hSpRA429qiY7Oo7tWBT5L7Ds7YcJ7VNCYJUsfYXQkYyf4fNgzOiROOHTpLpbU+jxgzRXC94aeJfi6e5wpfzNJyw3AYOz9+65xBX6NAfQrK4v3OjWfV9fykzUcBiClOikWGcs5mGoGKV5lzcgWpj943AqLXG2gFg0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZJ4r9MHy+KxLnKPZRX6Mb3sTjzMw92YMjz293uYRMU=;
 b=cV7qpXgE/JpnkjIHZl0lF2flGhyV2DDtgxdMmJtQ4wrGNn7RAXFyXaC5ECZz8b4jL3e9pwrREjeGP0a2lFBwjoLQSFXb3ehl2KhrnwUFKeIpIBOEaLNRWEt8gf6uijMwzL+0daZtoTzPB4xql66rFlWyURAt1Iw5B93mEWKWAYo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4851.eurprd08.prod.outlook.com (2603:10a6:20b:c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 09:26:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 09:26:18 +0000
Subject: Re: [PATCH v4 2/6] block: Allow changing bs->file on reopen
To: Kevin Wolf <kwolf@redhat.com>
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
 <eaa0b429-223a-dd84-9e14-ba37fb0ad03e@virtuozzo.com>
 <YJVKD1Mh4ASCA1vU@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6485251c-fc0a-c210-1fd0-2c74c34271ed@virtuozzo.com>
Date: Mon, 10 May 2021 12:26:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJVKD1Mh4ASCA1vU@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: PR2P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::16)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 PR2P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 10 May 2021 09:26:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42852118-7b50-4a27-45c9-08d91395aadb
X-MS-TrafficTypeDiagnostic: AM6PR08MB4851:
X-Microsoft-Antispam-PRVS: <AM6PR08MB485107283B4412463428A58CC1549@AM6PR08MB4851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0kQ44hilmJqW9Ac1EupyW7Xv2DroS52KzSbPIjqA4WfljJgLIBabXTuzYzMUqmgGZTrP9xW3+ADsn3TowAYymNBNug3U+iRxMP0aqMQnHLWJlvAJTYXUhc2BFaHquyRZMi63mAYb0AXyyQLl+d+8yTVZzaYaSDM2JxAf3NJlJzkxqTCwfsFXTOFQVcVY+bWPAbZzFue3ChvlVCAQz6naZnG6RAVwqYP9f9esHbKsDig3lTDYz5xFVOMNcO5cdu2tF3Tu1cjIm26AdrZDVKYh3dlxTpbILeJf287JrbrpAnXmyCbIit5uhmShk1vlbx0urdWy93MUSsI2anHHjuvpwgmzeb7FGVem2RPWNEiQHQGtnhomJBEnbA4iQtS87/TVyV28NHdwtpM7N7W0szxLfDNSfJjQSXbwK7oMJNiTXtji/RWo36nNNAVMD7LHYsWZJNbzcnpunp+tAPeksOLNV+ofvPZ55RV0lvOhsiBVMIFh1CctnRpSqy2WF+yk/q8f7CW3X9VRl+JWrwinWbnKdS+HnKH9zIvWKOiuGxGl6mrgtYCFYCU8lYN1/JhGwdNZRbO6HFTIsZ01EBQNka27QT8w5KXKa+Zzs8vDIqcYeIkIJeCtnQdKzVggo2D8f3x/KW633AS1+4KyYawWDLMAwEzI0ZBu1sBYxFTLpRqpO1TLWnibl70gY/EvFTvpl+jrx0ptdpvVtJ66/RG5sxXkZ5h95zXc94xoIRhgiN8P3j4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(396003)(366004)(316002)(86362001)(16576012)(4326008)(478600001)(36756003)(54906003)(956004)(2616005)(5660300002)(16526019)(52116002)(31686004)(6916009)(31696002)(83380400001)(38100700002)(26005)(2906002)(6486002)(66476007)(186003)(8936002)(38350700002)(8676002)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WWx5MldRUWY3bkRxMW1DakZadFFLQzV3eTdtTldwZnFEeFprV2RBRUQwY3da?=
 =?utf-8?B?OGxzRUcrMEVObVp2OU5ic01Jbjl1ZVp5WFRIbXgzbjVBVmVJQXJQcHVJNXlK?=
 =?utf-8?B?VWZ4a3FTWkxlTGdUZHdsck92Y3FiVnNxbUhWcFloK0lUYTBpQmRFZjJYQ3N0?=
 =?utf-8?B?UlFwNGw4UEl2TDN4OTMySloxVHF6SndJU1VzV3FaUndCYmJCVnU0OEdIaWRP?=
 =?utf-8?B?aGk0bHVMY2ZOSlU0NjI0RW51QVFJWGRjTGlYVVhoSUZsY0M2aE0rRUlCNGxG?=
 =?utf-8?B?WEY1V1h6S1ZKMTNZczVQeThwb3VpK2JmRlcrWHE4aVkxQndXSWkrVnpOUGJT?=
 =?utf-8?B?YkhTK2EzSUF4aWpVTStHRHBwWEFwMVBtVkY3TUVuR0VzRzk5M3grbUFjcXN4?=
 =?utf-8?B?RGFBaGxrWnhZZUFEaE9kRXUyc2F1NjU3VGI5NmRqOFNueEJVYnVBMTV5KzZJ?=
 =?utf-8?B?SktzQzY4d080V0R3R3dML2Y2dGhST1lPOEFVd1kyU1ZUemJOVlltYm9uVERX?=
 =?utf-8?B?UlRkdXVJbmczc1k4WStWQ28zME9tQU9hMGZXM1BXSzQwcHRkSE9LMnprMUVY?=
 =?utf-8?B?MFdnaHdONzVRSUhvQTNvWS90MTV0ZlNvQXBlenVDR1RnSGJTWW5oSCsrVGRt?=
 =?utf-8?B?SklVU1QrS2ZtN3djN0YzL3FveVRRYXdHcy9wREpnSGl2M0xYdTk0c1NUbUdy?=
 =?utf-8?B?UnBiNEF1UkVoMWVkRmkxT0wxZVBmZnBJaUNSZDFBZjNFdHYvSFZkeXp5b2t2?=
 =?utf-8?B?SHdUaEZzYmlhOElBUGV0VmZPSE43cXV6OWpPRzlyanBuTG52Rk9LelhZdnYw?=
 =?utf-8?B?ajEzaEJoR3VVaFBMYzU2bFZKbm81YWxSOHVVNU9WTVJiZkNJRnhMQ0dSTlBP?=
 =?utf-8?B?dERWRVNDS1hyUTRNajBCbitDajVCRTRSaHROYVF6aGx5dVEvUTc5RWI4clov?=
 =?utf-8?B?OHRFWW9wd3J6dWFUUjRuSkRsbHdvTHRvdlkyTmx0UURJMXVXU3h0cEpDTXhk?=
 =?utf-8?B?UlBYcDRHc0pjOGZoUFZzMDNyUGJ0TXhrUWlud01ZczlMUFV6Q0hVN1JueE9n?=
 =?utf-8?B?OXR4Z0tmMzNoK0czdjRFRE9PNENBYi8xbmY4VlhTV1VuT0Rzc004MFF5OWFP?=
 =?utf-8?B?NkZNZThWVkFlT1hzTmZsVW9aL1hRd29yeVcwQmJlNjVJZ0xqeWhNTnhXUzNv?=
 =?utf-8?B?ZzZkRFZwSTFhaEc1WVJldnFTaXpRUUxsanNod3ZMNDRXTThMd1o4TjBpZW9s?=
 =?utf-8?B?RDduRklPUmpiejRiR3htdzY1SGJvYjcwZ3dqMTZ6SytWL0ZtTjMxQjBaNGhS?=
 =?utf-8?B?Y2pCNFdnUHFpa0JoNTNsN28wVU53WWpXekdBRDc4M3FiQk9kYjFJQkllVlZF?=
 =?utf-8?B?M0h3QXB3YzJOSHo3bDE1SzNHYXlrdCs5RjNqcFM3aEJ2MmlmNEQwbDBkL1BG?=
 =?utf-8?B?S1ZXdS8vVngyYzRwODVnUXVtWlBIZVB5ZEJvQmo5M2ROSE52Vng2N3M5NEdH?=
 =?utf-8?B?dzlXVnhRLzk1ZXFsYVY4VjhlQ2hCN0lPbzJLWjN0d1NQWE42eEpnZXN5VWtJ?=
 =?utf-8?B?RzhBWUZhQ2c1Q2o0bnNoMVY2NTg1U2EvZFhkVWU0RmsyRlJoRWZsUWJZQllK?=
 =?utf-8?B?bjFCL09aNmUrZHo2dVgzaEtSNGRQNlh2UG0wei9OWWswdW9XVWtJREUwTVl2?=
 =?utf-8?B?K2lvcDFoUDlQM3VIekNteWZodURQYU5oaExVa2ZHMDlKaUpBNGk0SjBUVkdG?=
 =?utf-8?Q?uDzzIoArjLMet0+CLjTsJ4D5Y7+CnhBrScuTAvd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42852118-7b50-4a27-45c9-08d91395aadb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 09:26:18.8890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APGgkK71wsqbLuD/XdsQHskqK4of6tZucBIv3okX5Yq5oRldhUGxxVY8kABoWx1sfVKMaqUGmdGwi/QuppFVTPz9DLIbZB+uQTSQBx25eXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4851
Received-SPF: pass client-ip=2a01:111:f400:fe0d::717;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

07.05.2021 17:09, Kevin Wolf wrote:
> Am 07.05.2021 um 09:11 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 17.03.2021 20:15, Alberto Garcia wrote:
>>> When the x-blockdev-reopen was added it allowed reconfiguring the
>>> graph by replacing backing files, but changing the 'file' option was
>>> forbidden. Because of this restriction some operations are not
>>> possible, notably inserting and removing block filters.
>>
>>
>> I now started to work on making backup-top filter public..
>>
>> And I think, we'll need separate commands to insert/remove filters
>> anyway.. As blockdev-reopen has the following problems:
>>
>> 1. It can't append filter above top node, connected to block-device.
>> (but bdrv_append() can do it)
> 
> We once had some patches that made the 'drive' qdev property runtime
> writable. What happened to them?
> 
>> 2. It can't simultaneously create new node and append it. This is
>> important for backup-top filter, which unshares write even when has no
>> writing parent. Now bdrv_append() works in a smart way for it: it
>> first do both graph modification (add child to filter, and replace
>> original node by filter) and then update graph permissions. So, we'll
>> need a command which in one roll create filter node and inserts it
>> where needed.
> 
> What backup-top could do, however, is enabling restrictions only if it
> has a parent (no matter whether that parent requires writing or not).
> 
>> 3. blockdev-reopen requires to specify all options (otherwise, they
>> will be changed to default). So it requires passing a lot of
>> information. But we don't need to touch any option of original bs
>> parent to insert a filter between parent and bs. In other words, we
>> don't want to reopen something. We want to insert filter.
> 
> Yeah, but this was a decision we made consciously because otherwise we'd
> have a hard time telling which options should be updated and which
> shouldn't, and we would need separate QAPI types for open and reopen.
> 
> If we now say that this is a reason for avoiding blockdev-reopen even
> though changing some option is the goal, that would be inconsistent.
> 
>>
>> ===
>>
>> Hmm, another mentioned use of blockdev-reopen was reopening some RO
>> node to RW, to modify bitmaps.. And here again, blockdev-reopen is not
>> very convenient:
>>
>> 1. Again, it requires to specify all options (at least, that was not
>> default on node open).. And this only to change one property:
>> read-only. Seems overcomplicated.
>>
>> 2. Bitmaps modifications are usually done in transactions. Adding a
>> clean transaction support for small command that reopens only to RW,
>> and back to RO on transaction finalization seems simpler, than for
>> entire generic blockdev-reopen.
>>
>>
>> ===
>>
>> Hmm, interesting. x-blockdev-reopen says that not specified options
>> are reset to default. x-blockdev-reopen works through
>> bdrv_reopen_multiple, so I think bdrv_reopen_mutliple should reset
>> options to default as well. Now look at bdrv_reopen_set_read_only():
>> it specifies only one option: "read-only". This means that all other
>> options will be reset to default. But for sure, callers of
>> bdrv_reopen_set_read_only() want only to change read-only status of
>> node, not all other options. Do we have a bug here?
> 
> The difference between these cases is the keep_old_opts parameter to
> bdrv_reopen_queue(). It is false for x-blockdev-reopen, but true in
> bdrv_reopen_set_read_only().
> 


Thanks for explanations, seems I panicked too early :) Will try your suggestions.


-- 
Best regards,
Vladimir

