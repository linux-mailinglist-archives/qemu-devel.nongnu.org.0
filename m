Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD76A2251
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:25:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdgG-0008Pb-D8; Fri, 24 Feb 2023 14:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVdgE-0008PS-AC
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:24:30 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVdgC-00060Z-HW
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:24:29 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso3897465pjb.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 11:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uCAKX0S/Dz9BmQxFtgMWgnXNwjX7tDsgdRjHJVNrIJs=;
 b=cpUmpvz3CZS0tHvfy7S39X1rA3gHQGQ/J+f/PmyjeodTj8pD7q83/ocEfUjto73DHh
 qnxuznF7dfKtoGVaft/cVHISjmb3goXLzd0EriEFLT9NnggVW0YEKDxFq/1TJ/Mm9V67
 3+ZdGY0XZUN4BkObQExR/ndLVUUmRPHOG0g6X1P2DKzdySyFwhQU25TUJyjR+ErFA5A9
 Xl1XRMyZNcZfzO36GbL5LOpz32vYJflI1XaI6/vZUUSipoPDoYkZECydjXdV5vqp1VaX
 uTVbTK1kdEpsz6nGahwWXO5/p16qo//wm8XLqH8zxGXGOEGOLmgx2Uw/YxZ7Lz7GncCF
 5AZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCAKX0S/Dz9BmQxFtgMWgnXNwjX7tDsgdRjHJVNrIJs=;
 b=nr2HBxrocBYDltnvuT0y+UPNGZJ09QwOOIMIoW+ROUlczaDiFnFKXxpBK1w30vCxQh
 4f76YUUhkiv0MwNzF45I9VuQ9AksNwZv1TjKg2xXbl14WhkTe685tW91y5GoGGXj63Le
 bVcB41dPhi1NydFsKVA82MzoOzfPMF1n09zF0660uHVDHI5KPE7O6+lMIRgXNfJiOfGK
 gy5Wt7PbKASyvKz+qHhzm0I7e2kpKnJ8IXST4H9wCCHbYVqaIFSIQ15zbh6HLtsuYjBz
 QSoQCRzPFLiywQeCIAUe+vllLspcvutumArmRvN3DSaC4LwWkyS+rQMaWY/PyFWc+Kr/
 hWGA==
X-Gm-Message-State: AO0yUKWe7Oseo0uPAUAjfM7/xGCbdcYiBkupq2SdtcO+kxvrNqc4hu1Z
 PiLHOdbESyYaFW25F8aM6y7NLZWbAOSvssf7JYc=
X-Google-Smtp-Source: AK7set8Pkw13pfEYCPZzMQ4q/qD8Bet1OgRWqLlUCdandJjmvwxfUENB3WQ2Ga8gU7tvtTfDTIS2vg==
X-Received: by 2002:a05:6a20:430a:b0:cb:ec5f:3c5b with SMTP id
 h10-20020a056a20430a00b000cbec5f3c5bmr10958050pzk.18.1677266666496; 
 Fri, 24 Feb 2023 11:24:26 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 k184-20020a6384c1000000b004fb26a80875sm6737148pgd.22.2023.02.24.11.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 11:24:25 -0800 (PST)
Message-ID: <c5913a52-e5de-4fb5-688c-6d3fb3215353@linaro.org>
Date: Fri, 24 Feb 2023 09:24:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
 <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
 <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
 <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
 <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 2/23/23 21:24, gaosong wrote:
> I was wrong, the instruction is to sign-extend the odd or even elements of the vector 
> before the operation, not to sign-extend the result.
> E.g
> vaddwev_h_b  vd, vj, vk
> vd->H[i] = SignExtend(vj->B[2i])  + SignExtend(vk->B[2i]);
> vaddwev_w_h  vd, vj, vk
> vd->W[i] = SignExtend(vj->H[2i])  + SignExtend(vk->H[2i]);
> vaddwev_d_w  vd, vj, vk
> vd->Q[i] = SignExtend(vj->W[2i])  + SignExtend(vk->W[2i]);
> vaddwev_q_d  vd, vj, vk
> vd->Q[i] = SignExtend(vj->D[2i])  + SignExtend(vk->D[2i]);

Ok, good example.

> static void gen_vaddwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
> {
>      TCGv_vec t1 = tcg_temp_new_vec_matching(a);
>      TCGv_vec t2 = tcg_temp_new_vec_matching(b);
> 
>      int halfbits  =  4 << vece;
> 
>      /* Sign-extend even elements from a */
>      tcg_gen_dupi_vec(vece, t1, MAKE_64BIT_MASK(0, halfbits));
>      tcg_gen_and_vec(vece, a, a, t1);

No need to mask off these bits...

>      tcg_gen_shli_vec(vece, a, a, halfbits);

... because they shift out here anyway.

>      tcg_gen_sari_vec(vece, a, a, halfbits);
> 
>      /* Sign-extend even elements from b */
>      tcg_gen_dupi_vec(vece, t2, MAKE_64BIT_MASK(0, halfbits));
>      tcg_gen_and_vec(vece, b, b, t2);
>      tcg_gen_shli_vec(vece, b, b, halfbits);
>      tcg_gen_sari_vec(vece,  b, b, halfbits);
> 
>      tcg_gen_add_vec(vece, t, a, b);
> 
>      tcg_temp_free_vec(t1);
>      tcg_temp_free_vec(t2);
> }

Otherwise this looks good.

>          {
>              .fniv = gen_vaddwev_s,
>              .fno = gen_helper_vaddwev_q_d,
>              .opt_opc = vecop_list,
>              .vece = MO_128
>          },

There are no 128-bit vector operations; you'll need to do this one differently.

Presumably just load the two 64-bit elements, sign-extend into 128-bits, add with 
tcg_gen_add2_i64, and store the two 64-bit elements as output.  But that won't fit into 
the tcg_gen_gvec_3 interface.


r~

