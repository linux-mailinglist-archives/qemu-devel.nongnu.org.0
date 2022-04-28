Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC85132C8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:44:31 +0200 (CEST)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2ZS-0000co-Q7
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nk2ET-0000DX-RL; Thu, 28 Apr 2022 07:22:50 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nk2EP-0000Ps-AR; Thu, 28 Apr 2022 07:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=2tzvCirzIt9kkSHYGsLnwRmWKdhNpnBilO3YKMIzcpY=; b=GFE9pCImoUf4H0QDA8UR7B2Ndr
 SSL7OgTu07ch+Zq+hUDvPZaei2L3ordCyA/V8UWVqqnUqeikcby2HcBX48zg/VNOhmqCEXyA4Ykrr
 mUCcfl+lUm1U4LqWtxTheZzlQBKzsptHbW6gvmuVMvBKSnbhCVoDlbBUOcMi4+4uo48yaS9uZ3/oJ
 SfvxhtDDIv0e7ixClSwkG8w+V4VezeIIZ4U+1M25jyXYmwKy5gBfb0kkg02tn/fFprIGy53ciFnzV
 lLXyuv9Ispb3DfuEb26DmJIRecaMrM2oDxEfchNOkKqaElxzchMb5eIlB2VGLh92QoSLSzX5GB901
 NLMycVJ0EtgSEiJzJq40NaYyoXPhUCqjAY7xrQC6nQcaqBTHrnL19QD1dbu/5cZXfkv4KixB/ojfR
 VTB9ASMiGH/KvgQ28g/JNgqwgaCYNm2SWU6QV61Ux4NHoes18PVOjJr6RklulVIie5J6joHztX+eI
 Dg3sy2Qi8wNP4qv4kVvvtM1xQP3BO1Ye5TBUPRmV+toZIMvxaL5aeVBj72rTUJZdSLNxadKWipabX
 budYenlNAV++5XBqiCQWd4gftlgjMkrxU6o5YN3919Xit0WWZOFGSqGAwSKkul3I19TG9Z1XqL9pe
 mlLF4qlXja/D/k2LneV2Wy8brBDjSy/DdEapQ7ULY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v4 2/6] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Thu, 28 Apr 2022 13:22:26 +0200
Message-ID: <1976549.2SI88kFQN7@silver>
In-Reply-To: <20220427223625.52e0e23f@bahia>
References: <cover.1651085921.git.qemu_oss@crudebyte.com>
 <489275615f29a2efc97cbd6130c98669ed28a24b.1651085922.git.qemu_oss@crudebyte.com>
 <20220427223625.52e0e23f@bahia>
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

On Mittwoch, 27. April 2022 22:36:25 CEST Greg Kurz wrote:
> On Wed, 27 Apr 2022 20:54:17 +0200
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
> >  hw/9pfs/9p-util-darwin.c | 45 +++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 44 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > index e24d09763a..7d00db47a9 100644
> > --- a/hw/9pfs/9p-util-darwin.c
> > +++ b/hw/9pfs/9p-util-darwin.c
> > @@ -74,6 +74,45 @@ int fsetxattrat_nofollow(int dirfd, const char
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
> > +    /*
> > +     * sun_path is only 104 bytes, explicit filename length check
> > required
> > +     */
> > +    if (sizeof(addr.sun_path) - 1 < strlen(filename) + 2) {
> 
> True but I was a bit puzzled by the math until I realized the '+ 2' was
> for the prepended "./" ;-)

Correct ...

> > +        errno = ENAMETOOLONG;
> > +        return -1;
> > +    }
> > +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
> > +    if (fd == -1) {
> > +        return fd;
> > +    }
> > +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
> 
> What about the more generic approach of checking snprintf()'s return
> value ? If it is >= sizeof(addr.sun_path) then truncation occured.

... well, I can send a v5 if you prefer that solution, or you can send a follow-up
patch later on. As you wish.

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
> 
> You could close(fd) earlier now, but you might want to keep the code
> as is in case FB9997731 gets proper attention.
> 
> Anyway, this should do the job so:

Sounds like Akihiko's previous suggestion. I would keep it that way:
https://lore.kernel.org/qemu-devel/eafd4bbf-dbff-323a-179f-8f29905701e1@gmail.com/

> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!

Best regards,
Christian Schoenebeck

> > +    return err;
> > +}
> > +
> > 
> >  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> >  {
> >  
> >      int preserved_errno, err;
> > 
> > @@ -93,7 +132,11 @@ int qemu_mknodat(int dirfd, const char *filename,
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



