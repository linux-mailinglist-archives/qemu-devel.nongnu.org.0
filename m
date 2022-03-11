Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1E24D6795
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 18:26:32 +0100 (CET)
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSj26-0006mr-S5
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 12:26:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSizZ-0004vo-Nu
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:23:53 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:39813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSizX-0000yN-Do
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=4JFPMhiCuH/TKFGibBm02vxpAkugH6oQjbSMlZNMkNE=; b=pXx9LOrs4wUOLGu06UpGdr5LBV
 sxmtbjdgYAdtcWSxSqpPpgrlU4iA9YdV3p1i0HL2iyATKbzUaMkwtlXY8KGXevCCPy61ZZ4mUoq7E
 YpcQ5wPtjXbAd92F6Zacw6t6c3hQlRUN1ozXPnQAKV3SIoekpS5dpA1Hhi0WdsYZH6oROM4zlGaRc
 +h+lGtFQ+olut3dGmGQz8YeVRO3+xAlH369k76sZjkkLw6H3q66F8Ca4+V2Nlj5pQswZ7N3AEoJ3y
 5OqHAMBxZOsYzp00rnoZVMPvRI4VUrn3Ix3eiZG79hC0K6MYVNsUtBwnuUsFsHvr2LkTbF6yIZkgG
 esf+TYho5U6LJSTDeMXL7gF9xvH0NsoQSY5iZciuTWwuJJIJCrJm7uPoiDPTBNxvNnY0yiqG+mfqB
 IxIxZHyGweMHJIeoe/s4byEmxm/cl5ln8SwiHYwQFwkw7ZsY8x2uX44tjdMw7TYA+VyS/k583Uvzw
 tW7/K3kakT0WiFlrjNpWBgXjvW7aDhg0uG8HP5t7dAK67+1qyr/rHiqLkPZdQiD/izpNILMnfxQFX
 BS/DHTu4lgSKAkPS6gIo+oeowQnJ24shU0TsyvXiyJJtPlaFI/lhCLw0+u7Zzt9CfcpIC8/dqgxAz
 p4pJk3TV5CQE7wicDQLMsGaT9SxKV2LJ21T98XqCc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/6] tests/9pfs: compare QIDs in fs_walk_none() test
Date: Fri, 11 Mar 2022 18:23:48 +0100
Message-ID: <14199773.npIleLrFe0@silver>
In-Reply-To: <20220311180236.3d1af56c@bahia>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <1807269.KYXYKYZXWi@silver> <20220311180236.3d1af56c@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
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

