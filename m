Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562C6EA5C8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:25:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppm4t-000477-Lt; Fri, 21 Apr 2023 04:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppm4s-00046y-F9
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppm4p-0007rW-Kr
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682065506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5krHJ790Py7hiBztD0gDnXm1BXpcT5rZ+DngBz7s//s=;
 b=R4qE6CvgHPZtcidnFxFzz9XXOeTCUiUf9BAcYXLxw04X9jMMmFBuG3272tQILtWEr54BuZ
 59VAow405drnHb6T0o4jRtSVn+6BNerAtE8E/slQ/ArhYPBwso9BTst7899fC8ry0vROPL
 aMo5wR8C9nfhvRSDlDUmUXjI9f6rFDU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-bHKcZp1qOa2VA0JZX2AMIQ-1; Fri, 21 Apr 2023 04:25:05 -0400
X-MC-Unique: bHKcZp1qOa2VA0JZX2AMIQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f080f534acso9737285e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682065504; x=1684657504;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5krHJ790Py7hiBztD0gDnXm1BXpcT5rZ+DngBz7s//s=;
 b=I9rAbsuw3lH5eN2tUud64wGgyJkBnJ0o6kTE8fGq1VbaeamyyzFrW0HKHKneHs3QSc
 PQTBWdN/vZNH13jJOcrUw3wOV/w+1V+7EJQ8mRJhzAf55SNJEgh8XEcSnabtJXCY6mhB
 GtoB4f/HP35rUcQmyG+kGxK+7t29RPfFOs/1ETKDjkcXEi9XdYfPwt8zhoA/jxm0Q4pg
 ynG+2TzdFqZ30saEyySmgd/4UoOF9p/mRyfgI2bHP9bUCLQeglcbQzu37KmAtjo7lpUp
 RmfS7J3kzHeK+UBJiukyRm/eekXbx6hNZ/uQpnT4GyMDLj2NfiXaQMYFZdvD4GEqBFJw
 zs9w==
X-Gm-Message-State: AAQBX9dKvHpNH84hkIemD0PLrd6c81Gp+HE+VIPqV65qfxL+PmuEE6AS
 hQL4RiH9a+c2R/5J17Sb4EE3xapoJUk0fcL2UcueTsbGXoYQKLxhddfxE4hPQkzca5LpIMuVEmW
 dBGdDE76IeVKfGqQ=
X-Received: by 2002:a1c:7211:0:b0:3f1:71d2:da3a with SMTP id
 n17-20020a1c7211000000b003f171d2da3amr1131545wmc.30.1682065504273; 
 Fri, 21 Apr 2023 01:25:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350btdgphMXVg/wGvFwh9J6FVYpRqIYldgo9Sv5Kw0XKppCy7HR5ZedOHwndq+ckUQz0bYyWV8A==
X-Received: by 2002:a1c:7211:0:b0:3f1:71d2:da3a with SMTP id
 n17-20020a1c7211000000b003f171d2da3amr1131532wmc.30.1682065503981; 
 Fri, 21 Apr 2023 01:25:03 -0700 (PDT)
Received: from redhat.com ([2.55.62.70]) by smtp.gmail.com with ESMTPSA id
 k5-20020adff5c5000000b002f103ca90cdsm3856665wrp.101.2023.04.21.01.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 01:25:03 -0700 (PDT)
Date: Fri, 21 Apr 2023 04:25:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of
 ide_init_ioport()
Message-ID: <20230421042344-mutt-send-email-mst@kernel.org>
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

On Thu, Mar 02, 2023 at 11:40:40PM +0100, Philippe Mathieu-Daudé wrote:
> Since v2: rebased
> 
> I'm posting this series as it to not block Bernhard's PIIX
> cleanup work. I don't have code change planned, but eventually
> reword / improve commit descriptions.

> Tested commit after commit to be sure it is bisectable. Sadly
> this was before Zoltan & Thomas report a problem with commit
> bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder").

I'm not sure what this implies, or how do you want to
resolve the conflicts with Bernhard's work.

did my best to review, series:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> 
> Background thread:
> https://lore.kernel.org/qemu-devel/5095dffc-309b-6c72-d255-8cdaa6fd3d52@ilande.co.uk/
> 
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


