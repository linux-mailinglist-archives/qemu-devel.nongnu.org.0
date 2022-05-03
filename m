Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786F517F88
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:13:31 +0200 (CEST)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlnev-0002Xm-TI
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlnPZ-0004O0-Dr
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlnPX-0006a2-AQ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651564650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i3cALqjYmkdjfWoyV1Smxk1N6O5R/Fsx0N8EofuaIa4=;
 b=fOOCpdDLTUlvHUmgtL2AS86Sp9qqixwEPYAL4GAxkv4K4NOaDiXLi/jf6DuNU3DncOliui
 GHVjOrFjzSQM8cqPwaJ4Kjyew5NmBOvBWqxOLnzr2gv/YxvrGddLLlie2LLrjn+ekv3Vsa
 hS+jIrUHhM+vcUN8HaXbT2n9usWqW8Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-5utZ1gVnMRC3VngtVPJtTQ-1; Tue, 03 May 2022 03:57:29 -0400
X-MC-Unique: 5utZ1gVnMRC3VngtVPJtTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CACFA800882
 for <qemu-devel@nongnu.org>; Tue,  3 May 2022 07:57:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DB0D400E115;
 Tue,  3 May 2022 07:57:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46CBA21E68BC; Tue,  3 May 2022 09:57:27 +0200 (CEST)
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
Date: Tue, 03 May 2022 09:57:27 +0200
In-Reply-To: <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
 (Andrea Bolognani's message of "Mon, 2 May 2022 10:01:41 -0400")
Message-ID: <87bkwff3q0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> On Mon, May 02, 2022 at 01:46:23PM +0200, Markus Armbruster wrote:
>> Andrea Bolognani <abologna@redhat.com> writes:
>> >> > The wire protocol would still retain the unappealing name, but at
>> >> > least client libraries could hide the uglyness from users.
>> >>
>> >> At the price of mild inconsistency between the library interface and
>> >> QMP.
>> >
>> > That's fine, and in fact it already happens all the time when QAPI
>> > names (log-append) are translated to C identifiers (log_append).
>>
>> There's a difference between trivial translations like "replace '-' by
>> '_'" and arbitrary replacement like the one for enumeration constants
>> involving 'prefix'.
>
> Fair enough.
>
> I still feel that 1) users of a language SDK will ideally not need to
> look at the QAPI schema or wire chatter too often

I think the most likely point of contact is the QEMU QMP Reference
Manual.

>                                                          even when
> that ends up being necessary, figuring out that LogAppend and
> logappend are the same thing is not going to be an unreasonable
> hurdle, especially when the status quo would be to work with
> Logappend instead.

Yes, it's "mild inconsistency", hardly an unreasonable hurdle.  I think
it gets in the way mostly when searching documentation.  Differences in
case are mostly harmless, just use case-insensitive search.  Use of '_'
vs '-' would also be harmless (just do the replacement), if the use of
'-' in the schema was consistent.  Sadly, it's not, and that's already a
perennial low-level annoyance.

My point is: a name override feature like the one you propose needs to
be used with discipline and restraint.  Adds to reviewers' mental load.
Needs to be worth it.  I'm not saying it isn't, I'm just pointing out a
cost.

>> > The point is that, if we want to provide a language interface that
>> > feels natural, we need a way to mark parts of a QAPI symbol's name in
>> > a way that makes it possible for the generator to know they're
>> > acronyms and treat them in an appropriate, language-specific manner.
>>
>> It's not just acronyms.  Consider IAmALittleTeapot.  If you can assume
>> that only beginning of words are capitalized, even for acronyms, you can
>> split this into words without trouble.  You can't recover correct case,
>> though: "i am a little teapot" is wrong.
>
> Is there any scenario in which we would care though? We're in the
> business of translating identifiers from one machine representation
> to another, so once it has been split up correctly into the words
> that compose it (which in your example above it has) then we don't
> really care about anything else unless acronyms are involved.
>
> In other words, we can obtain the list of words "i am a little
> teapot" programmatically both from IAmALittleTeapot and
> i-am-a-little-teapot, and in both cases we can then generate
> IAmALittleTeapot or I_AM_A_LITTLE_TEAPOT or i_am_a_little_teapot or
> whatever is appropriate for the context and target language, but the
> fact that in a proper English sentence "I" would have to be
> capitalized doesn't really enter the picture.