On Freitag, 11. M=E4rz 2022 18:02:36 CET Greg Kurz wrote:
> On Fri, 11 Mar 2022 17:39:56 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Freitag, 11. M=E4rz 2022 17:11:24 CET Greg Kurz wrote:
> > > On Thu, 10 Mar 2022 10:04:50 +0100
> > >=20
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > On Mittwoch, 9. M=E4rz 2022 15:49:04 CET Christian Schoenebeck wrot=
e:
> > > > > Extend previously added fs_walk_none() test by comparing the QID
> > > > > of the root fid with the QID of the cloned fid. They should be
> > > > > equal.
> > >=20
> > > Ha, I understand your suggestion of changing the name now :-) but I'll
> > > personally leave it named according to the test scenario of "sending
> > > a Twalk with no names" and checking everything that is expected in th=
is
> > > case.
> >=20
> > NP
> >=20
> > > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > > ---
> > > > >=20
> > > > >  tests/qtest/virtio-9p-test.c | 70
> > > > >  ++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 70 insertions(+)
> > > > >=20
> > > > > diff --git a/tests/qtest/virtio-9p-test.c
> > > > > b/tests/qtest/virtio-9p-test.c
> > > > > index 6c00da03f4..9098e21173 100644
> > > > > --- a/tests/qtest/virtio-9p-test.c
> > > > > +++ b/tests/qtest/virtio-9p-test.c
> > > > > @@ -146,6 +146,11 @@ static void v9fs_uint16_read(P9Req *req,
> > > > > uint16_t
> > > > > *val) le16_to_cpus(val);
> > > > >=20
> > > > >  }
> > > > >=20
> > > > > +static void v9fs_int16_read(P9Req *req, int16_t *val)
> > > > > +{
> > > > > +    v9fs_uint16_read(req, (uint16_t *)val);
> > > > > +}
> > > > > +
> > > > >=20
> > > > >  static void v9fs_uint32_write(P9Req *req, uint32_t val)
> > > > >  {
> > > > > =20
> > > > >      uint32_t le_val =3D cpu_to_le32(val);
> > > > >=20
> > > > > @@ -166,12 +171,22 @@ static void v9fs_uint32_read(P9Req *req,
> > > > > uint32_t
> > > > > *val) le32_to_cpus(val);
> > > > >=20
> > > > >  }
> > > > >=20
> > > > > +static void v9fs_int32_read(P9Req *req, int32_t *val)
> > > > > +{
> > > > > +    v9fs_uint32_read(req, (uint32_t *)val);
> > > > > +}
> > > > > +
> > > > >=20
> > > > >  static void v9fs_uint64_read(P9Req *req, uint64_t *val)
> > > > >  {
> > > > > =20
> > > > >      v9fs_memread(req, val, 8);
> > > > >      le64_to_cpus(val);
> > > > > =20
> > > > >  }
> > > > >=20
> > > > > +static void v9fs_int64_read(P9Req *req, int64_t *val)
> > > > > +{
> > > > > +    v9fs_uint64_read(req, (uint64_t *)val);
> > > > > +}
> > > > > +
> > > > >=20
> > > > >  /* len[2] string[len] */
> > > > >  static uint16_t v9fs_string_size(const char *string)
> > > > >  {
> > > > >=20
> > > > > @@ -425,6 +440,40 @@ static void v9fs_rwalk(P9Req *req, uint16_t
> > > > > *nwqid,
> > > > > v9fs_qid **wqid) v9fs_req_free(req);
> > > > >=20
> > > > >  }
> > > > >=20
> > > > > +/* size[4] Tstat tag[2] fid[4] */
> > > > > +static P9Req *v9fs_tstat(QVirtio9P *v9p, uint32_t fid, uint16_t
> > > > > tag)
> > >=20
> > > Tstat/Rstat aren't part of 9p2000.L, you should use Tgetattr/Rgetattr
> > > instead (see https://github.com/chaos/diod/blob/master/protocol.md).
> >=20
> > Ah right, I forgot.
> >=20
> > > > > +{
> > > > > +    P9Req *req;
> > > > > +
> > > > > +    req =3D v9fs_req_init(v9p, 4, P9_TSTAT, tag);
> > > > > +    v9fs_uint32_write(req, fid);
> > > > > +    v9fs_req_send(req);
> > > > > +    return req;
> > > > > +}
> > > > > +
> > > > > +/* size[4] Rstat tag[2] stat[n] */
> > > > > +static void v9fs_rstat(P9Req *req, struct V9fsStat *st)
> > > > > +{
> > > > > +    v9fs_req_recv(req, P9_RSTAT);
> > > > > +
> > >=20
> > > For the records, this is a stat[n], i.e. "n[2] followed by n bytes of
> > > data forming the parameter", so you should read an uint16_t first.
> > >=20
> > > > > +    v9fs_int16_read(req, &st->size);
> >=20
> > Which I did here? --^
>=20
> From the BUGS section of
> https://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor32 :
>=20
>      BUGS
>           To make the contents of a directory, such as returned by
>           read(5), easy to parse, each directory entry begins with a
>           size field.  For consistency, the entries in Twstat and
>           Rstat messages also contain their size, which means the size
>                                                                   ^^^^
>           appears twice.  For example, the Rstat message is formatted
>           ^^^^^^^^^^^^^
>           as ``(4+1+2+2+n)[4] Rstat tag[2] n[2] (n-2)[2] type[2]
>           dev[4]...,'' where n is the value returned by Styx->packdir.
>=20
> I realized that when giving a try to convert a v9fs_qid to a V9fsQID on
> top of this patch.

Ouch, what a trap. Yeah, I didn't realize that.

> > > > > +    v9fs_int16_read(req, &st->type);
> > > > > +    v9fs_int32_read(req, &st->dev);
> > > > > +    v9fs_uint8_read(req, &st->qid.type);
> > > > > +    v9fs_uint32_read(req, &st->qid.version);
> > > > > +    v9fs_uint64_read(req, &st->qid.path);
> > > > > +    v9fs_int32_read(req, &st->mode);
> > > > > +    v9fs_int32_read(req, &st->mtime);
> > > > > +    v9fs_int32_read(req, &st->atime);
> > > > > +    v9fs_int64_read(req, &st->length);
> > > > > +    v9fs_string_read(req, &st->name.size, &st->name.data);
> > > > > +    v9fs_string_read(req, &st->uid.size, &st->uid.data);
> > > > > +    v9fs_string_read(req, &st->gid.size, &st->gid.data);
> > > > > +    v9fs_string_read(req, &st->muid.size, &st->muid.data);
> > > > > +
> > > > > +    v9fs_req_free(req);
> > > > > +}
> > > > > +
> > > > >=20
> > > > >  /* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
> > > > >  static P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64=
_t
> > > > >  offset,
> > > > > =20
> > > > >                              uint32_t count, uint16_t tag)
> > > > >=20
> > > > > @@ -1009,6 +1058,8 @@ static void fs_walk_none(void *obj, void
> > > > > *data,
> > > > > QGuestAllocator *t_alloc) v9fs_qid root_qid;
> > > > >=20
> > > > >      g_autofree v9fs_qid *wqid =3D NULL;
> > > > >      P9Req *req;
> > > > >=20
> > > > > +    struct V9fsStat st[2];
> > > > > +    int i;
> > > > >=20
> > > > >      do_version(v9p);
> > > > >      req =3D v9fs_tattach(v9p, 0, getuid(), 0);
> > > > >=20
> > > > > @@ -1021,6 +1072,25 @@ static void fs_walk_none(void *obj, void
> > > > > *data,
> > > > > QGuestAllocator *t_alloc)
> > > > >=20
> > > > >      /* special case: no QID is returned if nwname=3D0 was sent */
> > > > >      g_assert(wqid =3D=3D NULL);
> > > > >=20
> > > > > +
> > > > > +    req =3D v9fs_tstat(v9p, 0, 0);
> > > > > +    v9fs_req_wait_for_reply(req, NULL);
> > > > > +    v9fs_rstat(req, &st[0]);
> > > >=20
> > > > Probably stat-ing the root fid (0) should happen before sending Twa=
lk,
> > > > to
> > > > better counter the 1st fid (0) having become potentially mutated?
> > >=20
> > > You already have the root qid from Rattach, no need to stat.
> >=20
> > Yes, this was about easy comparison with qid.version in mind, i.e. ...
> >=20
> > > > > +
> > > > > +    req =3D v9fs_tstat(v9p, 1, 0);
> > > > > +    v9fs_req_wait_for_reply(req, NULL);
> > > > > +    v9fs_rstat(req, &st[1]);
> > > > > +
> > > > > +    /* don't compare QID version for checking for file ID equaln=
ess
> > > > > */
> > > > > +    g_assert(st[0].qid.type =3D=3D st[1].qid.type);
> > > > > +    g_assert(st[0].qid.path =3D=3D st[1].qid.path);
> > > >=20
> > > > I could add a helper function is_same_qid() for this if desired.
> > >=20
> > > Rgetattr provides a qid[13] like Rattach. Since we control everything,
> > > the version bits won't change and I think is_same_qid() could be
> > > something as simple as:
> > >=20
> > > static inline bool is_same_qid(v9fs_qid qid1, v9fs_qid qid2)
> > > {
> > >=20
> > >     return memcmp(qid1, qid2, 13) =3D=3D 0;
> > >=20
> > > }
> >=20
> > Yes I know, the version definitely won't change with the synth driver. =
But
> > I thought to add code so it could be used for 'local' driver tests as
> > well in future.
>=20
> FWIW, even when using local, only an external cause could do that, which
> would mean that the test environment is compromised, no ?
>=20
> You can also ignore version and just compare the first byte and the 8 last
> ones.

OK, I'll come up with some more simple code (raw byte comparison) in the wa=
y=20
suggested by you. No big deal.

Thanks!

> > > > > +
> > > > > +    for (i =3D 0; i < 2; ++i) {
> > > > > +        g_free(st[i].name.data);
> > > > > +        g_free(st[i].uid.data);
> > > > > +        g_free(st[i].gid.data);
> > > > > +        g_free(st[i].muid.data);
> > > > > +    }
> > > >=20
> > > > I didn't find a more elegant way to do this cleanup.
> > >=20
> > > You won't need that with Tgetattr.
> > >=20
> > > > >  }
> > > > > =20
> > > > >  static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator
> > > > >  *t_alloc)



