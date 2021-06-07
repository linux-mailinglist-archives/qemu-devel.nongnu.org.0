Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3477C39E737
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:07:59 +0200 (CEST)
Received: from localhost ([::1]:40036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKbO-0007oN-7O
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqKWX-0007Lq-HI
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:02:57 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqKWU-0000Yz-Nx
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:02:57 -0400
Received: by mail-pl1-x62b.google.com with SMTP id e1so9242675pld.13
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=IogJ4EgXE09hhfFSsEPXnX6rF2sCqwWjLk1pAGv5Ny0=;
 b=j8GUaApCtePsKuL++puUnSSOpPSAxLeP4rK2c0uVuYkQkFsOJC/cdc8oEmZZUUjslb
 WXbw6tqwbiMM+tH0WaHRnzNHYJKfOslgbQkKURf4vKKOuRB+SJPqQdzqmhjXOvaV+bzN
 HjFiNWSb8ctPzf+rflpQtpuL0tVlFhCV7IWxOZN1k2Y2YP9vTJD2+wyuxm+0hJ1CWUuI
 vJEpKzlzSVHvJM46uwgQu3MZmWbYQsFSkFrh/cTfZAUXRqEEPEE/4hJeW2uLDwGYBpWT
 PAu2jiNnj+FG/q3h/DT7KUm2D7k3a0T1XY5LGZf9Fudpq13cJIFlG8SQurPf5kE8Zr5D
 RTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IogJ4EgXE09hhfFSsEPXnX6rF2sCqwWjLk1pAGv5Ny0=;
 b=KQtu/i3H/57lWGzOlHd5ozWLAXxUGNBF4hcy+w0uGmaoaQzAtZJgP1ZrcsSYu0F4RL
 Uo6zb5lofsRieKyww06J8xHOg+uJ3xk1p/fTnVdFL7G+P2dJNB7rLjTSLEm5+nkHqRuF
 5WYvcJr3H3Lc9qo59wp5LjlX+O0GQBKNn9Juau3lXFcnm5/eMmYIZatLnt98YSnnqUhH
 3ASCPRAlSrFn1nsYnwpL+9+VRMBkyvDH7sMCdbEMAHID994rIBqrKqgyTvKQ1x+V1Igi
 01dBpV30v2p2TRkHS8RlotDNztD81P6Al3g76SivPBZqzE2ekIEeEmx0wm72gQVbftcQ
 7m8g==
X-Gm-Message-State: AOAM533coCoIH6zSybK5eONCtospIMmnqeK6bqkRuQ2UtxzXbQOXYq5Y
 RBaAdYbg5qXsv3/nRwVF2Fpc5xaFX8jJVA==
X-Google-Smtp-Source: ABdhPJzaBU4BlcmqrBlzOzzO3J0gVnx/7gkrkYvvPb6VEex3lUMDNBJ2+Pvi2RLta5+Ho9K3E/x4rg==
X-Received: by 2002:a17:90b:3e89:: with SMTP id
 rj9mr21316184pjb.114.1623092572906; 
 Mon, 07 Jun 2021 12:02:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 fs24sm13029476pjb.6.2021.06.07.12.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 12:02:52 -0700 (PDT)
Subject: Re: [PATCH 02/55] target/arm: Enable FPSCR.QC bit for MVE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbbeb6cf-3655-c163-e661-19915928f24e@linaro.org>
Date: Mon, 7 Jun 2021 12:02:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> MVE has an FPSCR.QC bit similar to the A-profile Neon one; when MVE
> is implemented make the bit writeable, both in the generic "load and
> store FPSCR" helper functions and in the code for handling the NZCVQC
> sysreg which we had previously left as "TODO when we implement MVE".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 32 +++++++++++++++++++++++---------
>   target/arm/vfp_helper.c    |  3 ++-
>   2 files changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
> index d01e465821b..22a619eb2c5 100644
> --- a/target/arm/translate-vfp.c
> +++ b/target/arm/translate-vfp.c
> @@ -784,10 +784,19 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
>       {
>           TCGv_i32 fpscr;
>           tmp = loadfn(s, opaque);
> -        /*
> -         * TODO: when we implement MVE, write the QC bit.
> -         * For non-MVE, QC is RES0.
> -         */
> +        if (dc_isar_feature(aa32_mve, s)) {
> +            /* QC is only present for MVE; otherwise RES0 */
> +            TCGv_i32 qc = tcg_temp_new_i32();
> +            TCGv_i32 zero;
> +            tcg_gen_andi_i32(qc, tmp, FPCR_QC);
> +            store_cpu_field(qc, vfp.qc[0]);
> +            zero = tcg_const_i32(0);
> +            store_cpu_field(zero, vfp.qc[1]);
> +            zero = tcg_const_i32(0);
> +            store_cpu_field(zero, vfp.qc[2]);
> +            zero = tcg_const_i32(0);
> +            store_cpu_field(zero, vfp.qc[3]);
> +        }

Ok I guess.  You could store the same i32 into all elements:

     tcg_gen_gvec_dup_i32(MO_32, offsetof(CPUARMState, vfp.qc),
                          16, 16, qc);

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

