Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F287522C3F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 08:24:53 +0200 (CEST)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nofmF-0006Vt-HM
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 02:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nofdV-0003tu-74
 for qemu-devel@nongnu.org; Wed, 11 May 2022 02:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nofdR-0001nE-4H
 for qemu-devel@nongnu.org; Wed, 11 May 2022 02:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652249743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mj8WDpuuSOdifqFgUDuBzL4i4171LeOSdKqcwdADJqQ=;
 b=IymCiP3xOdQxnrTjExz1DRu92omgE5WAVR0cLY15CFtmR3p9Ek4vKimdw2eqikWAIptIvy
 6vekwp6gAetfY2x//U07AAShJKaqJIpZR8+bKL1s+B+4vuKhxpWYjb3Nu+IXR4d3ViJm42
 XkOezf7jc2crKRZzr3SxZQMyt/xQ37g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-yziFON97MS2Pgpui7lfP5g-1; Wed, 11 May 2022 02:15:42 -0400
X-MC-Unique: yziFON97MS2Pgpui7lfP5g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5CE6185A7BA
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 06:15:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70B77401E9D;
 Wed, 11 May 2022 06:15:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 37B3A21E6880; Wed, 11 May 2022 08:15:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>,  qemu-devel@nongnu.org,  John Snow
 <jsnow@redhat.com>,  Eric Blake <eblake@redhat.com>,  Kevin Wolf
 <kwolf@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
 <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
 <875ymop374.fsf@pond.sub.org>
 <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
 <87bkwff3q0.fsf@pond.sub.org>
 <CABJz62PcEPwiZfV9dBQooELvDnrqPTc_iKWYph8CR6_cGUzmWA@mail.gmail.com>
Date: Wed, 11 May 2022 08:15:40 +0200
In-Reply-To: <CABJz62PcEPwiZfV9dBQooELvDnrqPTc_iKWYph8CR6_cGUzmWA@mail.gmail.com>
 (Andrea Bolognani's message of "Tue, 3 May 2022 02:40:14 -0700")
Message-ID: <87czgkiohf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrea Bolognani <abologna@redhat.com> writes:

> On Tue, May 03, 2022 at 09:57:27AM +0200, Markus Armbruster wrote:
>> Andrea Bolognani <abologna@redhat.com> writes:
>> > I still feel that 1) users of a language SDK will ideally not need to
>> > look at the QAPI schema or wire chatter too often
>>
>> I think the most likely point of contact is the QEMU QMP Reference
>> Manual.
>
> Note that there isn't anything preventing us from including the
> original QAPI name in the documentation for the corresponding Go
> symbol, or even a link to the reference manual.
>
> So we could make jumping from the Go API documentation, which is what
> a Go programmer will be looking at most of the time, to the QMP
> documentation pretty much effortless.
>
>> My point is: a name override feature like the one you propose needs to
>> be used with discipline and restraint.  Adds to reviewers' mental load.
>> Needs to be worth it.  I'm not saying it isn't, I'm just pointing out a
>> cost.
>
> Yeah, I get that.
>
> Note that I'm not suggesting it should be possible for a name to be
> completely overridden - I just want to make it possible for a human
> to provide the name parsing algorithm solutions to those problems it
> can't figure out on its own.
>
> We could prevent that feature from being misused by verifying that
> the symbol the annotation is attached to can be derived from the list
> of words provided. That way, something like
>
>   # SOMEName (completely-DIFFERENT-name)
>
> would be rejected and we would avoid misuse.

Possibly as simple as "down-case both names and drop the funny
characters, result must be the same".

>> Wild idea: assume all lower case, but keep a list of exceptions.
>
> That could actually work reasonably well for QEMU because we only
> need to handle correctly what's in the schema, not arbitrary input.
>
> There's always the risk of the list of exceptions getting out of sync
> with the needs of the schema, but there's similarly no guarantee that
> annotations are going to be introduced when they are necessary, so
> it's mostly a wash.
>
> The only slight advantage of the annotation approach would be that it
> might be easier to notice it being missing because it's close to the
> name it refers to, while the list of exceptions is tucked away in a
> script far away from it.

We'd put it in qapi/pragma.json, I guess.

