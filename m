Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5C619D5F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:34:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzcc-0002Jb-MS; Fri, 04 Nov 2022 12:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqzcW-0002Hk-Rg
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:32:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqzcU-0002u5-39
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:32:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id bs21so7816438wrb.4
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XeTMGP3qgl5JYAR3VUf1oiQ1s1WCkMzA93AD7g61Qhw=;
 b=EbSqoJqazPB0fW4MphQyOuhSHcbtsY2f+MGNaFqxg5go4b6VtNm5qs+PKuh0UCvDd6
 rI3ms7jkPoJ0SKlEwFLvTde7318tQkWqchm7n5/LZIgQY4eltyZZZQQKt+dPI+g3RR6O
 X+49sKWOme9LRgxiMmzPuJY92LuiJXtszIUwoaRjJHXcyy+xhGZ/H+SPRSDrI+jikiTg
 fbn47N8a3kO6eQ7/L6o0CK+nClCWTalpc7RAFpBnVDxvCT/LF4AmCb5U0WuAat3KIYNQ
 S6XpoaTGMdO9hPqE2yicTej1wOQMXEugZS2nVVcekuWB/gtS3XRMhj2qjvuT9fz7VaTO
 roxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XeTMGP3qgl5JYAR3VUf1oiQ1s1WCkMzA93AD7g61Qhw=;
 b=zEyB71Dlj7VvYnzSl3/xeuEkGH1CWWn+/B3USjsHEedMlDiLs2qRYmj7EXw2US0ADc
 MTL0f6qCp3TX9U/Y5ue/Phs3ItpEGz4G2032tE+mZsknVbzf3+cxXNazlcxR9YMYz3CU
 9zXchFNzjwQ0ydYkhzL5TXLeb9PcA8HrIGmhHmdzsJu3sW6eU+fa1I9+fNGjE5AOn1sg
 AVPNWX0+cbXfGhyJnCZw0qqjmfHkqSCqPjNXQZ3K7eqfgJXDEeAZPlu5g5BQD1+O6pe2
 lGXwDmunlM6yKry27ORY/ZSXMwAp/rE9WiUXVPRN1rCtkakYibs34xkETdxqhGm8Vmcu
 C5fQ==
X-Gm-Message-State: ACrzQf0vu6/czuZndAQRY80SSky5vLzXp80mgx+vTA7rNdRoI0FPX/Bj
 BzxVlGvRYSzPTdDRZoh8dcupRg==
X-Google-Smtp-Source: AMsMyM5wsmGEvH0R5miCanK4I9ypM0HrtJctNKT+MEYqOsV+QjDk9UDXxOfKrdxS07n3FynH/OhFnA==
X-Received: by 2002:adf:e510:0:b0:235:de50:72ff with SMTP id
 j16-20020adfe510000000b00235de5072ffmr22209486wrm.100.1667579555884; 
 Fri, 04 Nov 2022 09:32:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a5d4301000000b0022efc4322a9sm3799797wrq.10.2022.11.04.09.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:32:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A8F9A1FFB7;
 Fri,  4 Nov 2022 16:32:34 +0000 (GMT)
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
 <20221104115340-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
Date: Fri, 04 Nov 2022 16:31:08 +0000
In-reply-to: <20221104115340-mutt-send-email-mst@kernel.org>
Message-ID: <877d0ak7dp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Oct 14, 2022 at 02:21:08PM +0100, Alex Benn=C3=A9e wrote:
>> During migration the virtio device state can be restored before we
>> restart the VM. As no devices can be running while the VM is paused it
>> makes sense to bail out early in that case.
>>=20
>> This returns the order introduced in:
>>=20
>>  9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
>>=20
>> to what virtio-sock was doing longhand.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
>
>
> What happens now:
>
> with this applied I get:
>
> https://gitlab.com/mitsirkin/qemu/-/pipelines/685829158/failures
>
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
> stderr:
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: -chardev
> socket,id=3Dchr-reconnect,path=3D/tmp/vhost-test-QLKXU1/reconnect.sock,se=
rver=3Don:
> info: QEMU waiting for connection on:
> disconnected:unix:/tmp/vhost-test-QLKXU1/reconnect.sock,server=3Don
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: -chardev
> socket,id=3Dchr-connect-fail,path=3D/tmp/vhost-test-L9Q6U1/connect-fail.s=
ock,server=3Don:
> info: QEMU waiting for connection on:
> disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=3Don
> qemu-system-arm: -netdev
> vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vhostforce=3Don: Failed to
> read msg header. Read 0 instead of 12. Original request 1.
> qemu-system-arm: -netdev
> vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vhostforce=3Don:
> vhost_backend_init failed: Protocol error
> qemu-system-arm: -netdev
> vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vhostforce=3Don: failed to
> init vhost_net for queue 0
> qemu-system-arm: -netdev
> vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vhostforce=3Don: info: QEMU
> waiting for connection on:
> disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=3Don
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: -chardev
> socket,id=3Dchr-flags-mismatch,path=3D/tmp/vhost-test-3MO5U1/flags-mismat=
ch.sock,server=3Don:
> info: QEMU waiting for connection on:
> disconnected:unix:/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=3Don
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
> qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
> qemu-system-arm: unable to start vhost net: 22: falling back on userspace=
 virtio
> vhost lacks feature mask 0x40000000 for backend
> qemu-system-arm: failed to init vhost_net for queue 0
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 2 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 3 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (2=
2)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -5: Input/output error (=
5)
> qemu-system-arm: ../hw/virtio/virtio-bus.c:211: void
> virtio_bus_release_ioeventfd(VirtioBusState *): Assertion
> `bus->ioeventfd_grabbed !=3D 0' failed.
> ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signa=
l 6 (Aborted) (core dumped)
> **
> ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child
> process
> (/arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/=
vhost-user-gpio-tests/read-guest-mem/memfile/subprocess
> [8735]) failed unexpectedly
> (test program exited with status code -6)
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95
>
>
>
>
> without this it passes:
>
> https://gitlab.com/mitsirkin/qemu/-/jobs/3275949777
>
>
> this only triggers under github, clang-system job.
> trying to decide what to do now. revert just this?

I must admit I didn't run that directly. My build box is currently out
of commission but can we get more detail about the abort?

It looks like the vhost negotiation is totally broken and can't even
find the VQs

>
>
>> ---
>>  include/hw/virtio/virtio.h | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index f41b4a7e64..ebb58feaac 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -385,14 +385,14 @@ static inline bool virtio_is_big_endian(VirtIODevi=
ce *vdev)
>>=20=20
>>  static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t st=
atus)
>>  {
>> -    if (vdev->use_started) {
>> -        return vdev->started;
>> -    }
>> -
>>      if (!vdev->vm_running) {
>>          return false;
>>      }
>>=20=20
>> +    if (vdev->use_started) {
>> +        return vdev->started;
>> +    }
>> +
>>      return status & VIRTIO_CONFIG_S_DRIVER_OK;
>>  }
>>=20=20
>> --=20
>> 2.34.1


--=20
Alex Benn=C3=A9e

