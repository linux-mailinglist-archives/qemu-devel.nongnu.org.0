Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AE16EA507
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:39:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pplLH-0004kd-S2; Fri, 21 Apr 2023 03:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplLD-0004kP-8K
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplLB-0007wg-48
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682062675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YAVbavJ95/H15qsA862i/P/RT/8yRxcuw2Hq9F2q0s8=;
 b=DeyEyRyR/Aqpo5j8d5V7BPBki3LPJOFGRZ0pnZO2Sqhvva51QxNuS0+bmbtYf5GJmoiXH8
 G1WxP4Ua++DRwMBIcFYCR3nkhQqc/khp5DKlYd3a4clfXz+XloMEk8Z2FUt6+9FNzm81OZ
 OM3/AfWFTbkL0sKCMbqJE+F72kZxJ0E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-ppLXFSPcNdOxHIRWEzK7uw-1; Fri, 21 Apr 2023 03:37:53 -0400
X-MC-Unique: ppLXFSPcNdOxHIRWEzK7uw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f080f53d62so5280785e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 00:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682062672; x=1684654672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YAVbavJ95/H15qsA862i/P/RT/8yRxcuw2Hq9F2q0s8=;
 b=KUgkx9fesJ6xmqZH4OveDVxTxcB2iMS0pw5FS6kz9NBiqdEoJu9mOYOHC6sqodDYSA
 7lMfh8LJduHPu5uzR2oeu7XRlzx4PRamd7BeHiREVIrIN6U7O/FDN6laK4qrNjxMH+6t
 nZMYftnfMCBYvE49/U6QU0f8RIxI5tHOrZ18IXFW+WBq6Yt6LTMw//5tYtlNSV+i8Ufx
 N0qUsmxKP0CHC7O8jqA7LZU0EuvI/M9HjkyS/CAl76oa9Dy3Gjj+dOtlJHx75K5bjMJY
 2LfMukEulU55M1ydJ8G3OenHUKnCvDAdsbJUBNkvPbP9uOF+b87VJdA0qySUsqj6u1pf
 9+lw==
X-Gm-Message-State: AAQBX9dJONLqWjkLGN0uY2FYcKVhzulCKZ45gPTOeYenjfVUTLQ4UhEA
 r8ZciQ8WNlwiLIb9Ee1Qg4QOXarFsJ9IoWUzySTsuXvyXFgcQEy97rtqK6DiVhoLBBe6cpI+8tU
 FApBcDStvfA7qASw=
X-Received: by 2002:a1c:6a08:0:b0:3f1:7ea7:20e5 with SMTP id
 f8-20020a1c6a08000000b003f17ea720e5mr1053138wmc.17.1682062672736; 
 Fri, 21 Apr 2023 00:37:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350aR+9rlW20eiWFQtSTgUAy6ULPnusZFxVacZlysZGxGS7xYybJEO//EPI+qe4seUXgWAwxoWA==
X-Received: by 2002:a1c:6a08:0:b0:3f1:7ea7:20e5 with SMTP id
 f8-20020a1c6a08000000b003f17ea720e5mr1053125wmc.17.1682062672470; 
 Fri, 21 Apr 2023 00:37:52 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 y24-20020a7bcd98000000b003ee70225ed2sm4038602wmj.15.2023.04.21.00.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 00:37:51 -0700 (PDT)
Date: Fri, 21 Apr 2023 03:37:46 -0400
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
Subject: Re: [PATCH v4 2/7] hw/pci/pci.c: Don't leak PCIBus::irq_count[] in
 pci_bus_irqs()
Message-ID: <20230421033735-mutt-send-email-mst@kernel.org>
References: <20230403074124.3925-1-shentey@gmail.com>
 <20230403074124.3925-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403074124.3925-3-shentey@gmail.com>
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

On Mon, Apr 03, 2023 at 09:41:19AM +0200, Bernhard Beschow wrote:
> When calling pci_bus_irqs() multiple times on the same object without calling
> pci_bus_irqs_cleanup() in between PCIBus::irq_count[] is currently leaked.
> Let's fix this because Xen will do just that in a few commits, and because
> calling pci_bus_irqs_cleanup() in between seems fragile and cumbersome.
> 
> Note that pci_bus_irqs_cleanup() now has to NULL irq_count such that
> pci_bus_irqs() doesn't do a double free.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

ok

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/pci/pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index def5000e7b..be1c5d16ec 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -558,6 +558,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
>      bus->set_irq = set_irq;
>      bus->irq_opaque = irq_opaque;
>      bus->nirq = nirq;
> +    g_free(bus->irq_count);
>      bus->irq_count = g_malloc0(nirq * sizeof(bus->irq_count[0]));
>  }
>  
> @@ -573,6 +574,7 @@ void pci_bus_irqs_cleanup(PCIBus *bus)
>      bus->irq_opaque = NULL;
>      bus->nirq = 0;
>      g_free(bus->irq_count);
> +    bus->irq_count = NULL;
>  }
>  
>  PCIBus *pci_register_root_bus(DeviceState *parent, const char *name,
> -- 
> 2.40.0


