Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F62C2F60
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:55:59 +0100 (CET)
Received: from localhost ([::1]:43554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcXm-0008Uk-Us
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khcWY-0007sx-1t
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:54:42 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khcWS-0007R2-EU
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:54:41 -0500
Received: by mail-pg1-x541.google.com with SMTP id l17so7679620pgk.1
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ynA7JfLhMe6FR21uc0OD0hZz9uDrpVTE2spGUl9PCE0=;
 b=JKnpSBKyzrcqYLgE2O/04JmHohFckWO2n1Brsoewsf6+bCkBYL/QiyXwXE51wg9yDy
 9sJZtmAJNt7yqU5LV8PSayTi6GtdPBRtpVTzJxoqXce8X/QBXQ5fXjXvN3V+Y34yW8CD
 4/nd/UjwaijUgp3MHOlES1lOdqEWzgUl2Wu9zVhaMTIbfTDU06m0x55f2EcSsw+UBdOw
 IO9D1bQMlhmeBEwwFGeZruKIWHymtNkjKMyDlBvqlvvDri6It6rRRDhTOJak6Ia0MiN3
 2VGOi/Ra2kWiMv2C+h1BveS8Luq8C+CG9tEkS3plbOsBmbu3J1UWuKP7TpP873glllCG
 MrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ynA7JfLhMe6FR21uc0OD0hZz9uDrpVTE2spGUl9PCE0=;
 b=qha8ybQM1wdXGXluop4yr3cCOH7nzzMlF1MrhEV45pDAQty1GPjc6ACo3Urz4SFRJT
 wSEdDAUgphVMPK+P8wHFv1SSQLiY+DeVRTGwnCt+dieSmbEiS6Kk619c1OjPo5hDsZeo
 Lb5QDCuuC63Ab3fj1ojmOnd95ueOae49EwC23avugqBBHARBQ+/fsX5hZkyOkTH3kmhp
 PRn7unvu9P6Py6XTAFtzkgYMX6B41mdsq/xGQw8ZKOqhwTBORyHYKiEI+wYUhR2ul7ui
 GA1o3K6/+fE3nL1XAF08807piWF4MOudO1lAYCZuQvGy3HeMVEO8ed8ZAVAC3ER/RZRD
 LUrQ==
X-Gm-Message-State: AOAM532NmB5W1mrMAPAcJg9s8nnbLIH5J8iUp36WlHeeoJXvoAS9d4RD
 wW2iJDXFC+kqN5WsdrsZlRe3Xg==
X-Google-Smtp-Source: ABdhPJwzJauvXdIktynal45ZIenOLiOPAnIzKpNgPhIxKYV6wAAvnh3ch8q2Fv/l83/V8M86v9nc3Q==
X-Received: by 2002:aa7:8e84:0:b029:197:c748:7a0f with SMTP id
 a4-20020aa78e840000b0290197c7487a0fmr5202589pfr.31.1606240474981; 
 Tue, 24 Nov 2020 09:54:34 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r14sm4549679pfc.121.2020.11.24.09.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 09:54:34 -0800 (PST)
Subject: Re: [PATCH] target/i386: fix operand order for PDEP and PEXT
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201123131426.2725276-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee22951a-6e40-67d4-c0b0-7df096572ea5@linaro.org>
Date: Tue, 24 Nov 2020 09:54:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123131426.2725276-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
Cc: Lenard Szolnoki <blog@lenardszolnoki.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 5:14 AM, Paolo Bonzini wrote:
> For PDEP and PEXT, the mask is provided in the memory (mod+r/m)
> operand, and therefore is loaded in s->T0 by gen_ldst_modrm.
> The source is provided in the second source operand (VEX.vvvv)
> and therefore is loaded in s->T1.  Fix the order in which
> they are passed to the helpers.
> 
> Reported-by: Lenard Szolnoki <blog@lenardszolnoki.com>
> Analyzed-by: Lenard Szolnoki <blog@lenardszolnoki.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1605123
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

The patch itself looks fine.

> +test-i386-bmi2: CFLAGS += -mbmi2
> +run-test-i386-bmi2: QEMU_OPTS += -cpu max
> +run-plugin-test-i386-bmi2-%: QEMU_OPTS += -cpu max

I suspect that we still support host operating systems whose compilers do not
support -mbmi2.  This might require a bit in tests/tcg/configure.sh akin to
CROSS_CC_HAS_ARMV8_3.

> +int main(int argc, char *argv[]) {
> +    char hello[16];
> +    uint64_t ehlo = 0x202020204f4c4845ull;
> +    uint64_t mask = 0xa080800302020001ull;
> +    uint64_t result64;
> +    uint32_t result32;
> +
> +    /* 64 bits */
> +    asm volatile ("pextq   %2, %1, %0" : "=r"(result64) : "r"(ehlo), "m"(mask));
> +    assert(result64 == 133);

The test is written for x86_64 not i386.  How are we preventing the test case
from being run on 32-bit in the makefile?

> +    /* 32 bits */
> +    asm volatile ("pextl   %2, %k1, %k0" : "=r"(result32) : "r"(ehlo), "m"(mask));
> +    assert(result32 == 5);

Surely we should test the full 64-bit register result, and not truncate to
uint32_t in the output variable?


r~

