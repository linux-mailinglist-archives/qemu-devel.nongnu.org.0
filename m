Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8650141C14D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:07:52 +0200 (CEST)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVZ8-0004iK-RJ
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVVWz-0003oC-5Q
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVVWt-0002tg-NQ
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632906330;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPoLJq8hH9MSD5a1S7FVEKq+yn/SA3XBMYU++5jfFVU=;
 b=Mf5TwsuEaZfZaQ1gyyzQsonfFuVVGPK2CqfGousrXYtdOQXkwFjadjBDwvinez5tu5kc+C
 rRl0tg1i5U3vDA4500e19HCWhYHeL66yNPRR0ZgdtwGOraKzL5v8y667DRviSZhNE/lXvh
 gfpd9B5Wx+4unsM68QANu+XiBJ6sC5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-s-L4HcWVPGuHXqn4ypzHrw-1; Wed, 29 Sep 2021 05:05:24 -0400
X-MC-Unique: s-L4HcWVPGuHXqn4ypzHrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B08E5652;
 Wed, 29 Sep 2021 09:05:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E98A45E7A2;
 Wed, 29 Sep 2021 09:05:14 +0000 (UTC)
Date: Wed, 29 Sep 2021 10:05:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
Message-ID: <YVQsR898/knP1y3M@redhat.com>
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com>
 <20210927053932-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210927053932-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Marcel Apfelbaum <marcel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 05:49:15AM -0400, Michael S. Tsirkin wrote:
> On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrangé wrote:
> > On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrote:
> > > From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > 
> > > Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> > > As opposed to native PCIe hotplug, guests like Fedora 34
> > > will not assign IO range to pcie-root-ports not supporting
> > > native hotplug, resulting into a regression.
> > > 
> > > Reproduce by:
> > >     qemu-bin -M q35 -device pcie-root-port,id=p1 -monitor stdio
> > >     device_add e1000,bus=p1
> > > In the Guest OS the respective pcie-root-port will have the IO range
> > > disabled.
> > > 
> > > Fix it by setting the "reserve-io" hint capability of the
> > > pcie-root-ports so the firmware will allocate the IO range instead.
> > > 
> > > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > > Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> > > Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > 
> > This change, when combined with the switch to ACPI based hotplug by
> > default, is responsible for a significant regression in QEMU 6.1.0
> > 
> > It is no longer possible to have more than 15 pcie-root-port devices
> > added to a q35 VM in 6.1.0.  Before this I've had as many as 80+ devices
> > present before I stopped trying to add more.
> > 
> >   https://gitlab.com/qemu-project/qemu/-/issues/641
> > 
> > This regression is significant, because it has broken the out of the
> > box default configuration that OpenStack uses for booting all VMs.
> > They add 16 pcie-root-ports by defalt to allow empty slots for device
> > hotplug under q35 [1].
> 
> 
> Indeed, oops. Thanks for the report!
> 
> Going back and looking at seabios code, didn't we get confused?
> Shouldn't we have reserved memory and not IO?
> 
> I see:
>             int resource_optional = pcie_cap && (type == PCI_REGION_TYPE_IO);
>             if (!sum && hotplug_support && !resource_optional)
>                 sum = align; /* reserve min size for hot-plug */
> 
> 
> generally maybe we should just add an ACPI-hotplug capability and
> teach seabios about it?

Looking at the commit message example:

   qemu-bin -M q35 -device pcie-root-port,id=p1 -monitor stdio
   device_add e1000,bus=p1

IIUC, that is plugging a PCI device into the PCIe root port.

docs/pcie.txt says that IO space is not allocated by SeaBIOS
or OVMF for pcie-root-port, if

    (1) the port is empty, or
    (2) the device behind the port has no IO BARs.

Point (2) is satisified if you only ever plug PCIe devces into
the pcie-root-port. The docs/pcie.txt recommends exactly that,
with any PCI device to be placed downstream of a pcie-pci-bridge
and pci-pci-bridge pair.

IOW that example from the commit message should have been 

  qemu-bin -M q35 -device pcie-root-port,id=p1 -monitor stdio \
       -device pcie-pci-bridge,id=br1,bus=pcie.0] \
       -device pci-bridge,id=br2,bus=br1,chassis_nr=1
  device-add e1000,bus=br2

So why did we need IO space for the pcie-root-port at all ?
The example given as the reason just looks like user error
per the docs/pcie.txt

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


