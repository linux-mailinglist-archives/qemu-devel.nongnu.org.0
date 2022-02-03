Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF98E4A820F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:07:32 +0100 (CET)
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZ1X-00025n-D5
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:07:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nFYyD-0000TN-AQ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nFYy8-000747-Ks
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643882639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qls3ipRDsMvxRy4+a9VswriU+ku95FgXt/CdXAXw9Hg=;
 b=CA0qFX4C5MzrmzrXzrm4xDt/ZgwRACAM8xL9SRXosDmT3FNkEiUiCn/5veK6u65N2yJGJe
 DfKPRJm4R66cbPGcZfi+444WlcXSEUs1VfTbxU6bHKgs3E4ut5LYnfnFL8VGHkQzlPU0eK
 uKcnAeBQ8RMFijVKjSlv8MHNpe7e3kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-zDlHVYImNK-AL4Ty3G7DFA-1; Thu, 03 Feb 2022 05:03:58 -0500
X-MC-Unique: zDlHVYImNK-AL4Ty3G7DFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBD7B1018720
 for <qemu-devel@nongnu.org>; Thu,  3 Feb 2022 10:03:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02C5466E00;
 Thu,  3 Feb 2022 10:03:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 61FFA21E49CB; Thu,  3 Feb 2022 11:03:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Notes on Generating Python signatures for QMP RPCs
References: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
 <871r0tp96s.fsf@dusky.pond.sub.org>
 <CAFn=p-YEVpqMFUNt8-svhEMCvu4HEUvO06DUmJn3GZC0pTnf7Q@mail.gmail.com>
