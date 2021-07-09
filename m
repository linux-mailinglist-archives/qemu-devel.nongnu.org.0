Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4D3C1EBC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:03:19 +0200 (CEST)
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ifX-0003QW-2b
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m1icr-0007k6-3T
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:00:33 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m1icm-0001p5-NS
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:00:32 -0400
Received: by mail-pl1-x62e.google.com with SMTP id o4so4400647plg.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DB5neD22LMbT3FyQ0i2q9Pqws8rdfbZPxQxpaGJ9G00=;
 b=TGrVXuMYN+hGx0FdJNbDVbVde5isymVaznPvCiLgYkJJ5kHfNlZSfCj3B20/D38fBb
 4pOZIIQzvp/h9HX0exWp1YSBy75kPE2FaQ53IUpHwhuAvY6wv4ncxqyLhvEhVfZX3s0u
 Tu0mCrN44wrgIF65Sii6zY1wPMpg8w9kmIFIKS28wu4jDWac8ltwewFWULqh20RLWT1i
 mD+1k9xuRiQMm+05ahH/CL0NfYN56PmgU0XFdZy64+Q8eeBHom+MfoBm9vwy/3bJKRYj
 KhaYC6wjGv6YXHg8xA1AaYsiJGzoaPQN8VvvGdMcfzdPZ9g6OzdcRx6Z7WbUBo9pi1Kv
 AhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DB5neD22LMbT3FyQ0i2q9Pqws8rdfbZPxQxpaGJ9G00=;
 b=jx8C6m3Ucewl1iiANIT88Rf7ecVAMc7D1Pqq9DMpq+3PFxEZIJDSiNCq3T2iqCoq66
 RO1skBTKdcI1/l4xHHy9nVPDpW3CmP4M+TqC40O8gzLKvvJg3Xrl0FOZcVL3q7Vdht1w
 ELlaJ3K9G+hoG/M5fDwXbFaipOzvO1iVrzcaREXT/046+WffiBcR2gpDons6bjqZge3x
 //IU2CK3pNZV+OJZZLsJgGySrrBljd1GNEBhbovyClvT/7G5ZaDtjY7bxue8OdUjsciW
 hqhd7xqhWDADzXDisRyaGIFuahQRpN1cxlomuB5fxNAo16BV9mnWmhtZUVaWUbVs3w/g
 o+wA==
X-Gm-Message-State: AOAM531K8pCxgAeQ/C1tKw6iZOsfviMuA+f+gsfYGVSucmrS4vwNAfCr
 FSfr23PFiqaovld1iu8LansWdo8Hf3xFYg==
X-Google-Smtp-Source: ABdhPJyRUFH+HegTry5eZQ76u5Oq4s23U0kUhJhOKe8IAJSVql65RMmlex/JEDMLh02AnOFHzaNU0Q==
X-Received: by 2002:a17:90a:5a4d:: with SMTP id
 m13mr1796230pji.7.1625806825279; 
 Thu, 08 Jul 2021 22:00:25 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id p53sm4663056pfw.108.2021.07.08.22.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 22:00:24 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 0/3] virtio: Add vhost-user-i2c device's support
Date: Fri,  9 Jul 2021 10:30:15 +0530
Message-Id: <cover.1625806763.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Bill Mills <bill.mills@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.com>,
 Mike Holmes <mike.holmes@linaro.org>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This patchset adds vhost-user-i2c device's support in Qemu. Initially I tried to
add the backend implementation as well into Qemu, but as I was looking for a
hypervisor agnostic backend implementation, I decided to keep it outside of
Qemu. Eventually I implemented it in Rust and it works very well with this
patchset, and it is under review [1] to be merged in common rust vhost devices
crate.

The kernel virtio I2C driver [2] is fully reviewed and is ready to be merged soon.

V1->V2:
- Dropped the backend support from qemu and minor cleanups.

I2C Testing:
------------

