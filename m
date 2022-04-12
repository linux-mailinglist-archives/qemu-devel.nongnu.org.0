Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B89E4FDF63
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:23:51 +0200 (CEST)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFYk-0006fZ-H1
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1neFVB-0004V6-13
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:20:09 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:49857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1neFV7-0002K0-F6
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8v11jweXidVqThNbq+5MFLNlQ7RGyy+i/nahs63CnO0=; b=fJlo/A/B8HzGG1Bets2GolY90k
 0AXlQliZR48/EEtxgGs1iChLh/uBzApteKRnt9b6QlIQYcSZiFVByBKfbzkQceAukJ3HPc/K4NuaJ
 i/O5CedMOKChyskJfPTpyXnZH1kqLBJRd1CxQjjvOoc3i7sFrlyl5uLpvIVrOB5cQtOz4TH/R8KRf
 Os6xGPKl5E9wB731FNwCbuaMUSM39TrSpCggcrtLV04427YIajtvirQdL2q+jLaUCfJeJ0VzldAC3
 jtc5Im6iijsa87aaFwbAxu7NrQTKtxBijGj4T5afljE+G4FGHJM5TS+t87l9KiDXSuPZev1/em3ml
 tKuceLYNkUiaDmtl0C4dB2sP0pBvmSzeqib/N/avgeUOZahEg3HvTEmFhDq3oCaii+P46PKJQeGzk
 zaAmlFPNSy26IYd+0tf47XqOcyVzeQfBaXW5X0V+SRHHnfWndAwHyxYuWpQJY6Z1/3wMdi2NtBcDy
 bbX1RJ5GbHlLjC3ebCoc5Tk3H1Uk2EjnlIdi1UMzTNSoasWDYPi01dxQTIRGMsEw43o0/bq5zufqO
 DXPWcIxI8QhWD5c9gkxTsoFjCcXCKepyqCG8za/SrfJN+EgmQ2O45/ooXyVoB+7qaYBQKYiPkUb0o
 YpOmjfBhVKbHuknKeo6jkqCTsAEcry6l4gTRMCH0U=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>, Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Tue, 12 Apr 2022 14:19:50 +0200
Message-ID: <17933734.zYzKuhC07K@silver>
In-Reply-To: <20220408170059.1134a039@bahia>
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <1684580.f98VPQ1boI@silver> <20220408170059.1134a039@bahia>
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

On Freitag, 8. April 2022 17:00:59 CEST Greg Kurz wrote:
> On Fri, 08 Apr 2022 15:52:25 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Sonntag, 27. Februar 2022 23:35:20 CEST Will Cohen wrote:
> > > From: Keno Fischer <keno@juliacomputing.com>
> > > 
> > > Darwin does not support mknodat. However, to avoid race conditions
> > > with later setting the permissions, we must avoid using mknod on
> > > the full path instead. We could try to fchdir, but that would cause
> > > problems if multiple threads try to call mknodat at the same time.
> > > However, luckily there is a solution: Darwin includes a function
> > > that sets the cwd for the current thread only.
> > > This should suffice to use mknod safely.
> > 
> > [...]
> > 
> > > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > > index cdb4c9e24c..bec0253474 100644
> > > --- a/hw/9pfs/9p-util-darwin.c
> > > +++ b/hw/9pfs/9p-util-darwin.c
> > > @@ -7,6 +7,8 @@
> > > 
> > >  #include "qemu/osdep.h"
> > >  #include "qemu/xattr.h"
> > > 
> > > +#include "qapi/error.h"
> > > +#include "qemu/error-report.h"
> > > 
> > >  #include "9p-util.h"
> > >  
> > >  ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const
> > >  char
> > > 
> > > *name, @@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const char
> > > *filename, const char *name, close_preserve_errno(fd);
> > > 
> > >      return ret;
> > >  
> > >  }
> > > 
> > > +
> > > +/*
> > > + * As long as mknodat is not available on macOS, this workaround
> > > + * using pthread_fchdir_np is needed.
> > > + *
> > > + * Radar filed with Apple for implementing mknodat:
> > > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> > > + */
> > > +#if defined CONFIG_PTHREAD_FCHDIR_NP
> > > +
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > > dev)
> > > +{
> > > +    int preserved_errno, err;
> > > +    if (!pthread_fchdir_np) {
> > > +        error_report_once("pthread_fchdir_np() not available on this
> > > version of macOS"); +        return -ENOTSUP;
> > > +    }
> > > +    if (pthread_fchdir_np(dirfd) < 0) {
> > > +        return -1;
> > > +    }
> > > +    err = mknod(filename, mode, dev);
> > 
> > I just tested this on macOS Monterey and realized mknod() seems to require
> > admin privileges on macOS to work. So if you run QEMU as ordinary user on
> > macOS then mknod() would fail with errno=1 (Operation not permitted).
> > 
> > That means a lot of stuff would simply not work on macOS, unless you
> > really
> > want to run QEMU with super user privileges, which does not sound
> > appealing to me. :/
> > 
> > Should we introduce another fake behaviour here, i.e. remapping this on
> > macOS hosts as regular file and make guest believe it would create a
> > device, similar as we already do for mapped links?
> 
> I'd rather keep that for the mapped security mode only to avoid
> confusion, but qemu_mknodat() is also used in passthrough mode.
> 
> Anyway, it seems that macOS's mknod() only creates device files,
> unlike linux (POSIX) which is also used to create FIFOs, sockets
> and regular files. And it also requires elevated privileges,
> CAP_MKNOD, in order to create device files.
> 
> It seems that this implementation of qemu_mknodat() is just missing
> some features that can be implemented with unprivileged syscalls like
> mkfifo(), socket() and open().

+Akihiko on CC.

Like always when it comes to POSIX APIs, Apple's documentation on this is far 
from being great. I actually had to test out what's supported with mknod() on 
macOS, in which way, and what is not (tested on macOS 12 "Monterey" only):

* S_IFIFO: works, even as regular user.

* S_IFREG: doesn't work, neither as regular user (ERRNO 1, Operation not 
  permitted), nor as super-user (ERRNO 22, Invalid argument). So we should 
  divert that to a regular open() call on macOS.

* S_IFCHR and S_IFBLK: works as super-user, doesn't work for regular user 
  (ERRNO 1, Operation not permitted). So if 9p is used with passthrough 
  permissions, we should probably stick to the direct mknod() call and that 
  the user would need to run QEMU as super-user to get this working. Whereas 
  if 9p is used with mapped permissions, we should fake those devices by 
  creating regular files, store their type and major, minor numbers there and 
  that's it. We don't expect that guest ever tries to read/write such block/
  character devices, right? I.e. I'm assuming that any read/write is handled 
  as an overlay by Linux kernel on its guest level, correct?

* S_IFSOCK: doesn't work, neither as regular user (ERRNO 1, Operation not 
  permitted), nor as super-user (ERRNO 22, Invalid argument). So we should 
  divert that to a socket() call on macOS.

Thoughts?

Best regards,
Christian Schoenebeck



