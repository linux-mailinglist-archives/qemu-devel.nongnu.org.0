Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668964452C7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:15:12 +0100 (CET)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mibeB-0007rQ-4A
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 08:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mibci-0007Bm-2m
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mibce-0002K3-FT
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636028014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEoIpN4XReiMjcTxBcoutgWyDXGb/ju+HR+V0dXdnKc=;
 b=BdhZpnVzHXlsvXCeYv2iv7SkpnASV/EzOVR7Mu6MKYJNFKWe5LzXm/Y9KW13rSCyGdf+04
 9pp9Ad87gk3aCJC8G80HWhdGGAmT+FY2h0O9EpjM2OlJl2sDjRzgDLbAbbgHRwAjCWWC85
 fZ24XBlQHUUh4YgaZWhcopYKoF5DVP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-PE3q4XkEPUKFO3fyGds-YQ-1; Thu, 04 Nov 2021 08:13:31 -0400
X-MC-Unique: PE3q4XkEPUKFO3fyGds-YQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A310BAF83;
 Thu,  4 Nov 2021 12:13:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2280467840;
 Thu,  4 Nov 2021 12:13:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A784611380A7; Thu,  4 Nov 2021 13:13:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
 <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
Date: Thu, 04 Nov 2021 13:13:02 +0100
In-Reply-To: <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Mon, 1 Nov 2021 10:34:47 +0000")
Message-ID: <87wnloce5t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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
 "thuth@redhat.com" <thuth@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Fri, Oct 29, 2021 at 02:42:49PM +0000, Jag Raman wrote:
>> > On Oct 27, 2021, at 11:40 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
>> > On Mon, Oct 11, 2021 at 01:31:08AM -0400, Jagannathan Raman wrote:
>> >> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
>> >> new file mode 100644
>> >> index 0000000000..c2a300f0ff
>> >> --- /dev/null
>> >> +++ b/hw/remote/vfio-user-obj.c
>> >> @@ -0,0 +1,173 @@
>> >> +/**
>> >> + * QEMU vfio-user-server server object
>> >> + *
>> >> + * Copyright =C2=A9 2021 Oracle and/or its affiliates.
>> >> + *
>> >> + * This work is licensed under the terms of the GNU GPL-v2, version =
2 or later.
>> >> + *
>> >> + * See the COPYING file in the top-level directory.
>> >> + *
>> >> + */
>> >> +
>> >> +/**
>> >> + * Usage: add options:
>> >> + *     -machine x-remote
>> >> + *     -device <PCI-device>,id=3D<pci-dev-id>
>> >> + *     -object vfio-user-server,id=3D<id>,type=3Dunix,path=3D<socket=
-path>,
>> >=20
>> > I expected socket.type=3D and socket.path=3D based on the QAPI schema.=
 Is
>> > this command-line example correct?
>>=20
>> When I tried the =E2=80=9Csocket.path=E2=80=9D approach, QEMU was not ab=
le to parse the
>> arguments. So I had to break it down to a series of individual members.
>>=20
>> If =E2=80=9Csocket.path=E2=80=9D is the expected way, I=E2=80=99ll see w=
hy the parser is not working
>> as expected.=20
>
> CCing Markus regarding QAPI.
>
> I'm surprised because the QAPI schema for vfio-user-server objects is:
>
>   { 'struct': 'VfioUserServerProperties',
>     'data': { 'socket': 'SocketAddress', 'device': 'str' } }
>
> It's not clear to me why the command-line parser flattens the 'socket'
> field into its 'type' and 'path' sub-fields in your example:
>
>   -object vfio-user-server,id=3D<id>,type=3Dunix,path=3D<socket-path>,dev=
ice=3D<pci-dev-id>
>
> Maybe because SocketAddress is an enum instead of a struct?
>
> Imagine a second SocketAddress field is added to vfio-user-server. How
> can the parser know which field 'type' and 'path' belong to? I tried it:
>
>   { 'struct': 'VfioUserServerProperties',
>     'data': { 'socket': 'SocketAddress', 'socket2': 'SocketAddress', 'dev=
ice': 'str' } }
>
> Now the parser refuses any input I've tried. For example:
>
>   $ build/qemu-system-x86_64 -object vfio-user-server,id=3Ds,device=3Dasd=
f,type=3Dunix,path=3Dasdf,type=3Dunix
>   qemu-system-x86_64: -object vfio-user-server,id=3Ds,device=3Dasdf,type=
=3Dunix,path=3Dasdf,type=3Dunix: Parameter 'type' is missing
>
> A similar case happens if the parent struct has 'type' or 'path' fields.
> They collide with the SocketAddress union fields. I didn't test this
> though.
>
> Questions for Markus:
> 1. Do you know why the parser behaves like this?

Yes: backward compatibility.

The straightforward way to do a QAPI-based command line option uses
qobject_input_visitor_new_str(), which parses either JSON or dotted
keys, and returns the result wrapped in the appropriate QObject visitor.

The JSON syntax is derived from the QAPI schema just like for QMP.  For
the VfioUserServerProperties shown above, it's something like

    {"socket": {"type": "unix", "path": "dir/socket"}, "device" "mumble"}

I did not check my derivation by feeding it to QEMU.  Beware of
screwups.

The dotted keys syntax is derived from the JSON syntax as described in
keyval.c.  For the JSON above, it should be

    socket.type=3Dunix,socket.path=3Ddir/socket,device=3Dmumble

When we QAPIfy an existing option instead of adding a new QAPI-based
one, we have an additional problem: the dotted keys syntax has to match
the old syntax (the JSON syntax is all new, so no problem there).

The old syntax almost always has its quirks.  Ideally, we'd somehow get
from quirky old to boring new in an orderly manner.  Sadly, we still
don't have good solutions for that.  To make progress, we commonly
combine JSON new with quirky old.

qemu-system-FOO -object works that way.  object_option_parse() parses
either JSON or QemuOpts.  It wraps the former in a QObject visitor, and
the latter in an opts visitor.

QemuOpts is flat by design[*], so the opts visitor parses flat QemuOpts
from a (possibly non-flat) QAPI type.  How exactly it flattens, and how
it handles clashes I don't remember.

Sadly, this means that we get quirky old even for new object types.

Questions?

> 2. Is it good practice to embed SocketAddress into parent structs or
>    should we force it into a struct?

I'm not sure I got your question.  An example might help.


[*] You can play games with dotted keys to simulate nesting, but the
opts visitor predates all that.


