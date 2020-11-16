Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1D72B43F1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:47:57 +0100 (CET)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedvI-0002uB-IX
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kedtv-00021E-Bf
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kedtt-0002VH-0F
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605530788;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAII9NimIJPcVrzDkTqRiw6iebaE78/LEZ1Pg0oL8h4=;
 b=fjcXIuymIG6KowNwS+UARYnEVf2jZMndL9uEYMhZs9qryCtb0t5qv7mRUV0C2MvnFy57pe
 zVGxPIdpHeN2QuJ+azX2hRVtefdL0O7UXSKmrQOvRMGX62fL46CYlakMxwJ3EeyM/TvO9n
 6qD77MKCuuwP9rXHRkMsxOlHJ4Gp82k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-nf0o_TL5NvuNdWrUbA26UQ-1; Mon, 16 Nov 2020 07:46:25 -0500
X-MC-Unique: nf0o_TL5NvuNdWrUbA26UQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D65F186DD2A;
 Mon, 16 Nov 2020 12:46:23 +0000 (UTC)
Received: from redhat.com (ovpn-114-241.ams2.redhat.com [10.36.114.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 129CE5C5B7;
 Mon, 16 Nov 2020 12:45:52 +0000 (UTC)
Date: Mon, 16 Nov 2020 12:45:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116124549.GI104771@redhat.com>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
 <20201111154850.GG906488@redhat.com>
 <20201116111524.GD96297@stefanha-x1.localdomain>
 <20201116114125.GE104771@redhat.com>
 <20201116065906-mutt-send-email-mst@kernel.org>
 <20201116120518.GH104771@redhat.com>
 <20201116072805-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201116072805-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 07:34:25AM -0500, Michael S. Tsirkin wrote:
> On Mon, Nov 16, 2020 at 12:05:18PM +0000, Daniel P. BerrangÃ© wrote:
> > On Mon, Nov 16, 2020 at 07:03:03AM -0500, Michael S. Tsirkin wrote:
> > > On Mon, Nov 16, 2020 at 11:41:25AM +0000, Daniel P. BerrangÃÂ© wrote:
> > > > > It is possible to simplify the problem, but we'll lose freedom. For
> > > > > example, hard coding knowledge of the device implementation into the
> > > > > management tool eliminates the need for a general migration checking
> > > > > algorithm. Or we might be able to simplify it by explicitly not
> > > > > supporting cross-device implementation migration (although that would
> > > > > place stricter rules on what a new version of an existing device can
> > > > > change in order to preserve migration compatibility).
> > > > 
> > > > Is migrating between 2 different vendors' impls of the same core
> > > > device spec really a thing that's needed ? 
> > > 
> > > If there's intent to have this supercede vhost-user then certainly.
> > > Same I'm guessing for NVMe.
> > > 
> > > 
> > > > > I have doubts that these trade-offs can be made without losing support
> > > > > for use cases that are necessary.
> > > > 
> > > > >From my POV, the key goal is that it should be possible to migrate
> > > > between two hosts without needing to check every single possible
> > > > config parameter that the device supports. It should only be neccessary
> > > > to check the parameters that are actually changed from their default
> > > > values. Then there just needs to be some simple string parameter that
> > > > encodes a particular set of devices, akin to the versioned machine
> > > > type.
> > > > 
> > > > Applications that want to migration between cross-vendor device impls
> > > > could opt-in to checking every single little parameter, but most can
> > > > just stick with a much simplified view where they only have to check
> > > > the parameters that they've actually overriden/exposed.
> > > 
> > > It's a problem even for a single vendor. And we have lots of experience
> > > telling us it's a messy, difficult one. Just punting and saying
> > > vendors will do the right thing will not lead to quality
> > > implementations.
> > 
> > I'm not suggesting we punt on the problem. I'm saying that checking for
> > migration compatibility should not need to be made more complex than what
> > we already do for QEMU. The core problem being tackled is essentially the
> > same in both cases.
> 
> There's a difference: in case of QEMU versions are release based.  At
> release time a new version is generated.  So QEMU upstream ships version
> X and Red Hat ships Y at a different time and they are not compatible.

That's a difference that Red Hat maintainers chose to introduce. RHEL
could have stuck with upstream QEMU machine types if it wished to, but
it chose to ship different machine types, because it made life easier
to backport features that impacted machine types, and also to some extent
to let us fix migration compat screw ups. We could have stuck to upstream
machine types though and remained compatible.  Many other distros do just
that.

> This won't work for devices: same device needs to work with
> both upstream and Red Hat and migrate upstream-upstream and Red Hat-Red Hat
> (though not upstream-Red Hat).

That's fine, we can cope with that. It simply means whomever owns
responsibility for maintaining the code has to be more careful about
changes they make in their downstream.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


