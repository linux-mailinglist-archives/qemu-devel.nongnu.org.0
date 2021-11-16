Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCFF453AB1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 21:09:37 +0100 (CET)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4ls-0008Ja-Jg
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 15:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mn4kh-0007bk-Iq
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:08:23 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:23231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mn4kf-0000Hr-9g
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:08:23 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-msfY_O94OGiY3rLgNEtQHA-1; Tue, 16 Nov 2021 15:08:18 -0500
X-MC-Unique: msfY_O94OGiY3rLgNEtQHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BD4E1006AA0;
 Tue, 16 Nov 2021 20:08:17 +0000 (UTC)
Received: from bahia (unknown [10.39.192.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 916AB5D6BA;
 Tue, 16 Nov 2021 20:08:16 +0000 (UTC)
Date: Tue, 16 Nov 2021 21:08:14 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] tests/9pfs: use g_autofree where possible
Message-ID: <20211116210814.74cb585c@bahia>
In-Reply-To: <1863782.ycR9oMG01i@silver>
References: <E1mn1fA-0005qZ-TM@lizzy.crudebyte.com>
 <20211116191221.7a170501@bahia> <1863782.ycR9oMG01i@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Tue, 16 Nov 2021 20:59:32 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 16. November 2021 19:12:21 CET Greg Kurz wrote:
> > On Tue, 16 Nov 2021 17:40:08 +0100
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> >=20
> > Since g_autofree is scope based, I guess you could also convert this
> > snippet, that appears twice in the file BTW :
> >=20
> >     for (int i =3D 0; i < QTEST_V9FS_SYNTH_READDIR_NFILES; ++i) {
> >         char *name =3D g_strdup_printf(QTEST_V9FS_SYNTH_READDIR_FILE, i=
);
> >         g_assert_cmpint(fs_dirents_contain_name(entries, name), =3D=3D,=
 true);
> >         g_free(name);
> >     }
> >=20
> > No big deal.
>=20
> Ah, that slipped through as I was misreading it as an array free.
>=20
> If you don't mind I just add this on my end without sending a v2, it is=
=20
> trivial enough I think.
>=20

Sure ! And keep the R-b of course :-)

Cheers,

--
Greg

> > Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> Thanks!
>=20
> > >  tests/qtest/virtio-9p-test.c | 86 +++++++++++-----------------------=
--
> > >  1 file changed, 25 insertions(+), 61 deletions(-)
> > >=20
> > > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-tes=
t.c
> > > index 41fed41de1..11861aaf7d 100644
> > > --- a/tests/qtest/virtio-9p-test.c
> > > +++ b/tests/qtest/virtio-9p-test.c
> > > @@ -84,7 +84,7 @@ static void pci_config(void *obj, void *data,
> > > QGuestAllocator *t_alloc)>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      size_t tag_len =3D qvirtio_config_readw(v9p->vdev, 0);
> > >=20
> > > -    char *tag;
> > > +    g_autofree char *tag =3D NULL;
> > >=20
> > >      int i;
> > >     =20
> > >      g_assert_cmpint(tag_len, =3D=3D, strlen(MOUNT_TAG));
> > >=20
> > > @@ -94,7 +94,6 @@ static void pci_config(void *obj, void *data,
> > > QGuestAllocator *t_alloc)>=20
> > >          tag[i] =3D qvirtio_config_readb(v9p->vdev, i + 2);
> > >     =20
> > >      }
> > >      g_assert_cmpmem(tag, tag_len, MOUNT_TAG, tag_len);
> > >=20
> > > -    g_free(tag);
> > >=20
> > >  }
> > > =20
> > >  #define P9_MAX_SIZE 4096 /* Max size of a T-message or R-message */
> > >=20
> > > @@ -580,7 +579,7 @@ static void do_version(QVirtio9P *v9p)
> > >=20
> > >  {
> > > =20
> > >      const char *version =3D "9P2000.L";
> > >      uint16_t server_len;
> > >=20
> > > -    char *server_version;
> > > +    g_autofree char *server_version =3D NULL;
> > >=20
> > >      P9Req *req;
> > >     =20
> > >      req =3D v9fs_tversion(v9p, P9_MAX_SIZE, version, P9_NOTAG);
> > >=20
> > > @@ -588,8 +587,6 @@ static void do_version(QVirtio9P *v9p)
> > >=20
> > >      v9fs_rversion(req, &server_len, &server_version);
> > >     =20
> > >      g_assert_cmpmem(server_version, server_len, version,
> > >      strlen(version));
> > >=20
> > > -
> > > -    g_free(server_version);
> > >=20
> > >  }
> > > =20
> > >  /* utility function: walk to requested dir and return fid for that d=
ir */
> > >=20
> > > @@ -637,7 +634,7 @@ static void fs_walk(void *obj, void *data,
> > > QGuestAllocator *t_alloc)>=20
> > >      alloc =3D t_alloc;
> > >      char *wnames[P9_MAXWELEM];
> > >      uint16_t nwqid;
> > >=20
> > > -    v9fs_qid *wqid;
> > > +    g_autofree v9fs_qid *wqid =3D NULL;
> > >=20
> > >      int i;
> > >      P9Req *req;
> > >=20
> > > @@ -655,8 +652,6 @@ static void fs_walk(void *obj, void *data,
> > > QGuestAllocator *t_alloc)>=20
> > >      for (i =3D 0; i < P9_MAXWELEM; i++) {
> > >     =20
> > >          g_free(wnames[i]);
> > >     =20
> > >      }
> > >=20
> > > -
> > > -    g_free(wqid);
> > >=20
> > >  }
> > > =20
> > >  static bool fs_dirents_contain_name(struct V9fsDirent *e, const char=
*
> > >  name)
> > >=20
> > > @@ -984,7 +979,8 @@ static void fs_walk_dotdot(void *obj, void *data,
> > > QGuestAllocator *t_alloc)>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      char *const wnames[] =3D { g_strdup("..") };
> > >=20
> > > -    v9fs_qid root_qid, *wqid;
> > > +    v9fs_qid root_qid;
> > > +    g_autofree v9fs_qid *wqid =3D NULL;
> > >=20
> > >      P9Req *req;
> > >     =20
> > >      do_version(v9p);
> > >=20
> > > @@ -998,7 +994,6 @@ static void fs_walk_dotdot(void *obj, void *data,
> > > QGuestAllocator *t_alloc)>=20
> > >      g_assert_cmpmem(&root_qid, 13, wqid[0], 13);
> > >=20
> > > -    g_free(wqid);
> > >=20
> > >      g_free(wnames[0]);
> > > =20
> > >  }
> > >=20
> > > @@ -1027,7 +1022,7 @@ static void fs_write(void *obj, void *data,
> > > QGuestAllocator *t_alloc)>=20
> > >      alloc =3D t_alloc;
> > >      static const uint32_t write_count =3D P9_MAX_SIZE / 2;
> > >      char *const wnames[] =3D { g_strdup(QTEST_V9FS_SYNTH_WRITE_FILE)=
 };
