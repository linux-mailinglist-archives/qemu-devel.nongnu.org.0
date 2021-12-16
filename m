Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762254776D4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:07:05 +0100 (CET)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtHc-0003y7-Eq
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mxtBw-0001eL-Qx
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:01:13 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mxtBs-0006ax-Td
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:01:12 -0500
Received: from smtpclient.apple (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9B92A20780;
 Thu, 16 Dec 2021 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639670455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kh//+a4rVX+ZN+xMk26tegT7i3uX5w1tGsvRKW26qL4=;
 b=zzTdp+lp2yXSnnxKmQ+fRdZUNUA343dPNCEiCh9/UfS6zRQ+ZSOMyf1pViWxDIg5vsHdyh
 qkxfy4lCNWLnRPah5+c04cce7dd44MqStF0qXuCjUfqa1UQNcaCf6LmStTlKY9zsTLvK/e
 YUxPabnHmUAMH+06Hvw0bQRRzxksMYE=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <YbteCdJDt8B95sfj@redhat.com>
Date: Thu, 16 Dec 2021 17:00:55 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA6AC81F-1101-42CD-B3FB-54E4F81CF60D@greensocs.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <877dc7tnjf.fsf@dusky.pond.sub.org>
 <da52f408-6037-20a9-78a9-77f12d86f620@redhat.com>
 <875yroyhih.fsf@dusky.pond.sub.org>
 <8dd178b7-631b-25b4-4f68-334b0d583f72@redhat.com>
 <YbteCdJDt8B95sfj@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mark.burton@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 16 Dec 2021, at 16:40, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Thu, Dec 16, 2021 at 04:28:29PM +0100, Paolo Bonzini wrote:
>> On 12/16/21 11:24, Markus Armbruster wrote:
>>>> Not really, in particular the startup has been mostly reworked =
already
>>>> and I disagree that it is messy.  softmmu/vl.c is messy, sure: it =
has
>>>> N different command line parser for command line options, magic
>>>> related to default devices, and complicated ordering of -object
>>>> creation.
>>>>=20
>>>> But the building of emulator data structures is not messy; only the
>>>> code that transforms the user's instructions into startup commands.
>>>> The messy parts are almost entirely contained within softmmu/vl.c.
>>>=20
>>> In my opinion, the worst mess is the reordering and the (commonly
>>> unstated, sometimes unknown) dependencies that govern it.
>>> The reordering is part of the stable interface.  Its finer points
>>> basically nobody understands, at least not without staring at the =
code.
>>=20
>> Then we agree, because that's what I meant by "the messy parts are =
almost
>> entirely contained within softmmu/vl.c".
>>=20
>>>> The one (and important, but fixable) exception is backends for
>>>> on-board devices: serial_hd, drive_get, and nd_table.
>>>=20
>>> Practical ideas on fixing it?
>>=20
>> What you did with pflash, turned up to 11.
>>=20
>>>>> * A new binary sidesteps the need to manage incompatible change.
>>>>=20
>>>> More precisely, a new binary sidesteps the need to integrate an
>>>> existing mechanism with a new transport, and deal with the
>>>> incompatibilities that arise.
>>>=20
>>> I'm not sure I got this.
>>=20
>> Configuring the VM part in CLI and part in QMP is not something =
anybody
>> needs nor should desire.  A new binary can use the CLI only for =
things that
>> really have to be done before QMP is up, for example the =
configuration of
>> sandboxing or tracing; and even that is only nice-to-have and not =
absolutely
>> necessary.
>=20
> I wouldn't special case sandboxing at least. It should be something =
that
> can be activated via a QMP command too. That way you can blockdev-add
> a bunch of disks and other backends while you are still relatively
> unconfined, and then lock it down with a sandbox before starting =
vCPUs.
>=20
> Or you can perhaps start with a coarse sandbox and then switch to
> a stronger sandbox part way through config (though can't remember
> offhand if that's possible with seccomp, or whether the first
> seccomp profile applied, prevents you adding stronger ones later).
>=20
> Anyway sandboxing doesn't need to be active before QMP IMHO, because
> our primary goal with it is to mitigate guest exploits from untrusted
> code - the initial startup is largely trustworthy. Starting guest =
CPUs,
> or reading VMState is where it becomes dangerous generally.
>=20
> I think you can probably argue that even tracing doesn't hugely
> need special casing if you can get QMP started early enough that
> there's little else that can go wrong before you get a chance to
> send a QMP 'trace' command.
>=20
>>=20
>>>> The problem is that CLI and HMP, being targeted to humans (and as =
you
>>>> say below humans matter), are not necessarily trivial transports.  =
If
>>>> people find the trivial transport unusable, we will not be able to
>>>> retire the old CLI.
>>>=20
>>> Yes, a trivial CLI transport alone may not suffice to retire the old
>>> CLI.  By itself, that doesn't mean trivial transports must be =
avoided.
>>>=20
>>> Do I have to argue the benefits of a trivial configuration file
>>> transport?
>>=20
>> I think you do; I'm not sure that a trivial configuration file =
transport is
>> useful.  It's a middle ground in sophistication that I'm not sure =
would
>> serve many people.  The only source of bug reports for -readconfig =
has been
>> lxd, and I think we agree that they would be served better by QMP.
>>=20
>>> Do I have to argue the benefits of a trivial CLI transport for use =
by
>>> relatively unsophisticated programs / relatively sophisticated =
humans
>>> (such as developers)? Can we agree these benefits are not zero?
>>=20
>> We can.  But again I think you're misunderstanding the pain that the
>> existing CLI inflicts on users.  Most users do not find the ordering
>> complicated in practice; they do not even know that the issue exists. =
The
>> problem that users have is the 100+ character command lines, and that =
can be
>> fixed in two ways:
>>=20
>> - with a trivial configuration file transport
>>=20
>> - with a management tool such as virt-manager or virsh.
>>=20
>> And I maintain that most users would be better served by the latter.  =
In
>> fact, I constantly wonder how much we're overestimating the amount of =
people
>> that are using QEMU.  In every post (Reddit, HN, wherever) that =
mentions
>> QEMU being too complex and not having a front-end like VirtualBox, =
there's
>> always someone that mentions virt-manager.

I totally agree with Paolo of course - thats what I was saying before. =
You can call =E2=80=9Clibvirt=E2=80=9D somebody else=E2=80=99s problem =
if you wish, but it seems to me a more sensible route=E2=80=A6.

>=20
> An important thing to note is that while libvirt is theoretically
> general purpose for any aspect of QEMU, practically speaking our
> coverage of QEMU features is very much skewed to virtualization
> use cases. The emulation use cases don't get anywher near as much
> love & attention, especially for architectures lacking KVM, or for
> machine types not used with KVM.

Totally agree on this (of course).

Thats why I=E2=80=99m here - I care about the people who care about =
emulation  :-)

