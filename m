Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EEF4267B0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 12:22:15 +0200 (CEST)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYn13-0005dw-Ik
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 06:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mYmxG-0004wU-78
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:18:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mYmx9-0008Tg-KG
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633688289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mv/g3kwJxVxRr4rg9nMrKWeRgLiGUnhF1OSbXlHlX6M=;
 b=TNXiZxGNpvraQnGNgMk8GshbOAvpSzVmiGLKtV8HGrUNTYhlBwANxa+FIW28FbYvWs/sg3
 RHMOWWQ/KEYLu9v6LLCCrEKQepwLEg1w6nPjZjLvlsgen17iC0qpIX9cblaBLo1R18/UxI
 3co7RNULDBgPYDv888beksAzpx76ro4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-VT103hWSMjWWY-ESP2vQxw-1; Fri, 08 Oct 2021 06:18:01 -0400
X-MC-Unique: VT103hWSMjWWY-ESP2vQxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC2CE801AB0
 for <qemu-devel@nongnu.org>; Fri,  8 Oct 2021 10:18:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72F6F5BAEA;
 Fri,  8 Oct 2021 10:18:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D964E113865F; Fri,  8 Oct 2021 12:17:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
References: <YUG71uATYCwpRyQH@redhat.com> <8735q3y5db.fsf@dusky.pond.sub.org>
 <YUSuThJtW9ar2wCY@redhat.com> <87a6jrimaf.fsf@dusky.pond.sub.org>
 <YVsKpClmGgq5ki7r@redhat.com> <87mtnnvay7.fsf@dusky.pond.sub.org>
 <YVyFwWHY7a7CKMxN@redhat.com> <874k9uqov5.fsf@dusky.pond.sub.org>
 <YV3QlKi4jeW+54Yb@redhat.com> <87ee8xhz6u.fsf@dusky.pond.sub.org>
 <YV8ccu9MpKjyXT/G@redhat.com>
Date: Fri, 08 Oct 2021 12:17:58 +0200
In-Reply-To: <YV8ccu9MpKjyXT/G@redhat.com> (Kevin Wolf's message of "Thu, 7
 Oct 2021 18:12:34 +0200")
Message-ID: <87wnmn7rc9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 07.10.2021 um 13:06 hat Markus Armbruster geschrieben:
>> >> >> > HMP in contrast means separate code for every command, or translated to
>> >> >> > the CLI for each command line option. HMP is not defined in QAPI, it's
>> >> >> > a separate thing that just happens to call into QAPI-based QMP code in
>> >> >> > the common case.
>> >> >> >
>> >> >> > Is this what you have in mind for non-JSON command line options?
>> >> >> 
>> >> >> We should separate the idea "HMP wraps around QMP" from its
>> >> >> implementation as handwritten, boilerplate-heavy code.
>> >> >> 
>> >> >> All but the latest, QAPI-based CLI options work pretty much like HMP: a
>> >> >> bit of code generation (hxtool), a mix of common and ad hoc parsers,
>> >> >> boring handwritten code to translate from parse tree to internal C
>> >> >> interfaces (which are often QMP command handlers), and to stitch it all
>> >> >> together.
>> >> >> 
>> >> >> Reducing the amount of boring handwritten code is equally desirable for
>> >> >> HMP and CLI.
>> >> >> 
>> >> >> So is specifying the interface in QAPI instead of older, less powerful
>> >> >> schema languages like hxtool and QemuOpts.
>> >> >> 
>> >> >> There are at least three problems:
>> >> >> 
>> >> >> 1. Specifying CLI in QAPI hasn't progressed beyond the proof-of-concept
>> >> >> stage.
>> >> >> 
>> >> >> 2. Backward compatibility issues and doubts have defeated attempts to
>> >> >> replace gnarly stuff, in particular QemuOpts.
>> >> >> 
>> >> >> 3. How to best bridge abstract syntax differences has been unclear.
>> >> >> Whether the differences are historical accidents or intentional for ease
>> >> >> of human use doesn't matter.
>> >> >> 
>> >> >> Aliases feel like a contribution towards solving 3.
>> >> >> 
>> >> >> I don't think 1. is particularly difficult.  It's just a big chunk of
>> >> >> work that isn't really useful without solutions for 2. and 3.
>> >> >> 
>> >> >> To me, 2. feels intractable head on.  Perhaps we better bypass the
>> >> >> problem by weakening the compatibility promise like we did for HMP.
>> >> >
>> >> > Can we define 2 in a bit more specific terms? I feel the biggest part
>> >> > of 2 is actually 3.
>> >> >
>> >> > You mention QemuOpts, but how commonly are the potentially problematic
>> >> > features of it even used? Short booleans are deprecated and could be
>> >> > dropped in 6.2. merge_lists may or may not have to be replicated.
>> >> > I know building lists from repeated keys is said to be a thing, where
>> >> > does it happen? I've worked on some of the big ones (blockdev, chardev,
>> >> > object, device) and haven't come across it yet.
>> >> 
>> >> Alright, I'll look for you :) Check out commit 2d6dcbf93fb, 396f935a9af,
>> >> 54cb65d8588, f1672e6f2b6.  These are fairly recent, which is kind of
>> >> depressing.  There may be more.
>> >
>> > Should we patch QemuOpts to disallow this by default and require setting
>> > QemuOptsList.legacy_enable_repeated_options just to avoid new instances
>> > sneaking in?
>> 
>> I honestly don't know.
>> 
>> On the one hand, the use of repeated keys for lists wasn't designed into
>> QemuOpts, it was a "clever" (ab)use of a QemuOpts implementation detail.
>> 
>> On the other hand, -vnc vnc=localhost:1,vnc=unix:/tmp/vnc feels
>> friendlier to human me than -vnc vnc.0=localhost:1,vnc.1=unix:/tmp/vnc.
>> 
>> Repeated keys just don't fit into the QAPI parsing pipeline.  "Object
>> member names are unique" is baked into data structures and code.  Quite
>> reasonable when you start with JSON.
>> 
>> But this is a digression.
>
> Making a list out of repeated keys should be easy in the keyval parser.
> Turning a single or an absent key into a list in the right cirumstances
> is harder because the keyval parser knows nothing about the schema.

