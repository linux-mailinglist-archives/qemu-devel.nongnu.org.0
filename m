Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152F649AA2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:07:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4ehJ-0006Lj-UI; Mon, 12 Dec 2022 04:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p4egx-0006J5-Ez
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p4egt-0007WA-TE
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670835698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sv+1L92Q/2OezajP7dtxgrBnly7suoA6qZxY/zrYjsQ=;
 b=Kjt276FGusoN2A3UFGD71caP+1SHZ83wihAu+HmggoDmVA3V54Sx+fmTZPAGgkB/OgUYp1
 a/5BLi0OwlJuFpYUaAM6DpH3weKAVQOGK+ppbCNMStjhowL9qvxnHF7d9OdAsxTDj3EVdE
 2aJwYr9PipuVm/KV4C5EQgF0zjYGyN0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-Kdlf7PlyNNyhDznGJMPrAQ-1; Mon, 12 Dec 2022 04:01:36 -0500
X-MC-Unique: Kdlf7PlyNNyhDznGJMPrAQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 g3-20020ac84b63000000b003a529c62a92so11084006qts.23
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sv+1L92Q/2OezajP7dtxgrBnly7suoA6qZxY/zrYjsQ=;
 b=qCtrevJB8uBs6bK1yUSDsYWcHD4jzIO8Y+A89aEWLVawX1ODBRcU4kmdLa0o7/vgHa
 n/QAZwxqA7uHvB6TCnEcN6a7HQmDEoGyXKqB16AVabSGFAt7oQqcBw9rQ2Ah+YtDctuU
 ftyxZnZYCzRFhnENTtsukM9q1eKRp3t/Aj+njCIp2qA9mAeoqLSKLzu+HN9acSZqANPD
 NflKoteh3eKpcyJI5seWdK8pUV/ElVN/bL/PQPcK4rI/sM4y2bd5F7hRdQsNu8J2AEb3
 OWGSA55lJk+Trxzq8TyOjqV90z/agSL7XNVwyrG4u5REbbMMhPv5aRuKNOjUd1PMwUvd
 4rng==
X-Gm-Message-State: ANoB5plHYAos0fuJaxLRbfDWhrxYAyLd4uwVfdlskZ/nGxLcumeOFapJ
 eeASf2h1+TmynVaX3BsYZP1VAa8m3xc9MpwJGE+MkxU0THgABRJLhAaswFG3xfTkkdSiEQJQ41/
 Ktfe4nHai12sH7E4=
X-Received: by 2002:ac8:644:0:b0:3a8:128:82a9 with SMTP id
 e4-20020ac80644000000b003a8012882a9mr18616537qth.5.1670835696239; 
 Mon, 12 Dec 2022 01:01:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5azv4w9mUEQAZxRp9afVJv1xXV1j4mora9SMMrgqirAcXn1BLF7xTAuj5QmHAWS/B2M7UeBw==
X-Received: by 2002:ac8:644:0:b0:3a8:128:82a9 with SMTP id
 e4-20020ac80644000000b003a8012882a9mr18616507qth.5.1670835695911; 
 Mon, 12 Dec 2022 01:01:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 f1-20020ac84981000000b003a7fc70d59csm5496639qtq.41.2022.12.12.01.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:01:35 -0800 (PST)