Date: Thu, 03 Feb 2022 11:03:36 +0100
In-Reply-To: <CAFn=p-YEVpqMFUNt8-svhEMCvu4HEUvO06DUmJn3GZC0pTnf7Q@mail.gmail.com>
 (John Snow's message of "Wed, 2 Feb 2022 20:54:12 -0500")
Message-ID: <874k5g4687.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Thu, Jan 27, 2022 at 9:03 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > Hiya, I was experimenting with $subject and ran into a few points of
>> > interest. This is basically an informal status report from me. I've
>> > CC'd some of the usual suspects for people who care about SDKs and API
>> > design and such.
>> >
>> > This is just a list of some observations I had, so not everything
>> > below is a question or an action item. Just sharing some notes.
>> >
>> > (0) This experiment concerned generating signatures based on
>> > introspection data, dynamically at runtime. In this environment type
>> > hints are not required, as they are not actually used at runtime.
>> > However, I added them anyway as an exercise for dynamic documentation
>> > purposes. (i.e. `help(auto_generated_function)` showing type hints can
>> > still be useful -- especially without access to QAPI doc blocks.)
>> > Determining type information is also necessary for generating the
>> > marshaling/unmarshaling functions to communicate with the server.
>> >
>> > (1) QAPI types the return of many commands as an empty object. That's
>> > literally indeed what happens on the wire, and it makes sense in that
>> > if these commands were ever to return anything, it is a "compatible
>> > evolution" to include new fields in such an object. In Python, this
>> > does not make much sense, though; as this is somewhat hard to
>> > annotate:
>> >
>> > async def stop() -> Literal[{}]: ...
>> >
>> > The more pythonic signature is:
>> >
>> > async def stop() -> None: ...
>> >
>> > I feel like it's spiritually equivalent, but I am aware it is a
>> > distinct choice that is being made. It could theoretically interfere
>> > with a choice made in QAPI later to explicitly return Null. I don't
>> > think we'd do that, but it's still a choice of abstraction that
>> > reduces the resolution of distinct return signatures.
>>
>> Having functions take any number of arguments and return one result is
>> traditional in programming, so we hardly notice how odd the asymmetry
>> actually is.
>>
>> QAPI commands are symmetric: they take any number of (named) arguments,
>> and return any number of (named) results.  Can also be viewed as taking
>> one exactly one argument (always an object) and returning exactly one
>> value (always an object).
>>
>> Except some QAPI commands actually return return a list of objects, and
>> some return a single, unnamed value.  The former are intentional, the
>> latter are screwups from the early days.
>>
>> > (1.5) Do we have a formal definition for what we consider to be a
>> > "compatible evolution" of the schema?
>>
>> Section "Compatibility considerations" in docs/devel/qapi-code-gen.rst
>> tries.  I wouldn't call it "a formal definition".
>>
>> >                                       I've got a fairly good idea, but
>> > I am not sure how it's enforced. Is it just Markus being very
>> > thorough?
>>
>> Yup, with help from other reviewers such as Eric Blake, and enabled by
>> the relative simplicity of the rules.
>>
>> >           If we add more languages to the generator, we probably can't
>> > burden Markus with knowing how to protect the compatibility of every
>> > generator.
>>
>> qapi-code-gen.rst applies the compatibility razor to the wire protocol
>> only.  It doesn't concern itself with language bindings at all.
>>
>
> The generator code certainly does, though.

Correct.  Since the generator generates C bindings, it must care about
language bindings (one).

What it doesn't concern itself so far with is *stability* of this
binding: it's just for use within QEMU.

>                                            For example, "C name"
> collisions are guarded against by the generator -- we do not let it
> get as far as blowing up clang.

"Guards against name collisions" feels like an overly charitable
description.  "Makes an effort" is closer to the truth.

>> We've only ever had C bindings.  Designed for internal use only, where
>> compatible evolution is pretty much irrelevant.
>>
>> We've talked about bindings for external use, both long ago (C), and
>> more recently (Rust, Python, ...).
>>
>> [*] Compatible evolution of language bindings for QAPI is a complex
>> topic.  Not today.
>>
>
> OK, agreed. It's a big topic. I think it's not fully possible to cover
> all cases in all places, but I do seem to recall Marc-Andre having
> some opinions about a few things we could do to staple it down just a
> little bit, and maybe that's enough. I'd like to talk about it
> eventually. Marc-Andre could cover rust, I could cover Python, and
> Victor/Andrea could help us cover golang.

Yes, it's something we should talk about at some point.

>> >            We might need more assertions for invariants in the
>> > generator itself ... but to protect "evolution", we need points of
>> > reference to test against. Do we have anything for this? Do we need
>> > one? Should I write a test?
>>
>> So far, we don't have software to reason about QAPI schema *changes*.
>> The generator checks the current QAPI schema, it doesn't consider the
>> change from the previous version.
>>
>> A program to analyze a schema change (the difference between two schema
>> versions) could be useful.  It could also be difficult to write.
>>
>
> Yeh. Something not worth doing until we chat about what compatible
> evolution looks like for other language bindings, because otherwise we
> don't know what we're designing for. Later.
>
>> > (2) There are five commands that are exempted from returning an
>> > object. qom-get is one.
>>
>> This is pragma 'command-returns-exceptions'.  Like its buddy pragmas, it
>> exists because we started enforcing the rules only after our rule
>> breaking had calcified in the external interface.
>>
>> >                         However, what I didn't really explicitly
>> > realize is that this doesn't mean that only five commands don't return
>> > an object -- we also actually allow for a list of objects, which
>> > *many* commands use. There's no technical issue here, just an
>> > observation. It is no problem at all to annotate Python commands as
>> > "-> SomeReturnType" or "-> List[SomeDifferentReturnType]" or even "->
>> > str:" as needed.
>> >
>> > (3) Over the wire, the order of arguments to QMP commands is not
>> > specified.
>>
>> Correct.
>>
>> >            In generating commands procedurally from introspection
>> > data, I am made aware that there are several commands in which
>> > "optional" arguments precede "required" arguments. This means that
>> > function generation in Python cannot match the stated order 1:1.
>> >
>> > That's not a crisis per se. For generating functions, we can use a
>> > stable sort to bubble-up the required arguments, leaving the optional
>> > ones trailing. However, it does mean that depending on how the QAPI
>> > schema is modified in the future, the argument order may change
>> > between versions of a generative SDK. I'd like to avoid that, if I
>> > can.
>> >
>> > One trick I have available to me in Python is the ability to stipulate
>> > that all (QAPI) "optional" arguments are keyword-only. This means that
>> > Optional parameters can be re-ordered arbitrarily without any breakage
>> > in the generative python API. The only remaining concern is if the
>> > *mandatory* arguments are re-ordered.
>> >
>> > (In fact, I could stipulate that ALL arguments in Python bindings are
>> > keyword-only, but I think that's going overboard and hurts usability
>> > and readability.)
>>
>> This would match the wire protocol, which only uses keyword, never
>> positional.  But your usability argument is valid.
>>
>> > Marc-Andre has mentioned this before, but it might be nice to actually
>> > specify a canonical ordering of arguments for languages that require
>> > such things, and to make sure that we do not break this ordering
>> > without good reason.
>> >
>> > (Of course, SDK stability is not fully possible, and if this
>> > functionality is desired, then it's time to use libvirt, hint hint
>> > hint! However, we can avoid pointless churn in generated code and make
>> > it easier to use and experiment with.)
>>
>> See [*] above.
>>
>> > (4) StrOrNull is a tricky design problem.
>> >
>> > In Python, generally, omitted arguments are typed like this:
>> > async def example_command(arg: Optional[int] = None) -> None: ...
>> >
>> > Most Python programmers would recognize that signature as meaning that
>> > they can omit 'arg' and some hopefully good default will be chosen.
>> > However, in QAPI we do have the case where "omitted" is distinct from
>> > "explicitly provided null". This is ... a bit challenging to convey
>> > semantically. Python does not offer the ability to tell "what kind of
>> > None" it received; i.e. unlike our generated QMP marshalling
>> > functions, we do not have a "has_arg" boolean we can inspect.
>>
>> Yes.
>>
>> The QAPI schema language's semantics of optional are at odds with
>> Python's.
>>
>> In Python, an absent argument defaults to some value, either one the
>> programmer provided, or None.  This makes semantics of "absent" obvious
>> from the signature.
>>
>
> "None" is never an assumed default in Python, it's always explicitly
> assigned as part of the signature. It is just by principle of least
> surprise that we all agree to use "None" as that default.

You're right.

>> In QAPI, an absent value is distinct from any present value.  Semantics
>> of "absent" depend the function's *code*, not just its signature.  I
>> consider this a design mistake.
>>
>
> Because of the above, Python and C are actually similar: the true
> default depends on code, not the signature.

Do you mean QAPI and C?

>> In many (most?) cases, code treats absent just like one specific present
>> value.  We could lift this from code to the schema: permit specifying a
>> default value in the schema, default absent to this value, don't
>> generate has_FOO.
>>
>
> The problem is when the default is something dynamically determined;
> we couldn't specify a static default. Maybe you regard that as a
> feature! but it's probably a lot of work to turn back the hands of
> time there now, so...

I suspect dynamic defaults are fairly rare.

Even when you "only" have Python's "absent defaults to a value, and you
can't distinguish absent from present with that value", you can still
code up dynamic defaults.  It takes a bit more effort than a static
default, but I *like* that.  When making things more complex takes more
effort, the chances of complex getting chosen only when it's genuinely
useful improve :)

