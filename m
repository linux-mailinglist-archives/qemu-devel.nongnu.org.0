Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56E4C4186
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:35:28 +0100 (CET)
Received: from localhost ([::1]:44510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNX0W-0005ZU-ON
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:35:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNWTr-0006b2-FU
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:01:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNWTn-0003jC-Mn
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645779694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjLh2rZOgMBL++HdErhOOfPy8L67IMmyYdNVylUwZGk=;
 b=Yi1rQD17CI8dMusc/Z7WoYrOASxFlGokDmNe8R/TlHG4nRibkexCqYYvz9IULXn53xwztu
 C4GzFPIZwtbKm9zJS4222nztJnJgN9QNvJf8RlGJoFixjOeVTnOpF3YUzi5fMhM51x8odk
 kMPgsFTbB2Qk41wnL8VTcRJrA+gN8kM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-ak2g7TXzMvuGWelkYI3uBA-1; Fri, 25 Feb 2022 04:01:30 -0500
X-MC-Unique: ak2g7TXzMvuGWelkYI3uBA-1
Received: by mail-ej1-f72.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so2365305ejd.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 01:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjLh2rZOgMBL++HdErhOOfPy8L67IMmyYdNVylUwZGk=;
 b=sOiKVL9R8o4YApLca8JZHwrcU0E+I2G65ckWOV2ev12Ua1YLxRZeeK9iDkvNVMppNm
 tTCqu0VWgFIu0fo4mQkgsVzA+xlAo/QBOZvks8ccCiSWjeqABmfzecl+EFuQuY/9V5Et
 +XbApwE7vLjkPYZpzrpbHfBrvgrSAFmOPL6E8vmJ7rvR51wHhTppbxCwQQEjMtLctWyA
 e+q84WaBrSOpuHpvokt2xIJ/XzMV+DA9thsuzG6yQZocJ5RvDTS/Bwk975ySGPtT0W+e
 hNvLpBsCXIfsE82p5WWqPiVcv0waYIh/NSCUM15VhomMtnkcMDJ7fLFxeXTpTk5W4aDq
 McaQ==
X-Gm-Message-State: AOAM530n4q1rVvq9gItRZe4mphE3ge7z+viHpATJL3UKLucZUmkgD/6/
 c8tXsUuITPqDNvnVRj2nwDVrwt4jpAtTEJoYHf+sm88IKaikEawUD+z0aoMGdmev/6/o7c0sPTe
 25fobO55X6PGlfkQ=
X-Received: by 2002:a17:906:8244:b0:6ce:7070:b485 with SMTP id
 f4-20020a170906824400b006ce7070b485mr5330891ejx.347.1645779689331; 
 Fri, 25 Feb 2022 01:01:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzpcaNEDa6xxfJhY5xGSzuKEy/DLQ4a9LKbT0FRTzvOhg+v5wtBRVJpSHlzep10bvx2YwZbg==
X-Received: by 2002:a17:906:8244:b0:6ce:7070:b485 with SMTP id
 f4-20020a170906824400b006ce7070b485mr5330876ejx.347.1645779689004; 
 Fri, 25 Feb 2022 01:01:29 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a170906289500b006d144662b24sm745649ejd.152.2022.02.25.01.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 01:01:28 -0800 (PST)
Date: Fri, 25 Feb 2022 10:01:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/4] Fix broken PCIe device after migration
Message-ID: <20220225100127.78974d71@redhat.com>
In-Reply-To: <20220224130708-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224130708-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 13:08:11 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Feb 24, 2022 at 12:44:07PM -0500, Igor Mammedov wrote:
> > Currently ACPI PCI hotplug is enabled by default for Q35 machine
> > type and overrides native PCIe hotplug. It works as expected when
> > a PCIe device is hotplugged into slot, however the device becomes
> > in-operational after migration. Which is caused by BARs being
> > disabled on target due to powered off status of the slot.
> > 
> > Proposed fix disables power control on PCIe slot when ACPI pcihp
> > takes over hotplug control and makes PCIe slot check if power
> > control is enabled before trying to change slot's power. Which
> > leaves slot always powered on and that makes PCI core keep BARs
> > enabled.
> > 
> > PS:
> > it's still hacky approach as all ACPI PCI hotplug is, but it's
> > the least intrusive one. Alternative, I've considered, could be
> > chaining hotplug callbacks and making pcihp ones call overriden
> > native callbacks while inhibiting hotplug event in native callbacks
> > somehow. But that were a bit more intrusive and spills over to SHPC
> > if implemented systematically, so I ditched that for now. It could
> > be resurrected later on if current approach turns out to be
> > insufficient.  
> 
> Yes, I am wondering about this myself. Replace callbacks with
> some kind of notifier, so instead of overrides we add things?
> I will ponder this over the weekend.

Callback overrides with optional chaining worked fine so far,
Chaining is just a bit more complicated as often one need to
refactor old code on pre and plug stages and think about how
to partition job between involved components.
But they are very explicit about what's supposed to call what
and in what order and graceful error handling.
And I dislike notifiers exactly for the lack of those properties
and more difficult from review pov.

I think [ATM] for this issue chaining callbacks is overkill,
but maybe in future it can be done if an idea of having PCI
slots described in ACPI + native hotplug proves to be a viable.

> > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> > CC: mst@redhat.com
> > CC: kraxel@redhat.com
> > 
> > Igor Mammedov (4):
> >   pci: expose TYPE_XIO3130_DOWNSTREAM name
> >   pcie: update slot power status only is power control is enabled
> >   acpi: pcihp: disable power control on PCIe slot
> >   q35: compat: keep hotplugged PCIe device broken after migration for
> >     6.2-older machine types
> > 
> >  include/hw/acpi/pcihp.h                    |  4 +++-
> >  include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
> >  hw/acpi/acpi-pci-hotplug-stub.c            |  3 ++-
> >  hw/acpi/ich9.c                             | 21 ++++++++++++++++++++-
> >  hw/acpi/pcihp.c                            | 16 +++++++++++++++-
> >  hw/acpi/piix4.c                            |  3 ++-
> >  hw/core/machine.c                          |  4 +++-
> >  hw/pci-bridge/xio3130_downstream.c         |  3 ++-
> >  hw/pci/pcie.c                              |  5 ++---
> >  9 files changed, 64 insertions(+), 10 deletions(-)
> >  create mode 100644 include/hw/pci-bridge/xio3130_downstream.h
> > 
> > -- 
> > 2.31.1  
> 