This is our JSON parsing pipeline:

         JSON       qobject
        parser      visitor
    text ---> QObject ---> C object

Our representation of JSON objects as QDict assumes unique keys.

The JSON parser treats duplicate keys as an error.

The dotted keys parsing pipeline came later, and has the same structure:

        keyval      qobject
        parser      visitor
    text ---> QObject ---> C object

It differs in the details, though: scalars can only be QString, and the
visitor is tailored for that.

It's identical in the detail that matters here: can only do unique keys.

The keyval parser accepts duplicate keys.  The last value wins.

The clean way to support "repeated keys are lists in list context, else
last one wins" is to change the abstract syntax tree to reflect that:
instead of QDict, we use something that represents all the (key, value)
pairs given.  When the visitor visits a list, it uses all the pairs.
When it visits a scalar, it uses the last one.

The gap between the two abstract syntax trees widens.  Isn't that bad;
they are different already, and using the same C type for both risks
confusing one for the other.

Falls apart for type 'any': a single key could be a scalar or a list
with one member, but the visitor can't decide.  Likewise, an absent key
could be an absent optional list or an empty list.

Note that "repeated keys are lists in list context, else last one wins"
is internally inconsistent: you can overwrite a key's value, except when
you can't.

QemuOpts makes use of the overwrite feature when it combines multiple
sources.  Doesn't apply to keyval.  Perhaps I should have chosen to make
keyval incompatible there.

