Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9364B9F2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:40:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58Jz-0003vh-AK; Tue, 13 Dec 2022 11:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p58Jw-0003t9-VB
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:39:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p58Jv-0004u1-0R
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:39:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670949594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKBI+enJT/1uStqaJaqG+8gaNPAPiF5FXnYZ9OeRwkQ=;
 b=Ul+sqtwslnDfBNAcjlU8el6iNsS8CECALi1z+Mm0c2Jj+DR8tPlwfFqDPAt3WI36GZi8XA
 yoiNAxyNAsTezvp63lDB0KIRxqMj0SCKX5UhWABp9ajFmYICnEBLSJm414zkcpHarm9S0Y
 1E/RHqbnnW7psoWnQ3TtMhoia1DVe2M=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-rQx4H48yNGGEUKjxiFpR-g-1; Tue, 13 Dec 2022 11:39:52 -0500
X-MC-Unique: rQx4H48yNGGEUKjxiFpR-g-1
Received: by mail-vs1-f70.google.com with SMTP id
 k30-20020a67ef5e000000b003b139171497so4231072vsr.9
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GKBI+enJT/1uStqaJaqG+8gaNPAPiF5FXnYZ9OeRwkQ=;
 b=csvPbH4iDAmQiDku/q3NmIYuX3NH8qJfFl351yTxN656WlOhCl4thUwdxBIVGWYOZJ
 tMEuz2W4p8HFEu6Z5HtM2UorwyAJBN52N5qPTiRXB3PLI4W2RCTXX1CTzgcP29Xubwr3
 Yr7bqIGYKCUktARU/ySm1SpDAM/oUZ3qAwj0tBaaEFlaGX1kDWlkHx9AoC/FINAGi/zw
 svUFYKk73/dyHqrEEsJqXL3rl4TeS7hgW/OmhZv5UjBIqUEjnSs4ZQ0fwR4Nt61yFbCd
 LHSSETX3xxdoZUi9XH3wyYOh9Ry/1m6KEPndp8FN6DKUgPolMmquZ5vcnz2Jnz5hGL9F
 gxEw==
X-Gm-Message-State: ANoB5pnOBuLNX5cgZS7aWIscsCHcBoc2E9iX1gKERzfOXMgx1XoNHnsT
 nIhfr/kPXHWpuGWyM502bWPqf0AdJh5qQpde+NWzFXZTzqjuPu3wKWxxsP0tqGoVvFho8zhYyvJ
 A600Hc4KyyDf46Wc=
X-Received: by 2002:a05:6102:3e0e:b0:3b3:7406:c1e with SMTP id
 j14-20020a0561023e0e00b003b374060c1emr5240911vsv.6.1670949591675; 
 Tue, 13 Dec 2022 08:39:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4m2rcUOIa7ZFsK2JIsooEPDKbKH7WJu7XmGA/xfDvfyb5BrwNWfBRgFGRklCsijdiLUdLrcw==
X-Received: by 2002:a05:6102:3e0e:b0:3b3:7406:c1e with SMTP id
 j14-20020a0561023e0e00b003b374060c1emr5240894vsv.6.1670949591337; 
 Tue, 13 Dec 2022 08:39:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05620a0e9000b006bbf85cad0fsm3779998qkm.20.2022.12.13.08.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 08:39:51 -0800 (PST)
Message-ID: <9fb35cf6-53bf-1309-c27e-de3bece7fbe1@redhat.com>
Date: Tue, 13 Dec 2022 17:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 14/24] vfio-user: get and set IRQs
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <5532e8b1721cdf68d8932c747dc6b5f42738e139.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <5532e8b1721cdf68d8932c747dc6b5f42738e139.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
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
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   hw/vfio/pci.c           |   7 ++-
>   hw/vfio/user-protocol.h |  25 +++++++++
>   hw/vfio/user.c          | 135 ++++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 166 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 7abe44e..be39a4e 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -713,7 +713,8 @@ retry:
>       ret = vfio_enable_vectors(vdev, false);
>       if (ret) {
>           if (ret < 0) {
> -            error_report("vfio: Error: Failed to setup MSI fds: %m");
> +            error_report("vfio: Error: Failed to setup MSI fds: %s",
> +                         strerror(-ret));

This change belongs to another patch.

>           } else {
>               error_report("vfio: Error: Failed to enable %d "
>                            "MSI vectors, retry with %d", vdev->nr_vectors, ret);
> @@ -2712,6 +2713,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
>       irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
>   
>       ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
> +
>       if (ret) {
>           /* This can fail for an old kernel or legacy PCI dev */
>           trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
> @@ -3593,6 +3595,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>           goto out_teardown;
>       }
>   
> +    vfio_register_err_notifier(vdev);
> +    vfio_register_req_notifier(vdev);
> +
>       return;
>   
>   out_teardown:
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index 124340c..31704cf 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -141,6 +141,31 @@ typedef struct {
>   } VFIOUserRegionInfo;
>   
>   /*
> + * VFIO_USER_DEVICE_GET_IRQ_INFO
> + * imported from struct vfio_irq_info
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint32_t index;
> +    uint32_t count;
> +} VFIOUserIRQInfo;
> +
> +/*
> + * VFIO_USER_DEVICE_SET_IRQS
> + * imported from struct vfio_irq_set
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint32_t index;
> +    uint32_t start;
> +    uint32_t count;
> +} VFIOUserIRQSet;
> +
> +/*
>    * VFIO_USER_REGION_READ
>    * VFIO_USER_REGION_WRITE
>    */
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 1453bb5..815385b 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -1164,6 +1164,117 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
>       return 0;
>   }
>   
> +static int vfio_user_get_irq_info(VFIOProxy *proxy,
> +                                  struct vfio_irq_info *info)
> +{
> +    VFIOUserIRQInfo msg;
> +
> +    memset(&msg, 0, sizeof(msg));
> +    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_IRQ_INFO,
> +                          sizeof(msg), 0);
> +    msg.argsz = info->argsz;
> +    msg.index = info->index;
> +
> +    vfio_user_send_wait(proxy, &msg.hdr, NULL, 0, false);
> +    if (msg.hdr.flags & VFIO_USER_ERROR) {
> +        return -msg.hdr.error_reply;
> +    }
> +
> +    memcpy(info, &msg.argsz, sizeof(*info));
> +    return 0;
> +}
> +
> +static int irq_howmany(int *fdp, uint32_t cur, uint32_t max)

