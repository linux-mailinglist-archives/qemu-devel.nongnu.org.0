Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813CE315286
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:19:47 +0100 (CET)
Received: from localhost ([::1]:51986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Unq-0000nJ-9y
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9UmP-0008Rp-Q2
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:18:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9UmN-00089P-QW
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612883894;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcYOh2vrnTT+Df8ehez4lBKkLU4qC4iZtnBWhr7XP0M=;
 b=Tk1gOTmKzb2qO+LpkZi511GtAOdEOY6+oXTmazZCqj1v+dFUX60Usv+aL5tA+VS7kMyWmI
 Zr3BG77LTNCWz30ciin+3L8ifYO/vOEwLwBu+DA9qdcY+wCvy4J6ANGEOe2lFqWzzNWB9X
 VfJZt9mA2SqOvvwZzxbx3NRhHiMduqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-muolUX8BNLa-zzR5vCa1MQ-1; Tue, 09 Feb 2021 10:18:09 -0500
X-MC-Unique: muolUX8BNLa-zzR5vCa1MQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A20B107ACF4;
 Tue,  9 Feb 2021 15:18:08 +0000 (UTC)
Received: from redhat.com (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95DE660C4D;
 Tue,  9 Feb 2021 15:18:03 +0000 (UTC)
Date: Tue, 9 Feb 2021 15:18:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/3] virtio-net: graceful drop of vhost for TAP
Message-ID: <20210209151800.GQ1166421@redhat.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210209093201-mutt-send-email-mst@kernel.org>
 <20210209145105.GP1166421@redhat.com>
 <20210209095553-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210209095553-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: yan@daynix.com, Yuri Benditovich <yuri.benditovich@daynix.com>,
 jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 10:04:30AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 09, 2021 at 02:51:05PM +0000, Daniel P. Berrangé wrote:
> > On Tue, Feb 09, 2021 at 09:34:20AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Feb 04, 2021 at 10:29:12PM +0200, Yuri Benditovich wrote:
> > > > This set of patches introduces graceful switch from tap-vhost to
> > > > tap-no-vhost depending on guest features. Before that the features
> > > > that vhost does not support were silently cleared in get_features.
> > > > This creates potential problem of migration from the machine where
> > > > some of virtio-net features are supported by the vhost kernel to the
> > > > machine where they are not supported (packed ring as an example).
> > > 
> > > I still worry that adding new features will silently disable vhost for people.
> > > Can we limit the change to when a VM is migrated in?
> > 
> > Some management applications expect bi-directional live migration to
> > work, so taking specific actions on incoming migration only feels
> > dangerous. 
> 
> Could you be more specific?
> 
> Bi-directional migration is currently broken
> when migrating new kernel->old kernel.

At the very least  new QEMU -> old QEMU, but in general new kernel
to old kerenl would be expected too. Assuming a QEMU command line
is using a versioned machine type, and not using host passthrough
features (-cpu host), then it should in general represent a fixed
guest ABI  independant of kernel version/features.

> > IMHO if the features we're adding cannot be expected to exist in
> > host kernels in general, then the feature should defualt to off
> > and require explicit user config to enable.
> > Downstream distros which can guarantee newer kernels can flip the
> > default in their custom machine types if they desire.
> 
> Unfortunately that will basically mean we are stuck with no new features
> for years. We did what this patch is trying to change for years now, in
> particular KVM also seems to happily disable CPU features not supported
> by kernel so I wonder why we can't keep doing it, with tweaks for some
> corner cases.

Yep, it is not great from a upstream POV.

In upstream we've traditionally not expressed a specific min
kernel version we expect to be run on. So that lmits what we
can do in upstram machine types.  Downstram distros can
expose stuff pretty much immediately if they desire.

eg if RHEL 8 adds the kernel feature in 8.5, it could in
theory add the feature by default in pc-q35-rhel8.5.0 machine
types (if we ignore pain of containers running on old kernels).
Even if we take into account mismatched usrespace/kernel, the
downstram distros can adopt much more quickly.

There is probably scope for upstream to be more explicit about
min required kernel features, but we'll always be worse upstream
because we target a broader range of platforms/distros.

> userspace and kernel not being in 100% sync wrt features is not
> a corner case though, and switching backends seems like too big
> a hammer.

Yes, the containers world in particular has made life much worse,
because the mis-matched combinations of  userspace and kernel are
much more likely. In fact I'd say out of sync kernel+userspace
is arguably going to become the common case in future.

eg worst case someone running a RHEL-8 userspace on a RHEL-7
container host or vica verca.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


