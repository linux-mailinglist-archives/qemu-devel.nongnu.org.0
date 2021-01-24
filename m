Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24C301955
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 04:23:46 +0100 (CET)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3W09-0007ju-6d
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 22:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Vz2-0007DZ-Ke
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 22:22:37 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Vz0-00040x-Ry
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 22:22:36 -0500
Received: by mail-pj1-x1033.google.com with SMTP id gx1so681996pjb.1
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 19:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1spgO1hDuSZYjVK161oa9S+/MZYE8R5CJ6UNKJrRqu4=;
 b=PUE8zRM6z4sP8IN3wyBvM2GPHqstSAVroDnDvVm7Ak0QPzTnUN0E6HgoCOP3YWEuoK
 rnBwhf+85Sh7FGL4e2/YmKvHK6crk7XxI0PDkFKP7pKyoPs0OHmtRLIcwvcQSdqVqEPX
 rHPHNNieL7ehqmc926n2T/6t20QSxDyvFNgrckKdvMn27czdwmKEYigBsf0UXlSpYhoa
 n4ikB36TCw+TdQAZJv1zx3tnNjFJVygfVOAkI+MzycGMez8fsVbuBxFHkiqrObPwJoSb
 BcNAO/PWlG99wiGVvUlDA7r5i4FfXL/RoZBp7FFIRZfOK60ATpgb58LNmMrPaHyKYXrc
 W8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1spgO1hDuSZYjVK161oa9S+/MZYE8R5CJ6UNKJrRqu4=;
 b=BO/jCr2AWuz4MjKUBIpkDP4EN8TYtVt3aTGMqy0jFCtnxwkQsEKDd5zqSELVsH20Oi
 ual1Hzef3EDdc59yWFPRAuRylil/PqI0iz+Aet/Sfmm72/NY/BCKcrBAEr3YWF6mNAc4
 fDwj75V30eO1Kx724UMxldbcn4s2f5yYvQ7+TRxaXo/TL3b5Fn5cKieGBQMwFhqtu6D8
 j5FKtT5aTMwubyQTPpRUMhjsTZ3lK0WA9hpqDyfbKUwB2hRZXZqlFXF2Yj9/cX8A8Hgw
 T7Bu9LJbTecb+nnaMtXW1dI8HhKjM/sUhjbx161WWduALoTUDkUPVF7TYrwGM4dusP3g
 htGA==
X-Gm-Message-State: AOAM532L5T7cNyTFZPxYic+d9aXmnOzJHKSQN2gDXhgT62ImHNHaFGMH
 a9aaxPYlzf4RZZOsJzMUiNVUaSN7NnwkpQ==
X-Google-Smtp-Source: ABdhPJxJeMjODs2vADFqI5kjisSnKljA9TsXcK2hWYkbEhyvCRxaiZRVbpuBhkZ+EpNcgRvRMyZQ1A==
X-Received: by 2002:a17:90a:db0d:: with SMTP id
 g13mr4013438pjv.76.1611458553073; 
 Sat, 23 Jan 2021 19:22:33 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id j19sm5471429pfn.14.2021.01.23.19.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 19:22:32 -0800 (PST)
Subject: Re: PPC64 TCG problem.. MSR[SF] switching.
To: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org
References: <73db1b7f-00c2-53d9-9de1-3939b39a525b@vmfacility.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a034d9a3-834c-a400-d573-143de570c134@linaro.org>
Date: Sat, 23 Jan 2021 17:22:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <73db1b7f-00c2-53d9-9de1-3939b39a525b@vmfacility.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 4:03 PM, Ivan Warren wrote:
> Hello people,
> 
> I have the following issue : I'm using an OS (not linux) on a
> qemu-system-ppc64. (in my case a Power8 qemu target with a x86_64 TCG target)
> 
> This OS provides a set of NARROW/WIDE (MSR[SF]) agnostic code snippets in the
> 1st 64K of addresses (so they can be called using the PPC 'bla' instruction).
> Possibly this is kernel provided code so that it can provide the best strategy
> for the current runtime environment depending on CPU model or whatever the
> SPAPR Hypervisor says.
> 
> One of the routine is 1st being called in NARROW mode, and the TCG generated
> code reflects that. For example it (seems) to generate address folding in the
> output TCG target code (looking at log out_asm output) and/or possibly uses the
> 32 bit soft mmu helper (but can't be sure of this)..
> 
> Later the vCPU is switched to WIDE mode (MSR[SF]==1) and invokes the code
> again. No new code is being generated because it is already in the TCG cache,
> but that code is still the NARROW mode generated TCG target code so it fails
> miserably (address incorrectly truncated to 32 bit and/or wrong MMU strategy).

You are correct, this is a bug in the ppc translator.

The bug is in ppc_tr_init_disas_context:

    ctx->sf_mode = msr_is_64bit(env, env->msr);

this is an incorrect read of env state within the translator.

It looks like ppc is attempting to do this correctly, by computing a value into
env->hflags, which includes MSR[SF].

However, this doesn't quite work out because in cpu_get_tb_cpu_state,

    *flags = env->hflags;

truncates the value from target_ulong to uint32_t.

So the setting of the MSR[SF] bit gets lost.

> The solutions (if my assumptions are correct) I believe is either to flush the
> TCG output cache upon MSR[SF] switching (but that could kill performances if
> there is a lot of NARROW/WIDE switches... or have 2 TCG caches (one for narrow
> code and one for wide code).

The values stored by cpu_get_tb_cpu_state are saved, and we will only reuse an
entry in the TCG output cache when all of the values are the same.  So fixing
the truncation issue will fix this bug.

The easiest way to fix this is to (ab)use tb->cs_base to store env->hflags,
because they are both target_ulong values.

I will follow up with a partial patch for this general class of bug, which
should fix your specific case.


r~

