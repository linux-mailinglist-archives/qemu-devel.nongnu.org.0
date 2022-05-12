Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A3252475E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 09:49:32 +0200 (CEST)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np3Zj-0006q1-9v
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 03:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1np3Xp-00067e-8j
 for qemu-devel@nongnu.org; Thu, 12 May 2022 03:47:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1np3Xm-0007xP-9Z
 for qemu-devel@nongnu.org; Thu, 12 May 2022 03:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652341646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KytANMPTFEdGDT9O7ZI11dGHErO92YLp7V//y5FnNB8=;
 b=ENEADQuay7T3yDc4pkWNdbD0MQ+D9Y1Qqi+lzP0QvP4ndgvH0W6n7F8kyW4qW41QP3ADpw
 1Vx5LvrVhxewXA+x7WLuPtktfELjrqvrD5saZR1C6VXAHnfAH2UtQbw8WjvQxzSpkL9OmW
 5zNaqTWXp0sKOiN8wImTePCQJbcFp6Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-EPuSAgNTN5WnUj-vWS1itA-1; Thu, 12 May 2022 03:47:25 -0400
X-MC-Unique: EPuSAgNTN5WnUj-vWS1itA-1
Received: by mail-wm1-f71.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso4045748wma.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 00:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KytANMPTFEdGDT9O7ZI11dGHErO92YLp7V//y5FnNB8=;
 b=fGoAQyB4Hj0vJqLjzZfaAqXxQGUbiev5L/P57aioYW58UGadQB+6RPyCZVDdGenjvR
 QaAbrcgk1wwhxp3aaqr5ytqZQfRtmCM4lwuF4+osaUUaR7AD9ki9UYNDhqJHuu/Q/8BA
 DcRXxB0wNYIQBBCV/SjDrdq7sC83LqzDgXUkItUopTsuY7j99QB0Fob2oZxRdclc98JG
 RsJFAU5xkm8SUfMgUlMg8W4FZrIXK+0B1mKGFmmbaoCHY5OrCIIxxYn0gLsz9SpD/1Up
 nalLSDC3VS0LPTsVeW+nLEgTHR1ioDtpJ6Kt5Omfvaw0oMcwNjVoVdbJTIC9MGYfhgr8
 73uQ==
X-Gm-Message-State: AOAM533E+ollk1YdSijQOlmC40GlLUhf9rHd6TVlXSZgieDH0PV17LuS
 xKgIvAQKQSEC4bpcFloDFZDggLDZ37s0qgBL9c3tMWSW8obO/RuDiEZqUc87hhhQxyGnTCvh5sG
 oZgroWjJAYUmJbbY=
X-Received: by 2002:adf:e0c5:0:b0:206:1ba3:26aa with SMTP id
 m5-20020adfe0c5000000b002061ba326aamr25631331wri.645.1652341644487; 
 Thu, 12 May 2022 00:47:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHyXtc8+djxHtz8NOJUzUN85tHoQMHH01xA6EMXenTR8flBJkKQ7ysp45+qo352PtHiC3jMg==
X-Received: by 2002:adf:e0c5:0:b0:206:1ba3:26aa with SMTP id
 m5-20020adfe0c5000000b002061ba326aamr25631316wri.645.1652341644246; 
 Thu, 12 May 2022 00:47:24 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-106.retail.telecomitalia.it.
 [87.11.6.106]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b0020c547f75easm3225306wrm.101.2022.05.12.00.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 00:47:23 -0700 (PDT)
Date: Thu, 12 May 2022 09:47:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] vhost-backend: do not depend on CONFIG_VHOST_VSOCK
Message-ID: <20220512074720.wuuj3xalykejiqpx@sgarzare-redhat>
References: <20220511074328.164544-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220511074328.164544-1-pbonzini@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 09:43:28AM +0200, Paolo Bonzini wrote:
>The vsock callbacks .vhost_vsock_set_guest_cid and
>.vhost_vsock_set_running are the only ones to be conditional
>on #ifdef CONFIG_VHOST_VSOCK.  This is different from any other
>device-dependent callbacks like .vhost_scsi_set_endpoint, and it
>also broke when CONFIG_VHOST_VSOCK was changed to a per-target
>symbol.
>
>It would be possible to also use the CONFIG_DEVICES include, but
>really there is no reason for most virtio files to be per-target
>so just remove the #ifdef to fix the issue.
>

I'm i doubt whether or not to add the following Fixes tag, since that 
commit only highlighted the problem:

Fixes: 9972ae314f ("build: move vhost-vsock configuration to Kconfig")

>Reported-by: Dov Murik <dovmurik@linux.ibm.com>
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> hw/virtio/vhost-backend.c | 4 ----
> 1 file changed, 4 deletions(-)

Anyway, the path LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

>
>diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
>index e409a865ae..4de8b6b3b0 100644
>--- a/hw/virtio/vhost-backend.c
>+++ b/hw/virtio/vhost-backend.c
>@@ -203,7 +203,6 @@ static int vhost_kernel_get_vq_index(struct vhost_dev *dev, int idx)
>     return idx - dev->vq_index;
> }
>
>-#ifdef CONFIG_VHOST_VSOCK
> static int vhost_kernel_vsock_set_guest_cid(struct vhost_dev *dev,
>                                             uint64_t guest_cid)
> {
>@@ -214,7 +213,6 @@ static int vhost_kernel_vsock_set_running(struct vhost_dev *dev, int start)
> {
>     return vhost_kernel_call(dev, VHOST_VSOCK_SET_RUNNING, &start);
> }
>-#endif /* CONFIG_VHOST_VSOCK */
>
> static void vhost_kernel_iotlb_read(void *opaque)
> {
>@@ -319,10 +317,8 @@ const VhostOps kernel_ops = {
>         .vhost_set_owner = vhost_kernel_set_owner,
>         .vhost_reset_device = vhost_kernel_reset_device,
>         .vhost_get_vq_index = vhost_kernel_get_vq_index,
>-#ifdef CONFIG_VHOST_VSOCK
>         .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
>         .vhost_vsock_set_running = vhost_kernel_vsock_set_running,
>-#endif /* CONFIG_VHOST_VSOCK */
>         .vhost_set_iotlb_callback = vhost_kernel_set_iotlb_callback,
>         .vhost_send_device_iotlb_msg = vhost_kernel_send_device_iotlb_msg,
> };
>-- 
>2.36.0
>
>


