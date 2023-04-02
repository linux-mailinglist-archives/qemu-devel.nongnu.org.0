Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03C6D359A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 07:28:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piqFm-0002vN-UM; Sun, 02 Apr 2023 01:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piqFf-0002v4-NI
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:27:40 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piqFe-0001gR-6B
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:27:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so27484709pjt.5
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 22:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680413256;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5NuQnEkzDpotFrngQ8AUV9bKwC5AtERXqy9pvP7+a+A=;
 b=LDWOUbpOqywT1h54Dqj1JU0CioWH5+1+LLWClsVGWFo/BWlR8oVdYQb7ah37DOoiGp
 YIp5835siIMEHnOQDyDCZf0PtfdizCTaRjD7VGKMvhXnyuUNQNRHAo61KQox4uszz5SJ
 j3KfI4YHMaAUSe0JQ/ZRSuyAUfI4jXXJKV+TEdwaBYbCLX+rOhOPmTpWI8I1tv3n7wTe
 u1Gk0GRXc76hMRZ02Gln5aDAZp+OEnlqR84NA/ki2E8BqbZyeTytvoePGUdQAYRHX4SO
 Vmwck46gwC8dVL2NQgl8uLxPtrz8JghOP6nokQtthk8W92pECc1GpFvt4hetI3jgrSTI
 wQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680413256;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5NuQnEkzDpotFrngQ8AUV9bKwC5AtERXqy9pvP7+a+A=;
 b=jHukby4uHPUvmVC6BBwX+ddUlcbJn4WYxHM2lzvSKyjAjSHja2IeLRZ+PmieIm2O/v
 58YjJfsKbuXm14KVKGcMi94mGIpaISkqZ/v9z6J79dgiQn0Bn+ExrK+/nOot638xNdI9
 Xw193qMSWwl+aRkpXmZsTxZ6CNrtDVbESCps7y2er+O9wV0DS5v35JMiSwOiWaP1GkUE
 0/fbZCXkO3V+AQfZIHKJzadVLGolF7ZxKLEW62oPG+DDf54S6YtV+nUn77x6NXrYcjY1
 AHFOGfuA1Xo/curODWCOTkanA9ybZ6tFOSH0TRF493qQK9UtlgguBgqfpOZU6cGB2Jrw
 0YwQ==
X-Gm-Message-State: AAQBX9fNiFq2nhPVJhVUGNl0e+wGT3K+spYimF5LD3xKZBh+xC2zBJKM
 xBe+ixbZfRCx3Cgc5PeFtOIiCg==
X-Google-Smtp-Source: AKy350ZI4J7BST77Se2ypewNQtFWhXd1Uxis93DgOwsBvxYv1WUyFlmLmKdYCWMhrfC0J6Q+erl4KA==
X-Received: by 2002:a17:903:22d2:b0:1a1:a0b7:7254 with SMTP id
 y18-20020a17090322d200b001a1a0b77254mr40009281plg.62.1680413256137; 
 Sat, 01 Apr 2023 22:27:36 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170902dac600b0019c2cf12d15sm4179460plx.116.2023.04.01.22.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 22:27:35 -0700 (PDT)
Message-ID: <dd87fdba-9820-bb51-744a-aed2f976ef7f@linaro.org>
Date: Sat, 1 Apr 2023 22:27:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 36/44] target/loongarch: Implement vseq vsle vslt
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-37-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-37-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
> +static bool do_cmp(DisasContext *ctx, arg_vvv *a, MemOp mop, TCGCond cond,
> +                   void (*func)(TCGCond, unsigned, uint32_t, uint32_t,
> +                                uint32_t, uint32_t, uint32_t))
> +{
> +    uint32_t vd_ofs, vj_ofs, vk_ofs;
> +
> +    CHECK_SXE;
> +
> +    vd_ofs = vreg_full_offset(a->vd);
> +    vj_ofs = vreg_full_offset(a->vj);
> +    vk_ofs = vreg_full_offset(a->vk);
> +
> +    func(cond, mop, vd_ofs, vj_ofs, vk_ofs, 16, 16);

You always pass tcg_gen_cmp_vec.

> +static void do_cmpi_vec(TCGCond cond,
> +                        unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
> +{
> +    TCGv_vec t1;
> +
> +    t1 = tcg_temp_new_vec_matching(t);
> +    tcg_gen_dupi_vec(vece, t1, imm);

tcg_constant_vec_matching.


r~

