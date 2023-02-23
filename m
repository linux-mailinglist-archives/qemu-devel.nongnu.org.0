Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C429E6A0ACA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:41:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBpk-0002cN-5j; Thu, 23 Feb 2023 08:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBpi-0002cD-QH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBpg-00086J-N5
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EX8xr6HTN9kb0djaA6JnDYHZ07qgyzBQV/DCa0tFDn0=;
 b=QP1ufsKiCGK4zlXUVtz+JuY1eM8ggg088QMvu3wjRKALVI6Wb8cfsqnwt1ltIo4TI77qTS
 h26X3GDdU74B31KhHXX+z7hC98I9OYE+b8/culr1CFFvvI+fnocBSzJMNBl3Cum8mII58j
 shb+lMrv6Zhr+8oHOr+0ivFN+tkJKn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-rV2Ki8T7P9GoEx9AayCnEg-1; Thu, 23 Feb 2023 08:40:20 -0500
X-MC-Unique: rV2Ki8T7P9GoEx9AayCnEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F33F987B2A0;
 Thu, 23 Feb 2023 13:40:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B036240C945A;
 Thu, 23 Feb 2023 13:40:18 +0000 (UTC)
Date: Thu, 23 Feb 2023 13:40:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Eric Blake <eblake@redhat.com>, Het Gala <het.gala@nutanix.com>
Subject: Re: [PATCH] qapi: allow unions to contain further unions
Message-ID: <Y/dswOceuXI6LbF1@redhat.com>
References: <20230214184404.1865237-1-berrange@redhat.com>
 <87o7pkg7ym.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7pkg7ym.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Thu, Feb 23, 2023 at 08:24:33AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > This extends the QAPI schema validation to permit unions inside unions,
> > provided the checks for clashing fields pass.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >
> > This patch comes out of the discussion on Het's migration series
> > starting at this patch:
> >
> >   https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02111.html
> >
> > Markus had described his desired improved architecture
> >
> >   https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02719.html
> >
> > but I don't think I have enough knowledge of the QAPI code to attempt
> > to fuse the handling of structs/unions as mentioned. This patch does
> > what looks to be the bare minimum to permit unions in unions, while
> > keeping validation checks for clashing fields.
> >
> > I've not tested beyond the unit tests, but if this is acceptable
> > from Markus' POV, I'd expect Het to insert this patch at the
> > start of his migration series and thus test it more fully.
> >
> >  scripts/qapi/schema.py                        |  6 +--
> >  .../union-invalid-union-subfield.err          |  2 +
> >  .../union-invalid-union-subfield.json         | 27 +++++++++++++
> >  .../union-invalid-union-subfield.out          |  0
> >  .../union-invalid-union-subtype.err           |  2 +
> >  .../union-invalid-union-subtype.json          | 26 +++++++++++++
> >  .../union-invalid-union-subtype.out           |  0
> >  tests/qapi-schema/union-union-branch.err      |  0
> >  tests/qapi-schema/union-union-branch.json     | 26 +++++++++++++
> >  tests/qapi-schema/union-union-branch.out      | 38 +++++++++++++++++++
> >  10 files changed, 124 insertions(+), 3 deletions(-)
> >  create mode 100644 tests/qapi-schema/union-invalid-union-subfield.err
> >  create mode 100644 tests/qapi-schema/union-invalid-union-subfield.json
> >  create mode 100644 tests/qapi-schema/union-invalid-union-subfield.out
> >  create mode 100644 tests/qapi-schema/union-invalid-union-subtype.err
> >  create mode 100644 tests/qapi-schema/union-invalid-union-subtype.json
> >  create mode 100644 tests/qapi-schema/union-invalid-union-subtype.out
> >  create mode 100644 tests/qapi-schema/union-union-branch.err
> >  create mode 100644 tests/qapi-schema/union-union-branch.json
> >  create mode 100644 tests/qapi-schema/union-union-branch.out
> >
> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> > index cd8661125c..062c6bbb00 100644
> > --- a/scripts/qapi/schema.py
> > +++ b/scripts/qapi/schema.py


> > diff --git a/tests/qapi-schema/union-invalid-union-subfield.err b/tests/qapi-schema/union-invalid-union-subfield.err
> > new file mode 100644
> > index 0000000000..d3a2e31aff
> > --- /dev/null
> > +++ b/tests/qapi-schema/union-invalid-union-subfield.err
> > @@ -0,0 +1,2 @@
> > +union-invalid-union-subfield.json: In union 'TestUnion':
> > +union-invalid-union-subfield.json:22: member 'teeth' of type 'TestTypeFish' collides with base member 'teeth'
> > diff --git a/tests/qapi-schema/union-invalid-union-subfield.json b/tests/qapi-schema/union-invalid-union-subfield.json
> > new file mode 100644
> > index 0000000000..235f76d7da
> > --- /dev/null
> > +++ b/tests/qapi-schema/union-invalid-union-subfield.json
> > @@ -0,0 +1,27 @@
> 
> This is the negative test I asked for above.  Good.
> 
> We commonly start with a comment on what is being tested.  Suggest
> 
>    # Clash between common member and union variant's variant member
>    # Base's member 'teeth' clashes with TestTypeFish's


Yes, added.


