Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114486EE19A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:06:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prHPC-0007Xl-Hs; Tue, 25 Apr 2023 08:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1prHP9-0007XG-Rf
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:04:19 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1prHP7-0000OG-OI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:04:19 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-54f99770f86so66505357b3.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682424255; x=1685016255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzQcIx1ucV90aXtMXQDJAOIaoBU9L/xFsItClPsx5/o=;
 b=eFyduYhm8KWUEgg8WssH8rVTUZRwiMhU+YSKKYFD+fyEnWdbCf58SLVB6roNpxyhuh
 6iR5QkirdWT5mk99CYlCgZ0e3kJuO6Rz7WSsOl1pj4eiRwgjfVL8T+zHXo3iQxiLMCOL
 rs737wBhQbJ3v7cyxm0PMyydYQX6aq76sgm0CxvVEmW4KVLfAgEn1am3iBMcsEh7Bjlu
 sOLKVA4H/YTHOxv6n2JM1IAg13h6D5iA/eo6o8nmshaRHFjev+SR8dMIoDzCJ5yGJbcH
 L5MNrCNY6GeZAPYQX7XZw8XyppFbRsfCpzYjf48YYL3LHiRpvLJ5wdQaf4nJFyVQaeSP
 RjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682424255; x=1685016255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DzQcIx1ucV90aXtMXQDJAOIaoBU9L/xFsItClPsx5/o=;
 b=SBsb5yJWiPe33Aj9sc84zGdHDoek4wpy3UGxorGUMVJ6TMTHpwxiBcdSVCE3lg1FVI
 nv3SfZEBfV+Tpb7F8YRYocS24LboJgEdS2mP+6yr792C5otJm5yUe0gppnDdSwKk2hi7
 r7wvM41nA2dGP2gVZQjkYtOJewMSSHyrDbjL0mCD1wpIeHVKBp1qXAkLhibkmXa5CD2u
 Iwy7ILoKuAR7ec5f97bE9I1T38F8/QGZlx3SCWEq9pytTOHpg87CpIhCmgk/fV8iwi4m
 9UbimqvQpQEB1kXmpGK+VIQ6rayNQ55jFS+wcln9vneODg7LqkrcFk33sYo+45nylJzM
 oAFg==
X-Gm-Message-State: AAQBX9e+9+DRA9GgdACz3THJFr2vVCFiOiugv1mAzK2fQeN6cKAjVZ/8
 N8ntLoWqvvCzPT5FKhhtQdbnzyAmMHaAlYr3HMM=
X-Google-Smtp-Source: AKy350a5GbXhCKYp7RUsnOxJO01nhaNt8ArJDtZhdW9eWPMZknVUh0Lp7E+wLLFvWUm5tD8gRn4HxgRGmbfXfnzC/+4=
X-Received: by 2002:a81:7dc1:0:b0:541:9b48:523a with SMTP id
 y184-20020a817dc1000000b005419b48523amr10652169ywc.15.1682424255460; Tue, 25
 Apr 2023 05:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <20230421011223.718-14-gurchetansingh@chromium.org>
 <CAJSP0QWLOmTG2SSzQwhkSf0++VT5y3NBTnVURuHG=PQi-vss5g@mail.gmail.com>
 <CAAfnVBmth4wq==Qi-=YaVx9cLz2LokNbFyvLwk11dTacZ+-YKQ@mail.gmail.com>
In-Reply-To: <CAAfnVBmth4wq==Qi-=YaVx9cLz2LokNbFyvLwk11dTacZ+-YKQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 25 Apr 2023 08:04:03 -0400
Message-ID: <CAJSP0QW+SrREcdXYtKm_dBjxC8+qNBENJMCXC+ana6ALLcL1Aw@mail.gmail.com>
Subject: Re: [RFC PATCH 13/13] HACK: schedule fence return on main AIO context
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org, 
 david@redhat.com, stefanha@redhat.com, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com, 
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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

