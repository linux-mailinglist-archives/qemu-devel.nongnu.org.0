Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61311639662
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 15:20:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyw1A-0000vG-VO; Sat, 26 Nov 2022 09:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyw19-0000ur-DY
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 09:18:55 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyw17-0000md-3K
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 09:18:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id x5so10481327wrt.7
 for <qemu-devel@nongnu.org>; Sat, 26 Nov 2022 06:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hEpRh2XZfFoXv9CJELE7iZNOSOjDo4tyHiNsOk9zOPI=;
 b=zfX8ZgRLromacUWks6CMEUp881h4/D9OtotO4SNJ+w3F6sA8DqhdNY6aCye9GU8CuM
 +eRe2d54q+Mh1LsfoEOLa8RLzWyZrM/lzJV/8KNuqmX2/uDfSKkXXSvclj2PLyz7l8Yq
 D/abMHosghQSIRj8xvoDQaw0S+rr4CloJtKZKPzbkGNtq+A0BVFhhYvPzLaDoZVHLUM7
 69uiPY9Gga89KZqvP/p/Q/wbpZFNy6JBf9VZhhZFeH5Y1h3O9SCOx5IUOqe6LPO4WmJX
 3eosJbLvqGRlk6pibxnspyM+ZCwG5xoze3LVAnpnchpzOdneLf4ImHAOcoQV9DBaQRz3
 n5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hEpRh2XZfFoXv9CJELE7iZNOSOjDo4tyHiNsOk9zOPI=;
 b=VwsuHaP3rH/Td5onn1ebqFwPhKIWU9JcZ+/EK0GUyzlbRvNKCn/ZdaiN9800Il+AID
 0hb06/fDB4jwB51AChU6sQJrMVlROUKt1/cMEXfSxmdBiKzeEdXSJRCU0runqfxkA6zT
 pYp9eCNGU+p0QmckbUejQCc4vYmD9qsu2B3EX9tbz2RMiZtiblYYHDeptCTFcO8Wh6Js
 rfdJ78C2pFhVwK8b3TLUmedtu37NvBHMnXlzx00oFL2O/mijVwqkZYX672R+8ea+biS2
 8J8Gu2s4Joa3XpCpWa6HT/kjiC8a1rDYNDrQEqe/yfRzYFuvi7NZemor9Bqdcl+fuISC
 c3Sg==
X-Gm-Message-State: ANoB5pmqNduH+7dfy76UKTy84MmLXkuA0Z95RNeqk+g/3kLkjTxCiHDj
 DI3fo6wUdfXF9mCCy4XM9D96NQ==
X-Google-Smtp-Source: AA0mqf4IPpRWwLxlal0k9xrrgKLbfEHpZ3zQV67F+SHkYSfXZj6tTpteJlLnOAgNKryBMythgIFJ4w==
X-Received: by 2002:a5d:4a52:0:b0:236:debd:bd65 with SMTP id
 v18-20020a5d4a52000000b00236debdbd65mr25491929wrs.527.1669472331211; 
 Sat, 26 Nov 2022 06:18:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bi25-20020a05600c3d9900b003cf4eac8e80sm10374227wmb.23.2022.11.26.06.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 06:18:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 431801FFB7;
 Sat, 26 Nov 2022 14:18:50 +0000 (GMT)
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
 <87lenyajba.fsf@linaro.org> <87fse63v9t.fsf@linaro.org>
 <CAJSP0QXaRrM3NGttNytsOZigF-SwiX4_H-j_6KHxS9VjOrPFkg@mail.gmail.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org, sgarzare@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for 7.2-rc? v2 0/5] continuing efforts to fix vhost-user
 issues
Date: Sat, 26 Nov 2022 14:12:58 +0000
In-reply-to: <CAJSP0QXaRrM3NGttNytsOZigF-SwiX4_H-j_6KHxS9VjOrPFkg@mail.gmail.com>
Message-ID: <87bkot4x4l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

