Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768AA698323
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:20:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMNh-00067a-JA; Wed, 15 Feb 2023 13:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pSMNf-00067G-Uz
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pSMNe-0003he-HN
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676485185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jX0rUjyqJGqxzoh5gc4lX6Yp69D+xyH+YQ/g8AkaiKE=;
 b=DPqO5ZaqLmHZVBS8a4N1LR4gD+4ACpDLKq72f0lqz+AZ2GVm5k6924Y2IzWf2KBgJIA1Aq
 mmRf5VBi4HpcRECDICn9o4oU4RFPkPzHsgBpN5/rXX5T17ohYjlw0OHMuk1D3CxudwAlgR
 Azh7vpyPnZeZFQGnb+yun9I2o4cuqUw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-tRpz02diNIO58Bwl8snCDg-1; Wed, 15 Feb 2023 13:19:42 -0500
X-MC-Unique: tRpz02diNIO58Bwl8snCDg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EF7785CBE7;
 Wed, 15 Feb 2023 18:19:41 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B5FD492B0E;
 Wed, 15 Feb 2023 18:19:40 +0000 (UTC)
Date: Wed, 15 Feb 2023 12:19:38 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v2 2/3] dma-helpers: prevent dma_blk_cb() vs
 dma_aio_cancel() race
Message-ID: <20230215181938.s45ilx7jrvpwl4ie@redhat.com>
References: <20230210143238.524357-1-stefanha@redhat.com>
 <20230210143238.524357-3-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210143238.524357-3-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 10, 2023 at 09:32:37AM -0500, Stefan Hajnoczi wrote:
> dma_blk_cb() only takes the AioContext lock around ->io_func(). That
> means the rest of dma_blk_cb() is not protected. In particular, the
> DMAAIOCB field accesses happen outside the lock.
> 
> There is a race when the main loop thread holds the AioContext lock and
> invokes scsi_device_purge_requests() -> bdrv_aio_cancel() ->
> dma_aio_cancel() while an IOThread executes dma_blk_cb(). The dbs->acb
> field determines how cancellation proceeds. If dma_aio_cancel() see

"sees" or "can see"

> dbs->acb == NULL while dma_blk_cb() is still running, the request can be
> completed twice (-ECANCELED and the actual return value).
> 
> The following assertion can occur with virtio-scsi when an IOThread is
> used:
> 
>   ../hw/scsi/scsi-disk.c:368: scsi_dma_complete: Assertion `r->req.aiocb != NULL' failed.
> 
> Fix the race by holding the AioContext across dma_blk_cb(). Now
> dma_aio_cancel() under the AioContext lock will not see
> inconsistent/intermediate states.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/scsi/scsi-disk.c   |  4 +---
>  softmmu/dma-helpers.c | 12 +++++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)

Widening the scope protected by the lock makes sense, insofar as we
still need the lock.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


