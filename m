Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD5689C0D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:41:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxFH-00042F-3V; Fri, 03 Feb 2023 09:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pNxFF-0003zI-0s
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:40:53 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pNxFB-0000nU-Pq
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=pl5z8SARhv4z9GVWZoCqijCmGSlVfMHypXzzJpWZyfM=; b=KlSAdeylt00jDmoz4hqgPGAi7u
 ueU8fZbbtRl9FBrneQISs3nvt2I+F6REV8FgrEEURyvh4I/xJhTiQnXqyktp/R0GWAAH2vOMDvVjo
 x6UlmOipF6035SLVyqFpDwxODxyaHzgLa13AQgeuVT+M9Xm5iF2PrMAp97tbKWMWU5+vF+lm9lZAw
 FzqHnvFHHDXT712KMqxHOo778m2FxjwuSvrJTE1Ynre8Za82pJGfJKWtaFFFTsv77RpS5uvhL9+yv
 Va0v+qV384r0Lm87wuCwZexRVDDqI2GFIqnMtjkMdZMXDVzs/bmBdf1e8fl8HeNf6a5PtUui0QhpT
 i3fu3m56U9Z3dXiEynWTYPbA0zTIsdOKGJdFgp2ZS9pWKBGBIc9RXia+WoDNZs0lgas4htiWLhqzo
 IgEx1Ov9xA7uVvNxSuk7PfWyRvPD4G4+qafJgFM45UU51n4oxJAvdDyC6/TjdtYFJf56zoA7M9TkT
 1JF2fB+8YLokl6PkntGWKtMv8YbtmXGW1rpoVpklPbNtYb9rxE1rUiZ8w1koRome63dx5anCEFvUK
 LtlhjFxU42TfBGF1hqc3KIPqzJ+lRCeZ6B3VOwFhASGSDNFuAveep67fDr0LxBcC74p4LksmHDmFn
 wplJCAHkGJuStBbBVIb8C7kg1qezDLEJx+gHOzMfM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Meng, Bin" <Bin.Meng@windriver.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Date: Fri, 03 Feb 2023 15:40:45 +0100
Message-ID: <7414919.cCnjH5He9x@silver>
In-Reply-To: <MN2PR11MB417343F1C20D3DD9680461E6EFD79@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <2770789.QfI4yIDJDK@silver>
 <MN2PR11MB417343F1C20D3DD9680461E6EFD79@MN2PR11MB4173.namprd11.prod.outlook.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Friday, February 3, 2023 2:34:13 PM CET Shi, Guohuai wrote:
>=20
> > -----Original Message-----
> > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Sent: Friday, February 3, 2023 20:25
> > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> > <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau <marcandre.lureau@redhat.=
com>;
> > Daniel P. Berrang=E9 <berrange@redhat.com>
> > Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdi=
r()
> > APIs
> >=20
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and
> > know the content is safe.
> >=20
> > On Monday, January 30, 2023 10:51:50 AM CET Bin Meng wrote:
> > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > >
> > > This commit implements Windows specific xxxdir() APIs for safety
> > > directory access.
> > >
> >=20
> > This issue deserves a link to either the previous discussion
> >=20
> > Link: https://lore.kernel.org/qemu-devel/2830993.GtbaR8S6b6@silver/
> >=20
> > and/or a link to this continuation of the discussion here, as it's not a
> > trivial issue, with pros and cons been discussed for the individual, po=
ssible
> > solutions.
> >=20
> > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > >  hw/9pfs/9p-util.h       |   6 +
> > >  hw/9pfs/9p-util-win32.c | 296
> > > ++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 302 insertions(+)
> > >
> > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > 0f159fb4ce..c1c251fbd1 100644
> > > --- a/hw/9pfs/9p-util.h
> > > +++ b/hw/9pfs/9p-util.h
> > > @@ -141,6 +141,12 @@ int unlinkat_win32(int dirfd, const char
> > > *pathname, int flags);  int statfs_win32(const char *root_path, struct
> > > statfs *stbuf);  int openat_dir(int dirfd, const char *name);  int
> > > openat_file(int dirfd, const char *name, int flags, mode_t mode);
> > > +DIR *opendir_win32(const char *full_file_name); int
> > > +closedir_win32(DIR *pDir); struct dirent *readdir_win32(DIR *pDir);
> > > +void rewinddir_win32(DIR *pDir); void seekdir_win32(DIR *pDir, long
> > > +pos); long telldir_win32(DIR *pDir);
> > >  #endif
> > >
> > >  static inline void close_preserve_errno(int fd) diff --git
> > > a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c index
> > > a99d579a06..5503199300 100644
> > > --- a/hw/9pfs/9p-util-win32.c
> > > +++ b/hw/9pfs/9p-util-win32.c
> > > @@ -37,6 +37,13 @@
> > >   *    Windows does not support opendir, the directory fd is created =
by
> > >   *    CreateFile and convert to fd by _open_osfhandle(). Keep the fd=
 open
