Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A835D950
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 09:50:37 +0200 (CEST)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWDof-0007lH-63
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 03:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDnG-0007HG-P4
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDnC-0002hw-Ph
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618300140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+L3zl8jLrbNHYFqzdEBTiIYpzO3+CsU4HK/Q7kLvD78=;
 b=Kj0J2zU9YrpT1RPhHl8x37LJzCXd/f6eEIBLkuJfIMZWJpYMxqO+4F9VFw/3VrlDPGOnBN
 QCDadGktqHnhomG2VDef3brofOPD8oWk7zFIGg+oQekNyP6nrlYXK1ajCvtKRvQ6AX4IDz
 ccxz3KO15dtrsIOa4DA2kwRQnUZsfPo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-PexDK2BqOXWIkroeZryUYQ-1; Tue, 13 Apr 2021 03:48:58 -0400
X-MC-Unique: PexDK2BqOXWIkroeZryUYQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 ay2-20020a0564022022b02903824b52f2d8so824667edb.22
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 00:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+L3zl8jLrbNHYFqzdEBTiIYpzO3+CsU4HK/Q7kLvD78=;
 b=QQ2WSV0Xpt0gsWTk+GjnYPKla5cdWDWWwZdj4XiGhW7STnjmdeS/+0eV3QIa8gEhNE
 AfRlrtBEVTxutmijXXYg+EE5nuUwEEtdVm8hllhh0+jUdDa89+v5Ka4XDBLoQdA7ZlU5
 djL2EITuUGZKiM0Zhu/420fWvi6zho51zHwJqzAFZkawGcJxriv9RShQ622IYIwh60Us
 D2uYJY8BDX3rNyM0JdQKcwXQHnRCXEnLInYlBMi/HGuLT/IOXfhMGl/CMzssrSVjPOLF
 kvLysMGfrByUCYTBvIjV7A6h95qlvnd4kA5wBbYV+abrV6G3k7yKOXFWQrLRunHHJZFf
 DQ8Q==
X-Gm-Message-State: AOAM533Dg8BtTctWsGWn3QEMonzcYUbdr0SWfZsinAREGM1/HPD+HnET
 nqrdV5BhxCtyA0Ad6VODl11AKMDHK4wOK6gHCbg7hQiQgNf6RX3d8NxUOJqS5kVEssFQkBdWvTC
 ekhQs8cHB1yZAZNA=
X-Received: by 2002:a05:6402:27d3:: with SMTP id
 c19mr33975381ede.129.1618300137600; 
 Tue, 13 Apr 2021 00:48:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykmtb7y/CgLnAgLjjZeJ0H2NhXNKdS1hYtPZzlN9logOFR6A+XfPe3BTa1nBwUBP84nTyuwA==
X-Received: by 2002:a05:6402:27d3:: with SMTP id
 c19mr33975363ede.129.1618300137434; 
 Tue, 13 Apr 2021 00:48:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l1sm8580839edt.59.2021.04.13.00.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 00:48:56 -0700 (PDT)
Subject: Re: [PATCH 4/5] blkdebug: do not suspend in the middle of
 QLIST_FOREACH_SAFE
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210408155913.53235-1-eesposit@redhat.com>
 <20210408155913.53235-5-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6545bc04-87d9-2ba7-9b57-8a4488493875@redhat.com>
Date: Tue, 13 Apr 2021 09:48:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210408155913.53235-5-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/04/21 17:59, Emanuele Giuseppe Esposito wrote:

Perhaps insert here:

That would be unsafe in case a rule other than the current one is 
removed while the coroutine has yielded.  Keep FOREACH_SAFE because 
suspend_request deletes the current rule.

After this patch, *all* matching rules are deleted before suspending the 
coroutine, rather than just one.  This doesn't affect the existing 
testcases.

> Use actions_count to see how many yeld to issue.
> 
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/blkdebug.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index 388b5ed615..dffd869b32 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -789,7 +789,6 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>       if (!qtest_enabled()) {
>           printf("blkdebug: Suspended request '%s'\n", r->tag);
>       }
> -    qemu_coroutine_yield();
>   }
>   
>   static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
> @@ -834,6 +833,12 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>       QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
>           process_rule(bs, rule, actions_count);
>       }
> +
> +    while (actions_count[ACTION_SUSPEND] > 0) {
> +        qemu_coroutine_yield();
> +        actions_count[ACTION_SUSPEND]--;
> +    }
> +
>       s->state = s->new_state;
>   }
>   
> 


