Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74778400CD6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 21:46:42 +0200 (CEST)
Received: from localhost ([::1]:47878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMbce-00014h-Uy
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 15:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMbbD-0008Fz-T8
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 15:45:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMbbA-0002wb-D3
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 15:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630784706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zSFnS0gZ3Yb8Q38C60DP3VbvzD7RH0N9zSIGrU6XSrM=;
 b=itkS86SScTv4eBzSWYbPxggw5a7rTU6TmX5Kjlq7QxWrU9oVDDN7eAea0vMJ1LzBmIm/2L
 EZQ3T5ljpCLQFqytYr7t0ET2FPh7vuGehPJ0kA0zHy1jZKw9da4TpHn08P/JIMV/m1jOFV
 bxWuDnBt+yEF9xkNIMwjhXocSuJWOGQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-a8tw_gJqPoqWKgmD858FZQ-1; Sat, 04 Sep 2021 15:45:04 -0400
X-MC-Unique: a8tw_gJqPoqWKgmD858FZQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 m18-20020a170906849200b005c701c9b87cso843840ejx.8
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 12:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zSFnS0gZ3Yb8Q38C60DP3VbvzD7RH0N9zSIGrU6XSrM=;
 b=SBd85CLEs+ynsbLrALibenoDtgYeiW6k8ybxtuL9DLE/0ZqxfV/BWsFNeQ/E1tFHJU
 aqpbODcP5PWFr9cK5PH1vYVYbLYSDpKH+gBxPj3/x58EZhuivceMv9MhBkYzc5xFuLlK
 9uiXFkhtTqL45Tf+oXltNSIpMiSeUBYB84cxIOEFU6GPOtdnjDXq2WCKhTQ4SzkI3rTy
 rhDziqm0IkJFGYanThCdVEHW8jZHSk6R2UmML0Rt07q6G12UuT5DLwc3DJBB1F81u/hA
 kgrMKOzRhvisQyXMBYgBYXOvgfVPZCDu3xtEJFhs31uMJDXl6e44e0msa4FhxDeLYshh
 dPVQ==
X-Gm-Message-State: AOAM530Cyb1kVW9elJ0QeWSum17670BaA3FSqntk7uykhRfQii9du49a
 sgrekGl8zWj/dQO0jguYuIiWkyZ6inbGpbImc5nJoIMhzQzobFYzo6syUEObYYShWgYxzgA9jbo
 845vJJ9fGaIvLmBM=
X-Received: by 2002:a17:907:2083:: with SMTP id
 pv3mr5482439ejb.402.1630784702994; 
 Sat, 04 Sep 2021 12:45:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGsDqioJ3mXFEJjUp1GBaeXLMNit3PEEWCcYrFoiv2D0vUUOldx2q+kKhf/Lc3QHWmBXJCsQ==
X-Received: by 2002:a17:907:2083:: with SMTP id
 pv3mr5482412ejb.402.1630784702667; 
 Sat, 04 Sep 2021 12:45:02 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id q1sm1760069edr.68.2021.09.04.12.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 12:45:01 -0700 (PDT)
Date: Sat, 4 Sep 2021 15:44:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 0/3] virtio: Add vhost-user-i2c device's support
Message-ID: <20210904154310-mutt-send-email-mst@kernel.org>
References: <cover.1625806763.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cover.1625806763.git.viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 10:30:15AM +0530, Viresh Kumar wrote:
> Hello,
> 
> This patchset adds vhost-user-i2c device's support in Qemu. Initially I tried to
> add the backend implementation as well into Qemu, but as I was looking for a
> hypervisor agnostic backend implementation, I decided to keep it outside of
> Qemu. Eventually I implemented it in Rust and it works very well with this
> patchset, and it is under review [1] to be merged in common rust vhost devices
> crate.


So I'm not sure whether it's appropriate to merge this right now.
There are several spec change proposals before the virtio TC
and I did not investigate whether this code reflects the
spec before or after these changes. It seems prudent to wait
until the spec changes are finalized and voted on, in any case.

Pls ping me to merge once that has taken place. Thanks!

