Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A247869AADE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:57:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSzLI-0001K9-NP; Fri, 17 Feb 2023 06:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSzLF-0001Jp-SW
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:55:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSzLD-0007rb-RV
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676634950;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2r7lrdvHV79uqJ/u5bL6DGPDH+lscZhgTqchkMfpg0=;
 b=Wq5t2T6KrqJYwO2DMXTno3fpWasLX8cjBY5DeFI/maWekvEcmetTTMayCcoFzpEToWkSsU
 8CMX3y3+I/+EHAsgABdKsF64+cPlT3wzxrx+NYGY3bywCYe1IOhqMMl/oTgnxoVBFI6g9o
 uy64ut8pUWLmkJNtseAQeyl515p+vcU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-Pe-V5sh8Nzak8zbpksq3nw-1; Fri, 17 Feb 2023 06:55:47 -0500
X-MC-Unique: Pe-V5sh8Nzak8zbpksq3nw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D0A938123BF;
 Fri, 17 Feb 2023 11:55:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CAED140EBF4;
 Fri, 17 Feb 2023 11:55:44 +0000 (UTC)
Date: Fri, 17 Feb 2023 11:55:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: QAPI unions as branches / unifying struct and union types
Message-ID: <Y+9rPrYeBq1Y9XyL@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <Y+TLJ9Ui790bIR3b@redhat.com> <87o7q2vv7v.fsf_-_@pond.sub.org>
 <2157ed5c-7e1e-bd8f-1644-b7231fffe7ef@nutanix.com>
 <87v8k4lfgj.fsf@pond.sub.org>
 <7eba90f1-b28e-650b-e3ae-9c8e64c29d77@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eba90f1-b28e-650b-e3ae-9c8e64c29d77@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 17, 2023 at 04:48:59PM +0530, Het Gala wrote:
