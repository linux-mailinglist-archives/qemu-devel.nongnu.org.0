Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16A4081E3
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 23:38:32 +0200 (CEST)
Received: from localhost ([::1]:55706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPXBF-00063j-VE
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 17:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXAJ-0005M0-0l
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:37:31 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXAH-0001yd-4Q
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:37:30 -0400
Received: by mail-pj1-x1034.google.com with SMTP id v19so2231222pjh.2
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tmTCQqEi4DkOdOw9HlJT5nByJq8GO2elZ6yxvc7Fmfg=;
 b=yrXDdZ7NIYQWEgQU4y+b7f7hqe/bANhEwYhsbWsfKhy4qS67CP43Q4aitshHaH/Ypl
 ob3o2mMIft2DdQ86xX9gSQkFY1VQjrr/2G0rA7wEKnus+85CdskdFBp1/YVsL3ALvBmh
 sQMdDqdqV+OqgU0VuOWU5UL6qY8EbxgM3HX66kiZaO0cgFk0AELhAPl67Ix/GkzbO74v
 uoDaWsD7Wki2UxpiM1stF8UxsPEKCifj0WzAFEYZNLBJOdI++HjXn2WGlBQZDXmL4fFL
 +qu9XsTlgeW1YJuGLQvqP1I7pRjytchivmViMG2Is3BV86vccyZPTMQT1+jPm3kMVWGT
 9TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tmTCQqEi4DkOdOw9HlJT5nByJq8GO2elZ6yxvc7Fmfg=;
 b=z5Kk9leKumW5Jvydr1Y2XdtJ9D91eqR0mDKUYxyPC32bMc42k9sY6qb0qNIuHKLWhy
 kH4yQ2CWpoWMUOA60VoD9FgE/vlkpm0mKbJro7UkU8SgAO3n+W3Nw/SCw0zwfK43mpMe
 2rJshDZxXOA2iy9m+noDhEpD/acsox7P5HYRGlIjAX6OfB7fin2chTkRX7XmHSQu+Xux
 607uSs7ldwrqBLeIMJJwR8qtc2lqEVwBXNf3r/Gubc0mevpjWbug9V8AgCvF+BnKq+xv
 Ndx5qi/mZPA4WLE3e3kQIaxlvqtfdtXMuIfvI2mChez8uz0BHHpX2zw1UJ2Jub0xiw8N
 TJzw==
X-Gm-Message-State: AOAM532VQu2gsKDbX+zdqW5Pzcb4YuQun00S9aVrdqzePTQFg0miN7cP
 PJmaoJq5FUUWnbnCEJQJw5xgxA==
X-Google-Smtp-Source: ABdhPJzVfXD0KjDbCN2+xClTvkhMj41N1tLp4nhpSHdNuke8GnhzirhcNr0l3ZWIq/uldGc6boTx2A==
X-Received: by 2002:a17:902:8f83:b0:138:9186:71d7 with SMTP id
 z3-20020a1709028f8300b00138918671d7mr7625560plo.56.1631482647254; 
 Sun, 12 Sep 2021 14:37:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a11sm5366010pgj.75.2021.09.12.14.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 14:37:26 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: assert insn_idx will always be valid before
 plugin_inject_cb
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210903145938.1321571-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36bc7691-c0d9-9e18-dade-4d95405dcd62@linaro.org>
Date: Sun, 12 Sep 2021 14:37:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903145938.1321571-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 7:59 AM, Alex Bennée wrote:
> Coverity doesn't know enough about how we have arranged our plugin TCG
> ops to know we will always have incremented insn_idx before injecting
> the callback. Let us assert it for the benefit of Coverity and protect
> ourselves from accidentally breaking the assumption and triggering
> harder to grok errors deeper in the code if we attempt a negative
> indexed array lookup.
> 
> Fixes: Coverity 1459509
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index 88e25c6df9..b38aa1bb36 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -820,10 +820,9 @@ static void pr_ops(void)
>   static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
>   {
>       TCGOp *op;
> -    int insn_idx;
> +    int insn_idx = -1;
>   
>       pr_ops();
> -    insn_idx = -1;
>       QSIMPLEQ_FOREACH(op, &tcg_ctx->plugin_ops, plugin_link) {
>           enum plugin_gen_from from = op->args[0];
>           enum plugin_gen_cb type = op->args[1];
> @@ -834,6 +833,7 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
>               type == PLUGIN_GEN_ENABLE_MEM_HELPER) {
>               insn_idx++;
>           }
> +        g_assert(from == PLUGIN_GEN_FROM_TB || insn_idx >= 0);
>           plugin_inject_cb(plugin_tb, op, insn_idx);

Hmm.  This is the single caller of plugin_inject_cb.

I think we could simplify all of this by inlining it, so that we can put these blocks into 
their proper place within the switch.

Also, existing strageness in insn_idx being incremented for non-insns?  Should it be named 
something else?  I haven't looked at how it's really used in the end.


r~

