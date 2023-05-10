Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4D6FE474
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 21:22:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwpNI-0004jU-8Y; Wed, 10 May 2023 15:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwpND-0004gc-9i
 for qemu-devel@nongnu.org; Wed, 10 May 2023 15:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwpNB-0007J1-IO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 15:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683746472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9pF89Tip7CJoi1Nc3JaNU6DtazbvMhyCeYgzrumSFQ=;
 b=iXYWisQMm54zj67n7p8I2gg/vUPeXDkpwuoFGuXLTkQMA20zQNON/HvprQdIVPswAITnpd
 SKfyshOVskGAR7prADpaZb1LeyIjge/eUBWGD/HKSBJbZ+Pkbiq3xtH1bqbLvgQxWuzbna
 8q4CDz9c3lPJcpay2HB5UVa65CHsUMU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-LFeriFYyOHOr5Cu-s8HqSQ-1; Wed, 10 May 2023 15:21:11 -0400
X-MC-Unique: LFeriFYyOHOr5Cu-s8HqSQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f348182ffcso48116325e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 12:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683746465; x=1686338465;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w9pF89Tip7CJoi1Nc3JaNU6DtazbvMhyCeYgzrumSFQ=;
 b=fuNtQ9qvAgbwVh+z/wsSNjN5kef/XsErse0RPAvZbZh6+4XeobGIbBIRNh2yFKCo1M
 pfx4uR9nAI1JSJnEyB1GWADElPbjIvBNvnXML7jANS5Tl5c00zZnoRxYz+l17cGITErR
 P+i40ZKTUC8ieh6oJLtGOQNG25MA00tGf7/veEUjrHqqJtTk+PYKic/5/bly54R+VRXu
 9/jbl1UskIZe9rNU5x0n3zY40sQP/+OqnbAvT42HGh2oIHs7tdl2s5vsodo9rY461cHI
 iYvtitZ/C3EA7+gRC3/fdtX4X6zssdkWs689WQiX9IynaLd00DKMSFoa2yFM6PPPuV6U
 b1Qw==
X-Gm-Message-State: AC+VfDxJPmhPdUdio8wpgGDrShQXRHz/xNGSmqBYz4s2f4dTrKGX769F
 fhW6YSDfVx+WHaMPH6Yhwc4cf3vrMN7KdznrADzpflYg0sGQHkHQPnStNnaj/jiFSYHLVz6tkFE
 cVkASs6CffcC5ybg=
X-Received: by 2002:a1c:f304:0:b0:3f1:979f:a734 with SMTP id
 q4-20020a1cf304000000b003f1979fa734mr12668940wmq.11.1683746464879; 
 Wed, 10 May 2023 12:21:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qAaQFxDG6S8ZbEft/CjfKrxGp7ZA5lHVIhdEksZLyMLfjUq2ejuVfrw76cOVGH95YuyaupQ==
X-Received: by 2002:a1c:f304:0:b0:3f1:979f:a734 with SMTP id
 q4-20020a1cf304000000b003f1979fa734mr12668923wmq.11.1683746464548; 
 Wed, 10 May 2023 12:21:04 -0700 (PDT)
Received: from redhat.com ([31.187.78.71]) by smtp.gmail.com with ESMTPSA id
 i1-20020a5d55c1000000b003062b2c5255sm18204594wrw.40.2023.05.10.12.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 12:21:03 -0700 (PDT)
Date: Wed, 10 May 2023 15:20:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v4 0/9] PC cleanups
Message-ID: <20230510152043-mutt-send-email-mst@kernel.org>
References: <20230213162004.2797-1-shentey@gmail.com>
 <776DAC15-E708-47BF-9EF6-D511731DF56D@gmail.com>
 <4A6D076C-5091-42A5-BB83-695B5BF2F04D@gmail.com>
 <73EFF09E-8246-4E6E-8F6E-189BA222A7D7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73EFF09E-8246-4E6E-8F6E-189BA222A7D7@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 10, 2023 at 06:26:54PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 5. März 2023 07:45:55 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >
