Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A708B4199C9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:57:40 +0200 (CEST)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtwh-0002wF-NB
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mUtph-0001Sk-Kr
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:50:25 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mUtpY-0000cq-ON
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=wCUr+Nsh0qIw+AbzETlaqW6MU4P2jiVnrb9GOUbP7hQ=; b=CtskhKkLaNHklUXnCKJ3Uo0MGR
 aWegSBVeTXeHMWqgausBmgWXpo/sqc3vShjltjkLM8k2OeA6wbJriqP2Vk+VxGd8TU3jrZcqT5D19
 eJhfuurvVN6dd9QjdtOQPjQC/EhO5ebtXSqWVekNHiYpMIKlkfiATdzP0rkU58cSUBQHb7GZmHe7f
 +A+PK4Nsm4+kBVjy/rP+hI2PLxyObhJpQAHkL72KhcsFRmXb4PFrXgdMxLNZsnZyjG8afo9MUEThD
 rZ3D6yVDto4uyVxpF8wjWcurSlNr6UGe1H5JSL+1d+4+E/5ahoz2DIUOXu5CdkFey5+RoocRrKd5o
 y84Jcg4KYx/skZqrJWKkUy9O8iMLVNjw/hTn91QPsoBVrR6lJ9pnx5/A/y5W2Jdev7eT1Uc/bHH7l
 D+TG+dl0PHhdPdGKHVVkANzdypXaDd+g4P9pC8H2fJii+zRMP6GDQ/NGV079STjIJbZD8AqSUdxJd
 P3xrGJpuasOkicJkbklf/LC8AhpLBfS4yIkTqZWOjtd9jQUSPaNk/EjFRc/savgssH22k264U7uyR
 cqsZ/XzneFSfyIxdWnnFaO/pAoIlAbzKGfgUmk7i1L7vldUN9HlpFheDb/SvnGGn2gh05c9Iwpvae
 ZKt4Yjd13huxlNKA4D0QGuSCoTmG+kIsnIo2AD/R0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] 9pfs: deduplicate iounit code
Date: Mon, 27 Sep 2021 18:50:12 +0200
Message-ID: <4720290.jjg2aSD2dJ@silver>
In-Reply-To: <20210927182759.009875ef@bahia.huguette>
References: <cover.1632758315.git.qemu_oss@crudebyte.com>
 <129bb71d5119e61d335f1e3107e472e4beea223a.1632758315.git.qemu_oss@crudebyte.com>
 <20210927182759.009875ef@bahia.huguette>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On Montag, 27. September 2021 18:27:59 CEST Greg Kurz wrote:
> On Mon, 27 Sep 2021 17:45:00 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Remove redundant code that translates host fileystem's block
> > size into 9p client (guest side) block size.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p.c | 42 ++++++++++++++++++++----------------------
> >  1 file changed, 20 insertions(+), 22 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 708b030474..c65584173a 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1262,18 +1262,26 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU
> > *pdu, V9fsPath *path,> 
> >  #define P9_STATS_ALL           0x00003fffULL /* Mask for All fields above
> >  */> 
> > -static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat
> > *stbuf) +/**
> > + * Convert host filesystem's block size into an appropriate block size
> > for
> > + * 9p client (guest OS side). The value returned suggests an "optimum"
> > block + * size for 9p I/O, i.e. to maximize performance.
> > + *
> > + * @pdu: 9p client request
> > + * @blksize: host filesystem's block size
> > + */
> > +static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
> > 
> >  {
> >  
> >      int32_t iounit = 0;
> >      V9fsState *s = pdu->s;
> >      
> >      /*
> > 
> > -     * iounit should be multiples of st_blksize (host filesystem block
> > size) +     * iounit should be multiples of blksize (host filesystem
> > block size)> 
> >       * as well as less than (client msize - P9_IOHDRSZ)
> >       */
> > 
> > -    if (stbuf->st_blksize) {
> > -        iounit = stbuf->st_blksize;
> > -        iounit *= (s->msize - P9_IOHDRSZ) / stbuf->st_blksize;
> > +    if (blksize) {
> > +        iounit = blksize;
> > +        iounit *= (s->msize - P9_IOHDRSZ) / blksize;
> > 
> >      }
> >      if (!iounit) {
> >      
> >          iounit = s->msize - P9_IOHDRSZ;
> > 
> > @@ -1281,6 +1289,11 @@ static int32_t stat_to_iounit(const V9fsPDU *pdu,
> > const struct stat *stbuf)> 
> >      return iounit;
> >  
> >  }
> > 
> > +static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat
> > *stbuf) +{
> > +    return blksize_to_iounit(pdu, stbuf->st_blksize);
> > +}
> > +
> > 
> >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
> >  
> >                                  V9fsStatDotl *v9lstat)
> >  
> >  {
> > 
> > @@ -1899,23 +1912,8 @@ out_nofid:
> >  static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
> >  {
> >  
> >      struct statfs stbuf;
> > 
> > -    int32_t iounit = 0;
> > -    V9fsState *s = pdu->s;
> > -
> > -    /*
> > -     * iounit should be multiples of f_bsize (host filesystem block size
> > -     * and as well as less than (client msize - P9_IOHDRSZ))
> > -     */
> > -    if (!v9fs_co_statfs(pdu, path, &stbuf)) {
> > -        if (stbuf.f_bsize) {
> > -            iounit = stbuf.f_bsize;
> > -            iounit *= (s->msize - P9_IOHDRSZ) / stbuf.f_bsize;
> > -        }
> > -    }
> > -    if (!iounit) {
> > -        iounit = s->msize - P9_IOHDRSZ;
> > -    }
> > -    return iounit;
> > +    int err = v9fs_co_statfs(pdu, path, &stbuf);
> 
> It is usually preferred to leave a blank line between declarations
> and statements for easier reading. It isn't mandated in the coding
> style but Markus consistently asks for it :-) Maybe you can fix
> that before pushing to 9p.next ?

In general: I adapt to whatever code style is preferred.

I actually did run (like usual) scripts/checkpatch.pl and it did not complain.

So you mean it is preferred to split up declaration and definition due to the 
function call involved? I.e. precisely:

static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
{
    struct statfs stbuf;
    int err;

    err = v9fs_co_statfs(pdu, path, &stbuf);
    return blksize_to_iounit(pdu, (err >= 0) ? stbuf.f_bsize : 0);
}

or rather :) ...

static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
{
    struct statfs stbuf;
    int err = v9fs_co_statfs(pdu, path, &stbuf);

    return blksize_to_iounit(pdu, (err >= 0) ? stbuf.f_bsize : 0);
}

We actually have mixed declaration/definition all over the place.

> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> > +    return blksize_to_iounit(pdu, (err >= 0) ? stbuf.f_bsize : 0);
> > 
> >  }
> >  
> >  static void coroutine_fn v9fs_open(void *opaque)



