Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96FA586C2C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:43:31 +0200 (CEST)
Received: from localhost ([::1]:37866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVhi-0007qb-SP
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIVP0-0006b1-G8
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:24:10 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIVOy-0000ix-5t
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:24:10 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-32269d60830so108828087b3.2
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=ALZfiIhtNvhxBW+ssFSSIVU1zq4yib4ZT8KVIOlJV5M=;
 b=D02S98ai1vvP0BtVZzkb+Lp8Hn29NShuw/xZTS74kwjCiHMTL4gFdKTPb/SWMA+lVr
 3bfh0MpSWvyvyVOcoOp3Lq/NtaS4TN26RuFUbCtcn6PRy2qjzAzLLnf1kUmnQgW2Icdx
 PWN4czwc2AnIPNXweki7ndAmYLFYAZN1LKAeUP0JnGSQkAOEyTyuStrEAaudfp5uk3et
 FEBB103VARIAAEGmxIl+Y7rMK1ZpxErtEKLJ7d3K/qPXsIvr/vrqGNYcOFYcKSxyhPxS
 hx8lRZx6BwSa6im5HOyRe+GE3lUc/jGMKuPY6KL4mvjrqYanVFI6j8KyoOiwI7rRfV3h
 G6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=ALZfiIhtNvhxBW+ssFSSIVU1zq4yib4ZT8KVIOlJV5M=;
 b=C+EGWjCbNbG1Ph3lPROPX0PTINxwaS063MIShu2mFoofhD2D/7tPiKSM4ZTborHpRW
 NIw812FVAznfx94h8lBhf5+B0fdwOkZ8PKFNEKruKLLccE/vqWbQscb548Cc3c3NA0J+
 dLPVolnOnx92szQPiRmpEkquNl9I7W5o9Wm4g6LlNygktKNrAttrxdny9B1H2UHbv5Ol
 EaGmOkQ5+EtDXrZFZNIhGtMzQhi9DRMW90vb5p57+eYHBLrsOj+sKWnTi5YYmF25r1y8
 xiyPd+12W2ZAHexbQpLRbwkgjDjVnoCT57VpFZslqm5ITDM1zcA7+lCa7/z1GTUtLNIV
 Y0RQ==
X-Gm-Message-State: ACgBeo3FkKUZaV87jhDNeUSisiUm3hSFs82oA1LTtXeJwC+FEo5dEy0E
 U7W4ctCn6T7oykfCZVWi3hDoDjf4RMXhDGqaDC2T8PzdeG0=
X-Google-Smtp-Source: AA6agR5C8oBhWAm1kJOtS7/Hnb8YDFqfth0cPCxrLV0Vsg0kj0hH52newErYZI8AE3W/EXRHcGd5HPEMeyZ6innuYYk=
X-Received: by 2002:a81:8396:0:b0:322:ed8f:9bdf with SMTP id
 t144-20020a818396000000b00322ed8f9bdfmr13402704ywf.455.1659360246152; Mon, 01
 Aug 2022 06:24:06 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 14:23:55 +0100
Message-ID: <CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com>
Subject: race condition in display device caused by run_on_cpu() dropping the
 iothread lock
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've been debugging a segfault in the raspi3b display device, and I've
tracked it down to a race condition, but I'm not sure what the right
way to fix it is...

The race is that a vCPU thread is handling a guest register write that
says "resize the framebuffer", which it implements by calling
qemu_console_resize(). This ends up doing a qemu_free_displaysurface()
on the old surface and creating a new one.  However, at the same time,
the iothread is in gui_update(), which ends up calling the display
device gfx_update method. This code is thus actively using the old
DisplaySurface, and the crash happens because the memory is freed
while this function is still using it.

I think this happens like this:
 * the iothread runs the gui_update timer callback; it holds the
   iothread lock to do this
 * gui_update eventually calls into the bcm2835_fb.c fb_update_display()
   function
 * That function calls qemu_console_surface(s->con) to
   get the current DisplaySurface, and passes it to
   framebuffer_update_display() to do the work
 * framebuffer_update_display calls memory_region_snapshot_and_clear_dirty()
 * memory_region_snapshot_and_clear_dirty() ends up calling run_on_cpu(),
   which briefly drops the iothread lock.
 * This gives the vCPU thread a chance to dash in, grab the iothread
   lock, run the guest code to resize the fb and destroy the old
   DisplaySurface (and then dropping the iothread lock again)
 * eventually run_on_cpu() does its thing and retakes the iothread lock
 * however, when we get back up into framebuffer_update_display(), this
   function now has a stale DisplaySurface, and when it tries to copy
   the framebuffer pixels into that surface it is writing into freed
   memory, causing a segfault or worse

How is this intended to work? I feel like if run_on_cpu() silently
drops the iothread lock this probably invalidates a lot of assumptions
that QEMU code makes, especially in this kind of setup where
the code making the assumptions is several layers in the callstack
above whatever it is that ends up calling run_on_cpu()...


Here's the full backtraces of the relevant threads. First
the thread that frees the memory:

Thread 3 (Thread 2949085.2949109):
#0  __GI___libc_free (mem=0x73bc5c974010) at malloc.c:3087
#1  0x00006ac565853b1d in  () at /usr/lib/x86_64-linux-gnu/libpixman-1.so.0
#2  0x00006ac565853a5d in pixman_image_unref () at
/usr/lib/x86_64-linux-gnu/libpixman-1.so.0
#3  0x0000556260c82aee in qemu_pixman_image_unref
(image=0x556263261830) at ../../ui/qemu-pixman.c:225
#4  0x0000556260c793fa in qemu_free_displaysurface
(surface=0x5562638c45a0) at ../../ui/console.c:1582
#5  0x0000556260c79dc0 in dpy_gfx_replace_surface (con=0x5562632eda70,
surface=0x669760020270) at ../../ui/console.c:1808
#6  0x0000556260c7b967 in qemu_console_resize (s=0x5562632eda70,
width=1024, height=768) at ../../ui/console.c:2588
#7  0x0000556260d70ac4 in bcm2835_fb_reconfigure (s=0x39284b533bb0,
newconfig=0x5c54602c5600) at ../../hw/display/bcm2835_fb.c:
262
#8  0x0000556260e11cd8 in bcm2835_property_mbox_push
(s=0x39284b534f10, value=550952) at
../../hw/misc/bcm2835_property.c:301
#9  0x0000556260e11e52 in bcm2835_property_write
(opaque=0x39284b534f10, offset=0, value=550824, size=4) at
../../hw/misc/bcm28
35_property.c:344
#10 0x0000556261431bfa in memory_region_write_accessor
(mr=0x39284b5352a0, addr=0, value=0x5c54602c5788, size=4, shift=0,
mask=
4294967295, attrs=...) at ../--Type <RET> for more, q to quit, c to
continue without paging--
../softmmu/memory.c:492
#11 0x0000556261431e48 in access_with_adjusted_size (addr=0,
value=0x5c54602c5788, size=4, access_size_min=1, access_size_max=4
, access_fn=0x556261431b00 <memory_region_write_accessor>,
mr=0x39284b5352a0, attrs=...) at ../../softmmu/memory.c:554
#12 0x0000556261434fd7 in memory_region_dispatch_write
(mr=0x39284b5352a0, addr=0, data=550824, op=MO_32, attrs=...) at
../../s
oftmmu/memory.c:1514
#13 0x00005562614450e4 in address_space_stl_internal
(as=0x39284b535b60, addr=128, val=550824, attrs=..., result=0x0,
endian=DEVICE_LITTLE_ENDIAN) at
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/memory_ldst.c.inc:319
#14 0x0000556261445223 in address_space_stl_le (as=0x39284b535b60,
addr=128, val=550824, attrs=..., result=0x0) at
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/memory_ldst.c.inc:357
#15 0x0000556260e0f86f in stl_le_phys (as=0x39284b535b60, addr=128,
val=550824) at /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/exec/memory_ldst_phys.h.inc:121
#16 0x0000556260e102f0 in bcm2835_mbox_write (opaque=0x39284b535830,
offset=160, value=550824, size=4) at ../../hw/misc/bcm2835_mbox.c:227
#17 0x0000556261431bfa in memory_region_write_accessor
(mr=0x39284b535bc0, addr=160, value=0x5c54602c59d8, size=4, shift=0,
mask=4294967295, attrs=...) at ../../softmmu/memory.c:492
#18 0x0000556261431e48 in access_with_adjusted_size (addr=160,
value=0x5c54602c59d8, size=4, access_size_min=1, access_size_max=4,
access_fn=0x556261431b00 <memory_region_write_accessor>,
mr=0x39284b535bc0, attrs=...) at ../../softmmu/memory.c:554
#19 0x0000556261434fd7 in memory_region_dispatch_write
(mr=0x39284b535bc0, addr=160, data=550824, op=MO_32, attrs=...) at
../../softmmu/memory.c:1514
#20 0x00005562614d39dd in io_writex (env=0x39284b4bf030,
iotlbentry=0x5562640ff670, mmu_idx=14, val=550824, addr=1057011872,
retaddr=58326076618522, op=MO_32) at ../../accel/tcg/cputlb.c:1429
#21 0x00005562614d62ff in store_helper (env=0x39284b4bf030,
addr=1057011872, val=550824, oi=46, retaddr=58326076618522, op=MO_32)
at ../../accel/tcg/cputlb.c:2379
#22 0x00005562614d66da in full_le_stl_mmu (env=0x39284b4bf030,
addr=1057011872, val=550824, oi=46, retaddr=58326076618522) at
../../accel/tcg/cputlb.c:2467
#23 0x00005562614d6718 in helper_le_stl_mmu (env=0x39284b4bf030,
addr=1057011872, val=550824, oi=46, retaddr=58326076618522) at
../../accel/tcg/cputlb.c:2473
#24 0x0000350c1913f71a in code_gen_buffer ()
#25 0x00005562614c0335 in cpu_tb_exec (cpu=0x39284b4b5210,
itb=0x2f7b06d82c80, tb_exit=0x5c54602c6124) at
../../accel/tcg/cpu-exec.c:358
#26 0x00005562614c1208 in cpu_loop_exec_tb (cpu=0x39284b4b5210,
tb=0x2f7b06d82c80, last_tb=0x5c54602c6130, tb_exit=0x5c54602c6124) at
../../accel/tcg/cpu-exec.c:848
#27 0x00005562614c15ca in cpu_exec (cpu=0x39284b4b5210) at
../../accel/tcg/cpu-exec.c:1007
#28 0x00005562614e35bf in tcg_cpus_exec (cpu=0x39284b4b5210) at
../../accel/tcg/tcg-accel-ops.c:67
#29 0x00005562614e3952 in mttcg_cpu_thread_fn (arg=0x39284b4b5210) at
../../accel/tcg/tcg-accel-ops-mttcg.c:97
#30 0x00005562616d1e84 in qemu_thread_start (args=0x55626410ca20) at
../../util/qemu-thread-posix.c:504
#31 0x0000727421ef7609 in start_thread (arg=<optimised out>) at
pthread_create.c:477
#32 0x00006d0e4f1af133 in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95


