Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB96E7818
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 13:08:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp5eU-0007oi-SM; Wed, 19 Apr 2023 07:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pp5eS-0007oG-QJ
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:07:04 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pp5eQ-00033v-41
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:07:04 -0400
Received: by mail-ej1-x636.google.com with SMTP id c9so41730885ejz.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681902419; x=1684494419;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g/4EPFCv6Ar1Kw76aKLczv1IXr5EU/k/yoNw/EVCgM4=;
 b=U7guaW+E1f+YWZT78H9vj6zZVVWwHt3SjNTiXk1Ce/oqZGIcEIc046VZkpu+yt96I4
 cquOJtiGHxDxQGfSLmUGNB/V+Zc2zpyMAoMK2LgNInFnjcwauxji/QBkT1ihcbFI6HsB
 Ljs/00qPJmTjejb2FlffzJJ/quUL1Flpk+YyEesI4mbWf3Dky3gZWyTaKP9wkvOlDHBh
 NOAR4Sl14DLoCNwYrhNVLwNa94koaB1wUSPXKdO0je6X37Kep0w08HxNE+OqfK6WN5vB
 ZIXvBJcdQ6trTUKlS+utqHJ8+gEXGkWPnB8xW5+W1ikgLd1O74UdMAFKAyFwj7GsHTIa
 xGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681902419; x=1684494419;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g/4EPFCv6Ar1Kw76aKLczv1IXr5EU/k/yoNw/EVCgM4=;
 b=PPaX9Fi+aE8j0EfNd+Y09AqL//zXBcv3iUj7/yf8MheKHJG22fK1OQ9z87OkoXs3r7
 hpHEULX9AOzNsCcmm8E93sFUwq+lITlBi08QJztQYm+pO2xMWsE5E1ppQ+cj75jTCy4L
 mkjG2yVTvXRDF5BGviiZIhv3bmbV+KvaJXKESL7gt3YAax9yc/p1vg2x4hivPyYyT67l
 K3fEPMiWZ3dRhQjtUc7LwMC1gk2tWC6voy4XyOzKLKjSpahY2294XbTKRhg4mMAr4oLp
 Fx8POsYEXHz4xzdy85se08+a9mu/QCsvxzjDkF5qIRoR6ANVqXb9YKyO3++LDw7FfOfc
 E6TA==
X-Gm-Message-State: AAQBX9dQcB3075rR35Vz9ABz/TLRl/oyT1yIYiBBDbRv9ORjPthiRhIE
 pJ4tC9KM8nzwiDaKHGGfSknOYg==
X-Google-Smtp-Source: AKy350YCvWVJ+9ECVxFKnQa3vPTg9ge2HrsDsVEYfVsQmNxFzETH7fmvut86p0bn2Pd4HqfRiwa8Dg==
X-Received: by 2002:a17:906:504e:b0:94a:74b8:7b85 with SMTP id
 e14-20020a170906504e00b0094a74b87b85mr2628579ejk.6.1681902418927; 
 Wed, 19 Apr 2023 04:06:58 -0700 (PDT)
Received: from [10.47.4.64] ([109.190.253.13])
 by smtp.gmail.com with ESMTPSA id
 js16-20020a17090797d000b0095354acf666sm663997ejc.92.2023.04.19.04.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 04:06:58 -0700 (PDT)
Message-ID: <1f7e288d-4ada-0ccd-daa5-ba7309d085cf@linaro.org>
Date: Wed, 19 Apr 2023 13:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v2 18/44] target/loongarch: Implement vsat
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-19-gaosong@loongson.cn>
 <c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org>
 <ba63a23c-a1a0-c40e-6202-22ad9f7e2e5c@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ba63a23c-a1a0-c40e-6202-22ad9f7e2e5c@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 4/19/23 11:31, Song Gao wrote:
> 在 2023/4/1 下午1:03, Richard Henderson 写道:
>> Better to expand imm to max here, rather than both inside gen_vsat_s and the runtime 
>> do_vsats_*.
>>
>> Likewise for the unsigned versions. 
> 
> I tried to expand imm to max  here  for the unsigned versions.
> 
> {
> 
>      uint64_t max;
> 
>      ...
> 
>      static const GVecGen2i op[4] = {
>          {
>              //.fniv = gen_vsat_u,
>              .fnoi = gen_helper_vsat_bu,
>              .opt_opc = vecop_list,
>              .vece = MO_8
>          },
>          {
>              //.fniv = gen_vsat_u,
>              .fnoi = gen_helper_vsat_hu,
>              .opt_opc = vecop_list,
>              .vece = MO_16
>          },
>          {
>              //.fniv = gen_vsat_u,
>              .fnoi = gen_helper_vsat_wu,
>              .opt_opc = vecop_list,
>              .vece = MO_32
>          },
>          {
>              //.fniv = gen_vsat_u,
>              .fnoi = gen_helper_vsat_du,
>              .opt_opc = vecop_list,
>              .vece = MO_64
>          },
>      };
> 
>      max = (imm == 0x3f) ? UINT64_MAX : (1ull << (imm + 1)) - 1;
>      tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, max, &op[vece]);
> 
> }
> 
> 
> and  I got a tcg_debug_assert();
> 
> 
> Thread 1 "qemu-loongarch6" received signal SIGABRT, Aborted.
> 0x00007ffff60b337f in raise () from /lib64/libc.so.6
> (gdb) bt
> #0  0x00007ffff60b337f in raise () from /lib64/libc.so.6
> #1  0x00007ffff609ddb5 in abort () from /lib64/libc.so.6
> #2  0x00007ffff609dc89 in __assert_fail_base.cold.0 () from /lib64/libc.so.6
> #3  0x00007ffff60aba76 in __assert_fail () from /lib64/libc.so.6
> #4  0x0000555555632fcf in simd_desc (oprsz=16, maxsz=16, data=134217727) at 
> ../tcg/tcg-op-gvec.c:91

You should use tcg_gen_gvec_2s, and pass tcg_constant_i64(max).


r~

