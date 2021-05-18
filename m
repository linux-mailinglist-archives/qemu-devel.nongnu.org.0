Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE743875F2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:03:23 +0200 (CEST)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwZN-0000oC-4D
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwLR-0004dj-P5
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwLO-00046c-PT
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JKa30CBh/WLz67TYgZ7P1jB0HpD/MZjxkOM1lBBdfo=;
 b=EigsfpAl3Voh6dWrY9ZA6QodaaOUZ/dwSwau4y9cN0SehS1+CFDUpOm2o7PZqP+FpA/+Xp
 XJez6uN8AjzpfOw/An2tWi08z8ZSRP1mjvttpM8z8AZPgLZsKUT//C5PSIwoyMHYNnK3Nz
 drlzihoHbmhHledA5pIbE+H6oKSQ6lk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-c4T-g34xP0a06RyuHgfyjw-1; Tue, 18 May 2021 05:48:50 -0400
X-MC-Unique: c4T-g34xP0a06RyuHgfyjw-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so5285397wrm.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5JKa30CBh/WLz67TYgZ7P1jB0HpD/MZjxkOM1lBBdfo=;
 b=ZgfsGA/y6n0my2bvHFwd2mEl+REOwLJMs4ClabkujB0oGC37JoYYpZ9oLDxrNW1Op2
 lGg7lI959P7nz4P6CWlwGdo3cFgz5hHfnZpQjuQzR6diXchePXEzGW9hzqUA7FgpSkdv
 /347MAP80m4DLndFh6GjAutBzQWg4/8t/jhN9u7uxvQxY57yl73B2LA1bjdwUw+OXi0+
 KGFrWZ7QNj/MvZ1ER1PSPd7Sfm44ytMbydm0sP0ntlWZ9Kf2VepqCXSf9bztkwDP2j9u
 xnKFSe0CJg6TxjpmtGXMim6lbwakRRj15apT6yNvOrYkqrkS7TedoKx/eQlIqCI90fgW
 jAag==
X-Gm-Message-State: AOAM530eJ5ReKwaBlNwUMkgIClG7sOFnkJopHReLEr21o12uXNzmDnzR
 O7PhPJVgEiF7T5tLoRp0moyMaw/Ue/Y+0xRifcznm9qhS/+8JuJRd+6s+1bL5yoocFtSfh6gTmy
 smd7kuRjw/MYmYKM=
X-Received: by 2002:a5d:4649:: with SMTP id j9mr5803947wrs.360.1621331329086; 
 Tue, 18 May 2021 02:48:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9sJmnUNQS48O1WR6hswX0oXcMlIabsXtWmBR8jcaZADVnnNFlF8NINGQfAhMpKGeG9AI7Fw==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr5803930wrs.360.1621331328913; 
 Tue, 18 May 2021 02:48:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s5sm17566132wmh.37.2021.05.18.02.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:48:48 -0700 (PDT)
Subject: Re: [PATCH v2 27/50] target/i386: Fix the comment for repz_opt
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-28-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b274e3a5-c9c0-bde1-902e-007b61f3b163@redhat.com>
Date: Tue, 18 May 2021 11:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-28-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
> After fixing a typo in the comment, fixup for CODING_STYLE.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index b9b94f0625..d48c0f82a9 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -8521,15 +8521,16 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>       dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
>       dc->jmp_opt = !(dc->base.singlestep_enabled ||
>                       (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
> -    /* Do not optimize repz jumps at all in icount mode, because
> -       rep movsS instructions are execured with different paths
> -       in !repz_opt and repz_opt modes. The first one was used
> -       always except single step mode. And this setting
> -       disables jumps optimization and control paths become
> -       equivalent in run and single step modes.
> -       Now there will be no jump optimization for repz in
> -       record/replay modes and there will always be an
> -       additional step for ecx=0 when icount is enabled.
> +    /*
> +     * Do not optimize repz jumps at all in icount mode, because
> +     * rep movsS instructions are executed with different paths
> +     * in !repz_opt and repz_opt modes. The first one was used
> +     * always except single step mode. And this setting
> +     * disables jumps optimization and control paths become
> +     * equivalent in run and single step modes.
> +     * Now there will be no jump optimization for repz in
> +     * record/replay modes and there will always be an
> +     * additional step for ecx=0 when icount is enabled.
>        */
>       dc->repz_opt = !dc->jmp_opt && !(tb_cflags(dc->base.tb) & CF_USE_ICOUNT);
>   
> 

The comment is still quite unreadable, so perhaps something like this

	/*
	 * If jmp_opt, we want to handle each string instruction individually.
	 * For icount also disable repz optimization so that each iteration
	 * is accounted separately.
	 */

Paolo


