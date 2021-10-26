Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0FA43A928
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 02:17:42 +0200 (CEST)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfA9t-0001EQ-LU
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 20:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfA6r-0000Q6-VL
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:14:33 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfA6o-0005Tw-KJ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:14:33 -0400
Received: by mail-pg1-x534.google.com with SMTP id q187so12337060pgq.2
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 17:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8UWQLR7hnOmJfYgisajQ9u5Hdj/w+1CHYkOMerGxuiE=;
 b=MV3e8wBUFZU3VS73f9S6bFhSW/52bUG8ydkr73kR2VIXVX30TzCOavMh0fE9n24jHJ
 Vo1Q6m5c1Pl1bZWqaVuFdqj0BH+DNMe47RqeErChDz0jistzeOEkYBWmzd3P00Rwh1lY
 r/x4UDE4nSFsAIJnhF3v3CtmtSCFZle0+dIGwJvw8Q3tWl2n6D2Io5dZar/umBbAS7DW
 bKidmI604KtRF+BhxqBeAONc4NwdiLDddoQEsM5jj78KWQKEPHFevInITUc2I+g9offG
 7V46uo09/lKGRyda+RBqa/ZW9n2X1BSqR75AWlt0BLSqTcwCJKYkRsrobNHcMKD6JXgQ
 I19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8UWQLR7hnOmJfYgisajQ9u5Hdj/w+1CHYkOMerGxuiE=;
 b=sKQBMTiQm9dQZfSx7OaM4oIwS4g2YDrcxZehVFHTIwZdozc5m7O6UeKFSOQT/M4v8e
 SIvigea5wmfEy+dn6f2NvgxTehhEpcGFWgUviF/Q3pEnebPWiwnRJEmZX7OqsKzl8c27
 OcQ/6aHEplG72E1x/Sg/fUjPB0sNIhl2XwBxITfhIdcGfTyCSu3MFLvDF+aXhR4LwAY6
 tMYsXY8RW3P2yr1OSarJ1kG11nQDnaBo/2K/oFDQBbJ5Q1zoZ1CXV7ol3vc1gSrAoRWt
 i5dJBiMLs7LlLOb4zGijrOlakkRlTiCVG3/Wq19t6zsutwOyChLxPGUBICcNdpKv1V31
 0/0Q==
X-Gm-Message-State: AOAM533FmJKXnJub4ZhFvo9wHBLWdc/m+pIxVfGlUYquAGrmRx0z8wIE
 qSTJGhbIIha27n1kVzFt9M5bkQ==
X-Google-Smtp-Source: ABdhPJxe7lu/HV4FypiqVYehHicM2jUZ8b2rGl2WnKP9FuPRPrDTcZkf99TyfbR1O275kxk7uey1yg==
X-Received: by 2002:aa7:888b:0:b0:47b:f214:3f23 with SMTP id
 z11-20020aa7888b000000b0047bf2143f23mr8945046pfe.22.1635207268926; 
 Mon, 25 Oct 2021 17:14:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v22sm20642645pff.93.2021.10.25.17.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 17:14:28 -0700 (PDT)
Subject: Re: [PATCH] hvf: arm: Ignore cache operations on MMIO
To: Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>
References: <20211025191349.52992-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f17a2693-0c1a-d41e-5218-1117d2636425@linaro.org>
Date: Mon, 25 Oct 2021 17:14:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025191349.52992-1-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
Cc: kettenis@openbsd.org, qemu-devel@nongnu.org,
 AJ Barris <AwlsomeAlex@github.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, osy@github.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 12:13 PM, Alexander Graf wrote:
> +    /*
> +     * We ran into an instruction that traps for data, but is not
> +     * hardware predecoded. This should not ever happen for well
> +     * behaved guests. Let's try to see if we can somehow rescue
> +     * the situation.
> +     */
> +
> +    cpu_synchronize_state(cpu);
> +    if (cpu_memory_rw_debug(cpu, env->pc, &insn, 4, 0)) {

This isn't correct, since this would be a physical address access, and env->pc is virtual.

Phil's idea of cpu_ldl_data may be correct, and cpu_ldl_code may be slightly more so, 
because we got EC_DATAABORT not EC_INSNABORT, which means that the virtual address at 
env->pc is mapped and executable.

However, in the event that there's some sort of race condition in between this data abort 
and hvf stopping all threads for the vm exit, by which the page tables could have been 
modified between here and there, then cpu_ldl_code *could* produce another exception.

In which case the interface that gdbstub uses, cc->memory_rw_debug, will be most correct.


> @@ -1156,6 +1183,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>                                hvf_exit->exception.physical_address, isv,
>                                iswrite, s1ptw, len, srt);
>   
> +        if (!isv) {
> +            g_assert(hvf_emulate_insn(cpu));
> +            advance_pc = true;
> +            break;
> +        }
>           assert(isv);

Ouch.  HVF really passes along an invalid syndrome?  I was expecting that you'd be able to 
avoid all of the instruction parsing and check syndrome.cm (bit 8) for a cache management 
instruction.


r~