On Fri, 21 Apr 2023 at 19:21, Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> On Fri, Apr 21, 2023 at 9:00=E2=80=AFAM Stefan Hajnoczi <stefanha@gmail.c=
om> wrote:
> >
> > On Thu, 20 Apr 2023 at 21:13, Gurchetan Singh
> > <gurchetansingh@chromium.org> wrote:
> > >
> > > gfxstream and both cross-domain (and even newer versions
> > > virglrenderer: see VIRGL_RENDERER_ASYNC_FENCE_CB) like to signal
> > > fence completion on threads ("callback threads") that are
> > > different from the thread that processes the command queue
> > > ("main thread").
> > >
> > > This is generally possible with locking, and this what we do
> > > in crosvm and other virtio-gpu1.1 implementations.  However, on
> > > QEMU a deadlock is observed if virtio_gpu_ctrl_response_nodata(..)
> > > [used in the fence callback] is used from a thread that is not the
> > > main thread.
> > >
> > > The reason is the main thread takes the big QEMU lock (bql) somewhere
> > > when processing the command queue, and virtio_gpu_ctrl_response_nodat=
a(..)
> > > needs that lock.  If you add in the lock needed to protect &g->fenceq
> > > from concurrent access by the main thread and the callback threads,
> > > you end can end up with deadlocks.
> > >
> > > It's possible to workaround this by scheduling the return of the fenc=
e
> > > descriptors via aio_bh_schedule_oneshot_full(..), but that somewhat
> > > negates the rationale for the asynchronous callbacks.
> > >
> > > I also played around with aio_context_acquire()/aio_context_release()=
,
> > > doesn't seem to help.
> > >
> > > Is signaling the virtio_queue outside of the main thread possible?  I=
f
> > > so, how?
> >
> > Yes, if you want a specific thread to process a virtqueue, monitor the
> > virtqueue's host_notifier (aka ioeventfd) from the thread. That's how
> > --device virtio-blk,iothread=3D works. It attaches the host_notifier to
> > the IOThread's AioContext. Whenever the guest kicks the virtqueue, the
> > IOThread will respond instead of QEMU's main loop thread.
> >
> > That said, I don't know the threading model of your code. Could you
> > explain which threads are involved? Do you want to process all buffers
> > from virtqueue in a specific thread or only these fence buffers?
>
> Only the fence callback would be signalled via these callback threads.
> The virtqueue would not be processed by the callback thread.
>
> There can be multiple callback threads: for example, one for the
> gfxstream context and another for the Wayland context.  These threads
> could be a C++ thread, a Rust thread or any other.
>
> The strategy used by crosvm is to have a mutex around the fence state
> to synchronize between multiple callback threads (which signal fences)
> and main thread (which generates fences).
>
> I tried to use aio_context_acquire(..)/aio_context_release(..) to
> synchronize these threads, but that results in a deadlock.  I think
> those functions may assume an IOThread and not necessarily any thread.
> It seems aio_context_acquire(..) succeeds for the callback thread
> though.
>
> Here's what tried (rather than this patch which works, but is less
> ideal than the solution below):

I don't have time to study the code and understand the threading
model, but one thing stood out:

> Callback Thread deadlocked with above patch:
>
> [Switching to thread 56 (Thread 0x7ffd2c9ff640 (LWP 8649))]
> #0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x5555569893a0
> <qemu_global_mutex>) at ../sysdeps/nptl/futex-internal.h:146
> 146 in ../sysdeps/nptl/futex-internal.h
> (gdb) bt
> #0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x5555569893a0
> <qemu_global_mutex>) at ../sysdeps/nptl/futex-internal.h:146
> #1  __GI___lll_lock_wait (futex=3Dfutex@entry=3D0x5555569893a0
> <qemu_global_mutex>, private=3D0) at ./nptl/lowlevellock.c:49
> #2  0x00007ffff7098082 in lll_mutex_lock_optimized
> (mutex=3D0x5555569893a0 <qemu_global_mutex>) at
> ./nptl/pthread_mutex_lock.c:48
> #3  ___pthread_mutex_lock (mutex=3D0x5555569893a0 <qemu_global_mutex>)
> at ./nptl/pthread_mutex_lock.c:93
> #4  0x00005555560019da in qemu_mutex_lock_impl (mutex=3D0x5555569893a0
> <qemu_global_mutex>, file=3D0x5555561df60c "../softmmu/physmem.c",
> line=3D2581) at ../util/qemu-thread-posix.c:94
> #5  0x0000555555afdf2d in qemu_mutex_lock_iothread_impl
> (file=3D0x5555561df60c "../softmmu/physmem.c", line=3D2581) at
> ../softmmu/cpus.c:504
> #6  0x0000555555d69a1a in prepare_mmio_access (mr=3D0x555556c10ca0) at
> ../softmmu/physmem.c:2581
> #7  0x0000555555d6b7a8 in address_space_stl_internal
> (as=3D0x5555578270f8, addr=3D4276125700, val=3D33, attrs=3D..., result=3D=
0x0,
> endian=3DDEVICE_LITTLE_ENDIAN) at
> /home/lenovo/qemu/memory_ldst.c.inc:318
> #8  0x0000555555d6b91d in address_space_stl_le (as=3D0x5555578270f8,
> addr=3D4276125700, val=3D33, attrs=3D..., result=3D0x0) at
> /home/lenovo/qemu/memory_ldst.c.inc:357
> #9  0x0000555555a0657c in pci_msi_trigger (dev=3D0x555557826ec0,
> msg=3D...) at ../hw/pci/pci.c:356
> #10 0x0000555555a02a5a in msi_send_message (dev=3D0x555557826ec0,
> msg=3D...) at ../hw/pci/msi.c:379
> #11 0x0000555555a045a0 in msix_notify (dev=3D0x555557826ec0, vector=3D1)
> at ../hw/pci/msix.c:542
> #12 0x0000555555ac8780 in virtio_pci_notify (d=3D0x555557826ec0,
> vector=3D1) at ../hw/virtio/virtio-pci.c:77
> #13 0x0000555555d15ddc in virtio_notify_vector (vdev=3D0x55555783ffd0,
> vector=3D1) at ../hw/virtio/virtio.c:1985
> #14 0x0000555555d17393 in virtio_irq (vq=3D0x555558716d80) at
> ../hw/virtio/virtio.c:2461
> #15 0x0000555555d17439 in virtio_notify (vdev=3D0x55555783ffd0,
> vq=3D0x555558716d80) at ../hw/virtio/virtio.c:2473
> #16 0x0000555555b98732 in virtio_gpu_ctrl_response (g=3D0x55555783ffd0,
> cmd=3D0x7ffdd80068b0, resp=3D0x7ffd2c9fe150, resp_len=3D24) at
> ../hw/display/virtio-gpu.c:177
> #17 0x0000555555b9879c in virtio_gpu_ctrl_response_nodata
> (g=3D0x55555783ffd0, cmd=3D0x7ffdd80068b0, type=3DVIRTIO_GPU_RESP_OK_NODA=
TA)
> at ../hw/display/virtio-gpu.c:189
> #18 0x0000555555ba6b82 in virtio_gpu_rutabaga_fence_cb
> (user_data=3D93825028849616, fence_data=3D...) at
> ../hw/display/virtio-gpu-rutabaga.c:860
> #19 0x00007ffff75b9381 in
> _ZN131_$LT$rutabaga_gfx..rutabaga_utils..RutabagaFenceClosure$LT$T$GT$$u2=
0$as$u20$rutabaga_gfx..rutabaga_utils..RutabagaFenceCallback$GT$4call17hcbf=
1b4ac094a2a60E.llvm.14356420492591683714
> () at /usr/local/lib/librutabaga_gfx_ffi.so
> #20 0x00007ffff75d501b in
> rutabaga_gfx::cross_domain::cross_domain::CrossDomainWorker::run () at
> /usr/local/lib/librutabaga_gfx_ffi.so
> #21 0x00007ffff75dd651 in
> std::sys_common::backtrace::__rust_begin_short_backtrace () at
> /usr/local/lib/librutabaga_gfx_ffi.so
> #22 0x00007ffff75c62ba in
> core::ops::function::FnOnce::call_once{{vtable.shim}} () at
> /usr/local/lib/librutabaga_gfx_ffi.so
> #23 0x00007ffff75e3b73 in alloc::boxed::{impl#44}::call_once<(), dyn
> core::ops::function::FnOnce<(), Output=3D()>, alloc::alloc::Global>
> (self=3D..., args=3D()) at library/alloc/src/boxed.rs:1940
> #24 alloc::boxed::{impl#44}::call_once<(), alloc::boxed::Box<dyn
> core::ops::function::FnOnce<(), Output=3D()>, alloc::alloc::Global>,
> alloc::alloc::Global> (self=3D0x5555572e27d0, args=3D())
>     at library/alloc/src/boxed.rs:1940
> #25 std::sys::unix::thread::{impl#2}::new::thread_start
> (main=3D0x5555572e27d0) at library/std/src/sys/unix/thread.rs:108
> #26 0x00007ffff7094b43 in start_thread (arg=3D<optimized out>) at
> ./nptl/pthread_create.c:442
> #27 0x00007ffff7126a00 in clone3 () at
> ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81

This Rust thread is calling QEMU emulation code that is not designed
to run outside the big QEMU lock (virtio_notify()).

I think prepare_mmio_access() is deadlocking on the big QEMU lock.
Another thread must be holding it (maybe waiting for this thread?) and
therefore the hang occurs.

Also, there is some additional setup like rcu_register_thread() that
may also be missing in this Rust thread.

The conservative approach is to only call QEMU emulation functions
like virtio_notify() from a QEMU thread. Some parts of QEMU are
thread-safe and don't need the big QEMU lock, but that requires
carefully calling only safe functions and at first glance I guess this
patch series isn't doing that.

Stefan

