Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424843FAD1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:34:15 +0200 (CEST)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgPDC-0008Sc-40
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgOvm-0002Yb-Ov
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 06:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgOvh-0000xJ-FX
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 06:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635502566;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=o2B4ztsWmX+wOWwn59B8hWldxpy/y9s8BaBGEAVahoE=;
 b=YtY6AbqrEB2Ka5k8TEVkhC1kbOhBAAFvgndE4Lv3NTxmlj+gtOuiDTyscXEtsTa5O2rNbP
 nySLG/uTuY6QPWEJGu0xMwtV0OzQ4Kkb7kspjBBZDs76j65bvvNw9JtMeLQxzEL/Im4hww
 F5wGSXp0JFGrmOWkG9TLQXABxppEA1k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-7Kpzd4CyOQW8IQZ2Cp3brA-1; Fri, 29 Oct 2021 06:16:05 -0400
X-MC-Unique: 7Kpzd4CyOQW8IQZ2Cp3brA-1
Received: by mail-wm1-f69.google.com with SMTP id
 b79-20020a1c1b52000000b0032328337393so3529441wmb.1
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 03:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=o2B4ztsWmX+wOWwn59B8hWldxpy/y9s8BaBGEAVahoE=;
 b=FHRUKqyuUhLLuhUOu4S65stwqWin5dNnLvSmW8Ghr2BBkqTFHkJEPvMb8L+o/eYQXe
 Exybp5Vv6c3UsvQk+2yXRO0H8nGRv7En1yMxNbKVaGqxgOQDBIUY3fHNLQwk+b5StBe7
 CQ0hnOjBt0/jbNd5m0emsyG/DpGeDo13OMbGwkfGq9buotUvUCXJGueg28NDH0v8bQ2n
 5rjIshUweYZBBQKl9NWxYlugRmuU2K0d9/0pwN0z63joP5W2oasm6n9l13plmTvsSqoy
 e+NRh2NhaGHYF/CJ9Q6HQUCeMSeM9ZdW2B5KVVFVZEU2sXjSO1Ac7jDtDNcUFjzX2HFp
 pC4Q==
X-Gm-Message-State: AOAM531rw/zik2a9pbDeqzyZh/oBUq6N5gRZKC16/8aalAJLjsOyIL5q
 24orQVcpGv/kozfqc1KLQgwAv2g0IMLNkqEIZRLb78XF1cd5b8HiUIFS3MlLOj9wPdh2DoynQh9
 p4OPUJOqbgwWa6JU=
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr13285226wrs.69.1635502564175; 
 Fri, 29 Oct 2021 03:16:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmBclR5aZmlUlHu+Yk31uYKTH136mRKh67j3BGNsavCVvlmsDowazLGl/h+6l+GTCGGKKEVw==
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr13285189wrs.69.1635502563929; 
 Fri, 29 Oct 2021 03:16:03 -0700 (PDT)
Received: from localhost ([178.139.224.158])
 by smtp.gmail.com with ESMTPSA id 6sm5015033wma.48.2021.10.29.03.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 03:16:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH v4] migration/rdma: Fix out of order wrid
In-Reply-To: <20211029021447.2430231-1-lizhijian@cn.fujitsu.com> (Li Zhijian's
 message of "Fri, 29 Oct 2021 10:14:47 +0800")
References: <20211029021447.2430231-1-lizhijian@cn.fujitsu.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 29 Oct 2021 12:16:02 +0200
Message-ID: <8735okuof1.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: quintela@redhat.com
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
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
> NOTE: we use soft RoCE as the rdma device.
> [root@iaas-rpma images]# rdma link show rxe_eth0/1
> link rxe_eth0/1 state ACTIVE physical_state LINK_UP netdev eth0
>
> This migration could not be completed when out of order(OOO) CQ event occurs.
> The send queue and receive queue shared a same completion queue, and
> qemu_rdma_block_for_wrid() will drop the CQs it's not interested in. But
> the dropped CQs by qemu_rdma_block_for_wrid() could be later CQs it wants.
> So in this case, qemu_rdma_block_for_wrid() will block forever.
>
> OOO cases will occur in both source side and destination side. And a
> forever blocking happens on only SEND and RECV are out of order. OOO between
> 'WRITE RDMA' and 'RECV' doesn't matter.
>
> below the OOO sequence:
>        source                             destination
>       rdma_write_one()                   qemu_rdma_registration_handle()
> 1.    S1: post_recv X                    D1: post_recv Y
> 2.    wait for recv CQ event X
> 3.                                       D2: post_send X     ---------------+
> 4.                                       wait for send CQ send event X (D2) |
> 5.    recv CQ event X reaches (D2)                                          |
> 6.  +-S2: post_send Y                                                       |
> 7.  | wait for send CQ event Y                                              |
> 8.  |                                    recv CQ event Y (S2) (drop it)     |
> 9.  +-send CQ event Y reaches (S2)                                          |
> 10.                                      send CQ event X reaches (D2)  -----+
> 11.                                      wait recv CQ event Y (dropped by (8))
>
> Although a hardware IB works fine in my a hundred of runs, the IB specification
> doesn't guaratee the CQ order in such case.
>
> Here we introduce a independent send completion queue to distinguish
> ibv_post_send completion queue from the original mixed completion queue.
> It helps us to poll the specific CQE we are really interested in.
>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Change is reasonable from migration point of view, and my RDMA knowledge
is not good enough to discern.

> @@ -3115,10 +3160,14 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
>  {
>      QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
>      if (io_read) {
> -        aio_set_fd_handler(ctx, rioc->rdmain->comp_channel->fd,
> +        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
> +                           false, io_read, io_write, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
>                             false, io_read, io_write, NULL, opaque);
>      } else {
> -        aio_set_fd_handler(ctx, rioc->rdmaout->comp_channel->fd,
> +        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
> +                           false, io_read, io_write, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
>                             false, io_read, io_write, NULL, opaque);
>      }
>  }

Not related tothis patch.  But this function asks to be splited in two,
it is a single if depending of one of the parameters.

> @@ -3332,7 +3381,22 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
>       */
>      while (1) {
>          uint64_t wr_id, wr_id_in;
> -        int ret = qemu_rdma_poll(rdma, &wr_id_in, NULL);
> +        int ret = qemu_rdma_poll(rdma, rdma->recv_cq, &wr_id_in, NULL);
> +        if (ret < 0) {
> +            error_report("rdma migration: polling error! %d", ret);

To comment to what Dave said on the previosu review.  If you touch this
part again, you can also differentiate recv/send channel here?

> +            goto err;
> +        }
> +
> +        wr_id = wr_id_in & RDMA_WRID_TYPE_MASK;
> +
> +        if (wr_id == RDMA_WRID_NONE) {
> +            break;
> +        }

Code was already that way, but creating a variable for not putting:

        if ((wr_id_in & RDMA_WRID_TYPE_MASK) == RDMA_WRID_NONE) {
            break;
        }
I was just searching if wr_id was used anywhere else.

Later, Juan.


