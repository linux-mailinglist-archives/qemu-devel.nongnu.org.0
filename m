Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B89263B270
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 20:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozk1D-0000Mn-Kq; Mon, 28 Nov 2022 14:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozk1B-0000Jl-EH
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 14:42:17 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozk19-00036x-4h
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 14:42:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id z4so18686215wrr.3
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 11:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UEj7GXYTSbrN8AL8/zmTibPgtFKZRMvTrZJ7ISsuMyA=;
 b=F50zxTk0YhHCODjPuAnU7Lojr+Wcy9DclgyYQx9A+V3QrMQS7IHG9yD6IdmMmMvNyF
 VEDLMFNQtIBnff7UumN9Rtt5HecxA606kPH6fgbWyM8zjabt5NEgMlOWSqg//UKHBQy5
 K0tw+J/mHLhKOaK8j6TE4l+V8bdDEJAvoVdUTcS0Qljj69bc/J+cDygZ4SlsW9aulElU
 uk7BZBfD3okbRO9FGkC3hXeLklu7DebIO4MrzIPdB7opk61L6DpY4Z4OrbToZS73LKi4
 tkNG496zRRhG1tojkR0gXk7IIwpKZrjNIFW/cey+KNvCj8cAPzoEbgWL7NE+QpBPq7wH
 Z2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UEj7GXYTSbrN8AL8/zmTibPgtFKZRMvTrZJ7ISsuMyA=;
 b=xok0UkpnNyvZdbJU7NfyzFM1dJBlN5SUSpLqOSFXv+C3v+VnMeMXXmIO6DsBspjVsy
 QA9IVMMof202oGPvCR8gWY326JxXUsLNmL+D3KEcvPPGMYoEpyf1y2TgCH1JD4lj2Grp
 hWRBl1uNzs/138zcEvBa+8d0dG0wjFtfjPi3G6of2/8s04y1OcmoYXKIm7BsUL+A1wAm
 ssel5iYIlxG8l/f/8ERY8enUeUGrBw6khRxzop4QWowhxSVCGumZqRWa/P4ZrNzQjGGN
 eZNjNPRXYIIB0LCUs7zCfrqGFEumZTdrx45QYf+mbJdC2JN0vDAbc8bG4dRA1AAtAK7T
 QdLQ==
X-Gm-Message-State: ANoB5pl6nRSBy+GjNsnY/xJ+DwQ6a3poCK6Qa47b0IPJAihp/180hFma
 3mYJ1cpwV6eMoz6fgYBPh/Pq6A==
X-Google-Smtp-Source: AA0mqf5E7Tyt/pqwJfwjwtrcH5j3r6uZW2yhT7GNJx+LtCY8ft6Wz9oao5SfyVHjmF2ltU1h0m8jfQ==
X-Received: by 2002:adf:d224:0:b0:236:6a5d:16b0 with SMTP id
 k4-20020adfd224000000b002366a5d16b0mr33238029wrh.497.1669664533491; 
 Mon, 28 Nov 2022 11:42:13 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003b435c41103sm24344864wmo.0.2022.11.28.11.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 11:42:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 60FCD1FFB7;
 Mon, 28 Nov 2022 19:42:12 +0000 (GMT)
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-5-alex.bennee@linaro.org>
 <CAJSP0QX1R4Z+AC3591MpwzBAG1Tz3rDTe4+o2rbe0v-q6sSKMw@mail.gmail.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org, sgarzare@redhat.com
Subject: Re: [PATCH v3 4/7] hw/virtio: ensure a valid host_feature set for
 virtio-user-gpio
