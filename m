Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2822F45D9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 09:09:27 +0100 (CET)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzbDa-0007Xo-L3
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 03:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzbB8-0005Tp-0f
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:06:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzbB5-0003hu-Uc
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610525211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXJkO2Cuh1cA7YUDXnTNy9rr8R+H09pjoolci07NnT8=;
 b=NoCseD8UN2l5f1v/NwNPGvR5V+2EmZnQ77CslYVWx3Gme7iDQ5JEJrIVydm88geFSnJFRj
 1kJR+kcvM6m6PPweKlatjJwEevTRrajg0PGjS3Tv5Ex/1+H/++gTz11b07q5OiqhJ63iXE
 okLohlev3BXzACOG/mQ8mRCRaGxVvMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-QpxMQ0e0PqW7bblrJPE33A-1; Wed, 13 Jan 2021 03:06:46 -0500
X-MC-Unique: QpxMQ0e0PqW7bblrJPE33A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F19BB100A240;
 Wed, 13 Jan 2021 08:06:43 +0000 (UTC)
Received: from gondolin (ovpn-114-8.ams2.redhat.com [10.36.114.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD24F10074E1;
 Wed, 13 Jan 2021 08:06:31 +0000 (UTC)
Date: Wed, 13 Jan 2021 09:06:29 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20210113090629.2f41a9d3.cohuck@redhat.com>
In-Reply-To: <20210112185511.GB23898@ram-ibm-com.ibm.com>
References: <20201217151530.54431f0e@bahia.lan>
 <20201218124111.4957eb50.cohuck@redhat.com>
 <20210104071550.GA22585@ram-ibm-com.ibm.com>
 <20210104134629.49997b53.pasic@linux.ibm.com>
 <20210104184026.GD4102@ram-ibm-com.ibm.com>
 <20210105115614.7daaadd6.pasic@linux.ibm.com>
 <20210105204125.GE4102@ram-ibm-com.ibm.com>
 <20210111175914.13adfa2e.cohuck@redhat.com>
 <20210111195830.GA23898@ram-ibm-com.ibm.com>
 <20210112091943.095c3b29.cohuck@redhat.com>
 <20210112185511.GB23898@ram-ibm-com.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, frankja@linux.ibm.com,
 david@redhat.com, mdroth@linux.vnet.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, David Gibson <david@gibson.dropbear.id.au>,
 thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 dgilbert@redhat.com, qemu-s390x@nongnu.org, rth@twiddle.net,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 10:55:11 -0800
Ram Pai <linuxram@us.ibm.com> wrote:

> On Tue, Jan 12, 2021 at 09:19:43AM +0100, Cornelia Huck wrote:
> > On Mon, 11 Jan 2021 11:58:30 -0800
> > Ram Pai <linuxram@us.ibm.com> wrote:
> >   
> > > On Mon, Jan 11, 2021 at 05:59:14PM +0100, Cornelia Huck wrote:  
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
> > > 
> > > 
> > > On POWER, secure-execution is not **automatically** enabled even when
> > > the host supports it.  The feature is enabled only if the secure-object
> > > is configured, and the host supports it.  
> > 
> > Yes, the cpu feature on s390x is simply pre-existing.
> >   
> > > 
> > > However the behavior proposed above will be consistent on POWER and
> > > on s390x,  when '--only-migratable' is specified and 'secure-object'
> > > is NOT specified.
> > > 
> > > So I am in agreement till now. 
> > > 
> > >   
> > > > We'd still fail starting QEMU for the secure object + --only-migratable
> > > > combination.    
> > > 
> > > Why fail? 
> > > 
> > > Instead, print a warning and  disable the secure-object; which will
> > > disable your cpu-feature. Guests that do not transition to secure, will
> > > continue to operate, and guests that transition to secure, will fail.  
> > 
> > But that would be consistent with how other non-migratable objects are
> > handled, no? It's simply a case of incompatible options on the command
> > line.  
> 
> Actually the two options are inherently NOT incompatible.  Halil also
> mentioned this in one of his replies.
> 
> Its just that the current implementation is lacking, which will be fixed
> in the near future. 
> 
> We can design it upfront, with the assumption that they both are compatible.
> In the short term  disable one; preferrably the secure-object, if both 
> options are specified. In the long term, remove the restriction, when
> the implemetation is complete.

Can't we simply mark the object as non-migratable now, and then remove
that later? I don't see what is so special about it.


