Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B87F2AD3E8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:39:26 +0100 (CET)
Received: from localhost ([::1]:36220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcR3d-0004gl-1x
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:39:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcR2n-0004Gb-3M
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:38:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcR2i-00016C-Qw
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605004706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5kltcOfsxvW3b+tF0iRpQ60HoERLiGs0LgRuP5cbABs=;
 b=WNZyISH3HjE2qNKFytj5s+AM72ff1qukbIOBTp1nfvX7N4d8eg8XMlkTTPsS3UL9iMNXhQ
 +qXmuaXDNEpVfy86FLPZV9cOr/B0g/n+QyrcgfiWEkW2LqiMu1S9hL1ayfdDVx39eaxQvy
 F2gy87CiybjFD5vY5OZ4rTqCtZob29M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-q7jmnfGoOUeWRCIGmhIz5g-1; Tue, 10 Nov 2020 05:38:24 -0500
X-MC-Unique: q7jmnfGoOUeWRCIGmhIz5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 773E880B702;
 Tue, 10 Nov 2020 10:38:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-133.ams2.redhat.com [10.36.112.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E87835DA33;
 Tue, 10 Nov 2020 10:38:05 +0000 (UTC)
Date: Tue, 10 Nov 2020 11:38:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 00/44] Make qdev static property API usable by any QOM
 type
Message-ID: <20201110103804.GA6362@merkur.fritz.box>
References: <ca99fc61-6cdd-117d-343e-8141e385522e@redhat.com>
 <20201109113404.GA24970@merkur.fritz.box>
 <3b711053-e67a-86fb-59e7-c06948dd8928@redhat.com>
 <20201109152125.GZ5733@habkost.net>
 <2300fd53-afa1-b957-b33b-cff2986fcb93@redhat.com>
 <20201109171618.GA5733@habkost.net>
 <098ca211-3ad5-b194-e9f5-678291fe641e@redhat.com>
 <20201109185558.GB5733@habkost.net>
 <9659e726-7948-4e02-f303-abcbe4c96148@redhat.com>
 <20201109202855.GD5733@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201109202855.GD5733@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.11.2020 um 21:28 hat Eduardo Habkost geschrieben:
> On Mon, Nov 09, 2020 at 08:27:21PM +0100, Paolo Bonzini wrote:
> > On 09/11/20 19:55, Eduardo Habkost wrote:
> > > On Mon, Nov 09, 2020 at 06:33:04PM +0100, Paolo Bonzini wrote:
> > > > On 09/11/20 18:16, Eduardo Habkost wrote:
> > > > > I mean extending the API to let custom setters and getters appear
> > > > > on the Property array, not using the existing API.
> > > > 
> > > > That seems like conflicting goals.  The field property API is based on
> > > > getters and setters hidden in PropertyInfo.  The "other" property API is
> > > > based on getters and setters in plain sight in the declaration of the
> > > > property.
> > > 
> > > There's nothing that prevents a
> > >    void object_class_add_properties(oc, Property *props);
> > > function from supporting both.
> > 
> > Sorry but I don't believe this until I see it.  The two APIs are just too
> > different.  And at some point the complexity of DEFINE_PROP becomes:
> > 
> > 1) harder to document
> > 
> > 2) just as hard to parse and build a QAPI schema from

I don't think that automatically generating a reasonable QAPI schema is
possible. This is not only because the code is hard to parse, but
because it just doesn't contain all the information - most QOM objects
are undocumented, but the QAPI schema wants documentation.

When I wrote a QAPI schema for a simple user creatable object, iothread,
I spent basically no time in copying over the fields and data types and
considerable more time finding appropriate documentation for it.

This is manual work no matter what we do.

> > And in the final desired result where QAPI generators are what generates the
> > list of properties, it's pointless to shoehorn both kinds of properties in
> > the same array if different things can just generate calls to different
> > functions.
> > 
> > > > > Parsing an array containing a handful of macros (a tiny subset of
> > > > > C) isn't even comparable to parsing and executing C code where
> > > > > object*_property_add*() calls can be buried deep in many levels
> > > > > of C function calls (which may or may not be conditional).
> > > > 
> > > > Finding the array would also require finding calls buried deep in C code,
> > > > wouldn't they?
> > > 
> > > Yes, but I don't expect this to happen if the API doesn't
> > > encourage that.
> > 
> > Out of 700 calls to object_class_property_add*, there are maybe 5 that are
> > dynamic.  So on one hand I understand why you want an API that makes those
> > things harder, but on the other hand I don't see such a big risk of misuse,
> > and it won't even matter at all if we later end up with properties described
> > in a QAPI schema.
> > 
> > > > > (Also, I don't think we should allow handwritten Property literals.)
> > > > 
> > > > How would you do custom setters and getters then---without separate
> > > > PropertyInfos, without Property literals, and without an exploding number of
> > > > macros?
> > > 
> > > Prop with no struct field, and custom setter/getter:
> > > 
> > >    DEFINE_PROP("myproperty", prop_type_uint32,
> > >                .custom_getter = my_getter,
> > >                .custom_setter = my_setter)
> > 
> > It would have to use all the Visitor crap and would be even harder to use
> > than object_class_property_add_str.  Thanks but no thanks. :)
> 
> Point taken, I dislike the visitor API too.