Message-ID: <78476e9d-0d40-12e8-075c-ec4ac84aab32@redhat.com>
Date: Mon, 12 Dec 2022 10:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 06/24] vfio-user: Define type vfio_user_pci_dev_info
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <957361f0e497e0b95f10a3caf617fe04d9c6fb72.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <957361f0e497e0b95f10a3caf617fe04d9c6fb72.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/9/22 00:13, John Johnson wrote:
> New class for vfio-user with its class and instance
> constructors and destructors, and its pci ops.
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   hw/vfio/Kconfig  | 10 +++++++
>   hw/vfio/common.c |  5 ++++
>   hw/vfio/pci.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/pci.h    |  8 +++++
>   4 files changed, 112 insertions(+)
> 
> diff --git a/hw/vfio/Kconfig b/hw/vfio/Kconfig
> index 7cdba05..301894e 100644
> --- a/hw/vfio/Kconfig
> +++ b/hw/vfio/Kconfig
> @@ -2,6 +2,10 @@ config VFIO
>       bool
>       depends on LINUX
>   
> +config VFIO_USER
> +    bool
> +    depends on VFIO
> +
>   config VFIO_PCI
>       bool
>       default y
> @@ -9,6 +13,12 @@ config VFIO_PCI
>       select EDID
>       depends on LINUX && PCI
>   
> +config VFIO_USER_PCI
> +    bool
> +    default y
> +    select VFIO_USER
> +    depends on VFIO_PCI
> +
>   config VFIO_CCW
>       bool
>       default y
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index c7bf0aa..c589bd9 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1774,6 +1774,11 @@ void vfio_reset_handler(void *opaque)
>       QLIST_FOREACH(group, &vfio_group_list, next) {
>           QLIST_FOREACH(vbasedev, &group->device_list, next) {
>               if (vbasedev->dev->realized && vbasedev->needs_reset) {
> +                if (vbasedev->ops->vfio_hot_reset_multi == NULL) {
> +                    error_printf("%s: No hot reset handler specified\n",
> +                                 vbasedev->name);
> +                    continue;
> +                }

Since needs_reset is false, which is the case for VFIO User,
vfio_hot_reset_multi won't be called. I don't think we care
much about adding this error message. In another patch, may be.

>                   vbasedev->ops->vfio_hot_reset_multi(vbasedev);
>               }
>           }
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 80b03a2..dc19869 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -19,6 +19,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include CONFIG_DEVICES
>   #include <linux/vfio.h>
>   #include <sys/ioctl.h>
>   
> @@ -3421,3 +3422,91 @@ static void register_vfio_pci_dev_type(void)
>   }
>   
>   type_init(register_vfio_pci_dev_type)
> +
> +
> +#ifdef CONFIG_VFIO_USER_PCI

Why not introduce a new file hw/vfio/user.c file ? It would be
cleaner.

> +
> +/*
> + * vfio-user routines.
> + */
> +
> +/*
> + * Emulated devices don't use host hot reset
> + */
> +static void vfio_user_compute_needs_reset(VFIODevice *vbasedev)
> +{
> +    vbasedev->needs_reset = false;
> +}
> +
> +static VFIODeviceOps vfio_user_pci_ops = {
> +    .vfio_compute_needs_reset = vfio_user_compute_needs_reset,
> +    .vfio_eoi = vfio_intx_eoi,
> +    .vfio_get_object = vfio_pci_get_object,
> +    .vfio_save_config = vfio_pci_save_config,
> +    .vfio_load_config = vfio_pci_load_config,
> +};
> +
> +static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
> +    VFIODevice *vbasedev = &vdev->vbasedev;
> +
> +    /*
> +     * TODO: make option parser understand SocketAddress
> +     * and use that instead of having scalar options
> +     * for each socket type.
> +     */
> +    if (!udev->sock_name) {
> +        error_setg(errp, "No socket specified");
> +        error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
> +        return;
> +    }
> +
> +    vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
> +    vbasedev->ops = &vfio_user_pci_ops;
> +    vbasedev->type = VFIO_DEVICE_TYPE_PCI;
> +    vbasedev->dev = DEVICE(vdev);
> +
> +}
> +
> +static void vfio_user_instance_finalize(Object *obj)
> +{
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
> +
> +    vfio_put_device(vdev);
> +}
> +
> +static Property vfio_user_pci_dev_properties[] = {
> +    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),

This looks like a good candidate for using a chardev. It could only
support AF_UNIX to start with if fd passing is the required feature.
But at least, the model would be using a well known backend. I think
vhost has the same kind of constraints.

Thanks,

C.



> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, vfio_user_pci_dev_properties);
> +    dc->desc = "VFIO over socket PCI device assignment";
> +    pdc->realize = vfio_user_pci_realize;
> +}
> +
> +static const TypeInfo vfio_user_pci_dev_info = {
> +    .name = TYPE_VFIO_USER_PCI,
> +    .parent = TYPE_VFIO_PCI_BASE,
> +    .instance_size = sizeof(VFIOUserPCIDevice),
> +    .class_init = vfio_user_pci_dev_class_init,
> +    .instance_init = vfio_instance_init,
> +    .instance_finalize = vfio_user_instance_finalize,
> +};
> +
> +static void register_vfio_user_dev_type(void)
> +{
> +    type_register_static(&vfio_user_pci_dev_info);
> +}
> +
> +type_init(register_vfio_user_dev_type)
> +
> +#endif /* VFIO_USER_PCI */
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 7c5c8ec..27db931 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -189,6 +189,14 @@ struct VFIOKernPCIDevice {
>       VFIOPCIDevice device;
>   };
>   
> +#define TYPE_VFIO_USER_PCI "vfio-user-pci"
> +OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
> +
> +struct VFIOUserPCIDevice {
> +    VFIOPCIDevice device;
> +    char *sock_name;
> +};
> +
>   /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
>   static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
>   {


