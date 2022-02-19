Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460704BC85D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 13:07:52 +0100 (CET)
Received: from localhost ([::1]:53962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLOWg-0003ta-RP
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 07:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1nLOQ2-0001qy-Df
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 07:00:54 -0500
Received: from [2a01:111:f400:fe02::717] (port=25157
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1nLOP5-0007Qz-Bc
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 07:00:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToU5DSt500fw7lVOT55xvefjdLivrKhmomVBrlF8hXwfiC4DWnEKo/C/ZE2GnCkAibD2kvxRzg5SV0dqaFcK8WnhzIOFiUytdT6A3hO7yGEv84FMrYVAGIZeHt6+V+JvoCev318vbKBS/cCRryu1b5tAi2RQwdUfAkGQ0yDaRpvvlvgVh4nOTvRxq/9tsiz9kvxlBnkGZaTy80ZKDKdHaqbBCj29N+XwziYcYSUu0wIISmijok+Lw0uhz8nHcTu/rOXsDsP2tkQ9+mJkdsysUC6gCLewGL9YLzcNii1caGNLTdS4Ao91s8mK3BJjlRKDcE52qLQAGV7gdjaP4HW7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66JgC7Ovh+MawPaKx/t5HaQGqQZOGpBO7IL/fMZB/ro=;
 b=FmcDFJlPTclfICFrWjZZjrQNyaJ8bZYpdjX+PKJ/+l8XY+oUTkCn4fLbV/1JRDjMydLcgVXFGlXWET0r/qMGsRmeddRGpLyalf8nEh5tTVyKioq7RyrTqa8MsytyODN/C91849uu3J6Oo8RQyqSlDAuhKHa9P/lCUdYZ0/O5jMjhpnlwT/xwa4KyGg7pYgG4Q+30BBgW89ldX00+GrRbUZZy5FA8D1DZQJGR9GEtGT7AQUlELYpev9/k87sD/OLyPrJFslNbugnIkK1anjy+hERt9lb6xKCdmVRsN+NpHQLlMDPggZ//R6qaUQvN3vJJlKb4EDMwA1UNxBNAAZ6P4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66JgC7Ovh+MawPaKx/t5HaQGqQZOGpBO7IL/fMZB/ro=;
 b=rSJs5MfazBntdHqOI5DRJwadyzTaKflrESiZSvHT4GmhKa12RXsqjDrslSmXiMJNzmrcKtjNXOl4KdGw7gSy/qpO03+AfbctPZPtQYgpalq4pwn5kaWhpWdm6Q1OW8jpQmD+RhzXmT7RtKVYBMonPFXC4QwlqiNOglU+T1xzrvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by AS8PR08MB7174.eurprd08.prod.outlook.com (2603:10a6:20b:405::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Sat, 19 Feb
 2022 10:27:12 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::7484:a32f:3a89:cd47]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::7484:a32f:3a89:cd47%4]) with mapi id 15.20.4995.024; Sat, 19 Feb 2022
 10:27:12 +0000
Content-Type: multipart/alternative;
 boundary="------------RjpyweZAzWDSBkE00gWM63vO"
Message-ID: <c6b7e46a-87d7-526c-8b3e-c258399f8d8e@virtuozzo.com>
Date: Sat, 19 Feb 2022 13:26:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/4] block: block_dirty_bitmap_merge(): fix error path
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
 <20220215175310.68058-3-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20220215175310.68058-3-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AM6P195CA0096.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::37) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cbdf7aa-2978-4fb1-6a44-08d9f3926457
