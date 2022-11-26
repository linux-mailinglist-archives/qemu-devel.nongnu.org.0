Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8586A6394F4
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 10:45:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyrjU-0007ni-Jp; Sat, 26 Nov 2022 04:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyrjS-0007nL-30
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 04:44:22 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyrjP-0007UA-Mp
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 04:44:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso4980284wmp.5
 for <qemu-devel@nongnu.org>; Sat, 26 Nov 2022 01:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrb9FPxWuY+Ct5Fe/F45z8BK73S/0aOfZ0IEsWkRK8I=;
 b=oOcaQH8R0rhaXd8Nrj/eIveBo1rantXHrxElwmgset+MbLavS58xZlj1jCAMDI3vUa
 Xuz1oYpmmwBxQ161Xf2f85cijPkMay3eRERPbIHlP0bIovCQVlz+QyxKJjcWnb2Amg8s
 RokhjNZA1bbhMevTHoS0GTJwSYmXCCFfU12IW8K4tl7WDnDZ95d0izyFCGaU/+rZ9D6X
 EyhUGQfIXPZWZJv9Q3LIxIvhdocIJdHpRRB7GDD6EEXZPkO/ssarTxBDZGLPi9JfkhcC
 dZXOOPkZswG5P4oiarIT5mfEXv8NPD4A7fe0ad++wKZ0zuKL+IQkDoFk7Aok7osoZd25
 f58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rrb9FPxWuY+Ct5Fe/F45z8BK73S/0aOfZ0IEsWkRK8I=;
 b=eIee/Yrma9WJLPXlaDzLU/1y6zBEF6GXzBZEtiNirRrouX393OjaVUlqMh+UDUhRyF
 YxkFzk7Y2Iwj5VImacdqP2HO79+mVs9VXM3ZPxETG+m2dzuYmLhkWIf88DHwuNX3KOhc
 XzsUr81wTPOnziTyHAn6mdWktxuvQnD+Uyd8jHrYFIMw6j6a/cS+r/IQ1o5xI76vUtxI
 H6cnJPbLAKLm4ya7mbs2Bn1CXZ6btkzwqKHqVRtHNVQF39CIHqZihyw4BZ5gwvOksmUM
 0yKo0AZ6yvWvSIspsamtgTT0qITii+Oqh8xxT1JX20h39/n1/gp+MxKMk82E6j3yc6/H
 dRsg==
X-Gm-Message-State: ANoB5pkwwPbhGpdAd+2+dyFtMAa5RnsjK4yQGYLClWpSd4/zyOsIgFDS
 Vr5McJ7NSwQdUnI9Ovz6U0jw9w==
X-Google-Smtp-Source: AA0mqf6OskPXMFEwhC6hu+YzzMK3tsCsEjUwaWMYQ15yYylDSEeSCQnLb/zR/W27FyF5VsUWG10UXA==
X-Received: by 2002:a05:600c:4386:b0:3cf:a4a6:a048 with SMTP id
 e6-20020a05600c438600b003cfa4a6a048mr17350920wmn.202.1669455857114; 
 Sat, 26 Nov 2022 01:44:17 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adfc586000000b002366fb99cdasm5710201wrg.50.2022.11.26.01.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 01:44:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F12E91FFB7;
 Sat, 26 Nov 2022 09:44:15 +0000 (GMT)
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
 <87lenyajba.fsf@linaro.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for 7.2-rc? v2 0/5] continuing efforts to fix vhost-user
 issues
Date: Sat, 26 Nov 2022 09:42:38 +0000
In-reply-to: <87lenyajba.fsf@linaro.org>
Message-ID: <87fse63v9t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Hi,
>>
> <snip>
>> I can replicate some of the other failures I've been seeing in CI by
>> running:
>>
>>   ../../meson/meson.py test --repeat 10 --print-errorlogs qtest-arm/qos-=
test
>>
>> however this seems to run everything in parallel and maybe is better
>> at exposing race conditions. Perhaps the CI system makes those races
>> easier to hit? Unfortunately I've not been able to figure out exactly
>> how things go wrong in the failure case.=20
>>
> <snip>
>
> There is a circular call - we are in vu_gpio_stop which triggers a write
> to vhost-user which allows us to catch a disconnect event:
>
>   #0  vhost_dev_is_started (hdev=3D0x557adf80d878) at /home/alex/lsrc/qem=
u.git/include/hw/virtio/vhost.h:199
>   #1  0x0000557adbe0518a in vu_gpio_stop (vdev=3D0x557adf80d640) at ../..=
/hw/virtio/vhost-user-gpio.c:138
>   #2  0x0000557adbe04d56 in vu_gpio_disconnect (dev=3D0x557adf80d640) at =
../../hw/virtio/vhost-user-gpio.c:255
>   #3  0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640, event=
=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274

I suspect the best choice here is to schedule the cleanup as a later
date. Should I use the aio_bh one shots for this or maybe an rcu cleanup
event?

Paolo, any suggestions?

