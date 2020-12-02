Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15CD2CC6F3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 20:48:10 +0100 (CET)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkY6j-0001oO-Hc
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 14:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkY4S-0000SV-1N
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:45:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkY4P-00023A-0D
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606938343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UqknygZhFGCIby1eKV7mVKOgt/R9ogrpZqqXqMGJh8c=;
 b=bvBXcSeF+AV7Bjhn8FlYwJ4EAu1/DplZRTpBpzrol6pX3hQZ6IKvf7/TKxcDkNCDpvdvU1
 J056q4ww7kAvEo9o+V96mdBiVZ/GAeJO1o1Ek2X2Ipbqnq47Qrg7xTvgcSBrLx5A+CRl52
 QyoqCoZSduFMaNkrV38l54TBJHCkMts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-ormhhukOMwGXCe5oA6oP4A-1; Wed, 02 Dec 2020 14:45:41 -0500
X-MC-Unique: ormhhukOMwGXCe5oA6oP4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 853421935799;
 Wed,  2 Dec 2020 19:45:40 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B98410016FF;
 Wed,  2 Dec 2020 19:45:28 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:45:27 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201202194527.GH3836@habkost.net>
References: <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net>
 <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net>
 <20201202173506.GH16765@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201202173506.GH16765@merkur.fritz.box>
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 06:35:06PM +0100, Kevin Wolf wrote:
> Am 02.12.2020 um 17:05 hat Eduardo Habkost geschrieben:
> > > > Looks nice as end goal.  Then, these are a few questions I would
> > > > have about the transition plan:
> > > > 
> > > > Would it require changing both device implementation and device
> > > > users in lockstep?  Should we have a compatibility layer to allow
> > > > existing qdev_new()+qdev_prop_set_*() code to keep working after
> > > > the devices are converted to the new system?  If not, why not?
> > > 
> > > Technically, it doesn't strictly require a lockstep update. You can have
> > > two code paths leading to a fully initialised device, one being the
> > > traditional way of setting properties and finally calling dc->realize,
> > > the other being a new method that takes the configuration in its
> > > parameters and also sets dev->realized = true at the end.
> > > 
> > > If at all possible, I would however prefer a lockstep update because
> > > having two paths is a weird intermediate state and the code paths could
> > > easily diverge. Keeping the old way around for a device also means that
> > > property setters are still doing two different jobs (initial
> > > configuration and updates at runtime).
> > 
> > I'd like to understand better how that intermediate state would
> > look like and why there's risk of separate code paths diverging.
> >
> > Could we have an intermediate state that doesn't require any
> > duplication and thus have no separate code paths that could
> > diverge?
> 
> The one requirement we have for an intermediate state is that it
> supports both interfaces: The well-know create/set properties/realize
> dance, and a new DeviceClass method, say .create(), that takes the
> configuration in parameters instead of relying on previously set
> properties.

I agree completely.

> 
> I assumed two separate implementations of transferring the configuration
> into the internal state. On second thought, this assumption is maybe
> wrong.
> 
> You can implement the new method as wrapper around the old way: It could
> just set all the properties and call realize. Of course, you don't win
> much in terms of improving the class implementation this way, but just
> support the new interface, but I guess it can be a reasonable
> intermediate step to resolve complicated dependencies etc.
> 
> It would be much nicer to do the wrapper the other way round, i.e.
> setting properties before the device is realized would update a
> configuration struct and realize would then call .create() with that
> struct. To me, this sounds much harder, though also a more useful state.

Comment about this below (look for [1]).

> 
> As you have worked a lot with properties recently, maybe you have a good
> idea how we could get an intermediate state closer to this?

I'd have to re-read this whole thread and think about it.

> 
> > > > If we add a compatibility layer, is the end goal to convert all
> > > > existing qdev_new() users to the new system?  If yes, why?  If
> > > > not, why not?
> > > 
> > > My personal goal is covering -object and -device, i.e. the external
> > > interfaces. Converting purely internally created devices is not as
> > > interesting (especially as long as we focus only on object creation),
> > > but might be desirable for consistency.
> > 
> > I wonder how much consistency we will lose and how much confusion
> > we'll cause if we end up with two completely separate methods for
> > creating devices.
> 
> I do think we should follow through and convert everything. It's just
> not my main motivation, and if the people who work more with qdev think
> it's better to leave that part unchanged (or that it won't make much of
> a difference), I won't insist.

This worries me.  Converting thousands of lines of code that
don't involve user-visible interfaces seems complicated and maybe
pointless.  On the other hand, having two separate APIs for
creating objects internally would cause confusion.

Maybe we should accept the fact that the 2 APIs will exist, and
address the confusion part: we should guarantee the two APIs to
be 100% equivalent, except for the fact that the newer one gives
us type safety in the C code.

I'd like to avoid a case like qdev vs QOM APIs, where they have
similar but slightly different features, and nobody knows which
one to use.

