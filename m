Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D61B3AAF9E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:23:47 +0200 (CEST)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoFV-0000M7-Tw
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltoDv-0007vN-EM; Thu, 17 Jun 2021 05:22:07 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:11835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltoDn-0006tA-Qt; Thu, 17 Jun 2021 05:22:05 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EF60A74570E;
 Thu, 17 Jun 2021 11:21:55 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 88E8D7456E3; Thu, 17 Jun 2021 11:21:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 868757456B4;
 Thu, 17 Jun 2021 11:21:55 +0200 (CEST)
Date: Thu, 17 Jun 2021 11:21:55 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v21] spapr: Implement Open Firmware client interface
In-Reply-To: <8d20a636-2248-ff6a-a886-95544d766a75@ozlabs.ru>
Message-ID: <1d7cfddc-6894-e79c-4a49-78b4e0e715ec@eik.bme.hu>
References: <20210615070612.22679-1-aik@ozlabs.ru>
 <91505219-14f9-dd28-833-943c216ee4a@eik.bme.hu>
 <119e934c-4921-37b2-591f-d5508fbaf57c@ozlabs.ru>
 <2c9921b-c06d-28c9-b75-196dff1f57f4@eik.bme.hu>
 <8d20a636-2248-ff6a-a886-95544d766a75@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2128903752-1623921715=:49131"
