Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462223C6921
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:17:29 +0200 (CEST)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m39rM-0007Iz-C7
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m39qL-0005R0-Ei
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m39qJ-0000nE-Q3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626149782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iaU0V7Exdo3haIDFuAJ7bOaIEGMNiGQYhDqu9RwFDuc=;
 b=B8lwpvclHE6iDq9pUunM7DEB2bQudl+9L2vX8E7VLrK8N+x2QqantJ9rs11afchA30ao1g
 wkNZWbZkLpFZyivS+AsMM0poNY9iCNkqnncKw8A/sXMafSnNbPZWDy0pj+5IJWLu21UBJ4
 fYtvUZS6p6Aj6uGETeMpweyBdhVU59s=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-_sLjC46XNY-s4muVh7Q52A-1; Tue, 13 Jul 2021 00:16:21 -0400
X-MC-Unique: _sLjC46XNY-s4muVh7Q52A-1
Received: by mail-pj1-f70.google.com with SMTP id
 t5-20020a17090a4485b029016f7fcb8a3dso1201578pjg.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 21:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iaU0V7Exdo3haIDFuAJ7bOaIEGMNiGQYhDqu9RwFDuc=;
 b=XxE57x3RiJcrp2exHiziMk9JD/zPu4r9wbNL/w2nBpeBTl3TwfgMnYf0L03XKatxhL
 136yZcc3UWXk/cZlZjlKf4KKdHHgh0K/ve/+4Bgj6tRnTUAVYbLjL0sX4HmVv6OJ+S7H
 vkXemo9v6n5DDHp2532Uwk0GEh6DCelIm0XVOu3tnfpyq+0TlqE5dNZMhTF9FpAHgo1Z
 KuP8+dtpTaunSaD/PwuycIgv41MADUr08DrCivKORCu9QnxTS8g9GaFEI3J+eYTxI7af
 6chxyIHOcUytlxAFcP93gGBLgjhWwUvmtJtYuh5ndg+obo9oXVLXOb82oIlTE/2nf3K9
 NGiQ==
X-Gm-Message-State: AOAM531rvzSvtSFcvsKvDdDYLtM4V1m2kXPPKVp1tIDe1Z6gf5bkQnwC
 1/F75CE61bfQ4zlj92o+7Y3780lJA2bjUnU12KYSwGm4xlGlfvlz4EFn8Pmf7hgGnBZXXOSomob
 KLfDeGaZ98szXE8Y=
X-Received: by 2002:a05:6a00:a1e:b029:303:56b5:414b with SMTP id
 p30-20020a056a000a1eb029030356b5414bmr2634372pfh.48.1626149780584; 
 Mon, 12 Jul 2021 21:16:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVu7z9x4RGpAk/6E4d/UNf4UfiERJAWAYOLHFkNjxSltsBDdg4jPunDKNyD3rLKsFsBIOkrw==
X-Received: by 2002:a05:6a00:a1e:b029:303:56b5:414b with SMTP id
 p30-20020a056a000a1eb029030356b5414bmr2634345pfh.48.1626149780223; 
 Mon, 12 Jul 2021 21:16:20 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u24sm17899045pfm.200.2021.07.12.21.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 21:16:19 -0700 (PDT)
Subject: Re: [PATCH RESEND v2 3/3] virtio-pci/hmp: implement device specific
 hmp interface
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org
References: <20210712235812.19725-1-dongli.zhang@oracle.com>
 <20210712235812.19725-4-dongli.zhang@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3dece29e-7705-475c-f5d8-387c31f113fe@redhat.com>
