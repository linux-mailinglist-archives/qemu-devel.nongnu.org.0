Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E781073FE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 15:20:48 +0100 (CET)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY9nk-0001GW-1S
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 09:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iY9m4-0000nD-Nr
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:19:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iY9ly-0006yD-Jt
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:19:02 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44180
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iY9lw-0006us-Lr
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574432333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bp1161RWv8mPdQRg7SmPAsJbHfLrL4NnfRTi78Ppykk=;
 b=XPVLyKWK7sxDN7Hp9BM+tUaNa46ebc3obyoTuV7uwKGQ3aExOzgCPXXIDd0TIvylj5hEUF
 JKyHx5s2jdlTUHYbg1tAbHbxOpt4f34Q7r6/2C6NmQLUYMxRAzCQ+bIvBdd7iuTAoLipCT
 /ZO6csrMp5L/ZsPcXIdre+UK0wcqtQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-F85LWm6rN36EOz_0GzdZ5A-1; Fri, 22 Nov 2019 09:18:51 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 185978C6C01
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 14:18:50 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 459571081314;
 Fri, 22 Nov 2019 14:18:39 +0000 (UTC)
Date: Fri, 22 Nov 2019 14:18:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtiofsd: fix libfuse information leaks
Message-ID: <20191122141837.GD2785@work-vm>
References: <20191122113130.481113-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191122113130.481113-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: F85LWm6rN36EOz_0GzdZ5A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> Some FUSE message replies contain padding fields that are not
> initialized by libfuse.  This is fine in traditional FUSE applications
> because the kernel is trusted.  virtiofsd does not trust the guest and
> must not expose uninitialized memory.
>=20
> Use C struct initializers to automatically zero out memory.  Not all of
> these code changes are strictly necessary but they will prevent future
> information leaks if the structs are extended.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks, merged.

Dave

> ---
>  contrib/virtiofsd/fuse_lowlevel.c | 150 +++++++++++++++---------------
>  1 file changed, 76 insertions(+), 74 deletions(-)
>=20
> diff --git a/contrib/virtiofsd/fuse_lowlevel.c b/contrib/virtiofsd/fuse_l=
owlevel.c
> index 7fa8861f5d..8a4234630d 100644
> --- a/contrib/virtiofsd/fuse_lowlevel.c
> +++ b/contrib/virtiofsd/fuse_lowlevel.c
> @@ -45,21 +45,23 @@ static __attribute__((constructor)) void fuse_ll_init=
_pagesize(void)
> =20
>  static void convert_stat(const struct stat *stbuf, struct fuse_attr *att=
r)
>  {
> -=09attr->ino=09=3D stbuf->st_ino;
> -=09attr->mode=09=3D stbuf->st_mode;
> -=09attr->nlink=09=3D stbuf->st_nlink;
> -=09attr->uid=09=3D stbuf->st_uid;
> -=09attr->gid=09=3D stbuf->st_gid;
> -=09attr->rdev=09=3D stbuf->st_rdev;
> -=09attr->size=09=3D stbuf->st_size;
> -=09attr->blksize=09=3D stbuf->st_blksize;
> -=09attr->blocks=09=3D stbuf->st_blocks;
> -=09attr->atime=09=3D stbuf->st_atime;
> -=09attr->mtime=09=3D stbuf->st_mtime;
> -=09attr->ctime=09=3D stbuf->st_ctime;
> -=09attr->atimensec =3D ST_ATIM_NSEC(stbuf);
> -=09attr->mtimensec =3D ST_MTIM_NSEC(stbuf);
> -=09attr->ctimensec =3D ST_CTIM_NSEC(stbuf);
> +=09*attr =3D (struct fuse_attr) {
> +=09=09.ino=09=09=3D stbuf->st_ino,
> +=09=09.mode=09=09=3D stbuf->st_mode,
> +=09=09.nlink=09=09=3D stbuf->st_nlink,
> +=09=09.uid=09=09=3D stbuf->st_uid,
> +=09=09.gid=09=09=3D stbuf->st_gid,
> +=09=09.rdev=09=09=3D stbuf->st_rdev,
> +=09=09.size=09=09=3D stbuf->st_size,
> +=09=09.blksize=09=3D stbuf->st_blksize,
> +=09=09.blocks=09=09=3D stbuf->st_blocks,
> +=09=09.atime=09=09=3D stbuf->st_atime,
> +=09=09.mtime=09=09=3D stbuf->st_mtime,
> +=09=09.ctime=09=09=3D stbuf->st_ctime,
> +=09=09.atimensec=09=3D ST_ATIM_NSEC(stbuf),
> +=09=09.mtimensec=09=3D ST_MTIM_NSEC(stbuf),
> +=09=09.ctimensec=09=3D ST_CTIM_NSEC(stbuf),
> +=09};
>  }
> =20
>  static void convert_attr(const struct fuse_setattr_in *attr, struct stat=
 *stbuf)
