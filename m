Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4A33AB46F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:16:04 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrsJ-0004zv-8w
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1ltrKE-0006s9-1U
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1ltrK9-0007Yh-K2
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623933642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbTatx65hPONsj4IEQhjxR0s1QfLbugh5hJa4V3aJcI=;
 b=G2bCu71PccYXjdTVK00z2KVUMugUGw3XAoPVALzFR6rPCA5nBkngneD9aBq1muh0aiyuEF
 XmXuYMCEh2qpieX0byCJhTK861sFc7Ccf4sCt0ToanZdaSjhFg+TAwP1p1RyVMetXv5+VC
 r6Rh4KKbyztxaWGARx3uBr5Jj1Dy6X4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-ZGAh3nPHOaazd9u1zSTR_Q-1; Thu, 17 Jun 2021 08:40:39 -0400
X-MC-Unique: ZGAh3nPHOaazd9u1zSTR_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 287738042AC;
 Thu, 17 Jun 2021 12:40:38 +0000 (UTC)
Received: from starship (unknown [10.40.194.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91AC60C05;
 Thu, 17 Jun 2021 12:40:17 +0000 (UTC)
Message-ID: <4b6b6f1b7a97d4b7fd2008fd31c6c2121ba053fb.camel@redhat.com>
Subject: Re: [PATCH] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>, Eric
 Auger <eric.auger@redhat.com>
Date: Thu, 17 Jun 2021 15:40:16 +0300
In-Reply-To: <cb271128-faa2-c557-128f-4ec1133667b8@redhat.com>
References: <20210611114606.320008-1-philmd@redhat.com>
 <cb271128-faa2-c557-128f-4ec1133667b8@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 Michal =?ISO-8859-1?Q?Pr=EDvozn=EDk?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-06-14 at 18:03 +0200, Philippe Mathieu-Daudé wrote:
> On 6/11/21 1:46 PM, Philippe Mathieu-Daudé wrote:
> > When the NVMe block driver was introduced (see commit bdd6a90a9e5,
> > January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
> > -ENOMEM in case of error. The driver was correctly handling the
> > error path to recycle its volatile IOVA mappings.
> > 
> > To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
> > DMA mappings per container", April 2019) added the -ENOSPC error to
> > signal the user exhausted the DMA mappings available for a container.
> 
> Hmm this commit has been added before v5.1-rc4.
> 
> So while this fixes the behavior of v5.1-rc4+ kernels,
> older kernels using this fix will have the same problem...


Hi!

I wonder why not to check for both -ENOMEM and -ENOSPC
and recycle the mappings in both cases?

I think that would work on both old and new kernels.

What do you think?

Best regards,
	Maxim Levitsky

> 
> Should I check uname(2)'s utsname.release[]? Is it reliable?
> 
> > The block driver started to mis-behave:
> > 
> >   qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
> >   (qemu)
> >   (qemu) info status
> >   VM status: paused (io-error)
> >   (qemu) c
> >   VFIO_MAP_DMA failed: No space left on device
> >   qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: Assertion `ctx == blk->ctx' failed.
> > 
> > Fix by handling the -ENOSPC error when DMA mappings are exhausted;
> > other errors (such -ENOMEM) are still handled later in the same
> > function.
> > 
> > An easy way to reproduce this bug is to restrict the DMA mapping
> > limit (65535 by default) when loading the VFIO IOMMU module:
> > 
> >   # modprobe vfio_iommu_type1 dma_entry_limit=666
> > 
> > Cc: qemu-stable@nongnu.org
> > Reported-by: Michal Prívozník <mprivozn@redhat.com>
> > Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1863333
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/65
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> > Michal, is it still possible for you to test this (old bug)?
> > 
> > A functional test using viommu & nested VM is planned (suggested by
> > Stefan and Maxim).
> > ---
> >  block/nvme.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/block/nvme.c b/block/nvme.c
> > index 2b5421e7aa6..12f9dd5cce3 100644
> > --- a/block/nvme.c
> > +++ b/block/nvme.c
> > @@ -1030,7 +1030,7 @@ try_map:
> >          r = qemu_vfio_dma_map(s->vfio,
> >                                qiov->iov[i].iov_base,
> >                                len, true, &iova);
> > -        if (r == -ENOMEM && retry) {
> > +        if (r == -ENOSPC && retry) {
> >              retry = false;
> >              trace_nvme_dma_flush_queue_wait(s);
> >              if (s->dma_map_count) {
> > 