X-MS-TrafficTypeDiagnostic: AS8PR08MB7174:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB7174481F7D5D28D38D54780A86389@AS8PR08MB7174.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfLwpgaKQn4sCGY5DBmYpMWMC4XNh2Y7brc8QKL0VcmxeuX++hzIA2F1wH4xjwLfLHBmaneYJi8yw6gy68rKb8TjPVsucHjDKSd7gBb0cacEdZLbQ1pupq+b4xCJVOekD6K0ieXc9ccTMv49Zd5E9rtEjfSCN0Vnb89daqOYNfyY6h/ON2PdGQwKCFCXESZ05cnkhZ8SxIjO4bUqI0mrYyvpmSZnzqkGH/ArQBoqJjgI7h8XK4jHESF1lfW0EcGlQ23fC5gtcV4quy6JMUcP6peLojjp1ZekszsF47bowMnAjPrZ2q7Xmgdi8pwMEJ1jvNQYh4OvPdr3fCdh0jlpqyzGBt8dGx/kiLM8OwGodNj2yjmRygDxlt5wszdBTRjTsrcgFbT7+Ti2+Ccny5AsPLC1ZAjTwk9BAI1hMOzqQdm53SGsTlJ0Hn5EzZ3zW79FW5rUzEtRLIefTCUcMLSszo73yi9WPgqvt5lZCtPTFvevtNQAGoTpxWcsKByNfNtqvSo6WlqNn7sQc5YwH41nMbZ41f0XA+yWmAoGEUulpc1MPfV/bqqpU+G6GbkKrMHQpMAfGdYNpeq89W1fyTwmUKkz0U3VXMgAf6nwTI51gA4ylwZREuUaATJWY66vFRhxuO/2hzRtRGkyEyF9bVlkHbSwOE4GaRGigJV/nAX/cBG2TpJODaV21b00Ycdc58+aEwv5zTRAkEQnJ4fgIErFj9G/lJje/V79dxIEDLApodYfBm8rKYqqc2zBkYteKxXeW0xI6Zi6AEC/cge5CshCPb7M1FhaxlmaLHir92mcZsI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(38100700002)(52116002)(316002)(66946007)(36756003)(66476007)(86362001)(66556008)(2906002)(31696002)(8676002)(4326008)(2616005)(8936002)(6512007)(83380400001)(53546011)(26005)(5660300002)(186003)(6486002)(6666004)(33964004)(31686004)(6506007)(508600001)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVdETFgwZWxIVXAza3FOcy94UndSSXN0SDFjVy9vK2NJd20vZGgyWC9Xdy9I?=
 =?utf-8?B?N2o0TmZEUGFkWlZPT1A0ZDM4Nm1TVTZEekxGWVJ6YmNOOFk4SEdoL1RDbWpp?=
 =?utf-8?B?S29HczJpTXBLdTlVNHJRNjZaSjRuYnBlNkFjaXRRR0Y3UkdHY0JYU3JrNS9R?=
 =?utf-8?B?YnBkdGxCcTlJelRrYWdjWWhNTmEwQzZsQ2NYb1pVejNveUtjTnpKQmxGQmpn?=
 =?utf-8?B?ZStxMVExMXkzV253K2ZQcDVxdXdEbjg5Vzlxb09sTXNIMUVUSFh2d1g0U21V?=
 =?utf-8?B?eWxqQjBLb2ZCcTVaMlh5a1hXcUpPSk9CZkVpKysxbkRxQ05oYW9ERFVmckll?=
 =?utf-8?B?MEdVbi9oSHhxTXJIbEY2MlZNeEhkbEVpVTN3aXFyUWxiVEtJcHBxdVJmUU1k?=
 =?utf-8?B?RU5JRWlqWEJyQXMzSksvZUhxZjRnNzlacU82L1VXaC9tSDNjaTRrOVhka3Zv?=
 =?utf-8?B?L1VtK3JzNVZkNDFLMnNKbGFJZFlOU1VTSFAwRElSckpvTGs5WjVNQjVGSWVI?=
 =?utf-8?B?WjNEa1EvNEhVMnFYd1pXYWJpd2RrSHB1dmQ2elU0Qlp2NlBsdzAvVzRlU1Ry?=
 =?utf-8?B?UjhFYVduTmxNQTVSV2h3c2pGSmw3YWF6dXVRR0xPQjJHS2RJUzdTS09GR1BZ?=
 =?utf-8?B?Lyt5em02eUd4MFNxVVdKenplRFBkajBtOE1Ea3prV1NMQ201b25DMG54dFUy?=
 =?utf-8?B?bDVTNGRqalk3TkVUOTRlemdXUnZtMXdYakdBUGN3ME84KzZoR0x1bTJSVUwx?=
 =?utf-8?B?aklLKzdIMCt1SHA3Unc4ZXN2NXNNbGcyMC83MDlzNmtxUlYrVnh2b3JhSHdu?=
 =?utf-8?B?M1dyVHFBTmMyQ2dYNXladytOYzNPZHNCWGRkT0t1ZStnb2JBTm03K3Evdkx0?=
 =?utf-8?B?aDRlSFVyckhyQjh2Z3lEc210QzRTSFZtczRQemNCRW4zUXRkazFtS1pjdnZL?=
 =?utf-8?B?RVFiTUx2SzhmRUMxbldSUnJaWDZFMDRRamdsZlVsMFhwcDZGc2dHSStkd3hS?=
 =?utf-8?B?TXhPL1FoRWV5ajNrZzlCdmlVcUhnZlg3K3REMlhYR3VBVjJUYkp6RnFRK1Zm?=
 =?utf-8?B?SDdNa29PYkxsUkozS05TZzVYaUFZdksxdDFHSTgwbDdCWGZTMzluVmxPaGQy?=
 =?utf-8?B?amRrVmd0djBDZGRiYU12RzY5M0E3dXFNSEZFU0J5UitYOGozbDdmVjdwYXdJ?=
 =?utf-8?B?S1JrdkllM2hTUVBoU2xGM2RBd1dlVGRPQVpMTnhsdmc5R0tLd0dldWIvWFpi?=
 =?utf-8?B?dHRDMG1HdGJTdVk4WWFDK2tqcFRONFVuQm5zbDV5Ky8vU25OUUVNRHpVZldt?=
 =?utf-8?B?SVFEWXZ1d2FyMFhjemZxb3gzSk02OWV6dkdldzNmNUJLS0lYeHdoRWVvRXEz?=
 =?utf-8?B?RXgrV1ArTzJwb0VCcjBWUkYrWTNlbjdXOW5INEJMRm1TR214M2xlNWhaNDBK?=
 =?utf-8?B?QWZsNHpBQllMUTVKQXROdFlkNERaTkcxN1MrTTVLUmhsNEtEK1lGTEQ2K0dH?=
 =?utf-8?B?YkI0SmJ1K2hLQTJCdlk3TTZGQVNSQm9VRlBTVVhDQlAyc0xDZmZIZVFkZkw5?=
 =?utf-8?B?emJBbjJLSWtUeU00ZVEvb2RWdHFtektDYlZlbXN0OVV1ZXVaMFlmZHRPZWdw?=
 =?utf-8?B?SExObXBhS3FlWjFpaW9LNGpNcnN2NllqOVBGZ3ArcitGSVZRdDhDd0gzTlZ5?=
 =?utf-8?B?K1owemdHTmFCd0lqRVZvcFNkTEhCVFlOazhPRmJ3RDg3NG9vT3h3WCthK2Vn?=
 =?utf-8?B?bDhacW9HSXFtdHVTcjFpeWJKUlhKcWZSZVlvNGZUN0puRVk2VDVRQ1QyUjBv?=
 =?utf-8?B?TTdNUVEyK3JTSktleFZ2RWVxeGJvbTB6WEFFWnRhbmE2TS85NmZqY2dDMzIx?=
 =?utf-8?B?cE15Um9maHlYMDZ2UW0yK3p6YVBzNmRkTG5VMmhvS3ovT2JjL0wzdGhpb2J4?=
 =?utf-8?B?MDljYU9lZGc0S1ZoTUlLZkF1T3dOemt6aSs4eWJtd1JVTXlaOU41YTBCcFNO?=
 =?utf-8?B?U1hhaVRDSUxnOWszR2IxeFFLcU0vM3BxRDhMMUlTSXlyZzJHT0R4TTRTZlZG?=
 =?utf-8?B?WFIrT3hJUjNIamF4V3QzQTdrbEI5dDBITStHVm5YeVhHeHVud1BJZVJUQS93?=
 =?utf-8?B?S3VrQzRtR0J2KzhpNjBycnhXbnJablNXNUtUK0VjWjZodVh3TEFwMDZhTVQy?=
 =?utf-8?B?SXgwQU85eGVWTlppeXNPenZNZmFNUGlBR3dwY25May9CRWJEUGplN1VZRUMx?=
 =?utf-8?B?Mmk0d2hUYTFWbGtCNW5RL0x0TE93PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbdf7aa-2978-4fb1-6a44-08d9f3926457
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2022 10:27:12.6517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJoSSWEJbht0JvRoBmvZqpakVgPvqWJm3QfxWG9onLipqXxBg8WPICVkTapl42d7agDHRjnV3iKcNb/78lJJ6/LHIfeI0SpWEY915uTW8pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7174
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::717
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::717;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--------------RjpyweZAzWDSBkE00gWM63vO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/15/22 20:53, Vladimir Sementsov-Ogievskiy wrote:

Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

