Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A8B6BCD7C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 12:05:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclQG-0001DS-8x; Thu, 16 Mar 2023 07:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pclQD-00018Z-Rj
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 07:05:25 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pclQA-0008Pd-Hq
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 07:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=a6x/u7vBH/2GvRo4q8wOgO+iY/WaDlSN9NWzejYHilg=; b=IPS42ZtYxj6IOSUYDmtnAssNLj
 NZLjj3PUsftSzezWMcgI7+EvLyu89McgrEe+p+SEhS3HaUqCovX7DZNpPa8L6By3oLF5WsEDO6yaS
 TJSu/QyD2x9UGCh/kK0eq/mCHYzWJxZqpTHtQGixDQHTMvPtUCduq7lZwc1IsmBov5uYvz8t+HHfZ
 D3TYR3KUKu5r4nXM94JrFOWyfAV0h+aYLgCzG5ZqW1TWvAPoiZo45x4zjR0oCbpyCbCUircKOABCc
 t45Wj92uzKs8YA1tMImZvV9E+7OsAHw4pO7Lsj2XhDFBb/MMElh5y8rwGgYuaKaQSowR2IAcd9kr8
 ARs9czZ/6dvwEyCUDmMJbuWAYHLt9VYAPp8beE/p642iQCMgyiMRnp3iwRsIBvURveO6JalsQzr/R
 AgipS5g+pWChrOmX8kKGuZEsvlIj0iO24aNuIc7WK5z0k6ZnVFiK6VqIXBzju2MBRB0hDfWVcre8/
 fuEXcCbAlvvPx7sl8kFUqQ/Sq2v6MVnDpGhc5kPCb3qrpSRGWuKVq4v0Or8mhaocPpKZeg6aQuJLD
 zHZG0MIUZu9DLshd+rXWQRmiuNJUu4gC+bIkCfcB3zCOQAHMnXrTnnJT5eOlwKsNtL5T0O35b7aeQ
 406eVT9wRj1kGYg3lgI4PrqLv/osMaUdNl8R+3ydM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Meng, Bin" <Bin.Meng@windriver.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Date: Thu, 16 Mar 2023 12:05:17 +0100
Message-ID: <2201939.iVmW86lLxn@silver>
In-Reply-To: <MN2PR11MB4173F2F6DEDE4C2D07AD444BEFBF9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <1922294.e5CzDnASyn@silver>
 <MN2PR11MB4173F2F6DEDE4C2D07AD444BEFBF9@MN2PR11MB4173.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Wednesday, March 15, 2023 8:05:34 PM CET Shi, Guohuai wrote:
