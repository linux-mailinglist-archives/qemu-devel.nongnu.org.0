Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116CC4381DC
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 06:38:49 +0200 (CEST)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me8nv-0003vn-KZ
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 00:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8ms-000375-GJ
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:37:43 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8mq-0007g8-Fo
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:37:42 -0400
Received: by mail-pl1-x630.google.com with SMTP id c4so225722plg.13
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 21:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q4+qm2rIXxBok22aqD/lD5kDry1YqJeOF+Hqo0lkMAg=;
 b=PPP3yM93/GTCO2NOj8MHmJSe1i3A3rGWeDHMfqghmN0fnKyIp4Kwhi4OEZyg2Quh68
 QA24/wdKmvakLJl6AQ7twlzn0Ubac6OYKKgHcOMv8lhKwYTJi2y1H2WYUwPAUzpMVV8V
 cOxz7fuHpnExT3oY3kR1PE0bpNEtaLByucIOARfBQaytA0Wy/eQ3ZQhb2yZncGaG9r5L
 HwLHlAluRFC7vACmxTrpY30EeXOoADgwAEclI0M61KLnWqgm5dcVXKM2LcsePX2mgqkv
 62iv5aCPnHp7FwH2+otme4J4hCSg72r0m4nvsVPKxt2vqLNtjWr/sfVURCY5wsbOUWTV
 AGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q4+qm2rIXxBok22aqD/lD5kDry1YqJeOF+Hqo0lkMAg=;
 b=f8XWyp8Z4g9dW4I1QAAvElU1z9T7RdWlYTVTIJUo1+oXEDFfv/f2oO7nEIIMczgYAJ
 S2/XHjH9kvC+SeBbGxt2jfKlZMx6a2FGehCfLbRxPK6iAkRRhzlE37wlbp0Y76rCgydD
 +VbD6OydJybihL1UrvJtq6V3AuBr/5/Mn4Ke8lxYCN2phvYU/B7I+7BFH8QtuzqeckdN
 LDQFlxqdCqManOIU1qmKE4yXURFgWI1wBW8SJHsOIIKHPXfRbOsVwcLZnnverL4THOHD
 B4m63xk5urkQajdmZplBoKjhBFZGRcBjA61GpPlwDYy7J/flA24UOCpFd7MsnWYkrl8F
 Aw5A==
X-Gm-Message-State: AOAM530vL6hJvez5kKDMvc7MDguE5U5pgqlc0H7uyWqr4OpQwwLBUr4F
 Gg5ZjHatCZpj5KS5/xvqvhZZoQ==
X-Google-Smtp-Source: ABdhPJzN9iwYU60U3tORi++MYF0SUD3KKB4s7bacPYeCDxIf4aFiKXHuQH3JvF3Rjx8gkSHU2CETjw==
X-Received: by 2002:a17:90b:3749:: with SMTP id
 ne9mr19609225pjb.192.1634963858769; 
 Fri, 22 Oct 2021 21:37:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t3sm9711640pgu.87.2021.10.22.21.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 21:37:38 -0700 (PDT)
Subject: Re: [PATCH 15/33] target/ppc: Implement Vector Insert from GPR using
 GPR index insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-16-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d768980-e69e-7aa8-3aab-55a87b9f9950@linaro.org>
Date: Fri, 22 Oct 2021 21:37:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-16-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +#if defined(HOST_WORDS_BIGENDIAN)
> +#define ELEM_ADDR(VEC, IDX, SIZE) (&(VEC)->VsrB(IDX))
> +#else
> +#define ELEM_ADDR(VEC, IDX, SIZE) (&(VEC)->VsrB(IDX) - (SIZE) + 1)
> +#endif

This is a bit confusing.  There's host adjustment in VsrB *and* here.

> +#define VINSX(SUFFIX, TYPE) \
> +void glue(glue(helper_VINS, SUFFIX), LX)(CPUPPCState *env, ppc_avr_t *t,       \
> +                                         uint64_t val, target_ulong index)     \
> +{                                                                              \
> +    const int maxidx = ARRAY_SIZE(t->u8) - sizeof(TYPE);                       \
> +    target_long idx = index;                                                   \
> +                                                                               \
> +    if (idx < 0 || idx > maxidx) {                                             \
> +        char c = idx < 0 ? 'R' : 'L';                                          \
> +        idx =  idx < 0 ? sizeof(TYPE) - idx : idx;                             \
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS" #SUFFIX "%cX"  \
> +                      " at 0x" TARGET_FMT_lx ", RA = " TARGET_FMT_ld " > %d\n",\
> +                      c, env->nip, idx, maxidx);                               \

nip is not up to date.

> +    } else {                                                                   \
> +        *(TYPE *)ELEM_ADDR(t, idx, sizeof(TYPE)) = (TYPE)val;                  \

This is a potentially misaligned store.  You need st*_he_p. 
 
 



r~

