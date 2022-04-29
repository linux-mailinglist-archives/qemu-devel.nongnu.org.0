Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333A2514D8F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:40:21 +0200 (CEST)
Received: from localhost ([::1]:42128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRn9-0005a9-S9
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nkRiQ-0003Q6-3f
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:35:27 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:50279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nkRiM-0007Qa-5v
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:35:25 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-1gWaEBeVMcapwg6QJbHR_A-1; Fri, 29 Apr 2022 10:35:10 -0400
X-MC-Unique: 1gWaEBeVMcapwg6QJbHR_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BF06899EC1;
 Fri, 29 Apr 2022 14:35:09 +0000 (UTC)
Received: from bahia (unknown [10.39.192.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23E7D2024CB9;
 Fri, 29 Apr 2022 14:35:08 +0000 (UTC)
Date: Fri, 29 Apr 2022 16:35:07 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v5 2/6] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Message-ID: <20220429163507.2e822089@bahia>
In-Reply-To: <5815688.WPY9AJzlUa@silver>
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
 <2e7b5ecd7a6d83a538db4e8a22d8fb03e9e0f06e.1651228001.git.qemu_oss@crudebyte.com>
 <20220429145650.7d3ba6e8@bahia> <5815688.WPY9AJzlUa@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Apr 2022 15:50:35 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Freitag, 29. April 2022 14:56:50 CEST Greg Kurz wrote:
> > On Fri, 29 Apr 2022 12:25:11 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > mknod() on macOS does not support creating sockets, so divert to
> > > call sequence socket(), bind() and fchmodat() respectively if S_IFSOCK
> > > was passed with mode argument.
> > > 
> > > Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > > 
> > >  hw/9pfs/9p-util-darwin.c | 42 +++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 41 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > > index e24d09763a..619c403ba7 100644
> > > --- a/hw/9pfs/9p-util-darwin.c
> > > +++ b/hw/9pfs/9p-util-darwin.c
> > > @@ -74,6 +74,42 @@ int fsetxattrat_nofollow(int dirfd, const char
> > > *filename, const char *name,> 
> > >   */
> > >  
> > >  #if defined CONFIG_PTHREAD_FCHDIR_NP
> > > 
> > > +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
> > > +    int fd, err;
> > > +    struct sockaddr_un addr = {
> > > +        .sun_family = AF_UNIX
> > > +    };
> > > +
> > > +    err = snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s",
> > > filename); +    if (err < 0 || err >= sizeof(addr.sun_path)) {
> > 
> > According to POSIX [1]:
> > 
> > The snprintf() function shall fail if:
> > 
> > [EOVERFLOW]
> > [CX] [Option Start] The value of n is greater than {INT_MAX}. [Option End]
> > 
> > [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/snprintf.html
> > 
> > Since we're passing sizeof(addr.sun_path), I'm pretty sure snprintf()
> > cannot fail. No big deal.
> 
> The question is whom you would want to trust on this? POSIX? ISO-C? Clang? 
> BSD? Apple? And for how long into future? I mean in general yes, I would not 

To improve overall portability across all possible hosts, I'd stick to
POSIX semantics but here this is macOS only code so you can assume
this is Apple's snprintf().

> expect it to fail with -1 here either, but there are various different API 
> docs on snprintf() out there, and most of them don't even bother to enumarate 
> which encoding errors may happen. And I'm pretty sure if I'd drop the negative 
> err check here, then Akihiko would slap me for unforeseeable additional error 
> cases on snprintf() that may be added in future.
> 

/o\ ;-)

> Apple's documentation on snprintf() BTW just says:
> 
>   "These functions return a negative value if an error occurs."
> 

How valuable this is !!! ;-)

> So Apple does not even restrict the return value to -1 on errrors, you would 
> also need to expect other negative values.
> 
> So on doubt, I leave this negative result check for now. ;-)
> 

Fair enough.

> > Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Thanks!
> 
> Best regards
> Christian Schoenebeck
> 
> > > +        errno = ENAMETOOLONG;
> > > +        return -1;
> > > +    }
> > > +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> > > +    if (fd == -1) {
> > > +        return fd;
> > > +    }
> > > +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> > > +    if (err == -1) {
> > > +        goto out;
> > > +    }
> > > +    /*
> > > +     * FIXME: Should rather be using descriptor-based fchmod() on the
> > > +     * socket file descriptor above (preferably before bind() call),
> > > +     * instead of path-based fchmodat(), to prevent concurrent transient
> > > +     * state issues between creating the named FIFO file at bind() and
> > > +     * delayed adjustment of permissions at fchmodat(). However currently
> > > +     * macOS (12.x) does not support such operations on socket file
> > > +     * descriptors yet.
> > > +     *
> > > +     * Filed report with Apple: FB9997731
> > > +     */
> > > +    err = fchmodat(AT_FDCWD, filename, mode, AT_SYMLINK_NOFOLLOW_ANY);
> > > +out:
> > > +    close_preserve_errno(fd);
> > > +    return err;
> > > +}
> > > +
> > > 
> > >  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> > >  {
> > >  
> > >      int preserved_errno, err;
> > > 
> > > @@ -93,7 +129,11 @@ int qemu_mknodat(int dirfd, const char *filename,
> > > mode_t mode, dev_t dev)> 
> > >      if (pthread_fchdir_np(dirfd) < 0) {
> > >      
> > >          return -1;
> > >      
> > >      }
> > > 
> > > -    err = mknod(filename, mode, dev);
> > > +    if (S_ISSOCK(mode)) {
> > > +        err = create_socket_file_at_cwd(filename, mode);
> > > +    } else {
> > > +        err = mknod(filename, mode, dev);
> > > +    }
> > > 
> > >      preserved_errno = errno;
> > >      /* Stop using the thread-local cwd */
> > >      pthread_fchdir_np(-1);
> 
> 


