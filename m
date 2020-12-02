Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E52CBD5A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:52:51 +0100 (CET)
Received: from localhost ([::1]:50284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkRco-00039I-D6
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkRbb-0002eK-2Z
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:51:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkRbX-0006Fe-BN
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606913489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rvYL45ueIr+2LJlBw4oL/OJGPvo+lkxnLD3mteFTjnI=;
 b=cRF24irCMIGHqeFpDzjOwOyyjnokzqq6kmSBECWIMy40a9OdytnhKw13phaFBpDXui5tV4
 ARmghTSrzSv+JGMHsJdDg5MlnZqji4JpI89zteg8V33Z/Vt5Ph83b7x/A5dhhDoOa9Ge/d
 pXiypRtDvjLRhNsPfa6lJotuBukCTgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-H8tDig22O-WW5t0DZVqSyA-1; Wed, 02 Dec 2020 07:51:26 -0500
X-MC-Unique: H8tDig22O-WW5t0DZVqSyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E19B7100D69F;
 Wed,  2 Dec 2020 12:51:25 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47A7C10013C0;
 Wed,  2 Dec 2020 12:51:25 +0000 (UTC)
Date: Wed, 2 Dec 2020 07:51:24 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201202125124.GD3836@habkost.net>
References: <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 10:30:11AM +0100, Paolo Bonzini wrote:
> On 01/12/20 23:08, Eduardo Habkost wrote:
> > > Properties are only a useful concept if they have a use.  If
> > > -object/object_add/object-add can do the same job without properties,
> > > properties are not needed anymore.
> > 
> > Do you mean "not needed for -object anymore"?  Properties are
> > still used by internal C code (esp. board code),
> > -device/device_add, -machine, -cpu, and debugging commands (like
> > "info qtree" and qom-list/qom-get/qom-set).
> 
> Yes.
> 
> > > Right now QOM is all about exposing properties, and having multiple
> > > interfaces to set them (by picking a different visitor).  But in practice
> > > most QOM objects have a lifetime that consists of 1) set properties 2) flip
> > > a switch (realized/complete/open) 3) let the object live on its own.  1+2
> > > are a single monitor command or CLI option; during 3 you access the object
> > > through monitor commands, not properties.
> > 
> > I agree with this, except for the word "all" in "QOM is all
> > about".  QOM is also an extensively used internal QEMU API,
> > including internal usage of the QOM property system.
> 
> Yeah, "all about exposing properties" includes internal usage.  And you're
> right that some "phase 3" monitor commands do work at the property level
> (mostly "info qtree", but also "qom-get" because there are some cases of
> public run-time properties).

I still disagree on the "all about" part even for internal usage.
But this shouldn't really matter for this discussion, I guess.

> 
> > I'm liking the direction this is taking.  However, I would still
> > like to have a clearer and feasible plan that would work for
> > -device, -machine, and -cpu.
> 
> -cpu is not a problem since it's generally created with a static
> configuration (now done with global properties, in the future it could be a
> struct).

It is a problem if it requires manually converting existing code
defining CPU properties and we don't have a transition plan.

> 
> -machine and -device in principle could be done the same way as -object,
> just through a different registry (_not_ a huge struct; that's an acceptable
> stopgap for -object but that's it).  The static aka field properties would
> remain as read-only, with defaults moved to instance_init or realize.  But
> there would be again "triplication" with a trivial conversion:

> 
> 1) in the QAPI schema, e.g. 'num_queues': 'int16'
> 
> 2) in the struct, "int16_t num_queues;"
> 
> 3) in the realize function,
> 
>     s->num_queues = cfg->has_num_queues ? cfg->num_queues : 8;
> 
> So having a mechanism for defaults in the QAPI schema would be good. Maybe
> 'num_queues': { 'type': 'int16', 'default': '8' }?
> 

Would a -device conversion also involve non-user-creatable
devices, or would we keep existing internal usage of QOM
properties?

Even if it's just for user-creatable devices, getting rid of QOM
property usage in devices sounds like a very ambitious goal.  I'd
like us to have a good transition plan, in addition to declaring
what's our ideal end goal.


> I also need to review more the part of this code with respect to the
> application of global properties.  I wonder if there are visitor tricks that
> we can do, so that global properties keep working but correspond to QAPI
> fields instead of QOM properties.
> 
> Paolo
> 

-- 
Eduardo


