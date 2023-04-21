Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51636EB5B0
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 01:22:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq03x-0001Mw-7T; Fri, 21 Apr 2023 19:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pq03v-0001MZ-6y
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 19:21:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pq03s-0002LQ-A3
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 19:21:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50506ac462bso3292626a12.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 16:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682119262; x=1684711262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6geL9H1GDQQAGZFaYVtiFTl57JJYqvW6SWD5YAaQFqc=;
 b=dKmclr57dDEU55YK0v2EUqCkMd94AnaE5JQI4sHqtdT54gymF6wTQC3XCg8akSEVZ8
 8c6R62KVbU6/RyKCXIPXB7aDb4GfHF5mQ/XClvlkjH9IMrlpaQWhXgeZnEMZF56asV0Y
 Jd6A40O+qJVp7gELgd3EUGwzmk9knJjmAeOyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682119262; x=1684711262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6geL9H1GDQQAGZFaYVtiFTl57JJYqvW6SWD5YAaQFqc=;
 b=lKy1YbZbcTGH+G00c6VN2TJbT8nQkYWgRTMoQjxuLDyZ8mEZcT8LO2JtykRDLwy7Xu
 ZbjlRZ2rEBnqEIplE2n4WeaYeq0NiPiRfx3B1yOXm4iLyDx0RtGZ4QjlGmQsF/YIgCfA
 ZbWS9ZUeY0hsZK20tlNyqpwczsnHcjem0Rxc58ClLnpS/5Tfz8s5ItE3oIEvxk9pKOem
 j0umm5jl3toV1wVz/lZ1knH7IWvEAQFrxxz44aETwEgaxFSxvSf4H37yRY16GIVZtVNl
 oznWRvs1c83Ji7ABHfqzC/aTYOTkgE1bZEySYLXmNVXOzha/vdkB9f5uSHroIq5A2EJ1
 /+WQ==
X-Gm-Message-State: AAQBX9dmM77A4Uc9Ii71lmdQvylFYfKJqk4UgxWFo29egKPVneCVzttr
 j181XDcTe0Us9yGUG+5NqmrnKuYszlKTTCJpPfE=
X-Google-Smtp-Source: AKy350bKHjVjw8D99XfzuOv4DKB/NPj4Fx2URQGca/fuxFCgi/bkM901RkW9i9qahN/H4sV23ISeMQ==
X-Received: by 2002:a17:906:7686:b0:956:f4f8:23b6 with SMTP id
 o6-20020a170906768600b00956f4f823b6mr3795044ejm.43.1682119261615; 
 Fri, 21 Apr 2023 16:21:01 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 f10-20020a170906048a00b0094eeea5c649sm2625464eja.114.2023.04.21.16.21.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 16:21:01 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-506767f97f8so3762516a12.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 16:21:01 -0700 (PDT)
X-Received: by 2002:a50:a449:0:b0:504:e957:2926 with SMTP id
 v9-20020a50a449000000b00504e9572926mr2629388edb.1.1682119260491; Fri, 21 Apr
 2023 16:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <20230421011223.718-14-gurchetansingh@chromium.org>
 <CAJSP0QWLOmTG2SSzQwhkSf0++VT5y3NBTnVURuHG=PQi-vss5g@mail.gmail.com>
