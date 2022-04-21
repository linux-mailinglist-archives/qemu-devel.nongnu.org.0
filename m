Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B26509DD3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:40:39 +0200 (CEST)
Received: from localhost ([::1]:57314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUEo-0000v2-0S
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhU0G-00082t-Bk; Thu, 21 Apr 2022 06:25:37 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhU0D-0001VW-WE; Thu, 21 Apr 2022 06:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=fQk9GYzgdFeuEoy0SRsQi5ogDYwgQ+a8h1cIuIL075U=; b=AVZ+1+VEfuAhka355B+syp7KS2
 KWr9J4A4B/v1ZyoLKW3n0sIbMRV7Y7NciYmKTVkV+W/0zlMTO6l2/SDZz5nMDS4v4n2gySakWpcx9
 jBpFKw1SyjZuyTAmCRo/YirtvaIb9wBKawampVD5iaM3GH5Pfr3KTRVEvk2fvS1TpnHYfBFR8H+Fv
 pbmEOGuLsO7PmPYmn70q0BYbnJpe4+wONJD8AQkdp3si1KCybRTnw/R0ewHdZboyNz+2filNtxyBF
 +13O/89OLzmctvYww3/JrTOE5WIaIMdaU0p6gusOnWM5oq+MKFeTS+X7i6lmTxK8w+GJX5WuSdskS
 ct8mmMY/mtwJB/TFkg3pyAeebdDn1CZuuuLZijTd6f+aUnIw8wR00NctDRrd5ft3KUqjB47xHcCBC
 Fe3+gEOHS4nQoi4e6gTlOOQKW9cstcqrgy0ijjIshz3KYERotQlyR5uE71VwD+MjnXa+jrDNYB9fJ
 3YuPxbGbn2DQLOhFcSKsH1bxIGM97arrc4cL329XmweiqJitAuXLBGpp1ZdCotoOK8xunFdWB3jG0
 frzlMLEoYrKCtjKziNqhWGDqFLRK2XL9p5nVz/f7/voOuXXxtckMW9CIyXbKVFZoIiT9wwdAAfOvC
 NyaQHIDA34qRNn4VNu18+lqi1FEDpT7QjUEzEIpwc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/5] 9pfs: fix wrong encoding of rdev field in Rgetattr on
 macOS
Date: Thu, 21 Apr 2022 12:25:23 +0200
Message-ID: <8971800.MWpjzubbLj@silver>
In-Reply-To: <20220421093056.5ab1e7ed@bahia>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <9db9268aac4eb87e1471ab8240109c7c29be3bef.1650370027.git.qemu_oss@crudebyte.com>
 <20220421093056.5ab1e7ed@bahia>
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

On Donnerstag, 21. April 2022 09:30:56 CEST Greg Kurz wrote:
> On Tue, 19 Apr 2022 13:41:15 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > The 'rdev' field in 9p reponse 'Rgetattr' is of type dev_t,
> > which is actually a system dependant type and therefore both the
> > size and encoding of dev_t differ between macOS and Linux.
> > 
> > So far we have sent 'rdev' to guest in host's dev_t format as-is,
> > which caused devices to appear with wrong device numbers on
> > guests running on macOS hosts, eventually leading to various
> > misbehaviours on guest in conjunction with device files.
> > 
> > This patch fixes this issue by converting the device number from
> > host's dev_t format to Linux dev_t format. As 9p request
> > 'Tgettattr' is exclusive to protocol version 9p2000.L, it should
> > be fair to assume that 'rdev' field is assumed to be in Linux dev_t
> > format by client as well.
> 
> For the sake of accuracy : this is converting the host's dev_t to glibc's
> format (MMMM_Mmmm_mmmM_MMmm, 64 bits) actually, which is compatible with
> linux's format (mmmM_MMmm, 32 bits), as described in <bits/sysmacros.h>.

You want me to put this to the commit log?

> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p.c | 37 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 225f31fc31..d953035e1c 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1318,6 +1318,41 @@ static int32_t stat_to_iounit(const V9fsPDU *pdu,
> > const struct stat *stbuf)> 
> >      return blksize_to_iounit(pdu, stbuf->st_blksize);
> >  
> >  }
> > 
> > +#if !defined(CONFIG_LINUX)
> > +
> > +/*
> > + * Generates a Linux device number (a.k.a. dev_t) for given device major
> > + * and minor numbers.
> > + */
> > +static uint64_t makedev_dotl(uint32_t dev_major, uint32_t dev_minor)
> > +{
> > +    uint64_t dev;
> > +
> > +    // from glibc sysmacros.h:
> > +    dev  = (((uint64_t) (dev_major & 0x00000fffu)) <<  8);
> > +    dev |= (((uint64_t) (dev_major & 0xfffff000u)) << 32);
> > +    dev |= (((uint64_t) (dev_minor & 0x000000ffu)) <<  0);
> > +    dev |= (((uint64_t) (dev_minor & 0xffffff00u)) << 12);
> > +    return dev;
> > +}
> > +
> > +#endif
> > +
> > +/*
> > + * Converts given device number from host's device number format to Linux
> > + * device number format. As both the size of type dev_t and encoding of
> > + * dev_t is system dependant, we have to convert them for Linux guests if
> > + * host is not running Linux.
> > + */
> > +static uint64_t host_dev_to_dotl_dev(dev_t dev)
> > +{
> > +#ifdef CONFIG_LINUX
> > +    return dev;
> > +#else
> > +    return makedev_dotl(major(dev), minor(dev));
> > +#endif
> > +}
> > +
> 
> It is a bit unfortunate to inflate 9p.c, which is large enough, with
> glue code. Even if they are only used here, I'd personally put them
> in 9p-util.h. No big deal.

Makes sense, I'll move it.

> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!

> >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
> >  
> >                                  V9fsStatDotl *v9lstat)
> >  
> >  {
> > 
> > @@ -1327,7 +1362,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const
> > struct stat *stbuf,> 
> >      v9lstat->st_nlink = stbuf->st_nlink;
> >      v9lstat->st_uid = stbuf->st_uid;
> >      v9lstat->st_gid = stbuf->st_gid;
> > 
> > -    v9lstat->st_rdev = stbuf->st_rdev;
> > +    v9lstat->st_rdev = host_dev_to_dotl_dev(stbuf->st_rdev);
> > 
> >      v9lstat->st_size = stbuf->st_size;
> >      v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
> >      v9lstat->st_blocks = stbuf->st_blocks;