Date: Mon, 28 Nov 2022 19:39:29 +0000
In-reply-to: <CAJSP0QX1R4Z+AC3591MpwzBAG1Tz3rDTe4+o2rbe0v-q6sSKMw@mail.gmail.com>
Message-ID: <8735a2yigb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Mon, 28 Nov 2022 at 11:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> There was a disconnect here because vdev->host_features was set to
>> random rubbish. This caused a weird negotiation between the driver and
>> device that took no account of the features provided by the backend.
>> To fix this we must set vdev->host_features once we have initialised
>> the vhost backend.
>>
>> [AJB: however this is confusing because AFAICT none of the other
>> vhost-user devices do this.]
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  hw/virtio/vhost-user-gpio.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
>> index 5851cb3bc9..b2496c824c 100644
>> --- a/hw/virtio/vhost-user-gpio.c
>> +++ b/hw/virtio/vhost-user-gpio.c
>> @@ -228,6 +228,12 @@ static int vu_gpio_connect(DeviceState *dev, Error =
**errp)
>>          return ret;
>>      }
>>
>> +    /*
>> +     * Once we have initialised the vhost backend we can finally set
>> +     * the what host features are available for this device.
>> +     */
>> +    vdev->host_features =3D vhost_dev->features;
>
> vdev->host_feature is already set by virtio_bus_device_plugged ->
> vu_gpio_get_features.
>
> Something is still wrong.
>
> My understanding is: ->realize() performs a blocking connect so when
> it returns and virtio_bus_device_plugged() runs, we'll be able to
> fetch the backend features from ->get_features(). The assumption is
> that the backend features don't change across reconnection (I think).
>
> vhost-user-gpio seems to follow the same flow as the other vhost-user
> devices (vhost-user-net is special, so let's ignore it), so I don't
> understand why it's necessary to manually assign ->host_features here?

I think you are right. I suspect I got confused while chasing down the
missing high bits (due to the legacy VirtIO negotiation). Also slightly
thrown off by the appearance of virtio-net (I assume because of a
machine default?):

  =E2=9E=9C  env QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-s=
torage-daemon QTEST_QEMU_IMG=3D./qemu-img QTEST_QEMU_BINARY=3D./qemu-system=
-aarch64 G_TEST_DBUS_DAEMON=3D/home/alex/
  lsrc/qemu.git/tests/dbus-vmstate-daemon.sh MALLOC_PERTURB_=3D177 ./tests/=
qtest/qos-test --tap -p /aarch64/virt/generic-pcihost/pci-bus-generic/pci-b=
us/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem=
/memfile
  # random seed: R02S235ee9d31e87e0159f810979be62563e
  # starting QEMU: exec ./qemu-system-aarch64 -qtest unix:/tmp/qtest-127628=
9.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1276289.qmp,i=
d=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -machine none -=
accel qtest
  # Start of aarch64 tests
  # Start of virt tests
  # Start of generic-pcihost tests
  # Start of pci-bus-generic tests
  # Start of pci-bus tests
  # Start of vhost-user-gpio-pci tests
  # Start of vhost-user-gpio tests
  # Start of vhost-user-gpio-tests tests
  # Start of read-guest-mem tests
  virtio_bus_device_plugged: virtio-net host_features =3D 0x10179bf8064
  vu_gpio_connect: pre host_features =3D 10039000000
  vu_gpio_connect: post host_features =3D 140000001
  virtio_bus_device_plugged: virtio-gpio host_features =3D 0x140000001
  qemu-system-aarch64: Failed to set msg fds.
  qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argumen=
t (22)
  qemu-system-aarch64: Failed to set msg fds.
  qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argumen=
t (22)
  qemu-system-aarch64: Failed to set msg fds.
  qemu-system-aarch64: vhost_set_vring_call failed: Invalid argument (22)
  qemu-system-aarch64: Failed to set msg fds.
  qemu-system-aarch64: vhost_set_vring_call failed: Invalid argument (22)
  # qos_test running single test in subprocess
  # set_protocol_features: 0x200
  # set_owner: start of session
  # vhost-user: un-handled message: 14
  # vhost-user: un-handled message: 14
  # set_vring_num: 0/256
  # set_vring_addr: 0x7f55b0000000/0x7f55affff000/0x7f55b0001000
  ok 1 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhost-user-gpi=
o-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile
  # Start of memfile tests
  # End of memfile tests
  # End of read-guest-mem tests
  # End of vhost-user-gpio-tests tests
  # End of vhost-user-gpio tests
  # End of vhost-user-gpio-pci tests
  # End of pci-bus tests
  # End of pci-bus-generic tests
  # End of generic-pcihost tests
  # End of virt tests
  # End of aarch64 tests
  1..1

and for mmio:

  env MALLOC_PERTURB_=3D235 QTEST_QEMU_IMG=3D./qemu-img QTEST_QEMU_BINARY=
=3D"./qemu-system-arm" QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/=
qemu-storage-daemon G_TEST_DBUS_DAEMON=3D/home/alex/lsrc/qemu.git/tests/dbu=
s-vmstate-daemon.sh ./tests/qtest/qos-test --tap -p /arm/virt/virtio-mmio/v=
irtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read=
-guest-mem/memfile
  # random seed: R02Sac48bb073367f77c1c1a1db6b5245c9e
  # starting QEMU: exec ./qemu-system-arm -qtest unix:/tmp/qtest-1276963.so=
ck -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1276963.qmp,id=3D=
char0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -machine none -acce=
l qtest
  # Start of arm tests
  # Start of virt tests
  # Start of virtio-mmio tests
  # Start of virtio-bus tests
  # Start of vhost-user-gpio-device tests
  # Start of vhost-user-gpio tests
  # Start of vhost-user-gpio-tests tests
  # Start of read-guest-mem tests
  virtio_bus_device_plugged: virtio-net host_features =3D 0x10179bf8064
  vu_gpio_connect: pre host_features =3D 10039000000
  vu_gpio_connect: post host_features =3D 140000001
  virtio_bus_device_plugged: virtio-gpio host_features =3D 0x140000001
  qemu-system-arm: Failed to set msg fds.
  qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
  qemu-system-arm: Failed to set msg fds.
  qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
  # qos_test running single test in subprocess
  # set_protocol_features: 0x200
  # set_owner: start of session
  # vhost-user: un-handled message: 14
  # vhost-user: un-handled message: 14
  ok 1 /arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-g=
pio/vhost-user-gpio-tests/read-guest-mem/memfile
  # Start of memfile tests
  # End of memfile tests
  # End of read-guest-mem tests
  # End of vhost-user-gpio-tests tests
  # End of vhost-user-gpio tests
  # End of vhost-user-gpio-device tests
  # End of virtio-bus tests
  # End of virtio-mmio tests
  # End of virt tests
  # End of arm tests
  1..1

I'll drop this patch for now and re-test.

>
> Stefan


--=20
Alex Benn=C3=A9e