Date: Tue, 13 Jul 2021 12:16:14 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712235812.19725-4-dongli.zhang@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/13 ÉÏÎç7:58, Dongli Zhang Ð´µÀ:
> This patch is to implement the device specific interface to dump the
> mapping between virtio queues and vectors.
>
> (qemu) info msix -d /machine/peripheral/vscsi0
> Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
> 0xfee00000 0x00000000 0x00004041 0x00000000
> 0xfee00000 0x00000000 0x00004051 0x00000000
> 0xfee00000 0x00000000 0x00004061 0x00000000
> 0xfee00000 0x00000000 0x00004071 0x00000000
> 0xfee01000 0x00000000 0x000040b1 0x00000000
> 0xfee02000 0x00000000 0x000040c1 0x00000000
> 0xfee03000 0x00000000 0x000040d1 0x00000000
>
> MSI-X PBA
> 0 0 0 0 0 0 0
>
> virtio pci vector info:
> config: 0
> queue 0: 1
> queue 1: 2
> queue 2: 3
> queue 3: 4
> queue 4: 5
> queue 5: 6
>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Joe Jin <joe.jin@oracle.com>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/virtio-pci.c     | 22 ++++++++++++++++++++++
>   hw/virtio/virtio.c         | 10 ++++++++++
>   include/hw/virtio/virtio.h |  2 ++
>   3 files changed, 34 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 433060ac02..2971e8049c 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -38,6 +38,7 @@
>   #include "hw/virtio/virtio-bus.h"
>   #include "qapi/visitor.h"
>   #include "sysemu/replay.h"
> +#include "monitor/monitor.h"
>   
>   #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_present(dev))
>   
> @@ -1587,6 +1588,26 @@ static void virtio_pci_modern_io_region_unmap(VirtIOPCIProxy *proxy,
>                                   &region->mr);
>   }
>   
> +static void virtio_pci_dc_msix_info(Monitor *mon, PCIDevice *dev,
> +                                    Error **errp)
> +{
> +    DeviceState *qdev = DEVICE(dev);
> +    VirtIOPCIProxy *proxy = to_virtio_pci_proxy_fast(qdev);
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    int num = virtio_get_num_queues(vdev);
> +    int i;
> +
> +    monitor_printf(mon, "virtio pci vector info:\n");
> +
> +    monitor_printf(mon, "config: %d\n", virtio_get_config_vector(vdev));
> +
> +    for (i = 0; i < num; i++)
> +        monitor_printf(mon, "queue %d: %u\n",
> +                       i, virtio_get_vector(vdev, i));
> +
> +    monitor_printf(mon, "\n");
> +}
> +
>   static void virtio_pci_pre_plugged(DeviceState *d, Error **errp)
>   {
>       VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
> @@ -2004,6 +2025,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
>       k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
>       k->revision = VIRTIO_PCI_ABI_VERSION;
>       k->class_id = PCI_CLASS_OTHERS;
> +    k->msix_info = virtio_pci_dc_msix_info;
>       device_class_set_parent_realize(dc, virtio_pci_dc_realize,
>                                       &vpciklass->parent_dc_realize);
>       dc->reset = virtio_pci_reset;
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 874377f37a..ea54939e98 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2581,6 +2581,16 @@ void virtio_notify_config(VirtIODevice *vdev)
>       virtio_notify_vector(vdev, vdev->config_vector);
>   }
>   
> +uint16_t virtio_get_vector(VirtIODevice *vdev, int n)
> +{
> +    return vdev->vq[n].vector;
> +}
> +
> +uint16_t virtio_get_config_vector(VirtIODevice *vdev)
> +{
> +    return vdev->config_vector;
> +}
> +
>   static bool virtio_device_endian_needed(void *opaque)
>   {
>       VirtIODevice *vdev = opaque;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 8bab9cfb75..6746227f73 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -268,6 +268,8 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>   void virtio_reset(void *opaque);
>   void virtio_update_irq(VirtIODevice *vdev);
>   int virtio_set_features(VirtIODevice *vdev, uint64_t val);
> +uint16_t virtio_get_vector(VirtIODevice *vdev, int n);
> +uint16_t virtio_get_config_vector(VirtIODevice *vdev);
>   
>   /* Base devices.  */
>   typedef struct VirtIOBlkConf VirtIOBlkConf;


