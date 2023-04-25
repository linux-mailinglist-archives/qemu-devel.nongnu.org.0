Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39306ED926
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 02:10:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr6Ey-0004lL-Vy; Mon, 24 Apr 2023 20:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pr6Ex-0004l1-9h
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 20:09:03 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pr6Ev-0005HV-2W
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 20:09:03 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-507bdc5ca2aso9066293a12.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 17:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682381338; x=1684973338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAvZOKT39NgWppb7ipHJSn06zg50wYaTzP0ohEONfbg=;
 b=AOmlkJFdZnhFG4+RMQT2giLWEeYkmei0zdEZVG6FMLAoLh/qRND+EEwunuvipjCDJD
 m9Vxdl/t1gxVvVViLiqy0azid1sxSuaS+Hido96of56nMZdv7Gs16JdMAVF3sJIpKpjc
 ZC4bZcsUXPTFvOVq+1O1uCz391ajdvPynVdQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682381338; x=1684973338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aAvZOKT39NgWppb7ipHJSn06zg50wYaTzP0ohEONfbg=;
 b=LRLbSCva0HoIVnXeWRK9L6Vefh7301KIqjFfsuEFt6x9MGvJTj/YVk/4/LrJv2e52d
 mAjFtxUMHATLfI/D7hMRRX7e1t/72AaAGb39ySHqXiCHDrhPNn+3vjdfDSUuIjQi5yvI
 2bqNZ4lzzXqkkDSCWgovuipNHIu99bl88ljPGu3eQAKtYYc1nHyYv3LnO2alI3ntlr0A
 CsbUavc2fFj/4VC53TPXFrrndRK12NXVvoeqNyCfSvDJnE9EgjGRe/fpMO6GaLaCJXVg
 VbM/rj8u8WEgiB0k8dk2XZOq1s7xrn3jh2gaR6WCIg0WrkvhcP/gnwg4sddXFK/FINGW
 gfrA==
X-Gm-Message-State: AAQBX9fgOaapp0RkLyz9doWpgEK4dooORewYG1yW7svoMbmbFFlfkc9j
 gsIokjD6wEYaFaWMlAOrxKMgRFQ1f4HeFh8Eelw=
X-Google-Smtp-Source: AKy350ZYoR7bxOmsqRwY2jcTBoZ3xK0MSBit5/vwuV/V5x8yVRveaRV0K0pD95sebbWfWFRde9WKWw==
X-Received: by 2002:a50:fc01:0:b0:504:7171:4542 with SMTP id
 i1-20020a50fc01000000b0050471714542mr12121133edr.0.1682381338366; 
 Mon, 24 Apr 2023 17:08:58 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 o15-20020aa7c7cf000000b005021d210899sm5111151eds.23.2023.04.24.17.08.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 17:08:57 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-4d9b2045e1cso34443a12.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 17:08:57 -0700 (PDT)
X-Received: by 2002:a05:6402:26cd:b0:501:fd51:f14e with SMTP id
 x13-20020a05640226cd00b00501fd51f14emr13621edd.3.1682381337165; Mon, 24 Apr
 2023 17:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <20230421011223.718-13-gurchetansingh@chromium.org>
 <fbba1520-2e95-1401-dfc8-ff759900a542@gmail.com>
In-Reply-To: <fbba1520-2e95-1401-dfc8-ff759900a542@gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 24 Apr 2023 17:08:44 -0700
X-Gmail-Original-Message-ID: <CAAfnVBmv_NebKJ3rMWS_oJzH3MOhP+130daaROU36M8o+Ohtvw@mail.gmail.com>
Message-ID: <CAAfnVBmv_NebKJ3rMWS_oJzH3MOhP+130daaROU36M8o+Ohtvw@mail.gmail.com>
Subject: Re: [RFC PATCH 12/13] HACK: use memory region API to inject memory to
 guest
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org, 
 david@redhat.com, stefanha@redhat.com, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, dmitry.osipenko@collabora.com, ray.huang@amd.com, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=gurchetansingh@chromium.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Apr 22, 2023 at 8:46=E2=80=AFAM Akihiko Odaki <akihiko.odaki@gmail.=
