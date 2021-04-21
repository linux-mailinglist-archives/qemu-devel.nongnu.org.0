Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EE236674D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:52:43 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ8bC-0004Uk-Gg
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZ8Zn-00044U-1q
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZ8Zk-0004El-2l
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618995070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1m9Hq7aCJQt+tKeLEjRnX3kyqLteB1BkScWknWFEh7Q=;
 b=jUqdgIxE89y1/5NHtVa6F+kP3RjknD5tMIYcNRPwnG1hrUzEIqOsGY3vBNEOcXNXg+OpOe
 OPdwyRk+qhZJFQd0qSFNKwCs9+uF2Fou3Xu7D99xK0uOYy12LyMBrZk3rZVisCCBnG6Ttz
 cvzRXPJhU2kcoGiMGgjkMyMGgJMzNuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-w6MJx0I-M_Cg34IUNcIrAg-1; Wed, 21 Apr 2021 04:50:53 -0400
X-MC-Unique: w6MJx0I-M_Cg34IUNcIrAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3604D8030B5;
 Wed, 21 Apr 2021 08:50:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12D7B6061F;
 Wed, 21 Apr 2021 08:50:46 +0000 (UTC)
Date: Wed, 21 Apr 2021 09:50:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH 0/2] i386: Fix interrupt based Async PF enablement
Message-ID: <YH/nZNk49bPdSyF/@redhat.com>
References: <20210401151957.408028-1-vkuznets@redhat.com>
 <ea3fc380-332f-b9e5-aa31-3540916cfc33@redhat.com>
 <87sg43d4gk.fsf@vitty.brq.redhat.com>
 <091dec53-cc0c-04ca-154a-3cfab6475705@redhat.com>
 <YHiQlkIOHDClFfXS@work-vm>
 <20210420173541.24kxarhw75h2rqxa@habkost.net>
 <8735vkhw29.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <8735vkhw29.fsf@vitty.brq.redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 21, 2021 at 10:38:06AM +0200, Vitaly Kuznetsov wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Apr 15, 2021 at 08:14:30PM +0100, Dr. David Alan Gilbert wrote:
> >> * Paolo Bonzini (pbonzini@redhat.com) wrote:
> >> > On 06/04/21 13:42, Vitaly Kuznetsov wrote:
> >> > > older machine types are still available (I disable it for <= 5.1 but we
> >> > > can consider disabling it for 5.2 too). The feature is upstream since
> >> > > Linux 5.8, I know that QEMU supports much older kernels but this doesn't
> >> > > probably mean that we can't enable new KVM PV features unless all
> >> > > supported kernels have it, we'd have to wait many years otherwise.
> >> > 
> >> > Yes, this is a known problem in fact. :(  In 6.0 we even support RHEL 7,
> >> > though that will go away in 6.1.
> >> > 
> >> > We should take the occasion of dropping RHEL7 to be clearer about which
> >> > kernels are supported.
> >> 
> >> It would be nice to be able to define sets of KVM functonality that we
> >> can either start given machine types with, or provide a separate switch
> >> to limit kvm functionality back to some defined point.  We do trip over
> >> the same things pretty regularly when accidentally turning on new
> >> features.
> >
> > The same idea can apply to the hyperv=on stuff Vitaly is working
> > on.  Maybe we should consider making a generic version of the
> > s390x FeatGroup code, use it to define convenient sets of KVM and
> > hyperv features.
> 
> True, the more I look at PV features enablement, the more I think that
> we're missing something important in the logic. All machine types we
> have are generally suposed to work with the oldest supported kernel so
> we should wait many years before enabling some of the new PV features
> (KVM or Hyper-V) by default.
> 
> This also links to our parallel discussion regarding migration
> policies. Currently, we can't enable PV features by default based on
> their availability on the host because of migration, the set may differ
> on the destination host. What if we introduce (and maybe even switch to
> it by default) something like
> 
>  -migratable opportunistic (stupid name, I know)
> 
> which would allow to enable all features supported by the source host
> and then somehow checking that the destination host has them all. This
> would effectively mean that it is possible to migrate a VM to a
> same-or-newer software (both kernel an QEMU) but not the other way
> around. This may be a reasonable choice.

I don't think this is usable in pratice. Any large cloud or data center
mgmt app using QEMU relies on migration, so can't opportunistically
use arbitrary new features. They can only use features in the oldest
kernel their deployment cares about. This can be newer than the oldest
that QEMU supports, but still older than the newest that exists.

ie we have situation where:

 - QEMU upstream minimum host is version 7
 - Latest possible host is version 45
 - A particular deployment has a mixture of hosts at version 24 and 37

"-migratable opportunistic"  would let QEMU use features from version 37
despite the deployment needing compatibility with host version 24 still.


It is almost as if we need to have a way to explicitly express a minimum
required host version that VM requires compatibility with, so deployments
can set their own baseline that is newer than QEMU minimum.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


