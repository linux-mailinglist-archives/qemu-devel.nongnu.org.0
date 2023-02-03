Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81868988E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 13:26:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNv7d-0007EG-Eg; Fri, 03 Feb 2023 07:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pNv7a-0007Ds-MW
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:24:50 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pNv7Y-0007pf-0k
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=sd/DqgbTnLKtTVMSyj5XBwL4hvKkI0qq0JGpNX/ohRo=; b=rarSauazZV5RjRlzOldnjYAkPM
 5FGSXpHbbeGzkScn9DW0aAA2xTY/ODu1ISLR8RpgHRrjIM9krcX8mPmVC3ZpQIL3uc9esryCudJDZ
 jYJzpl+BaFHemMWybvbhL0o8+gVvN2Q5iFTzH0cXiXk7jJ1heSYXsHApq3mx8GrwgAnjXRlLSwtB6
 ypdIgIQzlZsV0tKymVcrbl9ZzoGJwDKqIZyZCSI0mCAObaLctXWdrOe3ZylHp5W4w+qtasacWjPWS
 IdPPhs6yyN/nBVgkajWILFQHZgwHB+MYUQ4YdPKnCmUePvPHIi1l8tvy+21okRIYGmFJ518Gvn5oP
 7mZZUuQuOdHbNmsaQgKU1wNPb9viWiEoLrzS0bjDpmZx9/ODkRIuxqx8if0ywVovGg2on4i9leTu+
 lqAJ0IjRzy3D/Pb7QspRsWzMBNf8fPcUDr34eFC3G6FU9fUJSnUkq5iz5LcIprdD50bajdFwrdVwX
 7VdkGyO1YzWcKJYFyHOd7rvXojMNig1ZmTSizH34Eudl6SkRoQPGA74BUyCurNYptzQVTrYmGKGpH
 I1+HrmMC0NMIruc7nmghMVyjwT/uG4E6OGMq78j6SVfdaJ6m88ej7k7SealJKEAS49z4n75ynJdP7
 T+nOTo8FHCbhpdZvQo5/KokAQ3Ff9uiLaft6zt1yo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Date: Fri, 03 Feb 2023 13:24:40 +0100
Message-ID: <2770789.QfI4yIDJDK@silver>
In-Reply-To: <20230130095202.2773186-5-bin.meng@windriver.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <20230130095202.2773186-5-bin.meng@windriver.com>
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

On Monday, January 30, 2023 10:51:50 AM CET Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> This commit implements Windows specific xxxdir() APIs for safety
> directory access.
> 

This issue deserves a link to either the previous discussion

Link: https://lore.kernel.org/qemu-devel/2830993.GtbaR8S6b6@silver/

and/or a link to this continuation of the discussion here, as it's not a
trivial issue, with pros and cons been discussed for the individual, possible
solutions.

> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/9pfs/9p-util.h       |   6 +
>  hw/9pfs/9p-util-win32.c | 296 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 302 insertions(+)
> 
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 0f159fb4ce..c1c251fbd1 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -141,6 +141,12 @@ int unlinkat_win32(int dirfd, const char *pathname, int flags);
>  int statfs_win32(const char *root_path, struct statfs *stbuf);
>  int openat_dir(int dirfd, const char *name);
>  int openat_file(int dirfd, const char *name, int flags, mode_t mode);
> +DIR *opendir_win32(const char *full_file_name);
> +int closedir_win32(DIR *pDir);
> +struct dirent *readdir_win32(DIR *pDir);
> +void rewinddir_win32(DIR *pDir);
> +void seekdir_win32(DIR *pDir, long pos);
> +long telldir_win32(DIR *pDir);
>  #endif
>  
>  static inline void close_preserve_errno(int fd)
> diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
> index a99d579a06..5503199300 100644
> --- a/hw/9pfs/9p-util-win32.c
> +++ b/hw/9pfs/9p-util-win32.c
> @@ -37,6 +37,13 @@
>   *    Windows does not support opendir, the directory fd is created by
>   *    CreateFile and convert to fd by _open_osfhandle(). Keep the fd open will
>   *    lock and protect the directory (can not be modified or replaced)
> + *
> + * 5. Windows and MinGW does not provide safety directory accessing functions.
> + *    readdir(), seekdir() and telldir() may get or set wrong value because
> + *    directory entry data is not protected.

I would rephrase that sentence, as it doesn't cover the root problem
adequately. Maybe something like this:

