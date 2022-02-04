Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D014A9D16
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:41:23 +0100 (CET)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1eE-00017G-Oj
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:41:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldv@altlinux.org>)
 id 1nG1JR-0001q8-54; Fri, 04 Feb 2022 11:19:53 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:47974)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ldv@altlinux.org>)
 id 1nG1JO-0005Pj-76; Fri, 04 Feb 2022 11:19:52 -0500
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 5A91772C905;
 Fri,  4 Feb 2022 19:19:40 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 3C6667CD201; Fri,  4 Feb 2022 19:19:39 +0300 (MSK)
Date: Fri, 4 Feb 2022 19:19:39 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Message-ID: <20220204161939.GC18407@altlinux.org>
References: <20220204050609.15510-1-vt@altlinux.org>
 <449c9c55-06e8-66ef-8755-3ab2e785851c@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <449c9c55-06e8-66ef-8755-3ab2e785851c@amsat.org>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=ldv@altlinux.org;
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
Cc: Vitaly Chikunov <vt@altlinux.org>, qemu-stable@nongnu.org,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 04, 2022 at 02:55:45PM +0100, Philippe Mathieu-Daudé wrote:
> On 4/2/22 06:06, Vitaly Chikunov wrote:
> > `struct dirent' returned from readdir(3) could be shorter (or longer)
> > than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> > into unallocated page causing SIGSEGV. Example stack trace:
> > 
> >   #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 + 0x497eed)
> >   #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64 + 0x4982e9)
> >   #2  0x0000555555eb7983 coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983)
> >   #3  0x00007ffff73e0be0 n/a (n/a + 0x0)
> > 
> > While fixing, provide a helper for any future `struct dirent' cloning.
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > Cc: qemu-stable@nongnu.org
> > Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> > ---
> > Tested on x86-64 Linux again.
> > 
> > Changes from v2:
> > - Make it work with a simulated dirent where d_reclen is 0, which was
> >    caused abort in readdir qos-test, by using fallback at runtime.
> > 
> >   hw/9pfs/codir.c      |  3 +--
> >   include/qemu/osdep.h | 13 +++++++++++++
> >   util/osdep.c         | 18 ++++++++++++++++++
> >   3 files changed, 32 insertions(+), 2 deletions(-)
> 
> > +struct dirent *
> > +qemu_dirent_dup(struct dirent *dent)
> > +{
> > +    size_t sz = 0;
> > +#if defined _DIRENT_HAVE_D_RECLEN
> > +    /* Avoid use of strlen() if there's d_reclen. */
> > +    sz = dent->d_reclen;
> > +#endif
> > +    if (sz == 0) {
> 
> If _DIRENT_HAVE_D_RECLEN is defined, this case is unlikely...

If it was so easy to be misled this way,
I'd suggest adding an explicit comment, e.g.

    /*
     * Test sz for non-zero even if d_reclen is available
     * because some drivers may set d_reclen to zero.
     */


-- 
ldv

