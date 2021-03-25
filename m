Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D834944F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:40:12 +0100 (CET)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPR9f-00047E-4V
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPR8Y-0003hu-Ui
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:39:02 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:42793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPR8X-0007SP-80
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:39:02 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so2114817ota.9
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mRqOjZG6cKvjnDG2pWQ+Ilmc3BqSM+Y65+h5TGVCKCQ=;
 b=YlOc80UO7oVCMeGNFpUtZjTRqChqHQSjNCtZqFt+xgA0AsanCz4JYsOq62sqk7D7m8
 hGDobTnDp34EOLxEOc2aNkqb6Y6lbsPCAYPK5ewq5pq+HsTPCgqifvmwrxm3j+05vima
 7Gf1pfxjDmHNaFGiO4HDz9NQ10G8lJ//SoAFw3d/LlK1OrVt2G5Yakzq5jqs0aQTwhCJ
 y018mEOZlP/FOq9FgsfqNOE7rEl3HikhyNev4IuqMHWRkbaBcgO73TKROhGJwn1T1Ffn
 sxgcdKNUXylJfz2+5ojlKJ9oWfmQ3vCS41eIMTzeLjeTRwbEUOCnUcsX+qom4YwoA25u
 U5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mRqOjZG6cKvjnDG2pWQ+Ilmc3BqSM+Y65+h5TGVCKCQ=;
 b=sbtTQTA7gZsKaAewPw1fXyq8bqbCD0bJZRWPHdAK4ZxYdRZfZlh1ux7CxaCnpr6VMl
 k+BIfST0oLgNnqek8o5a3/RrTJt93Hyp6GVOLhnP9z0A7QTB7QHQu1Ol8VH42d1qhX9k
 sHGu8YVvfyf/0jOSmqLeAzdtwr7TnXmlcOIJLY59VDWYJpcbS2Pghsc852CaUJICDLfQ
 h6u7uJYawBCv7MZOlTh+/rEKtFwz9p6HP/enhhnuAabGuzhd059Q2m/xF1b/hdJzmoT0
 Nevhb5WejFnOAvP0gZkfOd17empU/hIlxhxUh8fXHhbnK557QPcqUjgbQr8mjayyzsxJ
 8AQw==
X-Gm-Message-State: AOAM533q2t3opvRBN0NCpQpa3k+t54KQdJ7lJmkK9Jgq+EOtPeYAC2EY
 ubAW4+4GsgiKjE9rTGI7/H9tDw==
X-Google-Smtp-Source: ABdhPJxTbgu6f02skE+meFURQj8OCquFRi5CilOr/io+7OJx8xTzVCbOsx36Zoq2kmggqBbBweOhRA==
X-Received: by 2002:a9d:921:: with SMTP id 30mr7856874otp.49.1616683139961;
 Thu, 25 Mar 2021 07:38:59 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id r10sm1418836ots.33.2021.03.25.07.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 07:38:59 -0700 (PDT)
Subject: Re: [PATCH 03/15] Hexagon (target/hexagon) properly generate TB end
 for DISAS_NORETURN
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-4-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d89920a-35e2-6134-70a1-0dcf890ef254@linaro.org>
Date: Thu, 25 Mar 2021 08:38:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-4-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:49 PM, Taylor Simpson wrote:
> When exiting a TB, generate all the code before returning from
> hexagon_tr_translate_packet so that nothing needs to be done in
> hexagon_tr_tb_stop.
> 
> Address feedback from Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/translate.c | 62 +++++++++++++++++++++++++---------------------
>   target/hexagon/translate.h |  3 ---
>   2 files changed, 34 insertions(+), 31 deletions(-)
> 
> diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
> index 5d92ab0..19b9bc7 100644
> --- a/target/hexagon/translate.c
> +++ b/target/hexagon/translate.c
> @@ -54,16 +54,41 @@ static const char * const hexagon_prednames[] = {
>     "p0", "p1", "p2", "p3"
>   };
>   
> -void gen_exception(int excp)
> +static void gen_exception(int excp)

I would call this something like gen_exception_raw or gen_exception_nopc, or 
something because,

> +static void gen_exception_end_tb(DisasContext *ctx, int excp)

... *all* exceptions end the tb.

> +{
> +    gen_exec_counters(ctx);
> +    tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], hex_next_PC);
> +    gen_exception(excp);

The helper_raise_exception call longjmped away, so

> +    tcg_gen_exit_tb(NULL, 0);

... this exit_tb is dead code.

> @@ -537,8 +551,7 @@ static bool hexagon_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>   
>       tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
> -    ctx->base.is_jmp = DISAS_NORETURN;
> -    gen_exception_debug();
> +    gen_exception_end_tb(ctx, EXCP_DEBUG);

The set of the pc is also redundant?


r~

