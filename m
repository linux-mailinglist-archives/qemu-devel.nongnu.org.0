Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0E55F0F8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 00:25:43 +0200 (CEST)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6JeP-0006Ja-4h
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 18:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6Jcm-000599-Av
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 18:24:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6Jcj-0001cY-Pg
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 18:23:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m6-20020a05600c3b0600b003a0489f412cso281622wms.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 15:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=shORS6vDw1jycIOgi1B9ygV+6qwofeOBLyqL2lbNTsU=;
 b=uG91JTcGXPuLlIPxqK//0McjHxPUUPeaLWfn4gDtjIhsgKNiJ86g7BFDl7/PTXzQ9K
 79EaKCbjy+iEGVFZzWWZbKNs9xV7jOrlWaxm2Cm8KwIBH0BRa0aU5hiFK9pPGtH7Btrn
 TzCvPMpZDrZ54C6RW03N7ich4B92nnfUOqNnb0uivmvvaT59LDaNRP2c1FRLFFi1zIQx
 rOaHot0VGhOsCHfw/ld0w3VLwVAH8Yl8QHVtC8M3P/go9vPZpdtgIIIpHYbD3Xtw6O81
 jGSNycku34+0RDpwI+8Ul8aQbGuR/s0+HnuRh3x5AKvelMS5h2U8VwRfB30u0/8N/EVy
 oorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=shORS6vDw1jycIOgi1B9ygV+6qwofeOBLyqL2lbNTsU=;
 b=Fqzf3jbw8IyJP7d7kGH91Cw4IWFxvCpYTmBFrr0VgFJPLDojCV68kKmKe8QgIWBF5D
 qxkQG8qP/8zrY+hLjm8TA4KECXj5NmJVWKovQ1DS9mv42oYKTbUix4z42N+lC/oUgi2e
 RvDY9Xecw2nehnb1qeDHhzZtYNwYmQbL0z4qB7NxFsbMBrmOCIPHg/s/yr4OFerLHH1A
 Pdj9f3QQ0xzaNiaxjO1NWZJZr8klRtK9ovmJsSKmd7cG9q5DVtKKniMcu2f7I9R2x/Jd
 NdGHx+sF+x9fl2DUESXzQCuzmNKiK2OPBYZ8GjAmVztiar5HAExKQDq9HBTc1Ow8FE6M
 5fCA==
X-Gm-Message-State: AJIora90b/8EnS1X3DT1GRGWsWIRo5ajjlvxv4Z5sTfGPr+c+j6VLWP8
 XBWpBV0q40zifbkyN3tgGV7R/A==
X-Google-Smtp-Source: AGRyM1sFkICWGiDrWhZiywGN00HgRxC00Jz+1/6D0HfNDUcZukpLzdh5pjcUxl+9EEVK7pK96AC/Tg==
X-Received: by 2002:a1c:2703:0:b0:3a0:2ffb:1781 with SMTP id
 n3-20020a1c2703000000b003a02ffb1781mr1984886wmn.146.1656455034872; 
 Tue, 28 Jun 2022 15:23:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a5d5918000000b0021b9870049dsm14511639wrd.82.2022.06.28.15.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 15:23:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 59FED1FFB7;
 Tue, 28 Jun 2022 23:23:53 +0100 (BST)
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
 <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
 <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
 <87h744keg7.fsf@linaro.org>
 <348a8b91-6d91-7429-615b-c0e3d23e4fce@linux.ibm.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: Slowness with multi-thread TCG?
Date: Tue, 28 Jun 2022 23:17:37 +0100
In-reply-to: <348a8b91-6d91-7429-615b-c0e3d23e4fce@linux.ibm.com>
Message-ID: <8735fojukm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Frederic Barrat <fbarrat@linux.ibm.com> writes:

> On 28/06/2022 17:12, Alex Benn=C3=A9e wrote:
>> Frederic Barrat <fbarrat@linux.ibm.com> writes:
>>=20
>>> On 28/06/2022 13:25, Matheus K. Ferst wrote:
>>>> On 27/06/2022 15:25, Frederic Barrat wrote:
>>>>> [ Resending as it was meant for the qemu-ppc list ]
>>>>>
>>>>> Hello,
>>>>>
>>>>> I've been looking at why our qemu powernv model is so slow when booti=
ng
>>>>> a compressed linux kernel, using multiple vcpus and multi-thread tcg.
>>>>> With only one vcpu, the decompression time of the kernel is what it i=
s,
>>>>> but when using multiple vcpus, the decompression is actually slower. =
And
>>>>> worse: it degrades very fast with the number of vcpus!
>>>>>
>>>>> Rough measurement of the decompression time on a x86 laptop with
>>>>> multi-thread tcg and using the qemu powernv10 machine:
>>>>> 1 vcpu =3D> 15 seconds
>>>>> 2 vcpus =3D> 45 seconds
>>>>> 4 vcpus =3D> 1 min 30 seconds
>>>>>
>>>>> Looking in details, when the firmware (skiboot) hands over execution =
to
>>>>> the linux kernel, there's one main thread entering some bootstrap code
>>>>> and running the kernel decompression algorithm. All the other seconda=
ry
>>>>> threads are left spinning in skiboot (1 thread per vpcu). So on paper,
>>>>> with multi-thread tcg and assuming the system has enough available
>>>>> physical cpus, I would expect the decompression to hog one physical c=
pu
>>>>> and the time needed to be constant, no matter the number of vpcus.
>> <snip>
>>>>>
>>>>> Ironically, the behavior seen with single thread tcg is what I would
>>>>> expect: 1 thread decompressing in 15 seconds, all the other threads
>>>>> spinning for that same amount of time, all sharing the same physical
>>>>> cpu, so it all adds up nicely: I see 60 seconds decompression time wi=
th
>>>>> 4 vcpus (4x15). Which means multi-thread tcg is slower by quite a bit.
>>>>> And single thread tcg hogs one physical cpu of the laptop vs. 4 physi=
cal
>>>>> cpus for the slower multi-thread tcg.
>>>>>
>>>>> Does anybody have an idea of what might happen or have suggestion to
>>>>> keep investigating?
>>>>> Thanks for your help!
>>>>>
>>>>>  =C2=A0=C2=A0 Fred
>>>>>
>>>>>
>>>> Hi Frederic,
>>>> I did some boot time tests recently and didn't notice this behavior.
>>>> Could you share your QEMU command line with us? Did you build QEMU
>>>> with any debug option or sanitizer enabled?
>>>
>>>
>>> You should be able to see it with:
>>>
>>> qemu-system-ppc64 -machine powernv10 -smp 4 -m 4G -nographic -bios
>>> <path to skiboot.lid> -kernel <path to compresses kernel>   -initrd
>>> <path to initd>  -serial mon:stdio
>>>
>>>
>>> -smp is what matters.
>>>
>>> When simplifying the command line above, I noticed something
>>> interesting: the problem doesn't show using the skiboot.lid shipped
>>> with qemu! I'm using something closer to the current upstream head and
>>> the idle code (the for loop in my initial mail) had been reworked in
>>> between. So, clearly, the way the guest code is written matters. But
>>> that doesn't explain it.
>>>
>>> I'm using a kernel in debug mode, so it's pretty big and that's why I
>>> was using a compressed image. The compressed image is about 8 MB.

