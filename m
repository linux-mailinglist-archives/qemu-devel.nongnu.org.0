Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B1F50D43D
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 20:47:12 +0200 (CEST)
Received: from localhost ([::1]:36382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nihGJ-0004nT-Bu
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 14:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nihEp-0003vN-Ov; Sun, 24 Apr 2022 14:45:39 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:34245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nihEn-00009Z-AW; Sun, 24 Apr 2022 14:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=qzoHdp4ddAZMLwqmzz3h6xs3+MyWUKYIN1TcbukEnYQ=; b=P23yd3UXhfnfuOaDf4rlUyVc8q
 GW0estV1V525nNPpou2VbhuAuoc0bi9QnsvVFY0ju3+Ozs4V2EMhmZQYtAKwOdsHJ9LTOu0FglrU+
 BG9f5c7uivOkD25BLBBcAaeKXXpwqW3CuS4l1+Sm7F2zQP9qWF/axmxmOINzgcH2AHJ5v477xIN6F
 AGz7VwjvHBmzg6GCRVkhheL93mr0BJ7OiFq9tysneQCsET50waIbPQFjVJ+vxu+Bdspr3QYeruU2Y
 cc8n8gRWLyg3sSU5n3KWASYG14nqd/8OOA5UBrp6LjlAyxaFD+Ydzm804ph7wfbMBXTpnxFNVC7Pq
 QUNNZhtiYVca/w8It5ScBgHqwIu67BaM26jBTdXwJvOEx2BKY/UoQiCTOL6IVTAb99t+BlgxNhtC3
 VnPOfW+qckGZNMi1iSOmyOOneqgSueCX0ilmjzBxtw0QX/R0USaTLRR16nusquxVE+oZdj+cZJsuB
 ajFhYFVTqoT0XBJwfGWQ64xYtUyhk4CN3FkqkWqtvQDoVMB4cSHKvASBEkOiLhfIkJWiOYbPP+Lg4
 4+6nziOXrANJwkDjE7VdaT1I5QKdi0Rq9UkZP+fz368cq7ThJKX1uddmE4hyb+JWDtoVr6jNhZVm3
 zFSeWGnQQnIcSSOCYhqVf1UAfh4A59Oin5cjrcqVI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Greg Kurz <groug@kaod.org>, qemu-stable@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Sun, 24 Apr 2022 20:45:21 +0200
Message-ID: <3849551.ofAv5PygDX@silver>
In-Reply-To: <eafd4bbf-dbff-323a-179f-8f29905701e1@gmail.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <1750044.XWheshbc2e@silver>
 <eafd4bbf-dbff-323a-179f-8f29905701e1@gmail.com>
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

On Samstag, 23. April 2022 06:33:50 CEST Akihiko Odaki wrote:
> On 2022/04/22 23:06, Christian Schoenebeck wrote:
> > On Freitag, 22. April 2022 04:43:40 CEST Akihiko Odaki wrote:
> >> On 2022/04/22 0:07, Christian Schoenebeck wrote:
> >>> mknod() on macOS does not support creating sockets, so divert to
> >>> call sequence socket(), bind() and chmod() respectively if S_IFSOCK
> >>> was passed with mode argument.
> >>> 
> >>> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> >>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >>> Reviewed-by: Will Cohen <wwcohen@gmail.com>
> >>> ---
> >>> 
> >>>    hw/9pfs/9p-util-darwin.c | 27 ++++++++++++++++++++++++++-
> >>>    1 file changed, 26 insertions(+), 1 deletion(-)
> >>> 
> >>> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> >>> index e24d09763a..39308f2a45 100644
> >>> --- a/hw/9pfs/9p-util-darwin.c
> >>> +++ b/hw/9pfs/9p-util-darwin.c
> >>> @@ -74,6 +74,27 @@ int fsetxattrat_nofollow(int dirfd, const char
> >>> *filename, const char *name,>
> >>> 
> >>>     */
> >>>    
> >>>    #if defined CONFIG_PTHREAD_FCHDIR_NP
> >>> 
> >>> +static int create_socket_file_at_cwd(const char *filename, mode_t mode)
> >>> {
> >>> +    int fd, err;
> >>> +    struct sockaddr_un addr = {
> >>> +        .sun_family = AF_UNIX
> >>> +    };
> >>> +
> >>> +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> >>> +    if (fd == -1) {
> >>> +        return fd;
> >>> +    }
> >>> +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
> >> 
> >> It would result in an incorrect path if the path does not fit in
> >> addr.sun_path. It should report an explicit error instead.
> > 
> > Looking at its header file, 'sun_path' is indeed defined on macOS with an
> > oddly small size of only 104 bytes. So yes, I should explicitly handle
> > that
> > error case.
> > 
> > I'll post a v3.
> > 
> >>> +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
> >>> +    if (err == -1) {
> >>> +        goto out;
> >> 
> >> You may close(fd) as soon as bind() returns (before checking the
> >> returned value) and eliminate goto.
> > 
> > Yeah, I thought about that alternative, but found it a bit ugly, and
> > probably also counter-productive in case this function might get extended
> > with more error pathes in future. Not that I would insist on the current
> > solution though.
> 
> I'm happy with the explanation. Thanks.
> 
> >>> +    }
> >>> +    err = chmod(addr.sun_path, mode);
> >> 
> >> I'm not sure if it is fine to have a time window between bind() and
> >> chmod(). Do you have some rationale?
> > 
> > Good question. QEMU's 9p server is multi-threaded; all 9p requests come in
> > serialized and the 9p server controller portion (9p.c) is only running on
> > QEMU main thread, but the actual filesystem driver calls are then
> > dispatched to QEMU worker threads and therefore running concurrently at
> > this point:
> > 
> > https://wiki.qemu.org/Documentation/9p#Threads_and_Coroutines
> > 
> > Similar situation on Linux 9p client side: it handles access to a mounted
> > 9p filesystem concurrently, requests are then serialized by 9p driver on
> > Linux and sent over wire to 9p server (host).
> > 
> > So yes, there might be implications by that short time windows. But could
> > that be exploited on macOS hosts in practice?
> > 
> > The socket file would have mode srwxr-xr-x for a short moment.
> > 
> > For security_model=mapped* this should not be a problem.
> > 
> > For security_model=none|passhrough, in theory, maybe? But how likely is
> > that? If you are using a Linux client for instance, trying to brute-force
> > opening the socket file, the client would send several 9p commands
> > (Twalk, Tgetattr, Topen, probably more). The time window of the two
> > commands above should be much smaller than that and I would expect one of
> > the 9p commands to error out in between.
> > 
> > What would be a viable approach to avoid this issue on macOS?
> 
> It is unlikely that a naive brute-force approach will succeed to
> exploit. The more concerning scenario is that the attacker uses the
> knowledge of the underlying implementation of macOS to cause resource
> contention to widen the window. Whether an exploitation is viable
> depends on how much time you spend digging XNU.
> 
> However, I'm also not sure if it really *has* a race condition. Looking
> at v9fs_co_mknod(), it sequentially calls s->ops->mknod() and
> s->ops->lstat(). It also results in an entity called "path name based
> fid" in the code, which inherently cannot identify a file when it is
> renamed or recreated.
> 
> If there is some rationale it is safe, it may also be applied to the
> sequence of bind() and chmod(). Can anyone explain the sequence of
> s->ops->mknod() and s->ops->lstat() or path name based fid in general?

You are talking about 9p server's controller level: I don't see something that 
would prevent a concurrent open() during this bind() ... chmod() time window 
unfortunately.

Argument 'fidp' passed to function v9fs_co_mknod() reflects the directory in 
which the new device file shall be created. So 'fidp' is not the device file 
here, nor is 'fidp' modified during this function.

Function v9fs_co_mknod() is entered by 9p server on QEMU main thread. At the 
beginning of the function it first acquires a read lock on a (per 9p export) 
global coroutine mutex:

    v9fs_path_read_lock(s);

and holds this lock until returning from function v9fs_co_mknod(). But that's 
just a read lock. Function v9fs_co_open() also just gains a read lock. So they 
can happen concurrently.

Then v9fs_co_run_in_worker({...}) is called to dispatch and execute all the 
code block (think of it as an Obj-C "block") inside this (macro actually) on a 
QEMU worker thread. So an arbitrary background thread would then call the fs 
driver functions:

    s->ops->mknod()
    v9fs_name_to_path()
    s->ops->lstat()

and then at the end of the code block the background thread would dispatch 
back to QEMU main thread. So when we are reaching:

    v9fs_path_unlock(s);

we are already back on QEMU main thread, hence unlocking on main thread now 
and finally leaving function v9fs_co_mknod().

The important thing to understand is, while that

    v9fs_co_run_in_worker({...})

code block is executed on a QEMU worker thread, the QEMU main thread (9p 
server controller portion, i.e. 9p.c) is *not* sleeping, QEMU main thread 
rather continues to process other (if any) client requests in the meantime. In 
other words v9fs_co_run_in_worker() neither behaves exactly like Apple's GCD 
dispatch_async(), nor like dispatch_sync(), as GCD is not coroutine based.

So 9p server might pull a pending 'Topen' client request from the input FIFO 
in the meantime and likewise dispatch that to a worker thread, etc. Hence a 
concurrent open() might in theory be possible, but I find it quite unlikely to 
succeed in practice as the open() call on guest is translated by Linux client 
into a bunch of synchronous 9p requests on the path passed with the open() 
call on guest, and a round trip for each 9p message is like what, ~0.3ms or 
something in this order. That's quite huge compared to the time window I would 
expect between bind() ... open().

Does this answer your questions?

> Regards,
> Akihiko Odaki
> 
> >>> +out:
> >>> +    close(fd);
> >>> +    return err;
> >>> +}
> >>> +
> >>> 
> >>>    int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> >>>    dev)
> >>>    {
> >>>    
> >>>        int preserved_errno, err;
> >>> 
> >>> @@ -93,7 +114,11 @@ int qemu_mknodat(int dirfd, const char *filename,
> >>> mode_t mode, dev_t dev)>
> >>> 
> >>>        if (pthread_fchdir_np(dirfd) < 0) {
> >>>        
> >>>            return -1;
> >>>        
> >>>        }
> >>> 
> >>> -    err = mknod(filename, mode, dev);
> >>> +    if (S_ISSOCK(mode)) {
> >>> +        err = create_socket_file_at_cwd(filename, mode);
> >>> +    } else {
> >>> +        err = mknod(filename, mode, dev);
> >>> +    }
> >>> 
> >>>        preserved_errno = errno;
> >>>        /* Stop using the thread-local cwd */
> >>>        pthread_fchdir_np(-1);



