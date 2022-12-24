Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75242655AD0
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:18:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9893-0006Za-UC; Sat, 24 Dec 2022 12:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p988u-0006XQ-UM
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:17:10 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p988m-0007QC-3I
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:17:03 -0500
Received: by mail-pl1-x634.google.com with SMTP id b2so7521448pld.7
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tZfh6SGAED2pPoyoLwgBjyeFUnunRUjfLIRQrXCQLdI=;
 b=qt269dPFU5IXGGn9gJUUzsrVLm75RC+o9gTmt7PkD2YrUl+xiGYXo85Q6SEcy6DzAI
 n7pN3SCYsmiHgFMSDhg/QSpveUdb+Jhzeyjll+BsQ/UBZjLN4wyIj1ekfqrsoLmUzTWp
 ATosShhrGOcDeO8IsQZ/9PMfRTTC1uFIg2/E6QOKUrMGE1GDWDDK0/1CHyH/HfQ78o02
 EiMHCm16cDIDiQpWl7mQvhrpa7SrNB6eq96ysPKD+yPOVlsR2njUEVxWvw006Siqhmxa
 ApSP96ISs+OeIyrCTazh8iC8mRN/Vug395vZP51uqx4V7r5zdYznmhf877LZi32WENJK
 FSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZfh6SGAED2pPoyoLwgBjyeFUnunRUjfLIRQrXCQLdI=;
 b=8LYALHhz7nAugTHEmvTALmUrctUT11HsCTZkcwThy+jKqgRdZx1PN3u9OyrLiSChjY
 CYWpoxfzh7gX0KFSPFlqcKKJoky9XDuZDGLnNB/KAv+hiFWXTCsqVmeO9zPZ+ghnrSFl
 X63fffhGn3aOZQwSOJnwJDpK6CiLtqg/1+2nnHJhd+T/VCgSS99Avo0HWldOi/zhR6bj
 CPkXADMGycGphcsq3y9L54FZLOrT25WOuKRR2f5lamr5pbQxsSzRns6LmQwMNBitdSbR
 cmqvFUDtNsiKKz00/tNw9WG+6G1caYPMIIFuxn5I9n7Q/ctro3lW8pPN72r8UiQRfX5s
 X+mQ==
X-Gm-Message-State: AFqh2kpmrgLQrzepnP/Vvxuh+BUpPBmjDjNWdUOOe4NgkU8LF6BnkUxL
 TQqs07jk0DTNsfzh8QWsd1Af7g==
X-Google-Smtp-Source: AMrXdXu1qwY1jOnUqSZNFVSiYcSLu6IUIemE0l89YupDvXlH1VETpgkhs6mEwEmf1d9QszfkQ7ZLnA==
X-Received: by 2002:a05:6a20:a888:b0:af:758e:5923 with SMTP id
 ca8-20020a056a20a88800b000af758e5923mr16297615pzb.21.1671902214143; 
 Sat, 24 Dec 2022 09:16:54 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a170902780800b00174f7d10a03sm4299377pll.86.2022.12.24.09.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:16:53 -0800 (PST)
Message-ID: <9bfb8161-1341-75ce-2e9c-b73c3856dc52@linaro.org>
Date: Sat, 24 Dec 2022 09:16:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 05/43] target/loongarch: Implement vadd/vsub
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-6-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-6-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:15, Song Gao wrote:
> +static bool gen_vvv(DisasContext *ctx, arg_vvv *a,
> +                    void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32))
> +{
> +    TCGv_i32 vd = tcg_constant_i32(a->vd);
> +    TCGv_i32 vj = tcg_constant_i32(a->vj);
> +    TCGv_i32 vk = tcg_constant_i32(a->vk);
> +
> +    CHECK_SXE;
> +    func(cpu_env, vd, vj, vk);
> +    return true;
> +}
> +
> +TRANS(vadd_b, gen_vvv, gen_helper_vadd_b)
> +TRANS(vadd_h, gen_vvv, gen_helper_vadd_h)
> +TRANS(vadd_w, gen_vvv, gen_helper_vadd_w)
> +TRANS(vadd_d, gen_vvv, gen_helper_vadd_d)
> +TRANS(vadd_q, gen_vvv, gen_helper_vadd_q)
> +TRANS(vsub_b, gen_vvv, gen_helper_vsub_b)
> +TRANS(vsub_h, gen_vvv, gen_helper_vsub_h)
> +TRANS(vsub_w, gen_vvv, gen_helper_vsub_w)
> +TRANS(vsub_d, gen_vvv, gen_helper_vsub_d)
> +TRANS(vsub_q, gen_vvv, gen_helper_vsub_q)

The 8 to 64-bit operations can be implemented with tcg_gen_gvec_{add,sub}.
The 128-bit operations can be implemented with tcg_gen_{add,sub}2_i64.


r~

