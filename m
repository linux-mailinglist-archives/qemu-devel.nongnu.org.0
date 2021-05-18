Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8CD38756F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:45:45 +0200 (CEST)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwIK-00033P-Fz
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw5x-00012b-8A
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw5j-0002Ld-4G
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sFnVgdfg6fg6j1G5EfKILzynZzkVYUtjbjUu4t0lDYU=;
 b=eXat+vYhqeOicsqva7Zu1BSHdw9qqUA/DIWEmEo25wgzKwSNHkP1USAnRiKQNkZ/ZGIOrB
 y7Fl/gt0fQaAY9AqjbTNNzobiDFNSin1lDZ0J2YAOhfjXj8MZHqNX6RFeGDbPEpWkaWYfe
 eb9rVIHNEJYeyLnWplt5E2kAQJV05fw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-Wk13QpYTM_yvkX2tRz1B8g-1; Tue, 18 May 2021 05:32:38 -0400
X-MC-Unique: Wk13QpYTM_yvkX2tRz1B8g-1
Received: by mail-wr1-f70.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so5323617wre.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sFnVgdfg6fg6j1G5EfKILzynZzkVYUtjbjUu4t0lDYU=;
 b=i2P3l6LJnD+bxpPKEC6JkoCHZ/fc113pcQpkYUT/xzkatf0+kNm1fE4CH+OXe6YApb
 8ogKoVj1iyxX+TaenYBpVvUIueR0NUKk4klvr/RHj7VasNvopc5VYIyv1klluIWuNn2S
 qBVKwWg7jiU5UrIABtjDpsM4usfKYNMQsbV8RCDMgLK9SXkTl78PTKreHgc6uDzsA51D
 VxNn2cOZPgJPNKDLShXaU9Q30Y9IdR5ISXzliDcOP/uysfVkxzk5Y13UmoxZRm1VEhZB
 FCytftLBekhu7UWKrxYe372r1QnXyskcLYjRW3Ib/04G6GKvjX2ywyyRpXaq6RUrV9Ur
 6YAw==
X-Gm-Message-State: AOAM532ghgDJI03wvKmq1+CfACGVdtYqGhE4vgBviHsWA24iFBVNbAjF
 DN9o9Hg/x4IEIU8clh430OAwRrvav0b6AQ94cXnxWX6UcejknfDADUuSYwOdVjQ4G/CgPkqw75s
 YalWl1j9TyLpRMWE=
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr4505202wmq.150.1621330357611; 
 Tue, 18 May 2021 02:32:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG10T8sO4hMw78FY5ANKjN0HjhAkzWfO7BtGe503/f0zhqshCIk5sOgRvUB5bDAiDY3R84LQ==
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr4505186wmq.150.1621330357417; 
 Tue, 18 May 2021 02:32:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g5sm7294421wmi.8.2021.05.18.02.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:32:36 -0700 (PDT)
Subject: Re: [PATCH v2 23/50] target/i386: Reduce DisasContext.vex_[lv] to
 uint8_t
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-24-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4a3155da-ff47-3325-f862-11785e93fa71@redhat.com>
Date: Tue, 18 May 2021 11:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-24-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Currently, vex_l is either {0,1}; if in the future we implement
> AVX-512, the max value will be 2.  In vex_v we store a register
> number.  This is 0-15 for SSE, and 0-31 for AVX-512.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 61c0573c2f..1367e53e4e 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -97,8 +97,8 @@ typedef struct DisasContext {
>       uint8_t rex_b;
>       bool rex_w;
>   #endif
> -    int vex_l;  /* vex vector length */
> -    int vex_v;  /* vex vvvv register, without 1's complement.  */
> +    uint8_t vex_l;  /* vex vector length */
> +    uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
>       CCOp cc_op;  /* current CC operation */
>       bool cc_op_dirty;
>       int tf;     /* TF cpu flag */
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


