Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D654A9C28
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:42:22 +0100 (CET)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0j7-0001BB-Uc
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:42:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>)
 id 1nG0ZU-0006LR-Hc; Fri, 04 Feb 2022 10:32:24 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:48694)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>)
 id 1nG0ZR-0004qv-Ns; Fri, 04 Feb 2022 10:32:24 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id C519C72C905;
 Fri,  4 Feb 2022 18:32:07 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 941D24A46F0;
 Fri,  4 Feb 2022 18:32:07 +0300 (MSK)
Date: Fri, 4 Feb 2022 18:32:07 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Message-ID: <20220204153207.k2t3dwq3pdzx7bk3@altlinux.org>
References: <20220204050609.15510-1-vt@altlinux.org>
 <449c9c55-06e8-66ef-8755-3ab2e785851c@amsat.org>
 <28345882.VnrBaU8NEn@silver> <20220204161606.162d2c05@bahia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220204161606.162d2c05@bahia>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org, "Dmitry V. Levin" <ldv@altlinux.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg,

On Fri, Feb 04, 2022 at 04:16:06PM +0100, Greg Kurz wrote:
> On Fri, 04 Feb 2022 15:12:18 +0100
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> 
> > On Freitag, 4. Februar 2022 14:55:45 CET Philippe Mathieu-Daudé via wrote:
> > > On 4/2/22 06:06, Vitaly Chikunov wrote:
> > > > `struct dirent' returned from readdir(3) could be shorter (or longer)
> > > > than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> > > > 
> > > > into unallocated page causing SIGSEGV. Example stack trace:
> > > >   #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64
> > > >   + 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir
> > > >   (/usr/bin/qemu-system-x86_64 + 0x4982e9) #2  0x0000555555eb7983
> > > >   coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983) #3 
> > > >   0x00007ffff73e0be0 n/a (n/a + 0x0)
> > > > 
> > > > While fixing, provide a helper for any future `struct dirent' cloning.
> > > > 
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > > > Cc: qemu-stable@nongnu.org
> > > > Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> > > > ---
> > > > Tested on x86-64 Linux again.
> > > > 
> > > > Changes from v2:
> > > > - Make it work with a simulated dirent where d_reclen is 0, which was
> > > > 
> > > >    caused abort in readdir qos-test, by using fallback at runtime.
> > > >   
> > > >   hw/9pfs/codir.c      |  3 +--
> > > >   include/qemu/osdep.h | 13 +++++++++++++
> > > >   util/osdep.c         | 18 ++++++++++++++++++
> > > >   3 files changed, 32 insertions(+), 2 deletions(-)
> > > > 
> > > > +struct dirent *
> > > > +qemu_dirent_dup(struct dirent *dent)
> > > > +{
> > > > +    size_t sz = 0;
> > > > +#if defined _DIRENT_HAVE_D_RECLEN
> > > > +    /* Avoid use of strlen() if there's d_reclen. */
> > > > +    sz = dent->d_reclen;
> > > > +#endif
> > > > +    if (sz == 0) {
> > > 
> > > If _DIRENT_HAVE_D_RECLEN is defined, this case is unlikely...
> > > 
> > > > +        /* Fallback to the most portable way. */
> > > > +        sz = offsetof(struct dirent, d_name) +
> > > > +                      strlen(dent->d_name) + 1;
> > > > +    }
> > > > +    struct dirent *dst = g_malloc(sz);
> > > > +    return memcpy(dst, dent, sz);
> > > > +}
> > > 
> > > What about this?
> > > 
> > > struct dirent *
> > > qemu_dirent_dup(struct dirent *dent)
> > > {
> > >      size_t sz;
> > > 
> > > #if defined _DIRENT_HAVE_D_RECLEN
> > >      /* Avoid use of strlen() if there's d_reclen. */
> > >      sz = dent->d_reclen;
> > > #else
> > >      /* Fallback to the most portable way. */
> > >      sz = offsetof(struct dirent, d_name) +
> > >                    strlen(dent->d_name) + 1;
> > > #endif
> > > 
> > >      return g_memdup(dent, sz);
> > > }
> > 
> > That was the intentional change v2 -> v3 Philippe. Previous v2 crashed the
> > 9p 'synth' tests:
> > 
> > https://lore.kernel.org/qemu-devel/2627488.0S70g7mNYN@silver/T/#ma09bedde59a91e6435443e151f7e49fef8616e4c
> > 
> > You might argue that the 9p 'synth' driver should instead populate d_reclen
> > instead, but this v3 is a simpler solution and guarantees to always work. So
> > I'd prefer to go with Vitaly's v3 for now, especially as this patch would go
> > to the stable branches as well.
> > 
> 
> This really is a band-aid. Anyone reading this will react as Philippe,
> and this is common code, not just 9pfs. With correctly populated dirents,
> the helper could be as simple as:
> 
> struct dirent *
> qemu_dirent_dup(struct dirent *dent)
> {
>     size_t sz = offsetof(struct dirent, d_name) + _D_EXACT_NAMLEN(dent) + 1;

But d_namlen is not populated by synth_direntry, so this will lead to
a bug too. Idea is that qemu_dirent_dup handles real dirents and
simulated (underpopulated) dirents.

Also Linux does not have d_namlen AFAIK, thus this code will not provide
any speed up in most cases (and always fallback to strlen), unlike if we
use d_reclen.

Also, I m not sure if _D_EXACT_NAMLEN is defined on all systems, so this
needs ifdefs too.


> 
>     return g_memdup(dent, sz);
> }
> 
> If this is a cycles problem,

If you don't like d_reclen speed ups, we can always just use most portable
strlen method.

Vitaly,

> I can help reviewing the fixes on
> the synth driver, or alternatively you can keep this code
> somewhere under 9pfs but please don't put that in common utils.
> 
> Cheers,
> 
> --
> Greg
> 
> > Best regards,
> > Christian Schoenebeck
> > 
> > 

