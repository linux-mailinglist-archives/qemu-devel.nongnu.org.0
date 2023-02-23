Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087376A12C9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:25:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVK0K-0006QK-F4; Thu, 23 Feb 2023 17:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVK0I-0006Ok-GG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:23:54 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVK0G-0000LA-St
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:23:54 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 oe18-20020a17090b395200b00236a0d55d3aso796133pjb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hJT5xpBhX4rkRxLVox26rF4wBTWCNMKpp0VcHMP2oGE=;
 b=NJS6/OdyhPsRUr48YsbS+lV6f/886qZR2sIf7BSNWUmNpzN+DKGNtPeMiJvOBds/Oq
 mDmc3Ro/xDRkQtKLIDf0xoMo1MDsknimYKB1jbq0CzNe2TPPfBjajnsWoCMpwRo4okJw
 KY/DJgnyGDDweAm+p6RsycW05jzVE3OMTT7wPq9tLcAhg3v67hslA/uadXl+iL2rS8lc
 dQLng7i2ADg+BX6b/aeojybZNoEn4gFY9vGqrFviAKdVoBw2yLsKzjLBF9IIiuTmrQPT
 sMbLYxXzDTPuOZ/uSZybnEz4LQr1OAmGgQxXNMwRZollvYTaugfFP9oLF2T+9wFaZHmp
 /e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hJT5xpBhX4rkRxLVox26rF4wBTWCNMKpp0VcHMP2oGE=;
 b=OAdnxC7vWQRpAEMLeItyTas3AtpxEEZnavPGDx29sua4dAUHQfXdC8f4dVyn7re1v5
 ojqxT9M8OMDqw6P3FW4U6abGMDizILzP9xojv2AKAz58Whzr9bV/8Not4SmcARzvpu+E
 UlK/KETEb3TCbxgvkvfazoLCdzLpaPGynjythG8mhCD5CCHpI+ehu8RUCSgzt82w/Ece
 gA8OptjLWtPIi0NVeZrFtJ7fxKb0AcJXymuzAhyrrE+KFZpvmC5Rk/0YcUeeFk4Lb4bU
 VR0CLNqZEQUSZP+TH+nWhsAKuNfPQQaOhC6d2/G70CidvwDNm0QdbWseeBrqJ4Wly1MX
 NvAw==
X-Gm-Message-State: AO0yUKWFi6Nz74YuO2x6C2ruyFCRH4BZE4ASgBHMMcQQ8t3JXnByuXM4
 oo7Ac+IEWL1F854zrYd3H2sJ+Q==
X-Google-Smtp-Source: AK7set94vDUY1RocK5yyN3rVAROSbzI70HgOM/HcbOMiYgkKu0vw5I8BpqPF2IhuIh1xRj2Ub0brpA==
X-Received: by 2002:a17:902:c40d:b0:19a:8284:83a2 with SMTP id
 k13-20020a170902c40d00b0019a828483a2mr16053637plk.10.1677191031039; 
 Thu, 23 Feb 2023 14:23:51 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 w19-20020a170902d3d300b0019b4ee071ddsm4016280plb.209.2023.02.23.14.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 14:23:50 -0800 (PST)
Message-ID: <8ab70d13-c7c2-692d-9c3b-aba49181bf1e@linaro.org>
Date: Thu, 23 Feb 2023 12:23:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH qemu 1/1] target/i386: Fix gen_shift_rm_T1, wrong eflags
 calculation
Content-Language: en-US
To: ~vilenka <vilen.kamalov@gmail.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, pbonzini@redhat.com
References: <167718710208.23058.11278141733696221981-1@git.sr.ht>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167718710208.23058.11278141733696221981-1@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 11:13, ~vilenka wrote:
> From: Vilen Kamalov <vilen.kamalov@gmail.com>
> 
> gen_shift_rm_T1 in the uses wrong tmp0 register, eflags calculation uses tmp4 at target/i386/tcg/translate.c, line 5488
> `tcg_gen_mov_tl(cpu_cc_src, s->tmp4);`
> 
> QEMU fails to pass int3 in next sample, vs real cpu
> -------------
> push rcx
> mov dword ptr [rsp], 010000000h
> mov rcx, 01eh
> sar dword ptr [rsp], cl
> jnc pass1
> int 3
> pass1:
> mov dword ptr [rsp], 0ffffffffh
> mov rcx, 01eh
> sar dword ptr [rsp], cl
> jc pass2
> int 3
> pass2:
> pop rcx
> -------------

Rewritten as a standalone test:

int main()
{
     unsigned m = 0x10000000;
     unsigned char c = 0x1e;

     m = 0x10000000u;
     asm volatile("sarl %1, %0; jnc 1f; ud2; 1:" : "+m"(m) : "c"(0x1e));

     m = 0xffffffffu;
     asm volatile("sarl %1, %0; jc 1f; ud2; 1:" : "+m"(m) : "c"(0x1e));

     return 0;
}

This test passes for me, for both qemu-i386 and qemu-x86_64.
So, I don't see your reported failure at all.


r~


