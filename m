Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439062CBEDB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:57:06 +0100 (CET)
Received: from localhost ([::1]:35404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkScz-0000bu-1w
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkSb4-0008R8-Gz
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkSb2-0008C8-9K
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606917302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CVQ+WlpF+HWNTKGS9IgoLg7sDcHca7tpFxm+A4LI1Sg=;
 b=FHE++I8w/43O8uYtaNpmeImlgp2YuxAdGJFzQmOh8epz+6eN4gQnGP03H94PHR79W5dFrQ
 JFUGT67p9KZV5BMD8j80a2pcGha0yIToRh5qdD/+blKlL+MjbCPJCkLG2YnvDJME/zqBL5
 QvWe6z7i7FLYN8arHL4vlBfApHDT/Ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-iCWVvbWmMGGBHh5LXUsSPA-1; Wed, 02 Dec 2020 08:55:01 -0500
X-MC-Unique: iCWVvbWmMGGBHh5LXUsSPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4637B100C661;
 Wed,  2 Dec 2020 13:55:00 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C5DB18A9E;
 Wed,  2 Dec 2020 13:54:52 +0000 (UTC)
Date: Wed, 2 Dec 2020 08:54:51 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201202135451.GE3836@habkost.net>
References: <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 02:26:44PM +0100, Paolo Bonzini wrote:
> On 02/12/20 13:51, Eduardo Habkost wrote:
> > > > I'm liking the direction this is taking.  However, I would still
> > > > like to have a clearer and feasible plan that would work for
> > > > -device, -machine, and -cpu.
> > > 
> > > -cpu is not a problem since it's generally created with a static
> > > configuration (now done with global properties, in the future it could be a
> > > struct).
> > 
> > It is a problem if it requires manually converting existing code
> > defining CPU properties and we don't have a transition plan.
> 
> We do not have to convert everything _if_ for some objects there are good
> reasons to do programmatically-generated properties.  CPUs might be one of
> those cases (or if we decide to convert them, they might endure some more
> code duplication than other devices because they have so many properties).

OK, we just need to agree on what the transition will look like
when we do it.  I think we should put as much care into
transition/glue infrastructure as we put into the new
infrastructure.


> 
> > Would a -device conversion also involve non-user-creatable
> > devices, or would we keep existing internal usage of QOM
> > properties?
> > 
> > Even if it's just for user-creatable devices, getting rid of QOM
> > property usage in devices sounds like a very ambitious goal.  I'd
> > like us to have a good transition plan, in addition to declaring
> > what's our ideal end goal.
> 
> For user-creatable objects Kevin is doing work in lockstep on all classes;
> but once we have the infrastructure for QAPI object configuration schemas we
> can proceed in the other direction and operate on one device at a time.
> 
> With some handwaving, something like (see create_unimplemented_device)
> 
>     DeviceState *dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
> 
>     qdev_prop_set_string(dev, "name", name);
>     qdev_prop_set_uint64(dev, "size", size);
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> 
> might become something like
> 
>     { 'object': 'unimplemented-device',
>       'config': {
>          'name': 'str',
>          'size': 'size'
>       },
>     }
> 
>     DeviceState *dev = qapi_Unimplemented_new(&(
>          (UnimplementedDeviceOptions) {
>              .name = name,
>              .size = size
>          }, &error_fatal);
>     object_unref(dev);
> 
> (i.e. all typesafe!) and the underlying code would be something like
[...]
> 

Looks nice as end goal.  Then, these are a few questions I would
have about the transition plan:

Would it require changing both device implementation and device
users in lockstep?  Should we have a compatibility layer to allow
existing qdev_new()+qdev_prop_set_*() code to keep working after
the devices are converted to the new system?  If not, why not?

If we add a compatibility layer, is the end goal to convert all
existing qdev_new() users to the new system?  If yes, why?  If
not, why not?

What about subclasses?  Would base classes need to be converted
in lockstep with all subclasses?  How would the transition
process of (e.g.) PCI devices look like?

-- 
Eduardo


