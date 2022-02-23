Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4DF4C1395
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 14:08:53 +0100 (CET)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMrNz-0002IS-MR
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 08:08:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMrIA-0008Hh-Ao
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMrI6-0002oe-6G
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645621364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yfgs9DCb/MLbQJfBXO+G2VOPDp3Tn/LsxatIUReZJw=;
 b=HPay9beRB+olAtsJUPy36jyHLJArIdDQiz0U6rCfO/Ti6lssDEMWyvocyCy96hcin2mhQZ
 nFQxYax8YM9rg98b8FYzkwIGAgBI1c5yMzkufEywORMPm+WKhTCS77pILBfRSwKG27GZxA
 kQ87o28DpEki28qIDt3ISLOprX5KO0M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354--PQxoflDOn-KjK7endtztg-1; Wed, 23 Feb 2022 08:02:43 -0500
X-MC-Unique: -PQxoflDOn-KjK7endtztg-1
Received: by mail-wr1-f70.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so3002298wrh.16
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 05:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=9yfgs9DCb/MLbQJfBXO+G2VOPDp3Tn/LsxatIUReZJw=;
 b=FWRy1ZDpCxIhg2vcn8kA0FCdoO61rmhAYUI9fx/KbAU93TxwtNE7PKC/60ywVMdsAG
 lHL1PIEZ8lDDzow8XpAf2slzYPmX0Pvh3mNAB7J0i+cKXWWnmEm5V2KoJ78P2Popw+wc
 XAxDnpXmeUDirSwF3S0rMYYVhrkuQ8F+3r3LcxoYo87QNmI/203Awdl6qTU/VpZqqXO8
 eoSOk+CFg9DoJz2UBVMudVSua1IEN5UTAgKhLiikN504m3V3NDK6Kmn3U88bWtZcxPq4
 Yxui7oRJlj5mWcnPkvQyhwzK6CJ4pb67teLfKo0uoA3PuTT1gUst4x+8X/vTlnvHBXbe
 U7PA==
X-Gm-Message-State: AOAM5324Thc7eaJNm6Di4HUCnybwIVacKAgHLDIn5RTwFtnWJpQ0zne9
 8hwng14gqWkDM9bwvmcOUURVA/TQlKmR7sFmVHZmczIxkLCo6PtZC2X+rohCBDg0yxlWEUjhIX4
 r58HIMSorMbhZqoA=
X-Received: by 2002:a1c:6a16:0:b0:37b:f4b0:65d8 with SMTP id
 f22-20020a1c6a16000000b0037bf4b065d8mr7424942wmc.80.1645621361839; 
 Wed, 23 Feb 2022 05:02:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxGsi+BaUcw/w9UBEfQaHBcSSWUm2jmhHa5CH2ofw4CfRDCWZKdq4htmFNHyxEw+X7quTcAQ==
X-Received: by 2002:a1c:6a16:0:b0:37b:f4b0:65d8 with SMTP id
 f22-20020a1c6a16000000b0037bf4b065d8mr7424914wmc.80.1645621361557; 
 Wed, 23 Feb 2022 05:02:41 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o8sm5232388wmc.46.2022.02.23.05.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 05:02:40 -0800 (PST)
Date: Wed, 23 Feb 2022 13:02:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PULL 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Message-ID: <YhYwbfr91D8W6kmh@work-vm>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <164392772418.1683127.9746374099330960813.stgit@omen>
 <20220204130846.31f5b396@redhat.com>
 <23247634-a264-8ea2-9b9f-5708626578b3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <23247634-a264-8ea2-9b9f-5708626578b3@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Eric Auger (eric.auger@redhat.com) wrote:
> Hi Igor,
> 
> On 2/4/22 1:08 PM, Igor Mammedov wrote:
> > On Thu, 03 Feb 2022 15:35:35 -0700
> > Alex Williamson <alex.williamson@redhat.com> wrote:
> >
> >> From: Eric Auger <eric.auger@redhat.com>
> >>
> >> Representing the CRB cmd/response buffer as a standard
> >> RAM region causes some trouble when the device is used
> >> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> >> as usual RAM but this latter does not have a valid page
> >> size alignment causing such an error report:
> >> "vfio_listener_region_add received unaligned region".
> >> To allow VFIO to detect that failing dma mapping
> >> this region is not an issue, let's use a ram_device
> >> memory region type instead.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
> >> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
> >> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
> >> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >> Link: https://lore.kernel.org/r/20220120001242.230082-2-f4bug@amsat.org
> >> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> >> ---
> >>  hw/tpm/tpm_crb.c |   22 ++++++++++++++++++++--
> >>  1 file changed, 20 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> >> index 58ebd1469c35..be0884ea6031 100644
> >> --- a/hw/tpm/tpm_crb.c
> >> +++ b/hw/tpm/tpm_crb.c
> >> @@ -25,6 +25,7 @@
> >>  #include "sysemu/tpm_backend.h"
> >>  #include "sysemu/tpm_util.h"
> >>  #include "sysemu/reset.h"
> >> +#include "exec/cpu-common.h"
> >>  #include "tpm_prop.h"
> >>  #include "tpm_ppi.h"
> >>  #include "trace.h"
> >> @@ -43,6 +44,7 @@ struct CRBState {
> >>  
> >>      bool ppi_enabled;
> >>      TPMPPI ppi;
> >> +    uint8_t *crb_cmd_buf;
> >>  };
> >>  typedef struct CRBState CRBState;
> >>  
> >> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
> >>          return;
> >>      }
> >>  
> >> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
> >> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
> >> +
> >>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
> >>          "tpm-crb-mmio", sizeof(s->regs));
> >> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
> >> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
> >> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cmd",
> >> +                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf);
> >> +    vmstate_register_ram(&s->cmdmem, DEVICE(s));
> > Does it need a compat knob for the case of migrating to older QEMU/machine type,
> > not to end-up with target aborting migration when it sees unknown section.
> 
> It does not seem to be requested. I am able to migrate between this
> version and qemu 6.2, back and forth, using a pc-q35-6.2 machine type.
> My guess is, as the amount of RAM that is migrated is the same, it does
> not complain. Adding Dave and Juan though.

I think that should be OK; we just rely on the RAM Block name and size.

Dave

> Thanks
> 
> Eric
> >
> >
> >>      memory_region_add_subregion(get_system_memory(),
> >>          TPM_CRB_ADDR_BASE, &s->mmio);
> >> @@ -309,12 +315,24 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
> >>      qemu_register_reset(tpm_crb_reset, dev);
> >>  }
> >>  
> >> +static void tpm_crb_unrealize(DeviceState *dev)
> >> +{
> >> +    CRBState *s = CRB(dev);
> >> +
> > likewise, should vmstate be unregistered here, before freeing
> > actually happens?
> >
> >> +    qemu_vfree(s->crb_cmd_buf);
> >> +
> >> +    if (s->ppi_enabled) {
> >> +        qemu_vfree(s->ppi.buf);
> >> +    }
> >> +}
> >> +
> >>  static void tpm_crb_class_init(ObjectClass *klass, void *data)
> >>  {
> >>      DeviceClass *dc = DEVICE_CLASS(klass);
> >>      TPMIfClass *tc = TPM_IF_CLASS(klass);
> >>  
> >>      dc->realize = tpm_crb_realize;
> >> +    dc->unrealize = tpm_crb_unrealize;
> >>      device_class_set_props(dc, tpm_crb_properties);
> >>      dc->vmsd  = &vmstate_tpm_crb;
> >>      dc->user_creatable = true;
> >>
> >>
> >>
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


