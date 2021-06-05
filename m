Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0744A39C96C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 17:16:45 +0200 (CEST)
Received: from localhost ([::1]:45740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpY2W-0007vU-3r
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 11:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpY1G-0006Je-4K; Sat, 05 Jun 2021 11:15:26 -0400
Received: from mail-eopbgr70108.outbound.protection.outlook.com
 ([40.107.7.108]:43129 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpY1C-0007IQ-7V; Sat, 05 Jun 2021 11:15:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBXT/XJX6T68UPVE3bz3ytwpCN3/hf537HM7q9yVBkCgCzGpHiFOXN/N/dF986Eik4YRt53M5WdWqAn+9XZl5Io6ZK01XrwPFMUOHgAb8cASeNSraRbQCHzlxey2WYpYOvPBn5aqiJ3i3CvYaLSr6Ps5hkUI8w1uT+31IFCTIV8Wm1cBZX2RXhUWgrGN7Tig+MidOjvjvQNO2EHEvnP44CYNqvsvnQ1+1Qa2p7YPyO1/0MyXahTh9oIlpp5SFL2ZfXzu0SxrXnlfv+oZ9jo9ayVZmpoG2UyEv8k7wdqqai/uPea5wRWKB3nBmITpirdXgJGaqUmgfPyODBW/CG8kMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64g9MkquXMrENky74/ELYpOfy52yDwelkMCfeUNkiJ4=;
 b=G1Rtt14o9Wq++bItlaMgOjUuVVhNDpjuMLkgQiCyn448fzXd2/Z0MqmSX3FfVIfq3VQU7NHE73U85kQNrM+OyVGxGJpkJ/T3QUA20404KYbeJMEhtnrg6EjL6E+GCnyGZp+Wr5RU6kxKw5ZRlidRc5FeLGUpzT/9RaZoL9ubsY5p7xkJzHywcrW2O7kr/HTvRmVfyLnhA6mllYkf8jRpncabQhoPOVl1SCjqVHYv3xw8cn+16lqUDBIwN72/4bPDHCH0AWLx42g8WR43dmpNgbZwn2JvkJGWF4UEwqI2b2Dkss/WB4NgosWWNEm5fuPO/ZPeg/Tk6CBDzHhnaA9+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64g9MkquXMrENky74/ELYpOfy52yDwelkMCfeUNkiJ4=;
 b=mBT7cqS/3nSG/FnwW+fVRyltMMByhDhG0pHKs0gcIFbCibgiVtVRvxDwo0ZQRQBjs3BbcDrpAEiSGu2Kc3iEnMw/5xIg3ML9dGaNkqC4UHl8K5w9TBldbXDDCLlHChASbAHIWOTMt7I+hLs8Cw81e+CHZr4DsDmGd4vBr4yn9Tc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Sat, 5 Jun
 2021 15:15:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 15:15:17 +0000
Subject: Re: [PATCH v4 6/6] blkdebug: protect rules and suspended_reqs with a
 lock
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
References: <20210604100741.18966-1-eesposit@redhat.com>
 <20210604100741.18966-7-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4d31dae3-cd23-0a37-910d-d44a6ca77456@virtuozzo.com>
Date: Sat, 5 Jun 2021 18:15:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210604100741.18966-7-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: AM8P251CA0028.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 AM8P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Sat, 5 Jun 2021 15:15:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adc47b84-1cee-418f-ef6d-08d92834b9f8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-Microsoft-Antispam-PRVS: <AM6PR08MB31586C08117A4FB203885938C13A9@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpJJYI6VHvQURZop9V4/l0NboFLiIGxTKnwCC9W6Gac2eiID4M6ZY9N0avIs/rxkziBeBLjfjGGF/qW/xztC0J9JrHbT1kH4hxZE8KO+csBd+FjyfCGo/QKiecx4k/H3+Njxmn15woQiL6dL5Kh7GdgVm60oArUpUfhrKqNyq5ZT7ix8IsZ/aTPNPovLQqHMRQ90pel/NzXbMdL32ZpPVFRCpJCObOoiAWTGu8m0kjvr9Ovcd6eXdS+dw86an1PD9nnpdRpwzOIGG/gfI5Pe38tMzGFx8jKutmeAtIiqk8cSHiTrJ+hc4qwLT8+4IjL91uXiyNhsc6xmKvCoHsPaPz6YLqc3mNdlvpaF+6t7FyZg9myVTDVwJPfwGIj1CaN3TNuyIv1/9XVuh968mgr5UqZ6qa7LcHqXwgFKWrvcGEFz4oiF7l3Hu97VqfYYSbTzZCQQd5kFkT555RNdIuzbJ/mqvnSaB0hhCXjLZYc9aE1MXIY7FSH2hRaMpBv2wdnpYSz4E1p6c1rasgdf9+zrDe4qg/kyort2DqMjVZwq5Z9ysb0+E/hDRkMWiyc+eX0CflKazOfaQx4zMpmAdeYy6YlSBNVv+FhYud41hTlD3W4hCi7Nc2QadVjiFKHchuMnk/OVcJQjhC7KquWNfJRJh8op7xXkNdO3276Q25GIH0MuYWE/IRL1/ue338/0hpRAZpPfaeokxEYiiuoE5XjRWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(346002)(366004)(376002)(83380400001)(66946007)(5660300002)(66476007)(66556008)(31696002)(54906003)(38350700002)(38100700002)(6486002)(2616005)(956004)(8676002)(86362001)(16576012)(31686004)(316002)(8936002)(478600001)(15650500001)(36756003)(2906002)(16526019)(4326008)(26005)(52116002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVkrOXdqUUFqemNDSmdaVHJpeklqY3JObUZCa2hUcFl2WmJzZEtZZ2xManpz?=
 =?utf-8?B?YjZNeEFiUzk5RnJPTUZEbEhyM0JLcitjVkpYSmpEVFdYaGxtNFAzRXVneVNP?=
 =?utf-8?B?cFZtVmRuUmJaWUtodmRHVVBHajhEUG51WVJsQ3BZWHZiSUd5djZsOGtWb0xh?=
 =?utf-8?B?YlVxOFFiUWt1ektGRGVkWUJBS2l4Q3VFK1RUaS9CaHRlNE1nUWlWZWxOTkZH?=
 =?utf-8?B?WEFROUovNlltRmtITUVIOUwyTGFaK2FwK2NYVjVEMWdmYVNBa0V6Q01MTTlv?=
 =?utf-8?B?MzhKa0JpN2V6TFNPZDJCL016K0kzNE4xVm93TjlpTzJ5NU40NjV4MzN0RUQ2?=
 =?utf-8?B?SUhWYWxaSnJ0MDFDOFFRME5CSk80c1ZwUDJPOFVxa3lGNEZ6dEJTRWNpSHBx?=
 =?utf-8?B?RlVKT0doZ2FXK3F2clM1SmxZYzdkMmtGa01QR2FTMTdRa3NzU2c3Vk5IRm5S?=
 =?utf-8?B?VjlpVU9VaGdsUmVzWktUNXNodU40UWtkMmxIMGNHTTRHSDFLaFluTTFNcjlN?=
 =?utf-8?B?dFg3TTFSZmRtN3VYUHBNZlBxenhQYmNWY1REODJsUGliUmVZQjdtWmo0YjBW?=
 =?utf-8?B?Y01YMWxzalBtU3puMXlES2V6NUZXbHFZWm1VbEhCdWV0MTVITXpXODIwbS93?=
 =?utf-8?B?NkM2VlVZMm1CdjI5a2VhUDRJQlpQeUFYTlBaMlI2cUVzVEdNRDYzaWxheFBy?=
 =?utf-8?B?WmJYUXRXZ21ZdHlweFkxSkFSRnRyZlZaQmpWZFBZK1BPWUlkM0t4ZWJMckxq?=
 =?utf-8?B?WHdZa0l0QUMvQThYOXcyb2tjQnN1UlRlb1RXQkp5UzlnblRvS1dnV05lRTlv?=
 =?utf-8?B?dEt1NStRV3JwcjhzdXA4ZnN4dnNKcmJNZ0Z2Q2h3R2crb09JZFVMYmIrZ3ZQ?=
 =?utf-8?B?UVVjdm0xYUswTGI4a2Y1bFg2RHNkZjlhR3l1eFBlUGVWMS93SkU1eTNaTEQv?=
 =?utf-8?B?dzFCY21Yd2pTZzdSYVJDeU9WVFRBejBGb00yeEpnM0xGWWE3YnYxK1F1eTBG?=
 =?utf-8?B?bE1CYnIxSG53TWtHTVgrSFMxTmdtd3RqUnp1cmNkL0xEZmFJWlR1MnduU2Z4?=
 =?utf-8?B?SnJBN3oyMkpSL0pRUXdFdFRoK1dtWUt1SnQwWjhDVWc4MEJIeDMxSGhuaWRn?=
 =?utf-8?B?Q1drWTZFZUoyN3VPMjhxWUVGL3g4NFNZSGtNNmpOa1oyS2RhN1dCMlIyRUlZ?=
 =?utf-8?B?VEtVTmVRZk1oM25JdDg0Z3ErWkFZbnpkUlJ3WWFjZkg5SVlwcEVFZmRQelpt?=
 =?utf-8?B?ZXBxdlQzU0EwODl5cDhXL1ZFWGl3VHpiZ2pqOUo0cjZQTVA4YitWTWNMVlRP?=
 =?utf-8?B?NG9GYTN4S0dyaTBxQU5vcjhRdHF5MGYzTGVaMTA1RFhjTHJwSEVnU25YODQw?=
 =?utf-8?B?Y3E5Z2VROVJrZUp2bHNLaWFSbGp5cW9YMXVidXB0a09CeXFhTFR1dEowVGVq?=
 =?utf-8?B?c0hvczZhVnBQTko5ZXdnR250Q2xmV011Wlk4cTNMZTBFSzA3MEt2RStjZ3lQ?=
 =?utf-8?B?b0p0bFd1REMrWDNjdlNBUUZuQkgzQ3R1d09mTzhQRHA3R3JGZW5SM0MyY3JL?=
 =?utf-8?B?MGdMcXBqcGo2OUVqY0RCcVhWd3M1dVlIR1FsTE1yUEVZeWJyeUtreXNOdzg0?=
 =?utf-8?B?Y0wwODFDMG1xZnovMG01eDhocnpWeG0vYXdXT1BibHVCMHE2UGRYbVZTYjJF?=
 =?utf-8?B?UmlKbk80ZzdWUDBUMVgyK1p2bjdVK2F2ZHYzYWJVdXpiQUJZRGVhbzZ2aDR2?=
 =?utf-8?Q?x3fGxl2GCALFNB65ZeBywYbaJaXOT8YENrTjxf4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc47b84-1cee-418f-ef6d-08d92834b9f8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 15:15:17.4718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvqmDvxDYfIuiDms2aewbP5fhshFXVuh6MeIbcIoIFQ1d4fqTLOj7hIrY75ONyK0LnGnnuaSYcggiRMJcsnxowN/TGBQKcHmQoT7cyYF+UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Received-SPF: pass client-ip=40.107.7.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.06.2021 13:07, Emanuele Giuseppe Esposito wrote:
> First, categorize the structure fields to identify what needs
> to be protected and what doesn't.
> 
> We essentially need to protect only .state, and the 3 lists in
> BDRVBlkdebugState.
> 
> Then, add the lock and mark the functions accordingly.
> 
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/blkdebug.c | 46 +++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index d597753139..ac3799f739 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -38,24 +38,27 @@
>   #include "qapi/qobject-input-visitor.h"
>   #include "sysemu/qtest.h"
>   
> +/* All APIs are thread-safe */
> +
>   typedef struct BDRVBlkdebugState {
> -    int state;
> +    /* IN: initialized in blkdebug_open() and never changed */
>       uint64_t align;
>       uint64_t max_transfer;
>       uint64_t opt_write_zero;
>       uint64_t max_write_zero;
>       uint64_t opt_discard;
>       uint64_t max_discard;
> -
> +    char *config_file; /* For blkdebug_refresh_filename() */
> +    /* initialized in blkdebug_parse_perms() */
>       uint64_t take_child_perms;
>       uint64_t unshare_child_perms;
>   
> -    /* For blkdebug_refresh_filename() */
> -    char *config_file;
> -
> +    /* State. Protected by lock */
> +    int state;
>       QLIST_HEAD(, BlkdebugRule) rules[BLKDBG__MAX];
>       QSIMPLEQ_HEAD(, BlkdebugRule) active_rules;
>       QLIST_HEAD(, BlkdebugSuspendedReq) suspended_reqs;
> +    QemuMutex lock;
>   } BDRVBlkdebugState;
>   
>   typedef struct BlkdebugAIOCB {
> @@ -64,6 +67,7 @@ typedef struct BlkdebugAIOCB {
>   } BlkdebugAIOCB;
>   
>   typedef struct BlkdebugSuspendedReq {
> +    /* IN: initialized in suspend_request() */
>       Coroutine *co;
>       char *tag;

@next is part of *suspended_reqs list (in a manner), so it should be protected by lock

>       QLIST_ENTRY(BlkdebugSuspendedReq) next;
> @@ -77,6 +81,7 @@ enum {
>   };
>   
>   typedef struct BlkdebugRule {
> +    /* IN: initialized in add_rule() or blkdebug_debug_breakpoint() */
>       BlkdebugEvent event;
>       int action;
>       int state;

as well as @next and @active_next here.

> @@ -244,11 +249,14 @@ static int add_rule(void *opaque, QemuOpts *opts, Error **errp)


>       };
>   
>       /* Add the rule */
> +    qemu_mutex_lock(&s->lock);
>       QLIST_INSERT_HEAD(&s->rules[event], rule, next);
> +    qemu_mutex_unlock(&s->lock);
>   

actually, add_rule is called only from .open(), so doesn't need a lock.. But it doesn't hurt.

>       return 0;
>   }
>   
> +/* Called with lock held or from .bdrv_close */
>   static void remove_rule(BlkdebugRule *rule)
>   {
>       switch (rule->action) {
> @@ -467,6 +475,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
>       int ret;
>       uint64_t align;
>   
> +    qemu_mutex_init(&s->lock);
>       opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
>       if (!qemu_opts_absorb_qdict(opts, options, errp)) {
>           ret = -EINVAL;
> @@ -567,6 +576,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
>       ret = 0;
>   out:
>       if (ret < 0) {
> +        qemu_mutex_destroy(&s->lock);
>           g_free(s->config_file);
>       }
>       qemu_opts_del(opts);
> @@ -581,6 +591,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>       int error;
>       bool immediately;
>   
> +    qemu_mutex_lock(&s->lock);
>       QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
>           uint64_t inject_offset = rule->options.inject.offset;
>   
> @@ -594,6 +605,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>       }
>   
>       if (!rule || !rule->options.inject.error) {
> +        qemu_mutex_unlock(&s->lock);
>           return 0;
>       }
>   
> @@ -605,6 +617,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>           remove_rule(rule);
>       }
>   
> +    qemu_mutex_unlock(&s->lock);
>       if (!immediately) {
>           aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
>           qemu_coroutine_yield();
> @@ -770,8 +783,10 @@ static void blkdebug_close(BlockDriverState *bs)
>       }
>   
>       g_free(s->config_file);
> +    qemu_mutex_destroy(&s->lock);
>   }
>   
> +/* Called with lock held.  */
>   static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>   {
>       BDRVBlkdebugState *s = bs->opaque;
> @@ -790,6 +805,7 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>       }
>   }
>   
> +/* Called with lock held.  */
>   static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
>                            int *action_count, int *new_state)
>   {
> @@ -830,17 +846,18 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>   
>       assert((int)event >= 0 && event < BLKDBG__MAX);
>   
> -    new_state = s->state;
> -    QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
> -        process_rule(bs, rule, actions_count, &new_state);
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        new_state = s->state;
> +        QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
> +            process_rule(bs, rule, actions_count, &new_state);
> +        }
> +        s->state = new_state;
>       }
>   
>       while (actions_count[ACTION_SUSPEND] > 0) {
>           qemu_coroutine_yield();
>           actions_count[ACTION_SUSPEND]--;
>       }
> -
> -    s->state = new_state;

Not sure, are all existing users prepared to state update moved to be before actual suspend. But that looks better and as we discussed is safer. So, if all iotests pass, it's OK.

>   }
>   
>   static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
> @@ -863,11 +880,14 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
>           .options.suspend.tag = g_strdup(tag),
>       };
>   
> +    qemu_mutex_lock(&s->lock);
>       QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
> +    qemu_mutex_unlock(&s->lock);
>   
>       return 0;
>   }
>   
> +/* Called with lock held. May temporarily release lock. */
>   static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, bool all)
>   {
>       BlkdebugSuspendedReq *r;
> @@ -885,7 +905,9 @@ retry:
>               g_free(r->tag);
>               g_free(r);
>   
> +            qemu_mutex_unlock(&s->lock);
>               qemu_coroutine_enter(co);
> +            qemu_mutex_lock(&s->lock);
>   
>               if (all) {
>                   goto retry;
> @@ -899,7 +921,7 @@ retry:
>   static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
>   {
>       BDRVBlkdebugState *s = bs->opaque;
> -
> +    QEMU_LOCK_GUARD(&s->lock);
>       return resume_req_by_tag(s, tag, false);
>   }
>   
> @@ -910,6 +932,7 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
>       BlkdebugRule *rule, *next;
>       int i, ret = -ENOENT;
>   
> +    QEMU_LOCK_GUARD(&s->lock);
>       for (i = 0; i < BLKDBG__MAX; i++) {
>           QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
>               if (rule->action == ACTION_SUSPEND &&
> @@ -930,6 +953,7 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
>       BDRVBlkdebugState *s = bs->opaque;
>       BlkdebugSuspendedReq *r;
>   
> +    QEMU_LOCK_GUARD(&s->lock);
>       QLIST_FOREACH(r, &s->suspended_reqs, next) {
>           if (!strcmp(r->tag, tag)) {
>               return true;
> 


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


Optional suggestion for additional comments and more use of QEMU_LOCK_GUARD (it looks large because of indentation change):

diff --git a/block/blkdebug.c b/block/blkdebug.c
index ac3799f739..b4f8844e76 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -70,6 +70,8 @@ typedef struct BlkdebugSuspendedReq {
      /* IN: initialized in suspend_request() */
      Coroutine *co;
      char *tag;
+
+    /* List entry protected BDRVBlkdebugState::lock */
      QLIST_ENTRY(BlkdebugSuspendedReq) next;
  } BlkdebugSuspendedReq;
  
@@ -100,6 +102,8 @@ typedef struct BlkdebugRule {
              char *tag;
          } suspend;
      } options;
+
+    /* List entries protected BDRVBlkdebugState::lock */
      QLIST_ENTRY(BlkdebugRule) next;
      QSIMPLEQ_ENTRY(BlkdebugRule) active_next;
  } BlkdebugRule;
@@ -249,9 +253,9 @@ static int add_rule(void *opaque, QemuOpts *opts, Error **errp)
      };
  
      /* Add the rule */
-    qemu_mutex_lock(&s->lock);
-    QLIST_INSERT_HEAD(&s->rules[event], rule, next);
-    qemu_mutex_unlock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        QLIST_INSERT_HEAD(&s->rules[event], rule, next);
+    }
  
      return 0;
  }
@@ -591,33 +595,32 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
      int error;
      bool immediately;
  
-    qemu_mutex_lock(&s->lock);
-    QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
-        uint64_t inject_offset = rule->options.inject.offset;
-
-        if ((inject_offset == -1 ||
-             (bytes && inject_offset >= offset &&
-              inject_offset < offset + bytes)) &&
-            (rule->options.inject.iotype_mask & (1ull << iotype)))
-        {
-            break;
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
+            uint64_t inject_offset = rule->options.inject.offset;
+
+            if ((inject_offset == -1 ||
+                 (bytes && inject_offset >= offset &&
+                  inject_offset < offset + bytes)) &&
+                (rule->options.inject.iotype_mask & (1ull << iotype)))
+            {
+                break;
+            }
          }
-    }
  
-    if (!rule || !rule->options.inject.error) {
-        qemu_mutex_unlock(&s->lock);
-        return 0;
-    }
+        if (!rule || !rule->options.inject.error) {
+            return 0;
+        }
  
-    immediately = rule->options.inject.immediately;
-    error = rule->options.inject.error;
+        immediately = rule->options.inject.immediately;
+        error = rule->options.inject.error;
  
-    if (rule->options.inject.once) {
-        QSIMPLEQ_REMOVE(&s->active_rules, rule, BlkdebugRule, active_next);
-        remove_rule(rule);
+        if (rule->options.inject.once) {
+            QSIMPLEQ_REMOVE(&s->active_rules, rule, BlkdebugRule, active_next);
+            remove_rule(rule);
+        }
      }
  
-    qemu_mutex_unlock(&s->lock);
      if (!immediately) {
          aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
          qemu_coroutine_yield();
@@ -880,9 +883,9 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
          .options.suspend.tag = g_strdup(tag),
      };
  
-    qemu_mutex_lock(&s->lock);
-    QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
-    qemu_mutex_unlock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
+    }
  
      return 0;
  }




-- 
Best regards,
Vladimir

