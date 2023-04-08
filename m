Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772196DB8D9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 06:29:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl0C6-0003NP-9Z; Sat, 08 Apr 2023 00:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl0C3-0003Lc-Gg
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:28:51 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl0C1-00070M-Uq
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:28:51 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q15-20020a17090a2dcf00b0023efab0e3bfso2898533pjm.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 21:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680928128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RaLAuZfWT0INTWTTqSFBpSgDjWfPXH5Dgagb/vUcbfw=;
 b=MdRZm8Ro/NBK+ZlaFLYbQrUYN2G7NnUNCrSk6j3pIm6L3C9s8B9o+imxGmSGFO1rzP
 d0pypolwEj738cVK0dj/1jXeZovZByoSbF65Z8A1frLqrKBbvElXtXUO7UfpZcDEggnu
 Zj780LkQ6RFUEe06TUknN0z7I5YfStsmtefdpa4kylquOHBOyqQeAcnC5sdxXuxfzQfn
 NJ8fbdVCvkTfNgSjuv1y5Q5e2Jee5wZZK4zRajG36MHRr/ISn6kdjjqxtj7avpV06FuJ
 iEhbplpqT2ppeP+DGNa1BTj/fCHzGdZkc24DOYiRoEG45lApg3iyZ+by2C6hsI5BaGk1
 yiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680928128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RaLAuZfWT0INTWTTqSFBpSgDjWfPXH5Dgagb/vUcbfw=;
 b=M0oonNmlGt45XHhqk547QJTJ/m50jlTigrZlb/nOBa7EADET4E5auava+cvjtrYX/I
 FcNAYbbmlzVJNLHMi58mCoSxnSH+XlcTgReSakPfZUoyv0vWmcthMPsILDxap46D+UN3
 /1Ht+R686tYeBR9PCA63TNsMaqZPCEwPWAS9HcdSe9hI7QUID4dj/Cj1mn3LD5XBdbY9
 2vuw+Qmgkx50HKRiNaAn3FaMIZ8I+wT24sae30JnSCxc6MDJph1vlFxBNDN2vBz4sJrf
 sdl1KH4zQ/D4H1Dp/OFX9EnE/dn5SbjSH/LEUusmyuCCVm36fFnc4Noujqdotauo2p8v
 b9ZA==
X-Gm-Message-State: AAQBX9exl6ypJALJBATNI+KIT4RGhdmcc64QY6g1I08hLBUKh63sznRa
 QRgp3mQbddDN3dvkH1qFECWtlg==
X-Google-Smtp-Source: AKy350Y373tHXEam4gJ7xdNJNam89DOSgLnH6QSib2qEnCN3lWhcYsVBGDQfhPVQZwXOZVmZepfL4g==
X-Received: by 2002:a05:6a20:6055:b0:dd:ff4f:b856 with SMTP id
 s21-20020a056a20605500b000ddff4fb856mr4347826pza.26.1680928128276; 
 Fri, 07 Apr 2023 21:28:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a654cc7000000b0050c08fcff4asm3446234pgt.8.2023.04.07.21.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:28:47 -0700 (PDT)
Message-ID: <ef63cacd-ea5a-16bb-994c-bf7a0ea3ac6a@linaro.org>
Date: Fri, 7 Apr 2023 21:28:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 09/10] target/riscv: Restrict KVM-specific fields from
 ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> These fields shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> RFC: The migration part is likely invalid...
> 
> kvmtimer_needed() is defined in target/riscv/machine.c as
> 
>    static bool kvmtimer_needed(void *opaque)
>    {
>        return kvm_enabled();
>    }
> 
> which depends on a host feature.
> ---
>   target/riscv/cpu.h     | 2 ++
>   target/riscv/machine.c | 4 ++++
>   2 files changed, 6 insertions(+)

Yeah, the kvm parts need to be extracted to their own subsection.


r~

