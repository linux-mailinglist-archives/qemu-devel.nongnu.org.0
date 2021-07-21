Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC7E3D0F45
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:10:50 +0200 (CEST)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Bzt-0008Rp-Ir
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6By1-0006fA-E0
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:08:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6Bxw-0004iC-G9
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626872927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SsFZHSAIhQi31q0dbzwJK0SV2GWNV57p5W5rVjJdCI=;
 b=jQvT/H8S4Myh7VN9NbsdrreuiI65WmkDXhqeKe5qTNgBTaRiYhoDY/Cbt0uUCvDSg20evX
 EhAg8SStzS0Mb72VSr0w4NC9E4/00nePWCY6XDxTO/mhKokpvU1ke4LQoPfm3BcEquWucL
 C7FYLStqyA2sa9qCY/juA/8NvliuCxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-s3oYK_G-PKu92Pu_3bjCNw-1; Wed, 21 Jul 2021 09:08:46 -0400
X-MC-Unique: s3oYK_G-PKu92Pu_3bjCNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 309E1107465F;
 Wed, 21 Jul 2021 13:08:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D4BB10016DB;
 Wed, 21 Jul 2021 13:08:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B9BF711326B9; Wed, 21 Jul 2021 15:08:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 2/6] i386/sev: extend sev-guest property to include
 SEV-SNP
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-3-brijesh.singh@amd.com>
 <87h7gy4990.fsf@dusky.pond.sub.org>
 <20210720194212.vjmsktx2ti3apv2d@amd.com>
 <YPdFfSI7RdXOSnhE@redhat.com>
Date: Wed, 21 Jul 2021 15:08:37 +0200
In-Reply-To: <YPdFfSI7RdXOSnhE@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 20 Jul 2021 22:54:50 +0100")
Message-ID: <87h7gnbyqy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Michael Roth <michael.roth@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Jul 20, 2021 at 02:42:12PM -0500, Michael Roth wrote:
>> On Tue, Jul 13, 2021 at 03:46:19PM +0200, Markus Armbruster wrote:

[...]

>> > I recommend to do exactly what we've done before for complex
>> > configuration: define it in the QAPI schema, so we can use both dotted
>> > keys and JSON on the command line, and can have QMP, too.  Examples:
>> > -blockdev, -display, -compat.
>> >=20
>> > Questions?
>>=20
>> Hi Markus, Daniel,
>>=20
>> I'm dealing with similar considerations with some SNP config options
>> relating to CPUID enforcement, so I've started looking into this as
>> well, but am still a little confused on the best way to proceed.
>>=20
>> I see that -blockdev supports both JSON command-line arguments (via
>> qobject_input_visitor_new) and dotted keys
>> (via qobject_input_vistior_new_keyval).

Yes.  Convenience function qobject_input_visitor_new_str() provides
this.

>> We could introduce a new config group do the same, maybe something speci=
fic
>> to ConfidentialGuestSupport objects, e.g.:
>>=20
>>   -confidential-guest-support sev-guest,id=3Dsev0,key_a.subkey_b=3D...
>
> We don't wnt to be adding new CLI options anymore. -object with json
> syntx should ultimately be able to cover everything we'll ever need
> to do.

Depends.  When you want a CLI option to create a single QOM object, then
-object is commonly the way to go.

>> and use the same mechanisms to parse the options, but this seems to
>> either involve adding a layer of option translations between command-line
>> and the underlying object properties, or, if we keep the 1:1 mapping
>> between QAPI-defined keys and object properties, it basically becomes a
>> way to pass a different Visitor implementation into object_property_set(=
),
>> in this case one created by object_input_visitor_new_keyval() instead of
>> opts_visitor_new().

qobject_input_visitor_new_str() provides 1:1, i.e. common abstract
syntax, and concrete syntax either JSON or dotted keys.  Note that the
latter is slightly less expressive (can't do empty arrays and objects,
may fall apart for type 'any').  If you run into these limitations, use
JSON.  Machines should always use JSON.

