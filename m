Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88288396F24
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 10:41:16 +0200 (CEST)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzxX-0005K5-Ix
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 04:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzwQ-0004Up-Hp; Tue, 01 Jun 2021 04:40:02 -0400
Received: from mail-eopbgr40139.outbound.protection.outlook.com
 ([40.107.4.139]:63830 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzwN-0004GV-5U; Tue, 01 Jun 2021 04:40:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNA5hUB9LpzEhbVzEi+eLOKf7D6v1AHalnhP9CPAYTaGyo/PiuPaD+i7ymzXjeQz3g1awF2ij31K2KhAl+r4pWtgkjt8DYD5ZLjdAGB1eNYvX0lFgdZy7sBfpstvVm/StbN0LkP3lxgDdCuBDmFdL/t8835Q3pLpiDA5v4BIukbsQML6rSm+bmMDxas4UeEoQoVE7wNMQKOhXHmCYlIjFJOopstrdKZX2nQPTCtxDU81Ug3bA3KGkYyrf0T9WfAq7fnfH6YL+34B+qoG/CZnccDTheN8oteBySB5leM9O3u4JNs82JVvsRlIR02WBX0AjJT8wUe0ezjaqT5FRI1lTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdc9MovT92CM9T+y2pSSJCIPxdLazAfBPgt8gYPZxBQ=;
 b=FpPDZ5pu7XievD1EGF8vP+XFESzigO+rIuRHAQ1GxxGTfkEsDpFoM3CtmQQwwqpEORUUCNvGvi0W4LT3UwPE5irWBu63i2kUkGaDjeYHxQA+gUItdumfol31vlcjPIPoYWFVuHzq2WsGl8VZ5uc9npQB+HiaCQ/3zo/HTqVPwCl0WhKWbQmjbcNGPGhdKDdiwI0hAHC1cP5KHoWN6gsJUryHhYDD1+9Wm61iKcWXIFB1DCbSpoPz4l/v/Vg3jUT/bs7n45Fe5vsjR59yJv7nCg+P4O8aOzWpUCG5GPKHY7HTVXMBFhe506CAjAHSoliMBIL/8L1qk4IPtc3Nr4+TZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdc9MovT92CM9T+y2pSSJCIPxdLazAfBPgt8gYPZxBQ=;
 b=c+mM2MSTQ1fswIQZKrDpIX7GtmmpUNEg11ve4f2H/KRrJJ1b258ZMhIeUbRcumbTHobiqCOBZBHvTlozzUnPQzkLWONo8l/6elfAfnqG6ZmXr6dj3MIeFqme70eTJZ3QYp/cdhgHEC+SgIMyPFgCZ5MdE7q8/ThSPpaR2d5xPDU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3717.eurprd08.prod.outlook.com (2603:10a6:20b:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 08:39:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 08:39:54 +0000
Subject: Re: [PATCH v3 5/5] blkdebug: protect rules and suspended_reqs with a
 lock
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210517145049.55268-1-eesposit@redhat.com>
 <20210517145049.55268-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <43b0217f-4d3a-9380-c91e-ee86fe461c40@virtuozzo.com>
Date: Tue, 1 Jun 2021 11:39:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210517145049.55268-6-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: AM0PR03CA0071.eurprd03.prod.outlook.com (2603:10a6:208::48)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.210) by
 AM0PR03CA0071.eurprd03.prod.outlook.com (2603:10a6:208::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 08:39:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f822b964-2c6e-4727-b891-08d924d8d46a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3717:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3717FC7381FE8D04E9710DB3C13E9@AM6PR08MB3717.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXUK9nOLqauYMGPDZHel2xX2fWpEfvXCETtOANhoQDASVhCyK6jLgb/mGvnYGca42dOjdTDiKfA8k/m+WJ/ToAXi/4I0pZMHIoQTy/SKOUHoa9wIMuN5yDNqA72XXmKQq2S9cekUmoOteb9xboh3Fd06IvE8OraZDN7UZJ9KSdtfm8bAdvqJ0mwSGQJosjTODlHRT2Kd+B0vPlQjQDlh9FZdkd7M2RQvi+rNkpBfs2qJ+GEUFARz/Lkgw+7fxSqh/M93u1vSsiKvhqxHHpi09PnXDa2NUU0UNN3+wAVhl39fDSjPkJLM+knx2QeNHEyXD2mByitvH4WX7JrXHo4RtWQFbxnhlJ8vA83hD+PIH45QuSlbqF0We5K8nyQnRjTxd18GVJzgGA9Pr7a6reR/GO7LEc2sxDcj1B8XVNmnHoXiVvpSjb8pNTLMDvFl4ayJKQ3utETBDB1RtnJnA3243x556OSBYIAn+NngGU1aCYztzR3MAitCFVPbGt2BP5rpPkNmQq6y1CCX01sGWq63wIwAVJeVgZYHX/yzjd98qhmMC4iKehNA4iAoxPdToSYcSt5fuYcyFmoMH2DLDOE3/DTFjFyD3NiDvwEJirQISuqp1hKnv72PtcGg8Gr5t3naAz0Q9OuaXQHlSOf6ze0VSgktDAi7OtfUFjViwkmgQcVia9dJLVqQcKwGPoHewsB9DZZSIgy/JS+XplfznPb4FQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(39840400004)(346002)(8936002)(66476007)(66946007)(86362001)(36756003)(2906002)(956004)(2616005)(5660300002)(52116002)(31696002)(66556008)(26005)(8676002)(83380400001)(16576012)(31686004)(186003)(16526019)(15650500001)(4326008)(316002)(478600001)(6486002)(38100700002)(38350700002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0VZemZzTkN1YWtXWmJaMVJhY3ZjVEN2YWdrTmtpdnVvNktvL1ZHMEU1azFL?=
 =?utf-8?B?K3dlY1pVWG9rVjJDTEI3NGJzQWl1ZHpudjl2bkxPSktLTDdXRXI5UjUrMWVW?=
 =?utf-8?B?cjJ3RWdiUG12WGZyb1RvVXFQY0Zkelg1OWVKdjAzWVBpYTErRzBWTUNPQkww?=
 =?utf-8?B?M3hZa3BDNk9jSmtDUnNKcmY1aEdTNkJTemQvOEdMK0I0YlhvQThEUWg4QzI1?=
 =?utf-8?B?WHJzbzlYWmU2UTRYVlhLUE9kUmtNbmIvZEhybU5KNHowKzhjTVNJZ3ZtbTFN?=
 =?utf-8?B?K0lMMTNyVndZMEt6QlhBMGQvOWZ2NWhLWS9GMG1UQXpPZi9Na0R5MG9tZ3ZN?=
 =?utf-8?B?UnVWK3kzZGg2L1EweGMzVk1YUzVsWDY5K0pEa3NheHQrNldCSTFyVzdBL05H?=
 =?utf-8?B?aXVwSFEwZDhpcVEwbEM2V1AwekpCOFdabCsxQXFkcnkydlJYdUZqRjVTenQv?=
 =?utf-8?B?QUxieGhmRTVQQ1lPRloxL0F0U0dEcnZ1ZnVHZlpqVUR5bGNYRjlzQTVLak5C?=
 =?utf-8?B?WmY5ZHgrVlF1d1Zjb2d5QnhPZ2F4b3kyUlV2ZG8wOC9qS0lpOGViVnNXYVBj?=
 =?utf-8?B?ZE1LbEhRbEhpWmh5ODBRc1lLSElhWFgrTFpRL2xuamlJQzltbHJ6RCtaV1RU?=
 =?utf-8?B?NkxSKzMyb1F6YnFtTzJ2QlU3OHc1YnlpaC83VnF5b1FwYS9USE93UXU5d2hS?=
 =?utf-8?B?L0dlb0t3SkhDMzNkNFRWQjNFVWgraFpTcVhwQnhmU01LbUltdnNHNkdKQ0tk?=
 =?utf-8?B?bzBRZjlsK3pIM3hDRVh0RGFzWXY0ZEtNdjVLRDdzcVVEWTB6VWMzTTNnUTc3?=
 =?utf-8?B?V295dmtRWVNPMHlqVCthVUxvNm9mL2FDR2VhNzY4VHRXR0dacWU4UmFrd1dX?=
 =?utf-8?B?QW4rTkdxZjVxdlVEK0VUSm1sNnJ1dUxFYVhtcllGYm04MFRFVTVHV3Z6RG1h?=
 =?utf-8?B?QmloVDYwTStHLzFWNHJnRWp1OFNLL1hQZ2xGZXdGd1FmbFFJaExSOFoyN2xZ?=
 =?utf-8?B?OTdMckZMWldhcVNRZUYvVFFyWWFtUy9oVTA2ZUlnc3JoVkxZK01wVmt4MWhG?=
 =?utf-8?B?SmFEZUFXSDAxV2FwUGEwVE9FNnNYOXp5ZUV1QnN0QVRTUEpVQkQrZFpkRmRV?=
 =?utf-8?B?Zk56NFBrem95d25JN2hta2NDcUlWQnY0Z0RUekRNQk1jdk5BaUc0TmtVTmY1?=
 =?utf-8?B?SFhKUEhhcGNZQXY1UUU5WWFGcUVaMmxrcEp4d3lmNmJiQXArQ3owelhPc1BW?=
 =?utf-8?B?N2QxQWdMbGU0bUJVa25MZU9qb3A0YkVDVEs4YmV3ZVpxcjdoOTdhdkZiWDNY?=
 =?utf-8?B?UnhzWDQxd0RwRHNBTW42MU44OUV3bkZhU2swZ29rOXFhK2FaZ21zR3NpUHNJ?=
 =?utf-8?B?S0F6M29rN3NjUGFrbys4bHdGNkJPSFBDWk1xZG54MGtxdUZLcDA2dkIwaWxS?=
 =?utf-8?B?dTQ5bFFxYVBXTWh5NkFDSmg2UnFscmhLdVQwWVlJRWlBaDZEWGFYZ1NrMDRC?=
 =?utf-8?B?SFZTUWtOS210cDArbFlDRUpPdVpDNFk0dDZ0bVNJalhDb3Ura283NDVUbE1C?=
 =?utf-8?B?aFRwMkx1NFR1QTByQjIvVEFmb0IvRzl3YzVZbWtWNW82VldDKzFWWWpnOFJ2?=
 =?utf-8?B?aTJIbklBVncvVTdOaDVlL0pVNXhoV1BudkNxbzVXbm5UcFMySzcxb3lHV0o2?=
 =?utf-8?B?MUhRVUxSRFBSQmRRMWZPVTFqMklVUUpiaHF3NmNFWWhzc0hnazF0aktqTHpR?=
 =?utf-8?Q?1SFyLTSKYKw5vpZfHXfEdoWlh40LWUR09qGtblB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f822b964-2c6e-4727-b891-08d924d8d46a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 08:39:54.6528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCaeDV9I/wzggQnwNttFxpGbTw97savWKVnRS7hBgTT3TRsRm73HCNlz28B6drC4KyfAg9IJ0aSvp7Wd3j7/okH6dElahLbIky3OblJQj3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3717
Received-SPF: pass client-ip=40.107.4.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7,
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

17.05.2021 17:50, Emanuele Giuseppe Esposito wrote:
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/blkdebug.c | 53 ++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index dffd869b32..cf8b088ce7 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -54,6 +54,7 @@ typedef struct BDRVBlkdebugState {
>       /* For blkdebug_refresh_filename() */
>       char *config_file;
>   
> +    QemuMutex lock;

we'll need a comments, which fields are protected by the lock, like in other your series.

and also a comment which functions are thread-safe after the patch.

remove_rule() lacks comment, like "Called with lock held or from .bdrv_close"

>       QLIST_HEAD(, BlkdebugRule) rules[BLKDBG__MAX];
>       QSIMPLEQ_HEAD(, BlkdebugRule) active_rules;
>       QLIST_HEAD(, BlkdebugSuspendedReq) suspended_reqs;
> @@ -245,7 +246,9 @@ static int add_rule(void *opaque, QemuOpts *opts, Error **errp)
>       };
>   
>       /* Add the rule */
> +    qemu_mutex_lock(&s->lock);
>       QLIST_INSERT_HEAD(&s->rules[event], rule, next);
> +    qemu_mutex_unlock(&s->lock);
>   
>       return 0;
>   }
> @@ -468,6 +471,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
>       int ret;
>       uint64_t align;
>   
> +    qemu_mutex_init(&s->lock);
>       opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
>       if (!qemu_opts_absorb_qdict(opts, options, errp)) {
>           ret = -EINVAL;
> @@ -568,6 +572,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
>       ret = 0;
>   out:
>       if (ret < 0) {
> +        qemu_mutex_destroy(&s->lock);
>           g_free(s->config_file);
>       }
>       qemu_opts_del(opts);
> @@ -582,6 +587,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>       int error;
>       bool immediately;
>   
> +    qemu_mutex_lock(&s->lock);
>       QSIMPLEQ_FOREACH(rule, &s->active_rules, active_next) {
>           uint64_t inject_offset = rule->options.inject.offset;
>   
> @@ -595,6 +601,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>       }
>   
>       if (!rule || !rule->options.inject.error) {
> +        qemu_mutex_unlock(&s->lock);
>           return 0;
>       }
>   
> @@ -606,6 +613,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>           remove_rule(rule);
>       }
>   
> +    qemu_mutex_unlock(&s->lock);
>       if (!immediately) {
>           aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
>           qemu_coroutine_yield();
> @@ -771,8 +779,10 @@ static void blkdebug_close(BlockDriverState *bs)
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
> @@ -791,6 +801,7 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>       }
>   }
>   
> +/* Called with lock held.  */
>   static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
>                            int *action_count)
>   {
> @@ -829,9 +840,11 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>   
>       assert((int)event >= 0 && event < BLKDBG__MAX);
>   
> -    s->new_state = s->state;
> -    QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
> -        process_rule(bs, rule, actions_count);
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        s->new_state = s->state;
> +        QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
> +            process_rule(bs, rule, actions_count);
> +        }
>       }
>   
>       while (actions_count[ACTION_SUSPEND] > 0) {
> @@ -839,7 +852,9 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>           actions_count[ACTION_SUSPEND]--;
>       }
>   
> +    qemu_mutex_lock(&s->lock);
>       s->state = s->new_state;
> +    qemu_mutex_unlock(&s->lock);
>   }

