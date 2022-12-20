Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A4651A91
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 07:17:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Vug-0000ps-II; Tue, 20 Dec 2022 01:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7Vue-0000pj-Lg
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 01:15:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7Vuc-0002ua-FX
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 01:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671516937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojwqPWjewrscZkSkF7Yx+NtKohEriqcBZ5YAYzT5hZA=;
 b=BOyhbg0u/I6MYu6F3MH7JpS6I3zX/RGFHkqNyMTyf6wz63WxmhEsIqfdjpRHfgcCR8OSq3
 it5JEOYgrt9Bmnman/VHPMwcnNaE4K7joCN9DrGzlKoTGb0g3T+H9vKdPKPfF3bOrYQOFU
 HCgUSw46lk7oNvLB6cPyK9X0AOuqFug=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-XTaNIjv9NP2mFrxzoBrUHA-1; Tue, 20 Dec 2022 01:15:33 -0500
X-MC-Unique: XTaNIjv9NP2mFrxzoBrUHA-1
Received: by mail-qv1-f71.google.com with SMTP id
 w1-20020a056214012100b004c6ecf32001so6607295qvs.8
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 22:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojwqPWjewrscZkSkF7Yx+NtKohEriqcBZ5YAYzT5hZA=;
 b=wDxMvooOMFcXFr2946w05N1NIA2EqtRMrKtKwchnVeKsfa5yllfjv4OFG12GOXTT4v
 kMJ7AIHmsdLisxCF5QdW6pAKaQ207paZXjeq8BGpSkIdLNkQLeWpUuXr5lH1EMrSvMi4
 nTGM5aNNHe6IToeBGOPaf3+BAXxuYLdzF7FQHfYDuHbJjF907/Er1kFtJk5kBxCuSue5
 MujHeE+9V/P0gh0gTqgVTkmI+Gy6nei5cy31mA+pKYCYFwqIy5TzZGPiunj9dxBOqCI+
 ltCwpf9cmEBpQTea4MRtFei9LaRipZk4StsvKYCQ+Sw2vYKUnKlV8kB2vMAMAH14y1gd
 ykhA==
X-Gm-Message-State: ANoB5pnkYqE5XmybpcRj1aIbLULdD6N+dwxxpP/0eFqmdxL5z4HeY26g
 tEqqLCo2c70Zj4NBYFZGO+rS1BbqX0bfKXorupA3+6A7T26joUf2C9r0KNsgP0kkNP5NnxrkB0k
 5lXNigGmWP6/XFVU=
X-Received: by 2002:a05:622a:248b:b0:3a6:454f:4e3f with SMTP id
 cn11-20020a05622a248b00b003a6454f4e3fmr64254226qtb.7.1671516933083; 
 Mon, 19 Dec 2022 22:15:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ia5pusP69aU5dM3E61plOcBYZi7qawLqBn1mjfk/B0hPuUVIdyv+1m/61L3eHlGJv7J2cIA==
X-Received: by 2002:a05:622a:248b:b0:3a6:454f:4e3f with SMTP id
 cn11-20020a05622a248b00b003a6454f4e3fmr64254208qtb.7.1671516932845; 
 Mon, 19 Dec 2022 22:15:32 -0800 (PST)
Received: from redhat.com ([45.144.113.29]) by smtp.gmail.com with ESMTPSA id
 f13-20020ac8134d000000b0039cc82a319asm7128588qtj.76.2022.12.19.22.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 22:15:32 -0800 (PST)
Date: Tue, 20 Dec 2022 01:15:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: Jason Wang <jasowang@redhat.com>, stefanha@redhat.com,
 sgarzare@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 arei.gonglei@huawei.com, yechuan@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v11 5/5] docs: Add generic vhost-vdpa device documentation
Message-ID: <20221220011432-mutt-send-email-mst@kernel.org>
References: <20221215134944.2809-1-longpeng2@huawei.com>
 <20221215134944.2809-6-longpeng2@huawei.com>
 <CACGkMEt65Nr_M6aTU1NwS3t=S6CaMROt7C+Hb0HqszzO7gJKMw@mail.gmail.com>
 <20221219163711-mutt-send-email-mst@kernel.org>
 <607f5e9e-710f-1436-0fc4-eb32d30e0c3a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <607f5e9e-710f-1436-0fc4-eb32d30e0c3a@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Dec 20, 2022 at 08:02:51AM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> 
