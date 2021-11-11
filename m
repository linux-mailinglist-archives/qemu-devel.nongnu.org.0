Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014E44DDCE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 23:18:52 +0100 (CET)
Received: from localhost ([::1]:50070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlIPC-0001WG-9j
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 17:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlION-0000ry-Sn
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 17:17:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlIOK-0002oh-8K
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 17:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636669074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MY8k1UamYw0CFMsFjd4w+3zWv1nsig1wxDUKyEWTew=;
 b=cB7/WCx2S+niqqyfFsGSdHsAd+XffTJtKRa84r2Lby4/fkmeztwwtcs9WuE+aGMemheigO
 kVo+uop+BoySa+NwKHVAImp70QgxyTV5WhpIdXPguhnTSvrc8bMYJvD0doFTWlAVUpg+eR
 eqvDINy/9WFeYPwdmFAzH/GLxASuYcI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-laGydaxHPq-D051mA825Rg-1; Thu, 11 Nov 2021 17:17:51 -0500
X-MC-Unique: laGydaxHPq-D051mA825Rg-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso6533510edj.20
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 14:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7MY8k1UamYw0CFMsFjd4w+3zWv1nsig1wxDUKyEWTew=;
 b=IExZbPw6WJTuP8UgGpbNYjlRXvYVqxb1aBsODAKpwsdBy3Ik43M8aUdUY5JfHonJoh
 DX7j/8U0YFtg2MG1hcLu6p+vCci27krCNejDnzFV4qJl7O5Zv/YjYBVqm16Mipwni5Zh
 mlw3rrHmYhSh6qQ7r1rIQ/C1yPUiOWE/AtMnOz6LsSAyyDtgnWp7IhuM8OaD3zQec/3G
 8vQ+jJ89hEVo6AnR8I6MyMAZDHVNwzrqgKGauIsSuas4TKRGWl+rjCSvIkEk+2TAxZcv
 0ekHXtoED/iJf0pQDd6eNMmB3DyfsqRhLgEeIF2EDnI4LT57VN6poB7Z3QcJ9ZWEqOg/
 ubDg==
X-Gm-Message-State: AOAM532PVDtwL2VRa306Mdzf1ouAI2wRG5iNCQsaVQSrlR5p61MP6x1v
 qNrrS+t0NDjsjQlFQt51ERz+JjQniPzFk3A/vHhIUZke9lpaH/Df9GD20HWhBtFXp3Pum/GRkpt
 6gJYRcuw3hK8Kfh0=
X-Received: by 2002:a17:906:4fcd:: with SMTP id
 i13mr14081153ejw.472.1636669070382; 
 Thu, 11 Nov 2021 14:17:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztd0f20Wk5Wgu6NBvSiakKDUYLtYhVoohSRZ+Nnf+fxQVOhC64StE6QAeJi20Q8jkdDovhNg==
X-Received: by 2002:a17:906:4fcd:: with SMTP id
 i13mr14081111ejw.472.1636669070168; 
 Thu, 11 Nov 2021 14:17:50 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id sa17sm2033372ejc.123.2021.11.11.14.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:17:49 -0800 (PST)
Date: Thu, 11 Nov 2021 23:17:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] q35: flip acpi-pci-hotplug-with-bridge-support default
 back to off
Message-ID: <20211111231748.67419158@redhat.com>
In-Reply-To: <20211111095203.961122-1-kraxel@redhat.com>
References: <20211111095203.961122-1-kraxel@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Nov 2021 10:52:03 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Switch qemu 6.2 back to 6.0 behavior (aka native pcie hotplug) because
> acpi hotplug for pcie ports caused all kinds of regressions and a fix
> for those is not in sight.
> 
> Add compat property for 6.1 to keep it enabled there.  Use a separate
> compat property list so we can apply it to 6.1 only.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/641
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/acpi/ich9.c   |  2 +-
>  hw/i386/pc.c     |  1 -
>  hw/i386/pc_q35.c | 14 +++++++++++++-
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 1ee2ba2c508c..6e7d4c9eb54a 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      pm->disable_s3 = 0;
>      pm->disable_s4 = 0;
>      pm->s4_val = 2;
> -    pm->use_acpi_hotplug_bridge = true;
> +    pm->use_acpi_hotplug_bridge = false;
>  
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2592a821486f..4fed82dafcf0 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -106,7 +106,6 @@ GlobalProperty pc_compat_6_0[] = {
>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
>      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
> -    { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
>  };
>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 797e09500b15..735dd3cff4ed 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -375,8 +375,20 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
>      m->smp_props.prefer_sockets = true;
>  }
>  
> +/* 6.1 only compat property (not applied to 6.0 + older) */
> +static GlobalProperty pc_compat_6_1_only[] = {
> +    { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "on" },
> +};
> +static const size_t pc_compat_6_1_only_len = G_N_ELEMENTS(pc_compat_6_1_only);
> +
> +static void pc_q35_6_1_only_machine_options(MachineClass *m)
> +{
> +    pc_q35_6_1_machine_options(m);
> +    compat_props_add(m->compat_props, pc_compat_6_1_only, pc_compat_6_1_only_len);
> +}

it works, but not quite the pattern we usually use.
I'd prefer enabling it in pc_compat_6_1[] and then turn it off
in pc_compat_6_2. It also would be good for downstream as
it's less chances to miss compat tweak in usual place
than in here.


>  DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
> -                   pc_q35_6_1_machine_options);
> +                   pc_q35_6_1_only_machine_options);
>  
>  static void pc_q35_6_0_machine_options(MachineClass *m)
>  {