> Of course, we use the keyval parser in combination with the keyval
> visitor, and when visiting lists, we could accept absent or scalar
> values by wrapping a list around the input. (Doing the same for objects
> would feel a bit crazier, but I don't think we need that anyway.)

This is how the opts visitor works, and I don't like it.

> So I think this is actually doable if we want.
>
> But in general, the split between parser and schema keeps giving us
> trouble, and visitors not knowing anything about future visitor calls
> can make things harder, too. Probably too late to use a fundamentally
> different way to parse things, though.

The split between JSON parser and visitor makes sense, and simplifies
the code.

The same split is problematic for dotted keys, because there the syntax
conveys less structure.  We accepted the resulting flaws (see "Design
flaw:" in util.keyval.c) to keep the code simple.

To truly do better, we'd have to replace the dotted keys parsing
pipeline wholesale, I believe: do everything in a new visitor, so the
visitor can guide the parsing.  Still flawed for 'any', though.

>> >> > Can we have an intermediate state where CLI parsing involves both QAPI
>> >> > generated options and manually written ones? So that we can actually put
>> >> > the QAPIfication work already done to use instead of just having a
>> >> > promise that it will make things possible eventually, in a few years?
>> >> 
>> >> We kind of sort of have that already: a few option arguments are
>> >> QAPI-based.
>> >> 
>> >> Perhaps it's time to crack 1., but in a way that accommodates
>> >> handwritten options.  Could be like "this option takes a string
>> >> argument, and the function to process the option is not to be generated,
>> >> only called (just like 'gen': false for commands).  We may want to make
>> >> introspection describe the argument as "unknown", to distinguish it from
>> >> genuine string arguments.
>> >
>> > Maybe 'data': 'any' rather than 'gen': false if the keyval parser makes
>> > sense for the option.
>> 
>> Yes, providing for "keyval without visitor" may be useful.
>> 
>> >                       Or as a first step, just call into a single C
>> > function for any unknown option so that we don't have to split the big
>> > switch block immediately and can instead reduce it incrementally. Then
>> > 'data': 'any' is an intermediate step we can take when a function is too
>> > complicated to be fully QAPIfied in a single commit.
>> 
>> Yes, we could have some options defined in the QAPI schema, the
>> remainder in .hx, then stitch the generated code together.  Enables
>> moving commands from .hx to the QAPI schema one by one.
>> 
>> I'm not sure that's simpler than replacing .hx wholesale.
>
> I didn't even think of .hx any more. So the above refers only to the
> parsing loop in qemu_init(). Moving things from .hx to the schema can
> probably be done mostly independent from converting the implementation
> when you start with 'gen': false.

Once we have the means to define options in the QAPI schema, replacing
.hx wholesale is possible, and probably less painful than moving options
one by one over time.

> Actually, the other thing .hx contains is help texts. I seem to remember
> that you had another half-finished set of patches to display help from
> QAPI documentation?

I toyed with generating "better than nothing" help for the wire format
with a visitor.  Doc comments aren't visible there.

Doc comments are basically the reference manual interpolated into schema
code.  A way to say "show me the reference manual for -frobnicate" could
be useful.  But it's not what -help shows today.  The reference manual
is much, much more verbose than -help.  If we want to keep -help terse,
we'll need a way to write text for it.

>> > But yes, I guess cracking 1. is what I had in mind: Let QAPI control the
>> > command line parsing and only call out into handwritten code for not yet
>> > converted options. I think this would be a big step forward compared to
>> > the current state of only calling into QAPI for selected options because
>> > it makes it very obvious that new code should use QAPI, and it would
>> > also give us more a visible list of things that still need to be
>> > converted.
>> 
>> No argument.
>> 
>> I have (dusty) RFC patches.
>
> Time to undust them?

I'd like to.

>> >> >> > What I had in mind was using the schema to generate the necessary code,
>> >> >> > using the generic keyval parser everywhere, and just providing a hook
>> >> >> > where the QDict could be modified after the keyval parser and before the
>> >> >> > visitor. Most command line options would not have any explicit code for
>> >> >> > parsing input, only the declarative schema and the final option handler
>> >> >> > getting a QAPI type (which could actually be the corresponding QMP
>> >> >> > command handler in the common case).
>> >> >> >
>> >> >> > I think these are very different ideas. If we want HMP-like, then all
>> >> >> > the keyval based code paths we've built so far don't make much sense.
>> >> >> 
>> >> >> I'm not sure the differences are "very" :)
>> >> >> 
>> >> >> I think you start at "human-friendly and machine-friendly should use the
>> >> >> abstract syntax defined in the QAPI schema, except where human-friendly
>> >> >> has to differ, say for backward compatibility".
>> >> >> 
>> >> >> This approach considers differences a blemish.  The "standard" abstract
>> >> >> syntax (the one defined in the QAPI schema) should be accepted in
>> >> >> addition to the "alternate" one whenever possible, so "modern" use can
>> >> >> avoid the blemishes, and blemishes can be removed once they have fallen
>> >> >> out of use.
>> >> >> 
>> >> >> "Alternate" should not be limited to human-friendly.  Not limiting keeps
>> >> >> things consistent, which is good, because differences are bad.
>> >> >> 
>> >> >> Is that a fair description?
>> >> >
>> >> > Hm, yes and no.
>> >> >
>> >> >
>> >> > I do think that making the overlap between "standard" and "alternate"
>> >> > abstract syntax as big as possible is a good thing because it means less
>> >> > translation has to go on between them, and ultimately the interfaces are
>> >> > more consistent with each other which actually improves the human
>> >> > friendliness for people who get in touch with both syntaxes.
>> >> >
>> >> > The -chardev conversion mostly deals with differences that I do consider
>> >> > a blemish: There is no real reason why options need to have different
>> >> > names on both interfaces, and there is also a lot of nesting in QMP for
>> >> > which there is no real reason.
>> >> >
>> >> > The reason why we need to accept both is compatibility, not usability.
>> >> 
>> >> Compatibility requires us to accept both, but each in its place.  It
>> >> doesn't actually require us to accept both in either place.
>> >
>> > Yes.
>> >
>> >> > There are also some differences that are justified by friendliness.
>> >> > Having "addr" as a nested struct in QMP just makes sense, and on the
>> >> > command line having it flattened makes more sense.
>> >> >
>> >> > So accepting "path" for "device" in ChardevHostdev is probably a case
>> >> > where switching both QMP and CLI to "modern" use and remove the
>> >> > "blemish" eventually makes sense to me. The nesting for "addr" isn't.
>> >> >
>> >> > We may even add more differences to make things human friendly. My
>> >> > standard for this is whether the difference serves only for
>> >> > compatibility (should go away eventually) or usability (should stay).
>> >> 
>> >> In theory, cleaning up QMP is nice.  In practice, we don't have a good
>> >> way to rename or move members.  When we do, we have to make both old and
>> >> new optional, even when you actually have to specify exactly one.  This
>> >> isn't the end of the world, but it is trading one kind of blemish for
>> >> another.
>> >> 
>> >> Improving on that would involve a non-trivial extension to
>> >> introspection.  Pain right away, gain only when all management
>> >> applications that matter grok it.
>> >> 
>> >> I think the realistic assumption is that QMP blemishes stay.
>> >> 
>> >> Of course, we'd prefer not to copy existing QMP blemishes into new
>> >> interfaces.  That's why we have SocketAddress for new code, and
>> >> SocketAddressLegacy for old code.  Workable for simple utility types.  I
>> >> don't have a good solution for "bigger" types.
>> >
>> > If this is a common problem and we want to solve it in a declarative
>> > way, presumably a way to define mappings similar to aliases is not
>> > unthinkable. Apart from the effort to implement it, there is no reason
>> > why two types on the external interface couldn't share a single
>> > representation in C, just with different mappings.
>> 
>> True.
>> 
>> If we use aliases to provide multiple wire formats for a common C type,
>> the common C type can only be the most nested one.  I'd prefer the least
>> nested one.  We'll live.
>
> This direction would actually have been easier to implement, but it's
> also much less powerful and couldn't have solved the problem I tried to
> solve.
>
> It could be used for flattening simple unions and for local aliases, but
> pulling things like addr.* to the top level would be impossible unless
> you directly embed the fields of SocketAddress into ChardevBackend.
>
>> >> >> I start at "human-friendly syntax should be as friendly as we can make
>> >> >> it, except where we have to compromise, say for backward compatibility".
>> >> >> 
>> >> >> This approach embraces differences.  Mind, not differences just for
>> >> >> differences sake, only where they help users.
>> >> >> 
>> >> >> Additionally accepting the "standard" abstract syntax is useful only
>> >> >> where it helps users.
>> >> >> 
>> >> >> "Alternate" should be limited to human-friendly.
>> >> >
>> >> > I think there is a small inconsistency in this reasoning: You say that
>> >> > differences must help users, but then this is not the measuring stick
>> >> > you use in the next paragraph. If it were, you would be asking whether
>> >> > rejecting "standard" abstract syntax helps users, rather than whether
>> >> > adding it does. (Even more so because rejecting it is more work! Not
>> >> > much more work, but it adds a little bit of complexity.)
>> >> 
>> >> Additionally accepting "standard" complicates the interface and its
>> >> documentation.  Whether this helps users more than it hurts them is not
>> >> obvious.
>> >
>> > Fair. When it's unclear for users, let's consider developers? :-)
>> >
>> > I really don't want to invest a lot of time and effort (and code
>> > complexity) just to get "standard" rejected.
>> 
>> I acknowledge the existence of working code :)
>> 
>> If we had understood the problem back then as well as we do now, you
>> might have written different code.
>
> s/the problem/the maintainer's preferences/ ;-)
>
> The implicit requirement I wasn't aware of is "there should be only one
> way to express the same thing on each external interface". Aliases go
> against that by their very nature - they provide a second way.
>
>> Aliases are for *adding* "alternate" to "standard" by nature.
>> 
>> To get "alternate" *instead* of "standard", something else might be a
>> better fit.  "T2 inherits from T1 with the following renames" comes to
>> mind.
>
> Right.
>
>> >> >> > I guess I can go into more details once we have answered these
>> >> >> > fundamental questions.
>> >> >> >
>> >> >> > (We could and should have talked about them and about whether you want
>> >> >> > to have aliases at all a year ago, before going into detailed code
>> >> >> > review and making error messages perfect in code that we might throw
>> >> >> > away anyway...)
>> >> >> 
>> >> >> I doubt you could possibly be more right than that!
>> >> >
>> >> > So what questions need to be answered before we can make a decision?
>> >> >
>> >> > You talked a lot about how you like QMP to be different from the command
>> >> > line. So is restricting aliases to the command line enough to make them
>> >> > acceptable? Or do we need larger changes? Should I just throw them away
>> >> > and write translation code for -chardev manually?
>> >> 
>> >> Fair question, but I'm out of time for right now.  Let's continue
>> >> tomorrow.
>> >
>> > :-)
>> 
>> What's the smallest set of aliases sufficient to make your -chardev
>> QAPIfication work?
>
> How do you define "make the QAPIfication work"?
>
> The -chardev conversion adds the following aliases to the schema:
>
> * SocketAddressLegacy: Flatten a simple union (wildcard alias +
>   non-local alias)
>
>     { 'source': ['data'] },
>     { 'name': 'fd', 'source': ['data', 'str'] }
>
> * ChardevFile: Rename local member
>
>     { 'name': 'path', 'source': ['out'] }
>
> * ChardevHostdev: Rename local member
>
>     { 'name': 'path', 'source': ['device'] }
>
> * ChardevSocket: Flatten embedded struct (wildcard alias)
>
>     { 'source': ['addr'] }
>
> * ChardevUdp: Flatten two embedded structs with renaming (wildcard
>   alias + non-local alias)
>
>     { 'source': ['remote'] },
>     { 'name': 'localaddr', 'source': ['local', 'data', 'host'] },
>     { 'name': 'localport', 'source': ['local', 'data', 'port'] }
>
> * ChardevSpiceChannel: Rename local member
>
>     { 'name': 'name', 'source': ['type'] }
>
> * ChardevSpicePort: Rename local member
>
>     { 'name': 'name', 'source': ['fqdn'] }
>
> * ChardevBackend: Flatten a simple union (wildcard alias)
>
>     { 'source': ['data'] }
>
> * ChardevOptions: Flatten embedded struct (wildcard alias)
>
>     { 'source': ['backend'] }