> >
> >Am 13. Februar 2023 16:45:05 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >>
> >>
> >>Am 13. Februar 2023 16:19:55 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >>>This series contains some cleanups I came across when working on the PC
> >>>
> >>>machines. It consists of reducing the usage of global variables and eliminating
> >>>
> >>>some redundancies.
> >>>
> >>>
> >>>
> >>>One notable change is that the SMRAM memory region gets moved from the i440fx
> >>>
> >>>and q35 host bridges into the x86 machine. This will simplify cleaning up these
> >>>
> >>>host bridges which will be done in a separate series. Note that the movement of
> >>>
> >>>the SMRAM memory region apparently doesn't change migration ABI for the pc and
> >>>
> >>>q35 machines (see below).
> >>>
> >>>
> >>>
> >>>Testing done:
> >>>
> >>>* `make check`
> >>>
> >>>' `make check-avocado`
> >>>
> >>>* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
> >>>
> >>>   manjaro-kde-21.3.2-220704-linux515.iso`
> >>>
> >>>* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
> >>>
> >>>* Confirm that JSON representation of migration files (pc & q35) are empty:
> >>>
> >>>  1. Create four migration files {pc,q35}-{before,after}.mig by running
> >>>
> >>>     `qemu-system-x86_64 -M {pc,q35} -S` with QEMU built from master and from
> >>>
> >>>     this series.
> >>>
> >>>  2. Run `./scripts/analyze-migration.py -d desc -f *.mig > *.json` on the four
> >>>
> >>>     files
> >>>
> >>>  3. Compare the diffs -> both are empty
> >>>
> >>>
> >>>
> >>>v4:
> >>>
> >>>* Remove ram_memory variable in pc_q35 completely (Zoltan)
> >>>
> >>
> >>The last two patches still need review. Comments welcome!
> >
> >Ping
> >
> >Can we queue the reviewed patches (all but the last two) already?
> 
> Ping 2


queued 1-7

> >
> >Thanks,
> >Bernhard
> >
> >>
> >>>
> >>>
> >>>v3:
> >>>
> >>>* Add three patches regarding init_pam() and SMRAM.
> >>>
> >>>* Drop 'hw/i386/pc_q35: Resolve redundant q35_host variable' since Phil posted
> >>>
> >>>  a similar patch in a more comprehensive series:
> >>>
> >>>  https://lore.kernel.org/qemu-devel/20230203180914.49112-13-philmd@linaro.org/
> >>>
> >>>* Drop 'hw/isa/lpc_ich9: Reuse memory and io address space of PCI bus' since
> >>>
> >>>  it inadvertantly changed the memory hierarchy.
> >>>
> >>>* Drop ICH9 cleanups again in favor of a separate series.
> >>>
> >>>
> >>>
> >>>v2:
> >>>
> >>>* Factor out 'hw/i386/pc_q35: Reuse machine parameter' from 'hw/i386/pc_q35:
> >>>
> >>>  Resolve redundant q35_host variable' (Zoltan)
> >>>
> >>>* Lower type of phb to Object in 'hw/i386/pc_q35: Resolve redundant q35_host
> >>>
> >>>  variable' (Zoltan)
> >>>
> >>>* Add ICH9 cleanups
> >>>
> >>>
> >>>
> >>>Bernhard Beschow (9):
> >>>
> >>>  hw/pci-host/i440fx: Inline sysbus_add_io()
> >>>
> >>>  hw/pci-host/q35: Inline sysbus_add_io()
> >>>
> >>>  hw/i386/pc_q35: Reuse machine parameter
> >>>
> >>>  hw/i386/pc_{q35,piix}: Reuse MachineClass::desc as SMB product name
> >>>
> >>>  hw/i386/pc_{q35,piix}: Minimize usage of get_system_memory()
> >>>
> >>>  hw/i386/pc: Initialize ram_memory variable directly
> >>>
> >>>  hw/pci-host/pam: Make init_pam() usage more readable
> >>>
> >>>  hw/i386/x86: Make TYPE_X86_MACHINE the owner of smram
> >>>
> >>>  target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion about smram size
> >>>
> >>>
> >>>
> >>> include/hw/i386/pc.h             |  1 -
> >>>
> >>> include/hw/i386/x86.h            |  2 ++
> >>>
> >>> include/hw/pci-host/i440fx.h     |  7 ++++---
> >>>
> >>> include/hw/pci-host/pam.h        |  5 +++--
> >>>
> >>> include/hw/pci-host/q35.h        |  4 +++-
> >>>
> >>> hw/i386/pc.c                     |  2 --
> >>>
> >>> hw/i386/pc_piix.c                | 10 +++++-----
> >>>
> >>> hw/i386/pc_q35.c                 | 17 +++++++++--------
> >>>
> >>> hw/i386/x86.c                    |  4 ++++
> >>>
> >>> hw/pci-host/i440fx.c             | 28 +++++++++++++---------------
> >>>
> >>> hw/pci-host/pam.c                | 12 ++++++------
> >>>
> >>> hw/pci-host/q35.c                | 31 ++++++++++++++++---------------
> >>>
> >>> target/i386/tcg/sysemu/tcg-cpu.c |  3 +--
> >>>
> >>> 13 files changed, 66 insertions(+), 60 deletions(-)
> >>>
> >>>
> >>>
> >>>-- >
> >>>2.39.1
> >>>
> >>>
> >>>