> 
> > > > What about subclasses?  Would base classes need to be converted
> > > > in lockstep with all subclasses?  How would the transition
> > > > process of (e.g.) PCI devices look like?
> > > 
> > > I don't think so.
> > > 
> > > If you want to convert base classes first, you may need to take the
> > > path shown above where both initialisation paths coexist while the
> > > children are converted because instantiation of a child class involves
> > > setting properties of the base class. So you can only restrict these
> > > properties to runtime-only after all children have been converted.
> > > 
> > > The other way around might be easier: You will need to describe the
> > > properties of base classes in the QAPI schema from the beginning, but
> > > that doesn't mean that their initialisation code has to change just yet.
> > > The child classes will need to forward the part of their configuration
> > > that belongs to the base class. The downside is that this code will have
> > > to be changed again when the base class is finally converted.
> > > 
> > > So we have options there, and we can decide case by case which one is
> > > most appropriate for the specific class to be converted (depending on
> > > how many child classes exist, how many properties are inherited, etc.)
> > 
> > Right now it's hard for me to understand what those intermediate
> > states would look like.  It sounds like it requires too many
> > complicated manual changes to be done by humans, and lots of room
> > for mistakes when maintaining two parallel code paths.  I'd
> > prefer to delegate the translation job to a machine.
> 
> Maybe devices are in a better shape, but my conclusion from user
> creatable objects is that it needs to be done by a human.

I agree with the "done by a human part", but I prefer a different
approach: making the APIs converge (using human work), and then
making an automated transition.

More on this below:

> 
> Even just writing a schema for an existing object without actually
> changing its code (i.e. what this series does for user creatable
> objects) involves:
> 
> * Figuring out which properties even exist.
> 
>   I guess if you know your way around QOM, this could be automatically
>   be generated for the common case. If property definitions are
>   conditional or dynamic, you'll probably miss them.

With qdev static properties and class-level properties, this
stage is easy.

> 
> * Finding the right data type for each property.
> 
>   The const char *type passed to object_(class_)property_add() is often
>   enough wrong that it becomes useless. If object_property_add_<type> is
>   used, chances are that you know the right type, but strings might
>   actually be hidden enums. If not, figuring out the type involves
>   analysing the setter and getter callbacks.

With object_property_add_*() and object_class_property_add_*(),
this part is very difficult.

With qdev static properties (now known as "field properties" in
QOM), this stage is easy.

Luckily, most devices use qdev static properties.


> 
> * Finding out which properties are mandatory and which are optional.
> 
>   This is usually some handwritten check in complete/realize that
>   returns an error. Sometimes it's just a segfault that happens sooner
>   or later if the property hasn't been set.

This stage is tricky.  But we can start by:
- Making all of them optional by default (which is true);
- Adding a flag to allow us to declare properties as mandatory.

> 
> * Finding the default for documentation.
> 
>   There are multiple ways to do this. It's code, not data.

In this case, qdev static properties / field properties make that
job possible.

> 
> * Writing (preferably good) documentation for the property.

This part will require manual work.

> 
> I see very little opportunity for automating a significant part of this.

I see a big opportunity to automate this if the device is already
using the field property system (which is true for most of the
devices).

The remaining work that needs to be done by humans is converting
existing dynamic properties to field properties.


About doing the compatibility layer the other way around[1]: if
conversion from qdev properties to QAPI schema is automated, we
can simply choose a point in time where the results of the
conversion would be saved in the git tree, and the original
property list would be deleted from the C source.  Then, the
compatibility layer would work the other way around.


> 
> Once you have this information, going to the intermediate state where
> .create() is just a wrapper that sets properties and calls realize is
> fairly easy. Maybe we can have QAPI support for this so that you can
> request generation of the wrapper function in the schema. Then you would
> just have to set the pointer to it in .class_init.

Agreed.

> 
> > In other words, I'd prefer to have compatibility layer(s) that
> > would make the same implementation work with the both old-style
> > and new-style APIs for creating devices.  Maybe this would
> > involve generating QAPI code from QOM/qdev property lists, and/or
> > generating qdev property registration code from the QAPI schema,
> > I don't know.
> > 
> > Providing a compatibility layer would also help us be more
> > confident that there are no gaps in the abstractions provided by
> > the two systems (QOM properties and QAPI schema) that we still
> > need to address.
> 
> qdev properties could be more useful to generate at least a skeleton
> schema from than generic QOM properties. But there will still be large
> parts that a human needs to do.

I agree there's lot of manual work to do.  My proposal is doing
the manual work during in the conversion of dynamic properties to
field properties.  Conversion from field properties to the new
API then would be automated.

> 
> My concern with the compatibility layer is just that it could happen
> more easily that we're stuck with it forever.

I hear you.

I'm a pessimistic regarding this.  I believe we _will_ be stuck
in the transition forever (or for so long that it will feel like
forever).  But with a good transition/compatibility layer, that
transition stage will be less painful.

I also believe that writing compatibility layer(s) would be less
work than writing and reviewing patches doing manual conversion
of device code directly to the new API.

-- 
Eduardo


