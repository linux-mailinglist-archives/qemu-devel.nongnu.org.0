Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194FA65355B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:36:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82wI-0004av-VN; Wed, 21 Dec 2022 12:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p82wE-0004Vt-R1
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:31:32 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p82wC-0006FD-W2
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:31:30 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so2741589pjj.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BzfXU+65m1+EuRocaydYDANlIZBnDelolaKGZVP6Sro=;
 b=Ojq2AzyZZPB49APxgJhBdY0AQ/VFQmDlWYseAVaEaUwGpHzd1tpAh6yUBLqjO5rBTm
 YnZ9dDjcln6owR8e1IRMEV0CQZXjMe/rpSPJ04yQZ1oQo3Zp2CYkeun9rNDZnU5Ul2iW
 bzrMgwoTmjPCcMTygO/gzFZ5ZdMO7y+YKfHpfjTQt71Garr1pZpI7Vly4TTzrtLTkUyK
 B0nrGSRn+rI2c9pn9jKdfeMqnEtyODI7o7HW2vJCtzCxxhYIhLauGhoWqZbry8HJK44x
 tOpupExfDgZBBC2DxIejtIFzIyPWhWHDFWK+Q/Sxn14d2m9RAgNk4+qN8C9Dsp7CU+DN
 a/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BzfXU+65m1+EuRocaydYDANlIZBnDelolaKGZVP6Sro=;
 b=Q3YJxUD9FUDQ48waw0rNfQRQVP1QePgACu7j4LL9EV8kb0knNM8jthGnqS21+cxE34
 CYBWWHIVviegwHl+AXzyc+yGNVaCXddaTvPmpmGZokVGzpvH1eG1siqQ/PnjURCFT5+Q
 c0DQ84bheC7UiSHeXB1H7iuL42OW1NT5WbAICu/kJ+erLwzMIfwO2XC0zs1RH0Z5OsTT
 /zV1wY9O+Yb+zWj+2R9yLZlawrtvVyepWwPUmrj6x1U1g/nN/OIb46hVYpD7obZvi/eD
 v3dWqYeoO5Z+SEloZhS8JPAgEDTA1YdoMNd1GYVtlz9tLu4u6J59H+PPOiT+R+JWFs3s
 o4XQ==
X-Gm-Message-State: AFqh2koy74/QppR5PHI54llcqXVt6OkKq6L27KWpJBJCg8zbtvVEw95E
 RE37shmZzOvh2dkdM0JG7WTJvg==
X-Google-Smtp-Source: AMrXdXugapoMgWk4M/6C7lfr+TgWgmHh7i/yUmaPnnEB6/LHldceHX3DZ13bXLzQfl4QZY9Gy4aexA==
X-Received: by 2002:a17:90a:6aca:b0:223:9cfb:2f9e with SMTP id
 b10-20020a17090a6aca00b002239cfb2f9emr2948495pjm.22.1671643887404; 
 Wed, 21 Dec 2022 09:31:27 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:e04c:516d:5698:abe8?
 ([2602:47:d48c:8101:e04c:516d:5698:abe8])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a635007000000b0046b1dabf9a8sm10181611pgb.70.2022.12.21.09.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:31:26 -0800 (PST)
Message-ID: <f9a9c36d-61d6-2bd8-fe19-1e3585ae5fdd@linaro.org>
Date: Wed, 21 Dec 2022 09:31:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] MIPS: remove support for trap and emulate KVM
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: libvir-list@redhat.com, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20221221091718.71844-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221221091718.71844-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 12/21/22 01:17, Philippe Mathieu-Daudé wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> This support was limited to the Malta board, drop it.
> I do not have a machine that can run VZ KVM, so I am assuming
> that it works for -M malta as well.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Since Paolo's v1:
> 
> - Remove cpu_mips_kvm_um_phys_to_kseg0() declaration in "cpu.h"
> - Remove unused KVM_KSEG0_BASE/KVM_KSEG2_BASE definitions
> - Use USEG_LIMIT/KSEG0_BASE instead of magic values
> 
>         /* Check where the kernel has been linked */
>    -    if (!(kernel_entry & 0x80000000ll)) {
>    -        error_report("CONFIG_KVM_GUEST kernels are not supported");
>    +    if (kernel_entry <= USEG_LIMIT) {
>    +        error_report("Trap-and-Emul kernels (Linux CONFIG_KVM_GUEST)"
>    +                     " are not supported");
> 
>    -    env->CP0_EBase = (cs->cpu_index & 0x3FF) | (int32_t)0x80000000;
>    +    env->CP0_EBase = KSEG0_BASE | (cs->cpu_index & 0x3FF);
> ---
>   docs/about/deprecated.rst       |  9 -------
>   docs/about/removed-features.rst |  9 +++++++
>   hw/mips/malta.c                 | 46 +++++----------------------------
>   target/mips/cpu.c               |  7 +----
>   target/mips/cpu.h               |  3 ---
>   target/mips/internal.h          |  3 ---
>   target/mips/kvm.c               | 11 +-------
>   target/mips/sysemu/addr.c       | 17 ------------
>   target/mips/sysemu/physaddr.c   | 13 ----------
>   9 files changed, 18 insertions(+), 100 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

