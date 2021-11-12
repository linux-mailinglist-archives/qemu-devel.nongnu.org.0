Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A13444E653
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 13:27:05 +0100 (CET)
Received: from localhost ([::1]:50510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlVe4-0007j8-3H
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 07:27:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlVc8-00064s-V9; Fri, 12 Nov 2021 07:25:04 -0500
Received: from mail-eopbgr60138.outbound.protection.outlook.com
 ([40.107.6.138]:42514 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mlVc5-0000kE-R1; Fri, 12 Nov 2021 07:25:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JD495NkU2KxZq6JderX80bBDBCYpPnfvBAsFnd4h8yRmrr+0s2Eb5C4i7Kwiq1JKiGa4f4OA4Q3/DaFrlbzm92rPqRaG9ILZUMPhCit5XW6C4w8STMllukP3JGfGlz5r6L+PgAes2clQCKJYNyZWyHZiB3Knf+tYDVJIb3OYRcSgtCU9OE9xtEoa7E857/PmCVV8t0UqKEc/SsHFl07Eq/SgJnfWrxUARIqElRzi3K1d0umFF4OlQGHAUpsvAzXIuTvB/os8QfYh3nA4qS+lZXC812lOWCV3AnWPKyQtMmES2KtOEHvaZ5rPOnxo9GjX8DKSrAzloNQrHWchNwnTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbA7lePfdOcUamBKhATINw7Rjd9AO3H2Jtm6kAOlsFY=;
 b=WG07TgakHphbBCxBPsB89b9eHnJfXL23rEr2FkVLIo2SJ6dDlU8uIGv/Z46SDb5SY+3uFKNlZ2mGWY6C2e4s36M80IEew5O6m0gOpfH10oeAxoWbWgIDHHjhAm6J5rJyfvXiPePBJzXjw5LS23T7uQbxCII0qrQkvrfRmNYJDY7ztZaebfNcaiDd0+4GsVeT4qzHfs10fvNYOWTinRScjxkOjvRfC+EUn5Lh54kzEIAM2rAohm1qIhPLHfpza90+whWdOU2dGAmWHGYaBsXLpU2/gTnuSl2xU8QPVvkAbqxWDAoqJdfnP1wtVSd+3EgONsmX2uW6IdWJRYenazKj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbA7lePfdOcUamBKhATINw7Rjd9AO3H2Jtm6kAOlsFY=;
 b=TJ2ACR3wM5E1CVI386BMq+c0/RfF7+TMagUkj1TMXIC/HKHPmNcDB4Duu1xrsxNRHTkxdgqArsHmPP+u0eeIZOW0TH6wuv07n+JMtHzfeXBnrcAYs1oWvzC8rZ9slQfwUIpe74urCOJY6hIIngpwFoAj4JpZT+S5Rcchy9juOgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Fri, 12 Nov
 2021 12:24:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4690.018; Fri, 12 Nov 2021
 12:24:58 +0000
Message-ID: <32347302-eae4-1af9-b682-272f8b88d28f@virtuozzo.com>
Date: Fri, 12 Nov 2021 15:24:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 07/10] transactions: Invoke clean() after everything
 else
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-8-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211111120829.81329-8-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0049.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.229) by
 AM6P194CA0049.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25 via Frontend Transport; Fri, 12 Nov 2021 12:24:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1b0f9af-ac1e-4c37-957e-08d9a5d770f6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-Microsoft-Antispam-PRVS: <AM6PR08MB491549DC8ACD56FF9E7CCC97C1959@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WhC5ZY6Heaz1oHEDt3BIqISWdf/ZRt6cMdqoSmD2p14MsJbVTE1wtXarC/KcOcQQNb7GgwzM3WpiChhSll156HBEi5AEOq7N9adhrGp0YqZfr/FfKox2i1EY5KzRTroYpzDUm5x+3f8erDuX145agmO0M/ZW5hGoyoLc26gijMV7K3RMvotMrF7z+unkTKfU34wOH/AR206Sf01WrPI0XiBi73GbDsvQBdMRD26HAF+n+vHEPU/mEA6UjUKXAZUoZT16Q+gzlOzHs9UL+Hr76L89rBRZYD5KSwnVgpzPGz3e4Yk9gU/CdOrjFkkqItpvsnSYNZJWWwD4TKvfZyM5iT5fqWz7DURywnKbywbw82l6AFB1NKs4n/CRmVax9C979iWkv0Q+SzkmdoyPCMUiabicFhdtQWCCdzsjq2UAr5sXIeyZusKEP7Cx1HubrlTu0KYq5E5GSTkiFIq9b794fGzmWl0og8RwN1A+u4lebTbi0b3Ljl6GFMdFpumhYo8Otb+xG18bpper+VeNGSkAxScmHDC4Ggy5Hh34mmC2zmPpxu8W24bcafSnQQnEPKuq4pR69+HSUqEeGRjmoi+xb7GbJN5Uz0S4/oY/lqCbcDKQX61vUnwArE+mZl7LbdMk3VlS7s5iZNUur2NFjYRN2HWUUKsOIjklGuRwaY3MtV9L0YxCSoaMjlcjuimMMQnPuJpLWrKqmPh1JhWRI/XMxFscc5oZ+muppd2jHW38/FkBfixYax3YLA8zgyUgPJJIopIuQNq70ZIO4KnrTw8HWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(31696002)(2616005)(8936002)(6486002)(508600001)(86362001)(38100700002)(52116002)(8676002)(36756003)(38350700002)(4326008)(26005)(66476007)(83380400001)(4744005)(66556008)(16576012)(186003)(316002)(66946007)(5660300002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGNUMHJ1djFyTWc2UG5DMjBBYjA2bGRZZHJLdXd6RE1LV1REL2poZ1BsazQw?=
 =?utf-8?B?VEJMNks0T2VYaVQzWmxMb09VcmR1aCsrbysrQmlQK0JaT3pKOG9ZaEJvRkUy?=
 =?utf-8?B?Zmc2MTd4UU1vcjNCUmx1SGhYMEFPR2twYXBHRjliUnVla09JOVVWTTA3aCtX?=
 =?utf-8?B?b1pzMkJlcEVTNld1cThBWnJXS010cXdJUUUwdndNZ3BTZ0tjZklRc3lLUmU2?=
 =?utf-8?B?dklYUncrYngzNGVMSFBoWDIvUzUvNzVvSlZuZ1FVNDFGbGJDMm9ZTEJXMTIw?=
 =?utf-8?B?eGhaS0J6cFcrMGJzdHhNR09uUWhJY2IrOVdJcmNSZnNsTmJ1WVNkL2Ivd2pI?=
 =?utf-8?B?MmE1bTdJdUFGOVFzcDQ2V1ZUdk5SbUpjOU14b01USXF6RGNpbnorSGpVNFgy?=
 =?utf-8?B?a3R1TC9hWFNkQzQrOXppOWRKUGdXS1Q1bjc3SjYxOHJjSk1EbTVWOGhHaTVK?=
 =?utf-8?B?dy82TFNDWmVQaUVRWkZ1MVFDQ0pnNDRmd3h3Q3VrUVN3SmJnb0VTUG9BWlVG?=
 =?utf-8?B?cXVZRnBXR3FwZVp0VU5JSm5XYWM0MjNydlJOMkVJQlVpQ0JrYlhaWksrMDlq?=
 =?utf-8?B?WUc2MW15S1grWTFLMjFXcFg2OWJraUJYdURXQ2toZEZBSnJUWTNuKzE0WVA4?=
 =?utf-8?B?bTl2T29rREpJY1pUemJoZDF6Q092VUxwQzNRWG14Wm5vM1V5dFQ2Z2JGb3NW?=
 =?utf-8?B?cFlVYUgzb3lTZXdhRXFxNU10Qm40ZVJqbzhSbkw5VitCUE1XRDAreEd4NVpu?=
 =?utf-8?B?ZmdWU24yZElkMExXM1l0N3NZQVhhMmQrNHJMU0tFMEpJQkhDMTRyK2VpNG1C?=
 =?utf-8?B?SVNYZ21wT0JDNG94VDg1Y2VJdlNZMVJKVUJIMTRMK0t6VXlDcWtrYUJxT3J6?=
 =?utf-8?B?aGFYS1Jyamd4L2E2a3FKREMvTFlLc0lWcEZtRUdJeVArQ3lwQ0QySUVxSkNB?=
 =?utf-8?B?VVFkVFRyaXJBaytuRVRoMjRLSC9aK1RUUzNzZWNuaTlYUUdiWGM0ekxwREwv?=
 =?utf-8?B?M1orTG1PSE4xbnFHajFIOGZwQ1M0ZWFtWTNybys1WGNEQmRocE5TQkhZR3gx?=
 =?utf-8?B?NVYwaHFXaE5mSXpzckFZREJhRFh1WkRsSENmQTBncmJxM3pvRWc5ZWEyblF5?=
 =?utf-8?B?cFhuRU01TXhBMDZnaWpBWURsVkVGZlNTSjZaRkdzQkloN0lnSlIyZGR6dWZw?=
 =?utf-8?B?bmNYalRvL0czSVB2RVR2UnlIQ3NnR3FEenJKVElxMUxrVGtJNkk5V0lndXlI?=
 =?utf-8?B?UGhQQktIbWcyRk1iQ1ZJQ1lSbWFzNnRmZ0RRSkxGd3pmdXZPUEZiMUllbnBF?=
 =?utf-8?B?by9DZlN1aFdkSTBabytBbzBTeFdCTDBwN3orZTFXSmJEcTdVTm1zK2liVWRC?=
 =?utf-8?B?YVZWdTFXM2xzYjZ0UFlIUllNcnhIRWljbnhWQ1MyUmtYVC9wZTlpcXlhYjVM?=
 =?utf-8?B?b3ZtK1Q2WlMvZWdQU1BDdi81ajhvakpXWEpDZGxmWGxOOElja1ZRVEhkaEdm?=
 =?utf-8?B?YWozZGY1R1FUSGd4Zi9BQWIrVk9McElyRDVkdThWd01odTVXdmJJWERuQlc4?=
 =?utf-8?B?cGVveXgxa3IrNlJFa01jaXhmTmJhaFRUVFJ0WktQVTRZOFNsdnRnZDFMUGI4?=
 =?utf-8?B?cHZtelZtaXhtQ09tdVdlT2J4VkJRRit6Tm0wdTdROCtQbiswTVNlQTduQmpB?=
 =?utf-8?B?Zmc1dk81dkFXOGEwYkFMeWd0NUlUci9rQlJ4K0JzM05FSmdZS3RqMG50aDZX?=
 =?utf-8?B?TFJqQ3UrdFVPRndVNTFUcHc1OVhack1ZWWNmejFrcDhISnVkVnFDNWs1ZzVI?=
 =?utf-8?B?Vnk5a1M4R0lTTXlpOUdFZnFZS3pzZTgrbHB3VW5XUVpvZ2sydVR1cldRUnJn?=
 =?utf-8?B?L1VUbEE3bk1kdWd2eitEU21DMkg0Yk1kNncvd0VscjVZMXczTTM2VkczSjd5?=
 =?utf-8?B?Sm14YjNQL2JRdmNoNllFRkpQQUpSMHAyWDk5YTczR1E3SUl1dkI5cm5zRm9k?=
 =?utf-8?B?dERhUTE1OUpIR085Qmx2a0VLbVNYcTFKSDZqQXdBbDdsb2h4UlRaMXlFN1F6?=
 =?utf-8?B?SElhREE3Mk44U0hrbHRzUFBPQWh3V1JvNXVveGhiVlR6V1I0aG4zbEJPU1Yr?=
 =?utf-8?B?MGpVcGRCK1VaTGNyU2Q3L0srQVU1WmRmWksrL1Z6M211ZnRZUEkzUHN6QzN5?=
 =?utf-8?B?TlNsd3drbmdKVThsaGp2elpoaTVvNVljdGx3MEsyMU42d2dGMGdHb3lXY0RH?=
 =?utf-8?Q?RPP8rYpGMcOUaiteleMMPULM5YXj2ZiYqCsEKpIKcw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b0f9af-ac1e-4c37-957e-08d9a5d770f6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:24:58.2262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfEeKzjQW7iyqusG+7A4OvdV/KtBe8z6H+N0lr37HFTHkpfNpSg5zkVHyPj1LREVT7egiXQAILpF4XfYZif+JPVAQRz32+ctQYVRoMunLCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.6.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

11.11.2021 15:08, Hanna Reitz wrote:
> Invoke the transaction drivers' .clean() methods only after all
> .commit() or .abort() handlers are done.
> 
> This makes it easier to have nested transactions where the top-level
> transactions pass objects to lower transactions that the latter can
> still use throughout their commit/abort phases, while the top-level
> transaction keeps a reference that is released in its .clean() method.
> 
> (Before this commit, that is also possible, but the top-level
> transaction would need to take care to invoke tran_add() before the
> lower-level transaction does.  This commit makes the ordering
> irrelevant, which is just a bit nicer.)
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