In-Reply-To: <CAJSP0QWLOmTG2SSzQwhkSf0++VT5y3NBTnVURuHG=PQi-vss5g@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 21 Apr 2023 16:20:47 -0700
X-Gmail-Original-Message-ID: <CAAfnVBmth4wq==Qi-=YaVx9cLz2LokNbFyvLwk11dTacZ+-YKQ@mail.gmail.com>
Message-ID: <CAAfnVBmth4wq==Qi-=YaVx9cLz2LokNbFyvLwk11dTacZ+-YKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 13/13] HACK: schedule fence return on main AIO context
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org, 
 david@redhat.com, stefanha@redhat.com, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com, 
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=gurchetansingh@chromium.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Apr 21, 2023 at 9:00=E2=80=AFAM Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
>
> On Thu, 20 Apr 2023 at 21:13, Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > gfxstream and both cross-domain (and even newer versions
> > virglrenderer: see VIRGL_RENDERER_ASYNC_FENCE_CB) like to signal
> > fence completion on threads ("callback threads") that are
> > different from the thread that processes the command queue
> > ("main thread").
> >
> > This is generally possible with locking, and this what we do
> > in crosvm and other virtio-gpu1.1 implementations.  However, on
> > QEMU a deadlock is observed if virtio_gpu_ctrl_response_nodata(..)
> > [used in the fence callback] is used from a thread that is not the
> > main thread.
> >
> > The reason is the main thread takes the big QEMU lock (bql) somewhere
> > when processing the command queue, and virtio_gpu_ctrl_response_nodata(=
..)
> > needs that lock.  If you add in the lock needed to protect &g->fenceq
> > from concurrent access by the main thread and the callback threads,
> > you end can end up with deadlocks.
> >
> > It's possible to workaround this by scheduling the return of the fence
> > descriptors via aio_bh_schedule_oneshot_full(..), but that somewhat
> > negates the rationale for the asynchronous callbacks.
> >
> > I also played around with aio_context_acquire()/aio_context_release(),
> > doesn't seem to help.
> >
> > Is signaling the virtio_queue outside of the main thread possible?  If
> > so, how?
>
> Yes, if you want a specific thread to process a virtqueue, monitor the
> virtqueue's host_notifier (aka ioeventfd) from the thread. That's how
> --device virtio-blk,iothread=3D works. It attaches the host_notifier to
> the IOThread's AioContext. Whenever the guest kicks the virtqueue, the
> IOThread will respond instead of QEMU's main loop thread.
>
> That said, I don't know the threading model of your code. Could you
> explain which threads are involved? Do you want to process all buffers
> from virtqueue in a specific thread or only these fence buffers?

Only the fence callback would be signalled via these callback threads.
The virtqueue would not be processed by the callback thread.

There can be multiple callback threads: for example, one for the
gfxstream context and another for the Wayland context.  These threads
could be a C++ thread, a Rust thread or any other.

The strategy used by crosvm is to have a mutex around the fence state
to synchronize between multiple callback threads (which signal fences)
and main thread (which generates fences).

I tried to use aio_context_acquire(..)/aio_context_release(..) to
synchronize these threads, but that results in a deadlock.  I think
those functions may assume an IOThread and not necessarily any thread.
It seems aio_context_acquire(..) succeeds for the callback thread
though.

Here's what tried (rather than this patch which works, but is less
ideal than the solution below):

diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-gpu-rutab=
aga.c
index 196267aac2..0993b09090 100644
--- a/hw/display/virtio-gpu-rutabaga.c
+++ b/hw/display/virtio-gpu-rutabaga.c
@@ -798,6 +798,7 @@ virtio_gpu_rutabaga_process_cmd(VirtIOGPU *g,
     }

     if (cmd->finished) {
+        g_free(cmd);
         return;
     }
     if (cmd->error) {
@@ -811,6 +812,8 @@ virtio_gpu_rutabaga_process_cmd(VirtIOGPU *g,
         return;
     }

+    QTAILQ_INSERT_TAIL(&g->fenceq, cmd, next);
+
     fence.flags =3D cmd->cmd_hdr.flags;
     fence.ctx_id =3D cmd->cmd_hdr.ctx_id;
     fence.fence_id =3D cmd->cmd_hdr.fence_id;
@@ -827,9 +830,11 @@ virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
                              struct rutabaga_fence fence_data)
 {
     VirtIOGPU *g =3D (VirtIOGPU *)(void*)(uintptr_t)user_data;
+    GET_VIRTIO_GPU_GL(g);
     struct virtio_gpu_ctrl_command *cmd, *tmp;

     bool signaled_ctx_specific =3D fence_data.flags &
RUTABAGA_FLAG_INFO_RING_IDX;
+    aio_context_acquire(virtio_gpu->ctx);

     QTAILQ_FOREACH_SAFE(cmd, &g->fenceq, next, tmp) {
         /*
@@ -856,6 +861,7 @@ virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
         QTAILQ_REMOVE(&g->fenceq, cmd, next);
         g_free(cmd);
     }
+    aio_context_release(virtio_gpu->ctx);
 }

 static int virtio_gpu_rutabaga_init(VirtIOGPU *g)
@@ -912,6 +918,7 @@ static int virtio_gpu_rutabaga_init(VirtIOGPU *g)
         free(channels.channels);
     }

+    virtio_gpu->ctx =3D qemu_get_aio_context();
     return result;
 }

@@ -942,6 +949,30 @@ static int
virtio_gpu_rutabaga_get_num_capsets(VirtIOGPU *g)
     return (int)(num_capsets);
 }

+static void virtio_gpu_rutabaga_process_cmdq(VirtIOGPU *g)
+{
+    struct virtio_gpu_ctrl_command *cmd;
+    VirtIOGPUClass *vgc =3D VIRTIO_GPU_GET_CLASS(g);
+
+    if (g->processing_cmdq) {
+        return;
+    }
+    g->processing_cmdq =3D true;
+    while (!QTAILQ_EMPTY(&g->cmdq)) {
+        cmd =3D QTAILQ_FIRST(&g->cmdq);
+
+        if (g->parent_obj.renderer_blocked) {
+            break;
+        }
+
+        QTAILQ_REMOVE(&g->cmdq, cmd, next);
+
+        /* process command */
+        vgc->process_cmd(g, cmd);
+    }
+    g->processing_cmdq =3D false;
+}
+
 static void virtio_gpu_rutabaga_handle_ctrl(VirtIODevice *vdev, VirtQueue =
*vq)
 {
     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
@@ -972,7 +1003,7 @@ static void
virtio_gpu_rutabaga_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         cmd =3D virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
     }

