Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1345DE81
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 17:16:49 +0100 (CET)
Received: from localhost ([::1]:33112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqHQW-0001Dr-2S
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 11:16:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqHOi-0000Ur-Oa
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:14:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mqHOe-0001jF-9X
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637856891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gRPCG75xApNRqzb6F4GpIESoFZ+00g7Q5E5pjjxv3QI=;
 b=eu1NKnZqP7nHa3MlGw51jjwnNMhJBnzXgQJnv+lXhxNQYJm4DF0MBNNsSABB2znhagRa1A
 2SrNGXBFv077N8nNTpguf2OW/6T5xV2nPDa1afGgOfjVBEDB4Moq6F6zu2vMcV4GvDGsN8
 3U0lDST+zcdDkMUYl359n7uZPFSkH7A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-OpjPAlfLOjWm0RRtL2OOjg-1; Thu, 25 Nov 2021 11:14:49 -0500
X-MC-Unique: OpjPAlfLOjWm0RRtL2OOjg-1
Received: by mail-ed1-f72.google.com with SMTP id
 r16-20020a056402019000b003e6cbb77ed2so5850596edv.10
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 08:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gRPCG75xApNRqzb6F4GpIESoFZ+00g7Q5E5pjjxv3QI=;
 b=etmKcVKxzTqVz7eG3aesWluBOnLCmL2507yMxX9ensMoeRFfNzfespLGRbzTAt9baT
 Dv7cEHb9lYU/sQI/ArpginG5Koltg3nSYfP53kr2ME/ck3OMIyOwEmuBoa+sDdgsKUL/
 23h36bz8MBQHGzpO16Pc0AdXmf4N1q0YO3O+yWIz9182oOtRQxrhdbRmQGyuld4Ff/99
 lpelU5NDQX/UNDwDO5vUsNX0xZmTDRWaPiPz5mBQcX6G6GzgC0wwEkVZYEp8mmkH7igt
 P8Avy8y1ZQhrATQ0E+f3O8jSgQPeUdmezg9TjzSYzvyHgAv6GclII/C4koGH2wXGDIRZ
 xyqw==
X-Gm-Message-State: AOAM530YRKLjVV92vSynCENHmTxz3nEXKy1Xw1fn8UhTY8zS5xA2JwG8
 0SJGL3IeojFQ3wbu5s7YoMYA+i46TnKreKSaC825+B7aHgUk1RB/ocoWoTJ+UDMCvhz3JRzDwgr
 zRg2coCFPVaOFHZ0=
X-Received: by 2002:a17:907:7e8e:: with SMTP id
 qb14mr31811730ejc.562.1637856887800; 
 Thu, 25 Nov 2021 08:14:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFdIqL9tN4HovdR6iVDMP4SHbVShH1zISY458Rq+A9TSb/QA3KtJe9cCpIJ7G0J5pfgix/+g==
X-Received: by 2002:a17:907:7e8e:: with SMTP id
 qb14mr31811679ejc.562.1637856887490; 
 Thu, 25 Nov 2021 08:14:47 -0800 (PST)
Received: from redhat.com ([176.12.197.47])
 by smtp.gmail.com with ESMTPSA id qf8sm1826485ejc.8.2021.11.25.08.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 08:14:46 -0800 (PST)
Date: Thu, 25 Nov 2021 11:14:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] virtio-balloon: correct used length
Message-ID: <20211125111055-mutt-send-email-mst@kernel.org>
References: <20211125022046.10433-1-jasowang@redhat.com>
 <20211125022046.10433-2-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211125022046.10433-2-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mpe@ellerman.id.au, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 10:20:46AM +0800, Jason Wang wrote:
> Spec said:
> 
> "and len the total of bytes written into the buffer."
> 
> For inflateq, deflateq and statsq, we don't process in_sg so the used
> length should be zero. For free_page_vq, since the pages could be
> changed in the destination, we should make all pages used for safety.

Yea, about that, I know I said it, but I was wrong, sorry.

Spec says this:

	\field{len} is particularly useful
	for drivers using untrusted buffers: if a driver does not know exactly
	how much has been written by the device, the driver would have to zero
	the buffer in advance to ensure no data leakage occurs.

	For example, a network driver may hand a received buffer directly to
	an unprivileged userspace application.  If the network device has not
	overwritten the bytes which were in that buffer, this could leak the
	contents of freed memory from other processes to the application.


In other words, device must guarantee that used length was
written into. Since we don't know that, we really should
write 0 there, and the fact we don't is a spec violation.


> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/virtio/virtio-balloon.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 17de2558cb..fb4426ac0c 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
>          return;
>      }
>  
> -    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
> +    virtqueue_push(s->svq, s->stats_vq_elem, 0);
>      virtio_notify(vdev, s->svq);
>      g_free(s->stats_vq_elem);
>      s->stats_vq_elem = NULL;
> @@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>              memory_region_unref(section.mr);
>          }
>  
> -        virtqueue_push(vq, elem, offset);
> +        virtqueue_push(vq, elem, 0);
>          virtio_notify(vdev, vq);
>          g_free(elem);
>          virtio_balloon_pbp_free(&pbp);
> @@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VirtQueue *vq = dev->free_page_vq;
>      bool ret = true;
> +    size_t used = 0;
>      int i;
>  
>      while (dev->block_iothread) {
> @@ -548,11 +549,12 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
>          for (i = 0; i < elem->in_num; i++) {
>              qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
>                                        elem->in_sg[i].iov_len);
> +            used += elem->in_sg[i].iov_len;
>          }
>      }
>  
>  out:
> -    virtqueue_push(vq, elem, 1);
> +    virtqueue_push(vq, elem, used);
>      g_free(elem);
>      return ret;
>  }
> -- 
> 2.25.1


