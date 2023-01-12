Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36EB667F8F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 20:46:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG3V4-0001CR-Vq; Thu, 12 Jan 2023 14:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG3V3-0001CH-2G
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:44:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG3V0-0004AA-T9
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673552669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oXxO2zXTJuxdhyXlVMH7akQoYmBIK7F/VsKF5H5QcUU=;
 b=YY4SxTKdLSdXEfizzrYB9/b/XaQOawT8+HPPU+9i/+fQtPOB3/Aeztr7Xhj5UOXJzhrP2F
 KgAwuvH+hFDDEkFdwF5bcazWETWQyYp8DF75isQuHKoTFGdSjsZ8dOIQpg7MEV21OTQmDo
 JnYIMhCT0kp9RDkWovGv4jZZ9pLXVWs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-492-jVPEclhxOc2ygrg2eg1jlg-1; Thu, 12 Jan 2023 14:44:28 -0500
X-MC-Unique: jVPEclhxOc2ygrg2eg1jlg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i2-20020adfaac2000000b002bc40f98167so3016477wrc.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 11:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXxO2zXTJuxdhyXlVMH7akQoYmBIK7F/VsKF5H5QcUU=;
 b=IIMUZDkS1qcVc3Eu7ljb5KdXBec8hAjzcFYYcqnoILozB78HJJxR4dYPLZyV1xPdmf
 QwwOOIc4ewyhASkIj85YB5QO0qnQy0m2zvzWRioBCDgPMtsGIKkZLMUSj1MOTJqIXbGL
 hB7BQT8qum31k/lYxbCwsi+svMJrxYnK49j8KtJ5jbLeniQhcFGk+JURSgaVn4juaJ/a
 WuXYvDDHKErPd4rL0Ul4MbWjLD/yHQ2fa7LDDnu1SSfy9y6xbm9NmCC7FkSsxUap0uik
 ux9J28/7NcWYp/OxDLS7oCeRTNx7FOPpc2LoSAb61Phd6QdbdAAgl4wYq2acEcDpa+/v
 YyaQ==
X-Gm-Message-State: AFqh2ko3MD9IVFRzeKYPRNC8GwuoynKK4IgydsyHGeTHVgjSTqZyl61v
 E5JcBfcqaCMZ55Gv/3juh5ll7WrUSg/YsCoE2aXIjhXXUg67xj8IgMtjbFMfA8n8sS+oPVGnPYN
 nasx0at3wZdqbu7c=
X-Received: by 2002:a05:600c:4da2:b0:3d2:39dc:f50e with SMTP id
 v34-20020a05600c4da200b003d239dcf50emr55810529wmp.7.1673552667084; 
 Thu, 12 Jan 2023 11:44:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvRIkDnF7npWitvuEqU22d6vSOTKZ68Uphoc4x/YXv4YzXxkE+nIqS98VfN8ycPB7WH57tA4g==
X-Received: by 2002:a05:600c:4da2:b0:3d2:39dc:f50e with SMTP id
 v34-20020a05600c4da200b003d239dcf50emr55810516wmp.7.1673552666868; 
 Thu, 12 Jan 2023 11:44:26 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003c5571c27a1sm27449445wmq.32.2023.01.12.11.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 11:44:26 -0800 (PST)
Date: Thu, 12 Jan 2023 19:44:24 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 7/8] virtio-mem: Migrate immutable properties early
Message-ID: <Y8BjGPAuJPDqjFTD@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-8-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112164403.105085-8-david@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> The bitmap and the size are immutable while migration is active: see
> virtio_mem_is_busy(). We can migrate this information early, before
> migrating any actual RAM content. Further, all information we need for
> sanity checks is immutable as well.
> 
> Having this information in place early will, for example, allow for
> properly preallocating memory before touching these memory locations
> during RAM migration: this way, we can make sure that all memory was
> actually preallocated and that any user errors (e.g., insufficient
> hugetlb pages) can be handled gracefully.
> 
> In contrast, usable_region_size and requested_size can theoretically
> still be modified on the source while the VM is running. Keep migrating
> these properties the usual, late, way.
> 
> Use a new device property to keep behavior of compat machines
> unmodified.

Can you get me a migration file from this? I want to try and understand
what happens when you have the vmstate_register together with the ->vmsd -
I'm not quite sure what ends up in the output.  Preferably for a VM with
two virtio-mem's.

Dave


> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/machine.c              |  4 ++-
>  hw/virtio/virtio-mem.c         | 51 ++++++++++++++++++++++++++++++++--
>  include/hw/virtio/virtio-mem.h |  8 ++++++
>  3 files changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 616f3a207c..29b57f6448 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -41,7 +41,9 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "qom/object_interfaces.h"
>  
> -GlobalProperty hw_compat_7_2[] = {};
> +GlobalProperty hw_compat_7_2[] = {
> +    { "virtio-mem", "x-early-migration", "false" },
> +};
>  const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
>  
>  GlobalProperty hw_compat_7_1[] = {
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 02f7b5469a..51666baa01 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -31,6 +31,8 @@
>  #include CONFIG_DEVICES
>  #include "trace.h"
>  
> +static const VMStateDescription vmstate_virtio_mem_device_early;
> +
>  /*
>   * We only had legacy x86 guests that did not support
>   * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE. Other targets don't have legacy guests.
> @@ -878,6 +880,10 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>  
>      host_memory_backend_set_mapped(vmem->memdev, true);
>      vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
> +    if (vmem->early_migration) {
> +        vmstate_register(VMSTATE_IF(vmem), VMSTATE_INSTANCE_ID_ANY,
> +                         &vmstate_virtio_mem_device_early, vmem);
> +    }
>      qemu_register_reset(virtio_mem_system_reset, vmem);
>  
>      /*
> @@ -899,6 +905,10 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
>       */
>      memory_region_set_ram_discard_manager(&vmem->memdev->mr, NULL);
>      qemu_unregister_reset(virtio_mem_system_reset, vmem);
> +    if (vmem->early_migration) {
> +        vmstate_unregister(VMSTATE_IF(vmem), &vmstate_virtio_mem_device_early,
> +                           vmem);
> +    }
>      vmstate_unregister_ram(&vmem->memdev->mr, DEVICE(vmem));
>      host_memory_backend_set_mapped(vmem->memdev, false);
>      virtio_del_queue(vdev, 0);
> @@ -1015,18 +1025,53 @@ static const VMStateDescription vmstate_virtio_mem_sanity_checks = {
>      },
>  };
>  
> +static bool virtio_mem_vmstate_field_exists(void *opaque, int version_id)
> +{
> +    const VirtIOMEM *vmem = VIRTIO_MEM(opaque);
> +
> +    /* With early migration, these fields were already migrated. */
> +    return !vmem->early_migration;
> +}
> +
>  static const VMStateDescription vmstate_virtio_mem_device = {
>      .name = "virtio-mem-device",
>      .minimum_version_id = 1,
>      .version_id = 1,
>      .priority = MIG_PRI_VIRTIO_MEM,
>      .post_load = virtio_mem_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_WITH_TMP_TEST(VirtIOMEM, virtio_mem_vmstate_field_exists,
> +                              VirtIOMEMMigSanityChecks,
> +                              vmstate_virtio_mem_sanity_checks),
> +        VMSTATE_UINT64(usable_region_size, VirtIOMEM),
> +        VMSTATE_UINT64_TEST(size, VirtIOMEM, virtio_mem_vmstate_field_exists),
> +        VMSTATE_UINT64(requested_size, VirtIOMEM),
> +        VMSTATE_BITMAP_TEST(bitmap, VirtIOMEM, virtio_mem_vmstate_field_exists,
> +                            0, bitmap_size),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +/*
> + * Transfer properties that are immutable while migration is active early,
> + * such that we have have this information around before migrating any RAM
> + * content.
> + *
> + * Note that virtio_mem_is_busy() makes sure these properties can no longer
> + * change on the migration source until migration completed.
> + *
> + * With QEMU compat machines, we transmit these properties later, via
> + * vmstate_virtio_mem_device instead -- see virtio_mem_vmstate_field_exists().
> + */
> +static const VMStateDescription vmstate_virtio_mem_device_early = {
> +    .name = "virtio-mem-device-early",
> +    .minimum_version_id = 1,
> +    .version_id = 1,
> +    .immutable = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_WITH_TMP(VirtIOMEM, VirtIOMEMMigSanityChecks,
>                           vmstate_virtio_mem_sanity_checks),
> -        VMSTATE_UINT64(usable_region_size, VirtIOMEM),
>          VMSTATE_UINT64(size, VirtIOMEM),
> -        VMSTATE_UINT64(requested_size, VirtIOMEM),
>          VMSTATE_BITMAP(bitmap, VirtIOMEM, 0, bitmap_size),
>          VMSTATE_END_OF_LIST()
>      },
> @@ -1211,6 +1256,8 @@ static Property virtio_mem_properties[] = {
>      DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
>                              unplugged_inaccessible, ON_OFF_AUTO_AUTO),
>  #endif
> +    DEFINE_PROP_BOOL(VIRTIO_MEM_EARLY_MIGRATION_PROP, VirtIOMEM,
> +                     early_migration, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
> index 7745cfc1a3..f15e561785 100644
> --- a/include/hw/virtio/virtio-mem.h
> +++ b/include/hw/virtio/virtio-mem.h
> @@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(VirtIOMEM, VirtIOMEMClass,
>  #define VIRTIO_MEM_BLOCK_SIZE_PROP "block-size"
>  #define VIRTIO_MEM_ADDR_PROP "memaddr"
>  #define VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP "unplugged-inaccessible"
> +#define VIRTIO_MEM_EARLY_MIGRATION_PROP "x-early-migration"
>  #define VIRTIO_MEM_PREALLOC_PROP "prealloc"
>  
>  struct VirtIOMEM {
> @@ -74,6 +75,13 @@ struct VirtIOMEM {
>      /* whether to prealloc memory when plugging new blocks */
>      bool prealloc;
>  
> +    /*
> +     * Whether we migrate properties that are immutable while migration is
> +     * active early, before state of other devices and especially, before
> +     * migrating any RAM content.
> +     */
> +    bool early_migration;
> +
>      /* notifiers to notify when "size" changes */
>      NotifierList size_change_notifiers;
>  
> -- 
> 2.39.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


