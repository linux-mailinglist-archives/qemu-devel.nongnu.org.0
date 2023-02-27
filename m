Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14AA6A4A04
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 19:41:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWiQn-0002vm-8B; Mon, 27 Feb 2023 13:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWiQj-0002vR-BV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:40:57 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWiQh-00069I-9u
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:40:56 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i3so7735858plg.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 10:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NQEVJMpf00c85p4M6QMwTRpg4xKJNRVJNpmBN5hc4C8=;
 b=LIvNMDHtAv+g9H1qqYrpojBkSQrAUkp0J6sfEP7TjaSrbf3y+UVRvCQJShem2hSK/h
 Oa1QgoRwp0kySzf/NsxGO4N3H4vXbDQdf1BsCsOz/q0jNkpTRqxAD9niRnrw31Dl7D9x
 Y8QzrjM++uMM75IwlBRrL6XKODxhuE5sPC61mlY/GHCVg6pdFMGgxmZT/JaZKMrsNWNQ
 ayY08tUq9AHRCdZSlQ/NiJ9VRWOtoh35EquQJ0pPcswGh/DnTvT5+GJwc/p1nLtMhMTA
 heavLM/m53vT4Lo36NLIc5vX6uymgWw1dmh1Ta+Gf+QKYRCrwNjsMGHmmhpDrXsfJtu5
 eDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NQEVJMpf00c85p4M6QMwTRpg4xKJNRVJNpmBN5hc4C8=;
 b=7GxDtPH+oLRowAlUc1S4gFBD6L/A/wFf9vue1U6f9Y22i47Wbm+LSW5HoBppDtqPTS
 mCV8EC+Rg/1+3n0DdBouKZiWRVav6YxUHWy2qc6jHhw2GC2W9g6krm7bagZZrtzJ5hb8
 vLU0uT1MAqRkb25c7rvQJXNYffQf0u/Dga0Wan6QugvizzFmYH981tuWLEfg6k9sNR/h
 NnIKvjrB+uowqeiH7G1j6s79dkwJCgWix/H+jatPBHcc58LvSTT7ejxh/dicokJtGNOp
 65LQyYW40SGevfeD/3+TFuZ3y4ma4vP2l9Tcqixm5U5FpPiMDBEy7bYrEfaUlxvRik6s
 KjPg==
X-Gm-Message-State: AO0yUKUYpdvAh7nz079o0ecryoDU4fJdl7Av4pZVlPR1gYwBGxrP8N3d
 LCvyU8KfhSp1WT1QK9bp4o2hrQ==
X-Google-Smtp-Source: AK7set8VCL3qvHPaOePwfu9PekPVoyDJIfEyISc30g6glBbPr1rOtSMWYywBxaz2ahlQbsNwHe5h5w==
X-Received: by 2002:a05:6a20:69a4:b0:cd:6172:3b6 with SMTP id
 t36-20020a056a2069a400b000cd617203b6mr391606pzk.33.1677523253579; 
 Mon, 27 Feb 2023 10:40:53 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 n7-20020a6543c7000000b00502f9fba637sm4206545pgp.68.2023.02.27.10.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 10:40:53 -0800 (PST)
Message-ID: <5b3120cd-ddfb-770b-3216-0f02e89c9c24@linaro.org>
Date: Mon, 27 Feb 2023 08:40:50 -1000
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
 <c5913a52-e5de-4fb5-688c-6d3fb3215353@linaro.org>
 <5ce46e81-b2c3-8b45-1bd9-9705520f4557@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5ce46e81-b2c3-8b45-1bd9-9705520f4557@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/27/23 02:55, gaosong wrote:
> 
> 在 2023/2/25 上午3:24, Richard Henderson 写道:
>>>          {
>>>              .fniv = gen_vaddwev_s,
>>>              .fno = gen_helper_vaddwev_q_d,
>>>              .opt_opc = vecop_list,
>>>              .vece = MO_128
>>>          },
>>
>> There are no 128-bit vector operations; you'll need to do this one differently.
>>
>> Presumably just load the two 64-bit elements, sign-extend into 128-bits, add with 
>> tcg_gen_add2_i64, and store the two 64-bit elements as output.  But that won't fit into 
>> the tcg_gen_gvec_3 interface.
>>
> 'sign-extend into 128-bits,'   Could you give a example?

Well, for vadd, as the example we have been using:

     tcg_gen_ld_i64(lo1, cpu_env, offsetof(vector_reg[A].lo));
     tcg_gen_ld_i64(lo2, cpu_env, offsetof(vector_reg[B].lo));
     tcg_gen_sari_i64(hi1, lo1, 63);
     tcg_gen_sari_i64(hi2, lo2, 63);
     tcg_gen_add2_i64(lo1, hi1, lo1, hi1, lo2, hi2);
     tcg_gen_st_i64(lo1, cpu_env, offsetof(vector_reg[R].lo));
     tcg_gen_st_i64(hi1, cpu_env, offsetof(vector_reg[R].hi));

The middle two sari operations replicate the sign bit across the entire high word, so the 
pair of variables constitute a sign-extended 128-bit value.

> I see a example at target/ppc/translate/vmx-impl.c.inc
>      static bool do_vx_vprtyb(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
>      {
>              ...
>              {
>              .fno = gen_helper_VPRTYBQ,
>              .vece = MO_128
>              },
>              tcg_gen_gvec_2(avr_full_offset(a->vrt), avr_full_offset(a->vrb),
>                                 16, 16, &op[vece - MO_32]);
>          return true;
>      }
> TRANS(VPRTYBQ, do_vx_vprtyb, MO_128)
> ...
> 
> do_vx_vprtyb  fit the fno into the tcg_gen_gvec_2.
> I am not sure this  example is right.

Ah, well.  When .fno is the only callback, the implementation is entirely out-of-line, and 
the .vece member is not used.  I see that is confusing.


r~


