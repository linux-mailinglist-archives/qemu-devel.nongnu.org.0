Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02AE596BB4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 10:56:32 +0200 (CEST)
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOEqm-0000jP-27
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 04:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOEnM-0006ey-AN
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOEnJ-0006s4-5y
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660726376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MVMPqYflcNyp+DgMy6/AZ2ZRVzBrOxaK4jjuecMeNw=;
 b=E+BZN4JJfu1K9diXzs5BUVtLYNmayyPPYmVYlyNJEEJMB48knDlNuRbSlJP/I+N7f/TR9S
 JTCZnhm0VGSLmqowXAopkVcjRTdR/Fczo8NXN9/zp5NofkoUotiRIpNu7V2/+A5jqVjoUA
 5LXkId1V9Rdr6VZph2eCZDgM+dp19rk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-Q2guuv_bMCmaZBSbBroYxQ-1; Wed, 17 Aug 2022 04:52:54 -0400
X-MC-Unique: Q2guuv_bMCmaZBSbBroYxQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i132-20020a1c3b8a000000b003a537064611so6069010wma.4
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 01:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=5MVMPqYflcNyp+DgMy6/AZ2ZRVzBrOxaK4jjuecMeNw=;
 b=lGASed3P3sQUp+zGelVOQfug8DINoHnDR0uaHZYR5EW6ioG8kY8R2EtYQXBx79JH0K
 WW8zpjEv/QfwcN4hcGbHFXFHPN+7F7MR0qikwWz1DzUKxatNVVGzakfGjwMmsCehWLJ5
 UGQZKOVJScRi+AKh85e6ykDU4juEDPIyQM0VR3D566lKIrNTIwJtkZjP19gTWtTupKvm
 svlWBoiVCy/n466M9MFRanY/iGBWd7rAqkR/icd+g9yRifuiPdMjrdA7YoNkK2NrCMeC
 NUeTxji/SWG297qEin3eKmEQdcRAyA5+9TdVWFbxBObXeLtftUrtZ4xtG4uLwHCEKGV2
 IZqg==
X-Gm-Message-State: ACgBeo3D0m4B6s6zO86oysQiPFkRkYAv00ceFnoZDIXIQ3bxKvlBZ8Fm
 jAcqKu3R4UPvXu+MtYn8gNR00JfxZkEDU4lX0iuSVWCqm+L+5kl47dWh/SQdgQyF1SmWRsGswlz
 EW7lrtmOThO0TNI8=
X-Received: by 2002:a05:6000:887:b0:21e:24a0:f302 with SMTP id
 ca7-20020a056000088700b0021e24a0f302mr13109929wrb.466.1660726373498; 
 Wed, 17 Aug 2022 01:52:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5U/cq/2B7lReLFqxl4Y3ernG91/i8hKG9NaW9vYGlgEpBhtUzJGUjwVHgpOSDIb4xXFYQJiQ==
X-Received: by 2002:a05:6000:887:b0:21e:24a0:f302 with SMTP id
 ca7-20020a056000088700b0021e24a0f302mr13109912wrb.466.1660726373289; 
 Wed, 17 Aug 2022 01:52:53 -0700 (PDT)
Received: from redhat.com ([2.55.43.215]) by smtp.gmail.com with ESMTPSA id
 b3-20020a05600010c300b002217339ce90sm12412362wrx.8.2022.08.17.01.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 01:52:52 -0700 (PDT)
Date: Wed, 17 Aug 2022 04:52:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] x86: disable rng seeding via setup_data
Message-ID: <20220817045232-mutt-send-email-mst@kernel.org>
References: <20220817083940.3174933-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817083940.3174933-1-kraxel@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Aug 17, 2022 at 10:39:40AM +0200, Gerd Hoffmann wrote:
> Causes regressions when doing direct kernel boots with OVMF.
> 
> At this point in the release cycle the only sensible action
> is to just disable this for 7.1 and sort it properly in the
> 7.2 devel cycle.
> 
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


Will queue ASAP.

> ---
>  hw/i386/microvm.c | 2 +-
>  hw/i386/pc_piix.c | 2 +-
>  hw/i386/pc_q35.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 7fe8cce03e92..52cafa003d8a 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>      rom_set_fw(fw_cfg);
>  
>      if (machine->kernel_filename != NULL) {
> -        x86_load_linux(x86ms, fw_cfg, 0, true, false);
> +        x86_load_linux(x86ms, fw_cfg, 0, true, true);
>      }
>  
>      if (mms->option_roms) {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index a5c65c1c3527..20962c34e7d8 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -439,6 +439,7 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
>      m->alias = "pc";
>      m->is_default = true;
>      pcmc->default_cpu_version = 1;
> +    pcmc->legacy_no_rng_seed = true;
>  }
>  
>  DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
> @@ -450,7 +451,6 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
>      pc_i440fx_7_1_machine_options(m);
>      m->alias = NULL;
>      m->is_default = false;
> -    pcmc->legacy_no_rng_seed = true;
>      pcmc->enforce_amd_1tb_hole = false;
>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 3a35193ff74b..2e5dae9a89fa 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -376,6 +376,7 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
>      pc_q35_machine_options(m);
>      m->alias = "q35";
>      pcmc->default_cpu_version = 1;
> +    pcmc->legacy_no_rng_seed = true;
>  }
>  
>  DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
> @@ -386,7 +387,6 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_7_1_machine_options(m);
>      m->alias = NULL;
> -    pcmc->legacy_no_rng_seed = true;
>      pcmc->enforce_amd_1tb_hole = false;
>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> -- 
> 2.37.2


