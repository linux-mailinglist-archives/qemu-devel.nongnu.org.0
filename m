Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1C46439A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 00:47:14 +0100 (CET)
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msCq9-0000lF-2O
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 18:47:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msCoX-0008Dj-Av
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 18:45:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msCoV-0005m7-6q
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 18:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638315930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5qy4cFVCjmBCSzOuEYu+nDb7tsUlajOQc5wr2Rq+Vg=;
 b=eVBQA+rqlUtI19SnvIoE70Yl2iOWGdEjIIR838It3MbpNiDpBupc6VZdUFfEL7uFi1igBr
 JQqNb+WoC3pXlSc5cMMOzZrw7ykgddPM9IusLSYsRePsspNoLDoaH5mirZ0qCBVlb73Lz7
 44J2wzKsFdLgDtQzhQHpYBmjt9SQ/Tk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-aAUjRwSNM4CmepXWzCPFpg-1; Tue, 30 Nov 2021 18:45:27 -0500
X-MC-Unique: aAUjRwSNM4CmepXWzCPFpg-1
Received: by mail-ed1-f70.google.com with SMTP id
 eg20-20020a056402289400b003eb56fcf6easo18329465edb.20
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 15:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J5qy4cFVCjmBCSzOuEYu+nDb7tsUlajOQc5wr2Rq+Vg=;
 b=d7QwekqxfU6ip2u/DcPsSGo7hjv2BA3KebdufJGPPvF/Z8OL5kK57D8mXpSyggqA/L
 YT3jz3hzqf7ItgXapwBAZAFWaCjqeIZFUHS9Btvhf3lB86jJTKwD816EHVEZx/GxfUAy
 WfKEn4JeKhS7eQr0WPRtfFTHJLBUyRni3CJHg8j2QM3T8Ydb2THS0O9DcT55l3PwwYWq
 cDHOkiRiAe6s9VZlJnJKyNA1laW+9Nmhl8sbjyaZAY/x9jdVlWrgVXgJDoIflJVLJkNS
 m3861n0ofvHpV05SYjuEaXXh1YXcZpXRmaZO3LiC3xUgh5Hr2kjRFi3XaM787ct8sR1/
 Ff7Q==
X-Gm-Message-State: AOAM530zePsoz4n1nLamDi5EZ3r7aoEVqESeeL4KPJXpt6xa6NivhzzI
 N/ZWmpg2OMuw5tPenBFeyZ5XJKLp6bH72yxyhxS9L6Kh475i8Tbfp4z7hF+0MygnA5uCim103Fu
 1KHh7H82X2VKaKzg=
X-Received: by 2002:a50:ee96:: with SMTP id f22mr3244402edr.77.1638315926073; 
 Tue, 30 Nov 2021 15:45:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxigDwR4s92qkLrwzzn9Qn6EJhDEFUVz2Ct9l6jJWlNAgzaZ1rWOAtbLh9cjtZF2V2ivh3bhg==
X-Received: by 2002:a50:ee96:: with SMTP id f22mr3244317edr.77.1638315925473; 
 Tue, 30 Nov 2021 15:45:25 -0800 (PST)
Received: from redhat.com ([2.53.15.215])
 by smtp.gmail.com with ESMTPSA id c8sm11715371edu.60.2021.11.30.15.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:45:25 -0800 (PST)
Date: Tue, 30 Nov 2021 18:45:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] linux-headers: sync
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Message-ID: <20211130184501-mutt-send-email-mst@kernel.org>
References: <20211130092838.24224-1-david@redhat.com>
 <20211130092838.24224-2-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211130092838.24224-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 30, 2021 at 10:28:36AM +0100, David Hildenbrand wrote:
> TODO: replace by a proper header sync.

what's the plan for this patchset then?

> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/standard-headers/linux/virtio_mem.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/standard-headers/linux/virtio_mem.h b/include/standard-headers/linux/virtio_mem.h
> index 05e5ade75d..18c74c527c 100644
> --- a/include/standard-headers/linux/virtio_mem.h
> +++ b/include/standard-headers/linux/virtio_mem.h
> @@ -68,9 +68,10 @@
>   * explicitly triggered (VIRTIO_MEM_REQ_UNPLUG).
>   *
>   * There are no guarantees what will happen if unplugged memory is
> - * read/written. Such memory should, in general, not be touched. E.g.,
> - * even writing might succeed, but the values will simply be discarded at
> - * random points in time.
> + * read/written. In general, unplugged memory should not be touched, because
> + * the resulting action is undefined. There is one exception: without
> + * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, unplugged memory inside the usable
> + * region can be read, to simplify creation of memory dumps.
>   *
>   * It can happen that the device cannot process a request, because it is
>   * busy. The device driver has to retry later.
> @@ -87,6 +88,8 @@
>  
>  /* node_id is an ACPI PXM and is valid */
>  #define VIRTIO_MEM_F_ACPI_PXM		0
> +/* unplugged memory must not be accessed */
> +#define VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE	1
>  
>  
>  /* --- virtio-mem: guest -> host requests --- */
> -- 
> 2.31.1


