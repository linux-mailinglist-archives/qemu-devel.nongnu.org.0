Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5946C809D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:02:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfgI3-00020f-1H; Fri, 24 Mar 2023 08:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfgHy-00020T-Dd
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 08:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pfgHH-0001hu-0G
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 08:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679659929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pb+FXs+tKIQcVrakS5DaSoSon7sbFbYnmX99CEqA9Xo=;
 b=T43WYp7KFrDXvi7OBkwfmQecHy8EOPJWtC72G8Y3GAc5dYr4kG8nAIc+d405eCDpXXsbdA
 PWZ4D5FtdanMGv51wsGxPqNo16JgDwG6ACQar1nZAS9gX9hlOjVjkARcsgXHhbrq/wScRL
 rLz2asD+s5xGHSwZ+pNzoyy3w+Ndou8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-vlN_MhYsMtqk0kZBaYCa5g-1; Fri, 24 Mar 2023 08:05:05 -0400
X-MC-Unique: vlN_MhYsMtqk0kZBaYCa5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D7EE1C16413;
 Fri, 24 Mar 2023 12:05:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C4F40BC797;
 Fri, 24 Mar 2023 12:05:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5BC1321E6926; Fri, 24 Mar 2023 13:05:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,  Victor Toso
 <victortoso@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: qapi: [RFC] Doc comment convention for @arg: sections
References: <87v8irv7zq.fsf@pond.sub.org>
 <CAFEAcA88B70uwK=6SZ4TCujiUik0oOakBPG=USNRLYtzB=kiDg@mail.gmail.com>
Date: Fri, 24 Mar 2023 13:05:01 +0100
In-Reply-To: <CAFEAcA88B70uwK=6SZ4TCujiUik0oOakBPG=USNRLYtzB=kiDg@mail.gmail.com>
 (Peter Maydell's message of "Thu, 23 Mar 2023 16:20:43 +0000")
Message-ID: <877cv6pd76.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 23 Mar 2023 at 14:48, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The QAPI schema doc comment language provides special syntax for command
>> and event arguments, struct and union members, alternate branches,
>> enumeration values, and features: "sections" starting with @arg:.
>>
>> By convention, we format them like this:
>>
>>     # @arg: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
>>     #       do eiusmod tempor incididunt ut labore et dolore magna
>>     #       aliqua.
>>
>> Okay for names as short as "name", but we have much longer ones.  Their
>> description gets squeezed against the right margin, like this:
>>
>>     # @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
>>     #                               not avoid copying dirty pages. This is between
>>     #                               0 and @dirty-sync-count * @multifd-channels.
>>     #                               (since 7.1)
>>
>> The description is effectively 50 characters wide.  Easy enough to read,
>> but awkward to write.
>
> The documentation also permits a second form:
>
>  # @argone:
>  # This is a two line description
>  # in the first style.

Yes.  We use this in exactly one place: the guest agent's GuestOSInfo.

> We tend to use that for type names, not field names, but IIRC
> it's the same handling for both.

Kind of.

Definition documentation consist of "sections".

The first section (called "body" in the code) starts with a line of the
from

    # @NAME:

Nothing may follow the colon.

Ordinary text may follow.  Indentation is not stripped.

Next are "argument sections".  These start with another "# @NAME:" line,
but here text may follow the colon.  If it does, additional text needs
to be indented to the start of the text following the colon.  Required
indentation is stripped.

If text doesn't follow the colon, required indentation is zero, so
nothing is stripped.  So yes, it's the same handling as for the body
section, but it's different code that happens to behave the same in a
special case.

> I'll re-mention here something I said back in 2020 when we were
> landing the rST-conversion of the qapi docs:
>
> There is rST syntax for field lists and option lists:
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#field-lists
> which are kind of similar to what we're doing with @foo: stuff
> markup, and which handle indentation like this:
>
> :Hello: This field has a short field name, so aligning the field
>         body with the first line is feasible.
>
> :Number-of-African-swallows-required-to-carry-a-coconut: It would
>     be very difficult to align the field body with the left edge
>     of the first line. It may even be preferable not to begin the
>     body on the same line as the marker.
>
> The differences to what we have today are:
>  * indent of lines 2+ is determined by the indent of line 2, not 1

I consider that an improvement.

>  * lines 2+ must be indented, so anything that currently uses
>    "no indent, start in column 0" would need indenting. (This would
>    be a lot of change to our current docs text.)

Actually, it's just GuestOSInfo's doc comment.

> At the time I think I basically went with "whatever requires the
> minimum amount of change to the existing doc comments and parser
> to get them into a shape that Sphinx is happy with". But if we're
> up for a wide reformatting then maybe it would be worth following
> the rST syntax?

Valid question!

Our current doc comment syntax has two layers:

1. The upper layer uses home-grown markup (= heading, @def: for special
   definition lists, @ref to reference QAPI names, tag: special
   sections).

2. The lower layer is reStructuredText.

Parsing mirrors this:

1. parser.py parses the upper layer into an internal representation.

2. Sphinx extension qapidoc.py maps this internal representation to
   Sphinx's.  It feeds its text parts to the rST parser, and splices its
   output into the Sphinx IR.

I'm wary of blurring the boundary between the two.  If we use rST syntax
for argument sections, parser.py effectively parses a limited subset of
rST.  Second-guessing the real rST parser doesn't feel wise to me.

A more radical approach would be to ditch the upper layer completely.
What would we lose?

parser.py ensures definition documentation

* adheres to a common structure,

* the things it documents exist, and

* documentation is complete[*].

Losing this feels bad to me.

Could we do it in qapidoc.py instead?

> PS: I see with a quick grep we also have misformatted field docs;
> check out for instance the HTML rendering of the bps_max etc
> fields of BlockDeviceInfo, which is weird because the second
> line of the field docs in the sources is wrongly indented.

Yes, that needs fixing.


[*] There is hole marked TODO in the code.  Resolving it is trivial in
    the generator code.  The problem is fixing up the schema.


