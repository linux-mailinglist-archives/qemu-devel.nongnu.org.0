Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A94A3AC9
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 23:52:09 +0100 (CET)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJ3I-0005Sl-Lf
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 17:52:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nEJ2K-0004gl-QY
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:51:08 -0500
Received: from [2607:f8b0:4864:20::52c] (port=46592
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nEJ2H-0005b3-2Y
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 17:51:08 -0500
Received: by mail-pg1-x52c.google.com with SMTP id s16so10495590pgs.13
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 14:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MvKmy9sO6f7YWgLNyV3VB6dRSzzmulz6ue+Djr4Wpec=;
 b=WnhzkuS+efQa07vLEFKbWSTVK+j4l9pqDGChzIgKNbulc2pgtiSR8ZLA3fuJK4Z23Z
 4ofYznwyXHulaCy5zbE0813vUad5W/3UZ3NfS/b0OFhoATJKVnbGTUcqaTCjIb0qX6rL
 4MKdpUQ+W4t9HtMnFP5LCRK/EBt7OGPOQTEko5ovQHy6rli4P1G+DJMsV/SlcTxQzp6q
 XZLipVZR/WK/tPHo4OnVJ3gCeYHqd+ZrzPbY3rRqN2CdQcqvp35mJ3GL37X/oFxf4+39
 D876ZeBbVk3RegkdTHgZJfZOki+LI0LivV1yt3Vo+/gskbvlyQkJqLXBWUtFVANeTnO6
 1DhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MvKmy9sO6f7YWgLNyV3VB6dRSzzmulz6ue+Djr4Wpec=;
 b=fcpOdNWGNIcZoTydspEtSznfsDFWaUYHQ8Du+oh5nL1HDg1E48zdbfb3xt+u7qQU7L
 wfFp100J6SA+e0POBQsacwShV9bwWK1KEKE87XbEAj4xDVFYpXQ7pPkWUhvV7Vm+xjfO
 JTHeZf7pWZLSkMjJhirWDDROneHg6wM8sIxZqOxKsyS2RO9xM809dV4UYC3NpHxasD91
 nWAb/HttlN2E1mhTCN12oe02R0OcN75RKhTnnnxsBxLc24SkcW+vJzQ3l+aBvY/WrYZr
 DhwSTzv/nvfiAeYAIgrBhZN3VKFY8FpsTZSRVodeU5dN6urE0R89r54ny0W4Qk/xePTc
 AYOA==
X-Gm-Message-State: AOAM533x3Hnz6kzhWQP+/0moOi4Y+vgb03CVwZ3AuIHzZLOnXpA/xMYE
 i3fhXurLidfhD1HuljxrqEEnBiGEIbjTrcEE5t0=
X-Google-Smtp-Source: ABdhPJxmffkqlifU/MA97lEqd7hd4JOyI4PdL2PSP11exrn8A7J7e0s2GUNlGCct/DSShLRtkmhrenyJ30/PT+UBXn4=
X-Received: by 2002:a62:7c4a:: with SMTP id x71mr18381615pfc.5.1643583063286; 
 Sun, 30 Jan 2022 14:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20211102164317.45658-1-david@redhat.com>
 <20211102164317.45658-3-david@redhat.com>
In-Reply-To: <20211102164317.45658-3-david@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 30 Jan 2022 23:50:51 +0100
Message-ID: <CAPan3Wpgm94iHRCz3uGvUZYV37W=e4_d7UMqc81hY1cxB-zs1w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] memory: Make memory_region_is_mapped() succeed
 when mapped via an alias
To: David Hildenbrand <david@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a5675605d6d480d5"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a5675605d6d480d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