Preexising: honestly, I don't understand the logic around state and new_state.. (and therefore, I'm not sure, is it in good relation with patch 04)

It come in the commit

commit 8f96b5be92fbd74798b97b1dc1ff5fbbe249ed11
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Fri Sep 28 17:23:00 2012 +0200

     blkdebug: process all set_state rules in the old state
     
     Currently it is impossible to write a blkdebug script that ping-pongs
     between two states, because the second set-state rule will use the
     state that is set in the first.  If you have
     
         [set-state]
         event = "..."
         state = "1"
         new_state = "2"
     
         [set-state]
         event = "..."
         state = "2"
         new_state = "1"
     
     for example the state will remain locked at 1.  This can be fixed
     by first processing all rules, and then setting the state.

But I don't understand, whey it should remain locked..

And this logic is not safe: another event may happen during the yield, and will operate on the same s->state and s->new_state, leading the the mess.

>   
>   static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
> @@ -862,11 +877,14 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
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
> +/* Called with lock held.  */

I think, it would be a very good practice to include into convention:

May temporarily release lock.

>   static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, bool all)
>   {
>       BlkdebugSuspendedReq *r;
> @@ -884,7 +902,9 @@ retry:
>               g_free(r->tag);
>               g_free(r);
>   
> +            qemu_mutex_unlock(&s->lock);
>               qemu_coroutine_enter(co);
> +            qemu_mutex_lock(&s->lock);
>   
>               if (all) {
>                   goto retry;
> @@ -898,8 +918,12 @@ retry:
>   static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
>   {
>       BDRVBlkdebugState *s = bs->opaque;
> +    int rc;

Hmm, you can simply use QEMU_LOCK_GUARD

>   
> -    return resume_req_by_tag(s, tag, false);
> +    qemu_mutex_lock(&s->lock);
> +    rc = resume_req_by_tag(s, tag, false);
> +    qemu_mutex_unlock(&s->lock);
> +    return rc;
>   }
>   
>   static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
> @@ -909,17 +933,19 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
>       BlkdebugRule *rule, *next;
>       int i, ret = -ENOENT;
>   
> -    for (i = 0; i < BLKDBG__MAX; i++) {
> -        QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
> -            if (rule->action == ACTION_SUSPEND &&
> -                !strcmp(rule->options.suspend.tag, tag)) {
> -                remove_rule(rule);
> -                ret = 0;
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {

And here, instead of increasing nesting, let's use QEMU_LOCK_GUARD()

> +        for (i = 0; i < BLKDBG__MAX; i++) {
> +            QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
> +                if (rule->action == ACTION_SUSPEND &&
> +                    !strcmp(rule->options.suspend.tag, tag)) {
> +                    remove_rule(rule);
> +                    ret = 0;
> +                }
>               }
>           }
> -    }
> -    if (resume_req_by_tag(s, tag, true) == 0) {
> -        ret = 0;
> +        if (resume_req_by_tag(s, tag, true) == 0) {
> +            ret = 0;
> +        }
>       }
>       return ret;
>   }
> @@ -929,6 +955,7 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
>       BDRVBlkdebugState *s = bs->opaque;
>       BlkdebugSuspendedReq *r;
>   
> +    QEMU_LOCK_GUARD(&s->lock);
>       QLIST_FOREACH(r, &s->suspended_reqs, next) {
>           if (!strcmp(r->tag, tag)) {
>               return true;
> 


-- 
Best regards,
Vladimir

