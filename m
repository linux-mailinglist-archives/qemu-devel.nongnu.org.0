Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6024C1E52
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:16:02 +0100 (CET)
Received: from localhost ([::1]:39800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMzvV-00021G-1F
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:16:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMzsd-0008C4-GN
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:13:03 -0500
Received: from [2607:f8b0:4864:20::1033] (port=36566
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMzsZ-0006Wq-CC
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:13:03 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso3961739pjk.1
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jZbwozJWx+rmj3JyP+jtP8sb3jTjrAsw17x5WS8uQrY=;
 b=MIDPx+r/nuhREcgfP8eDfoa9oTkxPtLpDtbr9+aNIjbU4XrBln8jrOwStIricvfYaJ
 VzpXVRH+e3IebcK6BRxLzHZgVZQG5JUfdQkPv1jfp1szSZu899zTcNaHspaySzQD+Ph+
 7iaDD01DPaMbb7/FGGgvVqV3aE/ztvS0/vkpXWFf1FSCaN282g1uJo2b/pIcgyhmpNyC
 GXXeNw0okYNfldWVdD1VPjswSUaJDnSa7YjuJYTEgunfcJ1g5Y5bjKeTLGtUwJgO09jg
 iUd0ofAdcmRFtbfIy2zo5UcnBME5RBje+hIXYZNJ0XV0U1mL8rQBIMyBV5s3DAwUTejZ
 K6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jZbwozJWx+rmj3JyP+jtP8sb3jTjrAsw17x5WS8uQrY=;
 b=oipzuvOup5IYt0Q+h/YniQobiZ5dPSUq34Y+SPDyDk39ddbVZEA+zM1HNr9JhSRiXL
 yOoDgFrN9MkQz66zVEmoAjBt5xGJduWGB+PqcbZMfI7crQRcWgXKE7qe4dADspbnbOX9
 UEh3Oj6H03UFzwV0lMZ0+rWnr5Vu5tO7RHJZIcdI+VciX4zL8sRap8Do/TB5gD+ywum3
 RA27w8dpWG5woO/qMTMFfjro7q6N2DVY03mxOr07HucQNHe5B2ea9vqNOzEXCCzOUy4u
 RJK2JNetXV0kvm9RNgpqxJ/qcTsJMQEixtwpE50bWIFsXuvtlkyGTxguDQ/zFbXmAzhI
 1aHA==
X-Gm-Message-State: AOAM5339Zcywl1dVOJndNcpePMCC5iLZN0sh2cQUiQFpEXZDKkR5vncr
 OJajC865gkHxToXPBDj/rw7Ezw==
X-Google-Smtp-Source: ABdhPJxF1GQNN2f/NFNOR+8HFgMgxn4giAlIghffsq+DzG5n4xCL1wqg+xQ9bNxWcD/ZIpL5XSWgMg==
X-Received: by 2002:a17:90b:1b45:b0:1bb:f956:4799 with SMTP id
 nv5-20020a17090b1b4500b001bbf9564799mr1467276pjb.132.1645654377860; 
 Wed, 23 Feb 2022 14:12:57 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id k11sm513672pff.169.2022.02.23.14.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 14:12:57 -0800 (PST)
Message-ID: <7f1caabb-997a-86a3-97ff-e89db93cc424@linaro.org>
Date: Wed, 23 Feb 2022 12:12:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 20/47] target/ppc: implement vslq
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-21-matheus.ferst@eldorado.org.br>
 <42d348af-e15c-00e4-8670-a2a17902b9e8@linaro.org>
 <da1eab47-8c32-ef20-a7e9-e9c7d5bcc094@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <da1eab47-8c32-ef20-a7e9-e9c7d5bcc094@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 11:53, Matheus K. Ferst wrote:
> On 22/02/2022 19:14, Richard Henderson wrote:
>> On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>> v4:
>>>   -  New in v4.
>>> ---
>>>   target/ppc/insn32.decode            |  1 +
>>>   target/ppc/translate/vmx-impl.c.inc | 40 +++++++++++++++++++++++++++++
>>>   2 files changed, 41 insertions(+)
>>>
>>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>>> index 88baebe35e..3799065508 100644
>>> --- a/target/ppc/insn32.decode
>>> +++ b/target/ppc/insn32.decode
>>> @@ -473,6 +473,7 @@ VSLB            000100 ..... ..... ..... 00100000100    @VX
>>>   VSLH            000100 ..... ..... ..... 00101000100    @VX
>>>   VSLW            000100 ..... ..... ..... 00110000100    @VX
>>>   VSLD            000100 ..... ..... ..... 10111000100    @VX
>>> +VSLQ            000100 ..... ..... ..... 00100000101    @VX
>>>
>>>   VSRB            000100 ..... ..... ..... 01000000100    @VX
>>>   VSRH            000100 ..... ..... ..... 01001000100    @VX
>>> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
>>> index ec4f0e7654..ca98a545ef 100644
>>> --- a/target/ppc/translate/vmx-impl.c.inc
>>> +++ b/target/ppc/translate/vmx-impl.c.inc
>>> @@ -834,6 +834,46 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_16, 
>>> tcg_gen_gvec_sarv);
>>>   TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv);
>>>   TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_sarv);
>>>
>>> +static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
>>> +{
>>> +    TCGv_i64 hi, lo, tmp, n, sf = tcg_constant_i64(64);
>>> +
>>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
>>> +    REQUIRE_VECTOR(ctx);
>>> +
>>> +    n = tcg_temp_new_i64();
>>> +    hi = tcg_temp_new_i64();
>>> +    lo = tcg_temp_new_i64();
>>> +    tmp = tcg_const_i64(0);
>>> +
>>> +    get_avr64(lo, a->vra, false);
>>> +    get_avr64(hi, a->vra, true);
>>> +
>>> +    get_avr64(n, a->vrb, true);
>>> +    tcg_gen_andi_i64(n, n, 0x7F);
>>> +
>>> +    tcg_gen_movcond_i64(TCG_COND_GE, hi, n, sf, lo, hi);
>>> +    tcg_gen_movcond_i64(TCG_COND_GE, lo, n, sf, tmp, lo);
>>
>> Since you have to mask twice anyway, better use (n & 64) != 0.
>>
> 
> Hmm, I'm not sure if I understood. To check != 0 we'll need a temp to hold n&64. We could 
> use tmp here, but we'll need another one in patch 22. Is that right?

Yes.

r~

