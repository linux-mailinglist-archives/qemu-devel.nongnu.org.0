Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3A41C195
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 06:55:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQPT5-0000Dh-U4
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 00:55:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQPS7-0008O1-54
	for qemu-devel@nongnu.org; Tue, 14 May 2019 00:54:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQPS4-0003hU-IA
	for qemu-devel@nongnu.org; Tue, 14 May 2019 00:54:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60988)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQPS4-0003c7-Ae
	for qemu-devel@nongnu.org; Tue, 14 May 2019 00:54:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FFAB83F51;
	Tue, 14 May 2019 04:54:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA04C608AB;
	Tue, 14 May 2019 04:54:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 07C0311385E4; Tue, 14 May 2019 06:54:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Jones <drjones@redhat.com>
References: <20190418092841.fzrcegkbal7dpfcy@kamzik.brq.redhat.com>
	<20190418112610.GO13773@redhat.com>
	<877ebrmch2.fsf@dusky.pond.sub.org>
	<20190513184237.i2ha3ixvhjqzkn5q@kamzik.brq.redhat.com>
Date: Tue, 14 May 2019 06:54:03 +0200
In-Reply-To: <20190513184237.i2ha3ixvhjqzkn5q@kamzik.brq.redhat.com> (Andrew
	Jones's message of "Mon, 13 May 2019 20:42:37 +0200")
Message-ID: <87bm05ab6c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 May 2019 04:54:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] How do we do user input bitmap properties?
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
	"Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
	dgilbert@redhat.com, qemu-devel@nongnu.org, imammedo@redhat.com,
	Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrew Jones <drjones@redhat.com> writes:

> On Thu, Apr 18, 2019 at 07:48:09PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Thu, Apr 18, 2019 at 11:28:41AM +0200, Andrew Jones wrote:
>> >> Hi all,
>> >>=20
>> >> First some background:
>> >>=20
>> >> For the userspace side of AArch64 guest SVE support we need to
>> >> expose KVM's allowed vector lengths bitmap to the user and allow
>> >> the user to choose a subset of that bitmap. Since bitmaps are a
>> >> bit awkward to work with then we'll likely want to expose it as
>> >> an array of vector lengths instead. Also, assuming we want to
>> >> expose the lengths as number-of-quadwords (quadword =3D=3D 128 bits
>> >> for AArch64 and vector lengths must be multiples of quadwords)
>> >> rather than number-of-bits, then an example array (which will
>> >> always be a sequence) might be
>> >>=20
>> >>  [ 8, 16, 32 ]
>> >>=20
>> >> The user may choose a subsequence, but only through truncation,
>> >> i.e. [ 8, 32 ] is not valid, but [ 8, 16 ] is.
>> >>=20
>> >> Furthermore, different hosts may support different sequences
>> >> which have the same maximum. For example, if the above sequence
>> >> is for Host_A, then Host_B could be
>> >>=20
>> >>  [ 8, 16, 24, 32 ]
>> >>=20
>> >> The host must support all lengths in the sequence, which means
>> >> that while Host_A supports 32, since it doesn't support 24 and
>> >> we can only truncate sequences, we must use either [ 8 ] or
>> >> [ 8, 16 ] for a compatible sequence if we intend to migrate
>> >> between the hosts.
>> >>=20
>> >> Now to the $SUBJECT question:
>> >>=20
>> >> My feeling is that we should require the sequence to be
>> >> provided on the command line as a cpu property. Something
>> >> like
>> >>=20
>> >>   -cpu host,sve-vl-list=3D8:16
>> >>=20
>> >> (I chose ':' for the delimiter because ',' can't work, but
>> >> if there's a better choice, then that's fine by me.)
>> >>=20
>> >> Afaict a property list like this will require a new parser,
>>=20
>> We had 20+ of those when I last counted.  Among the more annoying
>> reasons CLI QAPIfication is hard[1].
>>=20
>> >> which feels a bit funny since it seems we should already
>> >> have support for this type of thing somewhere in QEMU. So,
>> >> the question is: do we? I see we have array properties, but
>> >> I don't believe that works with the command line. Should we
>> >> only use QMP for this? We already want some QMP in order to
>> >> query the supported vector lengths. Maybe we should use QMP
>> >> to set the selection too? But then what about command line
>> >> support for developers? And if the property is on the command
>> >> line then we don't have to add it to the migration stream.
>> >
>> > You should be able to use arrays from the CLI with QemuOpts by repeati=
ng
>> > the same option name many times, though I can't say it is a very
>> > nice approach if you have many values to list as it gets very repetati=
ve.
>>=20
>> Yes, this is one of the ways the current CLI does lists.  It's also one
>> of the more annoying reasons CLI QAPIfication is hard[2].
>>=20
>> QemuOpts let the last param=3Dvalue win the stupidest way that could
>> possibly work (I respect that): add to the front of the list, search it
>> front to back.
>>=20
>> Then somebody discovered that if you search the list manually, you can
>> see them all, and abuse that to get a list-valued param.  I'm sure that
>> felt clever at the time.
>>=20
>> Another way to do lists the funky list feature of string input and opts
>> visitor.  Yet another annoying reason CLI QAPIfication is hard[3].
>>=20
>> We use the opts visitor's list feature for -numa node,cpus=3D...  Hmm,
>> looks like we even combine it with the "multiple param=3Dvalue build up a
>> list" technique: -smp node,cpus=3D0-1,cpus=3D4-5 denotes [0,1,4,5].
>>=20
>> > That's the curse of not having a good CLI syntax for non-scalar data in
>> > QemuOpts & why Markus believes we should switch to JSON for the CLI too
>> >
>> >      -cpu host,sve-vl=3D8,sve-vl=3D16
>>=20
>> We actually have CLI syntax for non-scalar data: dotted keys.  Dotted
>> keys are syntactic sugar for JSON.  It looks friendlier than JSON for
>> simple cases, then gets uglier as things get more complex, and then it
>> falls apart: it can't quite express all of JSON.
>>=20
>> Example: sve-vl.0=3D8,sve-vl.1=3D16
>>     gets desugared into {"sve": [8, 16]}
>>     if the QAPI schema has 'sve': ['int'].
>>=20
>> The comment at the beginning of util/keyval.c explains it in more
>> detail.
>>=20
>> It powers -blockdev and -display.  Both options accept either JSON or
>> dotted keys.  If the option argument starts with '{', it's JSON.
>> Management applications should stick to JSON.
>>=20
>>=20
>> [1] Towards a more expressive and introspectable QEMU command line
>> https://www.linux-kvm.org/images/f/f2/Armbru-qapi-cmdline_1.pdf
>> Slide 34 "Backward compatibility" item 1
>>=20
>> [2] ibid, item 4
>>=20
>> [3] ibid, item 3
>>
>
> Sorry I forgot to follow up to this earlier. I looked at the examples
> provided and saw they were all for independent command line options,
> rather than command line options like '-cpu' that then accepts additional
> properties. I couldn't see how I could use ',' to separate array members
> when using properties or to use an array property input on the command
> line.

