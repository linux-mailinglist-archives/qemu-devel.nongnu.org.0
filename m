Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5125A438556
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:41:00 +0200 (CEST)
Received: from localhost ([::1]:56510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNp5-0002jq-1U
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNmv-0001QY-Ve
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:38:45 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNmu-00058A-6A
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:38:45 -0400
Received: by mail-pg1-x530.google.com with SMTP id r2so6699156pgl.10
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wK5fRWcUn0FW9gmEGZRT6paTJl5yg+4rV78hqYNPW+c=;
 b=y9b8D+7OMEegmbuUL4/sKYF+Gk5P2b3fxpus2lbVmhhjzA09gkQ2nnZy2J8lUlp0bM
 seZljuKpNvPvrxsHOkV+CSm3si83rbBuj+B4euSjT4btSzolorS6521yNGj1cIDhGdbn
 6mfnQdiiEm7iMia/XkpEtX7Ww58/MmUa02Vm6Jp5gOrKJTlUrt7NvtEVPlJvd/gkjxKR
 I0iCLmyoZfKY76w1xgdiUFjvmHHvzk5CdM1rcDRRaAYFtsqEH4D64JfE1+njQKpto2WV
 FYhRtk/u3AuhLv0z852mb1BuDijhkKn3nkCnd6xlCQ2isnXTYZUtN2wKP13dMSWgZ3yS
 Ad5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wK5fRWcUn0FW9gmEGZRT6paTJl5yg+4rV78hqYNPW+c=;
 b=p5BSBdRisI6CXiWd48cE+qj9PQYsN1o3+7wm6vWWnvxIF+TfbCpNiLMcgXj4LdssIN
 KEkj98NDwVqZYlo4+FcIE5DeWZlSwWWvnXzzxYKHhuHktW59hme0mRn5g6ZC/fmFplTw
 iJwxvzceqItCCYFVR8XGz3H5zoXyrF9BMkwb5KCSx3ZlFfvIp7iA0Nh1tJs/v5RjQ5TM
 JMxsrGhLSYeecte+DA8w4h2DIUM2GrzTQyVPAJV8bjTgm0bL9PzODg7VxlvS7t8g0O7a
 LL50y6YlScxupGb8wFZ2cok2BeLvX2p60Hk+Wtq+1ZBm2Ebr1/AaTFDS8IgYxkoR7cD7
 xvvA==
X-Gm-Message-State: AOAM530fVh6I6jIS+9vJ10EqPOIO5OflnRg0pu7K0+fZycAxTXxujlFP
 QVJBC7mL0MBIvNlmHc2WnRwEow==
X-Google-Smtp-Source: ABdhPJwNjSjEagn+7MhA62r3nNPbrnEZTclyrEJ3ovdCB4iJSyriuO/WZKIuGX/xjKSt8DtfPpG3jg==
X-Received: by 2002:a63:380e:: with SMTP id f14mr6151945pga.267.1635021522912; 
 Sat, 23 Oct 2021 13:38:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id np18sm621588pjb.40.2021.10.23.13.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:38:42 -0700 (PDT)
Subject: Re: [PATCH 22/33] target/ppc: moved stxvx and lxvx from legacy to
 decodtree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-23-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <482b494a-a291-9e89-0628-5059e3dc365e@linaro.org>
Date: Sat, 23 Oct 2021 13:38:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-23-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> @@ -2075,7 +1969,7 @@ static void gen_xvxsigdp(DisasContext *ctx)
>       tcg_temp_free_i64(xbl);
>   }
>   
> -static bool do_lstxv(DisasContext *ctx, int ra, int displ,
> +static bool do_lstxv(DisasContext *ctx, int ra, TCGv displ,
>                        int rt, bool store)
>   {
>       TCGv ea;
> @@ -2089,7 +1983,7 @@ static bool do_lstxv(DisasContext *ctx, int ra, int displ,
>       mop = DEF_MEMOP(MO_Q);
>   
>       gen_set_access_type(ctx, ACCESS_INT);
> -    do_ea_calc(ctx, ra, tcg_const_tl(displ), ea);
> +    do_ea_calc(ctx, ra, displ, ea);
>   
>       if (ctx->le_mode) {
>           gen_addr_add(ctx, ea, ea, 8);
> @@ -2127,11 +2021,26 @@ static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store)
>           REQUIRE_VECTOR(ctx);
>       }
>   
> -    return do_lstxv(ctx, a->ra, a->si, a->rt, store);
> +    return do_lstxv(ctx, a->ra, tcg_constant_tl(a->si), a->rt, store);

Ah, if these 3 lines had been in the previous patch, I wouldn't have been asking silly 
questions.  :-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

