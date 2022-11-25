Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286C639080
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 21:10:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyf01-0005Y6-4b; Fri, 25 Nov 2022 15:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyezz-0005WX-RU
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 15:08:35 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyezs-0001nR-WE
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 15:08:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id t1so4229564wmi.4
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 12:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCOhBcfEsb06erSGHlMtlWleUyhR57MdwEpn34Dvids=;
 b=WEVRQ5cYkbLeujbfeYc+MiCMo7Tax2A/Pj4Klyfk8lgDEWI2mWdes0pL0UJXy/2ZB9
 SrvT1cQATn5ciRlU1NsHjMfC+jDWXcIdrWyTrjyMumVNjN2NB7sC3TQ18ZsYsc7+F4/O
 EQAOyJ1Q9ZUJQo5BDYEDY5ghRzLdJWp4b/xOfaB+smhZfJXoAtMP6GcFlUbvZTwpWZLZ
 SGOowVCyi5lj6I1ppSj/hS2e2PqUNa4p6UMATV5d2GqgjJJx6BUdIIVs61pkJ7zc5Obn
 pekIw8vfuB115YbUmOpLfTVZXNuMCUGE136PKqQ7KXX0SvUHNu85bZPCsXF6mKj97ncA
 QUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VCOhBcfEsb06erSGHlMtlWleUyhR57MdwEpn34Dvids=;
 b=2igm7WXVPbtLYLlOHEnuMhRw1ggVtn7BSGgMmtab1Q93WnQKyfKn/cZubn7swdy24B
 FnJ8jE1wjzBMaRH9TfdG0aGm3ELOm6yT/0RZ4MXpc78/ME9Qvn0wOr+RMy0csxDLH9dL
 xVKH9dNyMjnbBzU6eUtBqr2LnEP/6jgHjfi667BbfzcP3JfcJt8HIoOkBsOgt+zrd6Zy
 m123rnTlqaXZCAUvE03PV4d6jKGV8YL6K8NsBiuFizsh0EPx+I3Hn+4+HkaZ0XMIMl+b
 K5ZIKsOwz201LGGTZcTpkh2i6h0G6GkDR7vp8Vkgomwxy78+ThFecyQCEZjph9jcrQSV
 MEzw==
X-Gm-Message-State: ANoB5pmwMpsF5AuX/jbSVS3kSjnIpGzAFJKtwv5ZQX0IulEwAwxNdegU
 UnkcK2SRWiLHM7gTX4Jnl1vqCdeXraeYmw==
X-Google-Smtp-Source: AA0mqf4exUhDRFUccw1R21nDE25S9I0W2KTcwR1kEsTTasgITPzH7xfppmUt0AT2Isfbx5e5j44Low==
X-Received: by 2002:a05:600c:19cc:b0:3cf:7bdd:e014 with SMTP id
 u12-20020a05600c19cc00b003cf7bdde014mr23520074wmq.1.1669406907447; 
 Fri, 25 Nov 2022 12:08:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003cfd0bd8c0asm7139285wms.30.2022.11.25.12.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 12:08:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEFE71FFB7;
 Fri, 25 Nov 2022 20:08:25 +0000 (GMT)
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH for 7.2-rc? v2 0/5] continuing efforts to fix vhost-user
 issues
Date: Fri, 25 Nov 2022 19:58:20 +0000
In-reply-to: <20221125173043.1998075-1-alex.bennee@linaro.org>
Message-ID: <87lenyajba.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

> Hi,
>
<snip>
> I can replicate some of the other failures I've been seeing in CI by
> running:
>
>   ../../meson/meson.py test --repeat 10 --print-errorlogs qtest-arm/qos-t=
est
>
> however this seems to run everything in parallel and maybe is better
> at exposing race conditions. Perhaps the CI system makes those races
> easier to hit? Unfortunately I've not been able to figure out exactly
> how things go wrong in the failure case.=20
>
<snip>

There is a circular call - we are in vu_gpio_stop which triggers a write
to vhost-user which allows us to catch a disconnect event:

  #0  vhost_dev_is_started (hdev=3D0x557adf80d878) at /home/alex/lsrc/qemu.=
git/include/hw/virtio/vhost.h:199
  #1  0x0000557adbe0518a in vu_gpio_stop (vdev=3D0x557adf80d640) at ../../h=
w/virtio/vhost-user-gpio.c:138
  #2  0x0000557adbe04d56 in vu_gpio_disconnect (dev=3D0x557adf80d640) at ..=
/../hw/virtio/vhost-user-gpio.c:255
  #3  0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640, event=
=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
  #4  0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10, event=3DCHR_E=
VENT_CLOSED) at ../../chardev/char.c:61
  #5  0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10, event=3D=
CHR_EVENT_CLOSED) at ../../chardev/char.c:81
  #6  0x0000557adc04f666 in tcp_chr_disconnect_locked (chr=3D0x557adea51f10=
) at ../../chardev/char-socket.c:470
  #7  0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10, buf=3D0x7f=
fe8588cce0 "\v", len=3D20) at ../../chardev/char-socket.c:129
  #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f10, buf=
=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=3Dtrue=
) at ../../chardev/char.c:121
  #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=3D0x7ff=
e8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c:173
  #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d830, buf=
=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
  #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, msg=3D0=
x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.c:490
  #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557adf80d878=
, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
  #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d878, vde=
v=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio/vhost.=
c:1220
  #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, vdev=3D0=
