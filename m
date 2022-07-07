Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68C85699C6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 07:21:12 +0200 (CEST)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Jwt-0002nD-BT
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 01:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o9JvG-00026S-0w
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 01:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o9JvC-00084U-Nj
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 01:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657171165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DTXcsjvfR2hUnIezqvqTdDx81Rayo4wecSKyjs1vi18=;
 b=ba6lBoJ8g4bqLwtaDGeF9CtNyilwaGul/vV8qQW9/LXuBCQEumhhtyDMcO6vbLtT3uE4wG
 2/TU+c9o4dM1VBy5R966dpDuv7BlHojG6ufx6R6WFzSJNI5IcIvHEb54GJWFX1hU+w7O0Q
 +eOQNgyzOvM6u9hgF9dvYg8eFO35VBs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-RjILbXy-PXK7RFkORxGGHg-1; Thu, 07 Jul 2022 01:19:22 -0400
X-MC-Unique: RjILbXy-PXK7RFkORxGGHg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v123-20020a1cac81000000b003a02a3f0beeso6966595wme.3
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 22:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DTXcsjvfR2hUnIezqvqTdDx81Rayo4wecSKyjs1vi18=;
 b=NO0AAMjWiy9VUvtKOUBg8yvSN78d7zErErNN8rQRQ0p8xEMH+cQSxkzkARv60gbrpl
 Ap2MisiE4Y/RG63wnMXqrSc/ZlbtANDiaafeek3StFLm5MPHRrCbMRAfXn5SyoVzEz9l
 YJy74E2PpId/ia3wpryBlqGgb/1EeanIPD8P6eZgSJ7WUMZCQGKSRiAm/1sxaFSUq2rs
 +TP0XhMWhPa7vTDZcy5apt4hQ7sM/mdqZHqPUAuoGI1GjtD06VMx8kLcTqmJ8h2EaPwT
 HjRJFVWgJgSKtAjPKewn9je8MdJSwD9b0bXwCeWZTvNqO1c7PUVPYk75gQN4Vc3x6C+l
 Cnuw==
X-Gm-Message-State: AJIora+39mGpXcYw9PTNBajJAK0M3pdotzYSURL/uz7cLVwjAZ4RVcSG
 CvO7752Ss3odg3jbtpAAnGzYhdTILw9Ll/vJ/j1emJ3rjEzCy+tpvb0Npv/2VYV0v8lSnB4l9gL
 bmJMSvlOq2/D1Vy4=
X-Received: by 2002:adf:dbc1:0:b0:219:e994:6ba7 with SMTP id
 e1-20020adfdbc1000000b00219e9946ba7mr40497878wrj.229.1657171161723; 
 Wed, 06 Jul 2022 22:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sJVL+eLw0KAyM2+oMX49d+fJDcgojnFyWeCE6MVqP5MwX6T5kKSad7inj+rCqgmFmVRlyDgQ==
X-Received: by 2002:adf:dbc1:0:b0:219:e994:6ba7 with SMTP id
 e1-20020adfdbc1000000b00219e9946ba7mr40497868wrj.229.1657171161506; 
 Wed, 06 Jul 2022 22:19:21 -0700 (PDT)
Received: from redhat.com ([2.52.154.68]) by smtp.gmail.com with ESMTPSA id
 z5-20020adfe545000000b0021b81855c1csm45199937wrm.27.2022.07.06.22.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 22:19:21 -0700 (PDT)
Date: Thu, 7 Jul 2022 01:19:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru
Subject: Re: [PATCH] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <20220707011825-mutt-send-email-mst@kernel.org>
References: <20220704102514.1284827-1-rvkagan@yandex-team.ru>
 <18e4c3fc-080a-a8e4-786a-b0410345167c@yandex-team.ru>
 <YsXl0BrhtoPTQUnn@rvkaganb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsXl0BrhtoPTQUnn@rvkaganb>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 06, 2022 at 10:43:12PM +0300, Roman Kagan wrote:
> On Wed, Jul 06, 2022 at 09:38:39PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > On 7/4/22 13:25, Roman Kagan wrote:
> > > It's possible to create non-working configurations by attaching a device
> > > to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> > > specifying a slot number other that zero, e.g.:
> > > 
> > >      -device pcie-root-port,id=s0,... \
> > >      -device virtio-blk-pci,bus=s0,addr=4,...
> > > 
> > > Make QEMU reject such configurations and only allow addr=0 on the
> > > secondary bus of a PCIe slot.
> > > 
> > > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > > ---
> > >   hw/pci/pci_bridge.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> > > index da34c8ebcd..8b38d5ad3d 100644
> > > --- a/hw/pci/pci_bridge.c
> > > +++ b/hw/pci/pci_bridge.c
> > > @@ -33,6 +33,7 @@
> > >   #include "qemu/units.h"
> > >   #include "hw/pci/pci_bridge.h"
> > >   #include "hw/pci/pci_bus.h"
> > > +#include "hw/pci/pcie_port.h"
> > >   #include "qemu/module.h"
> > >   #include "qemu/range.h"
> > >   #include "qapi/error.h"
> > > @@ -386,6 +387,10 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
> > >       br->windows = pci_bridge_region_init(br);
> > >       QLIST_INIT(&sec_bus->child);
> > >       QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
> > > +
> > > +    if (PCIE_SLOT(dev)) {
> > 
> > Hmm, wouldn't PCIE_SLOT just crash if dev is not pcie slot? As I understand, PCIE_SLOT is finally an OBJECT_CHECK(), which say:
> > 
> >  * If an invalid object is passed to this function, a run time assert will be
> >  * generated.
> 
> Well, the assertion is there only if configured with
> --enable-qom-cast-debug which is off by default, that's why it even
> passed make check.  As it stands, it's just a typecast which is a no-op
> here, and basically it makes every bridge have only a single slot, which
> is wrong of course.
> 
> Will rework, thanks!
> Roman.

Which probably means it was not actually tested that the patch
rejects the invalid configuration, was it?

-- 
MST


