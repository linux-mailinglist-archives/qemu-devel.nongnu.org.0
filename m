Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74D63C422
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 16:50:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p02rC-0004mL-QY; Tue, 29 Nov 2022 10:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p02r6-0004lv-Ua
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:49:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p02r4-0004OX-MU
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669736945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzlR6oVGtTJCbenr/eirKlYm8RKWhX+rD9JWeoOOJ7Q=;
 b=UFSzyEaI7lJKo3loj7HZD1o6BoZ5R8GFNSoFZ625Dd8FX/xB3yMho/8rvzbTUiMLqd0kXg
 c+JzMpIU8XvLqCRiEcDON4977xOUFUH4z+kcKHJJpC1iQyDhWPzmBroY6rUctEwYZpldMq
 VLR3wuh6tWZORP3SBfGfKuaCFDC7AZs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-TnmiZRqaNu6GWv2Ti3VJ3Q-1; Tue, 29 Nov 2022 10:48:59 -0500
X-MC-Unique: TnmiZRqaNu6GWv2Ti3VJ3Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so2943528wra.13
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 07:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hzlR6oVGtTJCbenr/eirKlYm8RKWhX+rD9JWeoOOJ7Q=;
 b=mi6YZciHf9FE7rGNyuLVcApAZkfZFqbPdKntpt8ctDzqr4yiBbDbmTzjUNLfbt7wqU
 w7MgyZKNfzL3Uvr1QF2q/zDBVU2fni4fo6BvUKoQ63KJZIimXj/VrIq35PWchEvSwIex
 FKFApJGmQ7YUuthImfIJdCWPSjq3DGnh5UumULRXzuA+UTFkoL3De3aueqBxT60nNiCt
 YLR2r1VEi4NpJ2uRw1903j+IaA7FJM6lMaepE4WfoFj8zPcYo5wyPFpaT17X5MzzuyIc
 p2XTHnlkAK94aA3BLomGswZCAHZ6Hv+XZx9IOfnb8fKODzUYZue6QvDFYtw0jLq6hLP/
 YHMw==
X-Gm-Message-State: ANoB5plGuKiSO3J7IMlIOYfBUz0OEvShLwxq2pxYZmMym/9zoRlhgR2q
 pXcBtZOEBHlrX5NWei6EvfiOFSWcjgw9iHvpdzu3aBk9Nnc96p5MWN6bAoCnHMNW/qP//KFg13v
 ElxBXCGNDdsMnWXk=
X-Received: by 2002:a5d:654a:0:b0:242:7a0:bad3 with SMTP id
 z10-20020a5d654a000000b0024207a0bad3mr13504903wrv.298.1669736931313; 
 Tue, 29 Nov 2022 07:48:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf41Vr35ghvCEvPG1tjL4rhXqJ8wMZE7P9Ss4yYIvMOMP+BYKIFURea7v4WQpX6FdG4+3IS3UA==
X-Received: by 2002:a5d:654a:0:b0:242:7a0:bad3 with SMTP id
 z10-20020a5d654a000000b0024207a0bad3mr13504883wrv.298.1669736930996; 
 Tue, 29 Nov 2022 07:48:50 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm3340185wmo.0.2022.11.29.07.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 07:48:50 -0800 (PST)
Date: Tue, 29 Nov 2022 10:48:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 slp@redhat.com, marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org, sgarzare@redhat.com
Subject: Re: [PATCH v3 4/7] hw/virtio: ensure a valid host_feature set for
 virtio-user-gpio
Message-ID: <20221129104802-mutt-send-email-mst@kernel.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-5-alex.bennee@linaro.org>
 <CAJSP0QX1R4Z+AC3591MpwzBAG1Tz3rDTe4+o2rbe0v-q6sSKMw@mail.gmail.com>
 <8735a2yigb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735a2yigb.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Nov 28, 2022 at 07:39:29PM +0000, Alex Bennée wrote:
