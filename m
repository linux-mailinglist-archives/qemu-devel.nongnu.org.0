Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF62628E00
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:10:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouirJ-0004k5-OB; Mon, 14 Nov 2022 18:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ouihg-0001B0-Ml
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:17:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ouQuV-00023P-0K
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 23:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668399445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9vqAMp0DUmLPn4XVVL19O4WprDpgMruLTi+YgrCdbwI=;
 b=Sk/qYQWZ3rEvH33AkTPLVDzLiznVNUhuK/WQcgrrHXwUKmeZ4PzxGvSiD5RTO3jb/0lN+6
 HDsRe56KR2F6FFZbqCrFP1LFy8sP8VlY8urogp4iPw+OPsLOhh+FpPGyFjJATGXX8UOKD/
 vAVNZKoL5OZLH27/Bsv9IZSHndhuUR8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-MGhbPLnhMKWg06utb6PzVQ-1; Sun, 13 Nov 2022 23:17:21 -0500
X-MC-Unique: MGhbPLnhMKWg06utb6PzVQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 a22-20020a0568300b9600b0065c0cef3662so5688846otv.14
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 20:17:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9vqAMp0DUmLPn4XVVL19O4WprDpgMruLTi+YgrCdbwI=;
 b=s/6PlHHycuHYsXRNIHgRfOt/TGVe8ruqggNojqOnw3ZaNG6t4qKBRvlERdfb1Q+PF4
 Q3ETElT6PVnJBhfzAgcoAdzXzshNf+0GqvKEHm8HFPOwCzYVUbwU9WACAIxPONAWePOz
 2G53m1+VwTJQ/jPR7ZREto1XNhyF7ZBeV8RzBLiOv1z2xaIIeod06sV5EHPUF1u3j1FA
 EIVAsGUdYxZQNlCQtUAAqD0fmfQIQuyZ2N2J9fMWxM6i4jlPM/a+PXc5LB337biBNY4w
 U4FDmpvKVnfl8nn2p32TNL7TVIbvNEaFub9QRHLCl95DNT5M8NEZ2tKwImwO2qvFI96f
 8NLg==
X-Gm-Message-State: ANoB5pk0R15PuJr2LH5lmWwIt6C7tW/tNS/rMscnDlIPVn2vXJll9aRA
 dcK5Yn/4mV5KjRAYqM5kqnmIBDKvbd3uGGqiHORQuQIbylgBANRDanxz/53rIXz9mFvLR/HlS9J
 dUdMOGBQrCbJH3G1avoHWD2439KQVKLU=
X-Received: by 2002:a05:6808:22a1:b0:359:f5eb:82ec with SMTP id
 bo33-20020a05680822a100b00359f5eb82ecmr4874797oib.280.1668399440306; 
 Sun, 13 Nov 2022 20:17:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7yMqUL9qZWqeJENZ9uTSuueNF65km5NvgcAUceTkHv3wuW3x/pJLkwLqfPBHczj6/WDTs2A1k7kjwKsmFWsUs=
X-Received: by 2002:a05:6808:22a1:b0:359:f5eb:82ec with SMTP id
 bo33-20020a05680822a100b00359f5eb82ecmr4874791oib.280.1668399440107; Sun, 13
 Nov 2022 20:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20221112144013.1349-1-longpeng2@huawei.com>
 <20221112144013.1349-6-longpeng2@huawei.com>
In-Reply-To: <20221112144013.1349-6-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Nov 2022 12:17:08 +0800
Message-ID: <CACGkMEtMKfO5XX=CAuTJk-tKBRMKT0pr0nZB=6kCChoN2NTKSg@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] docs: Add generic vhost-vdpa device documentation
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com, 
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org, 
 xiehong@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Sat, Nov 12, 2022 at 10:40 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  .../devices/vhost-vdpa-generic-device.rst     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
>
> diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst b/docs/system/devices/vhost-vdpa-generic-device.rst
> new file mode 100644
> index 0000000000..d6db9af755
> --- /dev/null
> +++ b/docs/system/devices/vhost-vdpa-generic-device.rst
> @@ -0,0 +1,46 @@
> +
> +=========================
> +vhost-vDPA generic device
> +=========================
> +
> +This document explains the usage of the vhost-vDPA generic device.
> +
> +Description
> +-----------
> +
> +vDPA(virtio data path acceleration) device is a device that uses a datapath
> +which complies with the virtio specifications with vendor specific control
> +path.
> +
> +QEMU provides two types of vhost-vDPA devices to enable the vDPA device, one
> +is type sensitive which means QEMU needs to know the actual device type
> +(e.g. net, blk, scsi) and another is called "vhost-vDPA generic device" which
> +is type insensitive.
> +
> +The vhost-vDPA generic device builds on the vhost-vdpa subsystem and virtio
> +subsystem. It is quite small, but it can support any type of virtio device.
> +
> +Examples
> +--------
> +
> +Prepare the vhost-vDPA backends first:

Nit: here we'd better first say, it needs some vendor specific steps
to provision vDPA and bind it to vhost-vDPA driver. Then we can see
that in under dev directory.

Thanks

> +
> +::
> +  host# ls -l /dev/vhost-vdpa-*
> +  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
> +
> +Start QEMU with virtio-mmio bus:
> +
> +::
> +  host# qemu-system                                                  \
> +      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
> +      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
> +      ...
> +
> +Start QEMU with virtio-pci bus:
> +
> +::
> +  host# qemu-system                                                  \
> +      -M pc -m 512 -smp 2                                            \
> +      -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0       \
> +      ...
> --
> 2.23.0
>