> > will
> > >   *    lock and protect the directory (can not be modified or replace=
d)
> > > + *
> > > + * 5. Windows and MinGW does not provide safety directory accessing
> > functions.
> > > + *    readdir(), seekdir() and telldir() may get or set wrong value
> > because
> > > + *    directory entry data is not protected.
> >=20
> > I would rephrase that sentence, as it doesn't cover the root problem
> > adequately. Maybe something like this:
> >=20
> > 5. Neither Windows native APIs, nor MinGW provide a POSIX compatible AP=
I for
> > acquiring directory entries in a safe way. Calling those APIs (native
> > _findfirst() and _findnext() or MinGW's readdir(), seekdir() and telldi=
r())
> > directly can lead to an inconsistent state if directory is modified in
> > between, e.g. the same directory appearing more than once in output, or
> > directories not appearing at all in output even though they were neither
> > newly created nor deleted. POSIX does not define what happens with dele=
ted or
> > newly created directories in between, but it guarantees a consistent st=
ate.
> >=20
> > > + *
> > > + *    This file re-write POSIX directory accessing functions and cac=
he all
> > > + *    directory entries during opening.
> > >   */
> > >
> > >  #include "qemu/osdep.h"
> > > @@ -51,6 +58,27 @@
> > >
> > >  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> > >
> > > +/*
> > > + * MinGW and Windows does not provide safety way to seek directory
> > > +while other
> > > + * thread is modifying same directory.
> > > + *
> > > + * The two structures are used to cache all directory entries when o=
pening
> > it.
> > > + * Cached entries are always returned for read or seek.
> > > + */
> > > +struct dir_win32_entry {
> > > +    QSLIST_ENTRY(dir_win32_entry) node;
> > > +    struct _finddata_t dd_data;
> > > +};
> > > +
> > > +struct dir_win32 {
> > > +    struct dirent dd_dir;
> > > +    uint32_t offset;
> > > +    uint32_t total_entries;
> > > +    QSLIST_HEAD(, dir_win32_entry) head;
> > > +    struct dir_win32_entry *current;
> > > +    char dd_name[1];
> > > +};
> > > +
> > >  /*
> > >   * win32_error_to_posix - convert Win32 error to POSIX error number
> > >   *
> > > @@ -977,3 +1005,271 @@ int qemu_mknodat(int dirfd, const char *filena=
me,
> > mode_t mode, dev_t dev)
> > >      errno =3D ENOTSUP;
> > >      return -1;
> > >  }
> > > +
> > > +/*
> > > + * opendir_win32 - open a directory
> > > + *
> > > + * This function opens a directory and caches all directory entries.
> > > + */
> > > +DIR *opendir_win32(const char *full_file_name) {
> > > +    HANDLE hDir =3D INVALID_HANDLE_VALUE;
> > > +    DWORD attribute;
> > > +    intptr_t dd_handle =3D -1;
> > > +    struct _finddata_t dd_data;
> > > +
> > > +    struct dir_win32 *stream =3D NULL;
> > > +    struct dir_win32_entry *dir_entry;
> > > +    struct dir_win32_entry *prev;
> > > +    struct dir_win32_entry *next;
> > > +
> > > +    int err =3D 0;
> > > +    int find_status;
> > > +    uint32_t index;
> > > +
> > > +    /* open directory to prevent it being removed */
> > > +
> > > +    hDir =3D CreateFile(full_file_name, GENERIC_READ,
> > > +                      FILE_SHARE_READ | FILE_SHARE_WRITE |
> > FILE_SHARE_DELETE,
> > > +                      NULL,
> > > +                      OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
> > > + NULL);
> > > +
> > > +    if (hDir =3D=3D INVALID_HANDLE_VALUE) {
> > > +        err =3D win32_error_to_posix(GetLastError());
> > > +        goto out;
> > > +    }
> > > +
> > > +    attribute =3D GetFileAttributes(full_file_name);
> > > +
> > > +    /* symlink is not allow */
> > > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES
> > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > +        err =3D EACCES;
> > > +        goto out;
> > > +    }
> > > +
> > > +    /* check if it is a directory */
> > > +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > > +        err =3D ENOTDIR;
> > > +        goto out;
> > > +    }
> > > +
> > > +    /*
> > > +     * findfirst() need suffix format name like "\dir1\dir2\*", allo=
cate
> > more
> > > +     * buffer to store suffix.
> > > +     */
> > > +    stream =3D g_malloc0(sizeof(struct dir_win32) + strlen(full_file=
_name) +
> > 3);
> > > +    QSLIST_INIT(&stream->head);
> > > +
> > > +    strcpy(stream->dd_name, full_file_name);
> > > +    strcat(stream->dd_name, "\\*");
> > > +
> > > +    dd_handle =3D _findfirst(stream->dd_name, &dd_data);
> > > +
> > > +    if (dd_handle =3D=3D -1) {
> > > +        err =3D errno;
> > > +        goto out;
> > > +    }
> > > +
> > > +    index =3D 0;
> > > +
> > > +    /* read all entries to link list */
> > > +    do {
> > > +        dir_entry =3D g_malloc0(sizeof(struct dir_win32_entry));
> > > +        memcpy(&dir_entry->dd_data, &dd_data, sizeof(dd_data));
> > > +        if (index =3D=3D 0) {
> > > +            QSLIST_INSERT_HEAD(&stream->head, dir_entry, node);
> > > +        } else {
> > > +            QSLIST_INSERT_AFTER(prev, dir_entry, node);
> > > +        }
> > > +
> > > +        prev =3D dir_entry;
> > > +        find_status =3D _findnext(dd_handle, &dd_data);
> > > +
> > > +        index++;
> > > +    } while (find_status =3D=3D 0);
> >=20
> > So you decided to go for the solution that caches all entries of a dire=
ctory
> > in RAM.
> >=20
> > So don't you think my last suggested solution that would call native
> > _findfirst() and _findnext() directly, but without any chaching and ins=
tead
> > picking the relevent entry simply by inode number, might be a better
> > candidate as a starting point for landing Windows support? Link to that
> > previous
> > suggestion:
> >=20
> > https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/
> >=20
>=20
> I did a quick test for caching data without name entry, but it failed for=
 reading + deleting directory on Windows host (like "rm -rf" for a director=
y).
> The root cause is: Windows's directory entry is not cached.
> If there is 100 files in a directory:
>=20
> File1
> File2
> ...
> File100
>=20
> When "rm -rf" is working:
>=20
> It read first 10 entries, and remove them. 9pfs may seek and re-seek to o=
ffset 10 to read next 10 entries.
> But Windows and MinGW does not provide rewinddir.
> If we using findfirst() and findnext to seek to offset 10, then we will n=
ot get File11 but get File 21 (because we skipped 10 entries by seekdir()).