-    virtio_gpu_process_cmdq(g);
+    virtio_gpu_rutabaga_process_cmdq(g);
 }

 void virtio_gpu_rutabaga_device_realize(DeviceState *qdev, Error **errp)
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.=
h
index 034c71e8f5..b33ad0c68f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -225,6 +225,7 @@ struct VirtIOGPUGL {
     char *wayland_socket_path;
     uint32_t num_capsets;
     void *rutabaga;
+    AioContext *ctx;
 };

 struct VhostUserGPU {

---------------------------------------------------------------------------=
-----------------------------

Main Thread deadlocked with above patch:

[Switching to thread 1 (Thread 0x7ffff5ced600 (LWP 8584))]
#0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x5555569893a0
<qemu_global_mutex>) at ../sysdeps/nptl/futex-internal.h:146
146 in ../sysdeps/nptl/futex-internal.h
(gdb) bt
#0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x5555569893a0
<qemu_global_mutex>) at ../sysdeps/nptl/futex-internal.h:146
#1  __GI___lll_lock_wait (futex=3Dfutex@entry=3D0x5555569893a0
<qemu_global_mutex>, private=3D0) at ./nptl/lowlevellock.c:49
#2  0x00007ffff7098082 in lll_mutex_lock_optimized
(mutex=3D0x5555569893a0 <qemu_global_mutex>) at
./nptl/pthread_mutex_lock.c:48
#3  ___pthread_mutex_lock (mutex=3D0x5555569893a0 <qemu_global_mutex>)
at ./nptl/pthread_mutex_lock.c:93
#4  0x00005555560019da in qemu_mutex_lock_impl (mutex=3D0x5555569893a0
<qemu_global_mutex>, file=3D0x55555626eaeb "../util/main-loop.c",
line=3D311) at ../util/qemu-thread-posix.c:94
#5  0x0000555555afdf2d in qemu_mutex_lock_iothread_impl
(file=3D0x55555626eaeb "../util/main-loop.c", line=3D311) at
../softmmu/cpus.c:504
#6  0x000055555601c39e in os_host_main_loop_wait (timeout=3D1471024) at
../util/main-loop.c:311
#7  0x000055555601c4bd in main_loop_wait (nonblocking=3D0) at
../util/main-loop.c:592
#8  0x0000555555b070a3 in qemu_main_loop () at ../softmmu/runstate.c:731
#9  0x0000555555e11dbd in qemu_default_main () at ../softmmu/main.c:37
#10 0x0000555555e11df7 in main (argc=3D23, argv=3D0x7fffffffde28) at
../softmmu/main.c:48

Callback Thread deadlocked with above patch:

