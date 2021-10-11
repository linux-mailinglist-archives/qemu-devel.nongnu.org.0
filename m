Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984C242880F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 09:48:34 +0200 (CEST)
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZq2z-0006la-CL
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 03:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZpzX-0001oU-7N
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:44:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mZpzV-0002fw-Bb
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633938296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0v1TGNcBnftOryQ78Hd1DOsHSwuzdpPnxaaLv43F/fw=;
 b=MejC5xmQyAYud/HQYVWr8/7YBAHn0EHHNzqc0/RrWxdcvfJxQNnqfPBrV00r9qQFuP7m5E
 keF8K/ZWIuzytEgBNCP1gJpm3ccUimFZqOQATDnZzOtYEIHTSP5CBpdyYfFodubV0StBl/
 /nkjsAC6P+/jk0fmgcKqAm7gj6WCm3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-sJU2QVFfNGSjfcLfLjOQag-1; Mon, 11 Oct 2021 03:44:46 -0400
X-MC-Unique: sJU2QVFfNGSjfcLfLjOQag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 578D910A8E01
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 07:44:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD5360862;
 Mon, 11 Oct 2021 07:44:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 66FF0113865F; Mon, 11 Oct 2021 09:44:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
References: <20210812161131.92017-7-kwolf@redhat.com>
 <878s09d8pe.fsf@dusky.pond.sub.org> <YTt0G1cs+BweXOMD@redhat.com>
 <87bl4vedma.fsf@dusky.pond.sub.org> <YUB0BcZUwwwecrFl@redhat.com>
 <87k0jj8evk.fsf@dusky.pond.sub.org> <YUG71uATYCwpRyQH@redhat.com>
 <8735q3y5db.fsf@dusky.pond.sub.org> <YUSuThJtW9ar2wCY@redhat.com>
 <87a6jrimaf.fsf@dusky.pond.sub.org> <YVsKpClmGgq5ki7r@redhat.com>
Date: Mon, 11 Oct 2021 09:44:42 +0200
In-Reply-To: <YVsKpClmGgq5ki7r@redhat.com> (Kevin Wolf's message of "Mon, 4
 Oct 2021 16:07:32 +0200")
Message-ID: <87y270uhsl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

[...]

> What I had in mind was using the schema to generate the necessary code,
> using the generic keyval parser everywhere, and just providing a hook
> where the QDict could be modified after the keyval parser and before the
> visitor. Most command line options would not have any explicit code for
> parsing input, only the declarative schema and the final option handler
> getting a QAPI type (which could actually be the corresponding QMP
> command handler in the common case).

A walk to the bakery made me see a problem with transforming the qdict
between keyval parsing and the visitor: error reporting.  On closer
investigation, the problem exists even with just aliases.

All experiments performed with your complete QAPIfication at
https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v4.


Example: flattening leads to suboptimal error

    $ qemu-system-x86_64 -chardev udp,id=chr0,port=12345,ipv4=om
    qemu-system-x86_64: -chardev udp,id=chr0,port=12345,ipv4=om: Parameter 'backend.data.remote.data.ipv4' expects 'on' or 'off'

We're using "alternate" notation, but the error message barks back in
"standard" notation.  It comes from the visitor.  While less than
pleasant, it's still understandable, because the "standard" key ends
with the "alternate" key.


Example: renaming leads to confusing error

So far, we rename only members of type 'str', where the visitor can't
fail.  Just for illustrating the problem, I'm adding one where it can:

    diff --git a/qapi/char.json b/qapi/char.json
    index 0e39840d4f..b436d83cbe 100644
    --- a/qapi/char.json
    +++ b/qapi/char.json
    @@ -398,7 +398,8 @@
     ##
     { 'struct': 'ChardevRingbuf',
       'data': { '*size': 'int' },
    -  'base': 'ChardevCommon' }
    +  'base': 'ChardevCommon',
    +  'aliases': [ { 'name': 'capacity', 'source': [ 'size' ] } ] }

     ##
     # @ChardevQemuVDAgent:

With this patch:

    $ qemu-system-x86_64 -chardev ringbuf,id=chr0,capacity=lots
    qemu-system-x86_64: -chardev ringbuf,id=chr0,capacity=lots: Parameter 'backend.data.size' expects integer

The error message fails to connect to the offending key=value.


Example: manual transformation leads to confusion #1

Starting point:

    $ qemu-system-x86_64 -chardev udp,id=chr0,port=12345,localaddr=localhost

Works.  host defaults to localhost, localport defaults to 0, same as in
git master.

Now "forget" to specify @port:

    $ qemu-system-x86_64 -chardev udp,id=chr0,localaddr=localhost
    qemu-system-x86_64: -chardev udp,id=chr0,localaddr=localhost: Parameter 'backend.data.remote.data.port' is missing

Again, the visitor's error message uses "standard" notation.

We obediently do what the error message tells us to do:

    $ qemu-system-x86_64 -chardev udp,id=chr0,localaddr=localhost,backend.data.remote.data.port=12345
    qemu-system-x86_64: -chardev udp,id=chr0,localaddr=localhost,backend.data.remote.data.port=12345: Parameters 'backend.*' used inconsistently

Mission accomplished: confusion :)


Example: manual transformation leads to confusion #2

Confusion is possible even without tricking the user into mixing
"standard" and "alternate" explicitly:

    $ qemu-system-x86_64 -chardev udp,id=chr0,backend.data.remote.type=udp
    qemu-system-x86_64: -chardev udp,id=chr0,backend.data.remote.type=udp: Parameters 'backend.*' used inconsistently

Here, the user tried to stick to "standard", but forgot to specify a
required member.  The transformation machinery then "helpfully"
transformed nothing into something, which made the visitor throw up.


Clear error reporting is a critical part of a human-friendly interface.
We have two separate problems with it:

1. The visitor reports errors as if aliases didn't exist

   Fixing this is "merely" a matter of tracing back alias applications.
   More complexity...

2. The visitor reports errors as if manual transformation didn't exist

   Manual transformation can distort the users input beyond recognition.
   The visitor reports errors for the transformed input.

   To fix this one, we'd have to augment the parse tree so it points
   back at the actual user input, and then make the manual
   transformations preserve that.  Uff!

I'm afraid I need another round of thinking on how to best drag legacy
syntax along when we QAPIfy.

[...]


