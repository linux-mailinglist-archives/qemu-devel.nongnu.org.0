Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30DC64B777
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:36:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56NV-0001TO-HC; Tue, 13 Dec 2022 09:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p56NQ-0001Om-2i
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:35:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p56NO-0007nF-CQ
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670942120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r9IZOQL2d4/ka0UQZSdsh962pWs7J5h5hff1ikYeEM8=;
 b=UpLG66AsbsE3j7FXvLPQBqTEeQaszkzwFJMNM6nOemBHfNy38OBt+fJ6ncKS40ytAa2zpm
 eRWOIislcfVSFbcAh6nmrwGHlbmzup5Ix0ger4WqpPhpDaq57324t/BFfeTzABqIVqoqiJ
 NEJ4o2ch4KOuuXCrCwZCyCd4E4F2H/Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-I-4EWZCgOt288uM3tH4Z_g-1; Tue, 13 Dec 2022 09:35:16 -0500
X-MC-Unique: I-4EWZCgOt288uM3tH4Z_g-1
Received: by mail-wm1-f69.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso3102874wml.9
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 06:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9IZOQL2d4/ka0UQZSdsh962pWs7J5h5hff1ikYeEM8=;
 b=8OHL2WPYDFadoZ6L/6syIHS3epW1fOo5UO00HqWTNf2ojPRy/SD1ciWhTs5gGK4oSq
 AagAAwaSaZ6Xgd68aAMwS1jsH/rvPCUKUwNXk72I57lKqVjlBixy1T/n1Dm+Mwx6ZH0I
 MMUy0nkclEzs/xzEcxxSSnQH7L/N3CrXaW+CQ8FOQ2EHggaKlH9yMQqtB+TFeAcQN72I
 IyOIrK1Z76KOsy7NOXRY3mdTWMse66Ryax5iTYzf9cvHUuur9eGj0YAzvrEIfspJjN5k
 D+p8Y7j1sfjVdhu2wyZTn7ERYmyTw4YESVY6pYw3BOOfoTBqJcO3hehqtQ81sbgYQyn8
 qNSQ==
X-Gm-Message-State: ANoB5pllZi3pE40T9wSEbTLLoNVssOLd68R/kdXd7QG6I2HbWHrjdjQ7
 yGbkPdDFv34t75rTCItE7uxsTfciTzcqEY1uLi/V9YAQB9deTkHjVXWR3n7q+ZTOV2cCJLLrMAY
 Jr5tB0fp5ieK66SU=
X-Received: by 2002:a05:600c:4fd1:b0:3cf:a08f:10a5 with SMTP id
 o17-20020a05600c4fd100b003cfa08f10a5mr16385756wmq.31.1670942115808; 
 Tue, 13 Dec 2022 06:35:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4htDcqnZV3TxwPjGa4DUK6p0YK6esWri9pZDVKsRPfmy6owTbx5/b8MoyCi6vALFU01yedNg==
X-Received: by 2002:a05:600c:4fd1:b0:3cf:a08f:10a5 with SMTP id
 o17-20020a05600c4fd100b003cfa08f10a5mr16385745wmq.31.1670942115579; 
 Tue, 13 Dec 2022 06:35:15 -0800 (PST)
Received: from sgarzare-redhat (host-87-11-6-51.retail.telecomitalia.it.
 [87.11.6.51]) by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003cfaae07f68sm14327822wms.17.2022.12.13.06.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 06:35:15 -0800 (PST)
Date: Tue, 13 Dec 2022 15:35:11 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 5/5] docs: Add generic vhost-vdpa device documentation
Message-ID: <20221213143511.awu6ibpavokxrghv@sgarzare-redhat>
References: <20221205084943.2259-1-longpeng2@huawei.com>
 <20221205084943.2259-6-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221205084943.2259-6-longpeng2@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Mon, Dec 05, 2022 at 04:49:43PM +0800, Longpeng(Mike) wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> .../devices/vhost-vdpa-generic-device.rst     | 66 +++++++++++++++++++
> 1 file changed, 66 insertions(+)
> create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
>
>diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst b/docs/system/devices/vhost-vdpa-generic-device.rst
>new file mode 100644
>index 0000000000..7d13359ea1
>--- /dev/null
>+++ b/docs/system/devices/vhost-vdpa-generic-device.rst
>@@ -0,0 +1,66 @@
>+
>+=========================
>+vhost-vDPA generic device
>+=========================
>+
>+This document explains the usage of the vhost-vDPA generic device.
>+
>+Description
>+-----------
>+
>+vDPA(virtio data path acceleration) device is a device that uses a datapath
>+which complies with the virtio specifications with vendor specific control
>+path.
>+
>+QEMU provides two types of vhost-vDPA devices to enable the vDPA device, one
>+is type sensitive which means QEMU needs to know the actual device type
>+(e.g. net, blk, scsi) and another is called "vhost-vDPA generic device" which
>+is type insensitive.
>+
>+The vhost-vDPA generic device builds on the vhost-vdpa subsystem and virtio
>+subsystem. It is quite small, but it can support any type of virtio device.
>+

Maybe we can also add a minimum requirement section (e.g. we needs at 
least Linux v5.18 for VHOST_VDPA_GET_VQS_COUNT)

>+Examples
>+--------
>+
>+1. Please make sure the modules listed bellow are installed:
>+    vhost.ko
>+    vhost_iotlb.ko
>+    vdpa.ko
>+    vhost_vdpa.ko
>+
>+
>+2. Prepare the vhost-vDPA backends, here is an example using vdpa_sim_blk
>+   device:
>+
>+::

Should we add also a `modprobe vhost-vdpa` step?

>+  host# modprobe vdpa_sim_blk
>+  host# vdpa dev add mgmtdev vdpasim_blk name blk0
>+  (...you can see the vhost-vDPA device under /dev directory now...)
>+  host# ls -l /dev/vhost-vdpa-*
>+  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
>+
>+Note:
>+It needs some vendor-specific steps to provision the vDPA device if you're
>+using real HW devices, such as installing the vendor-specific vDPA driver
>+and binding the device to the driver.
>+
>+
>+3. Start the virtual machine:
>+
>+Start QEMU with virtio-mmio bus:
>+
>+::
>+  host# qemu-system                                                  \
>+      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
>+      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
>+      ...
>+
>+
>+Start QEMU with virtio-pci bus:
>+
>+::
>+  host# qemu-system                                                  \
>+      -M pc -m 512 -smp 2                                            \
>+      -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0       \
>+      ...
>-- 
>2.23.0
>