>> The QAPI schema language uses three naming styles:
>>
>> * lower-case-with-hyphens for command and member names
>>
>>   Many names use upper case and '_'.  See pragma command-name-exceptions
>>   and member-name-exceptions.
>
> Looking at the output generated by Victor's WIP script, it looks like
> these are already handled as nicely as those that don't fall under
> any exception.
>
>>   Some (many?) names lack separators between words (example: logappend).

How many would be good to know.

Ad hoc hackery to find names, filter out camels (because word splitting
is too hard there), split into words, look up words in a word list:

    $ for i in `/usr/bin/python3 /work/armbru/qemu/scripts/qapi-gen.py -o qapi -b ../qapi/qapi-schema.json | sort -u | awk '/^### [a-z0-9-]+$/ { print "lc", $2; next } /^### [a-z0-9_-]+$/ { print lu; next } /^### [A-Z0-9_]+$/ { print "uc", $2; next } /^### ([A-Z][a-z]+)+/ { print "cc", $2; next } { print "mc", $2 }' | sed '/^mc\|^cc/d;s/^.. //;s/[^A-Za-z0-9]/\n/g' | tr A-Z a-z | sort -u`; do grep -q "^$i$" /usr/share/dict/words || echo $i; done

420 lines.  How many arguably lack separators between words?  Wild guess
based on glancing at the output sideways: some 50.

>> * UPPER_CASE_WITH_UNDERSCORE for event names
>>
>> * CamelCase for type names
>>
>>   Capitalization of words is inconsistent in places (example: VncInfo
>>   vs. DisplayReloadOptionsVNC).
>>
>> What style conversions will we need for Go?  Any other conversions come
>> to mind?
>>
>> What problems do these conversions have?
>
> Go uses CamelCase for pretty much everything: types, methods,
> constants...
>
>   There's one slight wrinkle, in that the case of the first letter
>   decides whether it's going to be a PublicName or a privateName. We
>   can't do anything about that, but it shouldn't really affect us
>   that much because we'll want all QAPI names to be public.
>
> So the issues preventing us from producing a "perfect" Go API are
>
>   1. inconsistent capitalization in type names
>
>    -> could be addressed by simply changing the schema, as type
>       names do not travel on the wire

At the price of some churn in C code.

Perhaps more consistent capitalization could be regarded as a slight
improvement on its own.  We need to see (a good sample of) the changes
to judge.

>   2. missing dashes in certain command/member names
>
>    -> leads to Incorrectcamelcase.

Names with words run together are arguably no uglier in CamelCase (Go)
than in lower_case_with_underscores (C).

>                                    Kevin's work is supposed to
>       address this

Except it's stuck.

Perhaps Kevin and I can get it moving again.

Perhaps we can try to extract a local alias feature that can be grown
into the more ambitious aliases Kevin wants (if we can solve the
issues).

>   3. inability to know which parts of a lower-case-name or
>      UPPER_CASE_NAME are acronyms or are otherwise supposed to be
>      capitalized in a specific way
>
>    -> leads to WeirdVncAndDbusCapitalization. There's currently no
>       way, either implemented or planned, to avoid this

A list of words with special capitalization needs[*]?

VNC is an acronym, some languagues want VNC in camels, some Vnc.

DBus is an abbreviation, some languages want DBus in camels, some Dbus.

> In addition to these I'm also thinking that QKeyCode and all the
> QCrypto stuff should probably lose their prefixes.

As Daniel pointed out, schema names sometimes have prefixes because we
need the generated C identifiers to have prefixes.

If we hate these prefixes enough, we can try to limit them to C
identifiers.

> Note that 3 shouldn't be an issue for Rust and addressing 1 would
> actually make things worse for that language, because at the moment
> at least *some* of the types follow its expected naming rules :)

Solving Go problems by creating Rust problems doesn't feel like a good
move to me.

>> > Revised proposal for the annotation:
>> >
>> >   ns:word-WORD-WoRD-123Word
>> >
>> > Words are always separated by dashes; "regular" words are entirely
>> > lowercase, while the presence of even a single uppercase letter in a
>> > word denotes the fact that its case should be preserved when the
>> > naming conventions of the target language allow that.
>>
>> Is a word always capitalized the same for a single target language?  Or
>> could capitalization depend on context?
>
> I'm not aware of any language that would adopt more than a single
> style of capitalization, outside of course the obvious
> lower_case_name or UPPER_CASE_NAME scenarios where the original
> capitalization stops being relevant.

Makes sense.


[*] Sounds like crony capitalism, doesn't it :)


