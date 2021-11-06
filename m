Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B227446CBD
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 07:37:28 +0100 (CET)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjFKR-0004nK-AU
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 02:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFHu-0003zW-P4
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 02:34:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFHq-0005Su-5U
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 02:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636180481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QCDLt3yLQn0Se/nRUEWbK6sbAeYrVZmMf3q/Xvon9mQ=;
 b=G8/xRGBYURWIfrgs+MFr/pgAGwI5JgBSHCVgzmt808bum+MvYoGlo5MPUeIPpLtO5gQiFt
 vJXfU3nXs8QLS3j8ioUVGjkavst1A/eAjtmSLLJxQAfzVZuf/ImYniseaFh1NCQr5esAxc
 lr1WUb4G0dWmbM8LraNBfFVh3mqh97A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-ARUM4-0bMWae--iYlDWRpA-1; Sat, 06 Nov 2021 02:34:38 -0400
X-MC-Unique: ARUM4-0bMWae--iYlDWRpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61AFC1808319;
 Sat,  6 Nov 2021 06:34:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96D0D60C17;
 Sat,  6 Nov 2021 06:34:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 265C911380A7; Sat,  6 Nov 2021 07:34:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
 <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
 <87wnloce5t.fsf@dusky.pond.sub.org> <YYPwogn87tMf0p7s@redhat.com>
 <87y2623of6.fsf@dusky.pond.sub.org> <YYUvZjg0lmaWE223@redhat.com>
Date: Sat, 06 Nov 2021 07:34:25 +0100
In-Reply-To: <YYUvZjg0lmaWE223@redhat.com> (Kevin Wolf's message of "Fri, 5
 Nov 2021 14:19:34 +0100")
Message-ID: <87fss9vlla.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, pkrempa@redhat.com,
 Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 05.11.2021 um 11:08 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Am 04.11.2021 um 13:13 hat Markus Armbruster geschrieben:
>> >> The old syntax almost always has its quirks.  Ideally, we'd somehow get
>> >> from quirky old to boring new in an orderly manner.  Sadly, we still
>> >> don't have good solutions for that.  To make progress, we commonly
>> >> combine JSON new with quirky old.
>> >> 
>> >> qemu-system-FOO -object works that way.  object_option_parse() parses
>> >> either JSON or QemuOpts.  It wraps the former in a QObject visitor, and
>> >> the latter in an opts visitor.
>> >> 
>> >> QemuOpts is flat by design[*], so the opts visitor parses flat QemuOpts
>> >> from a (possibly non-flat) QAPI type.  How exactly it flattens, and how
>> >> it handles clashes I don't remember.
>> >> 
>> >> Sadly, this means that we get quirky old even for new object types.
>> >
>> > For -object in the system emulator (the tools all use the keyval
>> > visitor, so there it would work as expected), the only reason that we
>> > need to keep the quirky old code path around is the list handling in
>> > memory-backend.host-nodes.
>> >
>> > The main difficulty there is that the old QemuOpts based code path
>> > allows specifying the option twice and both of them would effectively be
>> > combined. Do we have any idea how to replicate this in a keyval parser
>> > based world?
>> 
>> I can see just two clean solutions, but both involve upending a lot of
>> code.
>> 
>> We can fuse keyval parser and visitor to get a schema-directed parser.
>> 
>> We can change the abstract keyval syntax to permit repeated keys.  This
>> means replacing QDict in in the abstract syntax tree, with fallout in
>> the visitor.
>> 
>> Even if we find a practical solution, I don't like the combination of
>> "you may give the same parameter multiple times, and the last one wins"
>> and "for a list-valued parameter, the values of repeated parameters are
>> collected into a list".  Each makes sense on its own.  The combination
>> not so much.  Inheriting "last one wins" from QemuOpts may have been a
>> mistake.
>> 
>> The keyval way of doing lists (inherited from the block layer's usage of
>> dotted keys?  I don't remember) requires the user to count, which isn't
>> exactly nice, either.
>
> Yes. If we didn't have to maintain compatibility (or actually as soon as
> we degrade non-JSON option lists to HMP-level support), I would
> introduce [] and {} syntax for lists and dicts, even if that means that
> use of these characters in strings doesn't work any more or only in a
> limited way. I think this would be the best compromise for usability.
>
> Anyway, this doesn't help us with the compatibility problem we're
> discussing here.
>
>> > If not, do we want to use the remaining time until 6.2 to deprecate
>> > this? The nasty part is that the only syntax that works both now and in
>> > the future is JSON. We can't easily accept the new keyval syntax while
>> > still using the QemuOpts based code.
>> 
>> What exactly do you propose to deprecate?
>
> We can deprecate on two different levels. I think it's useful to do
> both:
>
> 1. Broad deprecation: Stable non-JSON interfaces are degraded to
>    a HMP-like compatibility promise.

Calling it "deprecation" might be confusing.  HMP isn't deprecated, it's
merely not a stable interface.  That's kind of like "deprecated when you
need stable", but saying "not a stable interface" is clearer.

When I write "deprecate" below, I mean something like "go use something
else (no conditions)".  When I mean "use something else when you need
stable", I write "degrade" (short for "degrade to an HMP-like
compatibility promise").

>                                      Obviously, this can only be done
>    for options that support JSON.

We can also degrade or even deprecate sugar options in favor of the real
ones.  Case by case, I guess.

>                                   Peter Maydell also wants to do this
>    only after a big user (read: libvirt) has implemented and is
>    using JSON, basically as a proof that the alternative is working.
>
>    So this can certainly be done for -object. I believe libvirt also
>    uses JSON for -device now, so this should be fine now, too.

The non-sugar options supporting JSON are -audiodev, -blockdev, -compat,
-display (partially), -machine (I think), -object.

-netdev is QAPIfied, but still uses QemuOpts.  Too late for 6.2, I'm
afraid.

>                                                                Possibly
>    -drive (in favour of -blockdev), though I'm not completely sure if we
>    have gotten rid of the final users of -drive. (CCing Peter Krempa for
>    details.)

The problem with deprecating -drive is configuring onboard block
devices.  We need a stable interface for that, and it must be usable
together with -blockdev.

We provided such an interface (machine properties) for some onboard
block devices starting with commit ebc29e1bea "pc: Support firmware
configuration with -blockdev".  Many more remain, I believe.

>    This degradation of the compatibility promise doesn't tell users what
>    exactly is going to change, which is why doing the second one, too,
>    might be nice.
>
> 2. Narrow deprecation: We can just deprecate the non-JSON form, or
>    certain aspects of it, of memory-backend.host-nodes. This is the
>    specific things that stops us from switching -object to keyval.
>
>    a. Deprecate the whole option. If you want to use it and need a
>       stable interface, you have to use JSON. We'll just switch the
>       non-JSON form on a flag day. Before it, you need to use QemuOpts +
>       OptsVisitor syntax for the list; after it, you need to use keyval
>       syntax.

I parse "the whole option" as "-object with dotted keys argument".
Correct?

>    b. Deprecate only repeating the option. memory-backend is changed to
>       first try visiting a list, and if that fails, it visits a string
>       and goes through a string visitor locally to keep supporting the
>       integer range syntax.

Possible problem: integer range syntax must not leak into the JSON form.

>    c. Deprecate all list values, but keep supporting a single integer
>       value by using an alternate between list and int.

Single int should also not leak into JSON.

> Picking one of these four options is enough to convert -object to
> keyval. I would suggest doing both 1. and one of the options in 2.

I'm grateful for your analysis.