qobject_input_visitor_new_str() works by wrapping the "right" visitor
around the option argument.  Another way to provide a human-friendly
interface in addition to a machine-friendly one is to translate from
human to the machine interface.  HMP works that way: HMP commands wrap
around QMP commands.  The QMP commands are generated from the QAPI
schema.  The HMP commands are written by hand, which is maximally
flexible, but also laborious.

>> In either case, genericizing it beyond CGS/SEV would basically be
>> introducing:
>>=20
>>   -object2 sev-guest,id=3Dsev0,key_a.subkey_b=3D...

That's because existing -object doesn't use keyval_parse() + the keyval
QObjct input visitor, it uses QemuOpts and the options visitor, for
backward compatibility with all their (barely understood) features and
warts.

Unfortunate, because even new user-creatable objects can't escape
QemuOpts.

QemuOpts needs to go.  But replacing it is difficult and scary in
places.  -object is such a place.

>> Which one seems preferable? Or is the answer neither?
>
> Yep, neither is the answer.

Welcome to the QemuOpts swamp, here's your waders and a leaky bucket.

>> I've also been looking at whether this could all be handled via -object,
>> and it seems -object already supports JSON command-line arguments, and t=
hat
>> switching it from using OptsVisitor to QObjectVisitor for non-JSON case
>> would be enough to have it handle dotted keys, but I'm not sure what the
>> fall-out would be compatibility-wise.

It's complicated, and nobody knows for sure.  That's why we didn't dare
to take the jump, and instead grafted on JSON syntax without changing
the old syntax.  Excuse me while I sacrifice another rubber chicken to
the backward compatibility idol.

>> All lot of that falls under making sure the QObject/keyval parser is
>> compatible with existing command-lines parsed via OptsVisitor. One examp=
le
>> where there still seems to be a difference is lack of support for ranges
>> such as "cpus=3D1-4" in keyval parser. Daniel had a series that addressed
>> this:
>>=20
>>   https://lists.gnu.org/archive/html/qemu-devel/2016-09/msg08248.html
>>=20
>> but it doesn't seem to have made it into the tree, which is why I feel l=
ike
>> maybe there are complications with this approach I haven't considered?
>
> The core problem with QemuOpts is that it has hacked various hacks
> grafted onto it to cope with non-scalar data. My patch was adding
> yet another hack. It very hard to introduce new hacks without risk
> of causing incompatibility with other existing hacks, or introducing
> unexpected edge cases that we don't anticipate.

Some of the thornier compatibility issues with QemuOpts are due to
unforeseen edge cases of, and interactions between features.

> Ultimately I think we've come to the conclusion that QemuOpts is an
> unfixable dead end that should be left alone. Our future is trending
> towards being entirely JSON, configured via the QMP monitor not the
> CLI. As such the json support for -object is a step towards the pure
> JSON world.

QemuOpts served us well for a while, but we've long grown out of its
limitations.  It needs to go.

QemuOpts not providing an adequate CLI language does not imply we can't
have an adequate CLI language.  The "everything QMP" movement is due to
other factors.  I have serious reservations about the idea, actually.

> IOW, if you have things that work today with QemuOpts that's fine.
>
> If, however, you're coming across situations that need non-scalar
> data and it doesn't work with QemuOpts, then just declare that
> -object json syntax is mandatory for that scenario. Don't invest
> time trying to improve QemuOpts for non-scalar data, nor inventing
> new CLI args.

I agree 100% with "don't mess with QemuOpts".  That mess is complete.

Whether a new CLI option makes sense should be decided case by case.

"Must use JSON" feels acceptable for things basically only management
applications use.

> FWIW, specificallly in the case of parameters that take an integer
> range, like cores=3D1-4, in JSON we'd end up representing that as a
> array of integers and having to specify all values explicitly.
> This is quite verbose, but functionally works.
>
> I think it would have been nice if we defined an explicit 'bitmap'
> scalar data type in QAPI for these kind of things, but at this point
> in time I think that ship has sailed, and trying to add that now
> would create an inconsistent representation across different places.

External representation (i.e. JSON) should be as consistent as we can
make it.  Multiple different internal representations can be okay.  So
far, we represent JSON arrays as linked lists.  Optionally representing
certain arrays of small integers as bit vectors feels feasible.  Whether
it's worth the effort is another question.


