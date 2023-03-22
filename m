Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A056C4AC3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexhE-000660-9b; Wed, 22 Mar 2023 08:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pexh8-00065p-Fk
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:35:58 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pexh4-0001uR-Ue
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:35:57 -0400
Received: by mail-pj1-x102f.google.com with SMTP id q102so3865608pjq.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679488553;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CMrwvN0BAXB2xXw/HTXeGGGmFZ/RomnJdR4qs7/y/6A=;
 b=kOt/IKZAvWJw0ZGylWTEeJW3D/uMviC1HXa9+XRfy6+XGEmmUM2JtCvoYFskmsHQfO
 GOMKSUGHYNXvVuowvOltXtNC7+qh3hE+l8z5J45hJz9N2BaYKjGC2IhIzEecH+/IOg/b
 Kgl5XZcFLh9DKiVSrWB1G1XHSLcAUQykdyFLpzTkvdQRqHGxxMQiDFG8JiaBmr5zKLAO
 NLEbMvsj0UzXAgkt5VNPkA/21O6UmvJZPi+DmbJIzSWS4wimEnz2Cjx8XcQLRfxCDDUV
 GdUSsKOX1XUGlGLuPE8t3R7SvR/YD3DxO7pExMisSoPhNskGvh6PN37kTZMdqoEYyK8E
 TlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679488553;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CMrwvN0BAXB2xXw/HTXeGGGmFZ/RomnJdR4qs7/y/6A=;
 b=C+GLhtzkRhgtc7stPd1A619SDUR9TwnK6PtTCiRirvUJAli9pdFwKa2GFFwz0uQoMf
 eiAF1h4yjy/dmpQbp1ewlTQWuWRTFFAc1gGaKPz5AWKY+wgBOoM7ksB1GKUgYzcfoaFw
 RwUGHwjOrHO59/GkhAyfknRzlgLGfM7ZsFVU+Dcv37pdKol4wJHDkZeCEarJIYUBXalX
 AZEVhqED9W5oLvtH3qcCrn8zZfYvtJDaF0+XVJ4dnzVHVv1yOhsKfmPT44ibZnAWMWrt
 EtDAqQ/dXWs5gwHVjzaa5OZwxCGiPWZ58Fw+J+DmEFw+bpkrWplW30YPoeeSZly8FGrc
 9LrQ==
X-Gm-Message-State: AO0yUKWkdyJFBnKJZgnaIisgEofTrvgwHP9H/jdZh3NjfDYRSe0FcLXM
 AuOR9tvYXmtZK0dZaxr6KTtEzQ==
X-Google-Smtp-Source: AK7set+GKVrOCmL9ACslsfy6ZuyDjamOIJygo8HeP0zQxsoM7OqCII0rTBoLFCZhk1//qGzo2+2EVg==
X-Received: by 2002:a05:6a20:6d12:b0:d9:d1e6:829d with SMTP id
 fv18-20020a056a206d1200b000d9d1e6829dmr4423219pzb.49.1679488553294; 
 Wed, 22 Mar 2023 05:35:53 -0700 (PDT)
Received: from [192.168.7.32] (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 a17-20020aa780d1000000b0062814f38d33sm3088405pfn.170.2023.03.22.05.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 05:35:52 -0700 (PDT)
Message-ID: <00c6ce77-6b50-2043-2fee-603a678e3f49@linaro.org>
Date: Wed, 22 Mar 2023 05:35:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 40/43] target/loongarch: Implement vreplve vpack vpick
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-41-gaosong@loongson.cn>
 <f47ae8f2-9563-750a-d190-d6ad90600be6@linaro.org>
 <9191ffdb-9bd7-97f4-232b-fa8f5f4d240c@loongson.cn>
 <5fa5ed5d-b263-ddeb-7f97-e25a56bd27cb@linaro.org>
 <ed23677d-da3d-a04d-9460-1504da02028c@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ed23677d-da3d-a04d-9460-1504da02028c@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 3/22/23 01:32, gaosong wrote:
> 
> 在 2023/3/21 下午11:55, Richard Henderson 写道:
>> On 3/21/23 04:31, gaosong wrote:
>>> but for this case.
>>> e.g
>>> vreplve_b  vd vj, rk
>>> index  = gpr[rk] % (128/8);
>>> Vd->B(i) = Vj->B(index);
>>> tcg_gen_gvec_dup_mem(MO_8, vreg_full_offset(a->vd), offsetof(CPULoongArchState, 
>>> fpr[a->vj].vreg.B(index))), 16, 16 );
>>>
>>> How can we get the index with cpu_env? or  need env->gpr[rk]?
>>> The index type is not TCGv.
>>
>> For this case you would load the value Vj->B(index) into a TCGv_i32,
>>
>>     tcg_gen_andi_i64(t0, gpr_src(rk), 15);
>>
>>     // Handle endian adjustment on t0, e.g. xor 15 for big-endian?
>>
>>     tcg_gen_trunc_i64_ptr(t1, t0);
>>     tcg_gen_add_ptr(t1, t1, cpu_env);
>>     tcg_gen_ld8u_i32(t2, t1, vreg_full_offset(vj));
>>
>>     // At this point t2 contains Vj->B(index)
>>
>>     tcg_gen_gvec_dup_i32(MO_8, vreg_full_offset(vd), 16, 16, t2);
>>
>>
> It's weird. this is no problem  for vreplve_b,   but for vreplve_h/w/d is not correct.
> 
> e.g vreplve h
> index = gpr[rk] % 8
> Vd->H(i) = Vj->H(index);
> 
> like this:
> {
>      tcg_gen_andi_i64(t0, gpr_src(ctx, a->rk, EXT_NONE), 7);
>      if (HOST_BIG_ENDIAN) {
>          tcg_gen_xori_i64(t0, t0, 7);
>      }
> 
>      tcg_gen_trunc_i64_ptr(t1, t0);
>      tcg_gen_add_ptr(t1, t1, cpu_env);
>      tcg_gen_ld16u_i32(t2, t1, vreg_full_offset(a->vj));
>      tcg_gen_gvec_dup_i32(MO_16, vreg_full_offset(a->vd), 16, 16, t2);
> }
> 
> vreplve.h    vr25,  vr31, r30
>    r30    : 000000007aab5617
>    v31    : {efd0efc1efd0efc1, efd0efc1efd0efc1}
> result:  {efd0efd0efd0efd0, efd0efd0efd0efd0},
> and we get result is :  {c1efc1efc1efc1ef, c1efc1efc1efc1ef}.
> my host is little-endian.

You forgot to shift the index left by one bit, to turn H index into byte offset.


r~

