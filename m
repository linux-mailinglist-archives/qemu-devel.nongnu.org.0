Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E6C4D65D1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 17:12:25 +0100 (CET)
Received: from localhost ([::1]:38214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nShsM-0002T5-7E
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 11:12:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nShrZ-0001nr-Eq
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:11:33 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:22979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nShrX-0000lo-Bn
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:11:33 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-uQXJZxYdPkWB63Tpt9pCTg-1; Fri, 11 Mar 2022 11:11:27 -0500
X-MC-Unique: uQXJZxYdPkWB63Tpt9pCTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FEE61854E21;
 Fri, 11 Mar 2022 16:11:26 +0000 (UTC)
Received: from bahia (unknown [10.39.192.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE6EB1073038;
 Fri, 11 Mar 2022 16:11:25 +0000 (UTC)
Date: Fri, 11 Mar 2022 17:11:24 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 3/6] tests/9pfs: compare QIDs in fs_walk_none() test
Message-ID: <20220311171124.4197a7fd@bahia>
In-Reply-To: <16470725.T4W6l4s3Qp@silver>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <699dea34f26b6f60746a16a35748b65d76515f1a.1646850707.git.qemu_oss@crudebyte.com>
 <16470725.T4W6l4s3Qp@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 10:04:50 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 9. M=C3=A4rz 2022 15:49:04 CET Christian Schoenebeck wrote:
> > Extend previously added fs_walk_none() test by comparing the QID
> > of the root fid with the QID of the cloned fid. They should be
> > equal.
> >=20

Ha, I understand your suggestion of changing the name now :-) but I'll
personally leave it named according to the test scenario of "sending
a Twalk with no names" and checking everything that is expected in this
case.

> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >  tests/qtest/virtio-9p-test.c | 70 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >=20
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.=
c
> > index 6c00da03f4..9098e21173 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -146,6 +146,11 @@ static void v9fs_uint16_read(P9Req *req, uint16_t =
*val)
> > le16_to_cpus(val);
> >  }
> >=20
> > +static void v9fs_int16_read(P9Req *req, int16_t *val)
> > +{
> > +    v9fs_uint16_read(req, (uint16_t *)val);
> > +}
> > +
> >  static void v9fs_uint32_write(P9Req *req, uint32_t val)
> >  {
> >      uint32_t le_val =3D cpu_to_le32(val);
> > @@ -166,12 +171,22 @@ static void v9fs_uint32_read(P9Req *req, uint32_t
> > *val) le32_to_cpus(val);
> >  }
> >=20
> > +static void v9fs_int32_read(P9Req *req, int32_t *val)
> > +{
> > +    v9fs_uint32_read(req, (uint32_t *)val);
> > +}
> > +
> >  static void v9fs_uint64_read(P9Req *req, uint64_t *val)
> >  {
> >      v9fs_memread(req, val, 8);
> >      le64_to_cpus(val);
> >  }
> >=20
> > +static void v9fs_int64_read(P9Req *req, int64_t *val)
> > +{
> > +    v9fs_uint64_read(req, (uint64_t *)val);
> > +}
> > +
> >  /* len[2] string[len] */
> >  static uint16_t v9fs_string_size(const char *string)
> >  {
> > @@ -425,6 +440,40 @@ static void v9fs_rwalk(P9Req *req, uint16_t *nwqid=
,
> > v9fs_qid **wqid) v9fs_req_free(req);
> >  }
> >=20
> > +/* size[4] Tstat tag[2] fid[4] */
> > +static P9Req *v9fs_tstat(QVirtio9P *v9p, uint32_t fid, uint16_t tag)

