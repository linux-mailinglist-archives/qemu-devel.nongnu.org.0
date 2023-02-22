Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A669F121
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:17:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUlFC-0000Qn-RD; Wed, 22 Feb 2023 04:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUlF8-0000QC-6f
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:16:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUlF6-00055q-B7
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677057411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kyg+Hz2WDq2WPEfi4NPKyFoQ3TNfP0zuRzJ2IHrIX9I=;
 b=O5sb+WNKTqxawdFSBdulhvarpEiGbm9F9lvzvV3/jB7vifAx1ppulmqJVPPWQv96blejDW
 F3WfCBF3h7AknHvr22iSmkkIbDyRTvLNxAZNVjdXak6DwBjYcGiqGuat1XPSxeKSHTVNr3
 fc2Dgf3g7h64OUuQslmhoTb+dW0J4+k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-TGaMx7k9PD2thh9udc7hVw-1; Wed, 22 Feb 2023 04:16:49 -0500
X-MC-Unique: TGaMx7k9PD2thh9udc7hVw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 107403C0F18A;
 Wed, 22 Feb 2023 09:16:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9956492B04;
 Wed, 22 Feb 2023 09:16:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C25E021E6A1F; Wed, 22 Feb 2023 10:16:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v4 0/6] qapi: static typing conversion, pt5c
References: <20230215000011.1725012-1-jsnow@redhat.com>
 <878rgz82v9.fsf@pond.sub.org>
 <CAFn=p-ZAnqRr7SYVO8n_DaFDUavFykNYwaQy4fCWubTx686kJg@mail.gmail.com>
 <87sfezzfh4.fsf@pond.sub.org>
 <CAFn=p-ac9ufp8-cohrSfHc4A2OTQLbbGP6dAJ5Wy1X0Ua3Y5_Q@mail.gmail.com>
Date: Wed, 22 Feb 2023 10:16:47 +0100
In-Reply-To: <CAFn=p-ac9ufp8-cohrSfHc4A2OTQLbbGP6dAJ5Wy1X0Ua3Y5_Q@mail.gmail.com>
 (John Snow's message of "Tue, 21 Feb 2023 12:32:23 -0500")
Message-ID: <87pma2qcu8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

John Snow <jsnow@redhat.com> writes:

> On Tue, Feb 21, 2023, 1:42 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > On Wed, Feb 15, 2023 at 8:39 AM Markus Armbruster <armbru@redhat.com>
>> wrote:
>> >>
>> >> I had a few suggestions, but none of them requires a respin.  Let's
>> >> discuss them, and then I merge.
>> >
>> > Hiya, I lost track of things a little due to the other Python
>> > discussion. Who is waiting for whom?
>>
>> Just two questions remain:
>>
>> * PATCH 3: Dumb down check_keys() argument all the way to List[str]?
>>
>
> Kinda prefer not to, but maybe I'm being too precious. (I have some more
> exploratory patches that do use tuples here instead, but admit it's not
> crucial.)
>
> From a pure typing perspective, I wish I could leave it as it is now,
> because I prefer to type input types as loosely as possible: claim only the
> minimum power we need, instead of enforcing the specificity we happen to
> have.
>
> With the bug for 3.6 that is forcing me to use a more specific type anyway,
> maybe you're right and I should just use List[] until I'm allowed to have
> my proper abstraction.
>
> OK, before I go further, lemme say that you can change it to List[] if you
> want. I won't be too precious about it. (You can rewrite the patch in
> question if you don't want to wait 24h.)
>
> But, a question about typing strategy:

A good one!

> As a python tooling maintainer, should I push people to type as flexible as
> possible or as *specific* as possible in general?
>
> Flexible: (e.g. Sequence or Iterable)
> - More likely to get along with other code
> - More "pythonic", abstractly
> - Less useful as documentation; if a function always happens to get a list,
> is it annoying to pretend it's merely a sequence?
>
> Specific: (e.g. List)
> - Most useful as documentation
> - Can assert greater knowledge of all callers
> - More power afforded to function ("room to grow"?)
> - More likely to require non-local edits when changing functionality or
> refactoring
> - More likely to require "casts" at callsites to convert data types
>
> I think I lean towards the flexible/broad typing strategy in general, but
> lament it cannot be applied appropriately here today.

Adjusting strategy to context can make some sense, I think.

When we're exposing a library to unknown users, we want to ask for the
weakest possible preconditions, i.e. use maximally abstract types for
input.

That's one end of a spectrum, I think.  Here's an example for the other
end: say I write a helper function for just one caller, which passes
arguments of just one type.  I'd use exactly that type.  KISS.

Much of the time, we're somewhere in between, i.e. in the realm of
judgement calls and taste.

Sticking to weakest possible preconditions ("flexible") everywhere saves
you the trouble of making the judgement calls.  Defensible point of
view.  Not mine, though.

The more abstract the type is, the more flexibility we shift from callee
to callers.  I want to be able to put the flexibility where I expect it
to be needed more.

Moreover, I really, really like types as documentation.  When I see a
fully concrete type List[str], I know all there is to know about the
argument's type.  When I see Collection[str], I know less.  When I need
to know more, I get to chase callers, just as if there was no type at
all.

And most of all, I habitually eschew abstraction unless I see concrete
benefits.  Don't get me wrong, abstraction is awesome!  Probably the
most essential tool in the toolbox.  But like any powerful tool, it
should be used with care.

Back to the QAPI code generator.  So far, there are no unknown users,
simply because all users are right in the tree.  However, the thing has
become large enough to be difficult to keep in your brain all at once.
We don't *want* to know all users anymore.  We want some abstraction.

But where do we want it, and how much?  Where to put abstract
interfaces?

Not within .py files, I'd say.  Between them.  Or maybe just some of
them.  Ah, those pesky judgement calls!

Do I make sense?  Comments?  Objections?

>> * PATCH 4: Suggested commit message addition okay?
>>
>
> Yes, ACK.
>
>
>> We settle them, and then I'll take it from there.

No need for a respin.


