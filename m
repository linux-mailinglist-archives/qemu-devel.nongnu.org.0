Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C054F387B5C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:39:15 +0200 (CEST)
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0sM-0007da-S2
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0mH-0006aT-RK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:32:59 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:47043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0m9-0004Ot-5k
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:32:55 -0400
Received: by mail-ua1-x92a.google.com with SMTP id d30so3284157uae.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x2AfLO4Uwu6DTFqmhDerETQ2TP1M+4CRleepW43YVRY=;
 b=cxixVzlP/pImBgyN1ExKjKkIazIdtuG2tklNS2dssYmxqQMLFB5PY+eIdiBXxXVDNv
 tSVZwiu9HUEuLo8R/moY/+vWPoVmX1ckYADiohHv9NaCwp2dYPSJ2V0n923gqf7UyZEe
 fLTiMbeJBDdZcuVQc9DrbjvnvOwSAqmrX1iUau3fNlAY9IWBKJxOa6tXE/JM6JW9zowh
 20fSHaseYfIJ6/bSSGsr3UIlIrL9/OIz4Xeduf4BFMzVXN/Lj/vdVhFLLA6cnzo5cBE4
 Ce8DJGb2mZ0eCvC+5fSNRxbpTjcvUj8qz7SbINQFeqmNREn+44hJzq8OsTzVfzeU9ooe
 qCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x2AfLO4Uwu6DTFqmhDerETQ2TP1M+4CRleepW43YVRY=;
 b=mEgbYfIc+nIHgU+JUTdvMyhqVs2spE7C3c0eP93KpTk2Xm871gdUGK7m76GzRDpZFq
 xK0BjBgNHbBgVSSVBzZO5BSUMWE75U0ZizP4pgoyBIqUV6D3Qkz1cBxftuHXMBQ5a4Gi
 MMSuPc9/xd3e93mSjsD/6muEazLMixChfwwL9HQ0TCobTQSZPpSSbm7eQem3huC192bR
 ru53NEKo4hLHADz5RSJI++ul1bQ+/T7bu6q9e0lQTDYup4/LcU02KaCnb5G+y0pvCfJh
 gecZKA3JEWHlr8lyuXcvlSD/a80JY4wqKOt0Cvkw0cfNrlGRI6M+Bk3FadkLRTKFdeSz
 U7Sw==
X-Gm-Message-State: AOAM533Vs/gy4uqhyXxbb2ysjZdBvcfdzeH4vbHEVCPVZBHQOXiBMWAp
 wGcgliRtQ+Wg27gSCIEQLkEijQ==
X-Google-Smtp-Source: ABdhPJzbjA4GvPiJeh416rRjptqrsTMcikOUqmIpPkkjSDBbXFpOWrPwq9dRsak7owbQj/8ddLpfsA==
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr6617257uam.5.1621348366986;
 Tue, 18 May 2021 07:32:46 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id g3sm2838226vkk.11.2021.05.18.07.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:32:46 -0700 (PDT)
Subject: Re: [PATCH v1 04/11] target/arm: Implement vector float32 to bfloat16
 conversion
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-5-richard.henderson@linaro.org>
 <CAFEAcA_PwL-_=7REb_cCLtKK+=Un__ynVEus3GEoSi5p_c3caw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c24f77dd-9f58-3698-596e-778e08be84ff@linaro.org>
Date: Tue, 18 May 2021 09:32:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PwL-_=7REb_cCLtKK+=Un__ynVEus3GEoSi5p_c3caw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x92a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 6:10 AM, Peter Maydell wrote:
> On Sat, 17 Apr 2021 at 01:03, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is BFCVT{N,T} for both AArch64 AdvSIMD and SVE,
>> and VCVT.BF16.F32 for AArch32 NEON.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -7567,6 +7568,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
>>   }
>>
>>   DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
>> +DO_FCVTNT(sve_bfcvtnt,    uint32_t, uint16_t, H1_4, H1_2, float32_to_bfloat16)
>>   DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
> 
> Not related to this patch, but are the H macros for sve2_fcvtnt_ds definitely
> right? Just noticed they're the same as the ones being used for the f32->f16
> helpers despite the types being different sizes.

Definitely wrong, and now fixed in the sve2 patch set (need to fix some 
regressions there before re-posting).

>> +    if (!dc_isar_feature(aa32_bf16, s)) {
>> +        return false;
>> +    }
> 
> Do we need to also check ARM_FEATURE_NEON here ?

Hmm, I dunno.  Since FEAT_AA32BF16 has both VFP and NEON instructions, I guess 
we could turn off one without the other.

I'll add it.


r~