> 
> 在 2022/12/20 5:37, Michael S. Tsirkin 写道:
> > On Fri, Dec 16, 2022 at 11:33:49AM +0800, Jason Wang wrote:
> > > On Thu, Dec 15, 2022 at 9:50 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
> > > > 
> > > > From: Longpeng <longpeng2@huawei.com>
> > > > 
> > > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > > ---
> > > >   .../devices/vhost-vdpa-generic-device.rst     | 68 +++++++++++++++++++
> > > >   1 file changed, 68 insertions(+)
> > > >   create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
> > > > 
> > > > diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst b/docs/system/devices/vhost-vdpa-generic-device.rst
> > > > new file mode 100644
> > > > index 0000000000..24c825ef1a
> > > > --- /dev/null
> > > > +++ b/docs/system/devices/vhost-vdpa-generic-device.rst
> > > > @@ -0,0 +1,68 @@
> > > > +
> > > > +=========================
> > > > +vhost-vDPA generic device
> > > > +=========================
> > > > +
> > > > +This document explains the usage of the vhost-vDPA generic device.
> > > > +
> > > > +
> > > > +Description
> > > > +-----------
> > > > +
> > > > +vDPA(virtio data path acceleration) device is a device that uses a datapath
> > > > +which complies with the virtio specifications with vendor specific control
> > > > +path.
> > > > +
> > > > +QEMU provides two types of vhost-vDPA devices to enable the vDPA device, one
> > > > +is type sensitive which means QEMU needs to know the actual device type
> > > > +(e.g. net, blk, scsi) and another is called "vhost-vDPA generic device" which
> > > > +is type insensitive.
> > > > +
> > > > +The vhost-vDPA generic device builds on the vhost-vdpa subsystem and virtio
> > > > +subsystem. It is quite small, but it can support any type of virtio device.
> > > > +
> > > > +
> > > > +Requirements
> > > > +------------
> > > > +Linux 5.18+
> > > > +iproute2/vdpa 5.12.0+
> > > > +
> > > > +
> > > > +Examples
> > > > +--------
> > > > +
> > > > +1. Prepare the vhost-vDPA backends, here is an example using vdpa_sim_blk
> > > > +   device:
> > > > +
> > > > +::
> > > > +  host# modprobe vhost_vdpa
> > > > +  host# modprobe vdpa_sim_blk
> > > 
> > > Nit: it's probably better to add driver binding steps here.
> > > 
> > > > +  host# vdpa dev add mgmtdev vdpasim_blk name blk0
> > > > +  (...you can see the vhost-vDPA device under /dev directory now...)
> > > 
> > > And then the vhost char dev name could be fetch via
> > > 
> > > ls /sys/bus/vdpa/device/blk0/vhost-vdpa*
> > > 
> > > With the above changes.
> > > 
> > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > 
> > > Thanks
> > 
> > 
> > Sounds minor enough, I'll queue, pls fix with a patch on top.
> > 
> OK, thanks. I'll send when I'm free.

Is this going to be in the next couple of weeks? then ok.
We do want this addressed by let's say rc3.

> > > > +  host# ls -l /dev/vhost-vdpa-*
> > > > +  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
> > > > +
> > > > +Note:
> > > > +It needs some vendor-specific steps to provision the vDPA device if you're
> > > > +using real HW devices, such as loading the vendor-specific vDPA driver and
> > > > +binding the device to the driver.
> > > > +
> > > > +
> > > > +2. Start the virtual machine:
> > > > +
> > > > +Start QEMU with virtio-mmio bus:
> > > > +
> > > > +::
> > > > +  host# qemu-system                                                  \
> > > > +      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
> > > > +      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
> > > > +      ...
> > > > +
> > > > +
> > > > +Start QEMU with virtio-pci bus:
> > > > +
> > > > +::
> > > > +  host# qemu-system                                                  \
> > > > +      -M pc -m 512 -smp 2                                            \
> > > > +      -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0       \
> > > > +      ...
> > > > --
> > > > 2.23.0
> > > > 
> > 
> > .