Aside: most of the renames are due to "reuse" of existing QemuOpts
parameters.  I'm sure it has saved "lots" of typing.

> The deeper they are nested in the type hierarchy, especially when unions
> with different variants come into play, the nastier they are to replace
> with C code. The C code stays the simplest if all of the aliases are
> there, and it gets uglier the more of them you leave out.
>
> I don't know your idea of "sufficient", so I'll leave mapping that to a
> scale of sufficiency to you.

Alright let me see what we got.

This is the tree structure with branches not mentioned in aliases
omitted:

    ChardevOptions
        backend: ChardevBackend
            data: ChardevFile
            data: ChardevHostdev
            data: ChardevSocket
                addr: SocketAddressLegacy
                    data: String
                        str: str
                    data: ...
            data: ChardevUdp
                remote: SocketAddressLegacy
                    data: String
                        str: str
                    data: ...
                local: SocketAddressLegacy
                    data: String
                        str: str
                    data: ...
            data: ChardevSpiceChannel
            data: ChardevSpicePort
            data: ...

This is how we map -chardev's argument to the tree structure:

* Always, in qemu_chr_new_from_opts(), qemu_chr_parse_opts(),
  qemu_chr_parse_common():
log
  - id=id                       id
  - [backend=]T                 backend.type
  - logfile                     backend.data.logfile
  - logappend                   backend.data.logappend

