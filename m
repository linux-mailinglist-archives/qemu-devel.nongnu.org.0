Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACB14D8E55
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:39:23 +0100 (CET)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTrTO-0007xt-0C
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:39:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTrS9-0006Na-Dl; Mon, 14 Mar 2022 16:38:05 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:38497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTrS7-0001w3-JZ; Mon, 14 Mar 2022 16:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=KF8x4q8MycoHpg2xC2ppJT33EhSOfBmOE9odyg8H5bM=; b=VxWrwGsYfWl0j+4yzzjaKIIlcc
 8xd/GykZchfzxIwxLFdMxPJ57GT1FerR4J3x/R5sOO6JSA+9Z9NURazqZ7GZ8oVe57BPVBDDlhR/F
 9ztGmpJHOGc4UA8v2Jy1E6t5jF57lE5IUPcgQI1GVprljnGfXZX3Le8Zl5nUsv62csdJTvh3+XtzA
 M80ScXk1eztYgD8SX1erdIPf7MnAgw2MadHs8zbf5fN2zrk1f72+DzklfbEeIXjsmV+/g0mUPsTuK
 IP3Gy5N1ORQjoPthZyvzqwAxdIaq9rCA8rKE7SewEkR8B50i951zLLV9CH5zt+HKYwKa0XLk2ubLw
 L2q1LeRw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?ISO-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Hildenbrand <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 haxm-team@intel.com, qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Date: Mon, 14 Mar 2022 21:37:00 +0100
Message-ID: <3080370.YxCODQx3Uq@silver>
In-Reply-To: <877d8w5m9e.fsf@linaro.org>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com> <877d8w5m9e.fsf@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Montag, 14. M=E4rz 2022 20:48:47 CET Alex Benn=E9e wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> > g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> > for two reasons.  One, it catches multiplication overflowing size_t.
> > Two, it returns T * rather than void *, which lets the compiler catch
> > more type errors.
> >=20
> > This commit only touches allocations with size arguments of the form
> > sizeof(T).
> >=20
> > Patch created mechanically with:
> >     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocc=
i \
> >    =20
> > 	     --macro-file scripts/cocci-macro-file.h FILES...
> >=20
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>=20
> <snip>
>=20
> > --- a/audio/jackaudio.c
> > +++ b/audio/jackaudio.c
> > @@ -97,9 +97,9 @@ static void qjack_buffer_create(QJackBuffer *buffer, =
int
> > channels, int frames)>=20
> >      buffer->used     =3D 0;
> >      buffer->rptr     =3D 0;
> >      buffer->wptr     =3D 0;
> >=20
> > -    buffer->data     =3D g_malloc(channels * sizeof(float *));
> > +    buffer->data     =3D g_new(float *, channels);
> >=20
> >      for (int i =3D 0; i < channels; ++i) {
> >=20
> > -        buffer->data[i] =3D g_malloc(frames * sizeof(float));
> > +        buffer->data[i] =3D g_new(float, frames);
>=20
> Are these actually buffers of pointers to floats? I guess I leave that
> to the JACK experts...

That's correct. JACK does not use interleaved audio format, it uses separat=
e=20
buffers for each audio channel. For the audio stuff of this patch:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



