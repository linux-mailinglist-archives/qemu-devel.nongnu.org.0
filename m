Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F55980FC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:43:49 +0200 (CEST)
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOc44-0004TR-Qx
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oOboP-0001Ov-Gc
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:27:40 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oOboM-000293-To
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:27:37 -0400
Received: by mail-ej1-x632.google.com with SMTP id gb36so2127436ejc.10
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=FrHDq2e4vahAyQRvJgtoTsAHkc/xM0y432WOtCvcn+Y=;
 b=YVj4fUpgATRhKaqVVObJTq643oHKWdY0CRWBlIKVBIy0WIkAWqEOH7VXbNFGkymTqV
 JBy4vx7mPXG8BYhAGeBOhWUr3HwKt8couGpxpszgju5fvjADCUKYh1Jj4o8z/V+YKHUR
 hUrg+/5C93LA8jmv5v/kr3n4APLWMboGSkC3UcF7Z42vEoFJIxckBnO2Yi4azAHRnZu2
 Mn98sikfmb0/Xdw7rfEwu9SFfef1rAQ9DS1Df2hsStZxnPLrY1sfzLmTG18FEzO8w/mN
 UsyNQhRXI59liNmTpiKjHRLL3S98w9CtRXoKpjFc+bKOE7RyqKp093I6mC2ThQQJ8nXZ
 Lj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=FrHDq2e4vahAyQRvJgtoTsAHkc/xM0y432WOtCvcn+Y=;
 b=gpqeWIVy8YnexRZ+o8VKx2yW+cXjcoqXF7nc0R/PfWu3Bs5iWwHDurYHgUGfZldWfX
 6dXz5WvFHm/mXSQX0ZQNLr5q13C84LRdkZ5gOrqTPxOTE/zVYWH8QH8LNpvOF6fW6BpC
 lx04DJdznjMFhJ1BuGuL4Dt8+B9qrsVgQ4+w4DTTQmRmc4U4YI+JiUBtkwdG/F95fApr
 4E8hj6LsHXfrDBsJtRfrvc4mSAIasQD4dJFhf+FdI4nn0FYF0tXi4ps49O3DWQfugNQP
 82LSJ4fDvScy4nkHr2t2OMT/FZwgbfyb8RAfQfNjo/1fIn5gm414Tc6Cks3FU3BiMkuh
 Oxmg==
X-Gm-Message-State: ACgBeo2tfaefbULBwnOHy7UStqpx5i2Xz5uIUKRfCMbCzWNCD19+1Psi
 Hhouka18jUM5R2P53SDhp1I=
X-Google-Smtp-Source: AA6agR4fkryncAVubcwZjyc/0i4qUrL1ZMQGoHcmsH77VUSGacaV6KWRUUrQupozh+T3dw/rO8kjpw==
X-Received: by 2002:a17:907:ea8:b0:731:67eb:b60a with SMTP id
 ho40-20020a1709070ea800b0073167ebb60amr1315881ejc.497.1660814852183; 
 Thu, 18 Aug 2022 02:27:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 16-20020a170906301000b0073100dfa7b5sm574758ejz.33.2022.08.18.02.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 02:27:31 -0700 (PDT)
Message-ID: <52a9fe51-335c-c3a1-a4ed-53d5f46b4fd8@redhat.com>
Date: Thu, 18 Aug 2022 11:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PULL 05/10] x86: disable rng seeding via setup_data
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Sergio Lopez <slp@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
 <20220817161342.240674-6-mst@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220817161342.240674-6-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/22 18:14, Michael S. Tsirkin wrote:
> @@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>       rom_set_fw(fw_cfg);
>   
>       if (machine->kernel_filename != NULL) {
> -        x86_load_linux(x86ms, fw_cfg, 0, true, false);
> +        x86_load_linux(x86ms, fw_cfg, 0, true, true);
>       }
>   
>       if (mms->option_roms) {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index a5c65c1c35..20962c34e7 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -439,6 +439,7 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
>       m->alias = "pc";
>       m->is_default = true;
>       pcmc->default_cpu_version = 1;
> +    pcmc->legacy_no_rng_seed = true;
>   }
>   
>   DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
> @@ -450,7 +451,6 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
>       pc_i440fx_7_1_machine_options(m);
>       m->alias = NULL;
>       m->is_default = false;
> -    pcmc->legacy_no_rng_seed = true;
>       pcmc->enforce_amd_1tb_hole = false;
>       compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>       compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 3a35193ff7..2e5dae9a89 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -376,6 +376,7 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
>       pc_q35_machine_options(m);
>       m->alias = "q35";
>       pcmc->default_cpu_version = 1;
> +    pcmc->legacy_no_rng_seed = true;
>   }
>   
>   DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
> @@ -386,7 +387,6 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_q35_7_1_machine_options(m);
>       m->alias = NULL;
> -    pcmc->legacy_no_rng_seed = true;
>       pcmc->enforce_amd_1tb_hole = false;
>       compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>       compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);

Why not just revert the whole patch?

Paolo

