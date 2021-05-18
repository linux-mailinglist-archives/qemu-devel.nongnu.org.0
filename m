Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A186838754D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:38:52 +0200 (CEST)
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwBf-0004Mm-Kb
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw3g-0007Jp-73
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw3c-0001HT-He
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7rwCeJVVRhTb43K9Zskt/5Fi+7Z6n5bjwW8ga85M/k=;
 b=UOvLfmM6au0ZgCbleNY4yi80AXO2kmg2YY42Nl7EU+Sgfdzkjrz95tPVuUZcVEFLznzfmr
 j1Jt8SZaYZWFrRjbhqNrUJ6Xj5HKP5rB+MiIkr79SiFvujBzOlCaToEtqmVWuKjzlQ5YFt
 YzytgMASFCkZOWoUvqh/aeHKCTD7P6U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-4i6aoHmjPd6UDK8pj0VNWg-1; Tue, 18 May 2021 05:30:28 -0400
X-MC-Unique: 4i6aoHmjPd6UDK8pj0VNWg-1
Received: by mail-ed1-f69.google.com with SMTP id
 u14-20020a05640207ceb029038d4bfbf3a6so1856789edy.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n7rwCeJVVRhTb43K9Zskt/5Fi+7Z6n5bjwW8ga85M/k=;
 b=VTPfcSmTnbiHryFDZMWwRs2eSX0bl8FTIIc+HTE/KhGOYyj522KcojA/d+9Npksg9s
 AVF9omqOR85tKRDNKxgw4P3JRKWYlAdVXScP+4H3rTV4jBvmzGgOhlILwAOESVGv3Nz5
 +zZcf1wR742H5KaLA2vyg9iF/Hvvop6+omAibLJAcm1y3Hj5hPV2Ibu/5U4Dfh+Z/fDx
 95hEXOU2nPonb0oTnRHS9ZRoi0Lpu6RUU5kUjkMAEi9B3KrHRz27POYb6elNYNTRPc6V
 AsZgt4TangD8db+0Jv9L+L/n1jLHuS61U88GDtNwO3831SHFX1uQvGByoqgX/MwehJ0a
 5AiQ==
X-Gm-Message-State: AOAM53183pTqD/0tVEy92XduPKD9pX/EpxXBIGtkoClFi62AeMlln6gd
 WVznj+Ck4zKjC/RRX5h2NC0mYmVWhHHApAFuojnj10aj4mzu8ckJruJRT2LLkrqMr6bQd0iXxUc
 xJN6Y9YAlyxFR61c=
X-Received: by 2002:a17:906:e281:: with SMTP id
 gg1mr4984385ejb.463.1621330227124; 
 Tue, 18 May 2021 02:30:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZPegcirh8lXbjqhn/nxA4iFLeFh8SyZqUqIPOYsxXH7bfJNUQKrRUW8xaiqwEYwrh8zxQ8g==
X-Received: by 2002:a17:906:e281:: with SMTP id
 gg1mr4984371ejb.463.1621330226988; 
 Tue, 18 May 2021 02:30:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dn4sm5302621edb.88.2021.05.18.02.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:30:26 -0700 (PDT)
Subject: Re: [PATCH v2 19/50] target/i386: Remove DisasContext.f_st as unused
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-20-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <134a1c5b-7116-1524-97e1-b6184e09db45@redhat.com>
Date: Tue, 18 May 2021 11:30:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-20-richard.henderson@linaro.org>
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 4222f09b6f..7e296b39f5 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -101,7 +101,6 @@ typedef struct DisasContext {
>       int vex_v;  /* vex vvvv register, without 1's complement.  */
>       CCOp cc_op;  /* current CC operation */
>       bool cc_op_dirty;
> -    int f_st;   /* currently unused */
>       int tf;     /* TF cpu flag */
>       int jmp_opt; /* use direct block chaining for direct jumps */
>       int repz_opt; /* optimize jumps within repz instructions */
> @@ -8507,7 +8506,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>       g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
>       g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
>   
> -    dc->f_st = 0;
>       dc->tf = (flags >> TF_SHIFT) & 1;
>       dc->cc_op = CC_OP_DYNAMIC;
>       dc->cc_op_dirty = false;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