> The kernel virtio I2C driver [2] is fully reviewed and is ready to be merged soon.
> 
> V1->V2:
> - Dropped the backend support from qemu and minor cleanups.
> 
> I2C Testing:
> ------------
> 
> I didn't have access to a real hardware where I can play with a I2C
> client device (like RTC, eeprom, etc) to verify the working of the
> backend daemon, so I decided to test it on my x86 box itself with
> hierarchy of two ARM64 guests.
> 
> The first ARM64 guest was passed "-device ds1338,address=0x20" option,
> so it could emulate a ds1338 RTC device, which connects to an I2C bus.
> Once the guest came up, ds1338 device instance was created within the
> guest kernel by doing:
> 
>   echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device
> 
> [
>   Note that this may end up binding the ds1338 device to its driver,
>   which won't let our i2c daemon talk to the device. For that we need to
>   manually unbind the device from the driver:
> 
>   echo 0-0020 > /sys/bus/i2c/devices/0-0020/driver/unbind
> ]
> 
> After this is done, you will get /dev/rtc1. This is the device we wanted
> to emulate, which will be accessed by the vhost-user-i2c backend daemon
> via the /dev/i2c-0 file present in the guest VM.
> 
> At this point we need to start the backend daemon and give it a
> socket-path to talk to from qemu (you can pass -v to it to get more
> detailed messages):
> 
>   vhost-user-i2c --socket-path=vi2c.sock -l 0:32
> 
> [ Here, 0:32 is the bus/device mapping, 0 for /dev/i2c-0 and 32 (i.e.
> 0x20) is client address of ds1338 that we used while creating the
> device. ]
> 
> Now we need to start the second level ARM64 guest (from within the first
> guest) to get the i2c-virtio.c Linux driver up. The second level guest
> is passed the following options to connect to the same socket:
> 
>   -chardev socket,path=vi2c.sock0,id=vi2c \
>   -device vhost-user-i2c-pci,chardev=vi2c,id=i2c
> 
> Once the second level guest boots up, we will see the i2c-virtio bus at
> /sys/bus/i2c/devices/i2c-X/. From there we can now make it emulate the
> ds1338 device again by doing:
> 
> 
>   echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device
> 
> [ This time we want ds1338's driver to be bound to the device, so it
> should be enabled in the kernel as well. ]
> 
> And we will get /dev/rtc1 device again here in the second level guest.
> Now we can play with the rtc device with help of hwclock utility and we
> can see the following sequence of transfers happening if we try to
> update rtc's time from system time.
> 
> hwclock -w -f /dev/rtc1 (in guest2) ->
>   Reaches i2c-virtio.c (Linux bus driver in guest2) ->
>     transfer over virtio ->
>       Reaches the qemu's vhost-i2c device emulation (running over guest1) ->
>         Reaches the backend daemon vhost-user-i2c started earlier (in guest1) ->
>           ioctl(/dev/i2c-0, I2C_RDWR, ..); (in guest1) ->
>             reaches qemu's hw/rtc/ds1338.c (running over host)
> 
> 
> SMBUS Testing:
> --------------
> 
> I wasn't required to have such a tedious setup for testing out with
> SMBUS devices. I was able to emulate a SMBUS device on my x86 machine
> using i2c-stub driver.
> 
> $ modprobe i2c-stub chip_addr=0x20
> //Boot the arm64 guest now with i2c-virtio driver and then do:
> $ echo al3320a 0x20 > /sys/class/i2c-adapter/i2c-0/new_device
> $ cat /sys/bus/iio/devices/iio:device0/in_illuminance_raw
> 
> That's it.
> 
> I hope I was able to give a clear picture of my test setup here :)
> 
> --
> Viresh
> 
> Viresh Kumar (3):
>   hw/virtio: add boilerplate for vhost-user-i2c device
>   hw/virtio: add vhost-user-i2c-pci boilerplate
>   MAINTAINERS: Add entry for virtio-i2c
> 
>  MAINTAINERS                        |   7 +
>  hw/virtio/Kconfig                  |   5 +
>  hw/virtio/meson.build              |   2 +
>  hw/virtio/vhost-user-i2c-pci.c     |  69 +++++++
>  hw/virtio/vhost-user-i2c.c         | 288 +++++++++++++++++++++++++++++
>  include/hw/virtio/vhost-user-i2c.h |  28 +++
>  6 files changed, 399 insertions(+)
>  create mode 100644 hw/virtio/vhost-user-i2c-pci.c
>  create mode 100644 hw/virtio/vhost-user-i2c.c
>  create mode 100644 include/hw/virtio/vhost-user-i2c.h
> 
> -- 
> 2.31.1.272.g89b43f80a514


