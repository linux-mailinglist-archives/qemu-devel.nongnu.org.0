Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FCB6CCB8E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:40:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phG6J-0001kq-4Y; Tue, 28 Mar 2023 16:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phG6G-0001kc-VW
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:39:25 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phG6F-0007Q6-F6
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:39:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso12356924pjz.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680035962;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m3Yh7oFTjdqSdxd+LfEv4vxGzHZ57HP4Sbs9zC4vpRI=;
 b=bYVR0VQ7/0cLmZS530vXblYhNjxmbs55zhwsalhZqLXkyrYqkwea5Yd7qYq5WiOs+I
 wrxKnEdJ/Fm6ny8y/erPVGZ2qXXqfC7Gzwgt3YcFwmhcSotZSAeaI6gd/7111VXlVDV+
 DLMkAi1thXS8tefOAV+duSBqJyp06TLnYrXBLj2LDlhT+yGHEoo2IyaZ9uue+WSRIyd0
 YvxU3GFhqzR9ifxeTcrkqbcD8VnrSVKaifiJrdV/73Dd1xToJC0q7cbSTnlpMCtYDkxV
 GHCyvmI1Mj4H+cc0tUUxiQuOJNra2wYBW7jOnPRyjx1wIxUwpIMTnuLqulcqh5TobDC5
 a0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680035962;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3Yh7oFTjdqSdxd+LfEv4vxGzHZ57HP4Sbs9zC4vpRI=;
 b=lqhTEGirnc91nvfzya4CmO3UW/dG+yhZJFOxxmT+VsTvOw0LngtUkTpi2Z5LS8WnV5
 oWd7hmYeLfKqhPNUDvar9hhMxoHyJCDJFiqHlfuWni8Xzhcg18W5oy2Z2R++53uwcB0u
 a2Knqdvnsy7kZhqkHGu4cnJ4GcFFB/N4mk7h2xdOq0H99vWc9O9DEUu9EGH60nnktEiO
 wpFTvMprRgBlgq9pzDJLV6XbgwOLbwcHn/FPCugKAReL5xpMya0tP/Lko9yAaskDQZgS
 rwjaxln6mGTZluq9pLMmnxpSrZ9dIr72ZFBauCPH933myM2mdK6yrnsjKw1K9ueOxX9O
 66gA==
X-Gm-Message-State: AO0yUKUmPYpb6MM116AIcRXSfAA/l8MoOTjCCTNOuJH2KI+XxiM3+yay
 TXpoyW2Ne+W0/GF1cp3fuQFvww==
X-Google-Smtp-Source: AK7set82VTBLwmYcHS+ZmXTWFTQ2TdjdPRLt6b/BcED4FOpwoZ2F5dyffz9xNHUGIzMX+BR2p9rqNA==
X-Received: by 2002:a05:6a20:b2f:b0:da:3903:f5e7 with SMTP id
 x47-20020a056a200b2f00b000da3903f5e7mr13849350pzf.0.1680035961679; 
 Tue, 28 Mar 2023 13:39:21 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 b11-20020aa7870b000000b005ac419804d5sm12855086pfo.98.2023.03.28.13.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:39:21 -0700 (PDT)
Message-ID: <a7a229ac-0dd8-ec0d-9215-a1e71f3aef1b@linaro.org>
Date: Tue, 28 Mar 2023 13:39:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 14/44] target/loongarch: Implement vmax/vmin
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-15-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-15-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/27/23 20:06, Song Gao wrote:
> +static void do_vminmax(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm,
> +                       void(*gen_vminmax_vec)(unsigned,
> +                                              TCGv_vec, TCGv_vec, TCGv_vec))
> +{
> +    TCGv_vec t1;
> +
> +    t1 = tcg_temp_new_vec_matching(t);
> +    tcg_gen_dupi_vec(vece, t1, imm);

t1 = tcg_constant_vec_matching(t, vece, imm);

> +static void gen_vmini_s(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
> +{
> +    do_vminmax(vece, t, a, imm, tcg_gen_smin_vec);
> +}
> +
> +static void gen_vmini_u(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
> +{
> +    do_vminmax(vece, t, a, imm, tcg_gen_umin_vec);
> +}
> +
> +static void gen_vmaxi_s(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
> +{
> +    do_vminmax(vece, t, a, imm, tcg_gen_smax_vec);
> +}
> +
> +static void gen_vmaxi_u(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
> +{
> +    do_vminmax(vece, t, a, imm, tcg_gen_umax_vec);
> +}

Perhaps easier to expand

     tcg_gen_umax_vec(vece, t, a, tcg_constant_vec_matching(t, vece, imm));

in each instance?


r~

