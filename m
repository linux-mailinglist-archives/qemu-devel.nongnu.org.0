Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3386D2E47
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:04:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTP4-0007vR-NL; Sat, 01 Apr 2023 01:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTP2-0007vF-L3
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:03:48 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTP0-0005bu-Sf
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:03:48 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ml21so694854pjb.4
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680325425;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WnYo5vRuFtlkJICGsWk3bQqW1PHVRVQz8ShfxiR8bIo=;
 b=HV2JY2dXqjOvm6uCVgrlo2peAdMxJhtZJzFSuPY9QKaoxYi75IIwR6UhAs1HqrCZQZ
 dr+W1AifPX0hbale4hV2xDk7o+/Su3GZmzvfwfwA/m674bldnzIlfGmBjOn6ZTgMua0W
 cMzsKETwJ9ptyzl508pVHHPwpXEgaZdYsgSZHPo4TGJaNeopRCV4Ijc6NM3CcEE69Voq
 n0e9v0ThNFFSXefGOx3c+PnnHkF4j78lcHeslJY7TpVHckxL7Rg3t4GHyYQYXj0EGHHb
 roVWvUQDaKNPYxY4xaoA3+H72PZp+C72nsFvSXzDA6/qzF9xlJHp2dIf9MhxNckGf2Cs
 xv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680325425;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WnYo5vRuFtlkJICGsWk3bQqW1PHVRVQz8ShfxiR8bIo=;
 b=d4S7SC+0W5kD1bmtCyTM6K5b6tQTQv33tSELbIJtACrOEXllnjJgaUn8zFOSiv66Hi
 lkoIRl8Zpdp0NpgtnFV/QEP3W5yboFVDkiy/SQVtsKG4TsPkPFAtsiVPF5MGJ18jESJW
 s+XlWOmNO/Wdu6YayQ+POpciThCKCjsm5mU1TrUZ2swQTNtan3V1KS7EPalR8uQJ3QMX
 SRUMKWTQnlbF2LqbutZEggR6S5gK2hqlsqpV2Xtp+HibxKjvmCifCPCZ29pqTP1cdcgd
 FGeJG75zLoO4Qvt5xUgGd8U9q2DGYTdSDCyWtQmrbzAPEPiDWeCEtMxcBYynJweft3il
 U/Xw==
X-Gm-Message-State: AO0yUKV8+SCAiSf9adeGwt1HMZiCczY0Z3bMH8s7cPkiLrAhnF5vrWFX
 aQJF9d//0KtQ5kFe4nnMDoHgdg==
X-Google-Smtp-Source: AK7set/ze6Ls3qy3N2ThJfb8vm916124B4P8vaewblFLX8Q07IMPe/tZR4nXqii/jb1jhVSMOlx5OQ==
X-Received: by 2002:a05:6a20:1e5f:b0:d8:fd3b:f1ba with SMTP id
 cy31-20020a056a201e5f00b000d8fd3bf1bamr27604689pzb.3.1680325425235; 
 Fri, 31 Mar 2023 22:03:45 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 e11-20020aa7824b000000b0062dd1c0cbe7sm2667714pfn.71.2023.03.31.22.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:03:44 -0700 (PDT)
Message-ID: <c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org>
Date: Fri, 31 Mar 2023 22:03:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 18/44] target/loongarch: Implement vsat
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-19-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-19-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
> +static void gen_vsat_s(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
> +{
> +    TCGv_vec t1;
> +    int64_t max  = (1l << imm) - 1;

This needed 1ull, but better to just use

     max = MAKE_64BIT_MASK(0, imm - 1);

> +    int64_t min =  ~max;

Extra space.

> +    t1 = tcg_temp_new_vec_matching(t);
> +    tcg_gen_dupi_vec(vece, t, min);
> +    tcg_gen_smax_vec(vece, t, a, t);

Use tcg_constant_vec_matching(t, vece, min) instead of dupi.
Three instances.

> +    tcg_gen_dupi_vec(vece, t1, max);
> +    tcg_gen_smin_vec(vece, t, t, t1);
> +}
> +
> +static void do_vsat_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
> +                      int64_t imm, uint32_t oprsz, uint32_t maxsz)
> +{
> +    static const TCGOpcode vecop_list[] = {
> +        INDEX_op_smax_vec, INDEX_op_smin_vec, 0
> +        };
> +    static const GVecGen2i op[4] = {
> +        {
> +            .fniv = gen_vsat_s,
> +            .fnoi = gen_helper_vsat_b,
> +            .opt_opc = vecop_list,
> +            .vece = MO_8
> +        },
> +        {
> +            .fniv = gen_vsat_s,
> +            .fnoi = gen_helper_vsat_h,
> +            .opt_opc = vecop_list,
> +            .vece = MO_16
> +        },
> +        {
> +            .fniv = gen_vsat_s,
> +            .fnoi = gen_helper_vsat_w,
> +            .opt_opc = vecop_list,
> +            .vece = MO_32
> +        },
> +        {
> +            .fniv = gen_vsat_s,
> +            .fnoi = gen_helper_vsat_d,
> +            .opt_opc = vecop_list,
> +            .vece = MO_64
> +        },
> +    };
> +
> +    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);

Better to expand imm to max here, rather than both inside gen_vsat_s and the runtime 
do_vsats_*.

Likewise for the unsigned versions.


r~