com> wrote:
>
> On 2023/04/21 10:12, Gurchetan Singh wrote:
> > I just copied the patches that have been floating around that do
> > this, but it doesn't seem to robustly work.  This current
> > implementation is probably good enough to run vkcube or simple
> > apps, but whenever a test starts to aggressively map/unmap memory,
> > things do explode on the QEMU side.
> >
> > A simple way to reproduce is run:
> >
> > ./deqp-vk --deqp-case=3Ddeqp-vk --deqp-case=3DdEQP-VK.memory.mapping.su=
ballocation.*
> >
> > You should get stack traces that sometimes look like this:
> >
> > 0  __pthread_kill_implementation (no_tid=3D0, signo=3D6, threadid=3D140=
737316304448) at ./nptl/pthread_kill.c:44
> > 1  __pthread_kill_internal (signo=3D6, threadid=3D140737316304448) at .=
/nptl/pthread_kill.c:78
> > 2  __GI___pthread_kill (threadid=3D140737316304448, signo=3Dsigno@entry=
=3D6) at ./nptl/pthread_kill.c:89
> > 3  0x00007ffff7042476 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps=
/posix/raise.c:26
> > 4  0x00007ffff70287f3 in __GI_abort () at ./stdlib/abort.c:79
> > 5  0x00007ffff70896f6 in __libc_message (action=3Daction@entry=3Ddo_abo=
rt, fmt=3Dfmt@entry=3D0x7ffff71dbb8c "%s\n") at ../sysdeps/posix/libc_fatal=
.c:155
> > 6  0x00007ffff70a0d7c in malloc_printerr (str=3Dstr@entry=3D0x7ffff71de=
7b0 "double free or corruption (out)") at ./malloc/malloc.c:5664
> > 7  0x00007ffff70a2ef0 in _int_free (av=3D0x7ffff7219c80 <main_arena>, p=
=3D0x555557793e00, have_lock=3D<optimized out>) at ./malloc/malloc.c:4588
> > 8  0x00007ffff70a54d3 in __GI___libc_free (mem=3D<optimized out>) at ./=
malloc/malloc.c:3391
> > 9  0x0000555555d65e7e in phys_section_destroy (mr=3D0x555557793e10) at =
../softmmu/physmem.c:1003
> > 10 0x0000555555d65ed0 in phys_sections_free (map=3D0x555556d4b410) at .=
./softmmu/physmem.c:1011
> > 11 0x0000555555d69578 in address_space_dispatch_free (d=3D0x555556d4b40=
0) at ../softmmu/physmem.c:2430
> > 12 0x0000555555d58412 in flatview_destroy (view=3D0x5555572bb090) at ..=
/softmmu/memory.c:292
> > 13 0x000055555600fd23 in call_rcu_thread (opaque=3D0x0) at ../util/rcu.=
c:284
> > 14 0x00005555560026d4 in qemu_thread_start (args=3D0x5555569cafa0) at .=
./util/qemu-thread-posix.c:541
> > 15 0x00007ffff7094b43 in start_thread (arg=3D<optimized out>) at ./nptl=
/pthread_create.c:442
> > 16 0x00007ffff7126a00 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64=
/clone3.S:81
> >
> > or this:
> >
> > 0x0000555555e1dc80 in object_unref (objptr=3D0x6d656d3c6b6e696c) at ../=
qom/object.c:1198
> > 1198        g_assert(obj->ref > 0);
> > (gdb) bt
> > 0  0x0000555555e1dc80 in object_unref (objptr=3D0x6d656d3c6b6e696c) at =
../qom/object.c:1198
> > 1  0x0000555555d5cca5 in memory_region_unref (mr=3D0x5555572b9e20) at .=
./softmmu/memory.c:1799
> > 2  0x0000555555d65e47 in phys_section_destroy (mr=3D0x5555572b9e20) at =
../softmmu/physmem.c:998
> > 3  0x0000555555d65ec7 in phys_sections_free (map=3D0x5555588365c0) at .=
./softmmu/physmem.c:1011
> > 4  0x0000555555d6956f in address_space_dispatch_free (d=3D0x5555588365b=
0) at ../softmmu/physmem.c:2430
> > 5  0x0000555555d58409 in flatview_destroy (view=3D0x555558836570) at ..=
/softmmu/memory.c:292
> > 6  0x000055555600fd1a in call_rcu_thread (opaque=3D0x0) at ../util/rcu.=
c:284
> > 7  0x00005555560026cb in qemu_thread_start (args=3D0x5555569cafa0) at .=
./util/qemu-thread-posix.c:541
> > 8  0x00007ffff7094b43 in start_thread (arg=3D<optimized out>) at ./nptl=
/pthread_create.c:442
> > 9  0x00007ffff7126a00 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64=
/clone3.S:81
> >
> > The reason seems to be memory regions are handled on a different
> > thread than the virtio-gpu thread, and that inevitably leads to
> > raciness.  The memory region docs[a] generally seems to dissuade this:
> >
> > "In order to do this, as a general rule do not create or destroy
> >   memory regions dynamically during a device=E2=80=99s lifetime, and on=
ly
> >   call object_unparent() in the memory region owner=E2=80=99s instance_=
finalize
> >   callback. The dynamically allocated data structure that contains
> >   the memory region then should obviously be freed in the
> >   instance_finalize callback as well."
> >
> > Though instance_finalize is called before device destruction, so
> > storing the memory until then is unlikely to be an option.  The
> > tests do pass when virtio-gpu doesn't free the memory, but
> > progressively the guest becomes slower and then OOMs.
> >
> > Though the api does make an exception:
> >
> > "There is an exception to the above rule: it is okay to call
> > object_unparent at any time for an alias or a container region. It is
> > therefore also okay to create or destroy alias and container regions
> > dynamically during a device=E2=80=99s lifetime."
> >
> > I believe we are trying to create a container subregion, but that's
> > still failing?  Are we doing it right?  Any memory region experts
> > here can help out?  The other revelant patch in this series
> > is "virtio-gpu: hostmem".
>
> Perhaps dma_memory_map() is what you want?

