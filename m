Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732352F5EE9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 11:38:22 +0100 (CET)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l001F-0003mw-IC
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 05:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l0002-0003Bx-41
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:37:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kzzzz-0000HX-TZ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610620623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ArMEYMxt1aGuAZDThGV6VJabcOkpJRR+nDUpyDI9Lk=;
 b=iQeagjFncLjWdDez2oUKygMJB1kWwci2LGzqelUvA9f/zxruusiOXF+/uXgM7Fq/cgMRoo
 uIt95bjdobMtmM08u5DaVldL0/kZjm1Scu5CuFlIkjno5y0eMy/1b1F5iUEL/6pJ/squUC
 L55iLMSgQxCe/WgzilPhCqwpm/a7QXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-6igFpg3fPI2_xql-Ql6rXw-1; Thu, 14 Jan 2021 05:36:59 -0500
X-MC-Unique: 6igFpg3fPI2_xql-Ql6rXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E80B19251AE;
 Thu, 14 Jan 2021 10:36:57 +0000 (UTC)
Received: from work-vm (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4136412D7E;
 Thu, 14 Jan 2021 10:36:45 +0000 (UTC)
Date: Thu, 14 Jan 2021 10:36:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20210114103643.GD2905@work-vm>
References: <20201217151530.54431f0e@bahia.lan>
 <20201218124111.4957eb50.cohuck@redhat.com>
 <20210104071550.GA22585@ram-ibm-com.ibm.com>
 <20210104134629.49997b53.pasic@linux.ibm.com>
 <20210104184026.GD4102@ram-ibm-com.ibm.com>
 <20210105115614.7daaadd6.pasic@linux.ibm.com>
 <20210105204125.GE4102@ram-ibm-com.ibm.com>
 <20210111175914.13adfa2e.cohuck@redhat.com>
 <20210113124226.GH2938@work-vm>
 <6e02e8d5-af4b-624b-1a12-d03b9d554a41@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e02e8d5-af4b-624b-1a12-d03b9d554a41@de.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 David Gibson <david@gibson.dropbear.id.au>, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, rth@twiddle.net, berrange@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Christian Borntraeger (borntraeger@de.ibm.com) wrote:
> 
> 
> On 13.01.21 13:42, Dr. David Alan Gilbert wrote:
> > * Cornelia Huck (cohuck@redhat.com) wrote:
> >> On Tue, 5 Jan 2021 12:41:25 -0800
> >> Ram Pai <linuxram@us.ibm.com> wrote:
> >>
> >>> On Tue, Jan 05, 2021 at 11:56:14AM +0100, Halil Pasic wrote:
> >>>> On Mon, 4 Jan 2021 10:40:26 -0800
> >>>> Ram Pai <linuxram@us.ibm.com> wrote:
> >>
> >>>>> The main difference between my proposal and the other proposal is...
> >>>>>
> >>>>>   In my proposal the guest makes the compatibility decision and acts
> >>>>>   accordingly.  In the other proposal QEMU makes the compatibility
> >>>>>   decision and acts accordingly. I argue that QEMU cannot make a good
> >>>>>   compatibility decision, because it wont know in advance, if the guest
> >>>>>   will or will-not switch-to-secure.
> >>>>>   
> >>>>
> >>>> You have a point there when you say that QEMU does not know in advance,
> >>>> if the guest will or will-not switch-to-secure. I made that argument
> >>>> regarding VIRTIO_F_ACCESS_PLATFORM (iommu_platform) myself. My idea
> >>>> was to flip that property on demand when the conversion occurs. David
> >>>> explained to me that this is not possible for ppc, and that having the
> >>>> "securable-guest-memory" property (or whatever the name will be)
> >>>> specified is a strong indication, that the VM is intended to be used as
> >>>> a secure VM (thus it is OK to hurt the case where the guest does not
> >>>> try to transition). That argument applies here as well.  
> >>>
> >>> As suggested by Cornelia Huck, what if QEMU disabled the
> >>> "securable-guest-memory" property if 'must-support-migrate' is enabled?
> >>> Offcourse; this has to be done with a big fat warning stating
> >>> "secure-guest-memory" feature is disabled on the machine.
> >>> Doing so, will continue to support guest that do not try to transition.
> >>> Guest that try to transition will fail and terminate themselves.
> >>
> >> Just to recap the s390x situation:
> >>
> >> - We currently offer a cpu feature that indicates secure execution to
> >>   be available to the guest if the host supports it.
> >> - When we introduce the secure object, we still need to support
> >>   previous configurations and continue to offer the cpu feature, even
> >>   if the secure object is not specified.
> >> - As migration is currently not supported for secured guests, we add a
> >>   blocker once the guest actually transitions. That means that
> >>   transition fails if --only-migratable was specified on the command
> >>   line. (Guests not transitioning will obviously not notice anything.)
> >> - With the secure object, we will already fail starting QEMU if
> >>   --only-migratable was specified.
> >>
> >> My suggestion is now that we don't even offer the cpu feature if
> >> --only-migratable has been specified. For a guest that does not want to
> >> transition to secure mode, nothing changes; a guest that wants to
> >> transition to secure mode will notice that the feature is not available
> >> and fail appropriately (or ultimately, when the ultravisor call fails).
> >> We'd still fail starting QEMU for the secure object + --only-migratable
> >> combination.
> >>
> >> Does that make sense?
> > 
> > It's a little unusual; I don't think we have any other cases where
> > --only-migratable changes the behaviour; I think it normally only stops
> > you doing something that would have made it unmigratable or causes
> > an operation that would make it unmigratable to fail.
> 
> I would like to NOT block this feature with --only-migrateable. A guest
> can startup unprotected (and then is is migrateable). the migration blocker
> is really a dynamic aspect during runtime. 

But the point of --only-migratable is to turn things that would have
blocked migration into failures, so that a VM started with
--only-migratable is *always* migratable.


Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