I assume you are referring to a simple solution like MinGW does, i.e. a
consecutive dense index (0,1,2,3,...n-1 where n is the current total amount=
 of
directory entries). That would not work, yes. But that's not what I suggest=
ed.

With an inode number based lookup you would not seek to an incorrect entry =
=2E..

> If we removed some entries in directory, inode number is useless because =
we can not find it again.

You *can* recover from the previous inode number, even if any directory ent=
ry
has been deleted in the meantime: you would lookup the entry with the next
higher inode number.

Example, say initial directory state on host is:

name   inode-nr
aaa    8
bbb    3
ccc    4
ddd    2
eee    9

Say client is looking up exactly 2 entries, you would return to client in t=
his
order (by inode-nr):

1. ddd
2. bbb

Now say "bbb" (a.k.a. previous) and "ccc" (a.k.a next) are removed. Directo=
ry
state on host is now:

name   inode-nr
aaa    8
ddd    2
eee    9

Subsequently the last directory entries are requested by client. Previous
inode number (stored in RAM) was 3, which no longer exists, so you lookup t=
he
entry with the next higher inode number than 3, which is now 8 in this
example. Hence you would eventually return to client (in this order):

3. aaa
4. eee

>=20
>=20
> Thanks
> Guohuai
>=20
>=20
> > > +
> > > +    if (errno =3D=3D ENOENT) {
> > > +        /* No more matching files could be found, clean errno */
> > > +        errno =3D 0;
> > > +    } else {
> > > +        err =3D errno;
> > > +        goto out;
> > > +    }
> > > +
> > > +    stream->total_entries =3D index;
> > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > +
> > > +out:
> > > +    if (err !=3D 0) {
> > > +        errno =3D err;
> > > +        /* free whole list */
> > > +        if (stream !=3D NULL) {
> > > +            QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next=
) {
> > > +                QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_en=
try,
> > node);
> > > +                g_free(dir_entry);
> > > +            }
> > > +            g_free(stream);
> > > +            stream =3D NULL;
> > > +        }
> > > +    }
> > > +
> > > +    /* after cached all entries, this handle is useless */
> > > +    if (dd_handle !=3D -1) {
> > > +        _findclose(dd_handle);
> > > +    }
> > > +
> > > +    if (hDir !=3D INVALID_HANDLE_VALUE) {
> > > +        CloseHandle(hDir);
> > > +    }
> > > +
> > > +    return (DIR *)stream;
> > > +}
> > > +
> > > +/*
> > > + * closedir_win32 - close a directory
> > > + *
> > > + * This function closes directory and free all cached resources.
> > > + */
> > > +int closedir_win32(DIR *pDir)
> > > +{
> > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > +    struct dir_win32_entry *dir_entry;
> > > +    struct dir_win32_entry *next;
> > > +
> > > +    if (stream =3D=3D NULL) {
> > > +        errno =3D EBADF;
> > > +        return -1;
> > > +    }
> > > +
> > > +    /* free all resources */
> > > +
> > > +    QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next) {
> > > +        QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_entry, nod=
e);
> > > +        g_free(dir_entry);
> > > +    }
> > > +
> > > +    g_free(stream);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +/*
> > > + * readdir_win32 - read a directory
> > > + *
> > > + * This function reads a directory entry from cached entry list.
> > > + */
> > > +struct dirent *readdir_win32(DIR *pDir) {
> > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > +
> > > +    if (stream =3D=3D NULL) {
> > > +        errno =3D EBADF;
> > > +        return NULL;
> > > +    }
> > > +
> > > +    if (stream->offset >=3D stream->total_entries) {
> > > +        /* reach to the end, return NULL without set errno */
> > > +        return NULL;
> > > +    }
> > > +
> > > +    memcpy(stream->dd_dir.d_name,
> > > +           stream->current->dd_data.name,
> > > +           sizeof(stream->dd_dir.d_name));
> > > +
> > > +    /* Windows does not provide inode number */
> > > +    stream->dd_dir.d_ino =3D 0;
> > > +    stream->dd_dir.d_reclen =3D 0;
> > > +    stream->dd_dir.d_namlen =3D strlen(stream->dd_dir.d_name);
> > > +
> > > +    stream->offset++;
> > > +    stream->current =3D QSLIST_NEXT(stream->current, node);
> > > +
> > > +    return &stream->dd_dir;
> > > +}
> > > +
> > > +/*
> > > + * rewinddir_win32 - reset directory stream
> > > + *
> > > + * This function resets the position of the directory stream to the
> > > + * beginning of the directory.
> > > + */
> > > +void rewinddir_win32(DIR *pDir)
> > > +{
> > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > +
> > > +    if (stream =3D=3D NULL) {
> > > +        errno =3D EBADF;
> > > +        return;
> > > +    }
> > > +
> > > +    stream->offset =3D 0;
> > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > +
> > > +    return;
> > > +}
> > > +
> > > +/*
> > > + * seekdir_win32 - set the position of the next readdir() call in the
> > > +directory
> > > + *
> > > + * This function sets the position of the next readdir() call in the
> > > +directory
> > > + * from which the next readdir() call will start.
> > > + */
> > > +void seekdir_win32(DIR *pDir, long pos) {
> > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > +    uint32_t index;
> > > +
> > > +    if (stream =3D=3D NULL) {
> > > +        errno =3D EBADF;
> > > +        return;
> > > +    }
> > > +
> > > +    if (pos < -1) {
> > > +        errno =3D EINVAL;
> > > +        return;
> > > +    }
> > > +
> > > +    if (pos =3D=3D -1 || pos >=3D (long)stream->total_entries) {
> > > +        /* seek to the end */
> > > +        stream->offset =3D stream->total_entries;
> > > +        return;
> > > +    }
> > > +
> > > +    if (pos - (long)stream->offset =3D=3D 0) {
> > > +        /* no need to seek */
> > > +        return;
> > > +    }
> > > +
> > > +    /* seek position from list head */
> > > +
> > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > +
> > > +    for (index =3D 0; index < (uint32_t)pos; index++) {
> > > +        stream->current =3D QSLIST_NEXT(stream->current, node);
> > > +    }
> > > +    stream->offset =3D index;
> > > +
> > > +    return;
> > > +}
> > > +
> > > +/*
> > > + * telldir_win32 - return current location in directory
> > > + *
> > > + * This function returns current location in directory.
> > > + */
> > > +long telldir_win32(DIR *pDir)
> > > +{
> > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > +
> > > +    if (stream =3D=3D NULL) {
> > > +        errno =3D EBADF;
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (stream->offset > stream->total_entries) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    return (long)stream->offset;
> > > +}
> > >
> >=20
>=20
>=20
>=20




