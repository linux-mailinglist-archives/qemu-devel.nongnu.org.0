Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C3650B985
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:08:57 +0200 (CEST)
Received: from localhost ([::1]:56692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtxw-0007uR-7c
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhtvW-0006XZ-OH; Fri, 22 Apr 2022 10:06:26 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:53219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhtvU-0007W7-KT; Fri, 22 Apr 2022 10:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=zGZEZQHUdFuyPk4D/V2UgstQ3TglWPt6JONMwNPIcGE=; b=Iox3trbcIMnLOf08f5Wogo4TYZ
 cp9w7OPZyJfuvqi71xvTdNW7CSzQXqtPpkcEQ9/ZQqGvRVisIA39kULSEjl9EvovELsMocYfL6E47
 QCKrJo93xEVRRRjd8KHhyB4HVU1r1IQtab8VYWdSj/w+YL13YEtKKiVCK37uyRXyCIdg66DMO+IyR
 cn+HJwlCo8shM9jX9q5e83hl+rbG+BhvQ2qN6ToALIIuyAGe6VrYN7TjPE2WMZyNpsV10pVniQRUX
 uRk6195JsQUjCSKSYzYf7H2d/roLOYZavKd/kSP5weifurJYWFNK+yshsK13T6qw6WWFke9JESb9i
 9AoVaE59h2NayN/+gPGr4eFMqRQaPlkG9hQwiasdTZDwaIoGQJu1P4iUE7wgSk+4jf8lCegK6XxMi
 kG7Yi5vjOkwSAAQ1YlLR78NHZnENSMNiaNTDagVPPxquy7O8Lxqi/Dr+DzuA6N1T9WuD2K8Q/zkYu
 9Fsvmcbyg8WFeHMfvy7cQIoXJ/ymB9dqiF3TWY+nNaShbR6LczfUsZ9aAWTDMyg/Efy0gmY9zv7Ni
 Ro76351k3u8QsrTzkECvApB36/D2FpBPZBnrcK6QXm7c2+aE1BS12EZz2ZzC2r3o5KYETCyt1LlUg
 Zn5LbDGnE1ovznrxYVbFphSHY9+uxgXDpd2DGnLn8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>, Will Cohen <wwcohen@gmail.com>,
 Greg Kurz <groug@kaod.org>, qemu-stable@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Fri, 22 Apr 2022 16:06:12 +0200
Message-ID: <1750044.XWheshbc2e@silver>
In-Reply-To: <73163b9a-bd8a-8cf1-42a1-0e4c88edfa0e@gmail.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <f6d632fc82d4750b73c83a2f1d1b9972cf3e26bb.1650553693.git.qemu_oss@crudebyte.com>
 <73163b9a-bd8a-8cf1-42a1-0e4c88edfa0e@gmail.com>
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

On Freitag, 22. April 2022 04:43:40 CEST Akihiko Odaki wrote:
> On 2022/04/22 0:07, Christian Schoenebeck wrote:
> > mknod() on macOS does not support creating sockets, so divert to
> > call sequence socket(), bind() and chmod() respectively if S_IFSOCK
> > was passed with mode argument.
> > 
> > Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Reviewed-by: Will Cohen <wwcohen@gmail.com>
> > ---
> > 
> >   hw/9pfs/9p-util-darwin.c | 27 ++++++++++++++++++++++++++-
> >   1 file changed, 26 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > index e24d09763a..39308f2a45 100644
> > --- a/hw/9pfs/9p-util-darwin.c
> > +++ b/hw/9pfs/9p-util-darwin.c
> > @@ -74,6 +74,27 @@ int fsetxattrat_nofollow(int dirfd, const char
> > *filename, const char *name,> 
> >    */
> >   
> >   #if defined CONFIG_PTHREAD_FCHDIR_NP
> > 
> > +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
> > +    int fd, err;
> > +    struct sockaddr_un addr = {
> > +        .sun_family = AF_UNIX
> > +    };
> > +
> > +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> > +    if (fd == -1) {
> > +        return fd;
> > +    }
> > +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
> 
> It would result in an incorrect path if the path does not fit in
> addr.sun_path. It should report an explicit error instead.

Looking at its header file, 'sun_path' is indeed defined on macOS with an 
oddly small size of only 104 bytes. So yes, I should explicitly handle that 
error case.

I'll post a v3.

> > +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> > +    if (err == -1) {
> > +        goto out;
> 
> You may close(fd) as soon as bind() returns (before checking the
> returned value) and eliminate goto.

Yeah, I thought about that alternative, but found it a bit ugly, and probably 
also counter-productive in case this function might get extended with more 
error pathes in future. Not that I would insist on the current solution 
though.

> > +    }
> > +    err = chmod(addr.sun_path, mode);
> 
> I'm not sure if it is fine to have a time window between bind() and
> chmod(). Do you have some rationale?

Good question. QEMU's 9p server is multi-threaded; all 9p requests come in 
serialized and the 9p server controller portion (9p.c) is only running on QEMU 
main thread, but the actual filesystem driver calls are then dispatched to 
QEMU worker threads and therefore running concurrently at this point:

https://wiki.qemu.org/Documentation/9p#Threads_and_Coroutines

Similar situation on Linux 9p client side: it handles access to a mounted 9p 
filesystem concurrently, requests are then serialized by 9p driver on Linux 
and sent over wire to 9p server (host).

So yes, there might be implications by that short time windows. But could that 
be exploited on macOS hosts in practice?

The socket file would have mode srwxr-xr-x for a short moment.

For security_model=mapped* this should not be a problem.

For security_model=none|passhrough, in theory, maybe? But how likely is that? 
If you are using a Linux client for instance, trying to brute-force opening 
the socket file, the client would send several 9p commands (Twalk, Tgetattr, 
Topen, probably more). The time window of the two commands above should be 
much smaller than that and I would expect one of the 9p commands to error out 
in between.

What would be a viable approach to avoid this issue on macOS?

> > +out:
> > +    close(fd);
> > +    return err;
> > +}
> > +
> > 
> >   int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> >   dev)
> >   {
> >   
> >       int preserved_errno, err;
> > 
> > @@ -93,7 +114,11 @@ int qemu_mknodat(int dirfd, const char *filename,
> > mode_t mode, dev_t dev)> 
> >       if (pthread_fchdir_np(dirfd) < 0) {
> >       
> >           return -1;
> >       
> >       }
> > 
> > -    err = mknod(filename, mode, dev);
> > +    if (S_ISSOCK(mode)) {
> > +        err = create_socket_file_at_cwd(filename, mode);
> > +    } else {
> > +        err = mknod(filename, mode, dev);
> > +    }
> > 
> >       preserved_errno = errno;
> >       /* Stop using the thread-local cwd */
> >       pthread_fchdir_np(-1);



