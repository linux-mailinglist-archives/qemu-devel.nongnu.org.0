Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8749B2D7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:23:50 +0100 (CET)
Received: from localhost ([::1]:50830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJvR-0006Bs-BU
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCJrP-00053Y-Ho
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:19:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCJrM-0008Sw-8F
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643109574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y7P1yF6o1OHPqp7hOoSyAalTu2Iup6/EEkMk+iLMMvU=;
 b=aBfPIQbfa8dsqJnBPxIS+bK/KeiOHxBuqYRTIlSWmOLAIa34iYUE9+j/IOEPfQVcNC9Mei
 +7Sbcoxc2+K7APfMWAgSLu5UzLamF376KqUtRG2dDDnKaqQNblEAqH0vK5Em6PcBoPTWPQ
 238ZT9oNXAeRMo7CUomn5Utvgl99efI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-waWIfD-NNJ2JiLqdwcidiw-1; Tue, 25 Jan 2022 06:19:33 -0500
X-MC-Unique: waWIfD-NNJ2JiLqdwcidiw-1
Received: by mail-wr1-f72.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso2924823wrg.7
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 03:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y7P1yF6o1OHPqp7hOoSyAalTu2Iup6/EEkMk+iLMMvU=;
 b=UoTB1M09WjxTfHitk5zZy5ouUeVr/j05A2/NYAZzc17/9o3/vFIhj6WCbxNDS/mzt6
 WfhzkflSTedvrzJ/1MOLuWyU+Vcsfibt0n6A0Tdt3ApFvfa9VKsvKg+xJpSu1koyTsPI
 gLPWf1Gi+Bh/Cxewr7MWZtX8JHNMhCIIH4kFv3ezh7KS2O5N92SD0MELQwrKF8lWNHpx
 +UfG9jOcdVYRx4kB2rOBI47szvAV80gYQ/R7bf5cc+CDmq4V1Q1xZacY0y8hSEZox8Sq
 Fuo/NGoUSc6M/wLF9AYmZR7GSuJlmRl1yamZm9FamBF3NsgYZsbUULhyx/v2hyKhj02V
 jhig==
X-Gm-Message-State: AOAM5319UB2c2JA1NyP2YAdlAX18xiHTYwcARIBbtquFR+xkgo/PCopi
 yIDfp2ruKsLHwO9vPZ72YDHvHE/d/aDWHR7KpW9/i/Es1UawZ1nK8rBcO0hHljL+GhfLI2K4/1E
 bf+8cFkcQ87EIR6U=
X-Received: by 2002:a1c:1f84:: with SMTP id f126mr2498571wmf.54.1643109572165; 
 Tue, 25 Jan 2022 03:19:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFDp4YZNk4fl7pCmfbEJ5EHz3C8prLtjVau8eJb/ZuIsi2yS/OIDSKz2epfcDSu8dSb5cnyg==
X-Received: by 2002:a1c:1f84:: with SMTP id f126mr2498559wmf.54.1643109571973; 
 Tue, 25 Jan 2022 03:19:31 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o14sm5775711wry.104.2022.01.25.03.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 03:19:31 -0800 (PST)
Date: Tue, 25 Jan 2022 11:19:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/2] virtio-mem: Warn if a memory backend with
 "prealloc=on" is used
Message-ID: <Ye/cwauVLyq3RSq7@work-vm>
References: <20220118150712.139953-1-david@redhat.com>
 <20220118150712.139953-2-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220118150712.139953-2-david@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michal Privoznik <mprivozn@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> "prealloc=on" for the memory backend does not work as expected, as
> virtio-mem will simply discard all preallocated memory immediately again.
> In the best case, it's an expensive NOP. In the worst case, it's an
> unexpected allocation error.
> 
> Instead, "prealloc=on" should be specified for the virtio-mem device only,
> such that virtio-mem will try preallocating memory before plugging
> memory dynamically to the guest.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Why is this a warning rather than an error that stops creation of the
device?

Dave

> ---
>  hw/virtio/virtio-mem.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 04c223b0c9..6c337db0a7 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -765,6 +765,13 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    if (vmem->memdev->prealloc) {
> +        warn_report("'%s' property specifies a memdev with preallocation"
> +                    " enabled: %s. Instead, specify 'prealloc=on' for the"
> +                    " virtio-mem device. ", VIRTIO_MEM_MEMDEV_PROP,
> +                    object_get_canonical_path_component(OBJECT(vmem->memdev)));
> +    }
> +
>      if ((nb_numa_nodes && vmem->node >= nb_numa_nodes) ||
>          (!nb_numa_nodes && vmem->node)) {
>          error_setg(errp, "'%s' property has value '%" PRIu32 "', which exceeds"
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