and the thread that's still using it. (These traces produced running under 'rr',
which is why the top 6 frames look a bit odd.)

#0  0x0000000070000002 in syscall_traced ()
#1  0x00002ae51b07a9ed in _raw_syscall () at
/home/petmay01/src/rr-obj64/bin/../lib/rr/librrpreload.so
#2  0x00002ae51b075ff7 in syscall_hook_internal (call=0x681fffa0) at
/home/petmay01/src/rr/src/preload/syscallbuf.c:278
#3  0x00002ae51b0747ec in syscall_hook (call=0x681fffa0) at
/home/petmay01/src/rr/src/preload/syscallbuf.c:3454
#4  0x00002ae51b074120 in _syscall_hook_trampoline () at
/home/petmay01/src/rr-obj64/bin/../lib/rr/librrpreload.so
#5  0x00002ae51b07417f in __morestack () at
/home/petmay01/src/rr-obj64/bin/../lib/rr/librrpreload.so
#6  0x00002ae51b07419b in _syscall_hook_trampoline_48_3d_00_f0_ff_ff
() at /home/petmay01/src/rr-obj64/bin/../lib/rr/librrpreload.so
#7  0x0000727421efe37c in futex_wait_cancelable (private=<optimised
out>, expected=0, futex_word=0x556262180828 <qemu_work_cond+40>) at
../sysdeps/nptl/futex-internal.h:183
#8  __pthread_cond_wait_common (abstime=0x0, clockid=0,
mutex=0x556262182640 <qemu_global_mutex>, cond=0x556262180800
<qemu_work_cond>) at pthread_cond_wait.c:508
#9  __pthread_cond_wait (cond=0x556262180800 <qemu_work_cond>,
mutex=0x556262182640 <qemu_global_mutex>) at pthread_cond_wait.c:647
#10 0x00005562616d1639 in qemu_cond_wait_impl (cond=0x556262180800
<qemu_work_cond>, mutex=0x556262182640 <qemu_global_mutex>,
file=0x5562617355c1 "../../cpus-common.c", line=162) at
../../util/qemu-thread-posix.c:219
#11 0x0000556260c72283 in do_run_on_cpu (cpu=0x39284b4b5210,
func=0x556261442f65 <do_nothing>, data=..., mutex=0x556262182640
<qemu_global_mutex>) at ../../cpus-common.c:162
#12 0x0000556260ff0efa in run_on_cpu (cpu=0x39284b4b5210,
func=0x556261442f65 <do_nothing>, data=...) at
../../softmmu/cpus.c:391
#13 0x0000556261442fc1 in tcg_log_global_after_sync
(listener=0x5562641304b0) at ../../softmmu/physmem.c:2652
#14 0x00005562614389e3 in memory_global_after_dirty_log_sync () at
../../softmmu/memory.c:2789
#15 0x0000556261436ee1 in memory_region_snapshot_and_clear_dirty
(mr=0x5562635ed060, addr=1007681536, size=614400, client=0) at
../../softmmu/memory.c:2251
#16 0x0000556260d68e85 in framebuffer_update_display
(ds=0x5562638c45a0, mem_section=0x39284b534050, cols=640, rows=480,
src_width=1280, dest_row_pitch=2560, dest_col_pitch=0, invalidate=1,
fn=0x556260d70312 <draw_line_src16>, opaque=0x39284b533bb0,
first_row=0x7ffdca6ab698, last_row=0x7ffdca6ab69c) at
../../hw/display/framebuffer.c:102
#17 0x0000556260d70854 in fb_update_display (opaque=0x39284b533bb0) at
../../hw/display/bcm2835_fb.c:203
#18 0x0000556260c757d3 in graphic_hw_update (con=0x5562632eda70) at
../../ui/console.c:230
#19 0x000055626109b639 in gd_refresh (dcl=0x556264050370) at ../../ui/gtk.c:438
#20 0x0000556260c79ec2 in dpy_refresh (s=0x5562638c4280) at
../../ui/console.c:1842
#21 0x0000556260c75514 in gui_update (opaque=0x5562638c4280) at
../../ui/console.c:165
#22 0x00005562616fed2e in timerlist_run_timers
(timer_list=0x5562632f42a0) at ../../util/qemu-timer.c:576
#23 0x00005562616fedd9 in qemu_clock_run_timers
(type=QEMU_CLOCK_REALTIME) at ../../util/qemu-timer.c:590
#24 0x00005562616ff0bf in qemu_clock_run_all_timers () at
../../util/qemu-timer.c:672
#25 0x00005562616f8b8f in main_loop_wait (nonblocking=0) at
../../util/main-loop.c:607
#26 0x0000556260ff9b28 in qemu_main_loop () at ../../softmmu/runstate.c:734
#27 0x0000556260c706ea in qemu_main (argc=9, argv=0x7ffdca6ab9f8,
envp=0x0) at ../../softmmu/main.c:38
#28 0x0000556260c70720 in main (argc=9, argv=0x7ffdca6ab9f8) at
../../softmmu/main.c:47

thanks
-- PMM

