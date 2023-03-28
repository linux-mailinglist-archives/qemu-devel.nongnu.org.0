Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473A6CC991
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:45:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDMY-0007Mf-T4; Tue, 28 Mar 2023 13:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phDMW-0007Ly-Al
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:44:00 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phDMU-0008TQ-Bj
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:43:59 -0400
Received: by mail-pl1-x632.google.com with SMTP id ja10so12440127plb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680025436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OXgeFj8HeZZWMYQ29opeCFN4mKNrMXlE/BhUqQhRi60=;
 b=GTi5S1OpGaJHYzB2QwQwi8aLpAc6k1aFr85xKro7FFc8mPcrMKFRKbO5EV5zhRahNJ
 sem7uixXtldpnBvjrM8ErFjMwpckDnrRCOJsCADZL74qzB+IAMg0MFBvmy2dU+/DDzQQ
 qHU3ehPwf2iZdIvjmBkmeFY4Kgs2/Qh96WSAS/GR6hCjtOR+Ce58cBNMM9V991V96cor
 XXgoh4NEUZweub2IsTXTE4S9Tu3V0Z8+szcx1Quu4ws5YPdnQK7Q99pQVin2UUBfU+IL
 fkTUSR7c2AZHWOA/vnhrvY7nvYakyQyvAjldOYzXK3BNTNXbnTLMrkVPMr/bvsxQlm5z
 4P4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680025436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OXgeFj8HeZZWMYQ29opeCFN4mKNrMXlE/BhUqQhRi60=;
 b=J5FqbSXUsyYTjidyfj1q9hQ5E8T6df6g7SZbCVeXfHlAC7xiSN9L/ngiGTyEq4Qdjn
 e9PqxEvK+/h3qoV3k2OaS2sb6AZFzX6Dn6SdfpQccj6iHm4tAnTQciPFYz9OovKTEe8L
 h3oHONZP4jh2SJ8R6as7akpK9tyjt7O/hHhGRcMjkbYWInDxZkJrr1IcuR1CX0+m2f3j
 wkhP3J2Q8wOrnlSoF6NxpIzLa5bWqpBHO9zphv9525NON5TrKGiZ/qYnWA3xPgngK6/A
 FY8XpmYluufrDAb0Fgz/l3WGTZ0JO6chbTZ8elJ0jIEZIJ20vyZ4T7olGt4exgPT7ZQG
 P1iw==
X-Gm-Message-State: AAQBX9dGEyiH/b8rV1hEgnevzjBNSszpfHa1xwyB0FIWl7iGX3uaJMWT
 5/Phm/L6VrrznXlq3xaBva917w==
X-Google-Smtp-Source: AKy350Z+/qXMv+UayOrNFhoUXiUiu0/aNdMFOWlhfatqwgpRdfjqi+Xtp88FTOKUg3bwZICzL0CF/w==
X-Received: by 2002:a17:902:db0d:b0:1a1:e410:a1ff with SMTP id
 m13-20020a170902db0d00b001a1e410a1ffmr20089619plx.24.1680025436663; 
 Tue, 28 Mar 2023 10:43:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902968600b001a194df5a58sm21429813plp.167.2023.03.28.10.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 10:43:56 -0700 (PDT)
Message-ID: <19a70869-d4d4-3f57-4d9e-3c4b225eade8@linaro.org>
Date: Tue, 28 Mar 2023 10:43:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0 v2 2/2] target/arm/pauth: Inline
 pauth_param_mask() and pauth_ptr_mask()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Fabiano Rosas <farosas@suse.de>
References: <20230328133054.6553-1-philmd@linaro.org>
 <20230328133054.6553-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328133054.6553-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 3/28/23 06:30, Philippe Mathieu-Daudé wrote:
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 673519a24a..a617466fa8 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1389,6 +1389,14 @@ int exception_target_el(CPUARMState *env);
>   bool arm_singlestep_active(CPUARMState *env);
>   bool arm_generate_debug_exceptions(CPUARMState *env);
>   
> +static inline uint64_t pauth_param_mask(ARMVAParameters param)

Perhaps pauth_ptr_mask_param, or just pauth_ptr_mask (see below).

> +static inline uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
> +{
> +    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
> +    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
> +
> +    return pauth_param_mask(param);
> +}

This is only used by gdbstub.  Just put it there.  Perhaps merge it with 
aarch64_gdb_get_pauth_reg directly, so that we can use the simpler 'pauth_ptr_mask' name 
above.


Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