You can use split debug to avoid keeping the symbol in the final
vmimage. Or are there other debugging options turned on?

>> If the debug mode on PPC enables live patching of kernel functions
>> for
>> instrumentation that can certainly slow things down. You would see that
>> in tcg_optimize appearing in the perf log and "info jit" showing
>> constantly growing translation buffers.
>
>
> The part where I'm seeing the huge slowdown is not quite in kernel
> yet. Only one thread is in bootstrap code decompressing the real
> kernel. All the other threads are still spinning in firmware.
>
> Anyway, I've run perf. I couldn't figure out how to trigger the
> recording only around the decompression part with the slowdown. So I
> booted with 4 cpus to make it really slow, expecting the initial steps
> of the boot, which happen quickly enough, would be dwarfed by the time
> spent while one thread is decompressing the kernel (the part where I
> see the huge slowdown). I'd say the recording was taken with ~80% of
> the time in the interesting part. Here is what I got:
>
>
>   12,62%  qemu-system-ppc  [kernel.kallsyms]          [k]
>   syscall_exit_to_user_mode
>    6,93%  qemu-system-ppc  [kernel.kallsyms]          [k]
>    syscall_return_via_sysret
>    5,64%  qemu-system-ppc  [kernel.kallsyms]          [k]
>    __entry_text_start
>    3,93%  qemu-system-ppc  libc.so.6                  [.]
>    pthread_mutex_lock@@GLIBC_2.2.5
>    3,21%  qemu-system-ppc  libc.so.6                  [.]
>    __GI___pthread_mutex_unlock_usercnt
>    3,12%  qemu-system-ppc  libc.so.6                  [.]
>    __GI___lll_lock_wait
>    2,60%  qemu-system-ppc  qemu-system-ppc64          [.]
>    cpu_handle_interrupt
>    2,55%  qemu-system-ppc  [kernel.kallsyms]          [k] futex_wake
>    2,43%  qemu-system-ppc  [kernel.kallsyms]          [k]
>    native_queued_spin_lock_slowpath
>    1,97%  qemu-system-ppc  [kernel.kallsyms]          [k] _raw_spin_lock
>    1,89%  qemu-system-ppc  qemu-system-ppc64          [.]
>    qemu_mutex_lock_impl
>    1,83%  qemu-system-ppc  qemu-system-ppc64          [.] tb_lookup
>    1,71%  qemu-system-ppc  [kernel.kallsyms]          [k]
>    __get_user_nocheck_4
>    1,55%  qemu-system-ppc  qemu-system-ppc64          [.]
>    hreg_compute_hflags_value
>    1,46%  qemu-system-ppc  [kernel.kallsyms]          [k] futex_q_lock
>    1,39%  qemu-system-ppc  [kernel.kallsyms]          [k] futex_q_unlock
>    1,23%  qemu-system-ppc  [kernel.kallsyms]          [k]
>    audit_reset_context.part.0.constprop.0
>    1,14%  qemu-system-ppc  qemu-system-ppc64          [.]
>    object_class_dynamic_cast_assert
>    1,09%  qemu-system-ppc  qemu-system-ppc64          [.]
>    qemu_mutex_unlock_impl
>    1,02%  qemu-system-ppc  qemu-system-ppc64          [.]
>    object_dynamic_cast_assert
>    1,00%  qemu-system-ppc  [kernel.kallsyms]          [k] __x64_sys_futex
>
>
> Any known pattern here? There seems to be some contention with the
> mutex/futex call, but it's not obvious to me what it is.

If you run the sync-profiler (via the HMP "sync-profile on") you can
then get a breakdown of which mutex's are being held and for how long
("info sync-profile").

> I was also pointed to enabling gprof in qemu. I'll look into it.

gprof will likely change the behaviour due to overhead.

>
> Thanks!
>
>   Fred
>
>
>>>
>>> The initrd shouldn't matter, the issue is seen during kernel
>>> decompression, before the init ram is used.
>>>
>>> I can share my binaries if you'd like. Especially a recent version of
>>> skiboot showing the problem.
>>>
>>>    Fred
>>=20


--=20
Alex Benn=C3=A9e