> On Sat, 26 Nov 2022 at 04:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>
>> > Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>> >
>> >> Hi,
>> >>
>> > <snip>
>> >> I can replicate some of the other failures I've been seeing in CI by
>> >> running:
>> >>
>> >>   ../../meson/meson.py test --repeat 10 --print-errorlogs qtest-arm/q=
os-test
>> >>
>> >> however this seems to run everything in parallel and maybe is better
>> >> at exposing race conditions. Perhaps the CI system makes those races
>> >> easier to hit? Unfortunately I've not been able to figure out exactly
>> >> how things go wrong in the failure case.
>> >>
>> > <snip>
>> >
>> > There is a circular call - we are in vu_gpio_stop which triggers a wri=
te
>> > to vhost-user which allows us to catch a disconnect event:
>> >
>> >   #0 vhost_dev_is_started (hdev=3D0x557adf80d878) at
>> > /home/alex/lsrc/qemu.git/include/hw/virtio/vhost.h:199
>> >   #1  0x0000557adbe0518a in vu_gpio_stop (vdev=3D0x557adf80d640) at ..=
/../hw/virtio/vhost-user-gpio.c:138
>> >   #2 0x0000557adbe04d56 in vu_gpio_disconnect (dev=3D0x557adf80d640)
>> > at ../../hw/virtio/vhost-user-gpio.c:255
>> >   #3 0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640,
>> > event=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
>>
>> I suspect the best choice here is to schedule the cleanup as a later
>> date. Should I use the aio_bh one shots for this or maybe an rcu cleanup
>> event?
>>
>> Paolo, any suggestions?
>>
>> >   #4 0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10,
>> > event=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:61
>> >   #5 0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10,
>> > event=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:81
>> >   #6 0x0000557adc04f666 in tcp_chr_disconnect_locked
>> > (chr=3D0x557adea51f10) at ../../chardev/char-socket.c:470
>> >   #7 0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10,
>> > buf=3D0x7ffe8588cce0 "\v", len=3D20) at
>> > ../../chardev/char-socket.c:129
>
> Does this mean the backend closed the connection before receiving all
> the vhost-user protocol messages sent by QEMU?
>
> This looks like a backend bug. It prevents QEMU's vhost-user client
> from cleanly stopping the virtqueue (vhost_virtqueue_stop()).

Well the backend in this case is the qtest framework so not the worlds
most complete implementation.

> QEMU is still broken if it cannot handle disconnect at any time. Maybe
> a simple solution for that is to check for reentrancy (either by
> checking an existing variable or adding a new one to prevent
> vu_gpio_stop() from calling itself).

vhost-user-blk introduced an additional flag:

    /*
     * There are at least two steps of initialization of the
     * vhost-user device. The first is a "connect" step and
     * second is a "start" step. Make a separation between
     * those initialization phases by using two fields.
     */
    /* vhost_user_blk_connect/vhost_user_blk_disconnect */
    bool connected;
    /* vhost_user_blk_start/vhost_user_blk_stop */
    bool started_vu;

but that in itself is not enough. If you look at the various cases of
handling CHR_EVENT_CLOSED you'll see some schedule the shutdown with aio
and some don't even bother (so will probably break the same way).

Rather than have a mish-mash of solutions maybe we should introduce a
new vhost function - vhost_user_async_close() which can take care of the
scheduling and wrap it with a check for a valid vhost structure in case
it gets shutdown in the meantime?

>
>> >   #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f10,=
 buf=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=3D=
true) at ../../chardev/char.c:121
>> >   #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=3D=
0x7ffe8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c:173
>> >   #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d830=
, buf=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
>> >   #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, ms=
g=3D0x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.c:=
490
>> >   #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557adf8=
0d878, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
>> >   #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d878=
, vdev=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio/v=
host.c:1220
>> >   #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, vde=
v=3D0x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
>> >   #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at ..=
/../hw/virtio/vhost-user-gpio.c:142
>> >   #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640,=
 status=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
>> >   #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, =
val=3D15 '\017') at ../../hw/virtio/virtio.c:2442
>> >   #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80=
d640, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virti=
o.c:3736
>> >   #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3D=
RUN_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
>> >   #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, se=
nd_stop=3Dfalse) at ../../softmmu/cpus.c:262
>> >   #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
>> >   #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.=
c:827
>> >   #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main=
.c:38
>> >   #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at=
 ../../softmmu/main.c:48
>> >   (rr) p hdev->started
>> >   $9 =3D true
>> >   (rr) info thread
>> >     Id   Target Id                                Frame
>> >   * 1    Thread 2140414.2140414 (qemu-system-aar) vhost_dev_is_started=
 (hdev=3D0x557adf80d878) at /home/alex/lsrc/qemu.git/include/hw/virtio/vhos=
t.h:199
>> >     2    Thread 2140414.2140439 (qemu-system-aar) 0x0000000070000002 i=
n syscall_traced ()
>> >     3    Thread 2140414.2140442 (qemu-system-aar) 0x0000000070000002 i=
n syscall_traced ()
>> >     4    Thread 2140414.2140443 (qemu-system-aar) 0x0000000070000002 i=
n syscall_traced ()
>> >
>> > During which we eliminate the vhost_dev with a memset:
>> >
>> >   Thread 1 hit Hardware watchpoint 2: *(unsigned int *) 0x557adf80da30
>> >
>> >   Old value =3D 2
>> >   New value =3D 0
>> >   __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch/memse=
t-vec-unaligned-erms.S:220
>> >   Download failed: Invalid argument.  Continuing without source file .=
/string/../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S.
>> >   220     ../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S: No =
such file or directory.
>> >   (rr) bt
>> >   #0  __memset_avx2_unaligned_erms () at ../sysdeps/x86_64/multiarch/m=
emset-vec-unaligned-erms.S:220
>> >   #1  0x0000557adbdd67f8 in vhost_dev_cleanup (hdev=3D0x557adf80d878) =
at ../../hw/virtio/vhost.c:1501
>> >   #2  0x0000557adbe04d68 in vu_gpio_disconnect (dev=3D0x557adf80d640) =
at ../../hw/virtio/vhost-user-gpio.c:256
>> >   #3  0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640, ev=
ent=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
>> >   #4  0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10, event=3D=
CHR_EVENT_CLOSED) at ../../chardev/char.c:61
>> >   #5  0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10, eve=
nt=3DCHR_EVENT_CLOSED) at ../../chardev/char.c:81
>> >   #6  0x0000557adc04f666 in tcp_chr_disconnect_locked (chr=3D0x557adea=
51f10) at ../../chardev/char-socket.c:470
>> >   #7  0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10, buf=
=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-socket.c:129
>> >   #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f10,=
 buf=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=3D=
