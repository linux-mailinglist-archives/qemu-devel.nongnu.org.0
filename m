Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E40B431A93
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:17:43 +0200 (CEST)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcSWN-0002C2-0A
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcSLS-0004Dp-3E
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:06:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcSLQ-0004Fi-36
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:06:25 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so1477358wmq.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OxmCyIVFAgJoziA1J9EiEnoLSRA1co8LzKDeF+pnk6o=;
 b=lZ8x0Q0NfU7Rodn0a8SXgRlRgmyoHXwl4rgsEKNU95u5KNhDDR1+eD6skd1x+LR+lx
 wvMBnV869uRCHXU+E/+kvBTm4ZLlQKHl+9UqBuhosi/5FwW17T+VOJ8NdiGv8cK5Cob8
 1LiEIE/R6TjFJG2Yhvtu2jAbOUltAyJ3b1te7+jy8y5EVQF3MAelqyqphaxTrQv78L2R
 TGWb9kDdRqGlEyS8hA9KnsOc2uLP7bUpki6RQcnMW+Zu+C+GcdNi4+6S86fYDum51zPP
 JF9zo8VBkAb5q9/uwmmopFgFu0H32h5xRy+y4w06wAnhlFq8TtHOjTL4U0IDInVceYGD
 j7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OxmCyIVFAgJoziA1J9EiEnoLSRA1co8LzKDeF+pnk6o=;
 b=TwAjJrtuJvJIQsI77ufDNWepC3Azx58XugaYCsvMXzGRc08eTdprOIfceqRwLQmubz
 ulTqM57NLs42QrquZTqHQ8cj9PDKYBL9wVwntGl/mwjOdpnXbfyDAGXdd1jn6oAAU+NS
 15jAMFhiP3n/x4JHsMytb0uXT+4xfDd/yOT0jZm+9FSAJFmXvwwl5LKWQHInGM+M+Cz8
 hrq+PP1yWeNA3r2zND9Y8V6MvgPuBQyzjdOjW7FGYJOIVz3hebWJYZeBNceDf5m/uY9h
 b7v2yWEAA4ibStu4sbFv5suodL2fWGEA8p/op6VML9hfGNGX+JoayZZf75ysLQ0zJuY3
 khVQ==
X-Gm-Message-State: AOAM533kYNQ780iBHTGsk0VBremptsY+I6fT7FF2BtvlAaa5d0Rbzuem
 FAwwYY9/pqMBibxm2jo81ssfOw==
X-Google-Smtp-Source: ABdhPJzkeBotR5Dxekf3SyvnVNBvTfQfFWcxymUwDnJk49b6S9OUFUjow2ZtxFBbL6giRl8x5J7HEw==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr45452997wme.138.1634562382322; 
 Mon, 18 Oct 2021 06:06:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l24sm1310436wmi.3.2021.10.18.06.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 06:06:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0406B1FF96;
 Mon, 18 Oct 2021 14:06:21 +0100 (BST)
References: <20210905140939.638928-1-lukas.junger@greensocs.com>
 <87ilzcy593.fsf@linaro.org>
 <2cf6222a-7c66-cbbc-a9a2-66c037c62918@greensocs.com>
 <875ytu1spc.fsf@linaro.org>
 <e48c53f3-049c-e153-2ae8-59bacafac730@greensocs.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lukas =?utf-8?Q?J=C3=BCnger?= <lukas.junger@greensocs.com>
Subject: Re: [PATCH 0/1] Add missing function names to symbol list
Date: Mon, 18 Oct 2021 13:49:08 +0100
In-reply-to: <e48c53f3-049c-e153-2ae8-59bacafac730@greensocs.com>
Message-ID: <87wnmazdmb.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Lukas J=C3=BCnger <lukas.junger@greensocs.com> writes:

