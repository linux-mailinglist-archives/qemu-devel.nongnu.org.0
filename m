Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F7652CE5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 07:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7sfF-00032s-Su; Wed, 21 Dec 2022 01:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7sf9-000323-6R
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 01:33:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7sf7-0001KF-GO
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 01:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671604388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R9csZMNWFDrEYomNUw68FetwPy5S0xAqjh1zf+VW5V8=;
 b=bEgaBi4JsmAl6OlvVeU48gW4B2MBhcI9fyl8HLGTN24DKK93NHutQfBDvO5ooMcxOyM3PG
 KOc6jjCfozHCZgooqi8Jts4Z969jbHExdBOcEgm5aLPWtryQXq2jkBzWicJyTvYPkJGK2T
 vydEWlELINYsNHhwKywWkNRBFD32b1w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-pgqKNdKrPfKtaBBKq_RCSA-1; Wed, 21 Dec 2022 01:33:06 -0500
X-MC-Unique: pgqKNdKrPfKtaBBKq_RCSA-1
Received: by mail-qk1-f197.google.com with SMTP id
 bq39-20020a05620a46a700b006ffd5db9fe9so10817293qkb.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 22:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9csZMNWFDrEYomNUw68FetwPy5S0xAqjh1zf+VW5V8=;
 b=nUg5qI+LGwRSt5n0gzdXMljxlYBuq1/tio6jo5Tc6N6aTb//Lsw6t/LhnM1mv2pf3u
 XZXzTKY08xKwa4LbsPLbaaTEjpgL9feDl7OEWm+s72i0/5MO4Rxp9dX0fwsaZmLvrL4T
 46qMXXEHswfORzZzHdhth7C4+6rKNuNI1U9XvtrsP6ZSN11ZQKf55bqeXe4lC+Q08SRH
 P0JiYJpy5O7EandeWiP5wRsaBbs4Ngbw+KiDDHWoPIfWWeGGT/CAvW+iGu0KcRybP37W
 PDYRpaPHawbW7GemEsSy34Vkutwnxx30LAdoNYUjylCse5svSmJ6kd6MdwUO76ApuCXE
 RV5w==
X-Gm-Message-State: AFqh2kr4P0wUAP5O/6RgM83HcjBTpDyfjYwksDl8Cimy/Ro972y7V/Qg
 n1yzHIADSCg8ywdmaP706mtXGSYbZhe2YnzXfDJ0kgyDHbJWfVFKKRpeu916ONDV6lZxSUJdrws
 YdQ8k+qiuL9VDOXE=
X-Received: by 2002:ac8:4986:0:b0:3ab:1e96:bb93 with SMTP id
 f6-20020ac84986000000b003ab1e96bb93mr657605qtq.58.1671604386325; 
 Tue, 20 Dec 2022 22:33:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu9kiz0u8QJO2jhfGMm3fTYiVCbXWmqWevq0WEcda+sSmvRGXv7BxsNIPseKa1+JPX2BgYIMg==
X-Received: by 2002:ac8:4986:0:b0:3ab:1e96:bb93 with SMTP id
 f6-20020ac84986000000b003ab1e96bb93mr657591qtq.58.1671604386018; 
 Tue, 20 Dec 2022 22:33:06 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 u7-20020a05620a430700b006fa31bf2f3dsm10426436qko.47.2022.12.20.22.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 22:33:05 -0800 (PST)
Date: Wed, 21 Dec 2022 01:32:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
Message-ID: <20221221013252-mutt-send-email-mst@kernel.org>
References: <20221120150550.63059-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120150550.63059-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Sun, Nov 20, 2022 at 04:05:47PM +0100, Bernhard Beschow wrote:
> v1:
> ===
> 
> During my PIIX consolidation work [1] I've noticed that both PIIX models have
> quite different pci_slot_get_pirq() implementations. These functions seem to
> map PCI INTx pins to input pins of a programmable interrupt router which is
> AFAIU board-specific. IOW, board-specific assumptions are baked into the device
> models which prevent e.g. the whole PIIX4 south bridge to be reusable in the PC
> machine.
> 
> This series first factors out pci_bus_map_irqs() from pci_bus_irqs() which
> then allowes for moving the two board-specific PIIX pci_slot_get_pirq()
> funtions into their respective boards. With these changes, the PIIX4 south
> bridge could eventually become an alternative to the PIIX3-Frankenstein
> solution in the PC machine.


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> v2:
> ===
> * Remove RFC tag from whole series
> * New patch to split pci_bus_irqs()
> * Remove VT82xx patch which was just a demonstration
> 
> Testing done:
> * `make check`
> * `make check-avocado`
> * `qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
> * `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
> 
> Thanks,
> Bernhard
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03941.html
> 
> Bernhard Beschow (3):
>   hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>   hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
>   hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific
> 
>  hw/i386/pc_piix.c       | 16 ++++++++++++++++
>  hw/i386/pc_q35.c        |  4 ++--
>  hw/isa/piix3.c          | 17 ++---------------
>  hw/isa/piix4.c          | 27 +--------------------------
>  hw/mips/malta.c         | 28 ++++++++++++++++++++++++++++
>  hw/pci-host/raven.c     |  3 ++-
>  hw/pci-host/versatile.c |  3 ++-
>  hw/pci/pci.c            | 12 +++++++++---
>  hw/remote/machine.c     |  3 ++-
>  include/hw/pci/pci.h    |  3 ++-
>  10 files changed, 66 insertions(+), 50 deletions(-)
> 
> -- 
> 2.38.1
> 