> 
> > -----Original Message-----
> > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Sent: Wednesday, March 15, 2023 00:06
> > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> > <Bin.Meng@windriver.com>
> > Subject: Re: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir()
> > APIs
> > 
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and
> > know the content is safe.
> > 
> > On Monday, February 20, 2023 11:08:03 AM CET Bin Meng wrote:
> > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > >
> > > This commit implements Windows specific xxxdir() APIs for safety
> > > directory access.
> > 
> > That comment is seriously too short for this patch.
> > 
> > 1. You should describe the behaviour implementation that you have chosen and
> > why you have chosen it.
> > 
> > 2. Like already said in the previous version of the patch, you should place a
> > link to the discussion we had on this issue.
> > 
> > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > >  hw/9pfs/9p-util.h       |   6 +
> > >  hw/9pfs/9p-util-win32.c | 443
> > > ++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 449 insertions(+)
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
> > > a99d579a06..e9408f3c45 100644
> > > --- a/hw/9pfs/9p-util-win32.c
> > > +++ b/hw/9pfs/9p-util-win32.c
> > > @@ -37,6 +37,16 @@
> > >   *    Windows does not support opendir, the directory fd is created by
> > >   *    CreateFile and convert to fd by _open_osfhandle(). Keep the fd open
> > will
> > >   *    lock and protect the directory (can not be modified or replaced)
> > > + *
> > > + * 5. Neither Windows native APIs, nor MinGW provide a POSIX compatible
> > API for
> > > + *    acquiring directory entries in a safe way. Calling those APIs
> > (native
> > > + *    _findfirst() and _findnext() or MinGW's readdir(), seekdir() and
> > > + *    telldir()) directly can lead to an inconsistent state if directory
> > is
> > > + *    modified in between, e.g. the same directory appearing more than
> > once
> > > + *    in output, or directories not appearing at all in output even though
> > they
> > > + *    were neither newly created nor deleted. POSIX does not define what
> > happens
> > > + *    with deleted or newly created directories in between, but it
> > guarantees a
> > > + *    consistent state.
> > >   */
> > >
> > >  #include "qemu/osdep.h"
> > > @@ -51,6 +61,25 @@
> > >
> > >  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> > >
> > > +/*
> > > + * MinGW and Windows does not provide a safe way to seek directory
> > > +while other
> > > + * thread is modifying the same directory.
> > > + *
> > > + * This structure is used to store sorted file id and ensure
> > > +directory seek
> > > + * consistency.
> > > + */
> > > +struct dir_win32 {
> > > +    struct dirent dd_dir;
> > > +    uint32_t offset;
> > > +    uint32_t total_entries;
> > > +    HANDLE hDir;
> > > +    uint32_t dir_name_len;
> > > +    uint64_t dot_id;
> > > +    uint64_t dot_dot_id;
> > > +    uint64_t *file_id_list;
> > > +    char dd_name[1];
> > > +};
> > > +
> > >  /*
> > >   * win32_error_to_posix - convert Win32 error to POSIX error number
> > >   *
> > > @@ -977,3 +1006,417 @@ int qemu_mknodat(int dirfd, const char *filename,
> > mode_t mode, dev_t dev)
> > >      errno = ENOTSUP;
> > >      return -1;
> > >  }
> > > +
> > > +static int file_id_compare(const void *id_ptr1, const void *id_ptr2)
> > > +{
> > > +    uint64_t id[2];
> > > +
> > > +    id[0] = *(uint64_t *)id_ptr1;
> > > +    id[1] = *(uint64_t *)id_ptr2;
> > > +
> > > +    if (id[0] > id[1]) {
> > > +        return 1;
> > > +    } else if (id[0] < id[1]) {
> > > +        return -1;
> > > +    } else {
> > > +        return 0;
> > > +    }
> > > +}
> > > +
> > > +static int get_next_entry(struct dir_win32 *stream) {
> > > +    HANDLE hDirEntry = INVALID_HANDLE_VALUE;
> > > +    char *entry_name;
> > > +    char *entry_start;
> > > +    FILE_ID_DESCRIPTOR fid;
> > > +    DWORD attribute;
> > > +
> > > +    if (stream->file_id_list[stream->offset] == stream->dot_id) {
> > > +        strcpy(stream->dd_dir.d_name, ".");
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (stream->file_id_list[stream->offset] == stream->dot_dot_id) {
> > > +        strcpy(stream->dd_dir.d_name, "..");
> > > +        return 0;
> > > +    }
> > > +
> > > +    fid.dwSize = sizeof(fid);
> > > +    fid.Type = FileIdType;
> > > +
> > > +    fid.FileId.QuadPart = stream->file_id_list[stream->offset];
> > > +
> > > +    hDirEntry = OpenFileById(stream->hDir, &fid, GENERIC_READ,
> > > +                             FILE_SHARE_READ | FILE_SHARE_WRITE
> > > +                             | FILE_SHARE_DELETE,
> > > +                             NULL,
> > > +                             FILE_FLAG_BACKUP_SEMANTICS
> > > +                             | FILE_FLAG_OPEN_REPARSE_POINT);
> > 
> > What's the purpose of FILE_FLAG_OPEN_REPARSE_POINT here? As it's apparently
> > not obvious, please add a comment.
> > 
> 
> If do not use this flag, and if file id is a symbolic link, then Windows will not symbolic link itself, but open the target file.
> This flag is similar as O_NOFOLLOW flag.

OK, got it, thanks! But please add a comment in code that describes this.

> > > +
> > > +    if (hDirEntry == INVALID_HANDLE_VALUE) {
> > > +        /*
> > > +         * Not open it successfully, it may be deleted.
> > 
> > Wrong English. "Open failed, it may have been deleted in the meantime.".
> > 
> > > +         * Try next id.
> > > +         */
> > > +        return -1;
> > > +    }
> > > +
> > > +    entry_name = get_full_path_win32(hDirEntry, NULL);
> > > +
> > > +    CloseHandle(hDirEntry);
> > > +
> > > +    if (entry_name == NULL) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    attribute = GetFileAttributes(entry_name);
> > > +
> > > +    /* symlink is not allowed */
> > > +    if (attribute == INVALID_FILE_ATTRIBUTES
> > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
> > > +        return -1;
> > 
> > Wouldn't it make sense to call warn_report_once() here to let the user know
> > that he has some symlinks that are never delivered to guest?
> 
> OK, Got it.
> 
> > 
> > > +    }
> > > +
> > > +    if (memcmp(entry_name, stream->dd_name, stream->dir_name_len) !=
> > > + 0) {
> > 
> > No, that's unsafe. You want to use something like strncmp() instead.
> > 
> > > +        /*
> > > +         * The full entry file name should be a part of parent directory
> > name,
> > > +         * except dot and dot_dot (is already handled).
> > > +         * If not, this entry should not be returned.
> > > +         */
> > > +        return -1;
> > > +    }
> > > +
> > > +    entry_start = entry_name + stream->dir_name_len;
> > 
> > s/entry_start/entry_basename/ ?
> > 
> > > +
> > > +    /* skip slash */
> > > +    while (*entry_start == '\\') {
> > > +        entry_start++;
> > > +    }
> > > +
> > > +    if (strchr(entry_start, '\\') != NULL) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (strlen(entry_start) == 0
> > > +        || strlen(entry_start) + 1 > sizeof(stream->dd_dir.d_name)) {
> > > +        return -1;
> > > +    }
> > > +    strcpy(stream->dd_dir.d_name, entry_start);
> > 
> > g_path_get_basename() ? :)
> 
> For above three comments:
> This code is not good, should be fixed.
> The code want to filter the following cases:
> The parent directory path is not a part of entry's full path: 
> Parent: C:\123\456, entry: C:\123, C:\
> Entry contains more than one name components:
> Parent: C:\123\456, entry: C:\123\456\789\abc
> Entry is zero length or name buffer is too long
> 
> I will refactor this part.

