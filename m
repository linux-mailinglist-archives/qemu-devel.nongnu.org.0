Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C613B3FEF05
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:56:42 +0200 (CEST)
Received: from localhost ([::1]:34638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLnCr-0006BB-T9
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLn9k-0000mw-JE
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLn9g-0005FC-Pd
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630590803;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0r+VDrNJl40PjXZ4Ba+xXeGQnharpi4q2XR2L0edizQ=;
 b=azcKnM982SFePqv4dbYZyUBkdrGOe7HVR+1yDdaoSzzWDEkzdikEto6UpnyAxlV0xZqm+I
 nMDkEhsHQPP69p0cEyFBlNHrm5p+teLIBdgep9tDGL6PkN+dA/vusPjmlKIXtVPYAwhoUn
 8wyt9FzPnQ+sNSBjZ8OhKRnAP6kqWDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-rcG03WgdMcazl3MVSBUsQg-1; Thu, 02 Sep 2021 09:53:20 -0400
X-MC-Unique: rcG03WgdMcazl3MVSBUsQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9F1801AE3
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 13:53:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1C4D5D6B1;
 Thu,  2 Sep 2021 13:53:02 +0000 (UTC)
Date: Thu, 2 Sep 2021 14:53:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YTDXPB/t22lzRS/H@redhat.com>
References: <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
 <YTDVh9/MVAfCdkeu@t490s>
MIME-Version: 1.0
In-Reply-To: <YTDVh9/MVAfCdkeu@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 09:45:43AM -0400, Peter Xu wrote:
> On Thu, Sep 02, 2021 at 10:26:16AM +0200, Igor Mammedov wrote:
> > On Mon, 30 Aug 2021 15:02:53 -0400
> > Peter Xu <peterx@redhat.com> wrote:
> > 
> > > On Thu, Aug 26, 2021 at 09:43:59AM -0400, Peter Xu wrote:
> > > > > > A simple state machine can track "has IOMMU" state.  It has three states
> > > > > > "no so far", "yes", and "no", and two events "add IOMMU" and "add device
> > > > > > that needs to know".  State diagram:
> > > > > > 
> > > > > >                           no so far
> > > > > >                    +--- (start state) ---+
> > > > > >                    |                     |
> > > > > >          add IOMMU |                     | add device that
> > > > > >                    |                     |  needs to know
> > > > > >                    v                     v
> > > > > >              +--> yes                    no <--+
> > > > > >              |     |   add device that   |     |
> > > > > >              +-----+    needs to know    +-----+
> > > > > > 
> > > > > > "Add IOMMU" in state "no" is an error.  
> > > > > 
> > > > > question is how we distinguish "device that needs to know"
> > > > > from device that doesn't need to know, and then recently
> > > > > added feature 'bypass IOMMU' adds more fun to this.  
> > > > 
> > > > Maybe we can start from "no device needs to know"? Then add more into it when
> > > > the list expands.
> > > > 
> > > > vfio-pci should be a natural fit because we're sure it won't break any valid
> > > > old configurations.  However we may need to be careful on adding more devices,
> > > > e.g. when some old configuration might work on old binaries, but I'm not sure.  
> > > 
> > > Btw, I think this state machine is indeed bringing some complexity on even
> > > understanding it - it is definitely working but it's not obvious to anyone at
> > > the first glance, and it's only solving problem for vIOMMU.  E.g., do we need
> > > yet another state machine for some other ordering constraints?
> > >
> > > From that POV, I don't like this solution more than the simple "assign priority
> > > for device realization" idea..
> > It seems simple but implicit dependencies are fragile (good or
> > I'd rather say bad example implicit dependencies is vl.c magic code,
> > where changing order of initialization can easily break QEMU,
> > which happens almost every time it's refactored),
> 
> True.  I was never able of telling whether that comes from natural complexity
> of the piece of software or there's indeed some smarter moves.
> 
> > and as Markus already mentioned it won't work in QMP case.
> 
> I didn't ask before, but I do have a question on whether that's a real problem.
> 
> When QMP interface is ready, we should have a last phase of "preconfig done"
> command, right?  I thought it was "x-exit-preconfig" now, but I'm not sure so
> am guessing.  If so, can we do the reorder there and postpone all device
> creations, maybe?  Then the ordering properties can be applied there too.
> 
> The other thing is I think only libvirt will use the QMP case even if it'll be
> ready, and libvirt will need to know the ordering already like vIOMMU and vfio
> and pci buses - even if a new qemu supported the ordering of all these, libvirt
> still need to support old qemu binaries (and the code is already there anyway)
> and it's fairly natural they initiate the QMP commands using the same ordering.
> 
> IMHO it means ordering for QMP is not as important as cmdline if that's always
> initiated by another software.

The correct ordering of devices/backends is generally pretty obvious
for libvirt to determine. Most of the problems we've had related to
ordering are on the QEMU side, because the ARGV given to QEMU made
correct sense if parsed left-to-right, but QEMU didn't actually process
them in that order. We've patched QEMU to hack around its inability to
honour the CLI order repeatedly.

Being completely self-ordering on the QEMU side using a topological
sort would be neat from a conceptual purity POV, but that is quite a
challenge to implement and I'm not convinced it is worth it, compared
to other problems we want to spend time on.

If we don't want to keep hacking up the current QEMU system binaries
parsing, then we need to just have new binaries with sane ordering,
or we need to willingly break compat in some staged manner. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


