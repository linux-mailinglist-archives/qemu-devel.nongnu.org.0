Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C146EA508
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:39:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pplLa-0004nJ-IG; Fri, 21 Apr 2023 03:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplLY-0004lR-Pc
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplLX-00083k-1w
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682062697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dMMIuZlSmetsblZCDeUgqaAXAUJZ7nAmf6/XgoiCTeY=;
 b=IlLAEkWpyrt+bKWld8aNWOFQOJ2aq92ITFnobNoIaJOWGywMhD1zHlZaCukBKBME8WuiT5
 jxwPxhtDbJ5OfyEanDbePRSNvroga2ZpKYy0dc4uj41EEb4iQCNuSW1l4WODO0ykJKcmnw
 ftesYUxy8CJZyUyea2GmpzWAcDhErv8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-4E1VgXCHMLeom_6MiqB9Rw-1; Fri, 21 Apr 2023 03:38:15 -0400
X-MC-Unique: 4E1VgXCHMLeom_6MiqB9Rw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f170a1fbe7so8527205e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 00:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682062695; x=1684654695;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMMIuZlSmetsblZCDeUgqaAXAUJZ7nAmf6/XgoiCTeY=;
 b=PTcM3tDKcSD15p1t5XRlWiEQlQxHMA5QA+AGPIqUB0V7J+fRT837A/qE8BpF3fErtX
 MwLhZrW3ABEQ8yKin4K8oj4xGbRf6xY1WaboDRDra2kz5yAoeOX3VXvbPIdv5cpaeBbe
 WO7ud6DQHQoGdXrZ3WH11lV9cA1piqDDVSSxFN0VO0zpKTqVpP0PYIMDfHM/BPsr08Cn
 KcY6qPN0y+hRS0WsnWYLlba+t7eCj4uuUyHYWjU9ZnYuOVoTwDFmV7ZBtG+Wl7B0VLBV
 DeoaRaiNFeZDubSPPto6SEeCWTfdUY0IdQk5r3SYN1H7Nip3H+mAeb5Jm3JgdwYfQN/l
 srOg==
X-Gm-Message-State: AAQBX9f6FXq8jc79oG7NDNPhYrIMalsDzG7sVcwn3nTaT8SmstFx/8Gg
 WgWBGoLUEQX/HnxCRgyoC39Q1THHgE74FKKHPpuW569TETImWLlBFbCdwQXIyRWHrcX8EniGzts
 GQ+mO6fqDQyiolBo=
X-Received: by 2002:a7b:c5d4:0:b0:3f0:a0bb:58ef with SMTP id
 n20-20020a7bc5d4000000b003f0a0bb58efmr971429wmk.25.1682062694829; 
 Fri, 21 Apr 2023 00:38:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350YOrrdjWksNALRxEPQvKpHmRItRxbWVmT3lOFiuCk6zo4mcQss4rb0gRIrPaGwAOLoqPnIX7w==
X-Received: by 2002:a7b:c5d4:0:b0:3f0:a0bb:58ef with SMTP id
 n20-20020a7bc5d4000000b003f0a0bb58efmr971406wmk.25.1682062694511; 
 Fri, 21 Apr 2023 00:38:14 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 m7-20020adfe947000000b003011baf89b3sm3799958wrn.40.2023.04.21.00.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 00:38:14 -0700 (PDT)
Date: Fri, 21 Apr 2023 03:38:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
Message-ID: <20230421033757-mutt-send-email-mst@kernel.org>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Apr 03, 2023 at 09:41:17AM +0200, Bernhard Beschow wrote:
> There is currently a dedicated PIIX3 device model for use under Xen. By reusing
> existing PCI API during initialization this device model can be eliminated and
> the plain PIIX3 device model can be used instead.
> 
> Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also making Xen
> agnostic towards the precise south bridge being used in the PC machine. The
> latter might become particularily interesting once PIIX4 becomes usable in the
> PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3.

xen stuff so I assume that tree?

> Testing done:
> - `make check`
> - Run `xl create` with the following config:
>     name = "Manjaro"
>     type = 'hvm'
>     memory = 1536
>     apic = 1
>     usb = 1
>     disk = [ "file:manjaro-kde-21.2.6-220416-linux515.iso,hdc:cdrom,r" ]
>     device_model_override = "/usr/bin/qemu-system-x86_64"
>     vga = "stdvga"
>     sdl = 1
> - `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \
>     -cdrom manjaro-kde-21.2.6-220416-linux515.iso`
> 
> v4:
> - Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)
> 
> v3:
> - Rebase onto master
> 
> v2:
> - xen_piix3_set_irq() is already generic. Just rename it. (Chuck)
> 
> Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
> 
> Bernhard Beschow (7):
>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
>   hw/pci/pci.c: Don't leak PCIBus::irq_count[] in pci_bus_irqs()
>   hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
>   hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
>   hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
>   hw/isa/piix3: Resolve redundant k->config_write assignments
>   hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
> 
>  include/hw/southbridge/piix.h |  1 -
>  include/hw/xen/xen.h          |  2 +-
>  hw/i386/pc_piix.c             | 36 +++++++++++++++++++--
>  hw/i386/xen/xen-hvm.c         |  2 +-
>  hw/isa/piix3.c                | 60 +----------------------------------
>  hw/pci/pci.c                  |  2 ++
>  stubs/xen-hw-stub.c           |  2 +-
>  7 files changed, 39 insertions(+), 66 deletions(-)
> 
> -- 
> 2.40.0
> 


