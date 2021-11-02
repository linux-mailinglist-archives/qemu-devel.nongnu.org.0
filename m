Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35C442A5C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:26:35 +0100 (CET)
Received: from localhost ([::1]:56280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhq3v-0006VK-0H
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhq1d-0005gV-9r
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:24:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhq1Z-0006dN-9V
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635845048;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRbRYWb8MsAMnCKHFtOhh0rAaZgj3JFNywI4tYekwrM=;
 b=PxHIIWX39fAG+REJnLVhL++18By6jcADyWo+0tp28sjX8Gt9dRVYCoJQJusIIdaGqNVcbi
 Pti3SORxJzkdCgVT4Z9NEPfMzSGsWbmljtslS16HdshTlUwrY8tVkKuM6zJudWaxdS2csG
 /vf+jkufCOiTr3DBobInhWXVMDUicTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-AsiTNBKzMweLEEGZI11CDg-1; Tue, 02 Nov 2021 05:23:59 -0400
X-MC-Unique: AsiTNBKzMweLEEGZI11CDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB0281424F;
 Tue,  2 Nov 2021 09:23:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ED671007625;
 Tue,  2 Nov 2021 09:23:56 +0000 (UTC)
Date: Tue, 2 Nov 2021 09:23:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
Message-ID: <YYEDqJGe8qdKHgfh@redhat.com>
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com>
 <20210927053932-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210927053932-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

We're at soft freeze now and this is still broken in git master.
I don't recall seeing a fix for this problem on list and no one has
commented on the bug report.

Is anyone actively working on a fix for this release ?

If not, I'm going to post a patch to revert to PCI native
hotplug, because this was a significant regression in 6.1 that
breaks openstack out of the box and we can't leave it broken
again for 6.2.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


