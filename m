Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8266DEC20
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 08:53:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmUMG-0000Ew-VC; Wed, 12 Apr 2023 02:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmUME-0000EW-Kc
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:53:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmUMC-0005rC-FD
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:53:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q29so9639280wrc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 23:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681282407; x=1683874407;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yZkOrRMcQApjIfT6i8P0ysenfyhCVdwsQYDJxy2VJfw=;
 b=GQA1EwAFUDkhPyhBRwffhk87FfL+bAu+d3+lYkeo57VUQOmkqzgBhYHVfOt5fSXLYF
 Pfey6TF4V52LU/r9j14X4e86ALVTqm5ghZ1Y610RP1WQoLa4rvHy8KGd7Dmn/vlFN2NI
 PVDVtL8V/Slf66qHSH30mOfnFu8Xuf/st+PHMtKsuWUrgFgGM6g0P99u86zI6nc+vExy
 UnhGa6XW3yvqFRDrr9i5070IhKclth3XrKRbVydoqoyUVYP69pNQjOBdTyEzVVz0Lweh
 YDJCnaxpRzAzajVwnmAvVg9Z0ycnRYU1w1LRaARCFm2bvaRxXIVdrTbq5rOKaMcNfk0U
 kWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681282407; x=1683874407;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yZkOrRMcQApjIfT6i8P0ysenfyhCVdwsQYDJxy2VJfw=;
 b=QOADrnNS8YmFBmz7/Gl318FIUWf68FBRWDX+XZN4F/KB8SDCsUux8kcMgtdSKYP9H5
 KR3iHCGNotPcMwp9L0Fw1BzJ7L2tETz/HGHHRU8+LJO8nwBmhD5Z9Wt4B9fxu6+/aItE
 VJ/zoqD7DynCdUWK3zYpYQ10YZxEOI+4jFweCUKYy7DcSLnXkWCKes/mIaeK58b3E2Xc
 QA2E7bdm5glYlxBTw0d23vEugAewlC1CLxyuSH4BMhWcOiDJOnt2fIqQuxfUxj2LOLEC
 HpbCQUe77apMIoE6JfEQBF6AdV/WfO+8rzCl6WqXKiGpNeVJK8SWEm7Lyzciddoj5wE7
 Xm/Q==
X-Gm-Message-State: AAQBX9fxEY7gK6KO2LW5KYuqqoYJAk3hqSuIyxoWQdc75ArkJTMVb+W6
 7cKrl8RIq0kNSkgv6CHfYGZxEQ==
X-Google-Smtp-Source: AKy350Z+HlPvydKYACtRo1+tyMt7LpdN15UR3eHAk/knyPOPHiRlVOpUPVhGAtnVM5uhg+472U/vmg==
X-Received: by 2002:adf:f2cf:0:b0:2ef:b596:3f71 with SMTP id
 d15-20020adff2cf000000b002efb5963f71mr10122338wrp.51.1681282406684; 
 Tue, 11 Apr 2023 23:53:26 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16314253wrq.110.2023.04.11.23.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 23:53:26 -0700 (PDT)
Message-ID: <f785b8f3-d7f3-a481-81c3-3603542a0111@linaro.org>
Date: Wed, 12 Apr 2023 08:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 38/44] target/loongarch: Implement vbitsel vset
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-39-gaosong@loongson.cn>
 <dc51342e-952c-c014-3b60-4dd751646468@linaro.org>
 <ac4562c5-ea37-d57a-b1dd-02b21af72985@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ac4562c5-ea37-d57a-b1dd-02b21af72985@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 4/11/23 13:37, gaosong wrote:
> static bool trans_vseteqz_v(DisasContext *ctx, arg_cv *a)
> {
>      TCGv_i64  t1, t2, al, ah, zero;
> 
>      al = tcg_temp_new_i64();
>      ah = tcg_temp_new_i64();
>      t1 = tcg_temp_new_i64();
>      t2 = tcg_temp_new_i64();
>      zero = tcg_constant_i64(0);
> 
>      get_vreg64(ah, a->vj, 1);
>      get_vreg64(al, a->vj, 0);
> 
>      CHECK_SXE;
>      tcg_gen_setcond_i64(TCG_COND_EQ, t1, al, zero);
>      tcg_gen_setcond_i64(TCG_COND_EQ, t2, ah, zero);
>      tcg_gen_and_i64(t1, t1, t2);

tcg_gen_or_i64(t1, al, ah);
tcg_gen_setcondi_i64(TCG_COND_EQ, t1, t1, 0

But otherwise correct, yes.

>>> +#define SETANYEQZ(NAME, BIT, E)                                     \
>>> +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
>>> +{                                                                   \
>>> +    int i;                                                          \
>>> +    bool ret = false;                                               \
>>> +    VReg *Vj = &(env->fpr[vj].vreg);                                \
>>> +                                                                    \
>>> +    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
>>> +        ret |= (Vj->E(i) == 0);                                     \
>>> + } \
>>> +    env->cf[cd & 0x7] = ret;                                        \
>>> +}
>>> +SETANYEQZ(vsetanyeqz_b, 8, B)
>>> +SETANYEQZ(vsetanyeqz_h, 16, H)
>>> +SETANYEQZ(vsetanyeqz_w, 32, W)
>>> +SETANYEQZ(vsetanyeqz_d, 64, D)
>>
>> These could be inlined, though slightly harder.
>> C.f. target/arm/sve_helper.c, do_match2 (your n == 0).
>>
> Do you mean an inline like trans_vseteqz_v or just an inline helper function?

I meant inline tcg code generation, instead of a call to a helper.
But even if we keep this in a helper, see do_match2 for avoiding the loop over bytes.


r~

