Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF8558C8D1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:56:12 +0200 (CEST)
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2Il-000602-VQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oL2FI-0002GH-8w
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:52:36 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:44597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oL2FF-0000Y8-R5
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=rT2DIymUr6wPzNB2lonzkVNkF6PAzQQd3Aw9XV6epAk=; b=g9E0ayvpwtkRamyGGtWIY7+494
 6Z9aSgOIqwh81Lo9QTTfqbyrPfjdqE4JFiZvSQHJK3GxFuO7hY0kx6KzQJLfMAraDcNxCA8/OI5j8
 yYBNUa3o6yUnNWxF3UWXFgCuoPZ7Sguzzgo+1AGxt+A7le6YI4WM1Peiht2B4ehatXcFLDcd7WjqA
 Vz6UWHL4ihU2xw32wPZ2ihaeEtej+et2zvrn3qMoSP/iBnR5hgPbcdcsg6Ql7bGkGBO4AmmdPOET5
 Ti0UWqoN6iVi3cLGdF60dqjRgzLXVydiFdtTrIotl87vWWSM1WLKM4qG81cCxHvszPZL2sZPa28ye
 r+Q6fOVgfR4Q/ej+eC/9kEKEK2M/92sKpHanc+JiFlbN5a2Ru1iE8K6lGsP+75IchOIF6TizkgIDi
 fCRosWGFQWod7bxLED0Bh1Rv9bIgP4anMRdjAH3ysJBx+UuwLPx2xbLtEDR4jC34MIUiIOI9Zzq42
 pDAlqsRMPe0H5iAQZBzuci5MXAZPMbiyVHLu/K74It10wwnSLZU7N/OPrS+UFlxXhq7w7gx3O65ZI
 YLVIm37HS+7fLkzm54nVOTuMP+umbj/Qvx+67G+MrPvDdBrHLFNAIdmroEyvRRok7X9SrlZ9losiD
 saBS2pEU1+7TI3U2nxi3n4M2ByrrDU3luU3vcAhlg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
Date: Mon, 08 Aug 2022 14:52:28 +0200
Message-ID: <3206015.kY3CcG7ZbH@silver>
In-Reply-To: <877d3jupln.fsf@pond.sub.org>
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <CAAJ4Ao-P3ZUuvzEkqOrUuw9qUWtmf3JWmvxVqMs4+z4pdqz6qw@mail.gmail.com>
 <877d3jupln.fsf@pond.sub.org>
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

On Montag, 8. August 2022 10:05:56 CEST Markus Armbruster wrote:
> Nikita Ivanov <nivanov@cloudlinux.com> writes:
> > Summing up the discussion above, I suggest the following patch for TFR()
> > macro refactoring. (The patch is sequential to the first one I introduced
> > in the start of the discussion).
> > 
> >>From 6318bee052900aa93bba6620b53c7cb2290e5001 Mon Sep 17 00:00:00 2001
> >>
> > From: Nikita Ivanov <nivanov@cloudlinux.com>
> > Date: Mon, 8 Aug 2022 09:30:34 +0300
> > Subject: [PATCH] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()
> > 
> > glibc's unistd.h header provides the same macro with the
> > subtle difference in type casting. Adjust macro name to the
> > common standard and define conditionally.
> > 
> > Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> > ---
> > 
> >  chardev/char-fd.c      |  2 +-
> >  chardev/char-pipe.c    | 12 +++++++++---
> >  hw/9pfs/9p-local.c     |  6 ++++--
> >  include/qemu/osdep.h   |  6 ++++--
> >  net/l2tpv3.c           |  8 +++++---
> >  net/tap-linux.c        |  2 +-
> >  net/tap.c              | 10 ++++++----
> >  os-posix.c             |  2 +-
> >  qga/commands-posix.c   |  2 +-
> >  tests/qtest/libqtest.c |  2 +-
> >  util/main-loop.c       |  2 +-
> >  util/osdep.c           |  2 +-
> >  12 files changed, 35 insertions(+), 21 deletions(-)
> > 
> > diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> > index cf78454841..7f5ed9aba3 100644
> > --- a/chardev/char-fd.c
> > +++ b/chardev/char-fd.c
> > @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags,
> > Error **errp)
> > 
> >  {
> >  
> >      int fd = -1;
> > 
> > -    TFR(fd = qemu_open_old(src, flags, 0666));
> > +    TEMP_FAILURE_RETRY(fd = qemu_open_old(src, flags, 0666));
> > 
> >      if (fd == -1) {
> >      
> >          error_setg_file_open(errp, errno, src);
> >      
> >      }
> > 
> > diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> > index 66d3b85091..aed97e306b 100644
> > --- a/chardev/char-pipe.c
> > +++ b/chardev/char-pipe.c
> > @@ -131,8 +131,12 @@ static void qemu_chr_open_pipe(Chardev *chr,
> > 
> >      filename_in = g_strdup_printf("%s.in", filename);
> >      filename_out = g_strdup_printf("%s.out", filename);
> > 
> > -    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
> > -    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
> > +    TEMP_FAILURE_RETRY(
> > +        fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY)
> > +    );
> > +    TEMP_FAILURE_RETRY(
> > +        fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY)
> > +    );
> 
> Style question: do we want the ");" on its own line?  I think we
> generally don't do that for function and function-like macro calls.