It looks like dma_memory_map(..) gives a host virtual address given an
guest DMA address?  If so, that won't work.  We need to give the guest
a pointer to the host's GPU memory.

I took a look at what the Android Emulator has been doing: it largely
bypasses the MemoryRegion API and defines generic map/unmap functions:

https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/hw=
/display/virtio-gpu-3d.c#473
https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/ex=
ec.c#2472
https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/ac=
cel/kvm/kvm-all.c#1787

This is kind of what crosvm does too.  That seems the simplest way to
do what we need.  Any objections to this approach or alternative
methods?






>
> >
> > [a] https://qemu.readthedocs.io/en/latest/devel/memory.html
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > ---
> >   hw/display/virtio-gpu-rutabaga.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-gpu-r=
utabaga.c
> > index 5fd1154198..196267aac2 100644
> > --- a/hw/display/virtio-gpu-rutabaga.c
> > +++ b/hw/display/virtio-gpu-rutabaga.c
> > @@ -159,6 +159,12 @@ static int32_t rutabaga_handle_unmap(VirtIOGPU *g,
> >       GET_VIRTIO_GPU_GL(g);
> >       GET_RUTABAGA(virtio_gpu);
> >
> > +    memory_region_transaction_begin();
> > +    memory_region_set_enabled(&res->region, false);
> > +    memory_region_del_subregion(&g->parent_obj.hostmem, &res->region);
> > +    object_unparent(OBJECT(&res->region));
> > +    memory_region_transaction_commit();
> > +
> >       res->mapped =3D NULL;
> >       return rutabaga_resource_unmap(rutabaga, res->resource_id);
> >   }
> > @@ -671,6 +677,14 @@ rutabaga_cmd_resource_map_blob(VirtIOGPU *g,
> >       result =3D rutabaga_resource_map(rutabaga, mblob.resource_id, &ma=
pping);
> >       CHECK_RESULT(result, cmd);
> >
> > +    memory_region_transaction_begin();
> > +    memory_region_init_ram_device_ptr(&res->region, OBJECT(g), NULL,
> > +                                      mapping.size, (void *)mapping.pt=
r);
> > +    memory_region_add_subregion(&g->parent_obj.hostmem, mblob.offset,
> > +                                &res->region);
> > +    memory_region_set_enabled(&res->region, true);
> > +    memory_region_transaction_commit();
> > +
> >       memset(&resp, 0, sizeof(resp));
> >       resp.hdr.type =3D VIRTIO_GPU_RESP_OK_MAP_INFO;
> >       result =3D rutabaga_resource_map_info(rutabaga, mblob.resource_id=
,

