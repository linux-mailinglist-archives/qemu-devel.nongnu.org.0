Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812601981E8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 19:08:19 +0200 (CEST)
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIxta-00023u-7M
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 13:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jIxsD-000099-2v
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 13:06:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1jIxsA-0001Xd-Pw
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 13:06:52 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:33368)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1jIxsA-0001Vu-JP
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 13:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585588009;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWfBVEDUjPpPDVganVr/bEvV9GeXMuCKcNVhNKBsmbw=;
 b=RsQeS62xxSTm49wf5OwwPIQNVatjHJETrZwJGV1PSFcTONVaNbPODXSa9vSs/8l93N+R+9
 JM6KoHgVcJJzJl+mvZMNREmD9TSyBlvvIeavbebh+qi+7DuIW2oMH7Wkr6vcS+CKXbXD2Y
 S5S5cH2IWP1iGhbBycdlSL+poOjdS5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-n_ViT9m5MG6a-y8j6AX0ww-1; Mon, 30 Mar 2020 13:06:33 -0400
X-MC-Unique: n_ViT9m5MG6a-y8j6AX0ww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8D09801E76;
 Mon, 30 Mar 2020 17:06:31 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E605C1B5;
 Mon, 30 Mar 2020 17:06:16 +0000 (UTC)
Date: Mon, 30 Mar 2020 18:06:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.0] qga-posix: Avoid crashing process when failing
 to allocate memory
Message-ID: <20200330170613.GT236854@redhat.com>
References: <20200324194836.21539-1-philmd@redhat.com>
 <1242083041.1.1585117162620@webmail.proxmox.com>
 <6be54d1f-e5fc-5b34-ba4d-fa050029f26b@redhat.com>
 <87mu7yue35.fsf@dusky.pond.sub.org>
 <81317f7f-7de9-f616-27dc-c389f06792c3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <81317f7f-7de9-f616-27dc-c389f06792c3@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>,
 qemu-stable@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sameeh Jubran <sjubran@redhat.com>, Basil Salman <basil@daynix.com>,
 Dietmar Maurer <dietmar@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 30, 2020 at 06:04:49PM +0200, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Cc'ing the ppl who responded the thread you quoted.
>=20
> On 3/30/20 4:11 PM, Markus Armbruster wrote:
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
> > ---
> >   qga/commands-posix.c | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 93474ff770..8f127788e6 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -493,7 +493,13 @@ struct GuestFileRead *qmp_guest_file_read(int64_t
> handle, bool has_count,
> >           gfh->state =3D RW_STATE_NEW;
> >       }
> >
> > -    buf =3D g_malloc0(count+1);
> > +    buf =3D g_try_malloc0(count + 1);
> > +    if (!buf) {
> > +        error_setg(errp,
> > +                   "failed to allocate sufficient memory "
> > +                   "to complete the requested service");
> > +        return NULL;
> > +    }
> >       read_count =3D fread(buf, 1, count, fh);
> >       if (ferror(fh)) {
> >           error_setg_errno(errp, errno, "failed to read file");
> >
>=20
> > > On 3/25/20 7:19 AM, Dietmar Maurer wrote:
> > > > but error_setg() also calls malloc, so this does not help at all?
> > >=20
> > > IIUC the problem, you can send a QMP command to ask to read let's say
> > > 3GB of a file, and QEMU crashes. But this doesn't mean there the .hea=
p
> > > is empty, there is probably few bytes still available, enough to
> > > respond with an error message.
> >=20
> > We've discussed how to handle out-of-memory conditions many times.
> > Here's one instance:
> >=20
> >      Subject: When it's okay to treat OOM as fatal?
> >      Message-ID: <87efcqniza.fsf@dusky.pond.sub.org>
> >      https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg03212.=
html
> >=20
> > No improvement since then; there's no guidance on when to check for OOM=
.
> > Actual code tends to check only "large" allocations (for subjective
> > values of "large").
> >=20
> > I reiterate my opinion that whatever OOM handling we have is too
> > unreliable to be worth much, since it can only help when (1) allocation=
s
> > actually fail (they generally don't[*]), and (2) the allocation that
> > fails is actually handled (they generally aren't), and (3) the handling
> > actually works (we don't test OOM, so it generally doesn't).
> >=20
> >=20
> > [*] Linux overcommits memory, which means malloc() pretty much always
> > succeeds, but when you try to use "too much" of the memory you
> > supposedly allocated, a lethal signal is coming your way.  Reasd the
> > thread I quoted for examples.
>=20
> So this patch takes Stefan reasoning:
> https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg03525.html
>=20
>   My thinking has been to use g_new() for small QEMU-internal structures
>   and g_try_new() for large amounts of memory allocated in response to
>   untrusted inputs.  (Untrusted inputs must never be used for unbounded
>   allocation sizes but those bounded sizes can still be large.)
>=20
> In any cases (malloc/malloc_try) we have a denial of service
> (https://www.openwall.com/lists/oss-security/2018/10/17/4) and the servic=
e
> is restarted.
>=20
> Daniel suggests such behavior should be catched by external firewall guar=
d
> (either on the process or on the network). This seems out of scope of QEM=
U
> and hard to fix.

Did I ?

IMHO if the guest agent is connected to a chardev that allows access to
a user that isn't the one running QEMU, that is serious mis-configuration.
IOW, it is user error, not a QEMU guest agent bug.  Firewalls are not
required  - QEMU should be reconfigured to not make it accessible over TCP.
This is the same situation documented in 4f24430821c568936aeda417bbb00e989a=
9e1984
when it was claimed that QEMU had a security flaw because the QMP monitor
could be exposed over TCP.

The guest agent is a privileged interface to interact with a guest OS, and
as such it should only be made available to users who are trustworthy on
the host.=20

> So, can we improve something? Or should we let this code as it?

Personally I would have just put a low, hard limit on "count" in the
guest agent spec & impl. eg don't allow count to be larger than 10 MB
and document that this command is just for limited, ad-hoc debugging,
such as log file access. In extremis we could make the hard limit be
a configuration parameter for the guest agent.

The QEMU guest agent protocol is not sensible way to access huge files
inside the guest. It requires the inefficient process of reading the
entire data into memory than duplicating it again in base64 format, and
then copying it again in the JSON serializer / monitor code.

For arbitrary general purpose file access, especially for large files,
use a real file transfer program or use a network block device, not the
QEMU guest agent.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


