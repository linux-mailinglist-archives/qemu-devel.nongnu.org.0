Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE156A8DBE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 01:10:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXszH-000806-3F; Thu, 02 Mar 2023 19:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXszF-0007xp-6V
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:09:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXszD-00032x-A4
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677802162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w8LpMBsPyb3esWj2KRAB4F3mmMrMpxI2ns27hs/sm40=;
 b=PYLdGSwYecOmm/d3E27ztZ9X8QeE8aFhhNoHKr0y33t3iKoeUarpC6QhWt2OtITaWJYO59
 35WgBIFExvJc9Ku/qfhZ9sYs+VtmACvsAX2U/+wdWyrVGgs1na2SWRcTEOne+kUCwd2IaD
 Ro52TWAzaSllGa7Kvd5EtDoqK8iPMDA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-51otBfFbNW62MEkK_oJrXA-1; Thu, 02 Mar 2023 19:09:21 -0500
X-MC-Unique: 51otBfFbNW62MEkK_oJrXA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t19-20020a0560001a5300b002ce013276b8so100613wry.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 16:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677802160;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w8LpMBsPyb3esWj2KRAB4F3mmMrMpxI2ns27hs/sm40=;
 b=pfqo0eQm5srcncMxysc7ONtlDkiSOtx44BZxxZpei6k0JkxqFb2LmPgqdFJuU0SSM7
 PvgkvFaME6xqhIFmdExK1/EqUrPCyMgxwn1psmhzeIIdBOLarRs5DGU1G/Gp8ThYiejj
 6h+xRRc0qlG1RoVq/c+n3Nv22OF0fExYHk4np7b+q5/dqx3I7zgGIw7lx8uo1Y4NGH5c
 kxm48K81p+wD0Y9oiKvOP0yRqNxVhwYZVmuNTP+yjFBmgiseJZxGJzCXfrIiJOZuqNV5
 I0IVJljo3zFmQvnZKxzTNf8gazffmg+k9OHPawrlqoVDzvoHlrkKfkh9YUUSoPsP9XVA
 Dh+w==
X-Gm-Message-State: AO0yUKWCylzn4kub8DY1AEOTPR99Vt1Mjp/2z2d2Z1x39EX3rjdEckvw
 AOa7QVGiyft64xpQCp0qDD/YKaMRl707b0v+IQhChSZollm1A4EccfSqw4sMtQgwYFf+H5f9LkJ
 Ams4FEJOhsl6qdTU=
X-Received: by 2002:a5d:6149:0:b0:2c7:aed:b981 with SMTP id
 y9-20020a5d6149000000b002c70aedb981mr86929wrt.30.1677802160185; 
 Thu, 02 Mar 2023 16:09:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/aYuAlCvuisFGJepcWnAzv1bVrg+35guBIRlDeQg9J2E80L7KhU/Ki7KNn12Z8ge9YYATJeQ==
X-Received: by 2002:a5d:6149:0:b0:2c7:aed:b981 with SMTP id
 y9-20020a5d6149000000b002c70aedb981mr86914wrt.30.1677802159810; 
 Thu, 02 Mar 2023 16:09:19 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a5d650c000000b002c557f82e27sm602176wru.99.2023.03.02.16.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 16:09:19 -0800 (PST)
Date: Thu, 2 Mar 2023 19:09:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of
 ide_init_ioport()
Message-ID: <20230302190834-mutt-send-email-mst@kernel.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Mar 02, 2023 at 11:40:40PM +0100, Philippe Mathieu-Daudé wrote:
> Since v2: rebased
> 
> I'm posting this series as it to not block Bernhard's PIIX
> cleanup work. I don't have code change planned, but eventually
> reword / improve commit descriptions.
> 
> Tested commit after commit to be sure it is bisectable. Sadly
> this was before Zoltan & Thomas report a problem with commit
> bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder").
> 
> Background thread:
> https://lore.kernel.org/qemu-devel/5095dffc-309b-6c72-d255-8cdaa6fd3d52@ilande.co.uk/


Acked-by: Michael S. Tsirkin <mst@redhat.com>

who's merging this you?

I am unsure about interdependencies between all these patchsets at this
point.

> Philippe Mathieu-Daudé (18):
>   hw/ide/piix: Expose output IRQ as properties for late object
>     population
>   hw/ide/piix: Allow using PIIX3-IDE as standalone PCI function
>   hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to ISA bus IRQs 14/15
>   hw/isa/piix4: Wire PIIX4 IDE ouput IRQs to ISA bus IRQs 14/15
>   hw/ide: Rename ISA specific ide_init_ioport -> ide_bus_init_ioport_isa
>   hw/ide/piix: Ensure IDE output IRQs are wired at realization
>   hw/isa: Deprecate isa_get_irq() in favor of isa_bus_get_irq()
>   hw/ide: Introduce generic ide_init_ioport()
>   hw/ide/piix: Use generic ide_bus_init_ioport()
>   hw/isa: Ensure isa_register_portio_list() do not get NULL ISA device
>   hw/isa: Simplify isa_address_space[_io]()
>   hw/isa: Reduce 'isabus' singleton scope to isa_bus_new()
>   exec/ioport: Factor portio_list_register_flush_coalesced() out
>   exec/ioport: Factor portio_list_register() out
>   hw/southbridge/piix: Use OBJECT_DECLARE_SIMPLE_TYPE() macro
>   hw/isa/piix: Batch register QOM types using DEFINE_TYPES() macro
>   hw/isa/piix: Unify QOM type name of PIIX ISA function
>   hw/isa/piix: Unify PIIX-ISA QOM type names using qdev aliases
> 
>  hw/audio/adlib.c              |  4 +--
>  hw/display/qxl.c              |  7 ++--
>  hw/display/vga.c              |  9 +++--
>  hw/dma/i82374.c               |  7 ++--
>  hw/i386/pc_piix.c             | 13 +++++---
>  hw/ide/ioport.c               | 15 +++++++--
>  hw/ide/isa.c                  |  2 +-
>  hw/ide/piix.c                 | 54 +++++++++++++++++++++++-------
>  hw/isa/isa-bus.c              | 36 ++++++++------------
>  hw/isa/piix3.c                | 63 +++++++++++++++--------------------
>  hw/isa/piix4.c                | 12 ++++---
>  hw/mips/malta.c               |  2 +-
>  hw/watchdog/wdt_ib700.c       |  4 +--
>  include/exec/ioport.h         | 15 +++++----
>  include/hw/ide/internal.h     |  3 +-
>  include/hw/ide/isa.h          |  3 ++
>  include/hw/ide/piix.h         |  4 +++
>  include/hw/isa/isa.h          |  3 +-
>  include/hw/southbridge/piix.h | 14 ++++----
>  softmmu/ioport.c              | 48 +++++++++++++++++++-------
>  softmmu/qdev-monitor.c        |  3 ++
>  21 files changed, 190 insertions(+), 131 deletions(-)
> 
> -- 
> 2.38.1
> 
> 
> 