> On 10/18/21 13:18, Alex Benn=C3=A9e wrote:
>> Lukas J=C3=BCnger <lukas.junger@greensocs.com> writes:
>>=20
>>> On 9/7/21 13:43, Alex Benn=C3=A9e wrote:
>>>> Lukas J=C3=BCnger <lukas.junger@greensocs.com> writes:
>>>>
>>>>> Hi all,
>>>>>
<snip>
>>> It seems like there is a race condition with the tcg threads.
>>> The plugin exit handler is run with atexit(). While the exit callback
>>> is freeing memory, tcg is still running and memory callbacks write
>>> to the already freed data structures in the plugin causing the segfault.
>>> I tested this with the current master branch and this cmdline:
>> We fixed a bug in linux-user that was leading to the exit callbacks
>> being called (see qemu_plugin_user_exit).
>>=20
>>> bin/qemu-system-riscv64 -machine virt -nographic -bios fw_jump.elf
>>>  =C2=A0=C2=A0=C2=A0 -kernel Image -plugin path/to/libcache.so -d plugin=
 -D log.txt
>>>
>>> I wonder if we could somehow wait for the tcg to exit before executing
>>> plugin exit cb. Do you have an idea?
>> It should be because I don't see how TCG would still be running when
>> we
>> run the atexit handler. It literally shouldn't be called until QEMU
>> itself calls exit which should be well after the TCG has stopped running
>> (see pause_all_vcpus).
>> Any chance you could replicate and generate a backtrace that shows
>> this
>> happening?
>>=20
>
> I'm on Fedora 34, running:
>
> gdb --args bin/qemu-system-riscv64 -machine virt -nographic -bios
> /home/lukas/work/greensocs/projects/sifive/buildroot-2021.05.1/BUILD/imag=
es/fw_jump.elf
> -kernel
> /home/lukas/work/greensocs/projects/sifive/buildroot-2021.05.1/BUILD/imag=
es/Image
> -plugin BUILD/contrib/plugins/libcache.so -d plugin -D foo.log
>
> I get:
>
> Thread 1 "qemu-system-ris" received signal SIGSEGV, Segmentation fault.
> 0x00007ffff76a9571 in unlink_chunk.constprop () from /lib64/libc.so.6
> Missing separate debuginfos, use: dnf debuginfo-install
> bzip2-libs-1.0.8-6.fc34.x86_64 glib2-2.68.4-1.fc34.x86_64
> glibc-2.33-20.fc34.x86_64 libblkid-2.36.2-1.fc34.x86_64
> libfdt-1.6.1-1.fc34.x86_64 libffi-3.1-28.fc34.x86_64
> libgcc-11.2.1-1.fc34.x86_64 libgcrypt-1.9.3-3.fc34.x86_64
> libgpg-error-1.42-1.fc34.x86_64 libmount-2.36.2-1.fc34.x86_64
> libpng-1.6.37-10.fc34.x86_64 ncurses-libs-6.2-4.20200222.fc34.x86_64
> pcre-8.44-3.fc34.1.x86_64 pcre2-10.36-4.fc34.x86_64
> pixman-0.40.0-3.fc34.x86_64 zlib-1.2.11-26.fc34.x86_64
> (gdb) thread apply all bt
>
> Thread 3 (Thread 0x7ffff6a85640 (LWP 669129) "qemu-system-ris"):
> #0  0x00007ffff7bdd1ad in g_mutex_lock () at /lib64/libglib-2.0.so.0
> #1  0x00007ffff7fc0e19 in vcpu_mem_access (vcpu_index=3D0, info=3D131121,
>  vaddr=3D18446743936379926112, userdata=3D0x7fff6812dfb0) at
>  /home/lukas/work/greensocs/projects/sifive/upstream_qemu/contrib/plugins=
/cache.c:395
> #2  0x00007fff7021377c in code_gen_buffer ()
> #3  0x0000555555c4daf1 in cpu_tb_exec (cpu=3D0x555556880570,
>  itb=3D0x7fffb020bc40, tb_exit=3D0x7ffff6a84834) at
>  ../../../accel/tcg/cpu-exec.c:353
> #4  0x0000555555c4e8f2 in cpu_loop_exec_tb (cpu=3D0x555556880570,
>  tb=3D0x7fffb020bc40, last_tb=3D0x7ffff6a84840, tb_exit=3D0x7ffff6a84834)=
 at
