Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747EB2A4AB6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 17:04:30 +0100 (CET)
Received: from localhost ([::1]:55682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZynN-0007er-JD
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 11:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZyKK-0002SF-63
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:34:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZyKB-0001Yy-E0
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604417655;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tDrfVqgWg6tODD6yKIm0jvFc9id1uR+tuxL7cz2+wM8=;
 b=csOmvRoTPxdhBHtBedr1QenTBpapfEGBESnE1PGa3sTlqHiSZIwG5/CM1ReeSRKgSf+s08
 O27c4YOZHj9CaE1phbAW75hIdCpY2k3ojh8xzgwlRod8//FhGQS1Afm2L0bmD+BmbDAOto
 xoAUqomGujYLKLwu981Hqz0M7P8GKGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-5nGOXHFxPzemNab9hs_yHQ-1; Tue, 03 Nov 2020 10:34:14 -0500
X-MC-Unique: 5nGOXHFxPzemNab9hs_yHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC8A810866A0;
 Tue,  3 Nov 2020 15:34:12 +0000 (UTC)
Received: from redhat.com (ovpn-115-87.ams2.redhat.com [10.36.115.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86AD11C4;
 Tue,  3 Nov 2020 15:33:59 +0000 (UTC)
Date: Tue, 3 Nov 2020 15:33:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: VFIO Migration
Message-ID: <20201103153356.GO205187@redhat.com>
References: <20201102111153.GC42093@stefanha-x1.localdomain>
 <ly5z6m79c0.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ly5z6m79c0.fsf@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: John G Johnson <john.g.johnson@oracle.com>, mtsirkin@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 03, 2020 at 04:23:43PM +0100, Christophe de Dinechin wrote:
> 
> On 2020-11-02 at 12:11 CET, Stefan Hajnoczi wrote...
> > There is discussion about VFIO migration in the "Re: Out-of-Process
> > Device Emulation session at KVM Forum 2020" thread. The current status
> > is that Kirti proposed a VFIO device region type for saving and loading
> > device state. There is currently no guidance on migrating between
> > different device versions or device implementations from different
> > vendors. This is known to be non-trivial and raised discussion about
> > whether it should really be handled by VFIO or centralized in QEMU.
> >
> > Below is a document that describes how to ensure migration compatibility
> > in VFIO. It does not require changes to the VFIO migration interface. It
> > can be used for both VFIO/mdev kernel devices and vfio-user devices.
> >
> > The idea is that the device state blob is opaque to the VMM but the same
> > level of migration compatibility that exists today is still available.
> >
> > I hope this will help us reach consensus and let us discuss specifics.
> >
> > If you followed the previous discussion, I changed the approach from
> > sending a magic constant in the device state blob to identifying device
> > models by URIs. Therefore the device state structure does not need to be
> > defined here - the critical information for ensuring device migration
> > compatibility is the device model and configuration defined below.
> >
> > Stefan
> > ---
> > VFIO Migration
> > ==============
> > This document describes how to save and load VFIO device states. Saving a
> > device state produces a snapshot of a VFIO device's state that can be loaded
> > again at a later point in time to resume the device from the snapshot.
> >
> > The data representation of the device state is outside the scope of this
> > document.
> >
> > Overview
> > --------
> > The purpose of device states is to save the device at a point in time and then
> > restore the device back to the saved state later. This is more challenging than
> > it first appears.
> >
> > The process of saving a device state and loading it later is called
> > *migration*. The state may be loaded by the same device that saved it or by a
> > new instance of the device, possibly running on a different computer.
> >
> > It must be possible to migrate to a newer implementation of the device
> > as well as to an older implementation of the device. This allows users
> > to upgrade and roll back their systems.
> >
> > Migration can fail if loading the device state is not possible. It should fail
> > early with a clear error message. It must not appear to complete but leave the
> > device inoperable due to a migration problem.
> >
> > The rest of this document describes how these requirements can be met.
> >
> > Device Models
> > -------------
> > Devices have a *hardware interface* consisting of hardware registers,
> > interrupts, and so on.
> >
> > The hardware interface together with the device state representation is called
> > a *device model*. Device models can be assigned URIs such as
> > https://qemu.org/devices/e1000e to uniquely identify them.
> 
> Like others, I think we should either
> 
> a) Give a relatively strong requirement regarding what is at the URL in
> question, e.g. docs, maybe even a machine-readable schema describing
> configuration and state for the device. Leaving the option "there can be
> nothing here" is IMO asking for trouble.
> 
> b) simply call that a unique ID, and then either drop the https: entirely or
> use something else, like pci:// or, to be more specific, vfio://
> 
> I'd favor option (b) for a different practical reason. URLs are subject to
> redirection and other mishaps. For example, using https:// begs the question
> whether
> https://qemu.org/devices/e1000e and
> https://www.qemu.org/devices/e1000e
> should be treated as the same device. I believe that your intent is that
> they shouldn't, but if the qemu web server redirects to www, and someone
> wants to copy-paste their web browser's URL bar to the command line, they'd
> get the wrong one.

That's not a real world problem IMHO, because neither of these URLs
ever need resolve to a real webpage, and thus not need to be cut +
paste from a browser.

They are simply expressing a resource identifier using a URI as a
convenient format. This is the same as an XML namespace using a URI,
and rarely, if ever, resolving to any actual web page.

This is a good thing, because if you say there needs to be a real page
there, then it creates a pile of corporate beaurocracy for contributors.
I can freely create a URI under https://redhat.com for purposes of being
a identifier, but I cannot get any content published there without jumping
through many tedious corporate approvals and stand a good chance of being
rejected.

If we're truely treating the URIs as an opaque string, we don't especially
need to define any rules other than to say it should be under a domain that
you have authority over either directly, or via membership of a project
that delegates. We can suggest "https" since seeing "http" is a red flag
for many people these days.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


