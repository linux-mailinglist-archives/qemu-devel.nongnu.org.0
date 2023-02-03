Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649B68A0FF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:57:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0Hi-00082S-6l; Fri, 03 Feb 2023 12:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pO0Hg-00082K-2x
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:55:36 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pO0Hc-00051g-S1
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=98Tg7lW21Fm+mmQpkyalYagjnD5bp94OplUMdZvhLbI=; b=GgHuF0i7muToO4R+odIAIpn02W
 ZqvDY8girJcNdwPx51sdtLAaaKOHSNyfTm4nBHgrUQTstwJ5PYiDo5g0po8VxKSftNpS2XXo6ldlL
 4VrtqiIFeHiD1sHUiGD3Pvt0FHTo5MpfZ1jUxZ4Bx7Dfkt2R9TabMgj58WnJ0SmOL/1PkmfeljVDo
 mUV8MKsibfIl+YmNBVZ9tSunQqLSwPEmKOva1wUJyarP9NtEyGTg/tEzAOgOE0SdYwxRqBzLCcE47
 QkfhjyMdjSuhmsbIo1Q3kr7Teg6HB7K6yRakN0GquFpVDvTnlnfRq5NqxPJ9wx3OMvkEAF5ghLhKX
 fPyvXuAInad4eXnFWvaK90Ily+b9qIMNpDeALb7ZNraJCS06kZT0sElREsU90iforfI0jlxZUgHka
 E9R1cRQeWfbK7n9CXXoaEPwmdxNHUFpr2v21mX7erufX6wYETsSN3qJ+d1J8f36MOpxh/CiPPy+/9
 R0QaYklo4YTo6ajFm0w23En07z13kc34law96Z1VKwVULg3Uj8DD5dvjRIL4U4AJSeYRaA1iI/cxI
 rdgCCbb0RrTmDz4UkI/Bs1kKVSMxH7YluZIM5U1dIxR9mc1SgKYo2+rA+riU8UWXrRV7tkf1FtAoJ
 auV0Ssvw6DGBL3oxYI4l/j/vL2Ge0Sjict+5SH7G8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Meng, Bin" <Bin.Meng@windriver.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Date: Fri, 03 Feb 2023 18:55:28 +0100
Message-ID: <3667674.co3Lnhysxx@silver>
In-Reply-To: <MN2PR11MB4173C6CF342F103D757F8A21EFD79@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <7414919.cCnjH5He9x@silver>
 <MN2PR11MB4173C6CF342F103D757F8A21EFD79@MN2PR11MB4173.namprd11.prod.outlook.com>
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