[Switching to thread 56 (Thread 0x7ffd2c9ff640 (LWP 8649))]
#0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x5555569893a0
<qemu_global_mutex>) at ../sysdeps/nptl/futex-internal.h:146
146 in ../sysdeps/nptl/futex-internal.h
(gdb) bt
#0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x5555569893a0
<qemu_global_mutex>) at ../sysdeps/nptl/futex-internal.h:146
#1  __GI___lll_lock_wait (futex=3Dfutex@entry=3D0x5555569893a0
<qemu_global_mutex>, private=3D0) at ./nptl/lowlevellock.c:49
#2  0x00007ffff7098082 in lll_mutex_lock_optimized
(mutex=3D0x5555569893a0 <qemu_global_mutex>) at
./nptl/pthread_mutex_lock.c:48
#3  ___pthread_mutex_lock (mutex=3D0x5555569893a0 <qemu_global_mutex>)
at ./nptl/pthread_mutex_lock.c:93
#4  0x00005555560019da in qemu_mutex_lock_impl (mutex=3D0x5555569893a0
<qemu_global_mutex>, file=3D0x5555561df60c "../softmmu/physmem.c",
line=3D2581) at ../util/qemu-thread-posix.c:94
#5  0x0000555555afdf2d in qemu_mutex_lock_iothread_impl
(file=3D0x5555561df60c "../softmmu/physmem.c", line=3D2581) at
../softmmu/cpus.c:504
#6  0x0000555555d69a1a in prepare_mmio_access (mr=3D0x555556c10ca0) at
../softmmu/physmem.c:2581
#7  0x0000555555d6b7a8 in address_space_stl_internal
(as=3D0x5555578270f8, addr=3D4276125700, val=3D33, attrs=3D..., result=3D0x=
0,
endian=3DDEVICE_LITTLE_ENDIAN) at
/home/lenovo/qemu/memory_ldst.c.inc:318
#8  0x0000555555d6b91d in address_space_stl_le (as=3D0x5555578270f8,
addr=3D4276125700, val=3D33, attrs=3D..., result=3D0x0) at
/home/lenovo/qemu/memory_ldst.c.inc:357
#9  0x0000555555a0657c in pci_msi_trigger (dev=3D0x555557826ec0,
msg=3D...) at ../hw/pci/pci.c:356
#10 0x0000555555a02a5a in msi_send_message (dev=3D0x555557826ec0,
msg=3D...) at ../hw/pci/msi.c:379
#11 0x0000555555a045a0 in msix_notify (dev=3D0x555557826ec0, vector=3D1)
at ../hw/pci/msix.c:542
#12 0x0000555555ac8780 in virtio_pci_notify (d=3D0x555557826ec0,
vector=3D1) at ../hw/virtio/virtio-pci.c:77
#13 0x0000555555d15ddc in virtio_notify_vector (vdev=3D0x55555783ffd0,
vector=3D1) at ../hw/virtio/virtio.c:1985
#14 0x0000555555d17393 in virtio_irq (vq=3D0x555558716d80) at
../hw/virtio/virtio.c:2461
#15 0x0000555555d17439 in virtio_notify (vdev=3D0x55555783ffd0,
vq=3D0x555558716d80) at ../hw/virtio/virtio.c:2473
#16 0x0000555555b98732 in virtio_gpu_ctrl_response (g=3D0x55555783ffd0,
cmd=3D0x7ffdd80068b0, resp=3D0x7ffd2c9fe150, resp_len=3D24) at
../hw/display/virtio-gpu.c:177
#17 0x0000555555b9879c in virtio_gpu_ctrl_response_nodata
(g=3D0x55555783ffd0, cmd=3D0x7ffdd80068b0, type=3DVIRTIO_GPU_RESP_OK_NODATA=
)
at ../hw/display/virtio-gpu.c:189
#18 0x0000555555ba6b82 in virtio_gpu_rutabaga_fence_cb
(user_data=3D93825028849616, fence_data=3D...) at
../hw/display/virtio-gpu-rutabaga.c:860
#19 0x00007ffff75b9381 in
_ZN131_$LT$rutabaga_gfx..rutabaga_utils..RutabagaFenceClosure$LT$T$GT$$u20$=
as$u20$rutabaga_gfx..rutabaga_utils..RutabagaFenceCallback$GT$4call17hcbf1b=
4ac094a2a60E.llvm.14356420492591683714
() at /usr/local/lib/librutabaga_gfx_ffi.so
#20 0x00007ffff75d501b in
rutabaga_gfx::cross_domain::cross_domain::CrossDomainWorker::run () at
/usr/local/lib/librutabaga_gfx_ffi.so
#21 0x00007ffff75dd651 in
std::sys_common::backtrace::__rust_begin_short_backtrace () at
/usr/local/lib/librutabaga_gfx_ffi.so
#22 0x00007ffff75c62ba in
core::ops::function::FnOnce::call_once{{vtable.shim}} () at
/usr/local/lib/librutabaga_gfx_ffi.so
#23 0x00007ffff75e3b73 in alloc::boxed::{impl#44}::call_once<(), dyn
core::ops::function::FnOnce<(), Output=3D()>, alloc::alloc::Global>
(self=3D..., args=3D()) at library/alloc/src/boxed.rs:1940
#24 alloc::boxed::{impl#44}::call_once<(), alloc::boxed::Box<dyn
core::ops::function::FnOnce<(), Output=3D()>, alloc::alloc::Global>,
alloc::alloc::Global> (self=3D0x5555572e27d0, args=3D())
    at library/alloc/src/boxed.rs:1940
