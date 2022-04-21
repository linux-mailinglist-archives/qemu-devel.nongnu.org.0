Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91793509E4A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:09:47 +0200 (CEST)
Received: from localhost ([::1]:40754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUh0-0006hv-3v
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhUTI-0000bo-Gk; Thu, 21 Apr 2022 06:55:37 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:53937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhUTA-00076h-AE; Thu, 21 Apr 2022 06:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Cl0i/DzPrVTzownjCJRbYuS8A+n/2JylcjHkoBDcIjU=; b=KgXol0Kc1AWv1/SBbGKAWRXggX
 3oxHwcI1RatPWdAPFZ8zaWx2E+ZzeMOxZ+AKexZL8bvijkdakCOzXgC21umRFV+2RKrgyMYK9pV4b
 6WeXpTBNhHI8LUVfkQYj6H5+RJ6BqHg59THSvG0cJtykmSAK/zxhhKLB0xBVgY3wJhkIgk3wUMLHh
 WuoGHO+V4jA9GI/d35pRInfljY9k9i3PE+Fn5hFY0xuuxC2gQhVvEUMlzoz2Pmx8rNBngRAowG58l
 4F26wD2BhvCiJOTZfZPIybrWSf7L/GCCMXRx0im77D1C6NXkmr9MYBnEnVtBeb6c8oa+Q4mXH67Dw
 mwNMGALGRebuI5qwl7bCTUoYITBsznCC3xyjoYMjH62B1zGXMSF9wyIBbfm66mXIqJHlHGudhtUI+
 Z5e3pqylIRoCg+JYSM1JH7+nNIq8/Y3mhJJTU5iElErkc5YFTsNMUcIjSmzcFUr/3krQllPzF1toZ
 oHqw1WQwq9EyNukDeBp68X0iMkPSgFgK4fm83HjUBrRADffuA0bIOwt5pCJUnFAuWzplw8LqiiffQ
 fXysB7MJ8Njmp8HposglYPcOh6r4k/SCCZ3J5RrmeTWuZY44bLxO9mfQEMfi9nGt70Xvy1p0b24tV
 GPm+7UzubTF0yLBzb68D/3sDlsHVzFUmXXoz9aYAM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 5/5] 9pfs: fix removing non-existent POSIX ACL xattr on
 macOS host
Date: Thu, 21 Apr 2022 12:55:24 +0200
Message-ID: <3589619.MNAgDp08Jg@silver>
In-Reply-To: <20220421102611.5a2a0564@bahia>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <284de6154d7ad57ac6539a7318aa2364261da105.1650370027.git.qemu_oss@crudebyte.com>
 <20220421102611.5a2a0564@bahia>
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

On Donnerstag, 21. April 2022 10:26:11 CEST Greg Kurz wrote:
> On Tue, 19 Apr 2022 13:43:30 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > When mapped POSIX ACL is used, we are ignoring errors when trying
> > to remove a POSIX ACL xattr that does not exist. On Linux hosts we
> > would get ENODATA in such cases, on macOS hosts however we get
> > ENOATTR instead, so ignore ENOATTR errors as well.
> > 
> > This patch fixes e.g. a command on Linux guest like:
> >   cp --preserve=mode old new
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p-posix-acl.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/9p-posix-acl.c b/hw/9pfs/9p-posix-acl.c
> > index eadae270dd..2bf155f941 100644
> > --- a/hw/9pfs/9p-posix-acl.c
> > +++ b/hw/9pfs/9p-posix-acl.c
> > @@ -65,7 +65,13 @@ static int mp_pacl_removexattr(FsContext *ctx,
> > 
> >      int ret;
> >      
> >      ret = local_removexattr_nofollow(ctx, path, MAP_ACL_ACCESS);
> > 
> > -    if (ret == -1 && errno == ENODATA) {
> > +    if (ret == -1 &&
> > +          (errno == ENODATA
> > +#ifdef ENOATTR
> > +          || errno == ENOATTR
> > +#endif
> > +          )
> 
> We already have this in <qemu/xattr.h> which is included by
> 9p-posix-acl.c :
> 
> /*
>  * Modern distributions (e.g. Fedora 15), have no libattr.so, place attr.h
>  * in /usr/include/sys, and don't have ENOATTR.
>  */
> 
> 
> #ifdef CONFIG_LIBATTR
> #  include <attr/xattr.h>
> #else
> #  if !defined(ENOATTR)
> #    define ENOATTR ENODATA
> #  endif
> #  include <sys/xattr.h>
> #endif
> 
> I guess this patch could just s/ENODATA/ENOATTR/ to avoid the
> extra ifdefery.

Not viable, because macOS does have both ENODATA==96 and ENOATTR==93. On Linux 
the two macros were historically defined to the same numeric values, that's 
why it worked there.

Maybe I should define a separate macro like:

#if ...
# define P9_ENOATTR ENOATTR
#else
# define P9_ENOATTR ENODATA
#end

?

Actually good that you pointed me at this, because I just realized there is a 
2nd place in 9p-posix-acl.c which would require this as well. For some reason 
the 2nd place just did not trigger while I was testing it on macOS.

Best regards,
Christian Schoenebeck