My point is that conversion from CamelCase has two sub-problems:
splitting words and recovering case.  Splitting words is easy when
exactly the beginning of words is capitalized.  Recovering case is
guesswork.  Most English words are all lower case, but some start with a
capital letter, and acronyms are all caps.

Wild idea: assume all lower case, but keep a list of exceptions.

>> "Split before capital letter" falls apart when you have characters that
>> cannot be capitalized: Point3d.
>>
>> Camel case is hopeless.
>
> I would argue that it works quite well for most scenarios, but there
> are some corner cases where it's clearly not good enough. If we can
> define a way to clue in the generator about "Point3d" having to be
> interpreted as "point 3d" and "VNCProps" as "vnc props", then we are
> golden. That wouldn't be necessary for simple cases that are already
> handled correctly.

Hyphenization rules?  *Cough* *cough*

> A more radical idea would be to start using dash-notation for types
> too. That'd remove the word splitting issue altogether, at the cost
> of the schema being (possibly) harder to read and more distanced from
> the generated code.

Yes.

> You'd still only be able to generate VncProps from vnc-props though.
>
>> > The obvious way to implement this would be with an annotation along
>> > the lines of the one I proposed. Other ideas?
>>
>> I'm afraid having the schema spell out names in multiple naming
>> conventions could be onerous.  How many names will need it?
>
> I don't have hard data on this. I could try extracting it, but that
> might end up being a bigger job than I had anticipated.

I figure extracting is easier for me than for you.  But let's have a
closer look at the job at hand first.

The QAPI schema language uses three naming styles:

* lower-case-with-hyphens for command and member names

  Many names use upper case and '_'.  See pragma command-name-exceptions
  and member-name-exceptions.

  Some (many?) names lack separators between words (example: logappend).

* UPPER_CASE_WITH_UNDERSCORE for event names

* CamelCase for type names

  Capitalization of words is inconsistent in places (example: VncInfo
  vs. DisplayReloadOptionsVNC).

What style conversions will we need for Go?  Any other conversions come
to mind?

What problems do these conversions have?

> My guess is that the number of cases where the naive algorithm can't
> split words correctly is relatively small compared to the size of the
> entire QAPI schema. Fair warning: I have made incorrect guesses in
> the past ;)
>
>> Times how many naming conventions?
>
> Yeah, I don't think requiring all possible permutations to be spelled
> out in the schema is the way to go. That's exactly why my proposal
> was to offer a way to inject the semantic information that the parser
> can't figure out itself.
>
> Once you have a way to inform the generator that "VNCProps" is made
> of the two words "vnc" and "props", and that "vnc" is an acronym,
> then it can generate an identifier appropriate for the target
> language without having to spell out anywhere that such an identifier
> would be VNCProps for Go and VncProps for Rust.
>
> By the way, while looking around I realized that we also have to take
> into account things like D-Bus: the QAPI type ChardevDBus, for
> example, would probably translate verbatim to Go but have to be
> changed to ChardevDbus for Rust. Fun :)
>
> Revised proposal for the annotation:
>
>   ns:word-WORD-WoRD-123Word
>
> Words are always separated by dashes; "regular" words are entirely
> lowercase, while the presence of even a single uppercase letter in a
> word denotes the fact that its case should be preserved when the
> naming conventions of the target language allow that.

Is a word always capitalized the same for a single target language?  Or
could capitalization depend on context?

>> Another issue: the fancier the translation from schema name to
>> language-specific name gets, the harder it becomes to find one from the
>> other.
>
> That's true, but at least to me the trade-off feels reasonable.