> > >=20
> > > -    char *buf =3D g_malloc0(write_count);
> > > +    g_autofree char *buf =3D g_malloc0(write_count);
> > >=20
> > >      uint32_t count;
> > >      P9Req *req;
> > >=20
> > > @@ -1045,7 +1040,6 @@ static void fs_write(void *obj, void *data,
> > > QGuestAllocator *t_alloc)>=20
> > >      v9fs_rwrite(req, &count);
> > >      g_assert_cmpint(count, =3D=3D, write_count);
> > >=20
> > > -    g_free(buf);
> > >=20
> > >      g_free(wnames[0]);
> > > =20
> > >  }
> > >=20
> > > @@ -1125,7 +1119,7 @@ static void fs_flush_ignored(void *obj, void *d=
ata,
> > > QGuestAllocator *t_alloc)>=20
> > >  static void do_mkdir(QVirtio9P *v9p, const char *path, const char *c=
name)
> > >  {
> > >=20
> > > -    char *const name =3D g_strdup(cname);
> > > +    g_autofree char *name =3D g_strdup(cname);
> > >=20
> > >      uint32_t fid;
> > >      P9Req *req;
> > >=20
> > > @@ -1134,15 +1128,13 @@ static void do_mkdir(QVirtio9P *v9p, const ch=
ar
> > > *path, const char *cname)>=20
> > >      req =3D v9fs_tmkdir(v9p, fid, name, 0750, 0, 0);
> > >      v9fs_req_wait_for_reply(req, NULL);
> > >      v9fs_rmkdir(req, NULL);
> > >=20
> > > -
> > > -    g_free(name);
> > >=20
> > >  }
> > > =20
> > >  /* create a regular file with Tlcreate and return file's fid */
> > >  static uint32_t do_lcreate(QVirtio9P *v9p, const char *path,
> > > =20
> > >                             const char *cname)
> > > =20
> > >  {
> > >=20
> > > -    char *const name =3D g_strdup(cname);
> > > +    g_autofree char *name =3D g_strdup(cname);
> > >=20
> > >      uint32_t fid;
> > >      P9Req *req;
> > >=20
> > > @@ -1152,7 +1144,6 @@ static uint32_t do_lcreate(QVirtio9P *v9p, cons=
t
> > > char *path,>=20
> > >      v9fs_req_wait_for_reply(req, NULL);
> > >      v9fs_rlcreate(req, NULL, NULL);
> > >=20
> > > -    g_free(name);
> > >=20
> > >      return fid;
> > > =20
> > >  }
> > >=20
> > > @@ -1160,8 +1151,8 @@ static uint32_t do_lcreate(QVirtio9P *v9p, cons=
t
> > > char *path,>=20
> > >  static void do_symlink(QVirtio9P *v9p, const char *path, const char
> > >  *clink,
> > > =20
> > >                         const char *to)
> > > =20
> > >  {
> > >=20
> > > -    char *const name =3D g_strdup(clink);
> > > -    char *const dst =3D g_strdup(to);
> > > +    g_autofree char *name =3D g_strdup(clink);
> > > +    g_autofree char *dst =3D g_strdup(to);
> > >=20
> > >      uint32_t fid;
> > >      P9Req *req;
> > >=20
> > > @@ -1170,9 +1161,6 @@ static void do_symlink(QVirtio9P *v9p, const ch=
ar
> > > *path, const char *clink,>=20
> > >      req =3D v9fs_tsymlink(v9p, fid, name, dst, 0, 0);
> > >      v9fs_req_wait_for_reply(req, NULL);
> > >      v9fs_rsymlink(req, NULL);
> > >=20
> > > -
> > > -    g_free(dst);
> > > -    g_free(name);
> > >=20
> > >  }
> > > =20
> > >  /* create a hard link named @a clink in directory @a path pointing t=
o @a
> > >  to */>=20
> > > @@ -1193,7 +1181,7 @@ static void do_hardlink(QVirtio9P *v9p, const c=
har
> > > *path, const char *clink,>=20
> > >  static void do_unlinkat(QVirtio9P *v9p, const char *atpath, const ch=
ar
> > >  *rpath,> =20
> > >                          uint32_t flags)
> > > =20
> > >  {
> > >=20
> > > -    char *const name =3D g_strdup(rpath);
> > > +    g_autofree char *name =3D g_strdup(rpath);
> > >=20
> > >      uint32_t fid;
> > >      P9Req *req;
> > >=20
> > > @@ -1202,8 +1190,6 @@ static void do_unlinkat(QVirtio9P *v9p, const c=
har
> > > *atpath, const char *rpath,>=20
> > >      req =3D v9fs_tunlinkat(v9p, fid, name, flags, 0);
> > >      v9fs_req_wait_for_reply(req, NULL);
> > >      v9fs_runlinkat(req);
> > >=20
> > > -
> > > -    g_free(name);
> > >=20
> > >  }
> > > =20
> > >  static void fs_readdir_split_128(void *obj, void *data,
> > >=20
> > > @@ -1235,8 +1221,8 @@ static void fs_create_dir(void *obj, void *data=
,
> > > QGuestAllocator *t_alloc)>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      struct stat st;
> > >=20
> > > -    char *root_path =3D virtio_9p_test_path("");
> > > -    char *new_dir =3D virtio_9p_test_path("01");
> > > +    g_autofree char *root_path =3D virtio_9p_test_path("");
> > > +    g_autofree char *new_dir =3D virtio_9p_test_path("01");
> > >=20
> > >      g_assert(root_path !=3D NULL);
> > >=20
> > > @@ -1247,9 +1233,6 @@ static void fs_create_dir(void *obj, void *data=
,
> > > QGuestAllocator *t_alloc)>=20
> > >      g_assert(stat(new_dir, &st) =3D=3D 0);
> > >      /* ... and is actually a directory */
> > >      g_assert((st.st_mode & S_IFMT) =3D=3D S_IFDIR);
> > >=20
> > > -
> > > -    g_free(new_dir);
> > > -    g_free(root_path);
> > >=20
> > >  }
> > > =20
> > >  static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator
> > >  *t_alloc)>=20
> > > @@ -1257,8 +1240,8 @@ static void fs_unlinkat_dir(void *obj, void *da=
ta,
> > > QGuestAllocator *t_alloc)>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      struct stat st;
> > >=20
> > > -    char *root_path =3D virtio_9p_test_path("");
> > > -    char *new_dir =3D virtio_9p_test_path("02");
> > > +    g_autofree char *root_path =3D virtio_9p_test_path("");
> > > +    g_autofree char *new_dir =3D virtio_9p_test_path("02");
> > >=20
> > >      g_assert(root_path !=3D NULL);
> > >=20
> > > @@ -1273,9 +1256,6 @@ static void fs_unlinkat_dir(void *obj, void *da=
ta,
> > > QGuestAllocator *t_alloc)>=20
> > >      do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
> > >      /* directory should be gone now */
> > >      g_assert(stat(new_dir, &st) !=3D 0);
> > >=20
> > > -
> > > -    g_free(new_dir);
> > > -    g_free(root_path);
> > >=20
> > >  }
> > > =20
> > >  static void fs_create_file(void *obj, void *data, QGuestAllocator
> > >  *t_alloc)
> > >=20
> > > @@ -1283,7 +1263,7 @@ static void fs_create_file(void *obj, void *dat=
a,
> > > QGuestAllocator *t_alloc)>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      struct stat st;
> > >=20
> > > -    char *new_file =3D virtio_9p_test_path("03/1st_file");
> > > +    g_autofree char *new_file =3D virtio_9p_test_path("03/1st_file")=
;
> > >=20
> > >      do_attach(v9p);
> > >      do_mkdir(v9p, "/", "03");
> > >=20
> > > @@ -1293,8 +1273,6 @@ static void fs_create_file(void *obj, void *dat=
a,
> > > QGuestAllocator *t_alloc)>=20
> > >      g_assert(stat(new_file, &st) =3D=3D 0);
> > >      /* ... and is a regular file */
> > >      g_assert((st.st_mode & S_IFMT) =3D=3D S_IFREG);
> > >=20
> > > -
> > > -    g_free(new_file);
> > >=20
> > >  }
> > > =20
> > >  static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator
> > >  *t_alloc)>=20
> > > @@ -1302,7 +1280,7 @@ static void fs_unlinkat_file(void *obj, void *d=
ata,
> > > QGuestAllocator *t_alloc)>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      struct stat st;
> > >=20
> > > -    char *new_file =3D virtio_9p_test_path("04/doa_file");
> > > +    g_autofree char *new_file =3D virtio_9p_test_path("04/doa_file")=
;
> > >=20
> > >      do_attach(v9p);
> > >      do_mkdir(v9p, "/", "04");
> > >=20
> > > @@ -1316,8 +1294,6 @@ static void fs_unlinkat_file(void *obj, void *d=
ata,
> > > QGuestAllocator *t_alloc)>=20
> > >      do_unlinkat(v9p, "04", "doa_file", 0);
> > >      /* file should be gone now */
> > >      g_assert(stat(new_file, &st) !=3D 0);
> > >=20
> > > -
> > > -    g_free(new_file);
> > >=20
> > >  }
> > > =20
> > >  static void fs_symlink_file(void *obj, void *data, QGuestAllocator
> > >  *t_alloc)>=20
> > > @@ -1325,8 +1301,8 @@ static void fs_symlink_file(void *obj, void *da=
ta,
> > > QGuestAllocator *t_alloc)>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      struct stat st;
> > >=20
> > > -    char *real_file =3D virtio_9p_test_path("05/real_file");
> > > -    char *symlink_file =3D virtio_9p_test_path("05/symlink_file");
> > > +    g_autofree char *real_file =3D virtio_9p_test_path("05/real_file=
");
> > > +    g_autofree char *symlink_file =3D
> > > virtio_9p_test_path("05/symlink_file");>=20
> > >      do_attach(v9p);
> > >      do_mkdir(v9p, "/", "05");
> > >=20
> > > @@ -1338,9 +1314,6 @@ static void fs_symlink_file(void *obj, void *da=
ta,
> > > QGuestAllocator *t_alloc)>=20
> > >      /* check if created link exists now */
> > >      g_assert(stat(symlink_file, &st) =3D=3D 0);
> > >=20
> > > -
> > > -    g_free(symlink_file);
> > > -    g_free(real_file);
> > >=20
> > >  }
> > > =20
> > >  static void fs_unlinkat_symlink(void *obj, void *data,
> > >=20
> > > @@ -1349,8 +1322,8 @@ static void fs_unlinkat_symlink(void *obj, void
> > > *data,>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      struct stat st;
> > >=20
> > > -    char *real_file =3D virtio_9p_test_path("06/real_file");
> > > -    char *symlink_file =3D virtio_9p_test_path("06/symlink_file");
> > > +    g_autofree char *real_file =3D virtio_9p_test_path("06/real_file=
");
> > > +    g_autofree char *symlink_file =3D
> > > virtio_9p_test_path("06/symlink_file");>=20
> > >      do_attach(v9p);
> > >      do_mkdir(v9p, "/", "06");
> > >=20
> > > @@ -1364,9 +1337,6 @@ static void fs_unlinkat_symlink(void *obj, void
> > > *data,>=20
> > >      do_unlinkat(v9p, "06", "symlink_file", 0);
> > >      /* symlink should be gone now */
> > >      g_assert(stat(symlink_file, &st) !=3D 0);
> > >=20
> > > -
> > > -    g_free(symlink_file);
> > > -    g_free(real_file);
> > >=20
> > >  }
> > > =20
> > >  static void fs_hardlink_file(void *obj, void *data, QGuestAllocator
> > >  *t_alloc)>=20
> > > @@ -1374,8 +1344,8 @@ static void fs_hardlink_file(void *obj, void *d=
ata,
> > > QGuestAllocator *t_alloc)>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      struct stat st_real, st_link;
> > >=20
> > > -    char *real_file =3D virtio_9p_test_path("07/real_file");
> > > -    char *hardlink_file =3D virtio_9p_test_path("07/hardlink_file");
> > > +    g_autofree char *real_file =3D virtio_9p_test_path("07/real_file=
");
> > > +    g_autofree char *hardlink_file =3D
> > > virtio_9p_test_path("07/hardlink_file");>=20
> > >      do_attach(v9p);
> > >      do_mkdir(v9p, "/", "07");
> > >=20
> > > @@ -1391,9 +1361,6 @@ static void fs_hardlink_file(void *obj, void *d=
ata,
> > > QGuestAllocator *t_alloc)>=20
> > >      g_assert((st_link.st_mode & S_IFMT) =3D=3D S_IFREG);
> > >      g_assert(st_link.st_dev =3D=3D st_real.st_dev);
> > >      g_assert(st_link.st_ino =3D=3D st_real.st_ino);
> > >=20
> > > -
> > > -    g_free(hardlink_file);
> > > -    g_free(real_file);
> > >=20
> > >  }
> > > =20
> > >  static void fs_unlinkat_hardlink(void *obj, void *data,
> > >=20
> > > @@ -1402,8 +1369,8 @@ static void fs_unlinkat_hardlink(void *obj, voi=
d
> > > *data,>=20
> > >      QVirtio9P *v9p =3D obj;
> > >      alloc =3D t_alloc;
> > >      struct stat st_real, st_link;
> > >=20
> > > -    char *real_file =3D virtio_9p_test_path("08/real_file");
> > > -    char *hardlink_file =3D virtio_9p_test_path("08/hardlink_file");
> > > +    g_autofree char *real_file =3D virtio_9p_test_path("08/real_file=
");
> > > +    g_autofree char *hardlink_file =3D
> > > virtio_9p_test_path("08/hardlink_file");>=20
> > >      do_attach(v9p);
> > >      do_mkdir(v9p, "/", "08");
> > >=20
> > > @@ -1419,9 +1386,6 @@ static void fs_unlinkat_hardlink(void *obj, voi=
d
> > > *data,>=20
> > >      g_assert(stat(hardlink_file, &st_link) !=3D 0);
> > >      /* and old file should still exist */
> > >      g_assert(stat(real_file, &st_real) =3D=3D 0);
> > >=20
> > > -
> > > -    g_free(hardlink_file);
> > > -    g_free(real_file);
> > >=20
> > >  }
> > > =20
> > >  static void *assign_9p_local_driver(GString *cmd_line, void *arg)
>=20
>=20


