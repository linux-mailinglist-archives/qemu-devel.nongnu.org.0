Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86260667E2E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 19:35:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG2Oj-0005Vl-9a; Thu, 12 Jan 2023 13:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG2O7-0005VT-6V
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:33:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG2O5-0001vn-CH
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673548396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jn+dKHTb051R0Ul8pWn0byIXsKYkYGDG+nQS/VdfZR0=;
 b=aB92t4GYuck7zrEJ6QaqyCAnDi/ZVXgPHJPsi2l5QEHr+l0W1Crq6Es5yKojOTfL3MHBL5
 dgz3O1i3J/F9BGiB+XPD4UiOVpDmOzbXzEg2EmeWmc77kjrdohjjKMKSXZarPjHz9mm08/
 V0/EpYw1GydhgMh0YaOOpE3gWcBE9AU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-n2wzIPjLMRKGkGVHg-iJlw-1; Thu, 12 Jan 2023 13:33:14 -0500
X-MC-Unique: n2wzIPjLMRKGkGVHg-iJlw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o33-20020a05600c512100b003da1f94e8f7so34730wms.8
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 10:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jn+dKHTb051R0Ul8pWn0byIXsKYkYGDG+nQS/VdfZR0=;
 b=sxoC023r2hqUEWt17zlK8Mn67kUBNyBbC2VCtlAl5moXlSLXBDw7oaX59JVMopFhrM
 RKjEWZvmNfMMM/k3PEsggvELBaxjTarxjkf0qGXdQMHiXTDJQ9IPtwbhFhD6AaB9xgHQ
 xxgZeTtGqdOAlTuLeKFq5XPBP6I1tp/JVfljxscaqUoR8JRHaNagZX/1HPgBthaZZCjB
 PR0C0F1hVReah6KANpgut35MApcw/1eMb4OLAAFuH6Gv65r82iVANWzIjVKvHR0IgIaH
 Cm3vqZORhBA8uPArLi5di9PzXecF3fuM5B0bb9rHR0BGyfvirPKuv/1lCoKmrGA1hJ8b
 SBPA==
X-Gm-Message-State: AFqh2kpB8BOv352ptpxCX8+qoqTcO+l/I1HDWz55QbvyqQXYN0mKmw5D
 0dqKtEaModg4JkqDgQn2jGl9/yZ6OResOU9aAdbcahuEGmdbXlw4mQUvD2gU2S4DNQJDmINPT/K
 CV7ZeVDHb+y3jYUo=
X-Received: by 2002:a05:600c:3485:b0:3d0:761b:f86 with SMTP id
 a5-20020a05600c348500b003d0761b0f86mr55728576wmq.28.1673548392675; 
 Thu, 12 Jan 2023 10:33:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuqaU37TelaFfmXDgnkKgpNTf7wJll6E8YV2xWVTIt6slG/GroR8ubANNdJtvHgq2AytkyTnA==
X-Received: by 2002:a05:600c:3485:b0:3d0:761b:f86 with SMTP id
 a5-20020a05600c348500b003d0761b0f86mr55728560wmq.28.1673548392502; 
 Thu, 12 Jan 2023 10:33:12 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003cf4eac8e80sm27208795wmm.23.2023.01.12.10.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 10:33:12 -0800 (PST)
Date: Thu, 12 Jan 2023 18:33:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 6/8] virtio-mem: Fail if a memory backend with
 "prealloc=on" is specified
Message-ID: <Y8BSZugafCL1Sryr@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112164403.105085-7-david@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* David Hildenbrand (david@redhat.com) wrote:
> "prealloc=on" for the memory backend does not work as expected, as
> virtio-mem will simply discard all preallocated memory immediately again.
> In the best case, it's an expensive NOP. In the worst case, it's an
> unexpected allocation error.
> 
> Instead, "prealloc=on" should be specified for the virtio-mem device only,
> such that virtio-mem will try preallocating memory before plugging
> memory dynamically to the guest. Fail if such a memory backend is
> provided.
> 
> Tested-by: Michal Privoznik <mprivozn@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/virtio/virtio-mem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 1ed1f5a4af..02f7b5469a 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -772,6 +772,12 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>          error_setg(errp, "'%s' property specifies an unsupported memdev",
>                     VIRTIO_MEM_MEMDEV_PROP);
>          return;
> +    } else if (vmem->memdev->prealloc) {
> +        error_setg(errp, "'%s' property specifies a memdev with preallocation"
> +                   " enabled: %s. Instead, specify 'prealloc=on' for the"
> +                   " virtio-mem device. ", VIRTIO_MEM_MEMDEV_PROP,
> +                   object_get_canonical_path_component(OBJECT(vmem->memdev)));
> +        return;
>      }
>  
>      if ((nb_numa_nodes && vmem->node >= nb_numa_nodes) ||
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


