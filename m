Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137449FCAA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:19:30 +0100 (CET)
Received: from localhost ([::1]:40704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDT29-0004wt-4K
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:19:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDSyD-0001XJ-C8
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:15:26 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDSyA-00042a-DZ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=GJDQ5irLUT5gE2OhdLOenniDnU919svCGpl3AA6U/OU=; b=vWi41W4AKTzxGDbKtsm6d0lpP5
 HLhC4NM2Ye9uuh01CRYECqfTY0qia0YBR/9a2LabYWWVQmsSsvHrNyxQQvUMWjCKkeh6enpUdH1gw
 R9tZqfjm6UzpUBkWwavK4iwtt3RJVPkSX4pcrCXUy+XJjp97lJlfhHAwjtWVLIFqxn8xW2Urdj3eX
 dA28ZsD9Ts7nb4qyfKrEPdpzqffCXFSBTeMEorYEQUDUPskqUOJYUy24vbDFzHtE4NCGL+/+3jEU/
 +1gsC0UOI+nbDkfMQzVjtlwQQDoxFUholYtR3J8Xhk4m33Zs1dmTgMsZOBg+db4Zrvjfy8nA+UMvb
 cMFJYg1YHTruCelkZY1IV/+uhFaba8hMRPXRNKetGfyZO9TuZbBvmJVuzPF+RLYDctR/BnxErd9dg
 kdxFt3toLuxMHdjJxSsZS5PgjVoBrMSVXODFEgvA/msIbPE9h02YJrorKwtn+2sB7b4EUHCfYPvDM
 VGHAYycEJ2VIuF7Ce9F81PG7Ha8TIP5qX49imo+X8PPFZ48eAQKZUt0I5rlyTP8jED8HFZwX9u7te
 00GyTDW/zUTB+My8Ys4xz1xEFNJBReevXLZmhmrEsuGgGnE5YsVKNjKNxjDK/4HkaSwMg153pD20P
 qs5S5Sx4rY3J/m55+/oQ/Kvy74XOtYkWmVn8ESUcI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, hi@alyssa.is,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 10/11] 9p: darwin: Implement compatibility for mknodat
Date: Fri, 28 Jan 2022 16:15:12 +0100
Message-ID: <1868804.s9PD02ncGZ@silver>
In-Reply-To: <CAB26zV3uHf1r9nVUcrcysbvMojHE_Jz5sM941pc_uSSjYNnogg@mail.gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <3039867.d4g7DdiYNH@silver>
 <CAB26zV3uHf1r9nVUcrcysbvMojHE_Jz5sM941pc_uSSjYNnogg@mail.gmail.com>
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

On Donnerstag, 27. Januar 2022 22:47:54 CET Will Cohen wrote:
> Back when this was being proposed, the original proposer did file such a
> report to Apple, but we're still in this situation!

Ok, but still, do you find it appropriate to just blindly use a private 
syscall that may or may not exist or might change its behaviour at any time 
without a user being aware?

I am not opposed to using workarounds at all, but what I worry about is that 
Apple might change this in whatever way at any time, and as this sycall is 
currently not guarded in this patch at all, we might one day receive bug 
reports by macOS users with symptoms that might not immediately be obvious to 
relate to this being the root cause.

Options that would come to my mind:
- a test case for this syscall
- a clear runtime error message for ordinary users

Is there a rdar or FB number for the report on Apple's side?

