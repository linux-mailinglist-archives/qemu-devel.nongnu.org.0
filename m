Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA705B6998
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:32:03 +0200 (CEST)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY1Ks-0003nv-1L
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY177-0002f0-Sx
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:17:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY175-0001xE-LV
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:17:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id t14so19475618wrx.8
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 01:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=scuaxStb2Y3MM+2gJfeDP2pqc0TSdskY38WG72/OZcU=;
 b=qjwvnvVC7JZt3IOTv7UVUChf3cYJpFJDLzwiCuk17kQhyTmCF772nmFd2kgjSn7GNt
 BGPrDtgz0RrroupJJeEwH8IFrcyax2dxb9w+L37xZrMchFTYNY0vJuxpzMMp3SZBiRPl
 eTf8pJQlsQOffbhF+++GgJJNiMp79zDbHD/9qudNEZHilhnU77VfWBuMa24kLU1ZSFuq
 dMS2FmsAhChelXkkWbF49B0ARABglszctnSYnto3x4VNNZf/ji0Ns83dIH/b3s9gKx3V
 qT4JtGZY4X3Yc9Ac1QI9+QimV9AI0bgYFLcIWo4kwNnXP/vsEMybQmQONreDBGHzXvTQ
 Y/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=scuaxStb2Y3MM+2gJfeDP2pqc0TSdskY38WG72/OZcU=;
 b=RICb+1jnT61SOW+zkekXM89CVS/s/9iqR2DVFGfQlSe7DlQ1UsvZSFc+4/ehBSks3o
 DD/KJwx3jRaEchiT/BuTZFNwAg3DNTKfOoNrljVCTZfzGc/xYhRuma4uYsDL24jgXjAB
 UpK0oXuF2bFGNzhD3EpZRs59lHwZ33pzNLCDjkVp4Q78Jmca4xkAprFeAcKNeGPKPMoB
 KThD8sVG1ULJcf7oy11M1b1+GflfDmwOsko+0HRCdsPaTZCRS4LYA6KJEuhAVwn9K8C0
 u94MyQVsOTpQovKDZd6E5U8jZH/slDxYajL48vpy4D9TNnBpopKtAcw1y8BljSfD9Zbv
 Slig==
X-Gm-Message-State: ACgBeo014iz2KBwx3fciyaUoFbgm7rano2vFnP1GsX9nP8RNYp3B2R5y
 DSiirDcwTdRaMoPEBSGooDUk2Q==
X-Google-Smtp-Source: AA6agR5olIcwFQ0jTVsfy2usaUjRQeyxgsRqXEW9Jy+r8Jz+GIJhtVd48vI1JkNXAMmcQ6xJ8bCNIA==
X-Received: by 2002:a5d:49c8:0:b0:22a:35a1:1755 with SMTP id
 t8-20020a5d49c8000000b0022a35a11755mr12830257wrs.180.1663057066009; 
 Tue, 13 Sep 2022 01:17:46 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 q14-20020adff94e000000b00228c2462a78sm9586414wrr.24.2022.09.13.01.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:17:45 -0700 (PDT)
Message-ID: <58a3c681-a46a-d433-38b5-37c03515a3c9@linaro.org>
Date: Tue, 13 Sep 2022 09:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 27/37] target/i386: Use tcg gvec ops for pmovmskb
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-28-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-28-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> +    while (vec_len > 8) {
> +        vec_len -= 8;
> +        tcg_gen_shli_tl(s->T0, s->T0, 8);
> +        tcg_gen_ld8u_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_B(vec_len - 1)));
> +        tcg_gen_or_tl(s->T0, s->T0, t);
>       }

The shl + or is deposit, for those hosts that have it,
and will be re-expanded to shl + or for those that don't:

     tcg_gen_ld8u_tl(t, ...);
     tcg_gen_deposit_tl(s->T0, t, s->T0, 8, TARGET_LONG_BITS - 8);


r~