>   #4  0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10, event=3DCHR=
_EVENT_CLOSED) at ../../chardev/char.c:61
>   #5  0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10, event=
=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:81
>   #6  0x0000557adc04f666 in tcp_chr_disconnect_locked (chr=3D0x557adea51f=
10) at ../../chardev/char-socket.c:470
>   #7  0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10, buf=3D0x=
7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-socket.c:129
>   #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f10, bu=
f=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=3Dtru=
e) at ../../chardev/char.c:121
>   #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=3D0x7=
ffe8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c:173
>   #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d830, b=
uf=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
>   #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, msg=
=3D0x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.c:4=
90
>   #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557adf80d8=
78, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
>   #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d878, v=
dev=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio/vhos=
t.c:1220
>   #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, vdev=
=3D0x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
>   #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../..=
/hw/virtio/vhost-user-gpio.c:142
>   #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640, st=
atus=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
>   #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, val=
=3D15 '\017') at ../../hw/virtio/virtio.c:2442
>   #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80d64=
0, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virtio.c=
:3736
>   #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3DRUN=
_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
>   #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, send_=
stop=3Dfalse) at ../../softmmu/cpus.c:262
>   #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
>   #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.c:8=
27
>   #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main.c:=
38
>   #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at ..=
/../softmmu/main.c:48
>   (rr) p hdev->started
>   $9 =3D true
>   (rr) info thread
>     Id   Target Id                                Frame=20
>   * 1    Thread 2140414.2140414 (qemu-system-aar) vhost_dev_is_started (h=
dev=3D0x557adf80d878) at /home/alex/lsrc/qemu.git/include/hw/virtio/vhost.h=
:199
>     2    Thread 2140414.2140439 (qemu-system-aar) 0x0000000070000002 in s=
yscall_traced ()
>     3    Thread 2140414.2140442 (qemu-system-aar) 0x0000000070000002 in s=
yscall_traced ()
>     4    Thread 2140414.2140443 (qemu-system-aar) 0x0000000070000002 in s=
yscall_traced ()
>
> During which we eliminate the vhost_dev with a memset:
>
>   Thread 1 hit Hardware watchpoint 2: *(unsigned int *) 0x557adf80da30
>
>   Old value =3D 2
>   New value =3D 0
>   __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch/memset-v=
ec-unaligned-erms.S:220
>   Download failed: Invalid argument.  Continuing without source file ./st=
ring/../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S.
>   220     ../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S: No suc=
h file or directory.
>   (rr) bt
>   #0  __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch/mems=
et-vec-unaligned-erms.S:220
>   #1  0x0000557adbdd67f8 in vhost_dev_cleanup (hdev=3D0x557adf80d878) at =
../../hw/virtio/vhost.c:1501
>   #2  0x0000557adbe04d68 in vu_gpio_disconnect (dev=3D0x557adf80d640) at =
../../hw/virtio/vhost-user-gpio.c:256
>   #3  0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640, event=
=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
>   #4  0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10, event=3DCHR=
_EVENT_CLOSED) at ../../chardev/char.c:61
>   #5  0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10, event=
=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:81
>   #6  0x0000557adc04f666 in tcp_chr_disconnect_locked (chr=3D0x557adea51f=
10) at ../../chardev/char-socket.c:470
>   #7  0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10, buf=3D0x=
7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-socket.c:129
>   #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f10, bu=
f=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=3Dtru=
e) at ../../chardev/char.c:121
>   #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=3D0x7=
ffe8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c:173
>   #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d830, b=
uf=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
>   #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, msg=
=3D0x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.c:4=
90
>   #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557adf80d8=
78, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
>   #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d878, v=
dev=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio/vhos=
t.c:1220
>   #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, vdev=
=3D0x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
>   #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../..=
/hw/virtio/vhost-user-gpio.c:142
>   #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640, st=
atus=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
>   #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, val=
=3D15 '\017') at ../../hw/virtio/virtio.c:2442
>   #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80d64=
0, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virtio.c=
:3736
>   #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3DRUN=
_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
>   #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, send_=
stop=3Dfalse) at ../../softmmu/cpus.c:262
>   #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
>   #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.c:8=
27
>   #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main.c:=
38
>   #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at ..=
/../softmmu/main.c:48
>
> Before finally:
>
>   #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/rais=
e.c:50
>   #1  0x00007f24dc269537 in __GI_abort () at abort.c:79
>   #2  0x00007f24dc26940f in __assert_fail_base (fmt=3D0x7f24dc3e16a8 "%s%=
s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3D0x557adc28d8f5 "assign=
 || nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc28d7ab "../../h=
w/virtio/virtio-pci.c", line=3D1029, function=3D<optimized out>) at assert.=
c:92
>   #3  0x00007f24dc278662 in __GI___assert_fail (assertion=3D0x557adc28d8f=
5 "assign || nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc28d7ab=
 "../../hw/virtio/virtio-pci.c", line=3D1029, function=3D0x557adc28d922 "in=
t virtio_pci_set_guest_notifiers(DeviceState *, int, _Bool)") at assert.c:1=
01
>   #4  0x0000557adb8e97f1 in virtio_pci_set_guest_notifiers (d=3D0x557adf8=
05280, nvqs=3D0, assign=3Dfalse) at ../../hw/virtio/virtio-pci.c:1029
>   #5  0x0000557adbe051c7 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../..=
/hw/virtio/vhost-user-gpio.c:144
>   #6  0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640, st=
atus=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
>   #7  0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, val=
=3D15 '\017') at ../../hw/virtio/virtio.c:2442
>   #8  0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80d64=
0, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virtio.c=
:3736
>   #9  0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3DRUN=
_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
>   #10 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, send_=
stop=3Dfalse) at ../../softmmu/cpus.c:262
>   #11 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
>   #12 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.c:8=
27
>   #13 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main.c:=
38
>   #14 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at ..=
/../softmmu/main.c:48
>
> Because of course we've just done that on disconnect.
>
> Not sure what the cleanest way to avoid that is yet. Maybe it will be
> clearer on Monday morning.


--=20
Alex Benn=C3=A9e

