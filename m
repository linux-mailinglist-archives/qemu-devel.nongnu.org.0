Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E13B341B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 18:43:35 +0200 (CEST)
Received: from localhost ([::1]:57424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwSRy-0008Nf-Cb
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 12:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwSRE-0007gy-Cd
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 12:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwSR9-0000AY-Hg
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 12:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624552962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hp/9SruU2pZtrppWiEyZDzbpfE90bfxH4RHDHoVABSY=;
 b=TMJ4HgCc8GBCFuz9FrJNCLgwhN4NgTTUwFkyIVDyeMri6YrGQMWFSdhMvXOudi1lEcQKw6
 /7m2qFZhMyE8/TxQc5I5iT2U9HGVy/g4rce54/ahXvSRyXirkFzONSQiHWitrNv5/oe9AZ
 YZ/KSmUbjiEbt20pTomnYNoTUPc11Gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-l4mRMWEgMBS_zW_v8ACP0g-1; Thu, 24 Jun 2021 12:42:40 -0400
X-MC-Unique: l4mRMWEgMBS_zW_v8ACP0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ED3418D6A36;
 Thu, 24 Jun 2021 16:42:39 +0000 (UTC)
Received: from work-vm (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BA665D6D7;
 Thu, 24 Jun 2021 16:42:38 +0000 (UTC)
Date: Thu, 24 Jun 2021 17:42:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH v2 1/2] migration/rdma: Fix out of order wrid
Message-ID: <YNS1+ymtAJAgMSpL@work-vm>
References: <20210618103612.152817-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210618103612.152817-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Li Zhijian (lizhijian@cn.fujitsu.com) wrote:
> destination:
> ../qemu/build/qemu-system-x86_64 -enable-kvm -netdev tap,id=hn0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown -device e1000,netdev=hn0,mac=50:52:54:00:11:22 -boot c -drive if=none,file=./Fedora-rdma-server-migration.qcow2,id=drive-virtio-disk0 -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=drive-virtio-disk0,id=virtio-disk0 -m 2048 -smp 2 -device piix3-usb-uhci -device usb-tablet -monitor stdio -vga qxl -spice streaming-video=filter,port=5902,disable-ticketing -incoming rdma:192.168.22.23:8888
> qemu-system-x86_64: -spice streaming-video=filter,port=5902,disable-ticketing: warning: short-form boolean option 'disable-ticketing' deprecated
> Please use disable-ticketing=on instead
> QEMU 6.0.50 monitor - type 'help' for more information
> (qemu) trace-event qemu_rdma_block_for_wrid_miss on
> (qemu) dest_init RDMA Device opened: kernel name rxe_eth0 uverbs device name uverbs2, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs2, infiniband class device path /sys/class/infiniband/rxe_eth0, transport: (2) Ethernet
> qemu_rdma_block_for_wrid_miss A Wanted wrid CONTROL SEND (2000) but got CONTROL RECV (4000)
> 
> source:
> ../qemu/build/qemu-system-x86_64 -enable-kvm -netdev tap,id=hn0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown -device e1000,netdev=hn0,mac=50:52:54:00:11:22 -boot c -drive if=none,file=./Fedora-rdma-server.qcow2,id=drive-virtio-disk0 -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=drive-virtio-disk0,id=virtio-disk0 -m 2048 -smp 2 -device piix3-usb-uhci -device usb-tablet -monitor stdio -vga qxl -spice streaming-video=filter,port=5901,disable-ticketing -S
> qemu-system-x86_64: -spice streaming-video=filter,port=5901,disable-ticketing: warning: short-form boolean option 'disable-ticketing' deprecated
> Please use disable-ticketing=on instead
> QEMU 6.0.50 monitor - type 'help' for more information
> (qemu)
> (qemu) trace-event qemu_rdma_block_for_wrid_miss on
> (qemu) migrate -d rdma:192.168.22.23:8888
> source_resolve_host RDMA Device opened: kernel name rxe_eth0 uverbs device name uverbs2, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs2, infiniband class device path /sys/class/infiniband/rxe_eth0, transport: (2) Ethernet
> (qemu) qemu_rdma_block_for_wrid_miss A Wanted wrid WRITE RDMA (1) but got CONTROL RECV (4000)
> 
> NOTE: soft RoCE as the rdma device.
> [root@iaas-rpma images]# rdma link show rxe_eth0/1
> link rxe_eth0/1 state ACTIVE physical_state LINK_UP netdev eth0
> 
> This migration cannot be completed since out of order(OOO) CQ event occurs.
> OOO cases will occur in both source side and destination side. And it
> happens on only SEND and RECV are out of order. OOO between 'WRITE RDMA' and
> 'RECV' doesn't matter.
> 
> below the OOO sequence:
> 	  source                     destination
>   qemu_rdma_write_one()          qemu_rdma_registration_handle()
> 1.	post_recv X                 post_recv Y
> 2.			            post_send X
> 3.			            wait X CQ event
> 4.	X CQ event
> 5.	post_send Y
> 6.	wait Y CQ event
> 7.			            Y CQ event (dropped)
> 8.	Y CQ event(send Y done)
> 9.			            X CQ event(send X done)
> 10.                                 wait Y CQ event(dropped at (7), blocks forever)
> 
> Looks it only happens on soft RoCE rdma device in my a hundred of runs,
> a hardware IB device works fine.
> 
> Here we introduce a independent send completion queue to distinguish
> ibv_post_send completion queue from the original mixed completion queue.
> It helps us to poll the specific CQE we are really interesting in.

Hi Li,
  OK, it's a while since I've thought this much about completion, but I
think that's OK, however, what stops the other messages, RDMA_WRITE and
SEND_CONTROL being out of order?

  Could this be fixed another way; make block_for_wrid record a flag for
WRID's it's received, and then check (and clear) that flag right at the
start?

Dave

> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
> V2 Introduce send completion queue
> ---
>  migration/rdma.c | 94 ++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 79 insertions(+), 15 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index d90b29a4b51..16fe0688858 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -359,8 +359,10 @@ typedef struct RDMAContext {
>      struct rdma_event_channel   *channel;
>      struct ibv_qp *qp;                      /* queue pair */
>      struct ibv_comp_channel *comp_channel;  /* completion channel */
> +    struct ibv_comp_channel *send_comp_channel;  /* send completion channel */
>      struct ibv_pd *pd;                      /* protection domain */
>      struct ibv_cq *cq;                      /* completion queue */
> +    struct ibv_cq *send_cq;                 /* send completion queue */
>  
>      /*
>       * If a previous write failed (perhaps because of a failed
> @@ -1067,8 +1069,7 @@ static int qemu_rdma_alloc_pd_cq(RDMAContext *rdma)
>      }
>  
>      /*
> -     * Completion queue can be filled by both read and write work requests,
> -     * so must reflect the sum of both possible queue sizes.
> +     * Completion queue can be filled by read work requests.
>       */
>      rdma->cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
>              NULL, rdma->comp_channel, 0);
> @@ -1077,6 +1078,20 @@ static int qemu_rdma_alloc_pd_cq(RDMAContext *rdma)
>          goto err_alloc_pd_cq;
>      }
>  
> +    /* create send completion channel */
> +    rdma->send_comp_channel = ibv_create_comp_channel(rdma->verbs);
> +    if (!rdma->send_comp_channel) {
> +        error_report("failed to allocate completion channel");
> +        goto err_alloc_pd_cq;
> +    }
> +
> +    rdma->send_cq = ibv_create_cq(rdma->verbs, (RDMA_SIGNALED_SEND_MAX * 3),
> +                                  NULL, rdma->send_comp_channel, 0);
> +    if (!rdma->send_cq) {
> +        error_report("failed to allocate completion queue");
> +        goto err_alloc_pd_cq;
> +    }
> +
>      return 0;
>  
>  err_alloc_pd_cq:
> @@ -1086,8 +1101,16 @@ err_alloc_pd_cq:
>      if (rdma->comp_channel) {
>          ibv_destroy_comp_channel(rdma->comp_channel);
>      }
> +    if (rdma->send_comp_channel) {
> +        ibv_destroy_comp_channel(rdma->send_comp_channel);
> +    }
> +    if (rdma->cq) {
> +        ibv_destroy_cq(rdma->cq);
> +        rdma->cq = NULL;
> +    }
>      rdma->pd = NULL;
>      rdma->comp_channel = NULL;
> +    rdma->send_comp_channel = NULL;
>      return -1;
>  
>  }
> @@ -1104,7 +1127,7 @@ static int qemu_rdma_alloc_qp(RDMAContext *rdma)
>      attr.cap.max_recv_wr = 3;
>      attr.cap.max_send_sge = 1;
>      attr.cap.max_recv_sge = 1;
> -    attr.send_cq = rdma->cq;
> +    attr.send_cq = rdma->send_cq;
>      attr.recv_cq = rdma->cq;
>      attr.qp_type = IBV_QPT_RC;
>  
> @@ -1420,14 +1443,14 @@ static void qemu_rdma_signal_unregister(RDMAContext *rdma, uint64_t index,
>   * (of any kind) has completed.
>   * Return the work request ID that completed.
>   */
> -static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
> -                               uint32_t *byte_len)
> +static uint64_t qemu_rdma_poll(RDMAContext *rdma, struct ibv_cq *cq,
> +                              uint64_t *wr_id_out, uint32_t *byte_len)
>  {
>      int ret;
>      struct ibv_wc wc;
>      uint64_t wr_id;
>  
> -    ret = ibv_poll_cq(rdma->cq, 1, &wc);
> +    ret = ibv_poll_cq(cq, 1, &wc);
>  
>      if (!ret) {
>          *wr_id_out = RDMA_WRID_NONE;
> @@ -1499,7 +1522,8 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
>  /* Wait for activity on the completion channel.
>   * Returns 0 on success, none-0 on error.
>   */
> -static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
> +static int qemu_rdma_wait_comp_channel(RDMAContext *rdma,
> +                                       struct ibv_comp_channel *ch)
>  {
>      struct rdma_cm_event *cm_event;
>      int ret = -1;
> @@ -1510,7 +1534,7 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
>       */
>      if (rdma->migration_started_on_destination &&
>          migration_incoming_get_current()->state == MIGRATION_STATUS_ACTIVE) {
> -        yield_until_fd_readable(rdma->comp_channel->fd);
> +        yield_until_fd_readable(ch->fd);
>      } else {
>          /* This is the source side, we're in a separate thread
>           * or destination prior to migration_fd_process_incoming()
> @@ -1521,7 +1545,7 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
>           */
>          while (!rdma->error_state  && !rdma->received_error) {
>              GPollFD pfds[2];
> -            pfds[0].fd = rdma->comp_channel->fd;
> +            pfds[0].fd = ch->fd;
>              pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
>              pfds[0].revents = 0;
>  
> @@ -1579,6 +1603,17 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
>      return rdma->error_state;
>  }
>  
> +static struct ibv_comp_channel *to_channel(RDMAContext *rdma, int wrid)
> +{
> +    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_comp_channel :
> +           rdma->comp_channel;
> +}
> +
> +static struct ibv_cq *to_cq(RDMAContext *rdma, int wrid)
> +{
> +    return wrid < RDMA_WRID_RECV_CONTROL ? rdma->send_cq : rdma->cq;
> +}
> +
>  /*
>   * Block until the next work request has completed.
>   *
> @@ -1599,13 +1634,15 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
>      struct ibv_cq *cq;
>      void *cq_ctx;
>      uint64_t wr_id = RDMA_WRID_NONE, wr_id_in;
> +    struct ibv_comp_channel *ch = to_channel(rdma, wrid_requested);
> +    struct ibv_cq *poll_cq = to_cq(rdma, wrid_requested);
>  
> -    if (ibv_req_notify_cq(rdma->cq, 0)) {
> +    if (ibv_req_notify_cq(poll_cq, 0)) {
>          return -1;
>      }
>      /* poll cq first */
>      while (wr_id != wrid_requested) {
> -        ret = qemu_rdma_poll(rdma, &wr_id_in, byte_len);
> +        ret = qemu_rdma_poll(rdma, poll_cq, &wr_id_in, byte_len);
>          if (ret < 0) {
>              return ret;
>          }
> @@ -1626,12 +1663,12 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
>      }
>  
>      while (1) {
> -        ret = qemu_rdma_wait_comp_channel(rdma);
> +        ret = qemu_rdma_wait_comp_channel(rdma, ch);
>          if (ret) {
>              goto err_block_for_wrid;
>          }
>  
> -        ret = ibv_get_cq_event(rdma->comp_channel, &cq, &cq_ctx);
> +        ret = ibv_get_cq_event(ch, &cq, &cq_ctx);
>          if (ret) {
>              perror("ibv_get_cq_event");
>              goto err_block_for_wrid;
> @@ -1645,7 +1682,7 @@ static int qemu_rdma_block_for_wrid(RDMAContext *rdma, int wrid_requested,
>          }
>  
>          while (wr_id != wrid_requested) {
> -            ret = qemu_rdma_poll(rdma, &wr_id_in, byte_len);
> +            ret = qemu_rdma_poll(rdma, poll_cq, &wr_id_in, byte_len);
>              if (ret < 0) {
>                  goto err_block_for_wrid;
>              }
> @@ -2365,10 +2402,18 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
>          ibv_destroy_cq(rdma->cq);
>          rdma->cq = NULL;
>      }
> +    if (rdma->send_cq) {
> +        ibv_destroy_cq(rdma->send_cq);
> +        rdma->send_cq = NULL;
> +    }
>      if (rdma->comp_channel) {
>          ibv_destroy_comp_channel(rdma->comp_channel);
>          rdma->comp_channel = NULL;
>      }
> +    if (rdma->send_comp_channel) {
> +        ibv_destroy_comp_channel(rdma->send_comp_channel);
> +        rdma->send_comp_channel = NULL;
> +    }
>      if (rdma->pd) {
>          ibv_dealloc_pd(rdma->pd);
>          rdma->pd = NULL;
> @@ -3041,9 +3086,13 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
>      if (io_read) {
>          aio_set_fd_handler(ctx, rioc->rdmain->comp_channel->fd,
>                             false, io_read, io_write, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
> +                           false, io_read, io_write, NULL, opaque);
>      } else {
>          aio_set_fd_handler(ctx, rioc->rdmaout->comp_channel->fd,
>                             false, io_read, io_write, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
> +                           false, io_read, io_write, NULL, opaque);
>      }
>  }
>  
> @@ -3256,7 +3305,22 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
>       */
>      while (1) {
>          uint64_t wr_id, wr_id_in;
> -        int ret = qemu_rdma_poll(rdma, &wr_id_in, NULL);
> +        int ret = qemu_rdma_poll(rdma, rdma->cq, &wr_id_in, NULL);
> +        if (ret < 0) {
> +            error_report("rdma migration: polling error! %d", ret);
> +            goto err;
> +        }
> +
> +        wr_id = wr_id_in & RDMA_WRID_TYPE_MASK;
> +
> +        if (wr_id == RDMA_WRID_NONE) {
> +            break;
> +        }
> +    }
> +
> +    while (1) {
> +        uint64_t wr_id, wr_id_in;
> +        int ret = qemu_rdma_poll(rdma, rdma->send_cq, &wr_id_in, NULL);
>          if (ret < 0) {
>              error_report("rdma migration: polling error! %d", ret);
>              goto err;
> -- 
> 2.31.1
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


