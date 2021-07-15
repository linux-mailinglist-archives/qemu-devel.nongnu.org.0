Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7545D3C9C4E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 12:01:24 +0200 (CEST)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3yBH-0007lL-HL
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 06:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m3y9W-0006HG-Nl
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:59:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m3y9O-0000QE-DY
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626343165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXtk0t1UHsyAYS1imRKduBAWgn7ZYN4++vbg4q3niKY=;
 b=WIGBMW+3HcrAZKqjgkHyjuBY+wft/t+sOZtAfefr35s3qpTAIRxMYCiXXbR/QJWH4ueQy+
 2UzeWr19sFC2pqXKGFanSeSwCxgRnytySWGUuGPEgV/XvDR3glJ15VlMdjuqQlowFo/C1I
 XTwJBnr1kLmlPpaAzXGVj5bBwvJW7OI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-4V_R0M3JP52O0GhrzwWVvQ-1; Thu, 15 Jul 2021 05:59:24 -0400
X-MC-Unique: 4V_R0M3JP52O0GhrzwWVvQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f16-20020a1c6a100000b0290210c73f067aso871039wmc.6
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 02:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VXtk0t1UHsyAYS1imRKduBAWgn7ZYN4++vbg4q3niKY=;
 b=eAjQWeMwSuoY5qHdcp4wnZCxWLzRE9dHYhGWkTW7yW2Z0iUKHue6/EyjuFVpulx1Sk
 HisFqesizSLFOp2aZqHpwfFdpMQgRSdVfHib8/UabI81PrffMzQKdOhcDA+8t2AvVv+7
 Wj0IVzSlhmwY2LYUdSwosQ2/5XOX/NKlumGU3jqm4k8dEUuqQU1rHrnoIdvXpIfxbA/L
 jd3nT5JYkUGxNHBD+jxl/ekWHBseZdoQQRMAPEuvkuo7CpC7b5ux/at1jJcnc+Yjpwc5
 wsrPsG6ciQQSnmAJRImT7tQjd39BdHFVQ8YZAYzJ+VAD41T9d+o4w1nHCWCnjMYgbTJm
 cAgg==
X-Gm-Message-State: AOAM530AhAtmCRQUCvUBeUInXITt29RUHK0R6VZON4fyrT/lvgvy/vg+
 ZNjwiKpL1mLcvjbM8KgUpQUMA1Guq+VuRbj+QMb9g3fxkO3Fc8lIWp54Mb8QTan39M4NRxYHS7A
 WwNn6N8Dkuj6r4WJfEC+QVywPKf/+ISB1UpKrlecyh8DTw2F4eU8/uPeFgn4UPu4g
X-Received: by 2002:a1c:f613:: with SMTP id w19mr3535346wmc.141.1626343163057; 
 Thu, 15 Jul 2021 02:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqKN2zhYUhzc5rKTetnQjLwZllI2Y3Qb5jgOhpe6oDE6DRI/Y+SUd4MqnYuSFMaYkT/4XZmw==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr3535324wmc.141.1626343162827; 
 Thu, 15 Jul 2021 02:59:22 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 o3sm5961626wrm.5.2021.07.15.02.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:59:22 -0700 (PDT)
From: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v5 3/6] blkdebug: track all actions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210614082931.24925-1-eesposit@redhat.com>
 <20210614082931.24925-4-eesposit@redhat.com>
Message-ID: <31cffc12-b8a3-1e51-a583-f4bce8c41501@redhat.com>
Date: Thu, 15 Jul 2021 11:59:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614082931.24925-4-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.06.21 10:29, Emanuele Giuseppe Esposito wrote:
> Add a counter for each action that a rule can trigger.
> This is mainly used to keep track of how many coroutine_yield()
> we need to perform after processing all rules in the list.
>
> Co-developed-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   block/blkdebug.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index e8fdf7b056..6bdeb2c7b3 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -74,6 +74,7 @@ enum {
>       ACTION_INJECT_ERROR,
>       ACTION_SET_STATE,
>       ACTION_SUSPEND,
> +    ACTION__MAX,
>   };
>   
>   typedef struct BlkdebugRule {
> @@ -791,22 +792,22 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>       qemu_coroutine_yield();
>   }
>   
> -static bool process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
> -    bool injected)
> +static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
> +                         int *action_count)

I would have liked a comment above this function explaining that 
`action_count` is not merely an int pointer, but actually an 
int[ACTION__MAX] pointer.

But it’s too late to complain about that now. O:)

>   {
>       BDRVBlkdebugState *s = bs->opaque;
>   
>       /* Only process rules for the current state */
>       if (rule->state && rule->state != s->state) {
> -        return injected;
> +        return;
>       }
>   
>       /* Take the action */
> +    action_count[rule->action]++;
>       switch (rule->action) {
>       case ACTION_INJECT_ERROR:
> -        if (!injected) {
> +        if (action_count[ACTION_INJECT_ERROR] == 1) {
>               QSIMPLEQ_INIT(&s->active_rules);

(I don’t quite understand this part – why do we clear the list of active 
rules here?  And why only if a new error is injected?  For example, if I 
have an inject-error rule that should only fire on state 1, and then the 
state changes to state 2, it stays active until a new error is injected, 
which doesn’t make sense to me.  But that has nothing to do with this 
series, of course.  I’m just wondering.)

Max

> -            injected = true;
>           }
>           QSIMPLEQ_INSERT_HEAD(&s->active_rules, rule, active_next);
>           break;
>
>    
>