> Replacing clang with gcc in v3.
> 
> On Wed, Nov 24, 2021 at 12:20 PM Christian Schoenebeck <
> 
> qemu_oss@crudebyte.com> wrote:
> > On Montag, 22. November 2021 01:49:12 CET Will Cohen wrote:
> > > From: Keno Fischer <keno@juliacomputing.com>
> > > 
> > > Darwin does not support mknodat. However, to avoid race conditions
> > > with later setting the permissions, we must avoid using mknod on
> > > the full path instead. We could try to fchdir, but that would cause
> > > problems if multiple threads try to call mknodat at the same time.
> > > However, luckily there is a solution: Darwin as an (unexposed in the
> > > C library) system call that sets the cwd for the current thread only.
> > > This should suffice to use mknod safely.
> > > 
> > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > [Will Cohen: - Adjust coding style]
> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > ---
> > > 
> > >  hw/9pfs/9p-local.c       |  5 +++--
> > >  hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
> > >  hw/9pfs/9p-util-linux.c  |  5 +++++
> > >  hw/9pfs/9p-util.h        |  2 ++
> > >  4 files changed, 43 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > > index 4268703d05..42b65e143b 100644
> > > --- a/hw/9pfs/9p-local.c
> > > +++ b/hw/9pfs/9p-local.c
> > > @@ -673,7 +673,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > > *dir_path,
> > > 
> > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > >      
> > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > 
> > > -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > > +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> > > 
> > >          if (err == -1) {
> > >          
> > >              goto out;
> > >          
> > >          }
> > > 
> > > @@ -688,7 +688,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > > *dir_path, }
> > > 
> > >      } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > >      
> > >                 fs_ctx->export_flags & V9FS_SM_NONE) {
> > > 
> > > -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> > > +        err = qemu_mknodat(dirfd, name, credp->fc_mode,
> > > credp->fc_rdev);
> > > 
> > >          if (err == -1) {
> > >          
> > >              goto out;
> > >          
> > >          }
> > > 
> > > @@ -701,6 +701,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> > > *dir_path,
> > > 
> > >  err_end:
> > >      unlinkat_preserve_errno(dirfd, name, 0);
> > > 
> > > +
> > > 
> > >  out:
> > >      close_preserve_errno(dirfd);
> > >      return err;
> > > 
> > > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > > index ac414bcbfd..25e67d5067 100644
> > > --- a/hw/9pfs/9p-util-darwin.c
> > > +++ b/hw/9pfs/9p-util-darwin.c
> > > 
> > > @@ -158,3 +158,36 @@ done:
> > >      close_preserve_errno(fd);
> > >      return ret;
> > >  
> > >  }
> > > 
> > > +
> > > +#ifndef SYS___pthread_fchdir
> > > +# define SYS___pthread_fchdir 349
> > > +#endif
> > > +
> > > +/*
> > > + * This is an undocumented OS X syscall. It would be best to avoid it,
> > > + * but there doesn't seem to be another safe way to implement mknodat.
> > > + * Dear Apple, please implement mknodat before you remove this syscall.
> > > + */
> > > +static int fchdir_thread_local(int fd)
> > 
> > Hooo, that's a brave move. Shouldn't its future and likely becoming
> > absence be
> > guarded "somehow"? :)
> > 
> > BTW it might make sense to file a report instead of hoping Apple will just
> > read this comment: ;-)
> > https://feedbackassistant.apple.com/
> > 
> > > +{
> > > +#pragma clang diagnostic push
> > > +#pragma clang diagnostic ignored "-Wdeprecated-declarations"
> > > +    return syscall(SYS___pthread_fchdir, fd);
> > > +#pragma clang diagnostic pop
> > > +}
> > 
> > Consider s/clang/GCC/ then it would also work with GCC. In the end most
> > people
> > probably just use clang on macOS anyway, but just saying.
> > 
> > > +
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > 
> > dev)
> > 
> > > +{
> > > +    int preserved_errno, err;
> > > +    if (fchdir_thread_local(dirfd) < 0) {
> > > +        return -1;
> > > +    }
> > > +    err = mknod(filename, mode, dev);
> > > +    preserved_errno = errno;
> > > +    /* Stop using the thread-local cwd */
> > > +    fchdir_thread_local(-1);
> > > +    if (err < 0) {
> > > +        errno = preserved_errno;
> > > +    }
> > > +    return err;
> > > +}
> > > diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> > > index d54bf57a59..4f57d8c047 100644
> > > --- a/hw/9pfs/9p-util-linux.c
> > > +++ b/hw/9pfs/9p-util-linux.c
> > > @@ -68,3 +68,8 @@ int utimensat_nofollow(int dirfd, const char
> > > *filename,
> > > 
> > >  {
> > >  
> > >      return utimensat(dirfd, filename, times, AT_SYMLINK_NOFOLLOW);
> > >  
> > >  }
> > > 
> > > +
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > 
> > dev)
> > 
> > > +{
> > > +    return mknodat(dirfd, filename, mode, dev);
> > > +}
> > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > > index 1c477a0e66..cac682d335 100644
> > > --- a/hw/9pfs/9p-util.h
> > > +++ b/hw/9pfs/9p-util.h
> > > @@ -105,4 +105,6 @@ ssize_t fremovexattrat_nofollow(int dirfd, const
> > > char
> > > *filename, int utimensat_nofollow(int dirfd, const char *filename,
> > > 
> > >                         const struct timespec times[2]);
> > > 
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > 
> > dev);
> > 
> > > +
> > > 
> > >  #endif


Best regards,
Christian Schoenebeck



