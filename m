Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4892EC219
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:27:33 +0100 (CET)
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCaq-0002vE-6y
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kxCZQ-0001zl-Lw
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:26:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kxCZO-00019K-KZ
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609953961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1Mc/EKGzwmvUJo7I+6mHAygmNRgSNLfngc9HeiqD9A=;
 b=WxltKzJFl91kU6+Wgp0WckKsCObTpSt2tqDuGryy7BZU6r0c+2dpBE03wKMhqF+y13frqh
 AqXe7nwnMyq1orEaL34Y6uL6cIOY+gpf+CHoVyQWsGvSaDYlOyc8wJYzTFCxtkXgrjpNKp
 ioAGolR7QPvkM+c946MmwV8f5hSvJmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-Jf56Wr2RNrmlnOhIh2XFnQ-1; Wed, 06 Jan 2021 12:25:59 -0500
X-MC-Unique: Jf56Wr2RNrmlnOhIh2XFnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB8A88015DB
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 17:25:58 +0000 (UTC)
Received: from localhost (ovpn-116-153.rdu2.redhat.com [10.10.116.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1A2F6087C;
 Wed,  6 Jan 2021 17:25:58 +0000 (UTC)
Date: Wed, 6 Jan 2021 12:25:57 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
Message-ID: <20210106172557.GP18467@habkost.net>
References: <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com>
 <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210105000435.1cf4c6f6@redhat.com>
 <87lfd7iowi.fsf@vitty.brq.redhat.com>
 <20210105170312.32cf0e12@redhat.com>
 <87a6tnibv4.fsf@vitty.brq.redhat.com>
 <20210106141303.145790f7@redhat.com>
 <87sg7egp73.fsf@vitty.brq.redhat.com>
 <20210106174542.496f9f6e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210106174542.496f9f6e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 06, 2021 at 05:45:42PM +0100, Igor Mammedov wrote:
> On Wed, 06 Jan 2021 14:38:56 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> 
> > Igor Mammedov <imammedo@redhat.com> writes:
> > 
> > > On Tue, 05 Jan 2021 17:31:43 +0100
> > > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> > >  
> > >> Igor Mammedov <imammedo@redhat.com> writes:
> > >>   
> > >> > On Tue, 05 Jan 2021 12:50:05 +0100
> > >> >
> > >> > I think there is a misunderstanding, idea was:
> > >> >
> > >> > cpu_initfn() {
> > >> >     //current set
> > >> >     cpu->default_hyperv_cpu_features = ACD
> > >> > }
> > >> >
> > >> > compat_props_5.1 {
> > >> >    cpu.default_hyperv_cpu_features = AB
> > >> > }
> > >> >
> > >> > compat_props_5.2 {
> > >> >    cpu.default_hyperv_cpu_features = ABC
> > >> > }
> > >> >    
> > >> 
> > >> ...
> > >>   
> > >> > I was talking about CPU features/properties only, it doesn't apply to other devices.
> > >> > It makes sense for machine to have a knob to create onboard hyperv specific
> > >> > devices if there is any (do we have any?).
> > >> >
> > >> > If there aren't any currently, I wouldn't bother with machine knob
> > >> > and just use -cpu foo,hv_default=on or -device cpu,hv_default=on
> > >> > like any other cpu feature.
> > >> >    
> > >> 
> > >> We don't currently have any devices which are not 'CPU features' (in
> > >> QEMU terminology), however, we already have Vmbus and I can easily
> > >> imagine us implementing e.g. hartbeat/kvp/vss/... devices on top. We
> > >> *may* want to enable these 'automatically' and that's what make
> > >> '-machine' option preferable. It is, however, not a *must* right now and
> > >> we can indeed wait until these devices appear and be happy with
> > >> 'hv_default' -cpu option for now. We will, however, need to teach upper
> > >> layers about the change when/if it happens.  
> > >
> > > which makes me think we are trying to bite something that we shouldn't.
> > > Do we really need this patch (QEMU knob) to magically enable subset of
> > > features and/or devices for a specific OS flavor?
> > >
> > > It's job of upper layers to abstract low level QEMU details in to coarse
> > > grained knobs (libvirt/virt-install/virt-manager/...).
> > > For example virt-install may know that it installing a specific Windows
> > > version, and can build a tailored for that OS configuration including
> > > needed hyperv CPU features and hyperv specific devices.
> > > (if I'm not mistaken libosinfo is used to get metadata for preferred
> > > configuration, so perhaps this should become a patch for that library
> > > and its direct users).
> > >
> > > What we actually lack is a documentation for preferred configuration
> > > in docs/hyperv.txt, currently it just enumerates possible features.
> > > We can just document a recommended 'best practices' there without
> > > putting it in QEMU code and let upper layers to do their job in
> > > the stack.  
> > 
> > The problem we're facing here is that when a new enlightenment is
> > implemented it takes forever to propagate to the whole stack. We don't
> It's true not only for Hyper-V, I guess it's price to pay for modular solution.

Yes, this discussion applies to other features as well.

> 
> > have any different recommendations for different Windows versions,
> > neither does genuine Hyper-V. The 'fine grained' mechanis we have just
> > contributes to the creation of various Frankenstein configurations
> > (which look nothing like real Hyper-V), people just google for 'Windows
> > KVM slow', add something to their scripts and this keeps propagating.
> That's why I mentioned lack of documentation.
> If someone manually configures QEMU, one should understand what they do
> enable and why or enlist help of virt-install and likes.

Why?

QEMU's lack of usability is an unfortunate accident, not a
desirable goal.

> 
> > Every time I see a configuration with only a few 'hv_*' options I ask
> > 'why don't you enable the rest?' and I'm yet to receive an answer
> > different from 'hm, I don't know, I copied it from somewhere and it
> > worked'.
> 
> If individual features are are composed by virt-install or other tools
> based on libosinfo data, then we don't have to maintain versioning
> of new default_set_features per machine type, which will only become
> worse if we include hv specific devices into it.

Versioning is extra work for us QEMU developers, but it has a
purpose.  It saves everybody else's valuable time.


> 
> Also with libosinfo approach, old machine types and old QEMU versions
> can also benefit from it without need to change whole stack.

Except that you need to update the whole stack (QEMU + libvirt +
libosinfo + the glue code between libosinfo and libvirt) every
time a new feature is available.

This is unnecessary overhead, and this is not working.


> And no versioning is necessary since chosen config set is stored in
> domain XML at the moment VM is created.

I don't even think that is a good thing.

I would agree completely with you if the people maintaining the
upper layers were asking us to just let them manage low level
details of guest ABI.  They are not.


> 
> > Setting 'hv_*' options individually should be considered debug only.
> that's how cpu's features were designed, a helper knob on top is fine
> as long as it doesn't mess the way it used to work and preferably is
> build on top of existing features.
> 
> PS:
> another wild idea how to implement it using '-machine hyperv=on',
> based on compat props idea:
> 
> // replaces bit set in your version
> hv_default_set[] =
>   "hv_feat1", "hv_feat2",
>  ...
> };
> 
> // probably should be done before -cpu is parsed
> then if machine hyperv=on
>    foreach in hv_default_set[]
>       object_register_sugar_prop(hv_default_set[i], "on")

This sounds interesting.

> 
> PS2:
> my preferred approach is still -cpu hyperv=on, since it doesn't
> depend on order CLI is currently parsed (which is fragile thing),
> but rather on what user asked us to do with CPU.

-- 
Eduardo


