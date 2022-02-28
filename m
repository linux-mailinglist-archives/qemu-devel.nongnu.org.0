Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9C4C6EB5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:57:38 +0100 (CET)
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgWv-0002ax-Fs
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:57:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nOgRa-0005sc-I5
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:52:06 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:36867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nOgRW-0001D5-SL
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=VYem4fErYnALS0sBQftwgLq/2PdJLAFa5fHQw3s0Ew4=; b=NIjltJPIkzwSukmkJApH/SNx+U
 22WowxBeMx9eUY7qKSXK0TCQ/TZ9swpeUBQxa3EOm+9CYSiDCjSDabb8Wir8GRVYcPQECH7e0XizE
 ujBD5kTgZZSkkAFegLI+jSBf2DliY1F/GNQZZVeMyMgd7GYMITIvErrcLo2HaOiFArMOHZpG08dEO
 jU7yE1HzvtgCrHi6dH2RHhKzu+C2e9UwT+WTjAOJ5jSXId23j9zddDltHttYign6nVq/Ddi961ex7
 Kf9CwQjCp+4U81Ky6UZwd3wTqwpkY0sMO76HHVbgye9BgjZr0g3PWsFdppbamzCM/U0tjWZObDSNX
 6lHXmUWEMEqTrTJyBLp4nph+TABo3mlHNH2Xl+Swt9jCYVhDuXCuKhAn+q72YJuvF+a25kbevhyAj
 IG1yAW13yTsQPC2EgQefBSQIvTHol+Fjbr0uKDlvkVRLi3KnWiL8BdVkXxtynzXbEnQ6Fh/lXEwkL
 e1O+ruhqiSjzeYhh5ylp0yX3ybcB1EwV+t456dtHfNEp38KI3AIdW1LBvx3s/uNYTSfkZlo0YFP7G
 K7YeAEIGtQ70qv4xsJFXTZuieGgScY53yIJTkw0JVg/62k6uyKOW04dy5CJp2x5bKVj9rBhkrarG1
 KAcQS/GWLRYu5C/jEsabsVnWgtw1W1rLVIMnNpg1A=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Mon, 28 Feb 2022 14:51:58 +0100
Message-ID: <1808194.U6vU4amhyU@silver>
In-Reply-To: <493ea7b6-4e62-5c6e-682b-d5a787ae9299@redhat.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <5277572.8N0aQqchxN@silver> <493ea7b6-4e62-5c6e-682b-d5a787ae9299@redhat.com>
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

On Montag, 28. Februar 2022 14:36:30 CET Thomas Huth wrote:
> On 28/02/2022 14.20, Christian Schoenebeck wrote:
> > On Sonntag, 27. Februar 2022 23:35:20 CET Will Cohen wrote:
> >> From: Keno Fischer <keno@juliacomputing.com>
> >> 
> >> Darwin does not support mknodat. However, to avoid race conditions
> >> with later setting the permissions, we must avoid using mknod on
> >> the full path instead. We could try to fchdir, but that would cause
> >> problems if multiple threads try to call mknodat at the same time.
> >> However, luckily there is a solution: Darwin includes a function
> >> that sets the cwd for the current thread only.
> >> This should suffice to use mknod safely.
> >> 
> >> This function (pthread_fchdir_np) is protected by a check in
> >> meson in a patch later in this series.
> >> 
> >> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> >> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> >> [Will Cohen: - Adjust coding style
> >> 
> >>               - Replace clang references with gcc
> >>               - Note radar filed with Apple for missing syscall
> >>               - Replace direct syscall with pthread_fchdir_np and
> >>               
> >>                 adjust patch notes accordingly
> >>               
> >>               - Declare pthread_fchdir_np with
> >>               - __attribute__((weak_import)) to allow checking for
> >>               
> >>                 its presence before usage
> >>               
> >>               - Move declarations above cplusplus guard
> >>               - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
> >>               
> >>                 presence in 9p-util
> >>               
> >>               - Rebase to apply cleanly on top of the 2022-02-10
> >>               
> >>                 changes to 9pfs
> >>               
> >>               - Fix line over 90 characters formatting error]
> >> 
> >> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> >> ---
> >> 
> >>   hw/9pfs/9p-local.c       |  4 ++--
> >>   hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
> >>   hw/9pfs/9p-util-linux.c  |  6 ++++++
> >>   hw/9pfs/9p-util.h        | 11 +++++++++++
> >>   meson.build              |  1 +
> >>   5 files changed, 53 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> >> index a0d08e5216..d42ce6d8b8 100644
> >> --- a/hw/9pfs/9p-local.c
> >> +++ b/hw/9pfs/9p-local.c
> >> @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> >> *dir_path,
> >> 
> >>       if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> >>       
> >>           fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> >> 
> >> -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> >> +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
> >> 
> >>           if (err == -1) {
> >>           
> >>               goto out;
> >>           
> >>           }
> >> 
> >> @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
> >> *dir_path, }
> >> 
> >>       } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> >>       
> >>                  fs_ctx->export_flags & V9FS_SM_NONE) {
> >> 
> >> -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> >> +        err = qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
> >> 
> >>           if (err == -1) {
> >>           
> >>               goto out;
> >>           
> >>           }
> >> 
> >> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> >> index cdb4c9e24c..bec0253474 100644
> >> --- a/hw/9pfs/9p-util-darwin.c
> >> +++ b/hw/9pfs/9p-util-darwin.c
> >> @@ -7,6 +7,8 @@
> >> 
> >>   #include "qemu/osdep.h"
> >>   #include "qemu/xattr.h"
> >> 
> >> +#include "qapi/error.h"
> >> +#include "qemu/error-report.h"
> >> 
> >>   #include "9p-util.h"
> >>   
> >>   ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const
> >>   char
> >> 
> >> *name, @@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const char
> >> *filename, const char *name, close_preserve_errno(fd);
> >> 
> >>       return ret;
> >>   
> >>   }
> >> 
> >> +
> >> +/*
> >> + * As long as mknodat is not available on macOS, this workaround
> >> + * using pthread_fchdir_np is needed.
> >> + *
> >> + * Radar filed with Apple for implementing mknodat:
> >> + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> >> + */
> >> +#if defined CONFIG_PTHREAD_FCHDIR_NP
> >> +
> >> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> >> dev)
> >> +{
> >> +    int preserved_errno, err;
> >> +    if (!pthread_fchdir_np) {
> >> +        error_report_once("pthread_fchdir_np() not available on this
> >> version of macOS");> 
> > You took the code style error message a bit too literal; this line is
> > still
> > too long:
> > 
> > WARNING: line over 80 characters
> > #199: FILE: hw/9pfs/9p-util-darwin.c:81:
> > +        error_report_once("pthread_fchdir_np() not available on this
> > version of macOS");
> > 
> > total: 0 errors, 1 warnings, 91 lines checked
> > 
> > However this is too trivial to send a v10 just for this. If there are no
> > other issues in this v9 then I'll simply fix this on my end. My plan is
> > to queue this series tomorrow.
> 
> For lines less than 90 characters, it's just a warning, and I think it's ok
> in such cases to keep it longer than 80 characters, if the result of
> breaking it up would look more awkward otherwise.
> 
>   Thomas

This doesn't look awkward to me:

        error_report_once(
            "pthread_fchdir_np() is not available on this version of macOS"
        );

It silences the warning and grep is not affected either.

Best regards,
Christian Schoenebeck



