Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B689D434D14
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:07:58 +0200 (CEST)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCG5-0007Lx-Rv
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mdByb-0001KH-1y
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:49:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mdByX-0002Jj-Vh
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634737788;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Jal3w2Kw/G3jkvBDZHac17SVq9eiusd4p0wsKCQYMZE=;
 b=LkepCuBowyF6sgSTCjYTUL1gQqVNLWWBQc+0egK6VJd/lzk1h0yFTad+Q1K0siUkAku40G
 clwplBqOMFdRVfUAj0d3Pj+tpMItA2QJrjDijOpDjKBC2/r/5/fuGIWZmy6cOwAiGWKts1
 Pw1vZj8lNyomh/dZ1xGIx++emNbv5iI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-eKN4bWmePJuK5ebyRFNTlA-1; Wed, 20 Oct 2021 09:49:43 -0400
X-MC-Unique: eKN4bWmePJuK5ebyRFNTlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBDF4948
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 13:49:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C768E6A8E5;
 Wed, 20 Oct 2021 13:48:12 +0000 (UTC)
Date: Wed, 20 Oct 2021 14:48:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 0/4] vl: Prioritize device realizations
Message-ID: <YXAeGdkCPh5h+kHg@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
 <2817620d-facb-eeee-b854-64193fa4da33@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2817620d-facb-eeee-b854-64193fa4da33@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 03:44:08PM +0200, David Hildenbrand wrote:
> On 18.08.21 21:42, Peter Xu wrote:
> > This is a long pending issue that we haven't fixed.  The issue is in QEMU we
> > have implicit device ordering requirement when realizing, otherwise some of the
> > device may not work properly.
> > 
> > The initial requirement comes from when vfio-pci starts to work with vIOMMUs.
> > To make sure vfio-pci will get the correct DMA address space, the vIOMMU device
> > needs to be created before vfio-pci otherwise vfio-pci will stop working when
> > the guest enables the vIOMMU and the device at the same time.
> > 
> > AFAIU Libvirt should have code that guarantees that.  For QEMU cmdline users,
> > they need to pay attention or things will stop working at some point.
> > 
> > Recently there's a growing and similar requirement on vDPA.  It's not a hard
> > requirement so far but vDPA has patches that try to workaround this issue.
> > 
> > This patchset allows us to realize the devices in the order that e.g. platform
> > devices will be created first (bus device, IOMMU, etc.), then the rest of
> > normal devices.  It's done simply by ordering the QemuOptsList of "device"
> > entries before realization.  The priority so far comes from migration
> > priorities which could be a little bit odd, but that's really about the same
> > problem and we can clean that part up in the future.
> > 
> > Libvirt can still keep its ordering for sure so old QEMU will still work,
> > however that won't be needed for new qemus after this patchset, so with the new
> > binary we should be able to specify qemu cmdline as wish on '-device'.
> > 
> > Logically this should also work for vDPA and the workaround code can be done
> > with more straightforward approaches.
> > 
> > Please review, thanks.
> 
> Hi Peter, looks like I have another use case:
> 
> vhost devices can heavily restrict the number of available memslots:
> e.g., upstream KVM ~64k, vhost-user usually 32 (!). With virtio-mem
> intending to make use of multiple memslots [1] and auto-detecting how
> many to use based on currently avilable memslots when plugging and
> realizing the virtio-mem device, this implies that realizing vhost
> devices (especially vhost-user device) after virtio-mem devices can
> similarly result in issues: when trying realization of the vhost device
> with restricted memslots, QEMU will bail out.
> 
> So similarly, we'd want to realize any vhost-* before any virtio-mem device.

Ordering virtio-mem vs vhost-* devices doesn't feel like a good
solution to this problem. eg if you start a guest with several
vhost-* devices, then virtio-mem auto-decides to use all/most
remaining memslots, we've now surely broken the abiltiy to then
hotplug more vhost-* devices at runtime by not leaving memslots
for them.

I think virtio-mem configuration needs to be stable in its memslot
usage regardless of how many other types of devices are present,
and not auto-adjust how many it consumes.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


