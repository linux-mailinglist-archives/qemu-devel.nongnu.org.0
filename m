Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40A4BFA0B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 14:59:12 +0100 (CET)
Received: from localhost ([::1]:44036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMVh9-00077f-LQ
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 08:59:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nMVcf-0004Dq-VV
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:54:34 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:55277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nMVcY-0003i9-MH
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=BBZ8DLF/C+hxPxaXgBWHyaEH1EG1Y3lIwuWTjg8JzAc=; b=afjckEJ57nVuYvWcmlN2wcrVWu
 IHKkkzegXyjdEx7+fOKOKP4Ji0UOYnjFHM76AoDGP/ZBhFAje+n06euPX+fqBydM+QXxdPEpEEmMC
 T5JgqnxUMDwqpo7mFTVTLEz8KnQHPXzYL82xjXpgad77IS+KzYphUhFbDSKZRQjFr8hlccyHa4kGh
 aEydUfKWtYCvcXDnrmbvD/ltuUUwEuoAlL/6FMmpnNX8ue4/RYY+mOC3dTDMPQ0p8PKoywG1nEtLu
 JqTiJ0NMrl+xBe0cBbH5+/YQy9yQUccG7LDTiWz2IUzsEqRfgC9dkMYEBoMfT6j3UgAeDQbBbe2Md
 ztmB2GqjUZKwNcI1EHOusRWfgRYivVA3lKhbV14Zg7GNpy0D9Qmio8yeO8E32hgsSQhEZeAfgK3RM
 cSUdKBVgVb7zuiEs/ZCI/bavoemh5F86Pz7bxkM86EdvnOqyPUyqKvnWM2gSMHyJojzlqpZSogiMi
 5QScaftih4OKiqfkOf6jIAjFMlfDaPb8yo6DEHGQZoVm2vPcLLT3ijnwEmBdbxdodV2lfswtyQFl2
 NAc/eaq0Qvo0j9FosQkqZfZ1bz6FEDfaLRG+5exExoAXPiAzjT0NbbNB4np/9Kss5WgZqEF1Plfc/
 kU8VMEi6RKhlwiJDu5kMoy2pmMMEKXT3Mf6AHflG8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PULL v2 5/5] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Date: Tue, 22 Feb 2022 14:54:17 +0100
Message-ID: <3196572.21YWrCmDqH@silver>
In-Reply-To: <CAFEAcA_=HAUNomKD2wurSVaAHa5mrk22A1oHKLWUDjk7v6Khmg@mail.gmail.com>
References: <cover.1645114783.git.qemu_oss@crudebyte.com>
 <e64e27d5cb103b7764f1a05b6eda7e7fedd517c5.1645114783.git.qemu_oss@crudebyte.com>
 <CAFEAcA_=HAUNomKD2wurSVaAHa5mrk22A1oHKLWUDjk7v6Khmg@mail.gmail.com>
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

On Dienstag, 22. Februar 2022 14:21:52 CET Peter Maydell wrote:
> On Thu, 17 Feb 2022 at 16:43, Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index d1660d67fa..ce12f64853 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -805,6 +805,19 @@ static inline int
> > platform_does_not_support_system(const char *command)> 
> >  }
> >  #endif /* !HAVE_SYSTEM_FUNCTION */
> > 
> > +/**
> > + * Duplicate directory entry @dent.
> > + *
> > + * It is highly recommended to use this function instead of open coding
> > + * duplication of @c dirent objects, because the actual @c struct @c
> > dirent + * size may be bigger or shorter than @c sizeof(struct dirent)
> > and correct + * handling is platform specific (see gitlab issue #841).
> > + *
> > + * @dent - original directory entry to be duplicated
> > + * @returns duplicated directory entry which should be freed with
> > g_free()
> > + */
> > +struct dirent *qemu_dirent_dup(struct dirent *dent);
> 
> Hi; I just noticed this has landed in git recently.
> Please don't add new prototypes to osdep.h -- it is
> a header included by every single C file in the tree, so
> making it bigger slows down compilation. osdep.h is supposed
> to contain only:
>  * things which everybody needs
>  * things without which code would work on most platforms but
>    fail to compile or misbehave on a minority of host OSes
>    (ie system incompatibility handling)
> 
> This prototype is neither of those -- please find or create a more
> appropriate header file for it, that can be included only by the
> source files that actually need it.
> 
> thanks
> -- PMM

Good to know, because the pending Darwin series would have added stuff to 
osdep.h as well:
https://lore.kernel.org/qemu-devel/20220220165056.72289-10-wwcohen@gmail.com/

We'll find a different place.

Thanks!

Best regards,
Christian Schoenebeck