The argument of -cpu is parsed ad hoc.  Unlike QemuOpts and dotted keys,
parse_cpu_option() doesn't seem to support escaping ','.  Not that
escaping would be a user-friendly solution.

>       In the end I opted to use a single uint64_t for a bitmap, as 64 is
> big enough for now,

Do you think it'll remain big enough?

>                     and even though passing some hex number on the command
> line isn't user friendly at all, it didn't seem like a long list of a
> repeated parameter was that user friendly either. Of course I'm still open
> to suggestions to try to find the best balance between user friendliness,
> current QEMU command line parsing support, and just getting a bitmap into
> cpu state one way or another.

I'd ask for consistency with existing practice no matter how flawed if
we had such consistency.

If I understand your "[PATCH 00/13] target/arm/kvm: enable SVE in
guests" correctly, the bitmap form of [1, 2, 4] is

    -cpu max,sve-vls-map=3D11

Observe bit#0 means 1; better document that clearly.

If we used dotted keys to produce an intList, we'd do

    -cpu max,sve-vls-map.0=3D1,sve-vls-map.1=3D2,sve-vls-map.2=3D4

If the option argument is QAPIfied, we additionally get

    -cpu '{"type": "max", "sve-vls-map": [1, 2, 4]}'

for free.

If we did it like -numa (please don't), we'd get something like

    -cpu max,sve-vls-map=3D1-2,sve-vls-map=3D4

None of the above is exactly a pinnacle of user-friendliness.  JSON is
at least ugly in a regular way.  Your bitmap encoded in a number is at
least concise.

If a numerically encoded bitmap is the least bad option here, I wonder
why it's not the least bad option for -numa...  Perhaps because there 64
isn't big enough.

I'm afraid the numerically encoded bitmap will make its way into the
QAPI schema sooner or later.  This will create an unfortunate
inconsistency with the [int] encoding already there.

Who's going to use sve-vls-map?  Humans, or pretty much only machines?

