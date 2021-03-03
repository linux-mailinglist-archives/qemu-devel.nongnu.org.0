Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636132B61A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:19:40 +0100 (CET)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNfP-0003qU-2e
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHNeA-0003P8-Rf
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:18:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHNe9-0008SP-0u
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614763100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8aDa2UBbBwRUbFTjc/tN0MwEJhUi+K8J5A19XMIEA8=;
 b=Zue1MYoIrp4Vrbr8G0gsU8UbTAD6sGgIdUH6JxGi7+eyxK7GLF17GtgK4bbAFjGq207TwV
 z+CZY+J88J4x/aJt7ptuGUz5bpa4L5GkUTHNSQYXw7nbmYmEFdRtaV4BARxyAg9Pyn1iYX
 BPBLaqpvdj85Jvf7W41sy2f1TnmwLUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-z2mwH7LGPUu9fIoPrLmpkg-1; Wed, 03 Mar 2021 04:18:18 -0500
X-MC-Unique: z2mwH7LGPUu9fIoPrLmpkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5FA985B67D;
 Wed,  3 Mar 2021 09:18:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B36D7101E246;
 Wed,  3 Mar 2021 09:18:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 46C841800D4D; Wed,  3 Mar 2021 10:18:04 +0100 (CET)
Date: Wed, 3 Mar 2021 10:18:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
Message-ID: <20210303091804.5fm4esvd2iixbgew@sirius.home.kraxel.org>
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
 <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
 <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
 <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
 <20210225114626.dn7wevr3fozp5rcu@sirius.home.kraxel.org>
 <CAMVc7JX-E_3fE9SCOaYFAtDBRHNmHxmHWiqcJDPE-4zq-QHJbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JX-E_3fE9SCOaYFAtDBRHNmHxmHWiqcJDPE-4zq-QHJbQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 26, 2021 at 01:47:38PM +0900, Akihiko Odaki wrote:
> 2021年2月25日(木) 20:46 Gerd Hoffmann <kraxel@redhat.com>:
> >
> >   Hi,
> >
> > > > Because of the wasted frames I'd like this to be an option you can
> > > > enable when needed.  For the majority of use cases this seems to be
> > > > no problem ...
> > >
> > > I see blinks with GNOME on Wayland on Ubuntu 20.04 and virtio-gpu with
> > > the EDID change included in this patch.
> >
> > /me looks closely at the patch again.
> >
> > So you update the edid dynamically, each time the refresh rate changes.
> > Problem with that approach is software doesn't expect edid to change
> > dynamically because on physical hardware it is static information about
> > the connected monitor.
> >
> > So what the virtio-gpu guest driver does is emulate a monitor hotplug
> > event to notify userspace.  If you resize the qemu window on the host
> > it'll look like the monitor with the old window size was unplugged and
> > a new monitor with the new window size got plugged instead, so gnome
> > shell goes adapt the display resolution to the new virtual monitor size.
> >
> > The blink you are seeing probably comes from gnome-shell processing the
> > monitor hotplug event.
> >
> > We could try to skip generating a monitor hotplug event in case only the
> > refresh rate did change.  That would fix the blink, but it would also
> > have the effect that nobody will notice the update.
> >
> > Bottom line:  I think making the edid refresh rate configurable might be
> > useful, but changing it dynamically most likely isn't.
> >
> > take care,
> >   Gerd
> 
> The "hotplug" implementation is probably what other combinations of
> devices and guests will do if they want to respond to the changes of
> the refresh rate, or display mode in general. That makes telling the
> dynamic refresh rate to guests infeasible.
> 
> As you wrote, making the refresh rate configurable should be still
> useful, and I think matching it to the backend physical display is
> even better. GTK, the sole implementer of gfx_update_interval in my
> patch reports the refresh rate of the physical display the window
> resides in. It means the value may change when the physical display
> changes its refresh rate, which should be rare if it does, or the
> window moves to another physical display.

Yes.  Added debug printf, can see that it changes exactly twice for me,
once to the default value and then to the real refresh rate.

That rules out the hotplug event as source for the blinks.  I'm
wondering where they are coming from, and I can't reproduce them
on my machine ...

> consistent. The only inconsistency I see in my patch is that the
> refresh rate change has no throttling while the window size change
> has. I don't think it is problematic because it should be rare to move
> the window across physical displays, but I can implement one if you
> don't agree or know other cases the refresh rate frequently changes.

I think it would be best to just add a new field for the refresh rate
to QemuUIInfo.  That avoids a new callback you also get the throttling
for free ;)

take care,
  Gerd