intriguing routine. See comment below.

> +{
> +    int n = 0;
> +
> +    if (fdp[cur] != -1) {
> +        do {
> +            n++;
> +        } while (n < max && fdp[cur + n] != -1);
> +    } else {
> +        do {
> +            n++;
> +        } while (n < max && fdp[cur + n] == -1);
> +    }
> +
> +    return n;
> +}
> +
> +static int vfio_user_set_irqs(VFIOProxy *proxy, struct vfio_irq_set *irq)
> +{
> +    g_autofree VFIOUserIRQSet *msgp = NULL;
> +    uint32_t size, nfds, send_fds, sent_fds, max;
> +
> +    if (irq->argsz < sizeof(*irq)) {
> +        error_printf("vfio_user_set_irqs argsz too small\n");
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * Handle simple case
> +     */
> +    if ((irq->flags & VFIO_IRQ_SET_DATA_EVENTFD) == 0) {
> +        size = sizeof(VFIOUserHdr) + irq->argsz;
> +        msgp = g_malloc0(size);
> +
> +        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS, size, 0);
> +        msgp->argsz = irq->argsz;
> +        msgp->flags = irq->flags;
> +        msgp->index = irq->index;
> +        msgp->start = irq->start;
> +        msgp->count = irq->count;
> +
> +        vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
> +        if (msgp->hdr.flags & VFIO_USER_ERROR) {
> +            return -msgp->hdr.error_reply;
> +        }
> +
> +        return 0;
> +    }
> +
> +    /*
> +     * Calculate the number of FDs to send
> +     * and adjust argsz
> +     */
> +    nfds = (irq->argsz - sizeof(*irq)) / sizeof(int);
> +    irq->argsz = sizeof(*irq);
> +    msgp = g_malloc0(sizeof(*msgp));
> +    /*
> +     * Send in chunks if over max_send_fds
> +     */
> +    for (sent_fds = 0; nfds > sent_fds; sent_fds += send_fds) {
> +        VFIOUserFDs *arg_fds, loop_fds;
> +
> +        /* must send all valid FDs or all invalid FDs in single msg */

why is that ?

> +        max = nfds - sent_fds;
> +        if (max > proxy->max_send_fds) {
> +            max = proxy->max_send_fds;
> +        }
> +        send_fds = irq_howmany((int *)irq->data, sent_fds, max);

sent_fds can never be -1 but irq_howmany() is taking into account this
value. Why ?

> +
> +        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS,
> +                              sizeof(*msgp), 0);
> +        msgp->argsz = irq->argsz;
> +        msgp->flags = irq->flags;
> +        msgp->index = irq->index;
> +        msgp->start = irq->start + sent_fds;
> +        msgp->count = send_fds;
> +
> +        loop_fds.send_fds = send_fds;
> +        loop_fds.recv_fds = 0;
> +        loop_fds.fds = (int *)irq->data + sent_fds;
> +        arg_fds = loop_fds.fds[0] != -1 ? &loop_fds : NULL;
> +
> +        vfio_user_send_wait(proxy, &msgp->hdr, arg_fds, 0, false);
> +        if (msgp->hdr.flags & VFIO_USER_ERROR) {
> +            return -msgp->hdr.error_reply;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>   static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
>                                    uint32_t count, void *data)
>   {
> @@ -1277,6 +1388,28 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
>       return 0;
>   }
>   
> +static int vfio_user_io_get_irq_info(VFIODevice *vbasedev,
> +                                     struct vfio_irq_info *irq)
> +{
> +    int ret;
> +
> +    ret = vfio_user_get_irq_info(vbasedev->proxy, irq);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    if (irq->index > vbasedev->num_irqs) {
> +        return -EINVAL;
> +    }
> +    return 0;
> +}
> +
> +static int vfio_user_io_set_irqs(VFIODevice *vbasedev,
> +                                 struct vfio_irq_set *irqs)
> +{
> +    return vfio_user_set_irqs(vbasedev->proxy, irqs);
> +}
> +
>   static int vfio_user_io_region_read(VFIODevice *vbasedev, uint8_t index,
>                                       off_t off, uint32_t size, void *data)
>   {
> @@ -1294,6 +1427,8 @@ static int vfio_user_io_region_write(VFIODevice *vbasedev, uint8_t index,
>   VFIODevIO vfio_dev_io_sock = {
>       .get_info = vfio_user_io_get_info,
>       .get_region_info = vfio_user_io_get_region_info,
> +    .get_irq_info = vfio_user_io_get_irq_info,
> +    .set_irqs = vfio_user_io_set_irqs,
>       .region_read = vfio_user_io_region_read,
>       .region_write = vfio_user_io_region_write,
>   };


