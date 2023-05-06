Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C506F8D69
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 03:14:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv6UQ-0002W8-O7; Fri, 05 May 2023 21:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pv6UO-0002Vt-FJ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 21:13:32 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pv6UM-0007v9-Le
 for qemu-devel@nongnu.org; Fri, 05 May 2023 21:13:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 316E4641D3;
 Sat,  6 May 2023 01:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803CCC433D2;
 Sat,  6 May 2023 01:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683335608;
 bh=kbfyCZ/OIOcwupFcFbstNbToCUDi6rMZBmq26a28eDA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=AdAbF1L56MX8vHqQ6MzWKJGRAbRAMP3R1IXMtemOzD2oN9rzpV3BZDxQr7u9YS4Of
 LZIB5myzBjj/w/uKDLFBKVDBSTxK9TRF5Q0arZk1rPDNQ4Xd7nqfWro5SdxegzDF/f
 qkGQU0GRkxngpXz3UmTh1pAgjmrC0dZL8QFUw9IRbSQ80c4F89MBiyeFt645FTgT9E
 5mYfdiIkLhtesYcnxz37VWLPlPMpa4xMkwiWhhyZtdFTp2yHODj6E22PlQq/JN4vrU
 x6h7+WyyOtXQJZAv521wU6F2lXpPxHuH1N3vrf0iy/p2fq+gumzQMrplu9SrdfYrUQ
 +yvMevRdK6tvA==
Date: Fri, 5 May 2023 18:13:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mark Syms <mark.syms@citrix.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com, 
 paul@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/1] Updated: Ensure PV ring is drained on disconenct
In-Reply-To: <20230420102014.647446-1-mark.syms@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2305051759260.974517@ubuntu-linux-20-04-desktop>
References: <20230329105344.3465706-2-mark.syms@citrix.com>
 <20230420102014.647446-1-mark.syms@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 20 Apr 2023, Mark Syms wrote:
> Updated patch to address intermittent SIGSEGV on domain disconnect/shutdown.
> 
> Mark Syms (1):
>   Ensure the PV ring is drained on disconnect
> 
>  hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> -- 
> 2.40.0
> 
> >From 21724baa15a72534d98aa2653e9ec39e83559319 Mon Sep 17 00:00:00 2001
> From: Mark Syms <mark.syms@citrix.com>
> Date: Thu, 20 Apr 2023 11:08:34 +0100
> Subject: [PATCH 1/1] Ensure the PV ring is drained on disconnect
> 
> Also ensure all pending AIO is complete.

Hi Mark, can you please add more info on the problem you are trying to
solve? Also add any stacktrace if you get any due to this error.


> Signed-off-by: Mark Syms <mark.syms@citrix.com>
> ---
>  hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
> index 734da42ea7..d9da4090bf 100644
> --- a/hw/block/dataplane/xen-block.c
> +++ b/hw/block/dataplane/xen-block.c
> @@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
>  
>      dataplane->more_work = 0;
>  
> +    if (dataplane->sring == 0) {
> +        return done_something;

done_something cannot be changed by now, so I would just do

    return false;


> +    }
> +
>      rc = dataplane->rings.common.req_cons;
>      rp = dataplane->rings.common.sring->req_prod;
>      xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
> @@ -666,14 +670,35 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane)
>  void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
>  {
>      XenDevice *xendev;
> +    XenBlockRequest *request, *next;
>  
>      if (!dataplane) {
>          return;
>      }
>  
> +    /* We're about to drain the ring. We can cancel the scheduling of any
> +     * bottom half now */
> +    qemu_bh_cancel(dataplane->bh);
> +
> +    /* Ensure we have drained the ring */
> +    aio_context_acquire(dataplane->ctx);

Would it make sense to move the 2 loops below under the existing
aio_context_acquire also below?


> +    do {
> +        xen_block_handle_requests(dataplane);
> +    } while (dataplane->more_work);
> +    aio_context_release(dataplane->ctx);
> +
> +    /* Now ensure that all inflight requests are complete */
> +    while (!QLIST_EMPTY(&dataplane->inflight)) {
> +        QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next) {
> +            blk_aio_flush(request->dataplane->blk, xen_block_complete_aio,
> +                        request);
> +        }
> +    }

especially because I would think that blk_aio_flush needs to be called
with aio_context_acquired ?



>      xendev = dataplane->xendev;
>  
>      aio_context_acquire(dataplane->ctx);
> +

move the new code here


>      if (dataplane->event_channel) {
>          /* Only reason for failure is a NULL channel */
>          xen_device_set_event_channel_context(xendev, dataplane->event_channel,
> @@ -684,12 +709,6 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
>      blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &error_abort);
>      aio_context_release(dataplane->ctx);
>  
> -    /*
> -     * Now that the context has been moved onto the main thread, cancel
> -     * further processing.
> -     */
> -    qemu_bh_cancel(dataplane->bh);
> -
>      if (dataplane->event_channel) {
>          Error *local_err = NULL;
>  
> -- 
> 2.40.0
> 