I didn't have access to a real hardware where I can play with a I2C
client device (like RTC, eeprom, etc) to verify the working of the
backend daemon, so I decided to test it on my x86 box itself with
hierarchy of two ARM64 guests.

The first ARM64 guest was passed "-device ds1338,address=0x20" option,
so it could emulate a ds1338 RTC device, which connects to an I2C bus.
Once the guest came up, ds1338 device instance was created within the
guest kernel by doing:

  echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device

[
  Note that this may end up binding the ds1338 device to its driver,
  which won't let our i2c daemon talk to the device. For that we need to
  manually unbind the device from the driver:

  echo 0-0020 > /sys/bus/i2c/devices/0-0020/driver/unbind
]

After this is done, you will get /dev/rtc1. This is the device we wanted
to emulate, which will be accessed by the vhost-user-i2c backend daemon
via the /dev/i2c-0 file present in the guest VM.

At this point we need to start the backend daemon and give it a
socket-path to talk to from qemu (you can pass -v to it to get more
detailed messages):

  vhost-user-i2c --socket-path=vi2c.sock -l 0:32

[ Here, 0:32 is the bus/device mapping, 0 for /dev/i2c-0 and 32 (i.e.
0x20) is client address of ds1338 that we used while creating the
device. ]

Now we need to start the second level ARM64 guest (from within the first
guest) to get the i2c-virtio.c Linux driver up. The second level guest
is passed the following options to connect to the same socket:

  -chardev socket,path=vi2c.sock0,id=vi2c \
  -device vhost-user-i2c-pci,chardev=vi2c,id=i2c

Once the second level guest boots up, we will see the i2c-virtio bus at
/sys/bus/i2c/devices/i2c-X/. From there we can now make it emulate the
ds1338 device again by doing:


  echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device

[ This time we want ds1338's driver to be bound to the device, so it
should be enabled in the kernel as well. ]

And we will get /dev/rtc1 device again here in the second level guest.
Now we can play with the rtc device with help of hwclock utility and we
can see the following sequence of transfers happening if we try to
update rtc's time from system time.

hwclock -w -f /dev/rtc1 (in guest2) ->
  Reaches i2c-virtio.c (Linux bus driver in guest2) ->
    transfer over virtio ->
      Reaches the qemu's vhost-i2c device emulation (running over guest1) ->
        Reaches the backend daemon vhost-user-i2c started earlier (in guest1) ->
          ioctl(/dev/i2c-0, I2C_RDWR, ..); (in guest1) ->
            reaches qemu's hw/rtc/ds1338.c (running over host)


SMBUS Testing:
--------------

I wasn't required to have such a tedious setup for testing out with
SMBUS devices. I was able to emulate a SMBUS device on my x86 machine
using i2c-stub driver.

$ modprobe i2c-stub chip_addr=0x20
//Boot the arm64 guest now with i2c-virtio driver and then do:
$ echo al3320a 0x20 > /sys/class/i2c-adapter/i2c-0/new_device
$ cat /sys/bus/iio/devices/iio:device0/in_illuminance_raw

That's it.

I hope I was able to give a clear picture of my test setup here :)

--
Viresh

Viresh Kumar (3):
  hw/virtio: add boilerplate for vhost-user-i2c device
  hw/virtio: add vhost-user-i2c-pci boilerplate
  MAINTAINERS: Add entry for virtio-i2c

 MAINTAINERS                        |   7 +
 hw/virtio/Kconfig                  |   5 +
 hw/virtio/meson.build              |   2 +
 hw/virtio/vhost-user-i2c-pci.c     |  69 +++++++
 hw/virtio/vhost-user-i2c.c         | 288 +++++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-i2c.h |  28 +++
 6 files changed, 399 insertions(+)
 create mode 100644 hw/virtio/vhost-user-i2c-pci.c
 create mode 100644 hw/virtio/vhost-user-i2c.c
 create mode 100644 include/hw/virtio/vhost-user-i2c.h

-- 
2.31.1.272.g89b43f80a514