On Friday, February 3, 2023 5:30:35 PM CET Shi, Guohuai wrote:
>=20
> > -----Original Message-----
> > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Sent: Friday, February 3, 2023 22:41
> > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > Cc: Meng, Bin <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau
> > <marcandre.lureau@redhat.com>; Daniel P. Berrang=E9 <berrange@redhat.co=
m>; Shi,
> > Guohuai <Guohuai.Shi@windriver.com>
> > Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdi=
r()
> > APIs
> >=20
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and
> > know the content is safe.
> >=20
> > On Friday, February 3, 2023 2:34:13 PM CET Shi, Guohuai wrote:
> > >
> > > > -----Original Message-----
> > > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > Sent: Friday, February 3, 2023 20:25
> > > > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > > > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> > > > <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau
> > > > <marcandre.lureau@redhat.com>; Daniel P. Berrang=E9
> > > > <berrange@redhat.com>
> > > > Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific
> > > > xxxdir() APIs
> > > >
> > > > CAUTION: This email comes from a non Wind River email account!
> > > > Do not click links or open attachments unless you recognize the
> > > > sender and know the content is safe.
> > > >
> > > > On Monday, January 30, 2023 10:51:50 AM CET Bin Meng wrote:
> > > > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > > > >
> > > > > This commit implements Windows specific xxxdir() APIs for safety
> > > > > directory access.
> > > > >
> > > >
> > > > This issue deserves a link to either the previous discussion
> > > >
> > > > Link: https://lore.kernel.org/qemu-devel/2830993.GtbaR8S6b6@silver/
> > > >
> > > > and/or a link to this continuation of the discussion here, as it's
> > > > not a trivial issue, with pros and cons been discussed for the
> > > > individual, possible solutions.
> > > >
> > > > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > ---
> > > > >
> > > > >  hw/9pfs/9p-util.h       |   6 +
> > > > >  hw/9pfs/9p-util-win32.c | 296
> > > > > ++++++++++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 302 insertions(+)
> > > > >
> > > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > > > 0f159fb4ce..c1c251fbd1 100644
> > > > > --- a/hw/9pfs/9p-util.h
> > > > > +++ b/hw/9pfs/9p-util.h
> > > > > @@ -141,6 +141,12 @@ int unlinkat_win32(int dirfd, const char
> > > > > *pathname, int flags);  int statfs_win32(const char *root_path,
> > > > > struct statfs *stbuf);  int openat_dir(int dirfd, const char
> > > > > *name);  int openat_file(int dirfd, const char *name, int flags,
> > > > > mode_t mode);
> > > > > +DIR *opendir_win32(const char *full_file_name); int
> > > > > +closedir_win32(DIR *pDir); struct dirent *readdir_win32(DIR
> > > > > +*pDir); void rewinddir_win32(DIR *pDir); void seekdir_win32(DIR
> > > > > +*pDir, long pos); long telldir_win32(DIR *pDir);
> > > > >  #endif
> > > > >
> > > > >  static inline void close_preserve_errno(int fd) diff --git
> > > > > a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c index
> > > > > a99d579a06..5503199300 100644
> > > > > --- a/hw/9pfs/9p-util-win32.c
> > > > > +++ b/hw/9pfs/9p-util-win32.c
> > > > > @@ -37,6 +37,13 @@
> > > > >   *    Windows does not support opendir, the directory fd is crea=
ted by
> > > > >   *    CreateFile and convert to fd by _open_osfhandle(). Keep th=
e fd
> > open
> > > > will
> > > > >   *    lock and protect the directory (can not be modified or rep=
laced)
> > > > > + *
> > > > > + * 5. Windows and MinGW does not provide safety directory
> > > > > + accessing
> > > > functions.
> > > > > + *    readdir(), seekdir() and telldir() may get or set wrong va=
lue
> > > > because
> > > > > + *    directory entry data is not protected.
> > > >
> > > > I would rephrase that sentence, as it doesn't cover the root problem
> > > > adequately. Maybe something like this:
> > > >
> > > > 5. Neither Windows native APIs, nor MinGW provide a POSIX compatible
> > > > API for acquiring directory entries in a safe way. Calling those
> > > > APIs (native
> > > > _findfirst() and _findnext() or MinGW's readdir(), seekdir() and
> > > > telldir()) directly can lead to an inconsistent state if directory
> > > > is modified in between, e.g. the same directory appearing more than
> > > > once in output, or directories not appearing at all in output even
> > > > though they were neither newly created nor deleted. POSIX does not
> > > > define what happens with deleted or newly created directories in be=
tween,
> > but it guarantees a consistent state.
> > > >
> > > > > + *
> > > > > + *    This file re-write POSIX directory accessing functions and=
 cache