#25 std::sys::unix::thread::{impl#2}::new::thread_start
(main=3D0x5555572e27d0) at library/std/src/sys/unix/thread.rs:108
#26 0x00007ffff7094b43 in start_thread (arg=3D<optimized out>) at
./nptl/pthread_create.c:442
#27 0x00007ffff7126a00 in clone3 () at
../sysdeps/unix/sysv/linux/x86_64/clone3.S:81

>
>
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > ---
> >  hw/display/virtio-gpu-rutabaga.c | 29 ++++++++++++++++++++++++++---
> >  include/hw/virtio/virtio-gpu.h   |  1 +
> >  2 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-gpu-r=
utabaga.c
> > index 196267aac2..5c296aeef1 100644
> > --- a/hw/display/virtio-gpu-rutabaga.c
> > +++ b/hw/display/virtio-gpu-rutabaga.c
> > @@ -31,6 +31,11 @@ static int virtio_gpu_rutabaga_init(VirtIOGPU *g);
> >
> >  #define CHECK_RESULT(result, cmd) CHECK(result =3D=3D 0, cmd)
> >
> > +struct rutabaga_aio_data {
> > +    struct VirtIOGPUGL *virtio_gpu;
> > +    struct rutabaga_fence fence;
> > +};
> > +
> >  static void
> >  virtio_gpu_rutabaga_update_cursor(VirtIOGPU *g, struct virtio_gpu_scan=
out *s,
> >                                    uint32_t resource_id)
> > @@ -823,10 +828,11 @@ virtio_gpu_rutabaga_process_cmd(VirtIOGPU *g,
> >  }
> >
> >  static void
> > -virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
> > -                             struct rutabaga_fence fence_data)
> > +virtio_gpu_rutabaga_aio_cb(void *opaque)
> >  {
> > -    VirtIOGPU *g =3D (VirtIOGPU *)(void*)(uintptr_t)user_data;
> > +    struct rutabaga_aio_data *data =3D  (struct rutabaga_aio_data *)op=
aque;
> > +    VirtIOGPU *g =3D (VirtIOGPU *)data->virtio_gpu;
> > +    struct rutabaga_fence fence_data =3D data->fence;
> >      struct virtio_gpu_ctrl_command *cmd, *tmp;
> >
> >      bool signaled_ctx_specific =3D fence_data.flags & RUTABAGA_FLAG_IN=
FO_RING_IDX;
> > @@ -856,6 +862,22 @@ virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
> >          QTAILQ_REMOVE(&g->fenceq, cmd, next);
> >          g_free(cmd);
> >      }
> > +
> > +    g_free(data);
> > +}
> > +
> > +static void
> > +virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
> > +                             struct rutabaga_fence fence_data) {
> > +    struct rutabaga_aio_data *data;
> > +    VirtIOGPU *g =3D (VirtIOGPU *)(void*)(uintptr_t)user_data;
> > +    GET_VIRTIO_GPU_GL(g);
> > +
> > +    data =3D g_new0(struct rutabaga_aio_data, 1);
> > +    data->virtio_gpu =3D virtio_gpu;
> > +    data->fence =3D fence_data;
> > +    aio_bh_schedule_oneshot_full(virtio_gpu->ctx, virtio_gpu_rutabaga_=
aio_cb,
> > +                                 (void *)data, "aio");
> >  }
> >
> >  static int virtio_gpu_rutabaga_init(VirtIOGPU *g)
> > @@ -912,6 +934,7 @@ static int virtio_gpu_rutabaga_init(VirtIOGPU *g)
> >          free(channels.channels);
> >      }
> >
> > +    virtio_gpu->ctx =3D qemu_get_aio_context();
> >      return result;
> >  }
> >
> > diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-=
gpu.h
> > index 034c71e8f5..b33ad0c68f 100644
> > --- a/include/hw/virtio/virtio-gpu.h
> > +++ b/include/hw/virtio/virtio-gpu.h
> > @@ -225,6 +225,7 @@ struct VirtIOGPUGL {
> >      char *wayland_socket_path;
> >      uint32_t num_capsets;
> >      void *rutabaga;
> > +    AioContext *ctx;
> >  };
> >
> >  struct VhostUserGPU {
> > --
> > 2.40.0.634.g4ca3ef3211-goog
> >
> >

