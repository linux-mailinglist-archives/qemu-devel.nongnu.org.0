Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0341F569301
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:04:42 +0200 (CEST)
Received: from localhost ([::1]:33290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BGK-0003IV-Gl
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o9Avn-0002Gf-DD
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 15:43:29 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:40748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o9Avj-0003Rh-AF
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 15:43:25 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 29FAF2E1F55;
 Wed,  6 Jul 2022 22:43:15 +0300 (MSK)
Received: from rvkaganb (unknown [2a02:6b8:b081:216::1:2c])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 mR8rP4pVHP-hDOmZIn5; Wed, 06 Jul 2022 22:43:14 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657136594; bh=xDUkYG8nk2zT+J82b5K8XDgne9AfOymHSrdvbojcWLE=;
 h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
 b=G0CpiqV3JwAeNn0Hk03BpmlCSH3XvTlaTTNIluh+1fP6Df3vmi5fO2NhFUMD0K8rx
 rm+aYNVM1jHDfMQ5uJ1Im2pizpgdiJzDgh+SekTyCJsillf5b0qT2wtoc9tUX8EFiV
 lMSELcoGpOv7T3+kBKRBKjASrcVfX8Wier60XEX4=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Date: Wed, 6 Jul 2022 22:43:12 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <YsXl0BrhtoPTQUnn@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220704102514.1284827-1-rvkagan@yandex-team.ru>
 <18e4c3fc-080a-a8e4-786a-b0410345167c@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18e4c3fc-080a-a8e4-786a-b0410345167c@yandex-team.ru>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Wed, Jul 06, 2022 at 09:38:39PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 7/4/22 13:25, Roman Kagan wrote:
> > It's possible to create non-working configurations by attaching a device
> > to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> > specifying a slot number other that zero, e.g.:
> > 
> >      -device pcie-root-port,id=s0,... \
> >      -device virtio-blk-pci,bus=s0,addr=4,...
> > 
> > Make QEMU reject such configurations and only allow addr=0 on the
> > secondary bus of a PCIe slot.
> > 
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > ---
> >   hw/pci/pci_bridge.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> > index da34c8ebcd..8b38d5ad3d 100644
> > --- a/hw/pci/pci_bridge.c
> > +++ b/hw/pci/pci_bridge.c
> > @@ -33,6 +33,7 @@
> >   #include "qemu/units.h"
> >   #include "hw/pci/pci_bridge.h"
> >   #include "hw/pci/pci_bus.h"
> > +#include "hw/pci/pcie_port.h"
> >   #include "qemu/module.h"
> >   #include "qemu/range.h"
> >   #include "qapi/error.h"
> > @@ -386,6 +387,10 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
> >       br->windows = pci_bridge_region_init(br);
> >       QLIST_INIT(&sec_bus->child);
> >       QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
> > +
> > +    if (PCIE_SLOT(dev)) {
> 
> Hmm, wouldn't PCIE_SLOT just crash if dev is not pcie slot? As I understand, PCIE_SLOT is finally an OBJECT_CHECK(), which say:
> 
>  * If an invalid object is passed to this function, a run time assert will be
>  * generated.

Well, the assertion is there only if configured with
--enable-qom-cast-debug which is off by default, that's why it even
passed make check.  As it stands, it's just a typecast which is a no-op
here, and basically it makes every bridge have only a single slot, which
is wrong of course.

Will rework, thanks!
Roman.