So far scripts/checkpatch.pl doesn't complain, therefore I used this code 
style in QEMU before.

BTW, another exotic function call code style (not being compalained about yet) 
in approach:
https://lore.kernel.org/qemu-devel/E1oDQqv-0003d4-Hm@lizzy.crudebyte.com/

> >      g_free(filename_in);
> >      g_free(filename_out);
> >      if (fd_in < 0 || fd_out < 0) {
> > 
> > @@ -142,7 +146,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
> > 
> >          if (fd_out >= 0) {
> >          
> >              close(fd_out);
> >          
> >          }
> > 
> > -        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
> > +        TEMP_FAILURE_RETRY(
> > +            fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY)
> > +        );
> > 
> >          if (fd_in < 0) {
> >          
> >              error_setg_file_open(errp, errno, filename);
> >              return;
> > 
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index c90ab947ba..e803c05d0c 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -470,7 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
> > V9fsPath *fs_path,
> > 
> >          if (fd == -1) {
> >          
> >              return -1;
> >          
> >          }
> > 
> > -        TFR(tsize = read(fd, (void *)buf, bufsz));
> > +        TEMP_FAILURE_RETRY(tsize = read(fd, (void *)buf, bufsz));
> > 
> >          close_preserve_errno(fd);
> >      
> >      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
> >      
> >                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> > 
> > @@ -906,7 +906,9 @@ static int local_symlink(FsContext *fs_ctx, const char
> > *oldpath,
> > 
> >          }
> >          /* Write the oldpath (target) to the file. */
> >          oldpath_size = strlen(oldpath);
> > 
> > -        TFR(write_size = write(fd, (void *)oldpath, oldpath_size));
> > +        TEMP_FAILURE_RETRY(
> > +            write_size = write(fd, (void *)oldpath, oldpath_size)
> > +        );
> > 
> >          close_preserve_errno(fd);
> >          
> >          if (write_size != oldpath_size) {
> > 
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index b1c161c035..55f2927d8b 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -242,8 +242,10 @@ void QEMU_ERROR("code path is reachable")
> > 
> >  #if !defined(ESHUTDOWN)
> >  #define ESHUTDOWN 4099
> >  #endif
> > 
> > -
> > -#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
> > +#if !defined(TEMP_FAILURE_RETRY)
> > +#define TEMP_FAILURE_RETRY(expr) \
> > +    do { if ((expr) != -1) break; } while (errno == EINTR)
> > +#endif
> 
> GLibc's version is
> 
>    # define TEMP_FAILURE_RETRY(expression) \
>      (__extension__						
	      \
>        ({ long int __result;					
	      \
>           do __result = (long int) (expression);			
	      \
>           while (__result == -1L && errno == EINTR);			
      \
>           __result; }))
> 
> The difference isn't just "type casting", it's also statement
> vs. expression.
> 
> Is it a good idea to have the macro expand into a statement on some
> hosts, and into an expression on others?  Sure, CI should catch any uses
> as expression, but delaying compile errors to CI wastes developer time.

For consistency and simplicity, I would define exactly one version (no ifdefs) 
of the macro with a different macro name than glibc's TEMP_FAILURE_RETRY(), 
and use that QEMU specific macro name in QEMU code everywhere.

As for statement vs. expression: The only advantage of the statement version 
is if you'd need __result as an rvalue, which is not needed ATM, right? So I 
would go for the expression version (with cast) for now.

The glibc history does not reveal why they chose the statement version.

Best regards,
Christian Schoenebeck



