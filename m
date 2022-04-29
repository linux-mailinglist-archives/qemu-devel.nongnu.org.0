Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77F3514B92
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 15:53:56 +0200 (CEST)
Received: from localhost ([::1]:54204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkR4G-0003Mk-1T
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 09:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nkR1B-00010j-1h; Fri, 29 Apr 2022 09:50:45 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nkR19-0008Tn-1d; Fri, 29 Apr 2022 09:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=VNIou2UNLiJ6jMna2qXbBTSL0eSg8To0OHdiOvMQMGA=; b=UAhSTz9SG/6F0JuqOkshzFy/Ml
 04B7veGUUkSL58H/K8Hpg84jCLdVO9x1cI/7IlwRuyZWo8miEdS9K6Ho2trQYg3Ylq2E6MUmNKe+C
 mFwXvwPmgVzKQ/1Wx2vFO2K+iHhL6GCeWYf5zG6jFLkSkp8keskHXFDZsEoA6ewoEEOQ62nY4jKFS
 YX3JuI953HVG9Irx36ayiKROi8jDIbXL11dDXOmVwBy/zYAzm7Gi+Fu4rzycH32Xpo4mJohoAhwpS
 BcKkAZrop89cyIim7JJwJrsjoLYUXSubjCc/oznn03mnuM2YtifzOOZx7IYsO+XsB/qtek5fSOzTa
 EPGW06FF2gnFO3goQ7YqUE4yljF+I2G+GUngUfdsmnuwuveVilM5ZpHHkBoRh/83WR4nCCg9X0+CL
 QtmZUe00EAncTBEyIIJIKQGtfdn/2m8VXTftAVan0C71GqmmzCa2WGNBjRgxKIuxTxh2LmjJEcVS9
 ot8EkwrsfKDNkHOf7tz29lxN5w9eIEFR4rH/HRiH3BbtaX87wgagJAPB1sOyJA2KvVDQz2WF7bQpa
 +dKMvaJvkJxLU1rix/otntHNwRynCPNxbn97lW6lNghT1/DiV4Fo0SXeyEepS23uOlH7LRgXSGAkI
 gbdCjU3+RmJ+Ya6eXOOOA2zyxRNxBFOpFKdgs7E5E=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v5 2/6] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Fri, 29 Apr 2022 15:50:35 +0200
Message-ID: <5815688.WPY9AJzlUa@silver>
In-Reply-To: <20220429145650.7d3ba6e8@bahia>
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
 <2e7b5ecd7a6d83a538db4e8a22d8fb03e9e0f06e.1651228001.git.qemu_oss@crudebyte.com>
 <20220429145650.7d3ba6e8@bahia>
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

On Freitag, 29. April 2022 14:56:50 CEST Greg Kurz wrote:
> On Fri, 29 Apr 2022 12:25:11 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > mknod() on macOS does not support creating sockets, so divert to
> > call sequence socket(), bind() and fchmodat() respectively if S_IFSOCK
> > was passed with mode argument.
> > 
> > Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p-util-darwin.c | 42 +++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > index e24d09763a..619c403ba7 100644
> > --- a/hw/9pfs/9p-util-darwin.c
> > +++ b/hw/9pfs/9p-util-darwin.c
> > @@ -74,6 +74,42 @@ int fsetxattrat_nofollow(int dirfd, const char
> > *filename, const char *name,> 
> >   */
> >  
> >  #if defined CONFIG_PTHREAD_FCHDIR_NP
> > 
> > +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
> > +    int fd, err;
> > +    struct sockaddr_un addr = {
> > +        .sun_family = AF_UNIX
> > +    };
> > +
> > +    err = snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s",
> > filename); +    if (err < 0 || err >= sizeof(addr.sun_path)) {
> 
> According to POSIX [1]:
> 
> The snprintf() function shall fail if:
> 
> [EOVERFLOW]
> [CX] [Option Start] The value of n is greater than {INT_MAX}. [Option End]
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/snprintf.html
> 
> Since we're passing sizeof(addr.sun_path), I'm pretty sure snprintf()
> cannot fail. No big deal.

The question is whom you would want to trust on this? POSIX? ISO-C? Clang? 
BSD? Apple? And for how long into future? I mean in general yes, I would not 
expect it to fail with -1 here either, but there are various different API 
docs on snprintf() out there, and most of them don't even bother to enumarate 
which encoding errors may happen. And I'm pretty sure if I'd drop the negative 
err check here, then Akihiko would slap me for unforeseeable additional error 
cases on snprintf() that may be added in future.

Apple's documentation on snprintf() BTW just says:

  "These functions return a negative value if an error occurs."

So Apple does not even restrict the return value to -1 on errrors, you would 
also need to expect other negative values.

So on doubt, I leave this negative result check for now. ;-)

> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!

Best regards
Christian Schoenebeck

> > +        errno = ENAMETOOLONG;
> > +        return -1;
> > +    }
> > +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> > +    if (fd == -1) {
> > +        return fd;
> > +    }
> > +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> > +    if (err == -1) {
> > +        goto out;
> > +    }
> > +    /*
> > +     * FIXME: Should rather be using descriptor-based fchmod() on the
> > +     * socket file descriptor above (preferably before bind() call),
> > +     * instead of path-based fchmodat(), to prevent concurrent transient
> > +     * state issues between creating the named FIFO file at bind() and
> > +     * delayed adjustment of permissions at fchmodat(). However currently
> > +     * macOS (12.x) does not support such operations on socket file
> > +     * descriptors yet.
> > +     *
> > +     * Filed report with Apple: FB9997731
> > +     */
> > +    err = fchmodat(AT_FDCWD, filename, mode, AT_SYMLINK_NOFOLLOW_ANY);
> > +out:
> > +    close_preserve_errno(fd);
> > +    return err;
> > +}
> > +
> > 
> >  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> >  {
> >  
> >      int preserved_errno, err;
> > 
> > @@ -93,7 +129,11 @@ int qemu_mknodat(int dirfd, const char *filename,
> > mode_t mode, dev_t dev)> 
> >      if (pthread_fchdir_np(dirfd) < 0) {
> >      
> >          return -1;
> >      
> >      }
> > 
> > -    err = mknod(filename, mode, dev);
> > +    if (S_ISSOCK(mode)) {
> > +        err = create_socket_file_at_cwd(filename, mode);
> > +    } else {
> > +        err = mknod(filename, mode, dev);
> > +    }
> > 
> >      preserved_errno = errno;
> >      /* Stop using the thread-local cwd */
> >      pthread_fchdir_np(-1);



