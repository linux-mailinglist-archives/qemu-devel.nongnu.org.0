Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF1C6F9EA0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 06:16:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvsHL-0002xP-Jd; Mon, 08 May 2023 00:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvsHI-0002xE-0j
 for qemu-devel@nongnu.org; Mon, 08 May 2023 00:15:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pvsHG-0001ik-Hf
 for qemu-devel@nongnu.org; Mon, 08 May 2023 00:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683519309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wq5weGTqO57uwuGcDOxmpc1ZXCHSAe35YmfUtBCuXjk=;
 b=HdPgVXGg8lMl9BBRj+YCV8f8wpg3fI2XemQ5sWBNoTDg8EGlNJtIpFWE2cpJMUHsl/UfNl
 oLCYLI5gtJRIAB6wtfjt0rcsrMbmGoLb4FuuWYnzg8TX2dW/3wLWag+BQ3d3qX6KVjJm8n
 DdvXTb6Y13QTxr65rWoZAdmTsh83kUU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-WvmvC8XZM5K7uTi1ySBJDA-1; Mon, 08 May 2023 00:15:08 -0400
X-MC-Unique: WvmvC8XZM5K7uTi1ySBJDA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f12ff2cee7so2066434e87.1
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 21:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683519306; x=1686111306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wq5weGTqO57uwuGcDOxmpc1ZXCHSAe35YmfUtBCuXjk=;
 b=J94tZZ93jF40D0PDxQ8q4z2x8CPAGXEYQNfc4jY6OMyH0rv2N7/+P63uuK92vH4/3q
 IKHHv8h8o0pQjkuJ7uQw14tatox5AKtzYvcaxoyv9TFhsT74XuwWbzzQHDEEnSTBJZ/y
 /EZoDvRZqy+KxFRd7YuQ43ZJNxDJpV4Jbh/cyJXk5HnQePNT5Vho1AbXBQQXsBDpgcP2
 z/CVWSs3iumXArmPHgpEuSXs2WFEU/fkghDMlD8thTQUkJTDY/vDdwh8w9fIOVvc5Xqr
 rNbCZJZ1c35kz02nYMP+MXzyZFdUyPHohoHo5Ajxx236ktLO92pGPa0xPdnl4gVJ6Grt
 SSmw==
X-Gm-Message-State: AC+VfDwVEFQKgvqKiDoLXa2KmeG8gmypLTC4UsjLrepgI23m5mHjUs74
 +yUUkFT/5kHZKU5BZICkco1jLo6VhArVg5/UOlJrPaY2YjVtr+AV4bJXRD+ZGbURICaZSi3sceY
 iD6ZQ4uhxQjG/Hxsdh0oJv12UMIknZnzjHnpN65v1YUlXKcI=
X-Received: by 2002:ac2:5dd9:0:b0:4f1:2ebf:5370 with SMTP id
 x25-20020ac25dd9000000b004f12ebf5370mr2270117lfq.23.1683519306269; 
 Sun, 07 May 2023 21:15:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ78dDTd6xPDQt6ieqNYyRGPJStkVhf/sApPHQurHjuMje/nnHjFPvCl2qXHHOeRiZn3bRqk8cJ1CgcFgkuH1Hs=
X-Received: by 2002:ac2:5dd9:0:b0:4f1:2ebf:5370 with SMTP id
 x25-20020ac25dd9000000b004f12ebf5370mr2270109lfq.23.1683519305984; Sun, 07
 May 2023 21:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230501020221.188376-1-viktor@daynix.com>
 <20230501020221.188376-3-viktor@daynix.com>
In-Reply-To: <20230501020221.188376-3-viktor@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 8 May 2023 12:14:54 +0800
Message-ID: <CACGkMEugx3oPJ2y1Snf0J3PJTzFGOH5ogM+fWaVgpRk9iYWSBQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] virtio-pci: add handling of ATS and Device-TLB
 enable
To: Viktor Prutyanov <viktor@daynix.com>
Cc: mst@redhat.com, peterx@redhat.com, marcel.apfelbaum@gmail.com, 
 qemu-devel@nongnu.org, yan@daynix.com, yuri.benditovich@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 1, 2023 at 10:02=E2=80=AFAM Viktor Prutyanov <viktor@daynix.com=
> wrote:
>
> Guest may enable or disable PCI ATS and, accordingly, Device-TLB for
> the device. Add a flag and a trigger function to handle Device-TLB
> enable/disable in VirtIO devices and hook it to ATS enable/disable for
> PCI transport.
>
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> ---
>  hw/virtio/virtio-pci.c     | 17 +++++++++++++++++
>  include/hw/virtio/virtio.h |  2 ++
>  2 files changed, 19 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 247325c193..ccd8c4efa1 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -716,6 +716,18 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwa=
ddr addr,
>      }
>  }
>
> +static void virtio_pci_ats_ctrl_trigger(PCIDevice *pci_dev, bool enable)
> +{
> +    VirtIOPCIProxy *proxy =3D VIRTIO_PCI(pci_dev);
> +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> +    VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> +
> +    vdev->device_iotlb_enabled =3D enable;
> +
> +    if (k->toggle_device_iotlb)
> +        k->toggle_device_iotlb(vdev, enable);
> +}
> +
>  static void virtio_write_config(PCIDevice *pci_dev, uint32_t address,
>                                  uint32_t val, int len)
>  {
> @@ -729,6 +741,11 @@ static void virtio_write_config(PCIDevice *pci_dev, =
uint32_t address,
>          pcie_cap_flr_write_config(pci_dev, address, val, len);
>      }
>
> +    if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
> +        pcie_ats_config_write(pci_dev, address, val, len,
> +                virtio_pci_ats_ctrl_trigger);

I think we can directly call virtio_pci_ats_ctrl_trigger instead of
using an indirection like pcie_ats_config_write?

Thanks

> +    }
> +
>      if (range_covers_byte(address, len, PCI_COMMAND)) {
>          if (!(pci_dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
>              virtio_set_disabled(vdev, true);
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index f236e94ca6..83d07bb6b7 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -155,6 +155,7 @@ struct VirtIODevice
>      QLIST_HEAD(, VirtQueue) *vector_queues;
>      QTAILQ_ENTRY(VirtIODevice) next;
>      EventNotifier config_notifier;
> +    bool device_iotlb_enabled;
>  };
>
>  struct VirtioDeviceClass {
> @@ -212,6 +213,7 @@ struct VirtioDeviceClass {
>      const VMStateDescription *vmsd;
>      bool (*primary_unplug_pending)(void *opaque);
>      struct vhost_dev *(*get_vhost)(VirtIODevice *vdev);
> +    void (*toggle_device_iotlb)(VirtIODevice *vdev, bool enable);
>  };
>
>  void virtio_instance_init_common(Object *proxy_obj, void *data,
> --
> 2.35.1
>


