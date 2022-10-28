Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D606111AA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:38:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOcu-0007tp-6A; Fri, 28 Oct 2022 08:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ooOcn-0007py-T9
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:38:16 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ooOGs-0001Oq-5d
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=E+qb5tJCdWwBr7FvrZVdOdE6yqPe15JPMbrMm10ZCMs=; b=l//2sRurStepkCyAlC77gO9Br5
 UKIQ/5c1aGapj3UmU4X9FakWJWPyZiSY9kGMnNovyPtgrJGir2DA7feP9Q/JFKfivkya8zZndyfuP
 Ci5EGmzEaEFLpqNvKRngJjJJgNIOnGUTT3BNJ5UiZyYwGVNELU8KmxhSLGwarp8gi5Tdy+b9G17Z7
 /jd7LAEjX1/aYz46A0lCgbU7OtSADS1WG7cMgIMYHH6QYnrxV7u9f5XRkYyeRclNU83Av6DLd/1Sp
 QcyK0T8kX7r16E09w5DVF+clbcKenttHUtOxJRmV7i4D125ORUUFKexWwA/ro8iuts65+FWXs+EZy
 5a8EPoN+BIEWSXQozWdz5Xfdfhfa5Utmbbs7Ib9qHj9d81DoT70MVX9NIbjtmCvgnjeIjSvJTreJw
 e3gz50I/BHwqUpKmHesJq2GWDpjXP500aZSnJthgw2sbNa7yPiFRehQDzYZMnPD1aNnDujcGJs/5N
 B++wcNb/y2/ixe0x/flB23k/8q14W96OYsjAF5owkgGrPH2nxQPLVpRL0/jntkVukWOqB4lJjJJco
 BeAjS2pt66N9PlzfDyDfRnBc/B95Jx4r5f5S4+hS6F8Cqe5TvlQLiCqgz2hnxiSJvALL1YDrmpMFy
 sdKF0sUw9yJWaugogdSB9BXnt0pMOhaPCwvDql8Jw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH] 9pfs: fix missing sys/mount.h include
Date: Fri, 28 Oct 2022 14:14:13 +0200
Message-ID: <7476627.JHTLl5x3NE@silver>
In-Reply-To: <53df074a-c938-cbe5-caca-a0c6a7cbd3e7@redhat.com>
References: <E1ooNWu-0002oC-76@lizzy.crudebyte.com>
 <53df074a-c938-cbe5-caca-a0c6a7cbd3e7@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Friday, October 28, 2022 1:42:34 PM CEST Thomas Huth wrote:
> On 28/10/2022 13.21, Christian Schoenebeck wrote:
> > Fixes the following build error:
> > 
> >    fsdev/file-op-9p.h:156:56: error: declaration of 'struct statfs' will
> >    not be visible outside of this function [-Werror,-Wvisibility]
> >      int (*statfs)(FsContext *s, V9fsPath *path, struct statfs *stbuf);
> >                                                         ^
> > 
> > As Windows neither has statfs, nor sys/mount.h, don't include it there.
> > 
> > Fixes: 684f91203439 ("tests/9p: split virtio-9p-test.c ...")
> > Link: https://lore.kernel.org/all/2690108.PsDodiG1Zx@silver/
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >   fsdev/file-op-9p.h | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> > index 4997677460..700f1857b4 100644
> > --- a/fsdev/file-op-9p.h
> > +++ b/fsdev/file-op-9p.h
> > @@ -24,6 +24,8 @@
> >   #endif
> >   #ifdef CONFIG_DARWIN
> >   # include <sys/param.h>
> > +#endif
> > +#ifndef CONFIG_WIN32
> >   # include <sys/mount.h>
> >   #endif
> 
> Do you feel confident that this will also work on other exotic systems? 
> (e.g. does it work with "make vm-build-haiku.x86_64" ?)
> Otherwise it might be better to add a meson.build test for this header instead.

9pfs only supports Linux and macOS ATM, and Windows being WIP. From
meson.buid:

have_virtfs = get_option('virtfs') \
    .require(targetos == 'linux' or targetos == 'darwin',
             error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
             error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
             error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
    .disable_auto_if(not have_tools and not have_system) \
    .allowed()

And Bin Meng just sent a related patch to fix building 9pfs tests
unconditionally:

https://lore.kernel.org/all/20221028045736.679903-9-bin.meng@windriver.com/

Best regards,
Christian Schoenebeck