In general, what we are working on is exactly the ability to service the =
=E2=80=98complex=E2=80=99 emulation use case. No CLI, nor single =
=E2=80=98config=E2=80=99 file will be good enough, in all cases we will =
need to drive directly into QMP.

Cheers
Mark.



>=20
> Also although libvirt tries to focus on just exposing a mechanism
> and not imposing a policy there are some aspects where we don't
> achieve that due to our architecture design. For example, if you
> want QEMU connected to stdio that's not possible with libvirt
> directly. There's always a level of indirection there because
> we unconditionally daemonize QEMU.
>=20
>>>> Bad CLI is also very hard to deprecate because, unlike QMP (for =
which
>>>> you can delegate the workarounds to Libvirt & friends) and HMP (for
>>>> which people can just learn the new thing and type it), it is baked =
in
>>>> countless scripts.  People hate it when scripts break.
>>>=20
>>> I assure you that bad QMP is plenty hard to deprecate, even when =
libvirt
>>> can be updated to cope.
>>=20
>> Right, and CLI is worse. :)
>>=20
>>>> The issues with the CLI then can be completely self-contained =
within
>>>> softmmu/vl.c, and will not influence the innards of QEMU.
>>>=20
>>> The issues with the CLI will still influence its users. Can we
>>> agree that human users deserve something better than the current
>>> CLI?
>>=20
>> Deserve, yes.  Need, not sure.  Do you agree that a lot of clients of =
QEMU
>> would be better served by Libvirt (programs) and virt-manager =
(humans)?
>>=20
>> So, if I have to choose between better QMP now and better CLI now, I =
choose
>> better QMP now.  Exactly to avoid the "somebody could" trap and focus =
on
>> something that "we can" do now.
>>=20
>>> I think we can learn from our experience with HMP/QMP.
>>>=20
>>> Good:
>>>=20
>>> * Separate interfaces for machines and for humans
>>> * Layering the human interface on top of the machine interface: HMP
>>>   commands implemented on top of QMP's internal C interface.
>>=20
>> Agreed.  CLI should likewise be implemented on top of QMP's internal =
C
>> interface, the same way non-preconfig mode concludes startup with
>> qmp_x_exit_preconfig(NULL).  Second choice (inferior but sometimes
>> acceptable): implement it on top of the same QOM interfaces as the =
QOM
>> commands.
>>=20
>>> * The stable interface is clear: QMP unless explicitly marked =
unstable.
>>=20
>> Agreed, the problem here is that CLI is harder to evolve.
>>=20
>> Paolo
>>=20
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    =
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            =
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    =
https://www.instagram.com/dberrange :|
>=20