> > +{ 'union': 'TestUnion',
> > +  'base': { 'type': 'TestEnum',
> > +	    'teeth': 'int' },
> 
> Indentation is off.

Opps, a <tab> appeared.

> > diff --git a/tests/qapi-schema/union-invalid-union-subtype.err b/tests/qapi-schema/union-invalid-union-subtype.err
> > new file mode 100644
> > index 0000000000..7b8679c08f
> > --- /dev/null
> > +++ b/tests/qapi-schema/union-invalid-union-subtype.err
> > @@ -0,0 +1,2 @@
> > +union-invalid-union-subtype.json: In union 'TestUnion':
> > +union-invalid-union-subtype.json:22: base member 'type' collides with base member 'type'
> 
> The error message is crap.  See below.

Agreed, and now fixed.

> > diff --git a/tests/qapi-schema/union-invalid-union-subtype.json b/tests/qapi-schema/union-invalid-union-subtype.json
> > new file mode 100644
> > index 0000000000..59ca4b0385
> > --- /dev/null
> > +++ b/tests/qapi-schema/union-invalid-union-subtype.json
> > @@ -0,0 +1,26 @@
> 
> Suggest
> 
>    # Clash between common member and union variant's common member
>    # Base's member 'type' clashes with TestTypeA's

Yes, added.


> > +{ 'union': 'TestUnion',
> > +  'base': { 'type': 'TestEnum' },
> > +  'discriminator': 'type',
> > +  'data': { 'value-a': 'TestTypeA',
> > +            'value-b': 'TestTypeB' } }
> 
> This new test is structurally similar to existing test
> union-clash-member.  Synopsis:
> 
>   { 'enum': 'TestEnum',                     { 'enum': 'TestEnum',
>     'data': [ 'value-a', 'value-b' ] }        'data': [ 'value1', 'value2' ] }
> 
>                                             { 'struct': 'Base',
>                                               'data': { 'enum1': 'TestEnum',
>                                               '*name': 'str' } }
> 
>   { 'enum': 'TestEnumA',
>     'data': [ 'value-a1', 'value-a2' ] }
> 
>   { 'struct': 'TestTypeA1',
>     'data': { 'integer': 'int' } }
> 
>   { 'struct': 'TestTypeA2',
>     'data': { 'integer': 'int' } }
> 
>   { 'union': 'TestTypeA',                   { 'struct': 'Branch1',
>     'base': { 'type': 'TestEnumA' },          'data': { 'name': 'str' } }
>     'discriminator': 'type',
>     'data': { 'value-a1': 'TestTypeA1',
>               'value-a2': 'TestTypeA2' } }
> 
>   { 'struct': 'TestTypeB',                  { 'struct': 'Branch2',
>     'data': { 'integer': 'int' } }            'data': { 'value': 'int' } }
> 
>   { 'union': 'TestUnion',                   { 'union': 'TestUnion',
>     'base': { 'type': 'TestEnum' },           'base': 'Base',
>     'discriminator': 'type',                  'discriminator': 'enum1',
>     'data': { 'value-a': 'TestTypeA',         'data': { 'value1': 'Branch1',
>               'value-b': 'TestTypeB' } }                'value2': 'Branch2' } }
> 
> Differences:
> 
> * Names and scalar types, which shouldn't matter.
> 
> * Base is inline vs. explicit type; shouldn't matter.

But does matter - this is what results in the bad error messages
mentioned in the next point.

> * First branch is a union vs. a struct.  Since the error is about a
>   common union member, this shouldn't matter, either.  But it does: the
>   error message is much worse, namely
> 
>     base member 'type' collides with base member 'type'
> 
>   vs.
> 
>     member 'name' of type 'Branch1' collides with member 'name' of type 'Base'
> 
> Something's off here.

When 'describe' formats a name for the base member it is insufficiently
specific. It had intentionally skipped added info about the type containing
the base, because it (rightly) assumed there was only one applicable
containing type in that context. THis assumption is not valid once we allow
unions in unions, so we need to be explicit about the containing type.

> > diff --git a/tests/qapi-schema/union-union-branch.json b/tests/qapi-schema/union-union-branch.json
> > new file mode 100644
> > index 0000000000..d3d7ce57c6
> > --- /dev/null
> > +++ b/tests/qapi-schema/union-union-branch.json
> > @@ -0,0 +1,26 @@

snip

> > +{ 'union': 'TestUnion',
> > +  'base': { 'type': 'TestEnum' },
> > +  'discriminator': 'type',
> > +  'data': { 'value-a': 'TestTypeA',
> > +            'value-b': 'TestTypeB' } }
> 
> This is union-invalid-union-subtype.json with the clash fixed by
> renaming TestTypeA's member 'type' to 'type-a'.
> 
> We have three non-clashing members called 'integer':
> 
> 1. TestUnion branch value-a branch value-a1 common member
> 
> 2. TestUnion branch value-a branch value-a2 common member
> 
> 3. TestUnion branch value-b common member
> 
> They all map to the same member on the wire.  This is the positive test
> I asked for above.  Good.
> 
> Except it needs to go into tests/qapi-schema/qapi-schema-test.json, so
> we actually generate code and compile it.  Let me explain.
> 
> All the test schemas are fed to test-qapi.py, which tests the QAPI
> generator's frontend.
> 
> qapi-schema-test.json and doc-good.json we additionally feed to
> qapi-gen.py.  The code generated for the former gets compiled into a
> number of unit tests.  To find them, use
> 
>     $ git-grep -l '#include.*test-qapi-' 
> 
> Would you mind extending them so the code is actually exercised?

Ok, yes, I missed that aspect. So 99% of the qapi-schema/*.json
files are only for validating bad scenarios. The good scenarios
should (nearly) all be in qapi-schema-test.json.

I'm adding to test-qobject-{input,output}-visitor.c to validate
this new union-in-union handling.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