* When T is file, in qemu_chr_parse_file_out():

  - path                        backend.data.out
  - append                      backend.data.append

  Note: there is no way to set backend.data.in.

* When T is serial, parallel, or pipe, in qemu_chr_parse_serial(),
  qemu_chr_parse_parallel(), qemu_chr_parse_pipe():

  - path                        backend.data.device

* When T is socket, in qemu_chr_parse_socket()

  - delay and nodelay           backend.data.nodelay
  - server                      backend.data.server
  - telnet                      backend.data.telnet
  - tn3270                      backend.data.tn3270
  - websocket                   backend.data.websocket
  - wait                        backend.data.wait
  - reconnect                   backend.data.reconnect
  - tls-creds                   backend.data.tls-creds
  - tls-authz                   backend.data.tls-authz
  - host, path, fd              backend.data.addr.type

  Note: there is no way to set backend.data.addr.type to vsock.

  Additionally, when path is present:

  - path                        backend.data.addr.data.path
  - abstract                    backend.data.addr.data.abstract
  - tight                       backend.data.addr.data.tight

  Additionally, when host is present:

  - host                        backend.data.addr.data.host
  - port                        backend.data.addr.data.port
  - to                          backend.data.addr.data.to
  - ipv4                        backend.data.addr.data.ipv4
  - ipv6                        backend.data.addr.data.ipv6

  Note: there is no way to set backend.data.addr.data.numeric,
  .keep-alive, .mptcp.

  Additionally, when fd is present:

  - fd                          backend.data.addr.data.str

