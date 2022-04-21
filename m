Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E9509E1D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:58:38 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUWD-0004WN-2N
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhU6F-0003YK-8U
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:31:47 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:29417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhU6B-0002Tf-Kp
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:31:46 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-cbxL_WKaNnej3T41Qe6kIw-1; Thu, 21 Apr 2022 06:31:32 -0400
X-MC-Unique: cbxL_WKaNnej3T41Qe6kIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5820801E67;
 Thu, 21 Apr 2022 10:31:31 +0000 (UTC)
Received: from bahia (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7A5B40885A1;
 Thu, 21 Apr 2022 10:31:30 +0000 (UTC)
Date: Thu, 21 Apr 2022 12:31:29 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 3/5] 9pfs: fix wrong encoding of rdev field in Rgetattr
 on macOS
Message-ID: <20220421123129.2f04c9d3@bahia>
In-Reply-To: <8971800.MWpjzubbLj@silver>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <9db9268aac4eb87e1471ab8240109c7c29be3bef.1650370027.git.qemu_oss@crudebyte.com>
 <20220421093056.5ab1e7ed@bahia> <8971800.MWpjzubbLj@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 12:25:23 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 21. April 2022 09:30:56 CEST Greg Kurz wrote:
> > On Tue, 19 Apr 2022 13:41:15 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > The 'rdev' field in 9p reponse 'Rgetattr' is of type dev_t,
> > > which is actually a system dependant type and therefore both the
> > > size and encoding of dev_t differ between macOS and Linux.
> > > 
> > > So far we have sent 'rdev' to guest in host's dev_t format as-is,
> > > which caused devices to appear with wrong device numbers on
> > > guests running on macOS hosts, eventually leading to various
> > > misbehaviours on guest in conjunction with device files.
> > > 
> > > This patch fixes this issue by converting the device number from
> > > host's dev_t format to Linux dev_t format. As 9p request
> > > 'Tgettattr' is exclusive to protocol version 9p2000.L, it should
> > > be fair to assume that 'rdev' field is assumed to be in Linux dev_t
> > > format by client as well.
> > 
> > For the sake of accuracy : this is converting the host's dev_t to glibc's
> > format (MMMM_Mmmm_mmmM_MMmm, 64 bits) actually, which is compatible with
> > linux's format (mmmM_MMmm, 32 bits), as described in <bits/sysmacros.h>.
> 
> You want me to put this to the commit log?
> 

Maybe closer to the code that does the actual magic...

> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > > 
> > >  hw/9pfs/9p.c | 37 ++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 36 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 225f31fc31..d953035e1c 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -1318,6 +1318,41 @@ static int32_t stat_to_iounit(const V9fsPDU *pdu,
> > > const struct stat *stbuf)> 
> > >      return blksize_to_iounit(pdu, stbuf->st_blksize);
> > >  
> > >  }
> > > 
> > > +#if !defined(CONFIG_LINUX)
> > > +
> > > +/*
> > > + * Generates a Linux device number (a.k.a. dev_t) for given device major
> > > + * and minor numbers.

... here ^^.

> > > + */
> > > +static uint64_t makedev_dotl(uint32_t dev_major, uint32_t dev_minor)
> > > +{
> > > +    uint64_t dev;
> > > +
> > > +    // from glibc sysmacros.h:
> > > +    dev  = (((uint64_t) (dev_major & 0x00000fffu)) <<  8);
> > > +    dev |= (((uint64_t) (dev_major & 0xfffff000u)) << 32);
> > > +    dev |= (((uint64_t) (dev_minor & 0x000000ffu)) <<  0);
> > > +    dev |= (((uint64_t) (dev_minor & 0xffffff00u)) << 12);
> > > +    return dev;
> > > +}
> > > +
> > > +#endif
> > > +
> > > +/*
> > > + * Converts given device number from host's device number format to Linux
> > > + * device number format. As both the size of type dev_t and encoding of
> > > + * dev_t is system dependant, we have to convert them for Linux guests if
> > > + * host is not running Linux.
> > > + */
> > > +static uint64_t host_dev_to_dotl_dev(dev_t dev)
> > > +{
> > > +#ifdef CONFIG_LINUX
> > > +    return dev;
> > > +#else
> > > +    return makedev_dotl(major(dev), minor(dev));
> > > +#endif
> > > +}
> > > +
> > 
> > It is a bit unfortunate to inflate 9p.c, which is large enough, with
> > glue code. Even if they are only used here, I'd personally put them
> > in 9p-util.h. No big deal.
> 
> Makes sense, I'll move it.
> 
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Thanks!
> 
> > >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
> > >  
> > >                                  V9fsStatDotl *v9lstat)
> > >  
> > >  {
> > > 
> > > @@ -1327,7 +1362,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const
> > > struct stat *stbuf,> 
> > >      v9lstat->st_nlink = stbuf->st_nlink;
> > >      v9lstat->st_uid = stbuf->st_uid;
> > >      v9lstat->st_gid = stbuf->st_gid;
> > > 
> > > -    v9lstat->st_rdev = stbuf->st_rdev;
> > > +    v9lstat->st_rdev = host_dev_to_dotl_dev(stbuf->st_rdev);
> > > 
> > >      v9lstat->st_size = stbuf->st_size;
> > >      v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
> > >      v9lstat->st_blocks = stbuf->st_blocks;
> 
> 