> @@ -181,16 +183,16 @@ static int fuse_send_msg(struct fuse_session *se, s=
truct fuse_chan *ch,
>  int fuse_send_reply_iov_nofree(fuse_req_t req, int error, struct iovec *=
iov,
>  =09=09=09       int count)
>  {
> -=09struct fuse_out_header out;
> +=09struct fuse_out_header out =3D {
> +=09=09.unique =3D req->unique,
> +=09=09.error =3D error,
> +=09};
> =20
>  =09if (error <=3D -1000 || error > 0) {
>  =09=09fuse_log(FUSE_LOG_ERR, "fuse: bad error value: %i\n",=09error);
>  =09=09error =3D -ERANGE;
>  =09}
> =20
> -=09out.unique =3D req->unique;
> -=09out.error =3D error;
> -
>  =09iov[0].iov_base =3D &out;
>  =09iov[0].iov_len =3D sizeof(struct fuse_out_header);
> =20
> @@ -271,14 +273,16 @@ size_t fuse_add_direntry(fuse_req_t req, char *buf,=
 size_t bufsize,
>  static void convert_statfs(const struct statvfs *stbuf,
>  =09=09=09   struct fuse_kstatfs *kstatfs)
>  {
> -=09kstatfs->bsize=09 =3D stbuf->f_bsize;
> -=09kstatfs->frsize=09 =3D stbuf->f_frsize;
> -=09kstatfs->blocks=09 =3D stbuf->f_blocks;
> -=09kstatfs->bfree=09 =3D stbuf->f_bfree;
> -=09kstatfs->bavail=09 =3D stbuf->f_bavail;
> -=09kstatfs->files=09 =3D stbuf->f_files;
> -=09kstatfs->ffree=09 =3D stbuf->f_ffree;
> -=09kstatfs->namelen =3D stbuf->f_namemax;
> +=09*kstatfs =3D (struct fuse_kstatfs) {
> +=09=09.bsize=09 =3D stbuf->f_bsize,
> +=09=09.frsize=09 =3D stbuf->f_frsize,
> +=09=09.blocks=09 =3D stbuf->f_blocks,
> +=09=09.bfree=09 =3D stbuf->f_bfree,
> +=09=09.bavail=09 =3D stbuf->f_bavail,
> +=09=09.files=09 =3D stbuf->f_files,
> +=09=09.ffree=09 =3D stbuf->f_ffree,
> +=09=09.namelen =3D stbuf->f_namemax,
> +=09};
>  }
> =20
>  static int send_reply_ok(fuse_req_t req, const void *arg, size_t argsize=
)
> @@ -320,12 +324,14 @@ static unsigned int calc_timeout_nsec(double t)
>  static void fill_entry(struct fuse_entry_out *arg,
>  =09=09       const struct fuse_entry_param *e)
>  {
> -=09arg->nodeid =3D e->ino;
> -=09arg->generation =3D e->generation;
> -=09arg->entry_valid =3D calc_timeout_sec(e->entry_timeout);
> -=09arg->entry_valid_nsec =3D calc_timeout_nsec(e->entry_timeout);
> -=09arg->attr_valid =3D calc_timeout_sec(e->attr_timeout);
> -=09arg->attr_valid_nsec =3D calc_timeout_nsec(e->attr_timeout);
> +=09*arg =3D (struct fuse_entry_out) {
> +=09=09.nodeid =3D e->ino,
> +=09=09.generation =3D e->generation,
> +=09=09.entry_valid =3D calc_timeout_sec(e->entry_timeout),
> +=09=09.entry_valid_nsec =3D calc_timeout_nsec(e->entry_timeout),
> +=09=09.attr_valid =3D calc_timeout_sec(e->attr_timeout),
> +=09=09.attr_valid_nsec =3D calc_timeout_nsec(e->attr_timeout),
> +=09};
>  =09convert_stat(&e->attr, &arg->attr);
>  }
> =20
> @@ -351,10 +357,12 @@ size_t fuse_add_direntry_plus(fuse_req_t req, char =
*buf, size_t bufsize,
>  =09fill_entry(&dp->entry_out, e);
> =20
>  =09struct fuse_dirent *dirent =3D &dp->dirent;
> -=09dirent->ino =3D e->attr.st_ino;
> -=09dirent->off =3D off;
> -=09dirent->namelen =3D namelen;
> -=09dirent->type =3D (e->attr.st_mode & S_IFMT) >> 12;
> +=09*dirent =3D (struct fuse_dirent) {
> +=09=09.ino =3D e->attr.st_ino,
> +=09=09.off =3D off,
> +=09=09.namelen =3D namelen,
> +=09=09.type =3D (e->attr.st_mode & S_IFMT) >> 12,
> +=09};
>  =09memcpy(dirent->name, name, namelen);
>  =09memset(dirent->name + namelen, 0, entlen_padded - entlen);
> =20
> @@ -504,15 +512,14 @@ int fuse_reply_data(fuse_req_t req, struct fuse_buf=
vec *bufv,
>  =09=09    enum fuse_buf_copy_flags flags)
>  {
>  =09struct iovec iov[2];
> -=09struct fuse_out_header out;
> +=09struct fuse_out_header out =3D {
> +=09=09.unique =3D req->unique,
> +=09};
>  =09int res;
> =20
>  =09iov[0].iov_base =3D &out;
>  =09iov[0].iov_len =3D sizeof(struct fuse_out_header);
> =20
> -=09out.unique =3D req->unique;
> -=09out.error =3D 0;
> -
>  =09res =3D fuse_send_data_iov(req->se, req->ch, iov, 1, bufv, flags);
>  =09if (res <=3D 0) {
>  =09=09fuse_free_req(req);
> @@ -2203,13 +2210,13 @@ static void do_destroy(fuse_req_t req, fuse_ino_t=
 nodeid,
>  static int send_notify_iov(struct fuse_session *se, int notify_code,
>  =09=09=09   struct iovec *iov, int count)
>  {
> -=09struct fuse_out_header out;
> +=09struct fuse_out_header out =3D {
> +=09=09.error =3D notify_code,
> +=09};
> =20
>  =09if (!se->got_init)
>  =09=09return -ENOTCONN;
> =20
> -=09out.unique =3D 0;
> -=09out.error =3D notify_code;
>  =09iov[0].iov_base =3D &out;
>  =09iov[0].iov_len =3D sizeof(struct fuse_out_header);
> =20
> @@ -2219,11 +2226,11 @@ static int send_notify_iov(struct fuse_session *s=
e, int notify_code,
>  int fuse_lowlevel_notify_poll(struct fuse_pollhandle *ph)
>  {
>  =09if (ph !=3D NULL) {
> -=09=09struct fuse_notify_poll_wakeup_out outarg;
> +=09=09struct fuse_notify_poll_wakeup_out outarg =3D {
> +=09=09=09.kh =3D ph->kh,
> +=09=09};
>  =09=09struct iovec iov[2];
> =20
> -=09=09outarg.kh =3D ph->kh;
> -
>  =09=09iov[1].iov_base =3D &outarg;
>  =09=09iov[1].iov_len =3D sizeof(outarg);
> =20
> @@ -2236,7 +2243,11 @@ int fuse_lowlevel_notify_poll(struct fuse_pollhand=
le *ph)
>  int fuse_lowlevel_notify_inval_inode(struct fuse_session *se, fuse_ino_t=
 ino,
>  =09=09=09=09     off_t off, off_t len)
>  {
> -=09struct fuse_notify_inval_inode_out outarg;
> +=09struct fuse_notify_inval_inode_out outarg =3D {
> +=09=09.ino =3D ino,
> +=09=09.off =3D off,
> +=09=09.len =3D len,
> +=09};
>  =09struct iovec iov[2];
> =20
>  =09if (!se)
> @@ -2244,10 +2255,6 @@ int fuse_lowlevel_notify_inval_inode(struct fuse_s=
ession *se, fuse_ino_t ino,
> =20
>  =09if (se->conn.proto_major < 6 || se->conn.proto_minor < 12)
>  =09=09return -ENOSYS;
> -=09
> -=09outarg.ino =3D ino;
> -=09outarg.off =3D off;
> -=09outarg.len =3D len;
> =20
>  =09iov[1].iov_base =3D &outarg;
>  =09iov[1].iov_len =3D sizeof(outarg);
> @@ -2258,7 +2265,10 @@ int fuse_lowlevel_notify_inval_inode(struct fuse_s=
ession *se, fuse_ino_t ino,
>  int fuse_lowlevel_notify_inval_entry(struct fuse_session *se, fuse_ino_t=
 parent,
>  =09=09=09=09     const char *name, size_t namelen)
>  {
> -=09struct fuse_notify_inval_entry_out outarg;
> +=09struct fuse_notify_inval_entry_out outarg =3D {
> +=09=09.parent =3D parent,
> +=09=09.namelen =3D namelen,
> +=09};
>  =09struct iovec iov[3];
> =20
>  =09if (!se)
> @@ -2267,10 +2277,6 @@ int fuse_lowlevel_notify_inval_entry(struct fuse_s=
ession *se, fuse_ino_t parent,
>  =09if (se->conn.proto_major < 6 || se->conn.proto_minor < 12)
>  =09=09return -ENOSYS;
> =20
> -=09outarg.parent =3D parent;
> -=09outarg.namelen =3D namelen;
> -=09outarg.padding =3D 0;
> -
>  =09iov[1].iov_base =3D &outarg;
>  =09iov[1].iov_len =3D sizeof(outarg);
>  =09iov[2].iov_base =3D (void *)name;
> @@ -2283,7 +2289,11 @@ int fuse_lowlevel_notify_delete(struct fuse_sessio=
n *se,
>  =09=09=09=09fuse_ino_t parent, fuse_ino_t child,
>  =09=09=09=09const char *name, size_t namelen)
>  {
> -=09struct fuse_notify_delete_out outarg;
> +=09struct fuse_notify_delete_out outarg =3D {
> +=09=09.parent =3D parent,
> +=09=09.child =3D child,
> +=09=09.namelen =3D namelen,
> +=09};
>  =09struct iovec iov[3];
> =20
>  =09if (!se)
> @@ -2292,11 +2302,6 @@ int fuse_lowlevel_notify_delete(struct fuse_sessio=
n *se,
>  =09if (se->conn.proto_major < 6 || se->conn.proto_minor < 18)
>  =09=09return -ENOSYS;
> =20
> -=09outarg.parent =3D parent;
> -=09outarg.child =3D child;
> -=09outarg.namelen =3D namelen;
> -=09outarg.padding =3D 0;
> -
>  =09iov[1].iov_base =3D &outarg;
>  =09iov[1].iov_len =3D sizeof(outarg);
>  =09iov[2].iov_base =3D (void *)name;
> @@ -2309,10 +2314,15 @@ int fuse_lowlevel_notify_store(struct fuse_sessio=
n *se, fuse_ino_t ino,
>  =09=09=09       off_t offset, struct fuse_bufvec *bufv,
>  =09=09=09       enum fuse_buf_copy_flags flags)
>  {
> -=09struct fuse_out_header out;
> -=09struct fuse_notify_store_out outarg;
> +=09struct fuse_out_header out =3D {
> +=09=09.error =3D FUSE_NOTIFY_STORE,
> +=09};
> +=09struct fuse_notify_store_out outarg =3D {
> +=09=09.nodeid =3D ino,
> +=09=09.offset =3D offset,
> +=09=09.size =3D fuse_buf_size(bufv),
> +=09};
>  =09struct iovec iov[3];
> -=09size_t size =3D fuse_buf_size(bufv);
>  =09int res;
> =20
>  =09if (!se)
> @@ -2321,14 +2331,6 @@ int fuse_lowlevel_notify_store(struct fuse_session=
 *se, fuse_ino_t ino,
>  =09if (se->conn.proto_major < 6 || se->conn.proto_minor < 15)
>  =09=09return -ENOSYS;
> =20
> -=09out.unique =3D 0;
> -=09out.error =3D FUSE_NOTIFY_STORE;
> -
> -=09outarg.nodeid =3D ino;
> -=09outarg.offset =3D offset;
> -=09outarg.size =3D size;
> -=09outarg.padding =3D 0;
> -
>  =09iov[0].iov_base =3D &out;
>  =09iov[0].iov_len =3D sizeof(out);
>  =09iov[1].iov_base =3D &outarg;
> --=20
> 2.23.0
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