QAPI is the tool that hides the visitor API in generated code and
instead passes native C types to manually written code. But we'll have
to make one step after another.

And anyway, while not having to use the visitor API would be a bit
nicer, getting or setting the value is just one line in the function. So
it's probably the least of our problems.

> > > > > we can't be sure the [set of QOM properties]
> > > > > doesn't depend on configure flags or run time
> > > > > checks inside class_init.
> > > > 
> > > > We can use grep or Coccinelle or manual code review to identify problematic
> > > > cases.
> > > 
> > > We can, but I believe it is better and simpler to have an API
> > > that enforces (or at least encourages) this.
> > 
> > I don't see how
> > 
> >     if (...) {
> >         object_class_add_field_properties(oc, props);
> >     }
> > 
> > is discouraged any more than
> > 
> >     if (...) {
> >         object_class_add_field_property(oc, "prop1",
> >                                         PROP_STRING(...));
> >         object_class_add_field_property(oc, "prop2",
> >                                         PROP_STRING(...));
> >         object_class_add_field_property(oc, "prop3",
> >                                         PROP_STRING(...));
> >         object_class_add_field_property(oc, "prop4",
> >                                         PROP_STRING(...));
> >     }
> > 
> > (If anything, the former is more natural and less ugly than the latter).
> 
> On the former, "adding a new property" means adding an entry to a
> const array.  On the latter, it means adding a new function call.
> 
> On the former, a conditional property would require defining a
> new array.  A non-constant property name or type would require
> making the array non-const and modifying it at runtime.
> 
> On the latter, adding a if statement on the front of that
> function call or a non-constant expression as argument to the
> function is trivial.
> 
> > 
> > > I'd like us to convert instance-level properties to an API that
> > > is easy to use and where the same problems won't happen again.
> > 
> > I agree.  I just don't think that arrays are enough to make sure the same
> > problems won't happen again.
> > 
> > > > > You are also ignoring the complexity of the code path that leads
> > > > > to the object*_property_add*() calls, which is the main problem
> > > > > on most cases.
> > > > 
> > > > I would like an example of the complexity of those code paths.  I don't see
> > > > much complexity, as long as the object exists at all, and I don't see how it
> > > > would be simpler to find the code paths that lead to
> > > > object_class_add_field_properties.
> > > 
> > > Possibly the most complex case is x86_cpu_register_bit_prop().
> > > The qdev_property_add_static() calls at arm_cpu_post_init() are
> > > tricky too.
> > 
> > The problem with those code paths is that there's a reason why they look
> > like they do.  For x86_cpu_register_feature_bit_props, for example either
> > you introduce duplication between QOM property definitions and feat_names
> > array, or you resort to run-time logic like that.
> > 
> > If you want to make those properties introspectable (i.e. known at
> > compilation time) you wouldn't anyway use DEFINE_PROP*, because it would
> > cause duplication.  Instead, you could have a plug-in parser for qapi-gen,
> > reading files akin to target/s390x/cpu_features_def.h.inc. The parser would
> > generate both QAPI schema and calls to x86_cpu_register_bit_prop().
> > 
> > To sum up: for users where properties are heavily dependent on run-time
> > logic, the solution doesn't come from providing a more limited API.  A
> > crippled API will simply not solve the problem that prompted the usage of
> > run-time logic, and therefore won't be used.
> 
> I don't know yet what's the best solution for the x86 feature
> case.  Maybe duplicating the list of feature names would be a
> small price to pay to get a static list of properties defined at
> compilation time?  Maybe we can replace
> FeatureWordInfo.feat_names[] with property introspection code
> that will find the property name for a given struct field?
> 
> In either case, we need something that works for x86 and other
> complex cases, or it won't be used.  Point taken.
> 
> > 
> > (I don't know enough of the ARM case to say something meaningful about it).
> > 
> > > If object*_property_add*() is hidden behind a function call or a
> > > `if` statement, it's already too much complexity to me.
> > 
> > You want to remove hiding behind a function call, but why is it any better
> > to hide behind layers of macros?  Just the example you had in your email
> > included DEFINE_PROP, DEFINE_FIELD_PROP, DEFINE_PROP_UINT32.  It's still
> > impossible to figure out without either parsing or executing C code.
> 
> Because we can be absolutely sure the macros (and the property
> array) will be constant expressions evaluated at compilation
> time.
> 
>                              * * *
> 
> Anyway, If we are the only ones discussing this, I will just
> defer to your suggestions as QOM maintainer.  I hope we hear from
> others.

Well, I expressed my preference for what you're arguing for now, but my
expertise is more on the QAPI side than on the QOM side, so I can't
really contribute more arguments in the details than you are already
doing.

In the end, as soon as it's generated code, it won't matter much any
more what it looks like. But I'm not sure how soon we will be there and
for the meantime I'll always prefer static data to runtime code.

Kevin


