Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C52FA7CF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:45:24 +0100 (CET)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Yah-0000TN-RS
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1YVH-0004UC-NG
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:39:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1YVE-0007Iz-E0
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610991578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X15+VkT7M78mSFfo/qnb5Wzv8facU/FgWbJCl9EtkQE=;
 b=EyCeqof6PIhK3/SSya4uncS7Pu1mR9jtbG2IbqTVS0UenqEjzI2pIpNN3ZU9BEhQ2zrnee
 aelvlcnoj73o4MRgxHXlb/wZIYOIcH8N960wVlzfmp4qP6Edo7aKEDQkEZfH6OMGO00pyv
 d1+V2s0kzJQYAbEjFkPxIjqUbYvvrI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-1P1DwBnRNpi7kX2HgDLh5w-1; Mon, 18 Jan 2021 12:39:33 -0500
X-MC-Unique: 1P1DwBnRNpi7kX2HgDLh5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A789D1005D4E;
 Mon, 18 Jan 2021 17:39:30 +0000 (UTC)
Received: from work-vm (ovpn-115-197.ams2.redhat.com [10.36.115.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB75818F15;
 Mon, 18 Jan 2021 17:39:15 +0000 (UTC)
Date: Mon, 18 Jan 2021 17:39:12 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20210118173912.GF9899@work-vm>
References: <20201218124111.4957eb50.cohuck@redhat.com>
 <20210104071550.GA22585@ram-ibm-com.ibm.com>
 <20210104134629.49997b53.pasic@linux.ibm.com>
 <20210104184026.GD4102@ram-ibm-com.ibm.com>
 <20210105115614.7daaadd6.pasic@linux.ibm.com>
 <20210105204125.GE4102@ram-ibm-com.ibm.com>
 <20210111175914.13adfa2e.cohuck@redhat.com>
 <20210113124226.GH2938@work-vm>
 <20210114112517.GE1643043@redhat.com>
 <20210114235125.GO435587@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114235125.GO435587@yekko.fritz.box>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, Cornelia Huck <cohuck@redhat.com>, brijesh.singh@amd.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, qemu-devel@nongnu.org, frankja@linux.ibm.com,
 david@redhat.com, mdroth@linux.vnet.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, rth@twiddle.net,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Gibson (david@gibson.dropbear.id.au) wrote:
> On Thu, Jan 14, 2021 at 11:25:17AM +0000, Daniel P. Berrangé wrote:
> > On Wed, Jan 13, 2021 at 12:42:26PM +0000, Dr. David Alan Gilbert wrote:
> > > * Cornelia Huck (cohuck@redhat.com) wrote:
> > > > On Tue, 5 Jan 2021 12:41:25 -0800
> > > > Ram Pai <linuxram@us.ibm.com> wrote:
> > > > 
> > > > > On Tue, Jan 05, 2021 at 11:56:14AM +0100, Halil Pasic wrote:
> > > > > > On Mon, 4 Jan 2021 10:40:26 -0800
> > > > > > Ram Pai <linuxram@us.ibm.com> wrote:
> > > > 
> > > > > > > The main difference between my proposal and the other proposal is...
> > > > > > > 
> > > > > > >   In my proposal the guest makes the compatibility decision and acts
> > > > > > >   accordingly.  In the other proposal QEMU makes the compatibility
> > > > > > >   decision and acts accordingly. I argue that QEMU cannot make a good
> > > > > > >   compatibility decision, because it wont know in advance, if the guest
> > > > > > >   will or will-not switch-to-secure.
> > > > > > >   
> > > > > > 
> > > > > > You have a point there when you say that QEMU does not know in advance,
> > > > > > if the guest will or will-not switch-to-secure. I made that argument
> > > > > > regarding VIRTIO_F_ACCESS_PLATFORM (iommu_platform) myself. My idea
> > > > > > was to flip that property on demand when the conversion occurs. David
> > > > > > explained to me that this is not possible for ppc, and that having the
> > > > > > "securable-guest-memory" property (or whatever the name will be)
> > > > > > specified is a strong indication, that the VM is intended to be used as
> > > > > > a secure VM (thus it is OK to hurt the case where the guest does not
> > > > > > try to transition). That argument applies here as well.  
> > > > > 
> > > > > As suggested by Cornelia Huck, what if QEMU disabled the
> > > > > "securable-guest-memory" property if 'must-support-migrate' is enabled?
> > > > > Offcourse; this has to be done with a big fat warning stating
> > > > > "secure-guest-memory" feature is disabled on the machine.
> > > > > Doing so, will continue to support guest that do not try to transition.
> > > > > Guest that try to transition will fail and terminate themselves.
> > > > 
> > > > Just to recap the s390x situation:
> > > > 
> > > > - We currently offer a cpu feature that indicates secure execution to
> > > >   be available to the guest if the host supports it.
> > > > - When we introduce the secure object, we still need to support
> > > >   previous configurations and continue to offer the cpu feature, even
> > > >   if the secure object is not specified.
> > > > - As migration is currently not supported for secured guests, we add a
> > > >   blocker once the guest actually transitions. That means that
> > > >   transition fails if --only-migratable was specified on the command
> > > >   line. (Guests not transitioning will obviously not notice anything.)
> > > > - With the secure object, we will already fail starting QEMU if
> > > >   --only-migratable was specified.
> > > > 
> > > > My suggestion is now that we don't even offer the cpu feature if
> > > > --only-migratable has been specified. For a guest that does not want to
> > > > transition to secure mode, nothing changes; a guest that wants to
> > > > transition to secure mode will notice that the feature is not available
> > > > and fail appropriately (or ultimately, when the ultravisor call fails).
> > > > We'd still fail starting QEMU for the secure object + --only-migratable
> > > > combination.
> > > > 
> > > > Does that make sense?
> > > 
> > > It's a little unusual; I don't think we have any other cases where
> > > --only-migratable changes the behaviour; I think it normally only stops
> > > you doing something that would have made it unmigratable or causes
> > > an operation that would make it unmigratable to fail.
> > 
> > I agree,  --only-migratable is supposed to be a *behavioural* toggle
> > for QEMU. It must /not/ have any impact on the guest ABI.
> > 
> > A management application needs to be able to add/remove --only-migratable
> > at will without changing the exposing guest ABI.
> 
> At the qemu level, it sounds like the right thing to do is to fail
> outright if all of the below are true:
>  1. --only-migratable is specified
>  2. -cpu host is specified
>  3. unpack isn't explicitly disabled
>  4. the host CPU actually does have the unpack facility
> 
> That can be changed if & when migration support is added for PV.

That sounds right to me.

Dave

> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