Tstat/Rstat aren't part of 9p2000.L, you should use Tgetattr/Rgetattr
instead (see https://github.com/chaos/diod/blob/master/protocol.md).

> > +{
> > +    P9Req *req;
> > +
> > +    req =3D v9fs_req_init(v9p, 4, P9_TSTAT, tag);
> > +    v9fs_uint32_write(req, fid);
> > +    v9fs_req_send(req);
> > +    return req;
> > +}
> > +
> > +/* size[4] Rstat tag[2] stat[n] */
> > +static void v9fs_rstat(P9Req *req, struct V9fsStat *st)
> > +{
> > +    v9fs_req_recv(req, P9_RSTAT);
> > +

For the records, this is a stat[n], i.e. "n[2] followed by n bytes of
data forming the parameter", so you should read an uint16_t first.

> > +    v9fs_int16_read(req, &st->size);
> > +    v9fs_int16_read(req, &st->type);
> > +    v9fs_int32_read(req, &st->dev);
> > +    v9fs_uint8_read(req, &st->qid.type);
> > +    v9fs_uint32_read(req, &st->qid.version);
> > +    v9fs_uint64_read(req, &st->qid.path);
> > +    v9fs_int32_read(req, &st->mode);
> > +    v9fs_int32_read(req, &st->mtime);
> > +    v9fs_int32_read(req, &st->atime);
> > +    v9fs_int64_read(req, &st->length);
> > +    v9fs_string_read(req, &st->name.size, &st->name.data);
> > +    v9fs_string_read(req, &st->uid.size, &st->uid.data);
> > +    v9fs_string_read(req, &st->gid.size, &st->gid.data);
> > +    v9fs_string_read(req, &st->muid.size, &st->muid.data);
> > +
> > +    v9fs_req_free(req);
> > +}
> > +
> >  /* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
> >  static P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t off=
set,
> >                              uint32_t count, uint16_t tag)
> > @@ -1009,6 +1058,8 @@ static void fs_walk_none(void *obj, void *data,
> > QGuestAllocator *t_alloc) v9fs_qid root_qid;
> >      g_autofree v9fs_qid *wqid =3D NULL;
> >      P9Req *req;
> > +    struct V9fsStat st[2];
> > +    int i;
> >=20
> >      do_version(v9p);
> >      req =3D v9fs_tattach(v9p, 0, getuid(), 0);
> > @@ -1021,6 +1072,25 @@ static void fs_walk_none(void *obj, void *data,
> > QGuestAllocator *t_alloc)
> >=20
> >      /* special case: no QID is returned if nwname=3D0 was sent */
> >      g_assert(wqid =3D=3D NULL);
> > +
> > +    req =3D v9fs_tstat(v9p, 0, 0);
> > +    v9fs_req_wait_for_reply(req, NULL);
> > +    v9fs_rstat(req, &st[0]);
>=20
> Probably stat-ing the root fid (0) should happen before sending Twalk, to=
=20
> better counter the 1st fid (0) having become potentially mutated?
>=20

You already have the root qid from Rattach, no need to stat.

> > +
> > +    req =3D v9fs_tstat(v9p, 1, 0);
> > +    v9fs_req_wait_for_reply(req, NULL);
> > +    v9fs_rstat(req, &st[1]);
> > +
> > +    /* don't compare QID version for checking for file ID equalness */
> > +    g_assert(st[0].qid.type =3D=3D st[1].qid.type);
> > +    g_assert(st[0].qid.path =3D=3D st[1].qid.path);
>=20
> I could add a helper function is_same_qid() for this if desired.
>=20

Rgetattr provides a qid[13] like Rattach. Since we control everything,
the version bits won't change and I think is_same_qid() could be
something as simple as:

static inline bool is_same_qid(v9fs_qid qid1, v9fs_qid qid2)
{
    return memcmp(qid1, qid2, 13) =3D=3D 0;
}

> > +
> > +    for (i =3D 0; i < 2; ++i) {
> > +        g_free(st[i].name.data);
> > +        g_free(st[i].uid.data);
> > +        g_free(st[i].gid.data);
> > +        g_free(st[i].muid.data);
> > +    }
>=20
> I didn't find a more elegant way to do this cleanup.
>=20

You won't need that with Tgetattr.
=20
> >  }
> >=20
> >  static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_a=
lloc)
>=20
>=20


