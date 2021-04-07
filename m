Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A1635789F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 01:38:07 +0200 (CEST)
Received: from localhost ([::1]:36286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUHkM-0006q1-34
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 19:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUHiy-0006Pp-S7
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:36:41 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUHiw-0007mL-Vc
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:36:40 -0400
Received: by mail-pg1-x52f.google.com with SMTP id p12so16789pgj.10
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 16:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=61sqYPeeEgbD6wjgBardHLMqr1lFVMAMkGpymqf/7jQ=;
 b=OXdajk0n7a2zyaI+a91cF0Qe2zX2/AdOv7asBMtLqbMQRORHXVUu0UieQSHcEdpXIT
 CPethGucGgQ8q3oOGtgw1KQ5XexVhFM98RS52g+49P/CpiG0x22dvUAq5k/5adlKgwTT
 iESo4PF9NPzHK0DsIuH2PREjOcCBKyyIeNMGZ6utoX9PiCCltif/Tkhd3EqvTRVNLN7k
 GeCYpECE3gTSpzgirAnNC7ijNiY1f6jDndezwUE71+hELAc10L6/4Ch37/LHsUO8kPXu
 K6izejGKhNgk93o7tICG8peAEfbB0Ce89Vk0sDRY+W3vjj/FkjN1eiqSj7uoMQBcy6sp
 iG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=61sqYPeeEgbD6wjgBardHLMqr1lFVMAMkGpymqf/7jQ=;
 b=q5BWapOTzYW935+dZoHTwwjeSbP5C3ahW4lciOItrEOJuRtKMJNCsBdx/FQY8+NQEz
 OpcEkrsChCeR1Ew1i6J6auANRLt0potbyw3LvWrbgiFpenYJW0QWwQmfEhxSrF3Hq4a+
 P/FC8DtYP+Cq5vKwIXLRvu20qTYFx3ssEnJk70H6TxU4Q5tOPxc74DxLsujIvqQ/Oa1r
 qYeIGN2yZj8qBR3jwxkkEQObcpbfAKhVVGnQ4tQD9chKHfpIGN8ZkFtc7YOIrmy3E7Jg
 7RYZuyleu2xy3e8e19EfzNO2xs6BcbvLq1smwFCjbcik7Wd92SunZ4axFCCHP8P1oQTP
 TMdw==
X-Gm-Message-State: AOAM533yDjLXdKIMbVFWk3NGB5wYcssc899/IqjrihSo5NHpEunIJ71G
 1K+CO09DRat+ARoUekm+sUiNIA==
X-Google-Smtp-Source: ABdhPJwloxvQReN6PfTa93d2H/9mV2QSWPkKB9GzlW9h37yXkf5Vmb5GGKswvUk0F3FXKJVZqQ3qwQ==
X-Received: by 2002:a65:6907:: with SMTP id s7mr5461654pgq.296.1617838597138; 
 Wed, 07 Apr 2021 16:36:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x125sm21858236pfd.124.2021.04.07.16.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:36:36 -0700 (PDT)
Subject: Re: [PATCH 20/27] arcv3: TCG, decoder glue code and helper changes
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-21-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <129d4614-0970-04c6-35b4-3dcadcf619c2@linaro.org>
Date: Wed, 7 Apr 2021 16:36:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-21-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> +uint64_t helper_carry_add_flag32(uint64_t dest, uint64_t b, uint64_t c) {
> +    return carry_add_flag(dest, b, c, 32);
> +}
> +
> +target_ulong helper_overflow_add_flag32(target_ulong dest, target_ulong b, target_ulong c) {
> +    return overflow_add_flag(dest, b, c, 32);
> +}
> +
> +target_ulong helper_overflow_sub_flag32(target_ulong dest, target_ulong b, target_ulong c) {
> +    dest = dest & 0xffffffff;
> +    b = b & 0xffffffff;
> +    c = c & 0xffffffff;
> +    return overflow_sub_flag(dest, b, c, 32);
> +}

You shouldn't need to replicate these functions.  Use the correct types and 
masking in the first place.


> +uint64_t helper_rotate_left32(uint64_t orig, uint64_t n)
> +{
> +    uint64_t t;
> +    uint64_t dest = (orig << n) & ((0xffffffff << n) & 0xffffffff);
> +
> +    t = (orig >> (32 - n)) & ((1 << n) - 1);
> +    dest |= t;
> +
> +    return dest;
> +}
> +
> +uint64_t helper_rotate_right32(uint64_t orig, uint64_t n)
> +{
> +    uint64_t t;
> +    uint64_t dest = (orig >> n) & (0xffffffff >> n);
> +
> +    t = ((orig & ((1 << n) - 1)) << (32 - n));
> +    dest |= t;
> +
> +    return dest;
> +}

rol32 and ror32.

> +uint64_t helper_asr_32(uint64_t b, uint64_t c)
> +{
> +  uint64_t t;
> +  c = c & 31;
> +  t = b;
> +  for(int i = 0; i < c; i++) {
> +    t >>= 1;
> +    if((b & 0x80000000) != 0)
> +      t |= 0x80000000;
> +  }
> +      //t |= ((1 << (c+1)) - 1) << (32 - c);
> +
> +  return t;

Really?  I can't imagine what lead you to write this.
Who writes a simple shift operation with a loop?

Perhaps no helper at all and

   tcg_gen_sra_tl(ret, b, c);
   tcg_gen_ext32s_tl(ret, ret);


> +target_ulong helper_ffs32(CPUARCState *env, uint64_t src)
> +{
> +    int i;
> +    if (src == 0) {
> +      return 31;
> +    }
> +    for (i = 0; i <= 31; i++) {
> +      if (((src >> i) & 1) != 0) {
> +        break;
> +      }
> +    }
> +    return i;
> +}

tcg_gen_ori_tl(ret, src, MAKE_64BIT_MASK(32, 32));
tcg_gen_ctzi_tl(ret, ret, 31);

Though I really wonder if you've got that function correct, as it's not the 
*normal* definition of ffs...


> +target_ulong helper_norml(CPUARCState *env, uint64_t src1)
> +{
> +    int i;
> +    int64_t tmp = (int64_t) src1;
> +    if (tmp == 0 || tmp == -1) {
> +      return 0;
> +    }
> +    for (i = 0; i <= 63; i++) {
> +      if ((tmp >> i) == 0) {
> +          break;
> +      }
> +      if ((tmp >> i) == -1) {
> +          break;
> +      }
> +    }
> +    return i;
> +}

This is some cognate of count-leading-repititions-of-sign-bit, 
tcg_gen_clrsb_tl.  A decent computation should be like

   tcg_gen_clrsb_i64(ret, src);
   tcg_gen_subfi_i64(ret, 63, ret);


> diff --git a/target/arc/semfunc-v2_mapping.def b/target/arc/semfunc-v2_mapping.def
> new file mode 100644
> index 0000000000..ab8d9ff123
> --- /dev/null
> +++ b/target/arc/semfunc-v2_mapping.def

You could have named this properly to start.


r~