true) at ../../chardev/char.c:121
>> >   #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=3D=
0x7ffe8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c:173
>> >   #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d830=
, buf=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
>> >   #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, ms=
g=3D0x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.c:=
490
>> >   #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557adf8=
0d878, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
>> >   #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d878=
, vdev=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio/v=
host.c:1220
>> >   #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, vde=
v=3D0x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
>> >   #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at ..=
/../hw/virtio/vhost-user-gpio.c:142
>> >   #16 0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640,=
 status=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
>> >   #17 0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, =
val=3D15 '\017') at ../../hw/virtio/virtio.c:2442
>> >   #18 0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80=
d640, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virti=
o.c:3736
>> >   #19 0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3D=
RUN_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
>> >   #20 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, se=
nd_stop=3Dfalse) at ../../softmmu/cpus.c:262
>> >   #21 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
>> >   #22 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.=
c:827
>> >   #23 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main=
.c:38
>> >   #24 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at=
 ../../softmmu/main.c:48
>> >
>> > Before finally:
>> >
>> >   #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/r=
aise.c:50
>> >   #1  0x00007f24dc269537 in __GI_abort () at abort.c:79
>> >   #2  0x00007f24dc26940f in __assert_fail_base (fmt=3D0x7f24dc3e16a8 "=
%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3D0x557adc28d8f5 "ass=
ign || nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc28d7ab "../.=
./hw/virtio/virtio-pci.c", line=3D1029, function=3D<optimized out>) at asse=
rt.c:92
>> >   #3  0x00007f24dc278662 in __GI___assert_fail (assertion=3D0x557adc28=
d8f5 "assign || nvqs =3D=3D proxy->nvqs_with_notifiers", file=3D0x557adc28d=
7ab "../../hw/virtio/virtio-pci.c", line=3D1029, function=3D0x557adc28d922 =
"int virtio_pci_set_guest_notifiers(DeviceState *, int, _Bool)") at assert.=
c:101
>> >   #4  0x0000557adb8e97f1 in virtio_pci_set_guest_notifiers (d=3D0x557a=
df805280, nvqs=3D0, assign=3Dfalse) at ../../hw/virtio/virtio-pci.c:1029
>> >   #5  0x0000557adbe051c7 in vu_gpio_stop (vdev=3D0x557adf80d640) at ..=
/../hw/virtio/vhost-user-gpio.c:144
>> >   #6  0x0000557adbe04849 in vu_gpio_set_status (vdev=3D0x557adf80d640,=
 status=3D15 '\017') at ../../hw/virtio/vhost-user-gpio.c:173
>> >   #7  0x0000557adbdc87ff in virtio_set_status (vdev=3D0x557adf80d640, =
val=3D15 '\017') at ../../hw/virtio/virtio.c:2442
>> >   #8  0x0000557adbdcbfa0 in virtio_vmstate_change (opaque=3D0x557adf80=
d640, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN) at ../../hw/virtio/virti=
o.c:3736
>> >   #9  0x0000557adb91ad27 in vm_state_notify (running=3Dfalse, state=3D=
RUN_STATE_SHUTDOWN) at ../../softmmu/runstate.c:334
>> >   #10 0x0000557adb910e88 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, se=
nd_stop=3Dfalse) at ../../softmmu/cpus.c:262
>> >   #11 0x0000557adb910e30 in vm_shutdown () at ../../softmmu/cpus.c:280
>> >   #12 0x0000557adb91b9c3 in qemu_cleanup () at ../../softmmu/runstate.=
c:827
>> >   #13 0x0000557adb522975 in qemu_default_main () at ../../softmmu/main=
.c:38
>> >   #14 0x0000557adb5229a8 in main (argc=3D27, argv=3D0x7ffe8588d2f8) at=
 ../../softmmu/main.c:48
>> >
>> > Because of course we've just done that on disconnect.
>> >
>> > Not sure what the cleanest way to avoid that is yet. Maybe it will be
>> > clearer on Monday morning.
>>
>>
>> --
>> Alex Benn=C3=A9e
>>


--=20
Alex Benn=C3=A9e