In general: writing parsing code yourself is extremely error prone. That's why
it makes sense to use existing functions from glib, etc.

> > 
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +/*
> > > + * opendir_win32 - open a directory
> > > + *
> > > + * This function opens a directory and caches all directory entries.
> > 
> > It just caches all file IDs, doesn't it?
> > 
> 
> Will fix it
> 
> > > + */
> > > +DIR *opendir_win32(const char *full_file_name) {
> > > +    HANDLE hDir = INVALID_HANDLE_VALUE;
> > > +    HANDLE hDirEntry = INVALID_HANDLE_VALUE;
> > > +    char *full_dir_entry = NULL;
> > > +    DWORD attribute;
> > > +    intptr_t dd_handle = -1;
> > > +    struct _finddata_t dd_data;
> > > +    uint64_t file_id;
> > > +    uint64_t *file_id_list = NULL;
> > > +    BY_HANDLE_FILE_INFORMATION FileInfo;
> > 
> > FileInfo is the variable name, not a struct name, so no upper case for it
> > please.
> 
> Will fix it.
> > 
> > > +    struct dir_win32 *stream = NULL;
> > > +    int err = 0;
> > > +    int find_status;
> > > +    int sort_first_two_entry = 0;
> > > +    uint32_t list_count = 16;
> > 
> > Magic number 16?
> 
> Will change it to a macro.
> > 
> > > +    uint32_t index = 0;
> > > +
> > > +    /* open directory to prevent it being removed */
> > > +
> > > +    hDir = CreateFile(full_file_name, GENERIC_READ,
> > > +                      FILE_SHARE_READ | FILE_SHARE_WRITE |
> > FILE_SHARE_DELETE,
> > > +                      NULL,
> > > +                      OPEN_EXISTING,
> > > +                      FILE_FLAG_BACKUP_SEMANTICS |
> > FILE_FLAG_OPEN_REPARSE_POINT,
> > > +                      NULL);
> > > +
> > > +    if (hDir == INVALID_HANDLE_VALUE) {
> > > +        err = win32_error_to_posix(GetLastError());
> > > +        goto out;
> > > +    }
> > > +
> > > +    attribute = GetFileAttributes(full_file_name);
> > > +
> > > +    /* symlink is not allow */
> > > +    if (attribute == INVALID_FILE_ATTRIBUTES
> > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
> > > +        err = EACCES;
> > > +        goto out;
> > > +    }
> > > +
> > > +    /* check if it is a directory */
> > > +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) == 0) {
> > > +        err = ENOTDIR;
> > > +        goto out;
> > > +    }
> > > +
> > > +    file_id_list = g_malloc0(sizeof(uint64_t) * list_count);
> > > +
> > > +    /*
> > > +     * findfirst() needs suffix format name like "\dir1\dir2\*",
> > > +     * allocate more buffer to store suffix.
> > > +     */
> > > +    stream = g_malloc0(sizeof(struct dir_win32) +
> > > + strlen(full_file_name) + 3);
> > 
> > Not that I would care much, but +2 would be correct here, as you declared the
> > struct with one character already, so it is not a classic (zero size) flex
> > array:
> > 
> >   struct dir_win32 {
> >     ...
> >     char dd_name[1];
> >   };
> > 
> Will fix it.
> 
> > > +
> > > +    strcpy(stream->dd_name, full_file_name);
> > > +    strcat(stream->dd_name, "\\*");
> > > +
> > > +    stream->hDir = hDir;
> > > +    stream->dir_name_len = strlen(full_file_name);
> > > +
> > > +    dd_handle = _findfirst(stream->dd_name, &dd_data);
> > > +
> > > +    if (dd_handle == -1) {
> > > +        err = errno;
> > > +        goto out;
> > > +    }
> > > +
> > > +    /* read all entries to link list */
> > 
> > "read all entries as a linked list"
> > 
> > However there is no linked list here. It seems to be an array.
> 
> Will fix it.
> > 
> > > +    do {
> > > +        full_dir_entry = get_full_path_win32(hDir, dd_data.name);
> > > +
> > > +        if (full_dir_entry == NULL) {
> > > +            err = ENOMEM;
> > > +            break;
> > > +        }
> > > +
> > > +        /*
> > > +         * Open every entry and get the file informations.
> > > +         *
> > > +         * Skip symbolic links during reading directory.
> > > +         */
> > > +        hDirEntry = CreateFile(full_dir_entry,
> > > +                               GENERIC_READ,
> > > +                               FILE_SHARE_READ | FILE_SHARE_WRITE
> > > +                               | FILE_SHARE_DELETE,
> > > +                               NULL,
> > > +                               OPEN_EXISTING,
> > > +                               FILE_FLAG_BACKUP_SEMANTICS
> > > +                               | FILE_FLAG_OPEN_REPARSE_POINT, NULL);
> > > +
> > > +        if (hDirEntry != INVALID_HANDLE_VALUE) {
> > > +            if (GetFileInformationByHandle(hDirEntry,
> > > +                                           &FileInfo) == TRUE) {
> > > +                attribute = FileInfo.dwFileAttributes;
> > > +
> > > +                /* only save validate entries */
> > > +                if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) == 0) {
> > > +                    if (index >= list_count) {
> > > +                        list_count = list_count + 16;
> > 
> > Magic number 16 again.
> > 
> > > +                        file_id_list = g_realloc(file_id_list,
> > > +                                                 sizeof(uint64_t)
> > > +                                                 * list_count);
> > 
> > OK, so here we are finally at the point where you chose the overall behaviour
> > for this that we discussed before.
> > 
> > So you are constantly appending 16 entry chunks to the end of the array,
> > periodically reallocate the entire array, and potentially end up with one
> > giant dense array with *all* file IDs of the directory.
> > 
> > That's not really what I had in mind, as it still has the potential to easily
> > crash QEMU if there are large directories on host. Theoretically a Windows
> > directory might then consume up to 16 GB of RAM for looking up only one
> > single directory.
> > 
> > So is this the implementation that you said was very slow, or did you test a
> > different one? Remember, my orgiginal idea (as starting point for Windows)
> > was to only cache *one* file ID (the last being looked up). That's it. Not a
> > list of file IDs.
> 
> If only cache one file ID, that means for every read directory operation.
> we need to look up whole directory to find out the next ID larger than last cached one.
> 
> I provided some performance test in last patch:
> Run test for read directory with 100, 1000, 10000 entries
> #1, For file name cache solution, the time cost is: 2, 9, 44 (in ms).
> #2, For file id cache solution, the time cost: 3, 438, 4338 (in ms). This is current solution.
> #3, for cache one id solution, I just tested it: 4, 4788, more than one minutes (in ms)
> 
> I think it is not a good idea to cache one file id, it would be very bad performance

Yes, the performce would be lousy, but at least we would have a basis that
just works^TM. Correct behaviour always comes before performance. And from
there you could add additional patches on top to address performance
improvements. Because the point is: your implementation is also suboptimal,
and more importantly: prone to crashes like we discussed before.

Regarding performance: for instance you are re-allocating an entire dense
buffer on every 16 new entries. That will slow down things extremely. Please
use a container from glib, because these are handling resize operations more
smoothly for you out of the box, i.e. typically by doubling the container
capacity instead of re-allocating frequently with small chunks like you did.

However I am still not convinced that allocating a huge dense buffer with
*all* file IDs of a directory makes sense.

On the long-term it would make sense to do it like other implementations:
store a snapshot of the directory temporarily on disk. That way it would not
matter how huge the directory is. But that's a complex implementation, so not
something that I would do in this series already.

On the short/mid term I think we could simply make a mix of your solution and
the one-ID solution that I suggested: keeping a maximum of e.g. 1k file IDs in
RAM. And once guest seeks past that boundary, loading the subsequent 1k
entries, free-ing the previous 1k entries, and so on.

> > 
> > > +                    }
> > > +                    file_id = (uint64_t)FileInfo.nFileIndexLow
> > > +                              + (((uint64_t)FileInfo.nFileIndexHigh)
> > > + << 32);
> > > +
> > > +
> > > +                    file_id_list[index] = file_id;
> > > +
> > > +                    if (strcmp(dd_data.name, ".") == 0) {
> > > +                        stream->dot_id = file_id_list[index];
> > > +                        if (index != 0) {
> > > +                            sort_first_two_entry = 1;
> > > +                        }
> > > +                    } else if (strcmp(dd_data.name, "..") == 0) {
> > > +                        stream->dot_dot_id = file_id_list[index];
> > > +                        if (index != 1) {
> > > +                            sort_first_two_entry = 1;
> > > +                        }
> > > +                    }
> > > +                    index++;
> > > +                }
> > > +            }
> > > +            CloseHandle(hDirEntry);
> > > +        }
> > > +        g_free(full_dir_entry);
> > > +        find_status = _findnext(dd_handle, &dd_data);
> > > +    } while (find_status == 0);
> > > +
> > > +    if (errno == ENOENT) {
> > > +        /* No more matching files could be found, clean errno */
> > > +        errno = 0;
> > > +    } else {
> > > +        err = errno;
> > > +        goto out;
> > > +    }
> > > +
> > > +    stream->total_entries = index;
> > > +    stream->file_id_list = file_id_list;
> > > +
> > > +    if (sort_first_two_entry == 0) {
> > > +        /*
> > > +         * If the first two entry is "." and "..", then do not sort them.
> > > +         *
> > > +         * If the guest OS always considers first two entries are "." and
> > "..",
> > > +         * sort the two entries may cause confused display in guest OS.
> > > +         */
> > > +        qsort(&file_id_list[2], index - 2, sizeof(file_id),
> > file_id_compare);
> > > +    } else {
> > > +        qsort(&file_id_list[0], index, sizeof(file_id), file_id_compare);
> > > +    }
> > 
> > Were there cases where you did not get "." and ".." ?
> 
> NTFS always provides "." and "..".
> I could add more checks here to fix this risk

