Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7865344DBCC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 19:51:20 +0100 (CET)
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlFAN-0006sr-Jx
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 13:51:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlF82-00058F-IA
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:48:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlF80-0001qF-TP
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636656532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ji+SYNuNIMS4EzKf45By3Rmo+Cbv7I92I+trsmIGKJo=;
 b=Fl3DtQ6HQC3FVxLpBXfx1TebN2tdpgdqgfejd77zttuDuj8S1EEHh3t1Q64QXVMkInJyrt
 2YTzCvqw55b3f1zx7npmBMvy4oJ10zLa6QlHg7rWcfoW/xI9eK6beS4rg7psbMFXx7Ky7R
 3BBeKLCcjMRuD7UtWMeMVmMzrKo9aKg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-WZWgC21POi2MWu0kJQmI2Q-1; Thu, 11 Nov 2021 13:48:51 -0500
X-MC-Unique: WZWgC21POi2MWu0kJQmI2Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso5191818wmb.0
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 10:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ji+SYNuNIMS4EzKf45By3Rmo+Cbv7I92I+trsmIGKJo=;
 b=uKr5IodcKFDMkMWk61rUioMuINIzzMPbkJh7mSAoR5j6TH8UmhWyJ2qgJ3L+p34PjG
 EsmayDz19Mz6VF8eLhImFH+CcMlhvUd4azvgXoSalfBSfNWDOGl/Dj5v6SRn7DsHOSnj
 tZd98doEjVLrtYoQ3bU/era7nt+5WdsHQtBRyg41tgY3RVDB8CONq2m0nbXAQLLDHVim
 IaNPBTB5KaFY/cao3mzevmLKIeqxTJPcJxdD5eVLgzmTc3pl3vl2qQBPfBGIkyUMTVdy
 r2fnIgBOWZPQVjHKRJxstoDem7370qXHB4IcCZIM2XetEvcygBm6dgl4HcJLqk0l1Y2N
 h+aQ==
X-Gm-Message-State: AOAM5334mFrzutWm5tlK7AIbNpkRQj1WBHmLPvq+ijk1phbeQ/eq/V60
 DjwFViMbhVIjFGB5ibcgbreS3DwAX/EF1mv2xYYIOMEZ6Yk+6xk+OfZGGKG/6ygAnI6qKt/OK3E
 ULwH4A8WfpZPX51s=
X-Received: by 2002:a1c:488:: with SMTP id 130mr10560930wme.157.1636656529830; 
 Thu, 11 Nov 2021 10:48:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxESVS1ZOtEzFyH/UVfdCKiAZAny42Y6QOITQhuhjq/fKF0hXuOI1wjnWehPiSRPi8sqkhSwg==
X-Received: by 2002:a1c:488:: with SMTP id 130mr10560885wme.157.1636656529546; 
 Thu, 11 Nov 2021 10:48:49 -0800 (PST)
Received: from redhat.com ([2.55.135.246])
 by smtp.gmail.com with ESMTPSA id n13sm3756833wrt.44.2021.11.11.10.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 10:48:49 -0800 (PST)
Date: Thu, 11 Nov 2021 13:48:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] q35: flip acpi-pci-hotplug-with-bridge-support default
 back to off
Message-ID: <20211111134413-mutt-send-email-mst@kernel.org>
References: <20211111095203.961122-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111095203.961122-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 10:52:03AM +0100, Gerd Hoffmann wrote:
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

Hmm fixes for these two have been actually posted yesterday.  In fact
both are due to the single issue of disabling HPC capability in the
bridge.  Are there more issues?
If not I'm inclined to go with the fix that Igor posted earlier unless
e.g. Igor acks this one.

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
> +
>  DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
> -                   pc_q35_6_1_machine_options);
> +                   pc_q35_6_1_only_machine_options);
>  
>  static void pc_q35_6_0_machine_options(MachineClass *m)
>  {
> -- 
> 2.33.1


