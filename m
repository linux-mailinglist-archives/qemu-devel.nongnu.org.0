Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FE645393F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 19:13:26 +0100 (CET)
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn2xR-0003eh-4T
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 13:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mn2wY-0002VF-HN
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 13:12:31 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:48071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mn2wW-0001zV-Fw
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 13:12:30 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-Bx-sL9WzPH6GwsNK7UZwgA-1; Tue, 16 Nov 2021 13:12:24 -0500
X-MC-Unique: Bx-sL9WzPH6GwsNK7UZwgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5B8F8799ED;
 Tue, 16 Nov 2021 18:12:23 +0000 (UTC)
Received: from bahia (unknown [10.39.192.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 039FD5D9DE;
 Tue, 16 Nov 2021 18:12:22 +0000 (UTC)
Date: Tue, 16 Nov 2021 19:12:21 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] tests/9pfs: use g_autofree where possible
Message-ID: <20211116191221.7a170501@bahia>
In-Reply-To: <E1mn1fA-0005qZ-TM@lizzy.crudebyte.com>
References: <E1mn1fA-0005qZ-TM@lizzy.crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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

On Tue, 16 Nov 2021 17:40:08 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Since g_autofree is scope based, I guess you could also convert this
snippet, that appears twice in the file BTW :

    for (int i =3D 0; i < QTEST_V9FS_SYNTH_READDIR_NFILES; ++i) {
        char *name =3D g_strdup_printf(QTEST_V9FS_SYNTH_READDIR_FILE, i);
        g_assert_cmpint(fs_dirents_contain_name(entries, name), =3D=3D, tru=
e);
        g_free(name);
    }

No big deal.

Reviewed-by: Greg Kurz <groug@kaod.org>

>  tests/qtest/virtio-9p-test.c | 86 +++++++++++-------------------------
>  1 file changed, 25 insertions(+), 61 deletions(-)
>=20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 41fed41de1..11861aaf7d 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -84,7 +84,7 @@ static void pci_config(void *obj, void *data, QGuestAll=
ocator *t_alloc)
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      size_t tag_len =3D qvirtio_config_readw(v9p->vdev, 0);
> -    char *tag;
> +    g_autofree char *tag =3D NULL;
>      int i;
> =20
>      g_assert_cmpint(tag_len, =3D=3D, strlen(MOUNT_TAG));
> @@ -94,7 +94,6 @@ static void pci_config(void *obj, void *data, QGuestAll=
ocator *t_alloc)
>          tag[i] =3D qvirtio_config_readb(v9p->vdev, i + 2);
>      }
>      g_assert_cmpmem(tag, tag_len, MOUNT_TAG, tag_len);
> -    g_free(tag);
>  }
> =20
>  #define P9_MAX_SIZE 4096 /* Max size of a T-message or R-message */
> @@ -580,7 +579,7 @@ static void do_version(QVirtio9P *v9p)
>  {
>      const char *version =3D "9P2000.L";
>      uint16_t server_len;
> -    char *server_version;
> +    g_autofree char *server_version =3D NULL;
>      P9Req *req;
> =20
>      req =3D v9fs_tversion(v9p, P9_MAX_SIZE, version, P9_NOTAG);
> @@ -588,8 +587,6 @@ static void do_version(QVirtio9P *v9p)
>      v9fs_rversion(req, &server_len, &server_version);
> =20
>      g_assert_cmpmem(server_version, server_len, version, strlen(version)=
);
> -
> -    g_free(server_version);
>  }
> =20
>  /* utility function: walk to requested dir and return fid for that dir *=
/
> @@ -637,7 +634,7 @@ static void fs_walk(void *obj, void *data, QGuestAllo=
cator *t_alloc)
>      alloc =3D t_alloc;
>      char *wnames[P9_MAXWELEM];
>      uint16_t nwqid;
> -    v9fs_qid *wqid;
> +    g_autofree v9fs_qid *wqid =3D NULL;
>      int i;
>      P9Req *req;
> =20
> @@ -655,8 +652,6 @@ static void fs_walk(void *obj, void *data, QGuestAllo=
cator *t_alloc)
>      for (i =3D 0; i < P9_MAXWELEM; i++) {
>          g_free(wnames[i]);
>      }
> -
> -    g_free(wqid);
>  }
> =20
>  static bool fs_dirents_contain_name(struct V9fsDirent *e, const char* na=
me)
> @@ -984,7 +979,8 @@ static void fs_walk_dotdot(void *obj, void *data, QGu=
estAllocator *t_alloc)
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      char *const wnames[] =3D { g_strdup("..") };
> -    v9fs_qid root_qid, *wqid;
> +    v9fs_qid root_qid;
> +    g_autofree v9fs_qid *wqid =3D NULL;
>      P9Req *req;
> =20
>      do_version(v9p);
> @@ -998,7 +994,6 @@ static void fs_walk_dotdot(void *obj, void *data, QGu=
estAllocator *t_alloc)
> =20
>      g_assert_cmpmem(&root_qid, 13, wqid[0], 13);
> =20
> -    g_free(wqid);
>      g_free(wnames[0]);
>  }
> =20
> @@ -1027,7 +1022,7 @@ static void fs_write(void *obj, void *data, QGuestA=
llocator *t_alloc)
>      alloc =3D t_alloc;
>      static const uint32_t write_count =3D P9_MAX_SIZE / 2;
>      char *const wnames[] =3D { g_strdup(QTEST_V9FS_SYNTH_WRITE_FILE) };
> -    char *buf =3D g_malloc0(write_count);
> +    g_autofree char *buf =3D g_malloc0(write_count);
>      uint32_t count;
>      P9Req *req;
> =20
> @@ -1045,7 +1040,6 @@ static void fs_write(void *obj, void *data, QGuestA=
llocator *t_alloc)
>      v9fs_rwrite(req, &count);
>      g_assert_cmpint(count, =3D=3D, write_count);
> =20
> -    g_free(buf);
>      g_free(wnames[0]);
>  }
> =20
> @@ -1125,7 +1119,7 @@ static void fs_flush_ignored(void *obj, void *data,=
 QGuestAllocator *t_alloc)
> =20
>  static void do_mkdir(QVirtio9P *v9p, const char *path, const char *cname=
)
>  {
> -    char *const name =3D g_strdup(cname);
> +    g_autofree char *name =3D g_strdup(cname);
>      uint32_t fid;
>      P9Req *req;
> =20
> @@ -1134,15 +1128,13 @@ static void do_mkdir(QVirtio9P *v9p, const char *=
path, const char *cname)
>      req =3D v9fs_tmkdir(v9p, fid, name, 0750, 0, 0);
>      v9fs_req_wait_for_reply(req, NULL);
>      v9fs_rmkdir(req, NULL);
> -
> -    g_free(name);
>  }
> =20
>  /* create a regular file with Tlcreate and return file's fid */
>  static uint32_t do_lcreate(QVirtio9P *v9p, const char *path,
>                             const char *cname)
>  {
> -    char *const name =3D g_strdup(cname);
> +    g_autofree char *name =3D g_strdup(cname);
>      uint32_t fid;
>      P9Req *req;
> =20
> @@ -1152,7 +1144,6 @@ static uint32_t do_lcreate(QVirtio9P *v9p, const ch=
ar *path,
>      v9fs_req_wait_for_reply(req, NULL);
>      v9fs_rlcreate(req, NULL, NULL);
> =20
> -    g_free(name);
>      return fid;
>  }
> =20
> @@ -1160,8 +1151,8 @@ static uint32_t do_lcreate(QVirtio9P *v9p, const ch=
ar *path,
>  static void do_symlink(QVirtio9P *v9p, const char *path, const char *cli=
nk,
>                         const char *to)
>  {
> -    char *const name =3D g_strdup(clink);
> -    char *const dst =3D g_strdup(to);
> +    g_autofree char *name =3D g_strdup(clink);
> +    g_autofree char *dst =3D g_strdup(to);
>      uint32_t fid;
>      P9Req *req;
> =20
> @@ -1170,9 +1161,6 @@ static void do_symlink(QVirtio9P *v9p, const char *=
path, const char *clink,
>      req =3D v9fs_tsymlink(v9p, fid, name, dst, 0, 0);
>      v9fs_req_wait_for_reply(req, NULL);
>      v9fs_rsymlink(req, NULL);
> -
> -    g_free(dst);
> -    g_free(name);
>  }
> =20
>  /* create a hard link named @a clink in directory @a path pointing to @a=
 to */
> @@ -1193,7 +1181,7 @@ static void do_hardlink(QVirtio9P *v9p, const char =
*path, const char *clink,
>  static void do_unlinkat(QVirtio9P *v9p, const char *atpath, const char *=
rpath,
>                          uint32_t flags)
>  {
> -    char *const name =3D g_strdup(rpath);
> +    g_autofree char *name =3D g_strdup(rpath);
>      uint32_t fid;
>      P9Req *req;
> =20
> @@ -1202,8 +1190,6 @@ static void do_unlinkat(QVirtio9P *v9p, const char =
*atpath, const char *rpath,
>      req =3D v9fs_tunlinkat(v9p, fid, name, flags, 0);
>      v9fs_req_wait_for_reply(req, NULL);
>      v9fs_runlinkat(req);
> -
> -    g_free(name);
>  }
> =20
>  static void fs_readdir_split_128(void *obj, void *data,
> @@ -1235,8 +1221,8 @@ static void fs_create_dir(void *obj, void *data, QG=
uestAllocator *t_alloc)
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      struct stat st;
> -    char *root_path =3D virtio_9p_test_path("");
> -    char *new_dir =3D virtio_9p_test_path("01");
> +    g_autofree char *root_path =3D virtio_9p_test_path("");
> +    g_autofree char *new_dir =3D virtio_9p_test_path("01");
> =20
>      g_assert(root_path !=3D NULL);
> =20
> @@ -1247,9 +1233,6 @@ static void fs_create_dir(void *obj, void *data, QG=
uestAllocator *t_alloc)
>      g_assert(stat(new_dir, &st) =3D=3D 0);
>      /* ... and is actually a directory */
>      g_assert((st.st_mode & S_IFMT) =3D=3D S_IFDIR);
> -
> -    g_free(new_dir);
> -    g_free(root_path);
>  }
> =20
>  static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_al=
loc)
> @@ -1257,8 +1240,8 @@ static void fs_unlinkat_dir(void *obj, void *data, =
QGuestAllocator *t_alloc)
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      struct stat st;
> -    char *root_path =3D virtio_9p_test_path("");
> -    char *new_dir =3D virtio_9p_test_path("02");
> +    g_autofree char *root_path =3D virtio_9p_test_path("");
> +    g_autofree char *new_dir =3D virtio_9p_test_path("02");
> =20
>      g_assert(root_path !=3D NULL);
> =20
> @@ -1273,9 +1256,6 @@ static void fs_unlinkat_dir(void *obj, void *data, =
QGuestAllocator *t_alloc)
>      do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
>      /* directory should be gone now */
>      g_assert(stat(new_dir, &st) !=3D 0);
> -
> -    g_free(new_dir);
> -    g_free(root_path);
>  }
> =20
>  static void fs_create_file(void *obj, void *data, QGuestAllocator *t_all=
oc)
> @@ -1283,7 +1263,7 @@ static void fs_create_file(void *obj, void *data, Q=
GuestAllocator *t_alloc)
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      struct stat st;
> -    char *new_file =3D virtio_9p_test_path("03/1st_file");
> +    g_autofree char *new_file =3D virtio_9p_test_path("03/1st_file");
> =20
>      do_attach(v9p);
>      do_mkdir(v9p, "/", "03");
> @@ -1293,8 +1273,6 @@ static void fs_create_file(void *obj, void *data, Q=
GuestAllocator *t_alloc)
>      g_assert(stat(new_file, &st) =3D=3D 0);
>      /* ... and is a regular file */
>      g_assert((st.st_mode & S_IFMT) =3D=3D S_IFREG);
> -
> -    g_free(new_file);
>  }
> =20
>  static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_a=
lloc)
> @@ -1302,7 +1280,7 @@ static void fs_unlinkat_file(void *obj, void *data,=
 QGuestAllocator *t_alloc)
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      struct stat st;
> -    char *new_file =3D virtio_9p_test_path("04/doa_file");
> +    g_autofree char *new_file =3D virtio_9p_test_path("04/doa_file");
> =20
>      do_attach(v9p);
>      do_mkdir(v9p, "/", "04");
> @@ -1316,8 +1294,6 @@ static void fs_unlinkat_file(void *obj, void *data,=
 QGuestAllocator *t_alloc)
>      do_unlinkat(v9p, "04", "doa_file", 0);
>      /* file should be gone now */
>      g_assert(stat(new_file, &st) !=3D 0);
> -
> -    g_free(new_file);
>  }
> =20
>  static void fs_symlink_file(void *obj, void *data, QGuestAllocator *t_al=
loc)
> @@ -1325,8 +1301,8 @@ static void fs_symlink_file(void *obj, void *data, =
QGuestAllocator *t_alloc)
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      struct stat st;
> -    char *real_file =3D virtio_9p_test_path("05/real_file");
> -    char *symlink_file =3D virtio_9p_test_path("05/symlink_file");
> +    g_autofree char *real_file =3D virtio_9p_test_path("05/real_file");
> +    g_autofree char *symlink_file =3D virtio_9p_test_path("05/symlink_fi=
le");
> =20
>      do_attach(v9p);
>      do_mkdir(v9p, "/", "05");
> @@ -1338,9 +1314,6 @@ static void fs_symlink_file(void *obj, void *data, =
QGuestAllocator *t_alloc)
> =20
>      /* check if created link exists now */
>      g_assert(stat(symlink_file, &st) =3D=3D 0);
> -
> -    g_free(symlink_file);
> -    g_free(real_file);
>  }
> =20
>  static void fs_unlinkat_symlink(void *obj, void *data,
> @@ -1349,8 +1322,8 @@ static void fs_unlinkat_symlink(void *obj, void *da=
ta,
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      struct stat st;
> -    char *real_file =3D virtio_9p_test_path("06/real_file");
> -    char *symlink_file =3D virtio_9p_test_path("06/symlink_file");
> +    g_autofree char *real_file =3D virtio_9p_test_path("06/real_file");
> +    g_autofree char *symlink_file =3D virtio_9p_test_path("06/symlink_fi=
le");
> =20
>      do_attach(v9p);
>      do_mkdir(v9p, "/", "06");
> @@ -1364,9 +1337,6 @@ static void fs_unlinkat_symlink(void *obj, void *da=
ta,
>      do_unlinkat(v9p, "06", "symlink_file", 0);
>      /* symlink should be gone now */
>      g_assert(stat(symlink_file, &st) !=3D 0);
> -
> -    g_free(symlink_file);
> -    g_free(real_file);
>  }
> =20
>  static void fs_hardlink_file(void *obj, void *data, QGuestAllocator *t_a=
lloc)
> @@ -1374,8 +1344,8 @@ static void fs_hardlink_file(void *obj, void *data,=
 QGuestAllocator *t_alloc)
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      struct stat st_real, st_link;
> -    char *real_file =3D virtio_9p_test_path("07/real_file");
> -    char *hardlink_file =3D virtio_9p_test_path("07/hardlink_file");
> +    g_autofree char *real_file =3D virtio_9p_test_path("07/real_file");
> +    g_autofree char *hardlink_file =3D virtio_9p_test_path("07/hardlink_=
file");
> =20
>      do_attach(v9p);
>      do_mkdir(v9p, "/", "07");
> @@ -1391,9 +1361,6 @@ static void fs_hardlink_file(void *obj, void *data,=
 QGuestAllocator *t_alloc)
>      g_assert((st_link.st_mode & S_IFMT) =3D=3D S_IFREG);
>      g_assert(st_link.st_dev =3D=3D st_real.st_dev);
>      g_assert(st_link.st_ino =3D=3D st_real.st_ino);
> -
> -    g_free(hardlink_file);
> -    g_free(real_file);
>  }
> =20
>  static void fs_unlinkat_hardlink(void *obj, void *data,
> @@ -1402,8 +1369,8 @@ static void fs_unlinkat_hardlink(void *obj, void *d=
ata,
>      QVirtio9P *v9p =3D obj;
>      alloc =3D t_alloc;
>      struct stat st_real, st_link;
> -    char *real_file =3D virtio_9p_test_path("08/real_file");
> -    char *hardlink_file =3D virtio_9p_test_path("08/hardlink_file");
> +    g_autofree char *real_file =3D virtio_9p_test_path("08/real_file");
> +    g_autofree char *hardlink_file =3D virtio_9p_test_path("08/hardlink_=
file");
> =20
>      do_attach(v9p);
>      do_mkdir(v9p, "/", "08");
> @@ -1419,9 +1386,6 @@ static void fs_unlinkat_hardlink(void *obj, void *d=
ata,
>      g_assert(stat(hardlink_file, &st_link) !=3D 0);
>      /* and old file should still exist */
>      g_assert(stat(real_file, &st_real) =3D=3D 0);
> -
> -    g_free(hardlink_file);
> -    g_free(real_file);
>  }
> =20
>  static void *assign_9p_local_driver(GString *cmd_line, void *arg)