* When T is udp, in qemu_chr_parse_udp():

  - host                        backend.data.remote.data.host
  - port                        backend.data.remote.data.port
  - ipv4                        backend.data.remote.data.ipv4
  - ipv6                        backend.data.remote.data.ipv6
  - localaddr                   backend.data.local.data.host
  - localport                   backend.data.local.data.port

  Note: there is no way to set backend.data.remote.type and
  backend.data.local.type; both can only be inet.  There is no way to
  set backend.data.{remote,local}.data.to, .numeric, .keep-alive,
  .mptcp.  There is no way to set backend.data.local.data.ipv4, .ipv6.

* I'm omitting the remaining values of T.

* Parameters that exist for any value of T other than the one given are
  silently ignored.  Example: -chardev null,id=woot,ipv4=on.

  Do you preserve this wart for compatibility's sake?

Observations:

* Your replacement of this mapping code makes the dotted keys
  corresponding to the schema available in addition to the traditional
  key.  Example: backend.data.addr.data.host in addition to host.

* This makes some parameters available that weren't before.  Example:
  backend.data.addr.data.numeric and numeric.  Also
  backend.data.local.data.host but not host, because that's already
  backend.data.remote.data.host.

* It also creates "ghost" aliases, i.e. keys that don't exist in either
  of the two interfaces before.  These are artifacts of the alias chain
  from traditional key to schema member.  Example:
  backend.data.addr.host, backend.addr.data.host, backend.addr.host,
  data.addr.host, addr.data.host, and addr.host.  I think.  No, I missed
  backend.host.  Did I get them all?  No idea :)

All this should be spelled out in commit message(s).  I didn't peek
ahead to check them.

A different way to skin this cat would be putting the aliases at the
top, i.e. ChardevOptions.  I'm aware of your arguments against this.
Let's explore it anyway.

    backend                     backend.type
    path                        backend.data.out
    path                        backend.data.device
    *                           backend.data.*
    fd                          backend.data.addr.data.str
    *                           backend.data.addr.data.*
    *                           backend.data.remote.data.*
    localaddr                   backend.data.local.data.host
    localport                   backend.data.local.data.port

Observations / questions:

* Look ma, no "ghosts"!

* We need "path" twice.  They resolve to different branches of the
  union.  Hmm.

  Aliases pointing into union branches give me a queasy feeling.  What
  if we define an alias just for one branch, but then have it resolve in
  an unwanted way in another branch?  "Ghost" aliases, I guess.

  Perhaps we should attach the aliases to the union branch instead.  The
  "put them at the top" idea falls apart then.

  The issue exists just as much with "chained" use of aliases.  But
  there, it's just a few more ghosts joining ghost congress.

* How to provide full access to backend.data.local.data.*?  Assuming
  that's desired.


