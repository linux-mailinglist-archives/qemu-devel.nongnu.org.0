Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE138D08B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 May 2021 00:07:52 +0200 (CEST)
Received: from localhost ([::1]:56534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkDJ9-0003qJ-B9
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 18:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lkDHC-0002Ee-Sk; Fri, 21 May 2021 18:05:51 -0400
Received: from mail-eopbgr40119.outbound.protection.outlook.com
 ([40.107.4.119]:60129 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lkDH9-0000jz-M1; Fri, 21 May 2021 18:05:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXfzikm1CphVHCLLy+yYDD+Ow0Ub2XdbRDKZhY0jT937EU0w987NRmVHbHoD48XISYj2qDDUpytjyjRExXdKJ7VkyCL/lIerfrERJSnJD6FCcVWCVuLERShkJ8CgM1JDNW0BUPoetCxcSfNXMOHdc/W8ti/xDleUzte6Xm3Qma3b3x7cfNANq/hi6kCCSpcXMhNl5R6ezgEB3d5r6d29A73OL+qPqOOgiFOYWdcbq6hpUBZQF0kp0Mq4XjjA8w1GOpuhk8IyY3ZF5m6SLxvyq18x8T/PIbl5vdt+nJVBRQwD7FHHoFq0ziJ0Vpznm0OaWK6RpCEyULXsrhf4nxIGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8/7+BNwx1INHU4lb0USsXWGpmCKN2w7EPxLlOBSqwA=;
 b=DvWyl4xfrrn8vlzgI76bCzbpQkzxJk+BnafUPmFzUckgge/97jYoQepPBnl3ZlYlHEmxU0J4gM7kPteW/B950oufGlGrImEsRrEs5eQfz/4sZNgTPp+V3RYrqP1L0K+BcDTMj54MRf1WZW1QR9owvpALNQgPsK313VlCIMjOrxjtspuq4Ozbxvws7rEKCIFybS1HFSF+v3B2+Z15HtH3VZw5Yu+pVNGMop5rQeXhRYOyhLQCZoRJAcH/Wj2qDWYpIGCDzOvja6+MawJKxUfyrxVfOCsy/xGvmPTLu+LQxtR7hc2wAVOsJGKwKN6EE/ACcm9uzguSzsWE2yHO1OuxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8/7+BNwx1INHU4lb0USsXWGpmCKN2w7EPxLlOBSqwA=;
 b=BT3H/USs5Cr2NdvdC92/EuR0RD9umFRI6wGfk9lYLAmLCARN0KqVu7g88hjYpRkZOHY4hmg/h/Zd1DekovkmWZiQIjX7SeRJW7RwqCjTh2wfgUNdA//egA1N1XYadvmaHwwQQXiFoRa3DGTTNpZcidpDcGcpZA5j7UMO/Fm/YBs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 22:05:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 22:05:43 +0000
Subject: Re: RFC: Qemu backup interface plans
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 yur@virtuozzo.com, Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
Message-ID: <f784d129-5e7e-f514-af90-4d0128c50a90@virtuozzo.com>
Date: Sat, 22 May 2021 01:05:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: PR3P192CA0014.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 PR3P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 22:05:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a00cbc-8d89-43af-f5de-08d91ca493a6
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944EA962E0678E21E4DEE49C1299@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GleTa/SgeE63mkhsaH03erL42uzXsnNZ2L66C1wiiEv3WApIT2mln+4fM2+2yLWKafa34bI2V1BnBM0Uu44JoZOtXL5U+RoJ5IpApkZBcn0kPwPUgiYtvQkzCL7pKnp1YY3h9xNOMdBlfoTvjHTWVBN3SvR8/d7iRwKxRarF1UDVpV6hhBmW+KI0nv+xXuWdjkpDepBmTxc/yESdueILMyyOP1aserwAkWgU/0TOMdyCv8asQHHY95ly8hmeEcfHr8sS0VMvgAjwhDFOPoa+7QGBQu+xz/UWno+q4gNIwH2URkJVGKx7egKfEqZHhfqEyVcBUSDIarf4eTlc9j7/AnH0oyD9ZYLX1gFo287eNVm5Gg1kLPa4DWiATqX1b99FTXVDexbue1oK1U5dzNpRTPMxon2Ig0lCirLHvL1ylQZquMSTmMiwqA8r0A6HV3/rm5cpCDCr67HbPaQzZLjdqYlPCBLRiXOIiQCX52uzRjeZt6h2Su/YJhaMDkzcxv8M7GswDDZAJwFU4U7ENHakJYL2WtEhwFxiNw+bwuVJZcoK2/OmoaB32oe2tEFuFns3/mBnnZmkTdmtnTntob43zvyMaapNfq2xuiz78airuvPxIt7T4QtyfDFCsb5ydzkOlcQvchdGsP889d3cEFtKwW7SXB3ottYM+ohEGkrVPwFW6IOMYFTuWqBqDamB8Gfw/Hdsd0GR3A1rQLmGtdpTWST2snqCiUx+/rttkiiv0kQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(366004)(136003)(346002)(396003)(316002)(6486002)(83380400001)(5660300002)(4326008)(38100700002)(956004)(36756003)(86362001)(38350700002)(2616005)(66556008)(16576012)(8936002)(66946007)(52116002)(66476007)(31686004)(186003)(54906003)(26005)(6916009)(31696002)(2906002)(478600001)(8676002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0s4ckNlVVMxbGszS2tmRzJPZ2l5ZGlPL2czQVN2UitBYlpFZjdneGN1aC9i?=
 =?utf-8?B?S0xYdFNXQzhOVEw1cEMrL2lqdjlSUnROdURBWHRsZE5lbEZWOFFGQWk3U25h?=
 =?utf-8?B?djk2VkEzOHBaVUpWckdSM200Q1RNUzY4YTVDdmlOSCtwbDNYVnI5eEx2T21E?=
 =?utf-8?B?TjlXZzl2djJ4NWU5VldTY1krLzk2ZFJmd3NSb3hMaXBpYjdyNWZId2dWT1hE?=
 =?utf-8?B?d0FKcDdzZWFzZ2VCZ253V3JPUGVRSEpBNFAxam5mRDEzVkdwZTJRSUEvSFFS?=
 =?utf-8?B?ZVpOMXNzQjNSZlhZMks5bmpZQnM5bDhNcjFtYlp4Nkkvc0dCZVJUaytTbjFL?=
 =?utf-8?B?M29VbGtLVXQzODJTSDBRMDR0akl0SThtR0pxQ0VvNC9jSGpEN1Y3RjhFejR3?=
 =?utf-8?B?THloZkk4VEdUL202LzFBaDZJRmFRRXRYRUdUeWZsaW5pamJOMFNZdmRMaStG?=
 =?utf-8?B?WHExRnVDT1NMUW5kSHV5d2Y3MVhKR2t1QVE5dzY5Z1d2eWJpanh6NE9WYU5u?=
 =?utf-8?B?WCtsS1hKR1BXZEY1eS9TZTd3ME53dGttYjcvaEo1LzZiRVJZeVV6a0pPa3I4?=
 =?utf-8?B?dXYxY3VmbXFNRkdpQ1RwL1E4dEMvN3hiUlpvV0lqcUtNc2dNVG9NQWlHbzdM?=
 =?utf-8?B?dFJMWHp4QWgzY1VvYzVWT3hyU3dxY3NxSnVranNjQ0NiMm10dktiVHNiK1Jr?=
 =?utf-8?B?cU4zZDVnYzdUOURJL0pzV2VtVEtMcDEzWnRtSS9KQlJWblVGUmgvSXREenRn?=
 =?utf-8?B?S2x3bHg4YUtMS1JVQTNvTW9XbGxoY2F4S3kyTFoxQUtFSjZ0WHNhUjFsSzRt?=
 =?utf-8?B?VllJL29nUWw1K1daYXk4cW5lREZIdTMyMDRqL0FrS0RETm1ZWExOZ2tMZ21k?=
 =?utf-8?B?dUcxL29pb2tpYVpsSkxPV214bWh0b0tWL0dZcXNsNXlkTkZTUkd3RnhhdHpl?=
 =?utf-8?B?TmdrNXF6Zng0cWFSMTdmalQ4YWV6SWNJdlA4cktTVGRwdFdoR1ZYRSswQ2FD?=
 =?utf-8?B?YkNtemRqOTFyNzNUaHRBU0tqZzZNeGlzOHlIanF0a2ZFYnJPUlJLYVowaGdE?=
 =?utf-8?B?WGdBTnQwcGpwRy9kMHV0SVhUUkVNakxnd3l1UkwrUUlMeHRRcnlNVDdzSnJ0?=
 =?utf-8?B?TDZ4UzNaaGQ2c3E1WGpnSnU3UmhJc2VSNEtpSFV5RENaSVVqWE5mVlFyU2Vx?=
 =?utf-8?B?anMvUC9WTVNJa3VZNWNPRzNkM3R1aGRLajRZakExRitNWXdSVzVsZnJpeUlC?=
 =?utf-8?B?ZHFYOUhxUXJkTXpxTmIySmYxY21OcXNvaGZCL1FyckJRVDFsdVpFQmloZUJI?=
 =?utf-8?B?NWJzVlhidGNIR0VyUU5zSjQ5V3JTb29IQ2tUV0FtL2xKUnkzQWppaXFiSnBt?=
 =?utf-8?B?UFhBdGFOUTdJamNSbEVFRUxVR0FKbUh3Rk1UcG1mK1VUUUlaZ05SSnhtc0Fk?=
 =?utf-8?B?UzdWcm5jM1ZYMnE1T3RGNzZQOG43Z3p2UytRTlQxZHliVFJLSWJnZWxkUkk3?=
 =?utf-8?B?dlhFZ3E2MjBrSmhPejhoVU9reUZsaEg2NnFwOVZYSnBjMFREdTcxMlpEcit0?=
 =?utf-8?B?ZitUQ091MzYzREU2M2prczlmeUl5NEc4ckRLNTdFUTc0alVIeUxsd0tPSTJv?=
 =?utf-8?B?Y09WaWRjeE80VUs0NGovMVJHdnpwRUxhdE9iVTRGYXpEUkdNYXY3U1Z0R0Vq?=
 =?utf-8?B?bURVaWUxU2ZWdDM4RG9wd29tT0ZqSm5oZDRFZEpXM2NMK1QvNGhtSDZYNkdh?=
 =?utf-8?Q?GzKa7Uw57JNHIBZiKsYxJfcoHyFe97PDhmMlC3s?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a00cbc-8d89-43af-f5de-08d91ca493a6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 22:05:42.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbu/fSqp0hx7x1bItKbCXbLt6hUrJnCd/P+/K5tuF2heau+OVhHD/bET9N4ynok4GtQ5r154cmzE0N/cwouvAsI+CxGJTLi5ch9F3hYD054=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.4.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

17.05.2021 15:07, Vladimir Sementsov-Ogievskiy wrote:
> 3.1 and make it possible to modify the bitmap externally, so that consumer of fleecing can say to backup-top filter: I've already copied these blocks, don't bother with copying them to temp image". This is to solve [2].
> 
> Still, how consumer of fleecing will reset shared bitmap after copying blocks? I have the following idea: we make a "discard-bitmap-filter" filter driver, that own some bitmap and on discard request unset corresponding bits. Also, on read, if read from the region with unset bits the EINVAL returned immediately. This way both consumers (backup job and NBD client) are able to use this interface:
> 
> Backup job can simply call discard on source, we can add an option for this.
> External backup tool will send TRIM request after reading some region. This way disk space will be freed and no extra copy-before-write operations will be done. I also have a side idea that we can implement READ_ONCE flag, so that READ and TRIM can be done in one NBD command. But this works only for clients that don't want to implement any kind of retrying.
> 
> 
> 
> So, finally, how will it look (here I call backup-top with a new name, and "file" child is used instead of "backing", as this change I propose in "[PATCH 00/21] block: publish backup-top filter"):
> 
> Pull backup:
> 
> ┌────────────────────────────────────┐
> │             NBD export             │
> └────────────────────────────────────┘
>    │
>    │
> ┌────────────────────────────────────┐  file   ┌───────────────────────────────────────┐  backing   ┌─────────────┐
> │ discard-bitmap filter (bitmap=bm0) │ ──────▶ │            temp qcow2 img             │ ─────────▶ │ active disk │
> └────────────────────────────────────┘         └───────────────────────────────────────┘            └─────────────┘
>                                                   ▲                                                    ▲
>                                                   │ target                                             │
>                                                   │                                                    │
> ┌────────────────────────────────────┐         ┌───────────────────────────────────────┐  file        │
> │             guest blk              │ ──────▶ │ copy-before-write filter (bitmap=bm0) │ ─────────────┘
> └────────────────────────────────────┘         └───────────────────────────────────────┘


Now I think that discard-bitmap is not really good idea:

1. If it is separate of internal BlockCopyState::copy_bitmap, than we'll have to consider both bitmaps inside block-copy code, it's not a small complication.

2. Using BlockCopyState::copy_bitmap directly seems possible:

User creates copy_bitmap by hand, and pass to copy-before-write filter as an option, block-copy will use this bitmap directly

Same bitmap is passed to discard-bitmap filter, so that it can clear bits on discards.

Pros:
  - we don't make block-copy code more complicated

Note then, that BlockCopyState::copy_bitmap is used in block-copy process as follows:

  - copy tasks are created to copy dirty areas
  - when task is created, corresponding dirty area is cleared (so that creating tasks on same area can't happen)
  - if task failed, corresponding area becomes dirty again (so that it can be retried)

So, we have
Cons:
  - if discard comes when task is in-flight, bits are already clean. Then if task failed bits become dirty again. That's wrong. Not very bad, and not worth doing coplications of [1]. But still, keep it in mind [*]
  - we have to use separate bitmap in discard-filter to fail reads from non-dirty areas (because BlockCopyState::copy_bitmap is cleared by block-copy process, not only by discards). That is worse.. It just means that discard-filter is strange thing and we don't have good understanding of what should it do. Good documentation will help of course, but...

...this all leads me to new idea:

Let's go without discard-bitmap filter with the simple logic:

If discard is done on block-copy target, let's inform block-copy about it. So, block-copy can:

  - clear corresponding area in its internal bitmap
  - [not really improtant, but it addresses [*]]: cancel in-flight tasks in discarded area.

Pros: avoid extra filter

-- 
Best regards,
Vladimir

