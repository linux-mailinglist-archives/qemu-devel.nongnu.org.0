Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A3F40AE8C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:05:54 +0200 (CEST)
Received: from localhost ([::1]:58086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ88H-0003va-NB
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ822-00047L-SZ
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:59:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ821-00071o-A4
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:59:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 c13-20020a17090a558d00b00198e6497a4fso2057121pji.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5TkJM/etKLuwfHIz5sgSNfFkaWIpOA6qjbEjCSnRGPM=;
 b=H+K4CqnkJnOODhXVF8lm23upvBsNhvyxlYyu22/6F2unTDVhSjHFFLhujlkJh4Wowh
 +RWoUpKGFwpECZmp555pmnFMARtmxSgMbUCrNFxZwyIq5F0TgKk+Ym+hVNhoB/x5f1/q
 wmmn7+olC31hSdNRnqXT4E3iWHpVknBOGMpY8b87+bsUOtnudVYiuuDsRyEUnq9RvHNZ
 ueDiLZ+FNciWMuqy2rotUDyc+yn+fYL9fLmEW2tLiCc6TS/KoorxurRtFiDYPMswblMF
 +ArM7Kgb1qtduV9cfAJH0FZ1mvq+iba8Ljv5orxbTTwswhCtvsFohYr7fIdJSG7W0bWq
 cvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5TkJM/etKLuwfHIz5sgSNfFkaWIpOA6qjbEjCSnRGPM=;
 b=jCEDSQ5ayY4RXEANi5IGUfpENpb55WQtScEMjFwPUX+LS2E6EUOI3EzrIa5RRaK1g7
 82OadOivlr+H9dXkFEmrzazEdvYqU5fG97B0raXXLcJlpvrCo145rDgq8/6/GVy/FZGZ
 XdAzhkKGGWyaxL7gyFniCJwRnwdS4Ur5ysE88W3g0k5ebpdn3WWGSs7HhzVtQiVZ6LW6
 BvHZjvQJYxSzgvkn0LN8x1h6vigl4JHKWzFqZd69wCXy/jvrxsr39h6sn9R89W3mhrRL
 xsR7JVTmeqVZ5sJCa/pyyALlZAXYqWenfqb1JdGPf3ltpaRo9wPGnxhBoWa47OpULsTJ
 dUMA==
X-Gm-Message-State: AOAM5306fpcdUFCRV3UND7Q8Z+YPVvUt7vXC1C6j0nvfIXRqC7u/gALS
 cCeeDsYwmVkBaZExkOfC9Fwwnw==
X-Google-Smtp-Source: ABdhPJw4892b2BEaUpn6buyFilFWkMXf08YqZgw3hwYEdwgfamqeiK/tq33SOva1MWAMkD1BbOhnBA==
X-Received: by 2002:a17:90b:4ad0:: with SMTP id
 mh16mr1966794pjb.29.1631624361739; 
 Tue, 14 Sep 2021 05:59:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s192sm11929424pgc.23.2021.09.14.05.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 05:59:21 -0700 (PDT)
Subject: Re: [RFC PATCH v2] accel/tcg: re-factor plugin_inject_cb so we can
 assert insn_idx is valid
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210914120418.1388698-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13d54353-6223-cfca-908a-6c17d13294cc@linaro.org>
Date: Tue, 14 Sep 2021 05:59:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914120418.1388698-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 5:04 AM, Alex Bennée wrote:
> Coverity doesn't know enough about how we have arranged our plugin TCG
> ops to know we will always have incremented insn_idx before injecting
> the callback. Let us assert it for the benefit of Coverity and protect
> ourselves from accidentally breaking the assumption and triggering
> harder to grok errors deeper in the code if we attempt a negative
> indexed array lookup.
> 
> However to get to this point we re-factor the code and remove the
> second hand instruction boundary detection in favour of scanning the
> full set of ops and using the existing INDEX_op_insn_start to cleanly
> detect when the instruction has started. As we no longer need the
> plugin specific list of ops we delete that.
> 
> My initial benchmarks shows no discernible impact of dropping the
> plugin specific ops list.
> 
> Fixes: Coverity 1459509
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/tcg/tcg.h      |   3 -
>   accel/tcg/plugin-gen.c | 157 ++++++++++++++++++++++-------------------
>   2 files changed, 85 insertions(+), 75 deletions(-)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 44ccd86f3e..49a02db7e6 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -604,9 +604,6 @@ struct TCGContext {
>   
>       /* descriptor of the instruction being translated */
>       struct qemu_plugin_insn *plugin_insn;
> -
> -    /* list to quickly access the injected ops */
> -    QSIMPLEQ_HEAD(, TCGOp) plugin_ops;
>   #endif
>   
>       GHashTable *const_table[TCG_TYPE_COUNT];
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index 88e25c6df9..f145b815c0 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -163,11 +163,7 @@ static void gen_empty_mem_helper(void)
>   static void gen_plugin_cb_start(enum plugin_gen_from from,
>                                   enum plugin_gen_cb type, unsigned wr)
>   {
> -    TCGOp *op;
> -
>       tcg_gen_plugin_cb_start(from, type, wr);
> -    op = tcg_last_op();
> -    QSIMPLEQ_INSERT_TAIL(&tcg_ctx->plugin_ops, op, plugin_link);

The plugin_link field of TCGOp is now dead too.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