> 
> Stefan Hajnoczi <stefanha@gmail.com> writes:
> 
> > On Mon, 28 Nov 2022 at 11:42, Alex Bennée <alex.bennee@linaro.org> wrote:
> >>
> >> There was a disconnect here because vdev->host_features was set to
> >> random rubbish. This caused a weird negotiation between the driver and
> >> device that took no account of the features provided by the backend.
> >> To fix this we must set vdev->host_features once we have initialised
> >> the vhost backend.
> >>
> >> [AJB: however this is confusing because AFAICT none of the other
> >> vhost-user devices do this.]
> >>
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> ---
> >>  hw/virtio/vhost-user-gpio.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> >> index 5851cb3bc9..b2496c824c 100644
> >> --- a/hw/virtio/vhost-user-gpio.c
> >> +++ b/hw/virtio/vhost-user-gpio.c
> >> @@ -228,6 +228,12 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
> >>          return ret;
> >>      }
> >>
> >> +    /*
> >> +     * Once we have initialised the vhost backend we can finally set
> >> +     * the what host features are available for this device.
> >> +     */
> >> +    vdev->host_features = vhost_dev->features;
> >
> > vdev->host_feature is already set by virtio_bus_device_plugged ->
> > vu_gpio_get_features.
> >
> > Something is still wrong.
> >
> > My understanding is: ->realize() performs a blocking connect so when
> > it returns and virtio_bus_device_plugged() runs, we'll be able to
> > fetch the backend features from ->get_features(). The assumption is
> > that the backend features don't change across reconnection (I think).
> >
> > vhost-user-gpio seems to follow the same flow as the other vhost-user
> > devices (vhost-user-net is special, so let's ignore it), so I don't
> > understand why it's necessary to manually assign ->host_features here?
> 
> I think you are right. I suspect I got confused while chasing down the
> missing high bits (due to the legacy VirtIO negotiation). Also slightly
> thrown off by the appearance of virtio-net (I assume because of a
> machine default?):
> 
>   ➜  env QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-aarch64 G_TEST_DBUS_DAEMON=/home/alex/
>   lsrc/qemu.git/tests/dbus-vmstate-daemon.sh MALLOC_PERTURB_=177 ./tests/qtest/qos-test --tap -p /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile
>   # random seed: R02S235ee9d31e87e0159f810979be62563e
>   # starting QEMU: exec ./qemu-system-aarch64 -qtest unix:/tmp/qtest-1276289.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1276289.qmp,id=char0 -mon chardev=char0,mode=control -display none -machine none -accel qtest
>   # Start of aarch64 tests
>   # Start of virt tests
>   # Start of generic-pcihost tests
>   # Start of pci-bus-generic tests
>   # Start of pci-bus tests
>   # Start of vhost-user-gpio-pci tests
>   # Start of vhost-user-gpio tests
>   # Start of vhost-user-gpio-tests tests
>   # Start of read-guest-mem tests
>   virtio_bus_device_plugged: virtio-net host_features = 0x10179bf8064
>   vu_gpio_connect: pre host_features = 10039000000
>   vu_gpio_connect: post host_features = 140000001
>   virtio_bus_device_plugged: virtio-gpio host_features = 0x140000001
>   qemu-system-aarch64: Failed to set msg fds.
>   qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>   qemu-system-aarch64: Failed to set msg fds.
>   qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>   qemu-system-aarch64: Failed to set msg fds.
>   qemu-system-aarch64: vhost_set_vring_call failed: Invalid argument (22)
>   qemu-system-aarch64: Failed to set msg fds.
>   qemu-system-aarch64: vhost_set_vring_call failed: Invalid argument (22)
>   # qos_test running single test in subprocess
>   # set_protocol_features: 0x200
>   # set_owner: start of session
>   # vhost-user: un-handled message: 14
>   # vhost-user: un-handled message: 14
>   # set_vring_num: 0/256
>   # set_vring_addr: 0x7f55b0000000/0x7f55affff000/0x7f55b0001000
>   ok 1 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile
>   # Start of memfile tests
>   # End of memfile tests
>   # End of read-guest-mem tests
>   # End of vhost-user-gpio-tests tests
>   # End of vhost-user-gpio tests
>   # End of vhost-user-gpio-pci tests
>   # End of pci-bus tests
>   # End of pci-bus-generic tests
>   # End of generic-pcihost tests
>   # End of virt tests
>   # End of aarch64 tests
>   1..1
> 
> and for mmio:
> 
>   env MALLOC_PERTURB_=235 QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY="./qemu-system-arm" QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon G_TEST_DBUS_DAEMON=/home/alex/lsrc/qemu.git/tests/dbus-vmstate-daemon.sh ./tests/qtest/qos-test --tap -p /arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile
>   # random seed: R02Sac48bb073367f77c1c1a1db6b5245c9e
>   # starting QEMU: exec ./qemu-system-arm -qtest unix:/tmp/qtest-1276963.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1276963.qmp,id=char0 -mon chardev=char0,mode=control -display none -machine none -accel qtest
>   # Start of arm tests
>   # Start of virt tests
>   # Start of virtio-mmio tests
>   # Start of virtio-bus tests
>   # Start of vhost-user-gpio-device tests
>   # Start of vhost-user-gpio tests
>   # Start of vhost-user-gpio-tests tests
>   # Start of read-guest-mem tests
>   virtio_bus_device_plugged: virtio-net host_features = 0x10179bf8064
>   vu_gpio_connect: pre host_features = 10039000000
>   vu_gpio_connect: post host_features = 140000001
>   virtio_bus_device_plugged: virtio-gpio host_features = 0x140000001
>   qemu-system-arm: Failed to set msg fds.
>   qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
>   qemu-system-arm: Failed to set msg fds.
>   qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
>   # qos_test running single test in subprocess
>   # set_protocol_features: 0x200
>   # set_owner: start of session
>   # vhost-user: un-handled message: 14
>   # vhost-user: un-handled message: 14
>   ok 1 /arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile
>   # Start of memfile tests
>   # End of memfile tests
>   # End of read-guest-mem tests
>   # End of vhost-user-gpio-tests tests
>   # End of vhost-user-gpio tests
>   # End of vhost-user-gpio-device tests
>   # End of virtio-bus tests
>   # End of virtio-mmio tests
>   # End of virt tests
>   # End of arm tests
>   1..1
> 
> I'll drop this patch for now and re-test.

So I should expect v4? And I guess we can split out documentation things then?

> >
> > Stefan
> 
> 
> -- 
> Alex Bennée


