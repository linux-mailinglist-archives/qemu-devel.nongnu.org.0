Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C56143D643
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:07:39 +0200 (CEST)
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfr58-00030y-Ld
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfr3U-0001dC-Rx
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:05:58 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfr3S-0006Ta-LZ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:05:56 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a26so4000225pfr.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 15:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c6JmAlxdEfPhR1whtzdL54Yn93E2Q2De8QPAptD53Wk=;
 b=XVAb+5U8QD/RBLVjH7YBo4yayP461L2OxzlK0oYqe4rntdfwxaC1SMCEDB1jPvMbGN
 6GMVTnXRSZm5XjFq2rkNMmrkCJ1mZe4Uv012RpiH/K+724uDYg39lzi7aVmIHDrhC2Px
 ebsmIDx55S/gDAPRlQFiz9ruD5pA7QdgeJjcqkdWSRxirvRuvnocGBpsTTeNbQAus1DP
 uZBZSstpnjSybWEehkPMFYNVJVag8JMAz+ezmvuypNl0lml1p6tfFjU7MwlDj+kjFJLt
 dQtQU9OtHkiYzuaRUo0en1O9TAroLfY2lYLsnCZGTHTBn/r0qnJweXGK2ibDkZt7zhEc
 drFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c6JmAlxdEfPhR1whtzdL54Yn93E2Q2De8QPAptD53Wk=;
 b=qnExxF5/JnCOaH0U1WXeOoBhTC2nte89KyoKOdGKcs27H2CufSEhnypw1JxlHVJJ/L
 cfEbV7EwXWCRqS+s9YtAi/oDt51QUpfD1QAVRYLDNqMKJGBddyqR+BTCNzBSmy4cIL6Y
 BGtiPB/cmg6L0kX8T13lYdVt706X/dV0yROHzWxQC2wirut6G+VuiYfYMNo9n+Zb2MnX
 dyBNY3UehaLGa2IBtWVXgc04j6NJWQnPprneuXaoFobLqgmHyXUnOuJ1cCrXsWV1+SLo
 bURxtnpm8+LhYGjWrGQ3MyIM4yML+/RwNLDYSJOBwZPpRDD5Ji5ZobSS5+mm6NbvNzUk
 TOaw==
X-Gm-Message-State: AOAM532MHrfFuB4xI1D3ggVuBeqZQOZ2ydDvI/N827kdCuAIU4yta7zq
 mKU8J4n0qbkGaWNM6qZ5hsPNmQ==
X-Google-Smtp-Source: ABdhPJybge3jk/ae7V0HQkq3oGnwye39dbvD3hnAI780CTCehIOe/FSAUNhZe4Senr2DhjYCBt8dNA==
X-Received: by 2002:a05:6a00:1386:b0:47c:1e8:8c86 with SMTP id
 t6-20020a056a00138600b0047c01e88c86mr336977pfg.7.1635372353239; 
 Wed, 27 Oct 2021 15:05:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o22sm944377pfu.50.2021.10.27.15.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 15:05:52 -0700 (PDT)
Subject: Re: [PATCH v2 24/32] target/mips: Convert MSA ELM instruction format
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db4e13b1-551b-c608-3434-05cbc1295e8d@linaro.org>
Date: Wed, 27 Oct 2021 15:05:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> +static bool trans_msa_elm_df(DisasContext *ctx, arg_msa_elm_df *a,
> +                             gen_helper_piiii *gen_msa_elm_df)
> +{
> +    if (a->df < 0) {
> +        return false;
> +    }
> +
> +    gen_msa_elm_df(cpu_env,
> +                   tcg_constant_i32(a->df),
> +                   tcg_constant_i32(a->wd),
> +                   tcg_constant_i32(a->ws),
> +                   tcg_constant_i32(a->n));
> +
> +    return true;
> +}
> +
> +TRANS_MSA(SLDI,     trans_msa_elm_df, gen_helper_msa_sldi_df);

This suffers from the same test ordering problem as in patch 10.


r~

