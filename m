Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A03FDD35
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:35:49 +0200 (CEST)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQP5-00084u-U3
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLQNj-0007GL-VD; Wed, 01 Sep 2021 09:34:24 -0400
Received: from mail-eopbgr70100.outbound.protection.outlook.com
 ([40.107.7.100]:45167 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLQNf-0003kO-HC; Wed, 01 Sep 2021 09:34:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHCg0/CEcZqu3RXcA7D6dDAur7GOgSf6vek/aVwv3usQNGoUZxi7mVkwhyIjZUMOOz2l/m6RCAh7wKoVK/DsDaBCxYU9GC96Ysd2rZBOq1aH2iTcJfwmxum6hUuHH2trNYp6V9JrlemFhuxZ9cMGuprxQBgC7U7+HhRpddS3kvuBsmaO9HDalDDFLwzZuhu3X1wvWvoRel5+bFWsVBZkXT9htI+U+AJRYsrNXYyT/mp+8IpdRyn2Zcj3QMe5D3sDnBkTuJCpCTYCfu/+jnsIRu09DdtEgl8eQlCe56KX/ccq7AS4NxlOwkB7JuIpL8b6GfvSP1snGC+OW+DdIQD7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYYCfiRcad/lEqPmibRo7yS6ZNkWZMShHnezxjFL+/I=;
 b=Su8koK95Pl93YW6C30ApVGZdssTGYn30pPKKBSfgFKkUwiWACXTbU+Ce3Yg3wLWq68K3L1arEWSN1hHVW++wW1e/soiAb6pyrgcbn4Q5FV079A5kFM4X/fWri10cmQe2MdSBvCp9w66ZYT5o5NBzTn/aACWR1XxuNaGLRwmgfb6h/fNyUTaPn4CuGU5XahVvD1hUbzZhG0JA7IGhqVTLeRkrzJo3ia0p6jMauVkg6zOH2WjHm2pMBFjIUkHi2xccEqv7rIpl/Z2dlaowGXCQE89b7KtsAsoRJDsvIByaMNGGMMjJeni9FnuEO/MaFu5FW6NtjeI0b51Hi07EFn46FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYYCfiRcad/lEqPmibRo7yS6ZNkWZMShHnezxjFL+/I=;
 b=Pdwoqgw6TtV4ps6CRMT1W5v9XQ2deUvW9bws2+1DfDQgl0LeFaSbmKU8N2bFa5an5p6aoYbdYO1Q+UYFJzbuE6PqqydEvWjGkjKgRlukoW/+YiRk3jufsvINIjkmUgHQaOn8y4PH9MCu/yTLcgbVLAojaXJSS9vMao+uzBPfqqo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3136.eurprd08.prod.outlook.com (2603:10a6:803:45::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Wed, 1 Sep
 2021 13:34:14 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 13:34:14 +0000
Subject: Re: [PATCH v3 0/4] iotests/297: Cover tests/
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210514154351.629027-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7260b639-c50b-c758-0e60-2e36acae35b0@virtuozzo.com>
Date: Wed, 1 Sep 2021 16:34:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210514154351.629027-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 13:34:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b41d318-f560-4734-8a1b-08d96d4d3054
X-MS-TrafficTypeDiagnostic: VI1PR08MB3136:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3136FCE9A77398854D003AD9C1CD9@VI1PR08MB3136.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EI9lycVBdPPfsspF5hcXcT8GWhNYBMQDceYC5dsR1sRi2dhIlh5X7e3amxJ7kl/tEA2GSW9T/VyihS8JhhEI0lPXKzAFosuQD813D2eCb/e+FiMZiGi8FQ2VhTcZI1FAIohOQy7hNj72k5MwoFT3rADJX9mKkTaL7qYZraD/sPhGuAYG7xMFQD7qu4ky8EU3dmX023+fnIHMf2B0OjKoQn7N0aumJTTriQTM3BxA2CqouAMN6qfmqTA5NgHji9aWDUTZddZmHEHcTP+PibTGVRz8SFPInNYQ0G4CqOGT6gu93FiFsgj3g9YBhjrlrIee10l0DH4772CWMIsVxkeavlyiPqOvC7J/1ESlEHJiaX58pYZ9HkArxMBdkKrTU5NJYvwzufv9FgNmvhpL7LtcWvTb98c4Ul2j7IW+l03kwSQwaKWbarIVzYrpD4+J1lwcDN4eui2LYrtkLK0dhLMEzZKEiWI3P6JYr/qBd6SW4G8dz6VqsA8jR/iTWJh/cnuudNu/76JToLqd//1+x/YFnT5ElZnPFbeZz2fqfCsslfhsX9plVcJ7etR7S1LNS/ZKCJke4XMb0E1PTY9Mej/mQeT/G/mmuy8LboP4Sp3OE64dZYde4FP016pyW4lxSIKgiMg4qevVe4hE7VArHAMpneXQlv4zsgG8Y98AeCUFVm9ScMRjh5KFYi7QPJNNdyQjpr9mU30gkuhv3smPv2Flg1PVqKdSGQeCWHrlK5TdX+b5U4KJx3ToAjILB3gCAPUMMZC6656a7NSJ0sUTN/c9h9fPPs/M+w3hoU8TSBFcWcmthCaJcSHGaZrXq9ekjisY3VdbuMnS3vkF/vb/VAfz1pVEZhLgv4vARYHCi4lZ2tUEnsFeW72VMNp50RUNGyyu8qb5tl1KLIoAvpw0mOeIvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(136003)(366004)(346002)(376002)(956004)(478600001)(26005)(38350700002)(2616005)(16576012)(5660300002)(31696002)(6486002)(38100700002)(2906002)(186003)(8936002)(4326008)(66946007)(52116002)(86362001)(83380400001)(316002)(8676002)(66556008)(31686004)(66476007)(36756003)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MC9kcjZKTk5WVnk5Zm1VZVN4MXV0UnFXa0lvY09wa2NkSW5Ub0VtWFJIMzAy?=
 =?utf-8?B?aXlIQlZwZFlxbTBtdHZvUmpRcCtabnYvVStiaFZad3F1TWVGV25hQ0ZKSng2?=
 =?utf-8?B?cWlxaXFxQWpHejBiWVVCWi9qNXBSQXJxN0pCQnF6cVJrbDE3Q3pUOVJDQ3Mv?=
 =?utf-8?B?VkM2MWZCWmp1WG43S0xEWTV0TEh2VmVhSG5OY1NZdTl0RFE3Y3YzWGNKc2lj?=
 =?utf-8?B?aWR6TzN5eGlhd2Z6c3FlT04xT1I5TTlnbzBoZ1E4Z21XWkdqRTJFNUo5UGpa?=
 =?utf-8?B?Q1Q4Qk1iaGZGUlordUN5N3dBblVqeWlNM2p0WmtlQkJEUEJmU3daOGd0RUEv?=
 =?utf-8?B?VGJoYjF1K1ZiREgvN0FFVG9lSWlzMzdmSzR6Tmd1L1dlYlFFS2hPMGJBbFhK?=
 =?utf-8?B?SGh2ek5CUi9maEhLSXphZjdaYlBzVFJFMHZ6Mm03R3RQTTZOM05WTm9rSUQz?=
 =?utf-8?B?cSt4SU84RGVWYVcxNXVXQTdmUG51ZTFlcnBXOFVEaWZUamcwNTRzcWVIQ3dh?=
 =?utf-8?B?SUtRZUpOZEVGRWNKQWNMUHlValdWV3drRlZsc2xqb3lLcjdGVG81OEh1aGJs?=
 =?utf-8?B?YzdvZXJxTmtpMVArR2lBN3RRMDlFeXVUeU9MSkk4cWNVL0t1cjE4Z2g4UHZ0?=
 =?utf-8?B?WlF1dTZROFBYR3Q5aDhGaFA3dFpWZ3NWcUxUN2VLQkpXQkUrQ2FaSjZ3aHd5?=
 =?utf-8?B?NURiTUlZc3hCY2d0LytUTFYydmduU2QvaXEwNk9oMHhJTTVwMVU0Y0dIQ2F3?=
 =?utf-8?B?dTUxaDRDbEtRRHlFVHprcWIrazNhK0tLWnhtbmRnOE5UVXNwVXVieGZ1VllJ?=
 =?utf-8?B?a1dMVnYxM0Q1ZzVyRVZNaUFVc25PUk9SaHptZzBqWkR5dUhnU0RtQy9kTWFx?=
 =?utf-8?B?RFRodlJzcFlkMlFyOHJBZXJUc0MyVjhlRENJWHZPYjdlRldtZE94bWl5SzFH?=
 =?utf-8?B?R2dDeGQ4ZWNiOG8wd1VtL0Y2MzJ6WmtQanlwTzJITE56d1ZtTnBaODNySmtI?=
 =?utf-8?B?eFg3ZDArYWVUeFh0VkJFUEtHOHVVU0VIajFNcmEvUFBLV1pIZkFiQll1c09t?=
 =?utf-8?B?bm9HQzZ0ZEdGaDR6MWtCa0czWHNWSE40d0kvaEorWFVVUnA3SGV4ZmZGWXJq?=
 =?utf-8?B?M24rdlJMek1jdHl6dytBcGUyVkJhdTlZSS96Q01DeUVaZ2ZFS05jek5ZZG9L?=
 =?utf-8?B?V2xUMTV4cC9PdEs0bU43R3hZVVZXME5XT3l1YkgvTjBhc3ZleW9qODlvMjNv?=
 =?utf-8?B?Ry9hem8wR0FTVWdmK2JRNVNKeUpnRUR2cXdpWUlHVVUwRWJMdnpjbWluWGQy?=
 =?utf-8?B?TFd6NHh3Mlo0UUZHZ044OTdPT3E2SWtZRWtOeEIxVHJETFdkbVgvVGRWcSt0?=
 =?utf-8?B?OE1nL1pUQ0dJblhIUE9jam50aXVTbGN5TjhZelNZMHFFSDExbHRiWXFyc3Fj?=
 =?utf-8?B?dXNkNDJZOThvUHJaTUN4ZzFrbTg0NXFwZ05sK0tNcFM2WE00c29YM25IN2pi?=
 =?utf-8?B?OEhKU1dIRHBGSkxzUEsvZWE1YjdXUkVxeW9iL3UzR0xNcTJ2Y2RUKzIrR0RU?=
 =?utf-8?B?b2JtYmFobFVKdkZwTkdWY3diZHhOdkhQRUdkeEcwUFdLaHFLMlF5Tk1VN2c2?=
 =?utf-8?B?ckFTOERKbjhmNC82bElPSXFMY3NqaUM0Vmx0SFBOK0VRSkw0NkxWYmxkRk0w?=
 =?utf-8?B?eTd6Wm1aeHNkcm9PcURVenptSVFoRVdDeDA3MHNnckdBWU5zUG03bnI5Q1Vt?=
 =?utf-8?Q?0lezG1GuFCYYgCLeQ3c9v2Q4sJ7U3Wt0LLidzp0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b41d318-f560-4734-8a1b-08d96d4d3054
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:34:14.1536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tksGJOG1orhxfaS9ztNrvGcj59bpGwDd7bZcD/ubmymNFYV+9FZgykeYy8vhSG9T6kabizSf+/FX9R1e+Cc0Uxma7JFWpqNNQjO2KQ7wUkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3136
Received-SPF: pass client-ip=40.107.7.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

A kind of ping:)

Seems that never landed into master?

14.05.2021 18:43, Max Reitz wrote:
> v1: https://lists.nongnu.org/archive/html/qemu-block/2021-03/msg01471.html
> v2: https://lists.nongnu.org/archive/html/qemu-block/2021-05/msg00492.html
> 
> 
> Hi,
> 
> When reviewing Vladimir’s new addition to tests/, I noticed that 297 so
> far does not cover named tests.  That isn’t so good.
> 
> This series makes it cover them, and because tests/ is rather sparse at
> this point, I decided to also fix up the two tests in there that don’t
> pass pylint’s scrutiny yet.  I think it would be nice if we could keep
> all of tests/ clean.
> 
> 
> v3:
> - Fixed patch 3: Turns out replacing `lambda self: mc(self)` by just
>    `mc` (as pylint suggests) breaks the test.  So leave it as it is and
>    instead disable the warning locally.
> 
> 
> git-backport-diff against v3:
> 
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/4:[----] [--] 'iotests/297: Drop 169 and 199 from the skip list'
> 002/4:[----] [--] 'migrate-bitmaps-postcopy-test: Fix pylint warnings'
> 003/4:[0005] [FC] 'migrate-bitmaps-test: Fix pylint warnings'
> 004/4:[----] [--] 'iotests/297: Cover tests/'
> 
> 
> Max Reitz (4):
>    iotests/297: Drop 169 and 199 from the skip list
>    migrate-bitmaps-postcopy-test: Fix pylint warnings
>    migrate-bitmaps-test: Fix pylint warnings
>    iotests/297: Cover tests/
> 
>   tests/qemu-iotests/297                        |  7 ++--
>   .../tests/migrate-bitmaps-postcopy-test       | 13 +++---
>   tests/qemu-iotests/tests/migrate-bitmaps-test | 41 +++++++++++--------
>   3 files changed, 34 insertions(+), 27 deletions(-)
> 


-- 
Best regards,
Vladimir