X-Spam-Probability: 11%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2128903752-1623921715=:49131
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 17 Jun 2021, Alexey Kardashevskiy wrote:
> On 16/06/2021 20:26, BALATON Zoltan wrote:
>> On Wed, 16 Jun 2021, Alexey Kardashevskiy wrote:
>>> On 6/16/21 07:09, BALATON Zoltan wrote:
>>>> On Tue, 15 Jun 2021, Alexey Kardashevskiy wrote:
>>>>> The PAPR platform describes an OS environment that's presented by
>>>>> a combination of a hypervisor and firmware. The features it specifies
>>>>> require collaboration between the firmware and the hypervisor.
>>>>> 
>>>>> Since the beginning, the runtime component of the firmware (RTAS) has
>>>>> been implemented as a 20 byte shim which simply forwards it to
>>>>> a hypercall implemented in qemu. The boot time firmware component is
>>>>> SLOF - but a build that's specific to qemu, and has always needed to be
>>>>> updated in sync with it. Even though we've managed to limit the amount
>>>>> of runtime communication we need between qemu and SLOF, there's some,
>>>>> and it has become increasingly awkward to handle as we've implemented
>>>>> new features.
>>>>> 
>>>>> This implements a boot time OF client interface (CI) which is
>>>>> enabled by a new "x-vof" pseries machine option (stands for "Virtual 
>>>>> Open
>>>>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>>>>> which implements Open Firmware Client Interface (OF CI). This allows
>>>>> using a smaller stateless firmware which does not have to manage
>>>>> the device tree.
>>>>> 
>>>>> The new "vof.bin" firmware image is included with source code under
>>>>> pc-bios/. It also includes RTAS blob.
>>>>> 
>>>>> This implements a handful of CI methods just to get -kernel/-initrd
>>>>> working. In particular, this implements the device tree fetching and
>>>>> simple memory allocator - "claim" (an OF CI memory allocator) and 
>>>>> updates
>>>>> "/memory@0/available" to report the client about available memory.
>>>>> 
>>>>> This implements changing some device tree properties which we know how
>>>>> to deal with, the rest is ignored. To allow changes, this skips
>>>>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>>>>> appending.
>>>>> 
>>>>> In absence of SLOF, this assigns phandles to device tree nodes to make
>>>>> device tree traversing work.
>>>>> 
>>>>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>>>> 
>>>>> This adds basic instances support which are managed by a hash map
>>>>> ihandle -> [phandle].
>>>>> 
>>>>> Before the guest started, the used memory is:
>>>>> 0..e60 - the initial firmware
>>>>> 8000..10000 - stack
>>>>> 400000.. - kernel
>>>>> 3ea0000.. - initramdisk
>>>>> 
>>>>> This OF CI does not implement "interpret".
>>>>> 
>>>>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>>>>> includes a disk image with pre-formatted nvram.
>>>>> 
>>>>> With this basic support, this can only boot into kernel directly.
>>>>> However this is just enough for the petitboot kernel and initradmdisk to
>>>>> boot from any possible source. Note this requires reasonably recent 
>>>>> guest
>>>>> kernel with:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735 
>>>>> The immediate benefit is much faster booting time which especially
>>>>> crucial with fully emulated early CPU bring up environments. Also this
>>>>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>>>> 
>>>>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>>>>> other POWERPC boards which do not support pSeries.
>>>>> 
>>>>> This make VOF optional, it is disabled by default, add --enable-vof
>>>>> to ./configure to enable it.
>>>>> 
>>>>> This assumes potential support for booting from QEMU backends
>>>>> such as blockdev or netdev without devices/drivers used.
>>>>> 
>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>> ---
>>>>> 
>>>>> The example command line is:
>>>>> 
>>>>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>>>>> -nodefaults \
>>>>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>>>>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>>>>> -mon id=MON0,chardev=STDIO0,mode=readline \
>>>>> -nographic \
>>>>> -vga none \
>>>>> -enable-kvm \
>>>>> -m 8G \
>>>>> -machine 
>>>>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>>>>> \
>>>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>>>> -initrd pb/rootfs.cpio.xz \
>>>>> -drive 
>>>>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw 
>>>>> \
>>>>> -global spapr-nvram.drive=DRIVE0 \
>>>>> -snapshot \
>>>>> -smp 8,threads=8 \
>>>>> -L /home/aik/t/qemu-ppc64-bios/ \
>>>>> -trace events=qemu_trace_events \
>>>>> -d guest_errors \
>>>>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>>>>> -mon chardev=SOCKET0,mode=control
>>>>> 
>>>>> ---
>>>>> Changes:
>>>>> v21:
>>>>> * s/ld/ldz/ in entry.S
>>>>> * moved CONFIG_VOF from default-configs/devices/ppc64-softmmu.mak to 
>>>>> Kconfig
>>>>> * made CONFIG_VOF optional
>>>>> * s/l.lds/vof.lds/
>>>>> * force 32 BE in spapr_machine_reset() instead of the firmware
>>>>> * added checks for non-null methods of VofMachineIfClass
>>>>> * moved OF_STACK_SIZE to vof.h, renamed to VOF_..., added a better 
>>>>> comment
>>>>> * added  path_offset wrapper for handling mixed case for addresses
>>>>> after "@" in node names
>>>>> * changed getprop() to check for actual "name" property in the fdt
>>>>> * moved VOF_MEM_READ/VOF_MEM_WRITE to vof.h for sharing as (unlike 
>>>>> similar
>>>>> rtas_ld/ldl_be_*) they return error codes
>>>>> * VOF_MEM_READ uses now address_space_read (it was 
>>>>> address_space_read_full
>>>>> before, not sure why)
>>>>> 
>>>>> v20:
>>>>> * compile vof.bin with -mcpu=power4 for better compatibility
>>>>> * s/std/stw/ in entry.S to make it work on ppc32
>>>>> * fixed dt_available property to support both 32 and 64bit
>>>>> * shuffled prom_args handling code
>>>>> * do not enforce 32bit in MSR (again, to support 32bit platforms)
>>>>> 
>>>>> v19:
>>>>> * put bootargs in the FDT
>>>>> * moved setting properties to a VOF machine hook
>>>>> * moved fw_size and claim for it to vof_init()
>>>>> * added CROSS to the VOF's makefile
>>>>> * simplified phandles assigning
>>>>> * pass MachineState to all machine hooks instead of calling
>>>>> qdev_get_machine (following QOM)
>>>>> * bunch of smaller changes and added comments
>>>>> * added simple test to attempt to start with x-vof=on
>>>>> 
>>>>> v18:
>>>>> * fixed top addr (max address for "claim") on radix - it equals to 
>>>>> ram_size
>>>>> and vof->top_addr was uint32_t
>>>>> * fixed "available" property which got broken in v14 but it is only 
>>>>> visible
>>>>> to clients which care (== grub)
>>>>> * reshuffled vof_dt_memory_available() calls, added vof_init() to allow
>>>>> vof_claim() before rendering the FDT
>>>>> 
>>>>> v17:
>>>>> * mv hw/ppc/vof.h include/hw/ppc/vof.h
>>>>> * VofMachineIfClass -> VofMachineClass; it is not VofMachineInterface as
>>>>> nobody used this scheme, usually "Interface" is dropped, a couple of 
>>>>> times
>>>>> it is "xxxInterfaceClass" or "xxxIfClass", as used the latter as it is
>>>>> used by include/hw/vmstate-if.h
>>>>> * added SPDX
>>>>> * other fixes from v16 review
>>>>> 
>>>>> v16:
>>>>> * rebased on dwg/ppc-for-6.1
>>>>> * s/SpaprVofInterface/VofMachineInterface/
>>>>> 
>>>>> v15:
>>>>> * bugfix: claimed memory for the VOF itself
>>>>> * ditched OF_STACK_ADDR and allocate one instead, now it starts from 
>>>>> 0x8000
>>>>> because it is aligned to its size (no particular reason though)
>>>>> * coding style
>>>>> * moved nvram.bin up one level
>>>>> * ditched bool in the firmware
>>>>> * made debugging code conditional using trace_event_get_state() + 
>>>>> qemu_loglevel_mask()
>>>>> * renamed the CAS interface to SpaprVofInterface
>>>>> * added "write" which for now dumps the message and ihandle via
>>>>> trace point for early debug assistance
>>>>> * commented on when we allocate of_instances in vof_build_dt()
>>>>> * store fw_size is SpaprMachine to let spapr_vof_reset() claim it
>>>>> * many small fixes from v14's review
>>>>> 
>>>>> v14:
>>>>> * check for truncates in readstr()
>>>>> * ditched a separate vof_reset()
>>>>> * spapr->vof is a pointer now, dropped the "on" field
>>>>> * removed rtas_base from vof and updated comment why we allow setting it
>>>>> * added myself to maintainers
>>>>> * updated commit log about blockdev and other possible platforms
>>>>> * added a note why new hcall is 0x5
>>>>> * no in place endianness convertion in spapr_h_vof_client
>>>>> * converted all cpu_physical_memory_read/write to address_space_rw
>>>>> * git mv hw/ppc/spapr_vof_client.c hw/ppc/spapr_vof.c
>>>>> 
>>>>> v13:
>>>>> * rebase on latest ppc-for-6.0
>>>>> * shuffled code around to touch spapr.c less
>>>>> 
>>>>> v12:
>>>>> * split VOF and SPAPR
>>>>> 
>>>>> v11:
>>>>> * added g_autofree
>>>>> * fixed gcc warnings
>>>>> * fixed few leaks
>>>>> * added nvram image to make "nvram --print-config" not crash;
>>>>> Note that contrary to  MIN_NVRAM_SIZE (8 * KiB), the actual minimum size
>>>>> is 16K, or it just does not work (empty output from "nvram")
>>>>> 
>>>>> v10:
>>>>> * now rebased to compile with meson
>>>>> 
>>>>> v9:
>>>>> * remove special handling of /rtas/rtas-size as now we always add it in 
>>>>> QEMU
>>>>> * removed leftovers from scsi/grub/stdout/stdin/...
>>>>> 
>>>>> v8:
>>>>> * no read/write/seek
>>>>> * no @dev in instances
>>>>> * the machine flag is "x-vof" for now
>>>>> 
>>>>> v7:
>>>>> * now we have a small firmware which loads at 0 as SLOF and starts from
>>>>> 0x100 as SLOF
>>>>> * no MBR/ELF/GRUB business in QEMU anymore
>>>>> * blockdev is a separate patch
>>>>> * networking is a separate patch
>>>>> 
>>>>> v6:
>>>>> * borrowed a big chunk of commit log introduction from David
>>>>> * fixed initial stack pointer (points to the highest address of stack)
>>>>> * traces for "interpret" and others
>>>>> * disabled  translate_kernel_address() hack so grub can load (work in
>>>>> progress)
>>>>> * added "milliseconds" for grub
>>>>> * fixed "claim" allocator again
>>>>> * moved FDT_MAX_SIZE to spapr.h as spapr_of_client.c wants it too for 
>>>>> CAS
>>>>> * moved the most code possible from spapr.c to spapr_of_client.c, such 
>>>>> as
>>>>> RTAS, prom entry and FDT build/finalize
>>>>> * separated blobs
>>>>> * GRUB now proceeds to its console prompt (there are still other issues)
>>>>> * parse MBR/GPT to find PReP and load GRUB
>>>>> 
>>>>> v5:
>>>>> * made instances keep device and chardev pointers
>>>>> * removed VIO dependencies
>>>>> * print error if RTAS memory is not claimed as it should have been
>>>>> * pack FDT as "quiesce"
>>>>> 
>>>>> v4:
>>>>> * fixed open
>>>>> * validate ihandles in "call-method"
>>>>> 
>>>>> v3:
>>>>> * fixed phandles allocation
>>>>> * s/__be32/uint32_t/ as we do not normally have __be32 type in qemu
>>>>> * fixed size of /chosen/stdout
>>>>> * bunch of renames
>>>>> * do not create rtas properties at all, let the client deal with it;
>>>>> instead setprop allows changing these in the FDT
>>>>> * no more packing FDT when bios=off - nobody needs it and getprop does 
>>>>> not
>>>>> work otherwise
>>>>> * allow updating initramdisk device tree properties (for zImage)
>>>>> * added instances
>>>>> * fixed stdout on OF's "write"
>>>>> * removed special handling for stdout in OF client, spapr-vty handles it
>>>>> instead
>>>>> 
>>>>> v2:
>>>>> * fixed claim()
>>>>> * added "setprop"
>>>>> * cleaner client interface and RTAS blobs management
>>>>> * boots to petitboot and further to the target system
>>>>> * more trace points
>>>>> 
>>>>> v20
>>>>> 
>>>>> v20!
>>>>> ---
>>>>> configure               |    9 +
>>>>> pc-bios/vof/Makefile    |   23 +
>>>>> include/hw/ppc/spapr.h  |   25 +-
>>>>> include/hw/ppc/vof.h    |   55 ++
>>>>> pc-bios/vof/vof.h       |   43 ++
>>>>> hw/ppc/spapr.c          |   87 +++-
>>>>> hw/ppc/spapr_hcall.c    |   29 +-
>>>>> hw/ppc/spapr_vof.c      |  153 ++++++
>>>>> hw/ppc/vof.c            | 1052 +++++++++++++++++++++++++++++++++++++++
>>>>> pc-bios/vof/bootmem.c   |   14 +
>>>>> pc-bios/vof/ci.c        |   91 ++++
>>>>> pc-bios/vof/libc.c      |   92 ++++
>>>>> pc-bios/vof/main.c      |   21 +
>>>>> tests/qtest/rtas-test.c |   17 +-
>>>>> MAINTAINERS             |   12 +
>>>>> hw/ppc/Kconfig          |    3 +
>>>>> hw/ppc/meson.build      |    3 +
>>>>> hw/ppc/trace-events     |   24 +
>>>>> meson.build             |    1 +
>>>>> pc-bios/README          |    2 +
>>>>> pc-bios/vof-nvram.bin   |  Bin 0 -> 16384 bytes
>>>>> pc-bios/vof.bin         |  Bin 0 -> 3784 bytes
>>>>> pc-bios/vof/entry.S     |   49 ++
>>>>> pc-bios/vof/vof.lds     |   48 ++
>>>>> 24 files changed, 1840 insertions(+), 13 deletions(-)
>>>>> create mode 100644 pc-bios/vof/Makefile
>>>>> create mode 100644 include/hw/ppc/vof.h
>>>>> create mode 100644 pc-bios/vof/vof.h
>>>>> create mode 100644 hw/ppc/spapr_vof.c
>>>>> create mode 100644 hw/ppc/vof.c
>>>>> create mode 100644 pc-bios/vof/bootmem.c
>>>>> create mode 100644 pc-bios/vof/ci.c
>>>>> create mode 100644 pc-bios/vof/libc.c
>>>>> create mode 100644 pc-bios/vof/main.c
>>>>> create mode 100644 pc-bios/vof-nvram.bin
>>>>> create mode 100755 pc-bios/vof.bin
>>>>> create mode 100644 pc-bios/vof/entry.S
>>>>> create mode 100644 pc-bios/vof/vof.lds
>>>>> 
>>>>> diff --git a/configure b/configure
>>>>> index 8dcb9965b24e..00dc29c027fa 100755
>>>>> --- a/configure
>>>>> +++ b/configure
>>>>> @@ -445,6 +445,7 @@ fuse="auto"
>>>>> fuse_lseek="auto"
>>>>> multiprocess="auto"
>>>>> slirp_smbd="$default_feature"
>>>>> +vof="no"
>>>>> 
>>>>> malloc_trim="auto"
>>>>> gio="$default_feature"
>>>>> @@ -1561,6 +1562,10 @@ for opt do
>>>>>   ;;
>>>>>   --disable-slirp-smbd) slirp_smbd=no
>>>>>   ;;
>>>>> +  --enable-vof) vof=yes
>>>>> +  ;;
>>>>> +  --disable-vof) vof=no
>>>>> +  ;;
>>>>>   *)
>>>>>       echo "ERROR: unknown option $opt"
>>>>>       echo "Try '$0 --help' for more information"
>>>>> @@ -1940,6 +1945,7 @@ disabled with --disable-FEATURE, default is 
>>>>> enabled if available
>>>>>   multiprocess    Out of process device emulation support
>>>>>   gio             libgio support
>>>>>   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
>>>>> +  vof             Virtual Open Firmware support (powerpc/pseries, 
>>>>> experimental)
>>>>> 
>>>>> NOTE: The object files are built at the place where configure is 
>>>>> launched
>>>>> EOF
>>>>> @@ -5555,6 +5561,9 @@ if test "$slirp_smbd" = "yes" ; then
>>>>>   echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
>>>>>   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
>>>>> fi
>>>>> +if test "$vof" = "yes" ; then
>>>>> +  echo "CONFIG_VOF=y" >> $config_host_mak
>>>>> +fi
>>>>> if test "$vde" = "yes" ; then
>>>>>   echo "CONFIG_VDE=y" >> $config_host_mak
>>>>>   echo "VDE_LIBS=$vde_libs" >> $config_host_mak
>>>> 
>>>> In case I could not explain it clearly in my previous message I think the 
>>>> solution we want here is to drop these configure changes and let Kconfig 
>>>> configure this. The CONFIG_VOF option decides if vof itself is built 
>>>> (adds vof.c) and pegasos2 will select this so it will usually be yes by 
>>>> default. Your problem is that you're trying to use this variable in spapr 
>>>> to make it off by default but that does not work. You need to add another 
>>>> option for that (e.g. CONFIG_VOF_SPAPR or CONFIG_SPAPR_VOF whichever 
>>>> makes more sense) then you can set that to no despite CONFIG_VOF is yes 
>>>> and use that variable in spapr files and to add spapr_vof.c. Then no 
>>>> configure option is needed which does not even work for me: I get compile 
>>>> errors saying 'poisoning existing macro "CONFIG_VOF"' if I try with 
>>>> --enable-vof or spapr fails to build if I try without --enable-vof but 
>>>> select CONFIG_VOF from pegasos2. I hope this makes sense now.
>>> 
>>> 
>>> My problem is that I do not understand when we want VOF to be compiled in 
>>> by default and when we do not. For a moment I thought we do not want it in 
>>> by default but now it sounds like we do. If that is so, then CONFIG_VOF + 
>>> selecting it from PSERIES and PEGASOS should do. Or I am missing the point 
>>> again?
>> 
>> I don't know what spapr wants, for pegasos2 VOF will be the default 
>> firmware and I want pegasos2 to be enabled by default (like other boards) 
>> so this means CONFIG_VOF will also be enabled by default via select VOF in 
>> CONFIG_PEGASOS2. So if the x-vof option in spapr is not enough and you want 
>> to be able to configure it off for spapr then you need another 
>> CONFIG_something option for that and cannot rely on CONFIG_VOF for it 
>> because CONFIG_VOF is on if any board that uses VOF is compiled. If you're 
>> OK with compiling it in but disabled by x-vof by default then no need to 
>> have another option. In both cases you'll have to select VOF somewhere for 
>> your board, either in CONFIG_PSERIES or in the new option that decides if 
>> VOF is built for spapr. At least that's how I understand Kconfig.
>> 
>>>>> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
>>>>> new file mode 100644
>>>>> index 000000000000..aa1678c4d889
>>>>> --- /dev/null
>>>>> +++ b/pc-bios/vof/Makefile
>>>>> @@ -0,0 +1,23 @@
>>>>> +all: build-all
>>>>> +
>>>>> +build-all: vof.bin
>>>>> +
>>>>> +CROSS ?=
>>>>> +CC = $(CROSS)gcc
>>>>> +LD = $(CROSS)ld
>>>>> +OBJCOPY = $(CROSS)objcopy
>>>>> +
>>>>> +%.o: %.S
>>>>> +    $(CC) -m32 -mbig-endian -mcpu=power4 -c -o $@ $<
>>>>> +
>>>>> +%.o: %.c
>>>>> +    $(CC) -m32 -mbig-endian -mcpu=power4 -c -fno-stack-protector -o $@ 
>>>>> $<
>>>>> +
>>>>> +vof.elf: entry.o main.o ci.o bootmem.o libc.o
>>>>> +    $(LD) -nostdlib -e_start -Tvof.lds -EB -o $@ $^
>>>>> +
>>>>> +%.bin: %.elf
>>>>> +    $(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
>>>>> +
>>>>> +clean:
>>>>> +    rm -f *.o vof.bin vof.elf *~
>>>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>>>> index f05219f75ef6..39b5581ae650 100644
>>>>> --- a/include/hw/ppc/spapr.h
>>>>> +++ b/include/hw/ppc/spapr.h
>>>>> @@ -12,6 +12,9 @@
>>>>> #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
>>>>> #include "hw/ppc/xics.h"        /* For ICSState */
>>>>> #include "hw/ppc/spapr_tpm_proxy.h"
>>>>> +#ifdef CONFIG_VOF
>>>>> +#include "hw/ppc/vof.h"
>>>>> +#endif
>>>>> 
>>>>> struct SpaprVioBus;
>>>>> struct SpaprPhbState;
>>>>> @@ -180,6 +183,9 @@ struct SpaprMachineState {
>>>>>     uint64_t kernel_addr;
>>>>>     uint32_t initrd_base;
>>>>>     long initrd_size;
>>>>> +#ifdef CONFIG_VOF
>>>> 
>>>> So this can't be CONFIG_VOF here if you want to be able to set it to no 
>>>> despite pegasos2 pulling in VOF so you need another SPAPR specific 
>>> 
>>> If VOF is compiled it, why would I want it to be still disabled for 
>>> PSERIES? The code is in, let it work.
>> 
>> That's something to decide for spapr maintainers, I just want to be able to 
>> use CONFIG_VOF from CONFIG_PEGASOS2 and be it on by default.
>> 
>>>> option for that in spapr specific parts with CONFIG_VOF selecting if vof 
>>>> itself is built it any board uses it. So CONFIG_PEGASOS2 has to select 
>>>> CONFIG_VOF and your SPAPR_VOF option should too if it's enabled that way 
>>>> vof.c will be added if either board is built but for SPAPR only if its 
>>>> VOF option is on.
>>>> 
>>>>> +    Vof *vof;
>>>>> +#endif
>>>>>     uint64_t rtc_offset; /* Now used only during incoming migration */
>>>>>     struct PPCTimebase tb;
>>>>>     bool has_graphics;
>>>>> @@ -558,7 +564,9 @@ struct SpaprMachineState {
>>>>> /* Client Architecture support */
>>>>> #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
>>>>> #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
>>>>> -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
>>>>> +/* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
>>>>> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
>>>>> +#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
>>>>> 
>>>>> /*
>>>>>  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
>>>>> @@ -956,4 +964,19 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, 
>>>>> hwaddr pagesize,
>>>>> void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>>>>> hwaddr spapr_get_rtas_addr(void);
>>>>> bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
>>>>> +
>>>>> +#ifdef CONFIG_VOF
>>>>> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
>>>>> +                     target_ulong *stack_ptr, Error **errp);
>>>>> +void spapr_vof_quiesce(MachineState *ms);
>>>>> +bool spapr_vof_setprop(MachineState *ms, const char *path, const char 
>>>>> *propname,
>>>>> +                       void *val, int vallen);
>>>>> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState 
>>>>> *spapr,
>>>>> +                                target_ulong opcode, target_ulong 
>>>>> *args);
>>>>> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
>>>>> +                                                   CPUState *cs,
>>>>> +                                                   target_ulong 
>>>>> ovec_addr);
>>>>> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
>>>>> +#endif
>>>>> +
>>>>> #endif /* HW_SPAPR_H */
>>>>> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
>>>>> new file mode 100644
>>>>> index 000000000000..65ca2fed0d41
>>>>> --- /dev/null
>>>>> +++ b/include/hw/ppc/vof.h
>>>>> @@ -0,0 +1,55 @@
>>>>> +/*
>>>>> + * Virtual Open Firmware
>>>>> + *
>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>> + */
>>>>> +#ifndef HW_VOF_H
>>>>> +#define HW_VOF_H
>>>>> +
>>>>> +typedef struct Vof {
>>>>> +    uint64_t top_addr; /* copied from rma_size */
>>>>> +    GArray *claimed; /* array of SpaprOfClaimed */
>>>>> +    uint64_t claimed_base;
>>>>> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
>>>>> +    uint32_t of_instance_last;
>>>>> +    char *bootargs;
>>>>> +    long fw_size;
>>>>> +} Vof;
>>>>> +
>>>>> +int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
>>>>> +                    target_ulong args_real);
>>>>> +uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size, uint64_t 
>>>>> align);
>>>>> +void vof_init(Vof *vof, uint64_t top_addr, Error **errp);
>>>>> +void vof_cleanup(Vof *vof);
>>>>> +void vof_build_dt(void *fdt, Vof *vof);
>>>>> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char 
>>>>> *nodename,
>>>>> +                               const char *prop, const char *path);
>>>>> +
>>>>> +#define TYPE_VOF_MACHINE_IF "vof-machine-if"
>>>>> +
>>>>> +typedef struct VofMachineIfClass VofMachineIfClass;
>>>>> +DECLARE_CLASS_CHECKERS(VofMachineIfClass, VOF_MACHINE, 
>>>>> TYPE_VOF_MACHINE_IF)
>>>>> +
>>>>> +struct VofMachineIfClass {
>>>>> +    InterfaceClass parent;
>>>>> +    target_ulong (*client_architecture_support)(MachineState *ms, 
>>>>> CPUState *cs,
>>>>> +                                                target_ulong vec);
>>>>> +    void (*quiesce)(MachineState *ms);
>>>>> +    bool (*setprop)(MachineState *ms, const char *path, const char 
>>>>> *propname,
>>>>> +                    void *val, int vallen);
>>>>> +};
>>>>> +
>>>>> +/*
>>>>> + * Initial stack size is from
>>>>> + * 
>>>>> https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html 
>>>> 
>>>> 
>>>> I wonder if it's better to quote the section number and the title of the 
>>>> doc in case the URL here goes away in the future.
>>> 
>>> 
>>> The binding (the URL clearly suggests it is a "binding") says 32K is the 
>>> minimum, what else is here to quote? The doc does not explain why anyway.
>> 
>> I thought maybe saying "section x.x of OpenFirmware PPC binding says 
>> minimum stack size is 32K" which can also be understood if the link points 
>> to nowhere in the future. You can still add a link if you want but just 
>> have the relevant info in the comment so one does not need to read the 
>> whole doc to find it.
>
>
> I did not read the whole doc - I opened the link, "ctrl-f", "stack" - and 
> there was a local link to "8.2.2. Initial Stack" right there :)
>
> I'll do what you suggested but I really see no value.

The value simply is that in the future if www.devicetree.org is gone or 
the document is moved without redirect and the URL just gives you 404 or 
server not found then you can still know what the comment means if it says 
that according to OF PPC binding, Section 8.2.2. Initial Stack this should 
be the correct size. This is clear even when the URL is not available but 
with just the URL like above it's hard to verify if that case.

Regards,
BALATON Zoltan
--3866299591-2128903752-1623921715=:49131--