5. Neither Windows native APIs, nor MinGW provide a POSIX compatible API for
acquiring directory entries in a safe way. Calling those APIs (native
_findfirst() and _findnext() or MinGW's readdir(), seekdir() and telldir())
directly can lead to an inconsistent state if directory is modified in
between, e.g. the same directory appearing more than once in output, or
directories not appearing at all in output even though they were neither newly
created nor deleted. POSIX does not define what happens with deleted or newly
created directories in between, but it guarantees a consistent state.

> + *
> + *    This file re-write POSIX directory accessing functions and cache all
> + *    directory entries during opening.
>   */
>  
>  #include "qemu/osdep.h"
> @@ -51,6 +58,27 @@
>  
>  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
>  
> +/*
> + * MinGW and Windows does not provide safety way to seek directory while other
> + * thread is modifying same directory.
> + *
> + * The two structures are used to cache all directory entries when opening it.
> + * Cached entries are always returned for read or seek.
> + */
> +struct dir_win32_entry {
> +    QSLIST_ENTRY(dir_win32_entry) node;
> +    struct _finddata_t dd_data;
> +};
> +
> +struct dir_win32 {
> +    struct dirent dd_dir;
> +    uint32_t offset;
> +    uint32_t total_entries;
> +    QSLIST_HEAD(, dir_win32_entry) head;
> +    struct dir_win32_entry *current;
> +    char dd_name[1];
> +};
> +
>  /*
>   * win32_error_to_posix - convert Win32 error to POSIX error number
>   *
> @@ -977,3 +1005,271 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>      errno = ENOTSUP;
>      return -1;
>  }
> +
> +/*
> + * opendir_win32 - open a directory
> + *
> + * This function opens a directory and caches all directory entries.
> + */
> +DIR *opendir_win32(const char *full_file_name)
> +{
> +    HANDLE hDir = INVALID_HANDLE_VALUE;
> +    DWORD attribute;
> +    intptr_t dd_handle = -1;
> +    struct _finddata_t dd_data;
> +
> +    struct dir_win32 *stream = NULL;
> +    struct dir_win32_entry *dir_entry;
> +    struct dir_win32_entry *prev;
> +    struct dir_win32_entry *next;
> +
> +    int err = 0;
> +    int find_status;
> +    uint32_t index;
> +
> +    /* open directory to prevent it being removed */
> +
> +    hDir = CreateFile(full_file_name, GENERIC_READ,
> +                      FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
> +                      NULL,
> +                      OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
> +
> +    if (hDir == INVALID_HANDLE_VALUE) {
> +        err = win32_error_to_posix(GetLastError());
> +        goto out;
> +    }
> +
> +    attribute = GetFileAttributes(full_file_name);
> +
> +    /* symlink is not allow */
> +    if (attribute == INVALID_FILE_ATTRIBUTES
> +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
> +        err = EACCES;
> +        goto out;
> +    }
> +
> +    /* check if it is a directory */
> +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) == 0) {
> +        err = ENOTDIR;
> +        goto out;
> +    }
> +
> +    /*
> +     * findfirst() need suffix format name like "\dir1\dir2\*", allocate more
> +     * buffer to store suffix.
> +     */
> +    stream = g_malloc0(sizeof(struct dir_win32) + strlen(full_file_name) + 3);
> +    QSLIST_INIT(&stream->head);
> +
> +    strcpy(stream->dd_name, full_file_name);
> +    strcat(stream->dd_name, "\\*");
> +
> +    dd_handle = _findfirst(stream->dd_name, &dd_data);
> +
> +    if (dd_handle == -1) {
> +        err = errno;
> +        goto out;
> +    }
> +
> +    index = 0;
> +
> +    /* read all entries to link list */
> +    do {
> +        dir_entry = g_malloc0(sizeof(struct dir_win32_entry));
> +        memcpy(&dir_entry->dd_data, &dd_data, sizeof(dd_data));
> +        if (index == 0) {
> +            QSLIST_INSERT_HEAD(&stream->head, dir_entry, node);
> +        } else {
> +            QSLIST_INSERT_AFTER(prev, dir_entry, node);
> +        }
> +
> +        prev = dir_entry;
> +        find_status = _findnext(dd_handle, &dd_data);
> +
> +        index++;
> +    } while (find_status == 0);

So you decided to go for the solution that caches all entries of a directory
in RAM.

So don't you think my last suggested solution that would call native
_findfirst() and _findnext() directly, but without any chaching and instead
picking the relevent entry simply by inode number, might be a better candidate
as a starting point for landing Windows support? Link to that previous
suggestion:

https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/

> +
> +    if (errno == ENOENT) {
> +        /* No more matching files could be found, clean errno */
> +        errno = 0;
> +    } else {
> +        err = errno;
> +        goto out;
> +    }
> +
> +    stream->total_entries = index;
> +    stream->current = QSLIST_FIRST(&stream->head);
> +
> +out:
> +    if (err != 0) {
> +        errno = err;
> +        /* free whole list */
> +        if (stream != NULL) {
> +            QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next) {
> +                QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_entry, node);
> +                g_free(dir_entry);
> +            }
> +            g_free(stream);
> +            stream = NULL;
> +        }
> +    }
> +
> +    /* after cached all entries, this handle is useless */
> +    if (dd_handle != -1) {
> +        _findclose(dd_handle);
> +    }
> +
> +    if (hDir != INVALID_HANDLE_VALUE) {
> +        CloseHandle(hDir);
> +    }
> +
> +    return (DIR *)stream;
> +}
> +
> +/*
> + * closedir_win32 - close a directory
> + *
> + * This function closes directory and free all cached resources.
> + */
> +int closedir_win32(DIR *pDir)
> +{
> +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> +    struct dir_win32_entry *dir_entry;
> +    struct dir_win32_entry *next;
> +
> +    if (stream == NULL) {
> +        errno = EBADF;
> +        return -1;
> +    }
> +
> +    /* free all resources */
> +
> +    QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next) {
> +        QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_entry, node);
> +        g_free(dir_entry);
> +    }
> +
> +    g_free(stream);
> +
> +    return 0;
> +}
> +
> +/*
> + * readdir_win32 - read a directory
> + *
> + * This function reads a directory entry from cached entry list.
> + */
> +struct dirent *readdir_win32(DIR *pDir)
> +{
> +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> +
> +    if (stream == NULL) {
> +        errno = EBADF;
> +        return NULL;
> +    }
> +
> +    if (stream->offset >= stream->total_entries) {
> +        /* reach to the end, return NULL without set errno */
> +        return NULL;
> +    }
> +
> +    memcpy(stream->dd_dir.d_name,
> +           stream->current->dd_data.name,
> +           sizeof(stream->dd_dir.d_name));
> +
> +    /* Windows does not provide inode number */
> +    stream->dd_dir.d_ino = 0;
> +    stream->dd_dir.d_reclen = 0;
> +    stream->dd_dir.d_namlen = strlen(stream->dd_dir.d_name);
> +
> +    stream->offset++;
> +    stream->current = QSLIST_NEXT(stream->current, node);
> +
> +    return &stream->dd_dir;
> +}
> +
> +/*
> + * rewinddir_win32 - reset directory stream
> + *
> + * This function resets the position of the directory stream to the
> + * beginning of the directory.
> + */
> +void rewinddir_win32(DIR *pDir)
> +{
> +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> +
> +    if (stream == NULL) {
> +        errno = EBADF;
> +        return;
> +    }
> +
> +    stream->offset = 0;
> +    stream->current = QSLIST_FIRST(&stream->head);
> +
> +    return;
> +}
> +
> +/*
> + * seekdir_win32 - set the position of the next readdir() call in the directory
> + *
> + * This function sets the position of the next readdir() call in the directory
> + * from which the next readdir() call will start.
> + */
> +void seekdir_win32(DIR *pDir, long pos)
> +{
> +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> +    uint32_t index;
> +
> +    if (stream == NULL) {
> +        errno = EBADF;
> +        return;
> +    }
> +
> +    if (pos < -1) {
> +        errno = EINVAL;
> +        return;
> +    }
> +
> +    if (pos == -1 || pos >= (long)stream->total_entries) {
> +        /* seek to the end */
> +        stream->offset = stream->total_entries;
> +        return;
> +    }
> +
> +    if (pos - (long)stream->offset == 0) {
> +        /* no need to seek */
> +        return;
> +    }
> +
> +    /* seek position from list head */
> +
> +    stream->current = QSLIST_FIRST(&stream->head);
> +
> +    for (index = 0; index < (uint32_t)pos; index++) {
> +        stream->current = QSLIST_NEXT(stream->current, node);
> +    }
> +    stream->offset = index;
> +
> +    return;
> +}
> +
> +/*
> + * telldir_win32 - return current location in directory
> + *
> + * This function returns current location in directory.
> + */
> +long telldir_win32(DIR *pDir)
> +{
> +    struct dir_win32 *stream = (struct dir_win32 *)pDir;
> +
> +    if (stream == NULL) {
> +        errno = EBADF;
> +        return -1;
> +    }
> +
> +    if (stream->offset > stream->total_entries) {
> +        return -1;
> +    }
> +
> +    return (long)stream->offset;
> +}
> 