That's what I assumed. So you can probably just drop this code for simplicity.

> 
> > 
> > > +
> > > +out:
> > > +    if (err != 0) {
> > > +        errno = err;
> > > +        if (stream != NULL) {
> > > +            if (file_id_list != NULL) {
> > > +                g_free(file_id_list);
> > > +            }
> > > +            CloseHandle(hDir);
> > > +            g_free(stream);
> > > +            stream = NULL;
> > > +        }
> > > +    }
> > > +
> > > +    if (dd_handle != -1) {
> > > +        _findclose(dd_handle);
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
> > > +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> > > +
> > > +    if (stream == NULL) {
> > > +        errno = EBADF;
> > > +        return -1;
> > > +    }
> > > +
> > > +    /* free all resources */
> > > +    CloseHandle(stream->hDir);
> > > +
> > > +    g_free(stream->file_id_list);
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
> > > +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> > > +
> > > +    if (stream == NULL) {
> > > +        errno = EBADF;
> > > +        return NULL;
> > > +    }
> > > +
> > > +retry:
> > > +
> > > +    if (stream->offset >= stream->total_entries) {
> > > +        /* reach to the end, return NULL without set errno */
> > > +        return NULL;
> > > +    }
> > > +
> > > +    if (get_next_entry(stream) != 0) {
> > > +        stream->offset++;
> > > +        goto retry;
> > > +    }
> > > +
> > > +    /* Windows does not provide inode number */
> > > +    stream->dd_dir.d_ino = 0;
> > > +    stream->dd_dir.d_reclen = 0;
> > > +    stream->dd_dir.d_namlen = strlen(stream->dd_dir.d_name);
> > > +
> > > +    stream->offset++;
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
> > > +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> > > +
> > > +    if (stream == NULL) {
> > > +        errno = EBADF;
> > > +        return;
> > > +    }
> > > +
> > > +    stream->offset = 0;
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
> > > +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> > > +
> > > +    if (stream == NULL) {
> > > +        errno = EBADF;
> > > +        return;
> > > +    }
> > > +
> > > +    if (pos < -1) {
> > > +        errno = EINVAL;
> > > +        return;
> > > +    }
> > > +
> > > +    if (pos == -1 || pos >= (long)stream->total_entries) {
> > > +        /* seek to the end */
> > > +        stream->offset = stream->total_entries;
> > > +        return;
> > > +    }
> > > +
> > > +    if (pos - (long)stream->offset == 0) {
> > > +        /* no need to seek */
> > > +        return;
> > > +    }
> > > +
> > > +    stream->offset = pos;
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
> > > +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> > > +
> > > +    if (stream == NULL) {
> > > +        errno = EBADF;
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
> > 
> 
> 
> 