>  ../../../accel/tcg/cpu-exec.c:829
> #5  0x0000555555c4ecd7 in cpu_exec (cpu=3D0x555556880570) at
>  ../../../accel/tcg/cpu-exec.c:987
> #6  0x0000555555c703ca in tcg_cpus_exec (cpu=3D0x555556880570) at
>  ../../../accel/tcg/tcg-accel-ops.c:67
> #7  0x0000555555c706dc in mttcg_cpu_thread_fn (arg=3D0x555556880570) at
>  ../../../accel/tcg/tcg-accel-ops-mttcg.c:70
> #8  0x0000555555e2b806 in qemu_thread_start (args=3D0x5555568a60b0) at
>  ../../../util/qemu-thread-posix.c:556
> #9  0x00007ffff77f9299 in start_thread () at /lib64/libpthread.so.0
> #10 0x00007ffff7721353 in clone () at /lib64/libc.so.6
>
> Thread 2 (Thread 0x7ffff7408640 (LWP 669128) "qemu-system-ris"):
> #0  0x00007ffff771be0d in syscall () at /lib64/libc.so.6
> #1  0x0000555555e2b468 in qemu_futex_wait (f=3D0x55555663da00
>  <rcu_gp_event>, val=3D4294967295) at
>  /home/lukas/work/greensocs/projects/sifive/upstream_qemu/include/qemu/fu=
tex.h:29
> #2  0x0000555555e2b653 in qemu_event_wait (ev=3D0x55555663da00
>  <rcu_gp_event>) at ../../../util/qemu-thread-posix.c:481
> #3  0x0000555555e364a4 in wait_for_readers () at ../../../util/rcu.c:135
> #4  0x0000555555e36620 in synchronize_rcu () at ../../../util/rcu.c:171
> #5  0x0000555555e367d3 in call_rcu_thread (opaque=3D0x0) at
>  ../../../util/rcu.c:265
> #6  0x0000555555e2b806 in qemu_thread_start (args=3D0x555556648860) at
>  ../../../util/qemu-thread-posix.c:556
> #7  0x00007ffff77f9299 in start_thread () at /lib64/libpthread.so.0
> #8  0x00007ffff7721353 in clone () at /lib64/libc.so.6
>
> Thread 1 (Thread 0x7ffff740a0c0 (LWP 669123) "qemu-system-ris"):
> #0  0x00007ffff76a9571 in unlink_chunk.constprop () at /lib64/libc.so.6
> #1  0x00007ffff76a99e1 in _int_free () at /lib64/libc.so.6
> #2  0x00007ffff76ad7c8 in free () at /lib64/libc.so.6
> #3  0x00007ffff7b9424d in g_free () at /lib64/libglib-2.0.so.0
> #4  0x00007ffff7fc11ad in cache_free (cache=3D0x5555566a1c60) at
>  /home/lukas/work/greensocs/projects/sifive/upstream_qemu/contrib/plugins=
/cache.c:478
> #5  0x00007ffff7fc1231 in caches_free (caches=3D0x5555568517e0) at
>  /home/lukas/work/greensocs/projects/sifive/upstream_qemu/contrib/plugins=
/cache.c:494
> #6  0x00007ffff7fc18f3 in plugin_exit (id=3D14580660273623469927, p=3D0x0)
>  at
>  /home/lukas/work/greensocs/projects/sifive/upstream_qemu/contrib/plugins=
/cache.c:616
> #7  0x0000555555c6eb0b in plugin_cb__udata (ev=3DQEMU_PLUGIN_EV_ATEXIT)
>  at ../../../plugins/core.c:156
> #8  0x0000555555c6f7b7 in qemu_plugin_atexit_cb () at
>  ../../../plugins/core.c:480
> #9  0x00007ffff7660af7 in __run_exit_handlers () at /lib64/libc.so.6
> #10 0x00007ffff7660ca0 in on_exit () at /lib64/libc.so.6
> #11 0x0000555555d78166 in mux_proc_byte (chr=3D0x555556823400,
>  d=3D0x555556823400, ch=3D120) at ../../../chardev/char-mux.c:160

Hmm it seems the problem is being able to slam out of QEMU in the mux
handler. Ideally it should be the start of triggering a graceful
shutdown probably with something like
qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);

> Hope that helps?


--=20
Alex Benn=C3=A9e