x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
  #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../../h=
w/virtio/vhost-user-gpio.c:142
  #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640, stat=
us=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
  #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, val=
=3D15 '\017') at ../../hw/virtio/virtio.c:2442
  #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80d640,=
 running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virtio.c:3=
736
  #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3DRUN_S=
TATE_SHUTDOWN) at ../../softmmu/runstate.c:334
  #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, send_st=
op=3Dfalse) at ../../softmmu/cpus.c:262
  #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
  #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.c:827
  #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main.c:38
  #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at ../.=
./softmmu/main.c:48
  (rr) p hdev->started
  $9 =3D true
  (rr) info thread
    Id   Target Id                                Frame=20
  * 1    Thread 2140414.2140414 (qemu-system-aar) vhost_dev_is_started (hde=
v=3D0x557adf80d878) at /home/alex/lsrc/qemu.git/include/hw/virtio/vhost.h:1=
99
    2    Thread 2140414.2140439 (qemu-system-aar) 0x0000000070000002 in sys=
call_traced ()
    3    Thread 2140414.2140442 (qemu-system-aar) 0x0000000070000002 in sys=
call_traced ()
    4    Thread 2140414.2140443 (qemu-system-aar) 0x0000000070000002 in sys=
call_traced ()

During which we eliminate the vhost_dev with a memset:

  Thread 1 hit Hardware watchpoint 2: *(unsigned int *) 0x557adf80da30

  Old value =3D 2
  New value =3D 0
  __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch/memset-vec=
-unaligned-erms.S:220
  Download failed: Invalid argument.  Continuing without source file ./stri=
ng/../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S.
  220     ../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S: No such =
file or directory.
  (rr) bt
  #0  __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch/memset=
-vec-unaligned-erms.S:220
  #1  0x0000557adbdd67f8 in vhost_dev_cleanup (hdev=3D0x557adf80d878) at ..=
/../hw/virtio/vhost.c:1501
  #2  0x0000557adbe04d68 in vu_gpio_disconnect (dev=3D0x557adf80d640) at ..=
/../hw/virtio/vhost-user-gpio.c:256
  #3  0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640, event=
=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
  #4  0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10, event=3DCHR_E=
VENT_CLOSED) at ../../chardev/char.c:61
  #5  0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10, event=3D=
CHR_EVENT_CLOSED) at ../../chardev/char.c:81
  #6  0x0000557adc04f666 in tcp_chr_disconnect_locked (chr=3D0x557adea51f10=
) at ../../chardev/char-socket.c:470
  #7  0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10, buf=3D0x7f=
fe8588cce0 "\v", len=3D20) at ../../chardev/char-socket.c:129
  #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f10, buf=
=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=3Dtrue=
) at ../../chardev/char.c:121
  #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=3D0x7ff=
e8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c:173
  #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d830, buf=
=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
  #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, msg=3D0=
x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.c:490
  #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557adf80d878=
, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
  #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d878, vde=
v=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio/vhost.=
c:1220
  #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, vdev=3D0=
x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
  #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../../h=
w/virtio/vhost-user-gpio.c:142
  #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640, stat=
us=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
  #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, val=
=3D15 '\017') at ../../hw/virtio/virtio.c:2442
  #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80d640,=
 running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virtio.c:3=
736
  #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3DRUN_S=
TATE_SHUTDOWN) at ../../softmmu/runstate.c:334
  #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, send_st=
op=3Dfalse) at ../../softmmu/cpus.c:262
  #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
  #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.c:827
  #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main.c:38
  #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at ../.=
./softmmu/main.c:48

Before finally:

  #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.=
c:50
  #1  0x00007f24dc269537 in __GI_abort () at abort.c:79
  #2  0x00007f24dc26940f in __assert_fail_base (fmt=3D0x7f24dc3e16a8 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3D0x557adc28d8f5 "assign |=
| nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc28d7ab "../../hw/=
virtio/virtio-pci.c", line=3D1029, function=3D<optimized out>) at assert.c:=
92
  #3  0x00007f24dc278662 in __GI___assert_fail (assertion=3D0x557adc28d8f5 =
"assign || nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc28d7ab "=
../../hw/virtio/virtio-pci.c", line=3D1029, function=3D0x557adc28d922 "int =
virtio_pci_set_guest_notifiers(DeviceState *, int, _Bool)") at assert.c:101
  #4  0x0000557adb8e97f1 in virtio_pci_set_guest_notifiers (d=3D0x557adf805=
280, nvqs=3D0, assign=3Dfalse) at ../../hw/virtio/virtio-pci.c:1029
  #5  0x0000557adbe051c7 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../../h=
w/virtio/vhost-user-gpio.c:144
  #6  0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640, stat=
us=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
  #7  0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, val=
=3D15 '\017') at ../../hw/virtio/virtio.c:2442
  #8  0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80d640,=
 running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virtio.c:3=
736
  #9  0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3DRUN_S=
TATE_SHUTDOWN) at ../../softmmu/runstate.c:334
  #10 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, send_st=
op=3Dfalse) at ../../softmmu/cpus.c:262
  #11 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
  #12 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.c:827
  #13 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main.c:38
  #14 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at ../.=
./softmmu/main.c:48

Because of course we've just done that on disconnect.

Not sure what the cleanest way to avoid that is yet. Maybe it will be
clearer on Monday morning.

--=20
Alex Benn=C3=A9e

