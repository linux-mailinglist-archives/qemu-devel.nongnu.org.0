Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A365E605F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:04:49 +0200 (CEST)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obK0e-0005FD-56
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obItf-0005yM-8M
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obItX-0005wQ-Mg
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663840402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uqJ3fE+nUSVE7dKPp8g2E2Nsm1KKt4x6Y9AxJhIcEaY=;
 b=QpoKA0k5az523vhKOhkwM1Fk5p1NVB5RuDySKKRdOFcbD7CiiskbAjCDfjArvvk5z4Y8no
 PrctjDKMZ+ab4afB8BxSKovojrFMlEXdpd/y5B1dLOtExeCmeS6fk0jVFzeswQLFK+jlfj
 DNirA9oCZeNq5Y7ZSqoOuoLCXBcIGJs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-qZ-nwIMXOUKhxg3zPuzVzQ-1; Thu, 22 Sep 2022 05:53:20 -0400
X-MC-Unique: qZ-nwIMXOUKhxg3zPuzVzQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d25-20020adf9b99000000b0022adb03aee6so3078307wrc.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 02:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=uqJ3fE+nUSVE7dKPp8g2E2Nsm1KKt4x6Y9AxJhIcEaY=;
 b=1bgX3H/NooByytIV+c7eDilLOg13uc8La1JycHjzEhzj5f39d9KINPEDrWXVB2vMuI
 F8HQNlZRTG9rI1PPo3gxifEutVLm3d6BLctEHive5C5QbD4VvRZ6k7yfOGPP+WfNozQa
 ulUwl1dBGd3hLMl1PIEL9b3f6U+JUFYnC8pHZjTW6yMEUh0G9vqy7xnyqwKPIx1dzr6o
 vQ/Ra9iW4S0qATydXwvRAGQKZVjw/K5b6sgF0Ky9iROdZPIQmVCXJFM3iGv3g5dppd77
 rbl3OeKLJOorFo+xjv9JFCx/+3q+lfhCnou9iS3WfMAmF1IOTIX61gpIJHDrhND6wy+O
 eqyA==
X-Gm-Message-State: ACrzQf2Bo8cFQtvAot47D5cveXHpK20JLlVyvInn1OCCgLoAB+yq7l28
 ytrPMJfa7AC5udc1gQKq2eDu4bLxE4srUQwOHZPrvwYTSTYz5Sof+LgLfsJ5wuc8MhWmzoCDRBR
 cgJX9f4yKOdT+7Ao=
X-Received: by 2002:a5d:5503:0:b0:22a:2fd7:d778 with SMTP id
 b3-20020a5d5503000000b0022a2fd7d778mr1417319wrv.44.1663840399283; 
 Thu, 22 Sep 2022 02:53:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4I0G9hKFZfByPGx9z5GwmZTjbtZsg9cph4nZ5xMcSQZeWuytkQr4J3evHBJ1Eu2JfCei19RA==
X-Received: by 2002:a5d:5503:0:b0:22a:2fd7:d778 with SMTP id
 b3-20020a5d5503000000b0022a2fd7d778mr1417303wrv.44.1663840399015; 
 Thu, 22 Sep 2022 02:53:19 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d590a000000b002206203ed3dsm4604135wrd.29.2022.09.22.02.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 02:53:18 -0700 (PDT)
Date: Thu, 22 Sep 2022 05:53:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] x86: add etc/phys-bits fw_cfg file
Message-ID: <20220922054648-mutt-send-email-mst@kernel.org>
References: <20220922084356.878907-1-kraxel@redhat.com>
 <20220922044906-mutt-send-email-mst@kernel.org>
 <20220922093710.q3pxbxljdhu4a4yw@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922093710.q3pxbxljdhu4a4yw@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 11:37:10AM +0200, Gerd Hoffmann wrote:
> On Thu, Sep 22, 2022 at 04:55:16AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Sep 22, 2022 at 10:43:56AM +0200, Gerd Hoffmann wrote:
> > > In case phys bits are functional and can be used by the guest (aka
> > > host-phys-bits=on) add a fw_cfg file carrying the value.  This can
> > > be used by the guest firmware for address space configuration.
> > > 
> > > This is only enabled for 7.2+ machine types for live migration
> > > compatibility reasons.
> > > 
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > 
> > I'm curious why you decided to switch from a cpuid flag to fw cfg.
> 
> The kernel people didn't like the cpuid approach.
> 
> > I guess firmware reads fw cfg anyway.
> 
> Correct.
> 
> > But would the guest kernel then need to load a fw cfg driver very
> > early to detect this, too?
> 
> Nope, the guest kernel can just work with the address space layout
> created by the firmware.  The firmware can for example reserve a
> larger 64-bit mmio window in case there is enough address space for
> that.  So it programs the bridge windows etc accordingly, qemu
> generates matching acpi tables and the kernel picks up the changes
> via _CRS.
> 
> > > +void fw_cfg_phys_bits(FWCfgState *fw_cfg)
> > > +{
> > > +    X86CPU *cpu = X86_CPU(first_cpu);
> > > +    uint64_t phys_bits = cpu->phys_bits;
> > > +
> > > +    if (cpu->host_phys_bits) {
> > > +        fw_cfg_add_file(fw_cfg, "etc/phys-bits",
> > > +                        g_memdup2(&phys_bits, sizeof(phys_bits)),
> > > +                        sizeof(phys_bits));
> > > +    }
> > > +}
> > 
> > So, this allows a lot of flexibility, any phys_bits value at all can now
> > be used. Do you expect a use-case for such a flexible mechanism?  If
> > this ends up merely repeating CPUID at all times then we are just
> > creating confusion.
> 
> Yes, it'll just repeat CPUID.  Advantage is that the guest gets the
> information it needs right away.
> 
> Alternatively I could create a "etc/reliable-phys-bits" bool.
> The firmware must consult both fw_cfg and cpuid then.
> 
> take care,
>   Gerd

It might not be too bad if we actually allow these two to be different
theoretically (even if unused for now).
This is up to you. But my point is, if we do let's document what is the
expected behaviour if fw cfg and CPUID differ.



-- 
MST