> > all
> > > > > + *    directory entries during opening.
> > > > >   */
> > > > >
> > > > >  #include "qemu/osdep.h"
> > > > > @@ -51,6 +58,27 @@
> > > > >
> > > > >  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> > > > >
> > > > > +/*
> > > > > + * MinGW and Windows does not provide safety way to seek
> > > > > +directory while other
> > > > > + * thread is modifying same directory.
> > > > > + *
> > > > > + * The two structures are used to cache all directory entries
> > > > > +when opening
> > > > it.
> > > > > + * Cached entries are always returned for read or seek.
> > > > > + */
> > > > > +struct dir_win32_entry {
> > > > > +    QSLIST_ENTRY(dir_win32_entry) node;
> > > > > +    struct _finddata_t dd_data;
> > > > > +};
> > > > > +
> > > > > +struct dir_win32 {
> > > > > +    struct dirent dd_dir;
> > > > > +    uint32_t offset;
> > > > > +    uint32_t total_entries;
> > > > > +    QSLIST_HEAD(, dir_win32_entry) head;
> > > > > +    struct dir_win32_entry *current;
> > > > > +    char dd_name[1];
> > > > > +};
> > > > > +
> > > > >  /*
> > > > >   * win32_error_to_posix - convert Win32 error to POSIX error num=
ber
> > > > >   *
> > > > > @@ -977,3 +1005,271 @@ int qemu_mknodat(int dirfd, const char
> > > > > *filename,
> > > > mode_t mode, dev_t dev)
> > > > >      errno =3D ENOTSUP;
> > > > >      return -1;
> > > > >  }
> > > > > +
> > > > > +/*
> > > > > + * opendir_win32 - open a directory
> > > > > + *
> > > > > + * This function opens a directory and caches all directory entr=
ies.
> > > > > + */
> > > > > +DIR *opendir_win32(const char *full_file_name) {
> > > > > +    HANDLE hDir =3D INVALID_HANDLE_VALUE;
> > > > > +    DWORD attribute;
> > > > > +    intptr_t dd_handle =3D -1;
> > > > > +    struct _finddata_t dd_data;
> > > > > +
> > > > > +    struct dir_win32 *stream =3D NULL;
> > > > > +    struct dir_win32_entry *dir_entry;
> > > > > +    struct dir_win32_entry *prev;
> > > > > +    struct dir_win32_entry *next;
> > > > > +
> > > > > +    int err =3D 0;
> > > > > +    int find_status;
> > > > > +    uint32_t index;
> > > > > +
> > > > > +    /* open directory to prevent it being removed */
> > > > > +
> > > > > +    hDir =3D CreateFile(full_file_name, GENERIC_READ,
> > > > > +                      FILE_SHARE_READ | FILE_SHARE_WRITE |
> > > > FILE_SHARE_DELETE,
> > > > > +                      NULL,
> > > > > +                      OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
> > > > > + NULL);
> > > > > +
> > > > > +    if (hDir =3D=3D INVALID_HANDLE_VALUE) {
> > > > > +        err =3D win32_error_to_posix(GetLastError());
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    attribute =3D GetFileAttributes(full_file_name);
> > > > > +
> > > > > +    /* symlink is not allow */
> > > > > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES
> > > > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > > > +        err =3D EACCES;
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    /* check if it is a directory */
> > > > > +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > > > > +        err =3D ENOTDIR;
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    /*
> > > > > +     * findfirst() need suffix format name like "\dir1\dir2\*",
> > > > > + allocate
> > > > more
> > > > > +     * buffer to store suffix.
> > > > > +     */
> > > > > +    stream =3D g_malloc0(sizeof(struct dir_win32) +
> > > > > + strlen(full_file_name) +
> > > > 3);
> > > > > +    QSLIST_INIT(&stream->head);
> > > > > +
> > > > > +    strcpy(stream->dd_name, full_file_name);
> > > > > +    strcat(stream->dd_name, "\\*");
> > > > > +
> > > > > +    dd_handle =3D _findfirst(stream->dd_name, &dd_data);
> > > > > +
> > > > > +    if (dd_handle =3D=3D -1) {
> > > > > +        err =3D errno;
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    index =3D 0;
> > > > > +
> > > > > +    /* read all entries to link list */
> > > > > +    do {
> > > > > +        dir_entry =3D g_malloc0(sizeof(struct dir_win32_entry));
> > > > > +        memcpy(&dir_entry->dd_data, &dd_data, sizeof(dd_data));
> > > > > +        if (index =3D=3D 0) {
> > > > > +            QSLIST_INSERT_HEAD(&stream->head, dir_entry, node);
> > > > > +        } else {
> > > > > +            QSLIST_INSERT_AFTER(prev, dir_entry, node);
> > > > > +        }
> > > > > +
> > > > > +        prev =3D dir_entry;
> > > > > +        find_status =3D _findnext(dd_handle, &dd_data);
> > > > > +
> > > > > +        index++;
> > > > > +    } while (find_status =3D=3D 0);
> > > >
> > > > So you decided to go for the solution that caches all entries of a
> > > > directory in RAM.
> > > >
> > > > So don't you think my last suggested solution that would call native
> > > > _findfirst() and _findnext() directly, but without any chaching and
> > > > instead picking the relevent entry simply by inode number, might be
> > > > a better candidate as a starting point for landing Windows support?
> > > > Link to that previous
> > > > suggestion:
> > > >
> > > > https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/
> > > >
> > >
> > > I did a quick test for caching data without name entry, but it failed=
 for
> > reading + deleting directory on Windows host (like "rm -rf" for a direc=
tory).
> > > The root cause is: Windows's directory entry is not cached.
> > > If there is 100 files in a directory:
> > >
> > > File1
> > > File2
> > > ...
> > > File100
> > >
> > > When "rm -rf" is working:
> > >
> > > It read first 10 entries, and remove them. 9pfs may seek and re-seek =
to
> > offset 10 to read next 10 entries.
> > > But Windows and MinGW does not provide rewinddir.
> > > If we using findfirst() and findnext to seek to offset 10, then we wi=
ll not
> > get File11 but get File 21 (because we skipped 10 entries by seekdir()).
> >=20
> > I assume you are referring to a simple solution like MinGW does, i.e. a
> > consecutive dense index (0,1,2,3,...n-1 where n is the current total am=
ount
> > of directory entries). That would not work, yes. But that's not what I
> > suggested.
> >=20
> > With an inode number based lookup you would not seek to an incorrect en=
try
> > ...
> >=20
> > > If we removed some entries in directory, inode number is useless beca=
use we
> > can not find it again.
> >=20
> > You *can* recover from the previous inode number, even if any directory=
 entry
> > has been deleted in the meantime: you would lookup the entry with the n=
ext
> > higher inode number.
> >=20
> > Example, say initial directory state on host is:
> >=20
> > name   inode-nr
> > aaa    8
> > bbb    3
> > ccc    4
> > ddd    2
> > eee    9
> >=20
> > Say client is looking up exactly 2 entries, you would return to client =
in
> > this order (by inode-nr):
> >=20
> > 1. ddd
> > 2. bbb
> >=20
> > Now say "bbb" (a.k.a. previous) and "ccc" (a.k.a next) are removed. Dir=
ectory
> > state on host is now:
> >=20
> > name   inode-nr
> > aaa    8
> > ddd    2
> > eee    9
> >=20
> > Subsequently the last directory entries are requested by client. Previo=
us
> > inode number (stored in RAM) was 3, which no longer exists, so you look=
up the
> > entry with the next higher inode number than 3, which is now 8 in this
> > example. Hence you would eventually return to client (in this order):
> >=20
> > 3. aaa
> > 4. eee
> >=20
>=20
> Yes, it can work by using inode number (called File ID on Windows host: h=
ttps://learn.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-file_=
id_info).
> However, Windows does not provide a function to get file information by f=
ile ID.
> That means, for anytime of seeking directory, 9pfs need to do the followi=
ng sequence work to locate a name entry:
>=20
> 1. findfirst
> 2. CreateFile to get file handle
> 3. GetFileInformationByHandleEx to get file ID (https://learn.microsoft.c=
om/en-us/windows/win32/api/minwinbase/ne-minwinbase-file_info_by_handle_cla=
ss)
> 4. Close file handle and return if the file ID is match
> 5. findnext
> 6. repeat to step #2
>=20
> Windows does not short file name entry by file ID and the file ID is 128-=
bit integer.
> When there are many entries in directory, seeking directory will cause a =
very bad performance.

I know, it's an n-square performance issue and what I already wrote in the
summary of the linked original suggestion [1] in v3 before, quote:

  + Relatively straight-forward to implement.

  + No (major) changes in 9pfs code base required.

  - Still n-square performance issue (neglectable to land Windows host supp=
ort
    IMO).

  o Consistency assured for "most" cases, except one: if hardlinks are
    inserted in between then it might fail

[1] https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/

The idea was to use that just as a starting point to land Windows host supp=
ort
ASAP, slower on large dirs compared to other solutions, yes, but with
guaranteed correct and deterministic behaviour. And then on the long run we
would of course replace that with a more performant solution.

I mean, this is really simple to implement, so I would at least test it. If=
 it
really runs horribly slow we could still discuss faster solutions, which are
however all much more tricky.

> So I think store all name entries would be better than store all file ID.

As already discussed, NTFS allows up to (2^32 - 1) =3D 4,294,967,295 entries
per directory. So caching only one directory (entirely) in RAM can already
exceed the available RAM, which would crash QEMU. Multiplied by an expected
amount of directory lookups by client and we even get into much higher
categories, even with much smaller individual directory sizes.

>=20
>=20
> > >
> > >
> > > Thanks
> > > Guohuai
> > >
> > >
> > > > > +
> > > > > +    if (errno =3D=3D ENOENT) {
> > > > > +        /* No more matching files could be found, clean errno */
> > > > > +        errno =3D 0;
> > > > > +    } else {
> > > > > +        err =3D errno;
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    stream->total_entries =3D index;
> > > > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > > > +
> > > > > +out:
> > > > > +    if (err !=3D 0) {
> > > > > +        errno =3D err;
> > > > > +        /* free whole list */
> > > > > +        if (stream !=3D NULL) {
> > > > > +            QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, =
next)
> > {
> > > > > +                QSLIST_REMOVE(&stream->head, dir_entry,
> > > > > +dir_win32_entry,
> > > > node);
> > > > > +                g_free(dir_entry);
> > > > > +            }
> > > > > +            g_free(stream);
> > > > > +            stream =3D NULL;
> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +    /* after cached all entries, this handle is useless */
> > > > > +    if (dd_handle !=3D -1) {
> > > > > +        _findclose(dd_handle);
> > > > > +    }
> > > > > +
> > > > > +    if (hDir !=3D INVALID_HANDLE_VALUE) {
> > > > > +        CloseHandle(hDir);
> > > > > +    }
> > > > > +
> > > > > +    return (DIR *)stream;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * closedir_win32 - close a directory
> > > > > + *
> > > > > + * This function closes directory and free all cached resources.
> > > > > + */
> > > > > +int closedir_win32(DIR *pDir)
> > > > > +{
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +    struct dir_win32_entry *dir_entry;
> > > > > +    struct dir_win32_entry *next;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    /* free all resources */
> > > > > +
> > > > > +    QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next) {
> > > > > +        QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_entry,
> > node);
> > > > > +        g_free(dir_entry);
> > > > > +    }
> > > > > +
> > > > > +    g_free(stream);
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * readdir_win32 - read a directory
> > > > > + *
> > > > > + * This function reads a directory entry from cached entry list.
> > > > > + */
> > > > > +struct dirent *readdir_win32(DIR *pDir) {
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return NULL;
> > > > > +    }
> > > > > +
> > > > > +    if (stream->offset >=3D stream->total_entries) {
> > > > > +        /* reach to the end, return NULL without set errno */
> > > > > +        return NULL;
> > > > > +    }
> > > > > +
> > > > > +    memcpy(stream->dd_dir.d_name,
> > > > > +           stream->current->dd_data.name,
> > > > > +           sizeof(stream->dd_dir.d_name));
> > > > > +
> > > > > +    /* Windows does not provide inode number */
> > > > > +    stream->dd_dir.d_ino =3D 0;
> > > > > +    stream->dd_dir.d_reclen =3D 0;
> > > > > +    stream->dd_dir.d_namlen =3D strlen(stream->dd_dir.d_name);
> > > > > +
> > > > > +    stream->offset++;
> > > > > +    stream->current =3D QSLIST_NEXT(stream->current, node);
> > > > > +
> > > > > +    return &stream->dd_dir;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * rewinddir_win32 - reset directory stream
> > > > > + *
> > > > > + * This function resets the position of the directory stream to
> > > > > +the
> > > > > + * beginning of the directory.
> > > > > + */
> > > > > +void rewinddir_win32(DIR *pDir)
> > > > > +{
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    stream->offset =3D 0;
> > > > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > > > +
> > > > > +    return;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * seekdir_win32 - set the position of the next readdir() call in
> > > > > +the directory
> > > > > + *
> > > > > + * This function sets the position of the next readdir() call in
> > > > > +the directory
> > > > > + * from which the next readdir() call will start.
> > > > > + */
> > > > > +void seekdir_win32(DIR *pDir, long pos) {
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +    uint32_t index;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    if (pos < -1) {
> > > > > +        errno =3D EINVAL;
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    if (pos =3D=3D -1 || pos >=3D (long)stream->total_entries) {
> > > > > +        /* seek to the end */
> > > > > +        stream->offset =3D stream->total_entries;
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    if (pos - (long)stream->offset =3D=3D 0) {
> > > > > +        /* no need to seek */
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    /* seek position from list head */
> > > > > +
> > > > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > > > +
> > > > > +    for (index =3D 0; index < (uint32_t)pos; index++) {
> > > > > +        stream->current =3D QSLIST_NEXT(stream->current, node);
> > > > > +    }
> > > > > +    stream->offset =3D index;
> > > > > +
> > > > > +    return;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * telldir_win32 - return current location in directory
> > > > > + *
> > > > > + * This function returns current location in directory.
> > > > > + */
> > > > > +long telldir_win32(DIR *pDir)
> > > > > +{
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    if (stream->offset > stream->total_entries) {
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    return (long)stream->offset;
> > > > > +}
> > > > >
> > > >
> > >
> > >
> > >
> >=20
> >=20
>=20
>=20
>=20