> At the end we ignore failure of bdrv_merge_dirty_bitmap() and report
> success. And still set errp. That's wrong.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   block/monitor/bitmap-qmp-cmds.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
> index 83970b22fa..a94aaa9fb3 100644
> --- a/block/monitor/bitmap-qmp-cmds.c
> +++ b/block/monitor/bitmap-qmp-cmds.c
> @@ -303,7 +303,10 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>       }
>   
>       /* Merge into dst; dst is unchanged on failure. */
> -    bdrv_merge_dirty_bitmap(dst, anon, backup, errp);
> +    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
> +        dst = NULL;
> +        goto out;
> +    }
>   
>    out:
>       bdrv_release_dirty_bitmap(anon);
--------------RjpyweZAzWDSBkE00gWM63vO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">
      <pre>On 2/15/22 20:53, Vladimir Sementsov-Ogievskiy wrote:

Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
    </div>
    <blockquote type="cite" cite="mid:20220215175310.68058-3-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">At the end we ignore failure of bdrv_merge_dirty_bitmap() and report
success. And still set errp. That's wrong.

Signed-off-by: Vladimir Sementsov-Ogievskiy <a class="moz-txt-link-rfc2396E" href="mailto:vsementsov@virtuozzo.com">&lt;vsementsov@virtuozzo.com&gt;</a>
---
 block/monitor/bitmap-qmp-cmds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 83970b22fa..a94aaa9fb3 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -303,7 +303,10 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     }
 
     /* Merge into dst; dst is unchanged on failure. */
-    bdrv_merge_dirty_bitmap(dst, anon, backup, errp);
+    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
+        dst = NULL;
+        goto out;
+    }
 
  out:
     bdrv_release_dirty_bitmap(anon);
</pre>
    </blockquote>
  </body>
</html>
--------------RjpyweZAzWDSBkE00gWM63vO--