While I realize my response is quite late, I wanted to report this error I
found when running the acceptance
tests for the orangepi-pc machine using avocado:

ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avocado
--show=3Dapp,console run -t machine:orangepi-pc
tests/avocado/boot_linux_console.py
...
 (4/5)
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bion=
ic_20_08:
-console: U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
\console: DRAM:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
reached\nOriginal status: ERROR\n{'name':
'4-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_b=
ionic_20_08',
'logdir': '/home/fox/avocado/job-results/job-2022-01-30T23.09-af49e...
(90.64 s)
 (5/5)
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboo=
t_netbsd9:
/console: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)
console: DRAM:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
reached\nOriginal status: ERROR\n{'name':
'5-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_u=
boot_netbsd9',
'logdir': '/home/fox/avocado/job-results/job-2022-01-30T23.09-af49...
(90.64 s)
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 2 |
CANCEL 0
JOB TIME   : 221.25 s

Basically the two tests freeze during the part where the U-Boot bootloader
needs to detect the amount of memory. We model this in the
hw/misc/allwinner-h3-dramc.c file.
And when running the machine manually it shows an assert on
'alias->mapped_via_alias >=3D 0'. When running manually via gdb, I was able
to collect this backtrace:

$ gdb ./build/qemu-system-arm
...
gdb) run -M orangepi-pc -nographic
./Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img
...
U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
DRAM:
qemu-system-arm: ../softmmu/memory.c:2588: memory_region_del_subregion:
Assertion `alias->mapped_via_alias >=3D 0' failed.

Thread 4 "qemu-system-arm" received signal SIGABRT, Aborted.
[Switching to Thread 0x7ffff5f72700 (LWP 32866)]
__GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:50
50 ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
(gdb) bt
#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
50
#1  0x00007ffff7535859 in __GI_abort () at abort.c:79
#2  0x00007ffff7535729 in __assert_fail_base
    (fmt=3D0x7ffff76cb588 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
assertion=3D0x55555642fd65 "alias->mapped_via_alias >=3D 0",
file=3D0x55555642f8cd "../softmmu/memory.c", line=3D2588, function=3D<optim=
ized
out>)
    at assert.c:92
#3  0x00007ffff7546f36 in __GI___assert_fail
    (assertion=3D0x55555642fd65 "alias->mapped_via_alias >=3D 0",
file=3D0x55555642f8cd "../softmmu/memory.c", line=3D2588,
function=3D0x555556430690 <__PRETTY_FUNCTION__.8>
"memory_region_del_subregion") at assert.c:101
#4  0x0000555555e587e0 in memory_region_del_subregion (mr=3D0x555556f0bc00,
subregion=3D0x7ffff5fa1090) at ../softmmu/memory.c:2588
#5  0x0000555555e589f3 in memory_region_readd_subregion (mr=3D0x7ffff5fa109=
0)
at ../softmmu/memory.c:2630
#6  0x0000555555e58a5f in memory_region_set_address (mr=3D0x7ffff5fa1090,
addr=3D1090519040) at ../softmmu/memory.c:2642
#7  0x0000555555ac352b in allwinner_h3_dramc_map_rows (s=3D0x7ffff5fa0c50,
row_bits=3D16 '\020', bank_bits=3D2 '\002', page_size=3D512) at
../hw/misc/allwinner-h3-dramc.c:92
#8  0x0000555555ac36c2 in allwinner_h3_dramcom_write
(opaque=3D0x7ffff5fa0c50, offset=3D0, val=3D4396785, size=3D4) at
../hw/misc/allwinner-h3-dramc.c:131
#9  0x0000555555e52561 in memory_region_write_accessor (mr=3D0x7ffff5fa11a0=
,
addr=3D0, value=3D0x7ffff5f710e8, size=3D4, shift=3D0, mask=3D4294967295, a=
ttrs=3D...)
at ../softmmu/memory.c:492
#10 0x0000555555e527ad in access_with_adjusted_size (addr=3D0,
value=3D0x7ffff5f710e8, size=3D4, access_size_min=3D4, access_size_max=3D4,
access_fn=3D
    0x555555e52467 <memory_region_write_accessor>, mr=3D0x7ffff5fa11a0,
attrs=3D...) at ../softmmu/memory.c:554
#11 0x0000555555e55935 in memory_region_dispatch_write (mr=3D0x7ffff5fa11a0=
,
addr=3D0, data=3D4396785, op=3DMO_32, attrs=3D...) at ../softmmu/memory.c:1=
514
#12 0x0000555555f891ae in io_writex (env=3D0x7ffff5f7ce30,
iotlbentry=3D0x7fffec0275f0, mmu_idx=3D7, val=3D4396785, addr=3D29761536,
retaddr=3D140734938367479, op=3DMO_32) at ../accel/tcg/cputlb.c:1420
#13 0x0000555555f8ba10 in store_helper (env=3D0x7ffff5f7ce30, addr=3D297615=
36,
val=3D4396785, oi=3D3623, retaddr=3D140734938367479, op=3DMO_32) at
../accel/tcg/cputlb.c:2355
#14 0x0000555555f8bdda in full_le_stl_mmu (env=3D0x7ffff5f7ce30,
addr=3D29761536, val=3D4396785, oi=3D3623, retaddr=3D140734938367479) at
../accel/tcg/cputlb.c:2443
#15 0x0000555555f8be16 in helper_le_stl_mmu (env=3D0x7ffff5f7ce30,
addr=3D29761536, val=3D4396785, oi=3D3623, retaddr=3D140734938367479) at
../accel/tcg/cputlb.c:2449
#16 0x00007fff680245f7 in code_gen_buffer ()
#17 0x0000555555f754cb in cpu_tb_exec (cpu=3D0x7ffff5f730a0,
itb=3D0x7fffa802b400, tb_exit=3D0x7ffff5f7182c) at ../accel/tcg/cpu-exec.c:=
357
#18 0x0000555555f76366 in cpu_loop_exec_tb (cpu=3D0x7ffff5f730a0,
tb=3D0x7fffa802b400, last_tb=3D0x7ffff5f71840, tb_exit=3D0x7ffff5f7182c) at
../accel/tcg/cpu-exec.c:842
#19 0x0000555555f76720 in cpu_exec (cpu=3D0x7ffff5f730a0) at
../accel/tcg/cpu-exec.c:1001
#20 0x0000555555f993dd in tcg_cpus_exec (cpu=3D0x7ffff5f730a0) at
../accel/tcg/tcg-accel-ops.c:67
#21 0x0000555555f9976d in mttcg_cpu_thread_fn (arg=3D0x7ffff5f730a0) at
../accel/tcg/tcg-accel-ops-mttcg.c:95
#22 0x000055555624bf4d in qemu_thread_start (args=3D0x5555572b6780) at
../util/qemu-thread-posix.c:556
#23 0x00007ffff770b609 in start_thread (arg=3D<optimized out>) at
pthread_create.c:477
#24 0x00007ffff7632293 in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

So it seems that the hw/misc/allwinner-h3-dramc.c file is using the call
memory_region_set_address, where internally we are calling
memory_region_del_subregion.
The allwinner-h3-dramc.c file does use memory_region_add_subregion_overlap
once in the realize function, but might use the memory_region_set_address
multiple times.
It looks to me this is the path where the assert comes in. If I revert this
patch on current master, the machine boots without the assertion.

Would you be able to help out how we can best resolve this? Ofcourse, if
there is anything needed to be changed on the allwinner-h3-dramc.c file, I
would be happy to prepare a patch for that.

Kind regards,
Niek Linnenbank

On Tue, Nov 2, 2021 at 5:46 PM David Hildenbrand <david@redhat.com> wrote:

> memory_region_is_mapped() currently does not return "true" when a memory
> region is mapped via an alias.
>
> Assuming we have:
>     alias (A0) -> alias (A1) -> region (R0)
> Mapping A0 would currently only make memory_region_is_mapped() succeed
> on A0, but not on A1 and R0.
>
> Let's fix that by adding a "mapped_via_alias" counter to memory regions a=
nd
> updating it accordingly when an alias gets (un)mapped.
>
> I am not aware of actual issues, this is rather a cleanup to make it
> consistent.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/exec/memory.h |  1 +
>  softmmu/memory.c      | 13 ++++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 20f1b27377..fea1a493b9 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -738,6 +738,7 @@ struct MemoryRegion {
>      const MemoryRegionOps *ops;
>      void *opaque;
>      MemoryRegion *container;
> +    int mapped_via_alias; /* Mapped via an alias, container might be NUL=
L
> */
>      Int128 size;
>      hwaddr addr;
>      void (*destructor)(MemoryRegion *mr);
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7340e19ff5..b52b6a2f66 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2535,8 +2535,13 @@ static void
> memory_region_add_subregion_common(MemoryRegion *mr,
>                                                 hwaddr offset,
>                                                 MemoryRegion *subregion)
>  {
> +    MemoryRegion *alias;
> +
>      assert(!subregion->container);
>      subregion->container =3D mr;
> +    for (alias =3D subregion->alias; alias; alias =3D alias->alias) {
> +        alias->mapped_via_alias++;
> +    }
>      subregion->addr =3D offset;
>      memory_region_update_container_subregions(subregion);
>  }
> @@ -2561,9 +2566,15 @@ void
> memory_region_add_subregion_overlap(MemoryRegion *mr,
>  void memory_region_del_subregion(MemoryRegion *mr,
>                                   MemoryRegion *subregion)
>  {
> +    MemoryRegion *alias;
> +
>      memory_region_transaction_begin();
>      assert(subregion->container =3D=3D mr);
>      subregion->container =3D NULL;
> +    for (alias =3D subregion->alias; alias; alias =3D alias->alias) {
> +        alias->mapped_via_alias--;
> +        assert(alias->mapped_via_alias >=3D 0);
> +    }
>      QTAILQ_REMOVE(&mr->subregions, subregion, subregions_link);
>      memory_region_unref(subregion);
>      memory_region_update_pending |=3D mr->enabled && subregion->enabled;
> @@ -2660,7 +2671,7 @@ static FlatRange *flatview_lookup(FlatView *view,
> AddrRange addr)
>
>  bool memory_region_is_mapped(MemoryRegion *mr)
>  {
> -    return mr->container ? true : false;
> +    return !!mr->container || mr->mapped_via_alias;
>  }
>
>  /* Same as memory_region_find, but it does not add a reference to the
> --
> 2.31.1
>
>
>

--=20
Niek Linnenbank

--000000000000a5675605d6d480d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi David,</div><div dir=3D"ltr"><br></div=
><div>While I realize my response is quite late, I wanted to report this er=
ror I found when running the acceptance</div><div>tests for the orangepi-pc=
 machine using avocado:</div><div><br></div><div>ARMBIAN_ARTIFACTS_CACHED=
=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avocado --show=3Dapp,console run -=
t machine:orangepi-pc tests/avocado/boot_linux_console.py<br>...<br>=C2=A0(=
4/5) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi=
_bionic_20_08: -console: U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13=
 +0200)<br>\console: DRAM:<br>INTERRUPTED: Test interrupted by SIGTERM\nRun=
ner error occurred: Timeout reached\nOriginal status: ERROR\n{&#39;name&#39=
;: &#39;4-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_ora=
ngepi_bionic_20_08&#39;, &#39;logdir&#39;: &#39;/home/fox/avocado/job-resul=
ts/job-2022-01-30T23.09-af49e... (90.64 s)<br>=C2=A0(5/5) tests/avocado/boo=
t_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9: /conso=
le: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)<br>console: DR=
AM:<br>INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Tim=
eout reached\nOriginal status: ERROR\n{&#39;name&#39;: &#39;5-tests/avocado=
/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9&#39=
;, &#39;logdir&#39;: &#39;/home/fox/avocado/job-results/job-2022-01-30T23.0=
9-af49... (90.64 s)<br>RESULTS =C2=A0 =C2=A0: PASS 3 | ERROR 0 | FAIL 0 | S=
KIP 0 | WARN 0 | INTERRUPT 2 | CANCEL 0<br>JOB TIME =C2=A0 : 221.25 s</div>=
<div><br></div><div>Basically the two tests freeze during the part where th=
e U-Boot bootloader needs to detect the amount of memory. We model this in =
the hw/misc/allwinner-h3-dramc.c file.</div><div>And when running the machi=
ne manually it shows an assert on &#39;alias-&gt;mapped_via_alias &gt;=3D 0=
&#39;. When running manually via gdb, I was able to collect this backtrace:=
<br></div><div><br></div><div>$ gdb ./build/qemu-system-arm</div><div>...</=
div><div>gdb) run -M orangepi-pc -nographic ./Armbian_20.08.1_Orangepipc_bi=
onic_current_5.8.5.img</div><div>...</div><div>U-Boot SPL 2020.04-armbian (=
Sep 02 2020 - 10:16:13 +0200)<br>DRAM:<br>qemu-system-arm: ../softmmu/memor=
y.c:2588: memory_region_del_subregion: Assertion `alias-&gt;mapped_via_alia=
s &gt;=3D 0&#39; failed.<br><br>Thread 4 &quot;qemu-system-arm&quot; receiv=
ed signal SIGABRT, Aborted.<br>[Switching to Thread 0x7ffff5f72700 (LWP 328=
66)]<br>__GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/rais=
e.c:50<br>50	../sysdeps/unix/sysv/linux/raise.c: No such file or directory.=
<br>(gdb) bt<br>#0 =C2=A0__GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/uni=
x/sysv/linux/raise.c:50<br>#1 =C2=A00x00007ffff7535859 in __GI_abort () at =
abort.c:79<br>#2 =C2=A00x00007ffff7535729 in __assert_fail_base<br>=C2=A0 =
=C2=A0 (fmt=3D0x7ffff76cb588 &quot;%s%s%s:%u: %s%sAssertion `%s&#39; failed=
.\n%n&quot;, assertion=3D0x55555642fd65 &quot;alias-&gt;mapped_via_alias &g=
t;=3D 0&quot;, file=3D0x55555642f8cd &quot;../softmmu/memory.c&quot;, line=
=3D2588, function=3D&lt;optimized out&gt;)<br>=C2=A0 =C2=A0 at assert.c:92<=
br>#3 =C2=A00x00007ffff7546f36 in __GI___assert_fail<br>=C2=A0 =C2=A0 (asse=
rtion=3D0x55555642fd65 &quot;alias-&gt;mapped_via_alias &gt;=3D 0&quot;, fi=
le=3D0x55555642f8cd &quot;../softmmu/memory.c&quot;, line=3D2588, function=
=3D0x555556430690 &lt;__PRETTY_FUNCTION__.8&gt; &quot;memory_region_del_sub=
region&quot;) at assert.c:101<br>#4 =C2=A00x0000555555e587e0 in memory_regi=
on_del_subregion (mr=3D0x555556f0bc00, subregion=3D0x7ffff5fa1090) at ../so=
ftmmu/memory.c:2588<br>#5 =C2=A00x0000555555e589f3 in memory_region_readd_s=
ubregion (mr=3D0x7ffff5fa1090) at ../softmmu/memory.c:2630<br>#6 =C2=A00x00=
00555555e58a5f in memory_region_set_address (mr=3D0x7ffff5fa1090, addr=3D10=
90519040) at ../softmmu/memory.c:2642<br>#7 =C2=A00x0000555555ac352b in all=
winner_h3_dramc_map_rows (s=3D0x7ffff5fa0c50, row_bits=3D16 &#39;\020&#39;,=
 bank_bits=3D2 &#39;\002&#39;, page_size=3D512) at ../hw/misc/allwinner-h3-=
dramc.c:92<br>#8 =C2=A00x0000555555ac36c2 in allwinner_h3_dramcom_write (op=
aque=3D0x7ffff5fa0c50, offset=3D0, val=3D4396785, size=3D4) at ../hw/misc/a=
llwinner-h3-dramc.c:131<br>#9 =C2=A00x0000555555e52561 in memory_region_wri=
te_accessor (mr=3D0x7ffff5fa11a0, addr=3D0, value=3D0x7ffff5f710e8, size=3D=
4, shift=3D0, mask=3D4294967295, attrs=3D...) at ../softmmu/memory.c:492<br=
>#10 0x0000555555e527ad in access_with_adjusted_size (addr=3D0, value=3D0x7=
ffff5f710e8, size=3D4, access_size_min=3D4, access_size_max=3D4, access_fn=
=3D<br>=C2=A0 =C2=A0 0x555555e52467 &lt;memory_region_write_accessor&gt;, m=
r=3D0x7ffff5fa11a0, attrs=3D...) at ../softmmu/memory.c:554<br>#11 0x000055=
5555e55935 in memory_region_dispatch_write (mr=3D0x7ffff5fa11a0, addr=3D0, =
data=3D4396785, op=3DMO_32, attrs=3D...) at ../softmmu/memory.c:1514<br>#12=
 0x0000555555f891ae in io_writex (env=3D0x7ffff5f7ce30, iotlbentry=3D0x7fff=
ec0275f0, mmu_idx=3D7, val=3D4396785, addr=3D29761536, retaddr=3D1407349383=
67479, op=3DMO_32) at ../accel/tcg/cputlb.c:1420<br>#13 0x0000555555f8ba10 =
in store_helper (env=3D0x7ffff5f7ce30, addr=3D29761536, val=3D4396785, oi=
=3D3623, retaddr=3D140734938367479, op=3DMO_32) at ../accel/tcg/cputlb.c:23=
55<br>#14 0x0000555555f8bdda in full_le_stl_mmu (env=3D0x7ffff5f7ce30, addr=
=3D29761536, val=3D4396785, oi=3D3623, retaddr=3D140734938367479) at ../acc=
el/tcg/cputlb.c:2443<br>#15 0x0000555555f8be16 in helper_le_stl_mmu (env=3D=
0x7ffff5f7ce30, addr=3D29761536, val=3D4396785, oi=3D3623, retaddr=3D140734=
938367479) at ../accel/tcg/cputlb.c:2449<br>#16 0x00007fff680245f7 in code_=
gen_buffer ()<br>#17 0x0000555555f754cb in cpu_tb_exec (cpu=3D0x7ffff5f730a=
0, itb=3D0x7fffa802b400, tb_exit=3D0x7ffff5f7182c) at ../accel/tcg/cpu-exec=
.c:357<br>#18 0x0000555555f76366 in cpu_loop_exec_tb (cpu=3D0x7ffff5f730a0,=
 tb=3D0x7fffa802b400, last_tb=3D0x7ffff5f71840, tb_exit=3D0x7ffff5f7182c) a=
t ../accel/tcg/cpu-exec.c:842<br>#19 0x0000555555f76720 in cpu_exec (cpu=3D=
0x7ffff5f730a0) at ../accel/tcg/cpu-exec.c:1001<br>#20 0x0000555555f993dd i=
n tcg_cpus_exec (cpu=3D0x7ffff5f730a0) at ../accel/tcg/tcg-accel-ops.c:67<b=
r>#21 0x0000555555f9976d in mttcg_cpu_thread_fn (arg=3D0x7ffff5f730a0) at .=
./accel/tcg/tcg-accel-ops-mttcg.c:95<br>#22 0x000055555624bf4d in qemu_thre=
ad_start (args=3D0x5555572b6780) at ../util/qemu-thread-posix.c:556<br>#23 =
0x00007ffff770b609 in start_thread (arg=3D&lt;optimized out&gt;) at pthread=
_create.c:477<br>#24 0x00007ffff7632293 in clone () at ../sysdeps/unix/sysv=
/linux/x86_64/clone.S:95</div><div><br></div><div>So it seems that the hw/m=
isc/allwinner-h3-dramc.c file is using the call memory_region_set_address, =
where internally we are calling memory_region_del_subregion.</div><div>The =
allwinner-h3-dramc.c file does use memory_region_add_subregion_overlap once=
 in the realize function, but might use the memory_region_set_address multi=
ple times.</div><div>It looks to me this is the path where the assert comes=
 in. If I revert this patch on current master, the machine boots without th=
e assertion.</div><div><br></div><div>Would you be able to help out how we =
can best resolve this? Ofcourse, if there is anything needed to be changed =
on the allwinner-h3-dramc.c file, I would be happy to prepare a patch for t=
hat.<br></div><div><br></div><div>Kind regards,</div><div>Niek Linnenbank<b=
r></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Nov 2, 2021 at 5:46 PM David Hildenbrand &lt;<a href=3D"mailto:da=
vid@redhat.com">david@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">memory_region_is_mapped() currently does n=
ot return &quot;true&quot; when a memory<br>
region is mapped via an alias.<br>
<br>
Assuming we have:<br>
=C2=A0 =C2=A0 alias (A0) -&gt; alias (A1) -&gt; region (R0)<br>
Mapping A0 would currently only make memory_region_is_mapped() succeed<br>
on A0, but not on A1 and R0.<br>
<br>
Let&#39;s fix that by adding a &quot;mapped_via_alias&quot; counter to memo=
ry regions and<br>
updating it accordingly when an alias gets (un)mapped.<br>
<br>
I am not aware of actual issues, this is rather a cleanup to make it<br>
consistent.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
Reviewed-by: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"_b=
lank">peterx@redhat.com</a>&gt;<br>
Signed-off-by: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com" ta=
rget=3D"_blank">david@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/exec/memory.h |=C2=A0 1 +<br>
=C2=A0softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 | 13 ++++++++++++-<br>
=C2=A02 files changed, 13 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/include/exec/memory.h b/include/exec/memory.h<br>
index 20f1b27377..fea1a493b9 100644<br>
--- a/include/exec/memory.h<br>
+++ b/include/exec/memory.h<br>
@@ -738,6 +738,7 @@ struct MemoryRegion {<br>
=C2=A0 =C2=A0 =C2=A0const MemoryRegionOps *ops;<br>
=C2=A0 =C2=A0 =C2=A0void *opaque;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion *container;<br>
+=C2=A0 =C2=A0 int mapped_via_alias; /* Mapped via an alias, container migh=
t be NULL */<br>
=C2=A0 =C2=A0 =C2=A0Int128 size;<br>
=C2=A0 =C2=A0 =C2=A0hwaddr addr;<br>
=C2=A0 =C2=A0 =C2=A0void (*destructor)(MemoryRegion *mr);<br>
diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
index 7340e19ff5..b52b6a2f66 100644<br>
--- a/softmmu/memory.c<br>
+++ b/softmmu/memory.c<br>
@@ -2535,8 +2535,13 @@ static void memory_region_add_subregion_common(Memor=
yRegion *mr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 hwaddr offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 MemoryRegion *subregion)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 MemoryRegion *alias;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0assert(!subregion-&gt;container);<br>
=C2=A0 =C2=A0 =C2=A0subregion-&gt;container =3D mr;<br>
+=C2=A0 =C2=A0 for (alias =3D subregion-&gt;alias; alias; alias =3D alias-&=
gt;alias) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 alias-&gt;mapped_via_alias++;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0subregion-&gt;addr =3D offset;<br>
=C2=A0 =C2=A0 =C2=A0memory_region_update_container_subregions(subregion);<b=
r>
=C2=A0}<br>
@@ -2561,9 +2566,15 @@ void memory_region_add_subregion_overlap(MemoryRegio=
n *mr,<br>
=C2=A0void memory_region_del_subregion(MemoryRegion *mr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegion *subregion)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 MemoryRegion *alias;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0memory_region_transaction_begin();<br>
=C2=A0 =C2=A0 =C2=A0assert(subregion-&gt;container =3D=3D mr);<br>
=C2=A0 =C2=A0 =C2=A0subregion-&gt;container =3D NULL;<br>
+=C2=A0 =C2=A0 for (alias =3D subregion-&gt;alias; alias; alias =3D alias-&=
gt;alias) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 alias-&gt;mapped_via_alias--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(alias-&gt;mapped_via_alias &gt;=3D 0);<=
br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_REMOVE(&amp;mr-&gt;subregions, subregion, subreg=
ions_link);<br>
=C2=A0 =C2=A0 =C2=A0memory_region_unref(subregion);<br>
=C2=A0 =C2=A0 =C2=A0memory_region_update_pending |=3D mr-&gt;enabled &amp;&=
amp; subregion-&gt;enabled;<br>
@@ -2660,7 +2671,7 @@ static FlatRange *flatview_lookup(FlatView *view, Add=
rRange addr)<br>
<br>
=C2=A0bool memory_region_is_mapped(MemoryRegion *mr)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return mr-&gt;container ? true : false;<br>
+=C2=A0 =C2=A0 return !!mr-&gt;container || mr-&gt;mapped_via_alias;<br>
=C2=A0}<br>
<br>
=C2=A0/* Same as memory_region_find, but it does not add a reference to the=
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000a5675605d6d480d5--

