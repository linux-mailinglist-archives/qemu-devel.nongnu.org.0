Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EF66D5743
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 05:40:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjXWQ-0002yJ-5t; Mon, 03 Apr 2023 23:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjXWM-0002wS-13
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 23:39:48 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjXWK-0006Oe-GJ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 23:39:45 -0400
Received: by mail-pf1-x435.google.com with SMTP id bt19so20575629pfb.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 20:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680579583;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yNblzJtNmC+XeQWynuWNVdlR9EED7oM2vCN088BGwd8=;
 b=h3fjjxAsEe8JDAQRUip3qObvu1Zv3SlzLbb6ikW3Y61ewnV3H8TAmwtAJUdmueCl0o
 uCIvp6r3+cvjlA53GvAyGb9pR1tCQwN8vN0cKB1H5eQVbjoCYTe4PIEOM1WzyBgh+nEV
 j4sM6EbxtKYvKE4rjNziK5gWq3aZM8oOZ8hFCuf9Ll3Rmu75HA8+9R+PGPnaVAkOOG2K
 TiWOUG5baI9zw7xOeOZ00h5wpQmUacWPI/9w8IaWjLRMWOgv430F8mkXx6VdLboCxPSb
 DgoUhmKDQ+CCve7GNA9Pbhh2YKk0u3SkTQled+bEu1Vhu+4KyGkMxJ4gKPxEvY97C/6D
 kSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680579583;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yNblzJtNmC+XeQWynuWNVdlR9EED7oM2vCN088BGwd8=;
 b=0CEjItvISeb3PCb0WYH3kl+JtYhnf9YJpW1IFjCvoATI4h1wBgMbcOy6EkRS5B3rNw
 eEcaf1O8zoEYJODQ+wP/WW+FxbX/mmGSylERJOjVBN2gSwQhuU5rtmTD3mk1UNd37GIJ
 BFZE+51uoQqe0Rc2mZ0a3Y25fO0oVdubEkM/7o2uF/QR1pkZ4ejcjnjC/c0o15cgmzem
 Ohz7IU51TZ+0wt9LGwDONBgqgPKrxMhHNuI3BPiUnQJUXFJ6UU629eQ+TPqGeF3KNMPN
 g3ClfGVwbKc40nZclIWJQ19+rcqB9kC9kvwMheGWiPruQ4QO2BH7e8y+hw6yaRw5U1ge
 1wDA==
X-Gm-Message-State: AAQBX9f9bmdIUAZLnRR4VP9CnLbJQqZiVO98bEZFPyVvrD0AYeiHhO/6
 LTtw073FkVo3Ig/Yjk4E1u8B1snjy+osqzIzVZo=
X-Google-Smtp-Source: AKy350aLUonGFdm1C9kGWqf5NgjrIHT2y8H5lvAwA2TTEXZBbSqi2F2+2PnYbwYjKM3yH1xamsV19Q==
X-Received: by 2002:a62:1a93:0:b0:628:1155:3a69 with SMTP id
 a141-20020a621a93000000b0062811553a69mr1151059pfa.1.1680579582987; 
 Mon, 03 Apr 2023 20:39:42 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 p3-20020aa78603000000b00625d84a0194sm5894826pfn.107.2023.04.03.20.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 20:39:42 -0700 (PDT)
Message-ID: <339954b6-8d79-406a-32fb-7f8b9c0eb93b@linaro.org>
Date: Mon, 3 Apr 2023 20:39:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 43/44] target/loongarch: Implement vldi
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-44-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-44-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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
> +static bool trans_vldi(DisasContext *ctx, arg_vldi *a)
> +{
> +    int sel, vece;
> +    uint64_t value;
> +    CHECK_SXE;
> +
> +    sel = (a->imm >> 12) & 0x1;
> +
> +    if (sel) {
> +        /* VSETI.D */
> +        value = vldi_get_value(ctx, a->imm);
> +        vece = MO_64;
> +    } else {
> +       /*
> +        * VLDI.B/H/W/D
> +        *  a->imm bit [11:10] is vece.
> +        *  a->imm bit [9:0] is value;
> +        */
> +       value = ((int32_t)(a->imm << 22)) >> 22;
> +       vece = (a->imm >> 10) & 0x3;
> +    }
> +
> +    tcg_gen_gvec_dup_i64(vece, vreg_full_offset(a->vd), 16, 16,
> +                         tcg_constant_i64(value));
> +    return true;
> +}

I think you should finish this decode in insns.decode,
especially since we are using that for disassembly.


r~