>> The remainder could then be handled as the ugly wart it is: have both
>> has_FOO and FOO in Python, just like in C.  Or handle it using one of
>> the ideas you describe next.
>
> There's no way to do that automatically that I know of... without
> resorting to type signatures that utilize **kwargs, which are
> untypable and don't reveal their arguments upon introspection. I think
> it's just not possible.
>
>>
>> > So how do we write a function signature that conveys the difference
>> > between "omitted" and "explicitly nulled" ...?
>> >
>> > One common trick in Python is to create a new sentinel singleton, and
>> > name it something like "Default" or "Unspecified" or "Undefined". Many
>> > programmers use the ellipsis `...` value for this purpose. Then, we
>> > can check if a value was omitted (`...`) or explicitly provided
>> > (`None`). It is very unlikely that these sentinels would organically
>> > collide with user-provided values (Unless they were trying to
>> > explicitly invoke default behavior.)
>> >
>> > However, `...` isn't supported as a type and using it as the default
>> > value invalidates the typing of the field. As far as I can tell, it
>> > CANNOT be typed. We could create our own sentinel, but IMO, this
>> > creates a much less readable signature:
>> >
>> > async def example_command(arg: Union[int, qmp.Default] = qmp.Default)
>> > -> None: ...
>> >
>> > This probably doesn't communicate "This parameter is actually
>> > optional" to a casual Python programmer, so I think it's a dead end.
>> >
>> > The last thing I can think of here is to instead introduce a special
>> > sentinel that represents the explicit Null instead. We could use a
>> > special Null() type that means "Explicitly send a null over the wire."
>> >
>> > This value comes up fairly infrequently, so most signatures will
>> > appear "Pythonic" and the jankiness will be confined to the few
>> > commands that require it, e.g.
>> >
>> > async def example_command(arg: Optional[Union[int, Null]] = None) -> None: ...
>> >
>> > The above would imply an optional argument that can be omitted, can be
>> > provided with an int, or can be provided with an explicit Null. I
>> > think this is a good compromise.
>>
>> More so, I think, if we manage to substantially reduce "absent is
>> distinct from any present value".
>>
>
> It only seems to show up a handful of times so far, it's not very
> widespread as-is. Keeping it from spreading would be good, I assume.
> Sweeping the dust into this particular corner seems like the correct
> way to minimize API weirdness.
>
>> > (5) Generating functions from introspection data is difficult because
>> > all of the structures are anonymous.
>>
>> Introspection is about the wire format.  Type names are not part of it,
>> and that's why we hide them in introspection.
>>
>
> Yep. I'm not asking for that to change, necessarily. Just saying "Hey,
> I tried to autogenerate an SDK based on Introspection data and YOU
> WON'T BELIEVE WHAT HAPPENED NEXT".
>
> Except you'd believe it, because you designed it. For me, trying to do
> it and seeing the result was the fastest way to truly come to terms
> with how introspection data worked. Some of the lessons learned from
> this exercise also apply to the task of generating function signatures
> in general, too.
>
>> >                                      The base type for most objects
>> > becomes `Dict[str, Any]` but this isn't very descriptive. For Python
>> > 3.8+, we can do a little better and use `Dict[Literal["name", "node"],
>> > Any]` to help suggest what keys are valid, but we don't have access to
>> > an in-line definition that pairs key names with values.
>> >
>> > Python 3.8+ would allow us the use of TypedDict, but those have to be
>> > generated separately ... AND we still don't have a name for them, so
>> > it'd be a little hogwash to have a function like:
>> >
>> > async def some_command(arg: Anon321) -> None: ...
>> >
>> > That doesn't really tell me, the human, much of anything. The best
>> > that could perhaps be done is to create type aliases based on the name
>> > of the argument it is the data type for, like "ArgObject". It's a bit
>> > messy. For now, I've just stuck with the boring `Dict[Literal[...],
>> > Any]` definition.
>>
>> I'm afraid you're trying to press introspection into a role it's not
>> designed for.
>
> Yes.
>
>>
>> Why not generate from the QAPI schema?
>
> I was hoping you'd say that! =)
> GOOD NEWS: I have also done that!

Well played, sir!

> I tried it both ways to find the strengths and weaknesses of each
> approach so I would have an informed basis for upstreaming the code
> for either. The dynamic runtime method has its uses in that it will
> always match the host API exactly. It cannot be used for static type
> analysis of a script, though (The code doesn't exist until you connect
> to the server!). The statically generated version has a lot more
> information to work with and can be used for static type analysis, but
> includes some parameters and functions that may not exist on your
> server's instance.
>
> The two approaches aren't even necessarily mutually exclusive.
>
>>
>> > (6) Dealing with variants is hard. I didn't get a working
>>
>> Do you mean alternates?
>>
>
> No, alternates at the python signature level are easy: Union[BranchA, BranchB].
>
> In my code, I stubbed out the case where 'meta-type': 'object' has a
> 'variants' key. There's no blocker here, I just didn't get around to
> un-stubbing it. I need to refactor a bit to make this work -- this
> requires some flattening in the client code, unlike "normal" objects
> which come pre-flattened over the wire. Just remarking that it appears
> to be the most complex case for digesting introspection information.
>
>> > implementation for them within one day of hacking, so I stubbed them
>> > out. There's no major blocker here, just reporting that I still have
>> > to finish this part of the experiment. I'm pretty happy that Markus
>> > simplified the union types we have, though. To my knowledge, I got
>> > everything else working perfectly.
>> >
>> > (7) I have no idea what to do about functions that "may not return".
>> > The QGA stuff in particular, I believe, is prone to some weirdness
>> > that violates the core principles of the QMP spec.
>>
>> Yes.
>>
>> docs/interop/qmp-spec.txt dictates a command sends either a success or
>> an error response.  Makes sense.
>>
>> QGA has a few commands that shut down the guest.  How could such a
>> command send a success response?  If it sends it before it initiates
>> shutdown, response transmission races with shutdown.  The easy way out
>> is violating qmp-spec.txt.  Thus, 'success-response': false.  Just for
>> QGA.
>>
>
> Oh, whoops, I already have the information we need. O:-)
> (Assuming that 'success-response' is visible in the introspection data, anyway.

qapi/introspect.json:

    ##
    # @SchemaInfoCommand:
    [...]
    # TODO: @success-response (currently irrelevant, because it's QGA, not QMP)
    #
    # Since: 2.5
    ##
    { 'struct': 'SchemaInfoCommand',
      'data': { 'arg-type': 'str', 'ret-type': 'str',
                '*allow-oob': 'bool' } }

The TODO neglects to spell out "and QGA doesn't support introspection so
far".

>> >                                                    Maybe we can add a
>> > "NORETURN" feature flag to those commands in the schema so that
>> > clients can be aware of which commands may break the expectation of
>> > always getting an RPC reply?
>>
>> For a normal command, bindings marshal, send the command, receive the
>> response, unmarshal.
>>
>> For a 'success-response': false command, they only marshal and send.
>>
>> > (8) Thanks for reading. I'm still buried under my holiday inbox, but I
>> > am trying like hell to catch up on everything. I know I missed a few
>> > calls in which API design was discussed, and I apologize for that.
>> > Please send me invitations using "to: jsnow@redhat.com" to ensure I do
>> > not miss them. I am also frantically trying to clean up the Async QMP
>> > project I was working on to have more mental bandwidth for other
>> > tasks, but it's dragging on a bit longer than I had anticipated.
>> > Please accept my apologies for being somewhat reclusive lately.
>> >
>> > I'll (try to) send a status overview of the various projects I'm
>> > working on later to help set priority and discuss with the community
>> > what my goals are and what I'd like to do. I have an awful lot of code
>> > I've built up in local branches that I would like to share, but I'm
>> > already sending code upstream as fast as I can, so maybe I'll just do
>> > an overview at some point and point to unfinished code/experiments so
>> > it's at least not completely unwitnessed work.
>> >
>> > I hope 2022 is treating you all well,
>>
>> Happy new year to you, too!
>>
>
> How is it already February?

Crazy, isn't it?

> Thanks for taking a look at my notes!

You're welcome!