> 
> On 14/02/23 3:46 pm, Markus Armbruster wrote:
> > Het Gala <het.gala@nutanix.com> writes:
> > 
> > > On 10/02/23 12:54 pm, Markus Armbruster wrote:
> > > > Daniel P. Berrangé <berrange@redhat.com> writes:
> > > > 
> > > > [...]
> > > > 
> > > > > > +##
> > > > > > +# @MigrateAddress:
> > > > > > +#
> > > > > > +# The options available for communication transport mechanisms for migration
> > > > > > +#
> > > > > > +# Since 8.0
> > > > > > +##
> > > > > > +{ 'union' : 'MigrateAddress',
> > > > > > +  'base' : { 'transport' : 'MigrateTransport'},
> > > > > > +  'discriminator' : 'transport',
> > > > > > +  'data' : {
> > > > > > +    'socket' : 'MigrateSocketAddr',
> > > > > > +    'exec' : 'MigrateExecAddr',
> > > > > > +    'rdma': 'MigrateRdmaAddr' } }
> > > > > Ideally this would be
> > > > > 
> > > > >      'data' : {
> > > > >        'socket' : 'SocketAddress',
> > > > >        'exec' : 'MigrateCommand',
> > > > >        'rdma': 'InetSocketAddress' } }
> > > > > 
> > > > > though the first SocketAddress isn't possible unless it is easy to
> > > > > lift the QAPI limitation.
> > > > Context: SocketAddress is a QAPI union, and "the QAPI limitation" is
> > > > 
> > > >       scripts/qapi-gen.py: In file included from ../qapi/qapi-schema.json:79:
> > > >       ../qapi/migration.json: In union 'MigrateAddress':
> > > >       ../qapi/migration.json:1505: branch 'socket' cannot use union type 'SocketAddress'
> > > > 
> > > > Emitted by schema.py like this:
> > > > 
> > > >                   if (not isinstance(v.type, QAPISchemaObjectType)
> > > >                           or v.type.variants):
> > > >                       raise QAPISemError(
> > > >                           self.info,
> > > >                           "%s cannot use %s"
> > > >                           % (v.describe(self.info), v.type.describe()))
> > > > 
> > > > This enforces docs/devel/qapi-code-gen.rst's clause
> > > > 
> > > >       The BRANCH's value defines the branch's properties, in particular its
> > > >       type.  The type must a struct type.  [...]
> > > > 
> > > > Next paragraph:
> > > > 
> > > >       In the Client JSON Protocol, a union is represented by an object with
> > > >       the common members (from the base type) and the selected branch's
> > > >       members.  The two sets of member names must be disjoint.
> > > > 
> > > > So, we're splicing in the members of the branch's JSON object.  For that
> > > > to even make sense, the branch type needs to map to a JSON object.  This
> > > > is fundamental.  It's the first part of the condition in the code
> > > > snippet above.
> > > > 
> > > > We have two kinds of QAPI types that map to a JSON object: struct and
> > > > union.  The second part of the condition restricts to struct.  Unless
> > > > I'm missing something (imperfect memory...), this is *not* fundamental,
> > > > just a matter of implementing it.  But I'd have to try to be sure.
> > > > 
> > > > 
> > > > Instead of simply allowing unions in addition to structs here, I'd like
> > > > to go one step further, and fuse the two into "objects".  Let me
> > > > explain.
> > > > 
> > > > If we abstract from syntax, structs have become almost a special kind of
> > > > union.  Unions have a set of common members and sets of variant members,
> > > > and a special common member (the tag) selects the set of variant
> > > > members.  Structs are unions with zero variants and no tag.
> > > > 
> > > > The generator code actually represents both structs and unions as a
> > > > common QAPISchemaObjectType already.  QAPI/QMP introspection does the
> > > > same: it uses a single meta type 'object' for both.
> > > > 
> > > > 
> > > > There is another spot where only structs are allowed: a struct or
> > > > union's base type.  That restriction will be awkward to lift, as I made
> > > > the mistake of baking the assumption "object type has at most one tag
> > > > member" into QAPI/QMP introspection .
> > > Hi Markus, thankyou for explaning in such detail. I tried to understand of what you explained.
> > > 
> > > So IIUC, you mentioned the QAPI generator treats both structs and unions same, but basically in the schema.py checks is where it tries to distinguish between the two ? and because of the fact that docs/devel/qapi-code-gen.rst states that for a union, it's branches must be 'struct', and that's the reason it gives an error ?
> > Permit me a brief digression into history.
> > 
> > The initial QAPI design language provided product types (structs) and
> > sum types (unions containing exactly one of several types, and a tag
> > member that tells which one).  The two are orthogonal.
> > 
> > These unions turned out rather awkward.
> > 
> > The unions we have today are more general.  They have common members,
> > and one of them is the tag member, of enumeration type.  For each tag
> > value, they have variant members.  Both the common members and each tag
> > value's variant members are given as struct types.
> > 
> > What if the tag's enumeration type is empty, i.e. has no values?  We get
> > a union with no variant members, only common ones.  Isn't that a struct?
> > 
> > Not quite.  To get a struct, we also have to drop the tag member.  It
> > has no possible values anyway.
> > 
> > You see, struct types are almost a special case of today's union types.
> > To overcome "almost", we can introduce the notion of "object type":
> > 
> > * An object type has common members, one of them can be a tag member, of
> >    enumeration type, not empty.  For each tag value, it additionally has
> >    variant members.
> > 
> > * A union type is an object type with a tag member and variant members.
> > 
> > * A struct type is an object type without tag member and variant
> >    members.
> > 
> > The QAPI generator code already made the jump to this object type
> > notion.  It transform the special cases into the general case at first
> > opportunity, in QAPISchema._def_struct_type() and ._def_union_type().
> > 
> > *Except* we haven't implemented support for variant members in a few
> > places where they cannot occur now, e.g. as a tag value's variant.  This
> > is the restriction you ran into.
> > 
> > I'd like to make the jump to object type in the QAPI schema language,
> > too.  But that's not a prerequisite to lifting the restriction.
> > 
> > > If that's the case, can we improve on our checks and allow union as a part of branch of a union ? or something else ?
> > I believe we can implement the missing parts and relax the checks.  But
> > to be sure, we need to try.
> > 
> > > or I may have completely misunderstood most of the part 😅. Please let me know
> > More questions?
> 
> Completely understood everything. Thankyou for the wonderful explanation.
> Looking forward to implement the missing parts in QAPI schema language.

I cc'd you on a patch that implements this missing feature a couple
of days ago, and its on Markus' review todo list. So we should be
able to decide how to move forward sometime next week.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


