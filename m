Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E197E6695D4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 12:46:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGIUh-0006Xq-ST; Fri, 13 Jan 2023 06:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGIUd-0006XW-Nh
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 06:45:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGIUb-0003ea-OC
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 06:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673610304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TDeC/q9e/O2TdDj+PE5/t+nBZE0Vk5iCcYjhDCuMkrY=;
 b=iJ6hNc8+6HtXdDVMkEc1njHcJaIFYINLEdkVWxhbjw89yu7YdxnHo23driC/GATP9+NEV8
 h68/NQuwhdJSNgGDeUdBje6qWYKrLI1JP+G7f81/w7CGe3MnVq9untQsnAkzQ+FpJgPr4N
 FO0F9o8WYiC4eaQCgQ7DZuN83+qSbTM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-JCBhxcfSPXCTVksdje4wPw-1; Fri, 13 Jan 2023 06:45:01 -0500
X-MC-Unique: JCBhxcfSPXCTVksdje4wPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83DC7858F0E;
 Fri, 13 Jan 2023 11:45:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D5E6492B00;
 Fri, 13 Jan 2023 11:44:58 +0000 (UTC)
Date: Fri, 13 Jan 2023 12:44:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Cc: Or Ozeri <oro@il.ibm.com>, qemu-devel@nongnu.org, dupadhya@redhat.com,
 to.my.trociny@gmail.com, qemu-block@nongnu.org, dannyh@il.ibm.com,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com
Subject: Re: [PATCH v1 1/1] virtio-block: switch to blk_get_max_hw_transfer
Message-ID: <Y8FEObcExtXrcoSx@redhat.com>
References: <20211209092815.778066-1-oro@il.ibm.com>
 <20211209092815.778066-2-oro@il.ibm.com>
 <CAOi1vP95sznmAETC1ikqb5bxKueDZYd7HtEjM=7KerMSALYFuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOi1vP95sznmAETC1ikqb5bxKueDZYd7HtEjM=7KerMSALYFuQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.01.2023 um 21:28 hat Ilya Dryomov geschrieben:
> On Thu, Dec 9, 2021 at 10:34 AM Or Ozeri <oro@il.ibm.com> wrote:
> >
> > The blk_get_max_hw_transfer API was recently added in 6.1.0.
> > It allows querying an underlying block device its max transfer capability.
> > This commit changes virtio-blk to use this.
> >
> > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > ---
> >  hw/block/virtio-blk.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > index f139cd7cc9..1ba9a06888 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -458,7 +458,7 @@ static void virtio_blk_submit_multireq(BlockBackend *blk, MultiReqBuffer *mrb)
> >          return;
> >      }
> >
> > -    max_transfer = blk_get_max_transfer(mrb->reqs[0]->dev->blk);
> > +    max_transfer = blk_get_max_hw_transfer(mrb->reqs[0]->dev->blk);
> >
> >      qsort(mrb->reqs, mrb->num_reqs, sizeof(*mrb->reqs),
> >            &multireq_compare);
> 
> Hi Or,
> 
> Superficially, this makes sense to me.

I'm not sure I understand. This is not a passthrough device (unlike
scsi-generic), so why should we consider the hardware limits rather than
the kernel/other backend limits for read/write requests?

See the documentation of both fields:

    /*
     * Maximal transfer length in bytes.  Need not be power of 2, but
     * must be multiple of opt_transfer and bl.request_alignment, or 0
     * for no 32-bit limit.  For now, anything larger than INT_MAX is
     * clamped down.
     */
    uint32_t max_transfer;

    /*
     * Maximal hardware transfer length in bytes.  Applies whenever
     * transfers to the device bypass the kernel I/O scheduler, for
     * example with SG_IO.  If larger than max_transfer or if zero,
     * blk_get_max_hw_transfer will fall back to max_transfer.
     */
    uint64_t max_hw_transfer;

Is the real problem that max_transfer isn't right?

Kevin


