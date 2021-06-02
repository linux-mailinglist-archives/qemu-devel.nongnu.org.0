Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E028F398F4C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 17:54:14 +0200 (CEST)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loTC9-0007lQ-W2
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 11:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1loTAc-0006uG-EX
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1loTAZ-00020t-M2
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622649154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UwkLfbwPcknM7RJy0+xU8an3+NSft+OatgqUdHAth8U=;
 b=fjWNBLIwGCEOoHp/XOyw+BEbuKQlmEETRG4p+BCpiJLbnMi968WNZSpLk2LHCN9o68ZaQj
 dxiaIv6Zh2B/gm40XyDTyBETX70tW1CgynHq6xRp9nB8jg8Po/Hwm31/ZTXM9WbKA6nfEO
 a6R+zVqR+/5lxRd2ZIQr4mWhS9w3BvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-oQ6i7KKOPfK4t9SPIODVGQ-1; Wed, 02 Jun 2021 11:52:13 -0400
X-MC-Unique: oQ6i7KKOPfK4t9SPIODVGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0586B107ACC7;
 Wed,  2 Jun 2021 15:52:13 +0000 (UTC)
Received: from work-vm (ovpn-113-195.ams2.redhat.com [10.36.113.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FABC5D9DE;
 Wed,  2 Jun 2021 15:52:12 +0000 (UTC)
Date: Wed, 2 Jun 2021 16:52:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH] migration/rdma: Fix cm event use after free
Message-ID: <YLepKZ1X2wr7PwPC@work-vm>
References: <20210602023506.3821293-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210602023506.3821293-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Thanks! I don't think I understood that 'ack' actually meant 'free'!



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/rdma.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 1cdb4561f32..d90b29a4b51 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1539,16 +1539,20 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
>  
>                  if (pfds[1].revents) {
>                      ret = rdma_get_cm_event(rdma->channel, &cm_event);
> -                    if (!ret) {
> -                        rdma_ack_cm_event(cm_event);
> +                    if (ret) {
> +                        error_report("failed to get cm event while wait "
> +                                     "completion channel");
> +                        return -EPIPE;
>                      }
>  
>                      error_report("receive cm event while wait comp channel,"
>                                   "cm event is %d", cm_event->event);
>                      if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
>                          cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
> +                        rdma_ack_cm_event(cm_event);
>                          return -EPIPE;
>                      }
> +                    rdma_ack_cm_event(cm_event);
>                  }
>                  break;
>  
> @@ -3285,7 +3289,6 @@ static void rdma_cm_poll_handler(void *opaque)
>          error_report("get_cm_event failed %d", errno);
>          return;
>      }
> -    rdma_ack_cm_event(cm_event);
>  
>      if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
>          cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
> @@ -3298,12 +3301,14 @@ static void rdma_cm_poll_handler(void *opaque)
>                  rdma->return_path->error_state = -EPIPE;
>              }
>          }
> +        rdma_ack_cm_event(cm_event);
>  
>          if (mis->migration_incoming_co) {
>              qemu_coroutine_enter(mis->migration_incoming_co);
>          }
>          return;
>      }
> +    rdma_ack_cm_event(cm_event);
>  }
>  
>  static int qemu_rdma_accept(RDMAContext *rdma)
> -- 
> 2.30.2
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


