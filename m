Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD452D113A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:57:56 +0100 (CET)
Received: from localhost ([::1]:33630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmG5S-0003P0-Pu
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kmF0y-0004ES-Fq; Mon, 07 Dec 2020 06:49:13 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:17327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kmF0Y-0002Mg-U5; Mon, 07 Dec 2020 06:49:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 521BB7470E5;
 Mon,  7 Dec 2020 12:48:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CBE807470E4; Mon,  7 Dec 2020 12:48:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CA1CB7470DB;
 Mon,  7 Dec 2020 12:48:42 +0100 (CET)
Date: Mon, 7 Dec 2020 12:48:42 +0100 (CET)
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v11] spapr: Implement Open Firmware client interface
In-Reply-To: <20201207073327.33367-1-aik@ozlabs.ru>
Message-ID: <14ffa53d-30cf-2f5f-d7e-90774bfe8eed@eik.bme.hu>
References: <20201207073327.33367-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-325369001-1607341722=:44762"
X-Spam-Probability: 13%
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-325369001-1607341722=:44762
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 7 Dec 2020, Alexey Kardashevskiy wrote:
> The PAPR platform which describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.
>
> Since the beginning, the runtime component of the firmware (RTAS) has
> been implemented as a 20 byte shim which simply forwards it to
> a hypercall implemented in qemu. The boot time firmware component is
> SLOF - but a build that's specific to qemu, and has always needed to be
> updated in sync with it. Even though we've managed to limit the amount
> of runtime communication we need between qemu and SLOF, there's some,
> and it has become increasingly awkward to handle as we've implemented
> new features.
>
> This implements a boot time OF client interface (CI) which is
> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
> which implements Open Firmware Client Interface (OF CI). This allows
> using a smaller stateless firmware which does not have to manage
> the device tree.
>
> The new "vof.bin" firmware image is included with source code under
> pc-bios/. It also includes RTAS blob.
>
> This implements a handful of CI methods just to get -kernel/-initrd
> working. In particular, this implements the device tree fetching and
> simple memory allocator - "claim" (an OF CI memory allocator) and updates
> "/memory@0/available" to report the client about available memory.
>
> This implements changing some device tree properties which we know how
> to deal with, the rest is ignored. To allow changes, this skips
> fdt_pack() when x-vof=on as not packing the blob leaves some room for
> appending.
>
> In absence of SLOF, this assigns phandles to device tree nodes to make
> device tree traversing work.
>
> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>
> This adds basic instances support which are managed by a hash map
> ihandle -> [phandle].
>
> Before the guest started, the used memory is:
> 0..4000 - the initial firmware
> 10000..180000 - stack
>
> This OF CI does not implement "interpret".
>
> Unlike SLOF, this does not format uninitialized nvram. Instead, this
> includes a disk image with pre-formatted nvram.
>
> With this basic support, this can only boot into kernel directly.
> However this is just enough for the petitboot kernel and initradmdisk to
> boot from any possible source. Note this requires reasonably recent guest
> kernel with:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
> The example command line is:
>
> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
> -nodefaults \
> -chardev stdio,id=STDIO0,signal=off,mux=on \
> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
> -mon id=MON0,chardev=STDIO0,mode=readline \
> -nographic \
> -vga none \
> -enable-kvm \
> -m 2G \
> -machine pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
> -kernel pbuild/kernel-le-guest/vmlinux \
> -initrd t/le.cpio \
> -drive id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof/nvram.bin,format=raw \
> -global spapr-nvram.drive=DRIVE0 \
> -snapshot \
> -smp 8,threads=8 \
> -L /home/aik/t/qemu-ppc64-bios/ \
> -trace events=qemu_trace_events \
> -d guest_errors \
> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
> -mon chardev=SOCKET0,mode=control
>
>
> ---
> Changes:
> v11:
> * added g_autofree
> * fixed gcc warnings
> * fixed few leaks
> * added nvram image to make "nvram --print-config" not crash;
> Note that contrary to  MIN_NVRAM_SIZE (8 * KiB), the actual minimum size
> is 16K, or it just does not work (empty output from "nvram")
>
> v10:
> * now rebased to compile with meson
>
> v9:
> * remove special handling of /rtas/rtas-size as now we always add it in QEMU
> * removed leftovers from scsi/grub/stdout/stdin/...
>
> v8:
> * no read/write/seek
> * no @dev in instances
> * the machine flag is "x-vof" for now
>
> v7:
> * now we have a small firmware which loads at 0 as SLOF and starts from
> 0x100 as SLOF
> * no MBR/ELF/GRUB business in QEMU anymore
> * blockdev is a separate patch
> * networking is a separate patch
>
> v6:
> * borrowed a big chunk of commit log introduction from David
> * fixed initial stack pointer (points to the highest address of stack)
> * traces for "interpret" and others
> * disabled  translate_kernel_address() hack so grub can load (work in
> progress)
> * added "milliseconds" for grub
> * fixed "claim" allocator again
> * moved FDT_MAX_SIZE to spapr.h as spapr_of_client.c wants it too for CAS
> * moved the most code possible from spapr.c to spapr_of_client.c, such as
> RTAS, prom entry and FDT build/finalize
> * separated blobs
> * GRUB now proceeds to its console prompt (there are still other issues)
> * parse MBR/GPT to find PReP and load GRUB
>
> v5:
> * made instances keep device and chardev pointers
> * removed VIO dependencies
> * print error if RTAS memory is not claimed as it should have been
> * pack FDT as "quiesce"
>
> v4:
> * fixed open
> * validate ihandles in "call-method"
>
> v3:
> * fixed phandles allocation
> * s/__be32/uint32_t/ as we do not normally have __be32 type in qemu
> * fixed size of /chosen/stdout
> * bunch of renames
> * do not create rtas properties at all, let the client deal with it;
> instead setprop allows changing these in the FDT
> * no more packing FDT when bios=off - nobody needs it and getprop does not
> work otherwise
> * allow updating initramdisk device tree properties (for zImage)
> * added instances
> * fixed stdout on OF's "write"
> * removed special handling for stdout in OF client, spapr-vty handles it
> instead
>
> v2:
> * fixed claim()
> * added "setprop"
> * cleaner client interface and RTAS blobs management
> * boots to petitboot and further to the target system
> * more trace points
> ---
> pc-bios/vof/Makefile     |   18 +
> include/hw/ppc/spapr.h   |   14 +-
> pc-bios/vof/vof.h        |   44 ++
> hw/ppc/spapr.c           |   62 ++-
> hw/ppc/spapr_hcall.c     |    6 +-
> hw/ppc/spapr_of_client.c | 1004 ++++++++++++++++++++++++++++++++++++++
> pc-bios/vof/bootmem.c    |   13 +
> pc-bios/vof/ci.c         |  108 ++++
> pc-bios/vof/libc.c       |   91 ++++
> pc-bios/vof/main.c       |   22 +
> hw/ppc/meson.build       |    1 +
> hw/ppc/trace-events      |   21 +
> pc-bios/README           |    2 +
> pc-bios/vof.bin          |  Bin 0 -> 3680 bytes
> pc-bios/vof/entry.S      |   51 ++
> pc-bios/vof/l.lds        |   48 ++
> pc-bios/vof/nvram.bin    |  Bin 0 -> 16384 bytes
> 17 files changed, 1492 insertions(+), 13 deletions(-)
> create mode 100644 pc-bios/vof/Makefile
> create mode 100644 pc-bios/vof/vof.h
> create mode 100644 hw/ppc/spapr_of_client.c
> create mode 100644 pc-bios/vof/bootmem.c
> create mode 100644 pc-bios/vof/ci.c
> create mode 100644 pc-bios/vof/libc.c
> create mode 100644 pc-bios/vof/main.c
> create mode 100755 pc-bios/vof.bin
> create mode 100644 pc-bios/vof/entry.S
> create mode 100644 pc-bios/vof/l.lds
> create mode 100644 pc-bios/vof/nvram.bin
>
> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
> new file mode 100644
> index 000000000000..49f7e240eeff
> --- /dev/null
> +++ b/pc-bios/vof/Makefile
> @@ -0,0 +1,18 @@
> +all: build-all
> +
> +build-all: vof.bin
> +
> +%.o: %.S
> +	cc -m32 -mbig-endian -c -o $@ $<
> +
> +%.o: %.c
> +	cc -m32 -mbig-endian -c -fno-stack-protector -Wno-builtin-declaration-mismatch -o $@ $<
> +
> +vof.elf: entry.o main.o libc.o ci.o bootmem.o
> +	ld -nostdlib -e_start -Tl.lds -EB -o $@ $^
> +
> +%.bin: %.elf
> +	objcopy -O binary -j .text -j .data -j .toc -j .got2 $^ $@
> +
> +clean:
> +	rm -f *.o *.bin *.elf *~
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 2e89e36cfbdc..048bf49592aa 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -175,6 +175,13 @@ struct SpaprMachineState {
>     long kernel_size;
>     bool kernel_le;
>     uint64_t kernel_addr;
> +    bool vof; /* Virtual Open Firmware */
> +    uint32_t rtas_base;
> +    GArray *claimed; /* array of SpaprOfClaimed */
> +    uint64_t claimed_base;
> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
> +    uint32_t of_instance_last;
> +    char *bootargs;

Are these really state for vof so is it better to place them in a separate 
of_state struct instead of adding to the machine state? I'm not interested 
in spapr but interested in using vof as a replacement firmware for other 
machines so clear separation of what is spapr specific and what is vof 
specific would help me (and maybe also other reviewers to tell how much 
impact this really has on spapr which seems to be a concern of Greg).

>     uint32_t initrd_base;
>     long initrd_size;
>     uint64_t rtc_offset; /* Now used only during incoming migration */
> @@ -551,7 +558,8 @@ struct SpaprMachineState {
> /* Client Architecture support */
> #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
> #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
> -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
> +#define KVMPPC_H_OF_CLIENT      (KVMPPC_HCALL_BASE + 0x5)
> +#define KVMPPC_HCALL_MAX        KVMPPC_H_OF_CLIENT
>
> /*
>  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
> @@ -819,6 +827,10 @@ struct SpaprEventLogEntry {
> void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space);
> void spapr_events_init(SpaprMachineState *sm);
> void spapr_dt_events(SpaprMachineState *sm, void *fdt);
> +void spapr_setup_of_client(SpaprMachineState *spapr, target_ulong *stack_ptr);
> +void spapr_of_client_dt(SpaprMachineState *spapr, void *fdt);
> +void spapr_of_client_dt_finalize(SpaprMachineState *spapr);
> +void spapr_of_client_machine_init(SpaprMachineState *spapr);
> void close_htab_fd(SpaprMachineState *spapr);
> void spapr_setup_hpt(SpaprMachineState *spapr);
> void spapr_free_hpt(SpaprMachineState *spapr);
> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
[...]
> diff --git a/hw/ppc/spapr_of_client.c b/hw/ppc/spapr_of_client.c
> new file mode 100644
> index 000000000000..f1bb7eca6d8e
> --- /dev/null
> +++ b/hw/ppc/spapr_of_client.c
> @@ -0,0 +1,1004 @@
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include <sys/ioctl.h>
> +#include "qapi/error.h"
> +#include "hw/ppc/spapr.h"
> +#include "hw/ppc/spapr_vio.h"

Again, how much of this is spapr specific and what's vof specific. This is 
using SpaprMachineState but only a few fields of it are really needed that 
could be in a separate of_state struct. Could you separate those from 
really spapr specific parts (maybe only spapr_register_hypercall() really) 
and get some interface between spapr and vof? Or at least make sure only 
spapr rpecific parts have spapr in their name or get SpaprMachineState and 
other parts don't refer to any of those. Maybe most if this file could be 
split off into a vof_client.c or is it really that closely tied to spapr? 
From a brief look it only mostly needs the fdt and the few new additions 
above that could be in a vof_state or even put in static variables in this 
file.

> +#include "hw/ppc/fdt.h"
> +#include "sysemu/sysemu.h"
> +#include "qom/qom-qobject.h"
> +#include "trace.h"
> +
> +/*
> + * OF 1275 "nextprop" description suggests is it 32 bytes max but
> + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 chars long.
> + */
> +#define OF_PROPNAME_LEN_MAX 64
> +
> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
> +#define OF_STACK_SIZE       0x8000
> +
> +/* 0..10000 is reserved for the VOF fw */
> +#define OF_STACK_ADDR       0x10000
> +
> +#define ALIGN(x, a) (((x) + (a) - 1) & ~((a) - 1))
> +
> +typedef struct {
> +    uint64_t start;
> +    uint64_t size;
> +} SpaprOfClaimed;
> +
> +typedef struct {
> +    char *params;
> +    char *path; /* the path used to open the instance */
> +    uint32_t phandle;
> +} SpaprOfInstance;
> +
> +/* Defined as Big Endian */
> +struct prom_args {
> +    uint32_t service;
> +    uint32_t nargs;
> +    uint32_t nret;
> +    uint32_t args[10];
> +} QEMU_PACKED;
> +
> +static void readstr(hwaddr pa, char *buf, int size)
> +{
> +    cpu_physical_memory_read(pa, buf, size);
> +    if (buf[size - 1] != '\0') {
> +        buf[size - 1] = '\0';
> +        if (strlen(buf) == size - 1) {
> +            trace_spapr_of_client_error_str_truncated(buf, size);
> +        }
> +    }
> +}
> +
> +static bool cmpservice(const char *s, size_t len,
> +                       unsigned nargs, unsigned nret,
> +                       const char *s1, size_t len1,
> +                       unsigned nargscheck, unsigned nretcheck)
> +{
> +    if (strcmp(s, s1)) {
> +        return false;
> +    }
> +    if ((nargscheck && (nargs != nargscheck)) ||
> +        (nretcheck && (nret != nretcheck))) {
> +        trace_spapr_of_client_error_param(s, nargscheck, nretcheck, nargs,
> +                                          nret);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void split_path(const char *fullpath, char **node, char **unit,
> +                       char **part)
> +{
> +    const char *c, *p = NULL, *u = NULL;
> +
> +    *node = *unit = *part = NULL;
> +
> +    if (fullpath[0] == '\0') {
> +        *node = g_strdup(fullpath);
> +        return;
> +    }
> +
> +    for (c = fullpath + strlen(fullpath) - 1; c > fullpath; --c) {
> +        if (*c == '/') {
> +            break;
> +        }
> +        if (*c == ':') {
> +            p = c + 1;
> +            continue;
> +        }
> +        if (*c == '@') {
> +            u = c + 1;
> +            continue;
> +        }
> +    }
> +
> +    if (p && u && p < u) {
> +        p = NULL;
> +    }
> +
> +    if (u && p) {
> +        *node = g_strndup(fullpath, u - fullpath - 1);
> +        *unit = g_strndup(u, p - u - 1);
> +        *part = g_strdup(p);
> +    } else if (!u && p) {
> +        *node = g_strndup(fullpath, p - fullpath - 1);
> +        *part = g_strdup(p);
> +    } else if (!p && u) {
> +        *node = g_strndup(fullpath, u - fullpath - 1);
> +        *unit = g_strdup(u);
> +    } else {
> +        *node = g_strdup(fullpath);
> +    }
> +}
> +
> +static void prop_format(char *tval, int tlen, const void *prop, int len)
> +{
> +    int i;
> +    const unsigned char *c;
> +    char *t;
> +    const char bin[] = "...";
> +
> +    for (i = 0, c = prop; i < len; ++i, ++c) {
> +        if (*c == '\0' && i == len - 1) {
> +            strncpy(tval, prop, tlen - 1);
> +            return;
> +        }
> +        if (*c < 0x20 || *c >= 0x80) {
> +            break;
> +        }
> +    }
> +
> +    for (i = 0, c = prop, t = tval; i < len; ++i, ++c) {
> +        if (t >= tval + tlen - sizeof(bin) - 1 - 2 - 1) {
> +            strcpy(t, bin);
> +            return;
> +        }
> +        if (i && i % 4 == 0 && i != len - 1) {
> +            strcat(t, " ");
> +            ++t;
> +        }
> +        t += sprintf(t, "%02X", *c & 0xFF);
> +    }
> +}
> +
> +static int of_client_fdt_path_offset(const void *fdt, const char *node,
> +                                     const char *unit)
> +{
> +    int offset;
> +
> +    offset = fdt_path_offset(fdt, node);
> +
> +    if (offset < 0 && unit) {
> +        g_autofree char *tmp = g_strdup_printf("%s@%s", node, unit);
> +
> +        offset = fdt_path_offset(fdt, tmp);
> +    }
> +
> +    return offset;
> +}
> +
> +static uint32_t of_client_finddevice(const void *fdt, uint32_t nodeaddr)
> +{
> +    g_autofree char *node = NULL, *unit = NULL, *part = NULL;
> +    char fullnode[1024];
> +    uint32_t ret = -1;
> +    int offset;
> +
> +    readstr(nodeaddr, fullnode, sizeof(fullnode));
> +
> +    split_path(fullnode, &node, &unit, &part);
> +    offset = of_client_fdt_path_offset(fdt, node, unit);
> +    if (offset >= 0) {
> +        ret = fdt_get_phandle(fdt, offset);
> +    }
> +    trace_spapr_of_client_finddevice(fullnode, ret);
> +    return (uint32_t) ret;
> +}
> +
> +static uint32_t of_client_getprop(const void *fdt, uint32_t nodeph,
> +                                  uint32_t pname, uint32_t valaddr,
> +                                  uint32_t vallen)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret = 0;
> +    int proplen = 0;
> +    const void *prop;
> +    char trval[64] = "";
> +    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
> +
> +    readstr(pname, propname, sizeof(propname));
> +    if (strcmp(propname, "name") == 0) {
> +        prop = fdt_get_name(fdt, nodeoff, &proplen);
> +        proplen += 1;
> +    } else {
> +        prop = fdt_getprop(fdt, nodeoff, propname, &proplen);
> +    }
> +
> +    if (prop) {
> +        int cb = MIN(proplen, vallen);
> +
> +        cpu_physical_memory_write(valaddr, prop, cb);
> +        /*
> +         * OF1275 says:
> +         * "Size is either the actual size of the property, or –1 if name
> +         * does not exist", hence returning proplen instead of cb.
> +         */
> +        ret = proplen;
> +        prop_format(trval, sizeof(trval), prop, ret);
> +    } else {
> +        ret = -1;
> +    }
> +    trace_spapr_of_client_getprop(nodeph, propname, ret, trval);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_getproplen(const void *fdt, uint32_t nodeph,
> +                                     uint32_t pname)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret = 0;
> +    int proplen = 0;
> +    const void *prop;
> +    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
> +
> +    readstr(pname, propname, sizeof(propname));
> +    if (strcmp(propname, "name") == 0) {
> +        prop = fdt_get_name(fdt, nodeoff, &proplen);
> +        proplen += 1;
> +    } else {
> +        prop = fdt_getprop(fdt, nodeoff, propname, &proplen);
> +    }
> +
> +    if (prop) {
> +        ret = proplen;
> +    } else {
> +        ret = -1;
> +    }
> +    trace_spapr_of_client_getproplen(nodeph, propname, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_setprop(SpaprMachineState *spapr,
> +                                  uint32_t nodeph, uint32_t pname,
> +                                  uint32_t valaddr, uint32_t vallen)
> +{

This seems to change machine specific variables so maybe needs a callback 
from the machine and pass key-value pairs which the machine callback could 
put in its state. (Unless maybe storing it in the fdt and have the machine 
parse it from there but I think the idea was to lessen the use of the 
device tree.)

> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret = -1;
> +    int offset;
> +    char trval[64] = "";
> +
> +    readstr(pname, propname, sizeof(propname));
> +    /*
> +     * We only allow changing properties which we know how to update on
> +     * the QEMU side.
> +     */
> +    if (vallen == sizeof(uint32_t)) {
> +        uint32_t val32 = ldl_be_phys(first_cpu->as, valaddr);
> +
> +        if ((strcmp(propname, "linux,rtas-base") == 0) ||
> +            (strcmp(propname, "linux,rtas-entry") == 0)) {
> +            spapr->rtas_base = val32;
> +        } else if (strcmp(propname, "linux,initrd-start") == 0) {
> +            spapr->initrd_base = val32;
> +        } else if (strcmp(propname, "linux,initrd-end") == 0) {
> +            spapr->initrd_size = val32 - spapr->initrd_base;
> +        } else {
> +            goto trace_exit;
> +        }
> +    } else if (vallen == sizeof(uint64_t)) {
> +        uint64_t val64 = ldq_be_phys(first_cpu->as, valaddr);
> +
> +        if (strcmp(propname, "linux,initrd-start") == 0) {
> +            spapr->initrd_base = val64;
> +        } else if (strcmp(propname, "linux,initrd-end") == 0) {
> +            spapr->initrd_size = val64 - spapr->initrd_base;
> +        } else {
> +            goto trace_exit;
> +        }
> +    } else if (strcmp(propname, "bootargs") == 0) {
> +        char val[1024];
> +
> +        readstr(valaddr, val, sizeof(val));
> +        g_free(spapr->bootargs);
> +        spapr->bootargs = g_strdup(val);
> +    } else {
> +        goto trace_exit;
> +    }
> +
> +    offset = fdt_node_offset_by_phandle(spapr->fdt_blob, nodeph);
> +    if (offset >= 0) {
> +        uint8_t data[vallen];
> +
> +        cpu_physical_memory_read(valaddr, data, vallen);
> +        if (!fdt_setprop(spapr->fdt_blob, offset, propname, data, vallen)) {
> +            ret = vallen;
> +            prop_format(trval, sizeof(trval), data, ret);
> +        }
> +    }
> +
> +trace_exit:
> +    trace_spapr_of_client_setprop(nodeph, propname, trval, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_nextprop(const void *fdt, uint32_t phandle,
> +                                   uint32_t prevaddr, uint32_t nameaddr)
> +{
> +    int offset = fdt_node_offset_by_phandle(fdt, phandle);
> +    char prev[OF_PROPNAME_LEN_MAX + 1];
> +    const char *tmp;
> +
> +    readstr(prevaddr, prev, sizeof(prev));
> +    for (offset = fdt_first_property_offset(fdt, offset);
> +         offset >= 0;
> +         offset = fdt_next_property_offset(fdt, offset)) {
> +
> +        if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
> +            return 0;
> +        }
> +        if (prev[0] == '\0' || strcmp(prev, tmp) == 0) {
> +            if (prev[0] != '\0') {
> +                offset = fdt_next_property_offset(fdt, offset);
> +                if (offset < 0) {
> +                    return 0;
> +                }
> +            }
> +            if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
> +                return 0;
> +            }
> +
> +            cpu_physical_memory_write(nameaddr, tmp, strlen(tmp) + 1);
> +            return 1;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static uint32_t of_client_peer(const void *fdt, uint32_t phandle)
> +{
> +    int ret;
> +
> +    if (phandle == 0) {
> +        ret = fdt_path_offset(fdt, "/");
> +    } else {
> +        ret = fdt_next_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
> +    }
> +
> +    if (ret < 0) {
> +        ret = 0;
> +    } else {
> +        ret = fdt_get_phandle(fdt, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_child(const void *fdt, uint32_t phandle)
> +{
> +    int ret = fdt_first_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
> +
> +    if (ret < 0) {
> +        ret = 0;
> +    } else {
> +        ret = fdt_get_phandle(fdt, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_parent(const void *fdt, uint32_t phandle)
> +{
> +    int ret = fdt_parent_offset(fdt, fdt_node_offset_by_phandle(fdt, phandle));
> +
> +    if (ret < 0) {
> +        ret = 0;
> +    } else {
> +        ret = fdt_get_phandle(fdt, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t spapr_of_client_open(SpaprMachineState *spapr, const char *path)
> +{
> +    int offset;
> +    uint32_t ret = 0;
> +    SpaprOfInstance *inst = NULL;
> +    g_autofree char *node = NULL, *unit = NULL, *part = NULL;
> +
> +    if (spapr->of_instance_last == 0xFFFFFFFF) {
> +        /* We do not recycle ihandles yet */
> +        goto trace_exit;
> +    }
> +
> +    split_path(path, &node, &unit, &part);
> +
> +    offset = of_client_fdt_path_offset(spapr->fdt_blob, node, unit);
> +    if (offset < 0) {
> +        trace_spapr_of_client_error_unknown_path(path);
> +        goto trace_exit;
> +    }
> +
> +    inst = g_new0(SpaprOfInstance, 1);

This only seems to need GHashTable *of_instances which is vof state, not 
spapr state I think.

> +    inst->phandle = fdt_get_phandle(spapr->fdt_blob, offset);
> +    g_assert(inst->phandle);
> +    ++spapr->of_instance_last;
> +
> +    inst->path = g_strdup(path);
> +    inst->params = part;
> +    g_hash_table_insert(spapr->of_instances,
> +                        GINT_TO_POINTER(spapr->of_instance_last),
> +                        inst);
> +    ret = spapr->of_instance_last;
> +
> +trace_exit:
> +    trace_spapr_of_client_open(path, inst ? inst->phandle : 0, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_open(SpaprMachineState *spapr, uint32_t pathaddr)
> +{
> +    char path[256];
> +
> +    readstr(pathaddr, path, sizeof(path));
> +
> +    return spapr_of_client_open(spapr, path);
> +}
> +
> +static void of_client_close(SpaprMachineState *spapr, uint32_t ihandle)
> +{
> +    if (!g_hash_table_remove(spapr->of_instances, GINT_TO_POINTER(ihandle))) {
> +        trace_spapr_of_client_error_unknown_ihandle_close(ihandle);
> +    }
> +}
> +
> +static uint32_t of_client_instance_to_package(SpaprMachineState *spapr,
> +                                              uint32_t ihandle)
> +{
> +    gpointer instp = g_hash_table_lookup(spapr->of_instances,

Ditto.

> +                                         GINT_TO_POINTER(ihandle));
> +    uint32_t ret = -1;
> +
> +    if (instp) {
> +        ret = ((SpaprOfInstance *)instp)->phandle;
> +    }
> +    trace_spapr_of_client_instance_to_package(ihandle, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_package_to_path(const void *fdt, uint32_t phandle,
> +                                          uint32_t buf, uint32_t len)
> +{
> +    uint32_t ret = -1;
> +    char tmp[256] = "";
> +
> +    if (!fdt_get_path(fdt, fdt_node_offset_by_phandle(fdt, phandle), tmp,
> +                     sizeof(tmp))) {
> +        tmp[sizeof(tmp) - 1] = 0;
> +        ret = MIN(len, strlen(tmp) + 1);
> +        cpu_physical_memory_write(buf, tmp, ret);
> +    }
> +
> +    trace_spapr_of_client_package_to_path(phandle, tmp, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_instance_to_path(SpaprMachineState *spapr,
> +                                           uint32_t ihandle, uint32_t buf,
> +                                           uint32_t len)
> +{
> +    uint32_t ret = -1;
> +    uint32_t phandle = of_client_instance_to_package(spapr, ihandle);
> +    char tmp[256] = "";
> +
> +    if (phandle != -1) {
> +        if (!fdt_get_path(spapr->fdt_blob,
> +                          fdt_node_offset_by_phandle(spapr->fdt_blob, phandle),
> +                          tmp, sizeof(tmp))) {
> +            tmp[sizeof(tmp) - 1] = 0;
> +            ret = MIN(len, strlen(tmp) + 1);
> +            cpu_physical_memory_write(buf, tmp, ret);
> +        }
> +    }
> +    trace_spapr_of_client_instance_to_path(ihandle, phandle, tmp, ret);
> +
> +    return ret;
> +}
> +
> +static void of_client_clamed_dump(GArray *claimed)
> +{
> +#ifdef DEBUG
> +    int i;
> +    SpaprOfClaimed c;
> +
> +    for (i = 0; i < claimed->len; ++i) {
> +        c = g_array_index(claimed, SpaprOfClaimed, i);
> +        error_printf("CLAIMED %lx..%lx size=%ld\n", c.start, c.start + c.size,
> +                     c.size);
> +    }
> +#endif
> +}
> +
> +static bool of_client_claim_avail(GArray *claimed, uint64_t virt, uint64_t size)
> +{
> +    int i;
> +    SpaprOfClaimed c;
> +
> +    for (i = 0; i < claimed->len; ++i) {
> +        c = g_array_index(claimed, SpaprOfClaimed, i);
> +        if ((c.start <= virt && virt < c.start + c.size) ||
> +            (virt <= c.start && c.start < virt + size)) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +static void of_client_claim_add(GArray *claimed, uint64_t virt, uint64_t size)
> +{
> +    SpaprOfClaimed newclaim;
> +
> +    newclaim.start = virt;
> +    newclaim.size = size;
> +    g_array_append_val(claimed, newclaim);
> +}
> +
> +/*
> + * "claim" claims memory at @virt if @align==0; otherwise it allocates
> + * memory at the requested alignment.
> + */
> +static void of_client_dt_memory_available(void *fdt, GArray *claimed,
> +                                          uint64_t base);
> +
> +static uint64_t of_client_claim(SpaprMachineState *spapr, uint64_t virt,
> +                                uint64_t size, uint64_t align)
> +{
> +    uint64_t ret;
> +
> +    if (size == 0) {
> +        ret = -1;
> +    } else if (align == 0) {
> +        if (!of_client_claim_avail(spapr->claimed, virt, size)) {
> +            ret = -1;
> +        } else {
> +            ret = virt;
> +        }
> +    } else {
> +        spapr->claimed_base = ALIGN(spapr->claimed_base, align);
> +        while (1) {
> +            if (spapr->claimed_base >= spapr->rma_size) {
> +                error_report("Out of RMA memory for the OF client");
> +                return -1;
> +            }
> +            if (of_client_claim_avail(spapr->claimed, spapr->claimed_base,

Same for spapr->claimed* that's also vof state and could be separated in 
this file or a struct returned by setup_of_client() (preferably 
vof_setup_of_client instead of spapr_setup_of_client if if't not spapr 
specific).

> +                                      size)) {
> +                break;
> +            }
> +            spapr->claimed_base += size;
> +        }
> +        ret = spapr->claimed_base;
> +    }
> +
> +    if (ret != -1) {
> +        spapr->claimed_base = MAX(spapr->claimed_base, ret + size);
> +        of_client_claim_add(spapr->claimed, ret, size);
> +        /* The client reads "/memory@0/available" to know where it can claim */
> +        of_client_dt_memory_available(spapr->fdt_blob, spapr->claimed,
> +                                      spapr->claimed_base);
> +    }
> +    trace_spapr_of_client_claim(virt, size, align, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_release(SpaprMachineState *spapr, uint64_t virt,
> +                                  uint64_t size)
> +{
> +    uint32_t ret = -1;
> +    int i;
> +    GArray *claimed = spapr->claimed;
> +    SpaprOfClaimed c;
> +
> +    for (i = 0; i < claimed->len; ++i) {
> +        c = g_array_index(claimed, SpaprOfClaimed, i);
> +        if (c.start == virt && c.size == size) {
> +            g_array_remove_index(claimed, i);
> +            ret = 0;
> +            break;
> +        }
> +    }
> +
> +    trace_spapr_of_client_release(virt, size, ret);
> +
> +    return ret;
> +}
> +
> +static void of_client_instantiate_rtas(SpaprMachineState *spapr, uint32_t base)
> +{
> +    error_report("The firmware should have instantiated RTAS");
> +    exit(1);
> +}
> +
> +static uint32_t of_client_call_method(SpaprMachineState *spapr,
> +                                      uint32_t methodaddr, uint32_t ihandle,
> +                                      uint32_t param1, uint32_t param2,
> +                                      uint32_t param3, uint32_t param4,
> +                                      uint32_t *ret2)
> +{
> +    uint32_t ret = -1;
> +    char method[256] = "";
> +    SpaprOfInstance *inst;
> +
> +    if (!ihandle) {
> +        goto trace_exit;
> +    }
> +
> +    inst = (SpaprOfInstance *) g_hash_table_lookup(spapr->of_instances,
> +                                                   GINT_TO_POINTER(ihandle));
> +    if (!inst) {
> +        goto trace_exit;
> +    }
> +
> +    readstr(methodaddr, method, sizeof(method));
> +
> +    if (strcmp(inst->path, "/") == 0) {
> +        if (strcmp(method, "ibm,client-architecture-support") == 0) {
> +            ret = do_client_architecture_support(POWERPC_CPU(first_cpu), spapr,
> +                                                 param1, FDT_MAX_SIZE);

This actually calls back to spapr and needs to pass SpaprMachineState but 
does not otherwise need anything from inside it so spapr state could be 
private data for machine callbacks from vof point of view.

> +            *ret2 = 0;
> +        }
> +    } else if (strcmp(inst->path, "/rtas") == 0) {
> +        if (strcmp(method, "instantiate-rtas") == 0) {
> +            of_client_instantiate_rtas(spapr, param1);
> +            ret = 0;
> +            *ret2 = param1; /* rtas-base */
> +        }
> +    } else {
> +        trace_spapr_of_client_error_unknown_method(method);
> +    }
> +
> +trace_exit:
> +    trace_spapr_of_client_method(ihandle, method, param1, ret, *ret2);
> +
> +    return ret;
> +}
> +
> +static uint32_t of_client_call_interpret(SpaprMachineState *spapr,
> +                                         uint32_t cmdaddr, uint32_t param1,
> +                                         uint32_t param2, uint32_t *ret2)
> +{
> +    uint32_t ret = -1;
> +    char cmd[256] = "";
> +
> +    readstr(cmdaddr, cmd, sizeof(cmd));
> +    trace_spapr_of_client_interpret(cmd, param1, param2, ret, *ret2);
> +
> +    return ret;

spapr parameter unused (yet? maybe this is leftover from stripping this 
down or just there for symmetry)

> +}
> +
> +static void of_client_quiesce(SpaprMachineState *spapr)
> +{
> +    int rc = fdt_pack(spapr->fdt_blob);
> +
> +    assert(rc == 0);
> +
> +    spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
> +    spapr->fdt_initial_size = spapr->fdt_size;
> +    of_client_clamed_dump(spapr->claimed);

Nothing spapr specific, just fdt and vof state.

> +}
> +
> +static target_ulong spapr_h_of_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                                      target_ulong opcode, target_ulong *args)
> +{
> +    target_ulong of_client_args = ppc64_phys_to_real(args[0]);
> +    struct prom_args pargs = { 0 };
> +    char service[64];
> +    unsigned nargs, nret;
> +    int i, servicelen;
> +
> +    cpu_physical_memory_read(of_client_args, &pargs, sizeof(pargs));
> +    nargs = be32_to_cpu(pargs.nargs);
> +    nret = be32_to_cpu(pargs.nret);
> +    readstr(be32_to_cpu(pargs.service), service, sizeof(service));
> +    servicelen = strlen(service);
> +
> +    if (nargs >= ARRAY_SIZE(pargs.args)) {
> +        return H_PARAMETER;
> +    }
> +
> +#define cmpserv(s, a, r) \
> +    cmpservice(service, servicelen, nargs, nret, (s), sizeof(s), (a), (r))
> +
> +    if (cmpserv("finddevice", 1, 1)) {
> +        pargs.args[nargs] =
> +            of_client_finddevice(spapr->fdt_blob,
> +                                 be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("getprop", 4, 1)) {
> +        pargs.args[nargs] =
> +            of_client_getprop(spapr->fdt_blob,
> +                              be32_to_cpu(pargs.args[0]),
> +                              be32_to_cpu(pargs.args[1]),
> +                              be32_to_cpu(pargs.args[2]),
> +                              be32_to_cpu(pargs.args[3]));
> +    } else if (cmpserv("getproplen", 2, 1)) {
> +        pargs.args[nargs] =
> +            of_client_getproplen(spapr->fdt_blob,
> +                                 be32_to_cpu(pargs.args[0]),
> +                                 be32_to_cpu(pargs.args[1]));
> +    } else if (cmpserv("setprop", 4, 1)) {
> +        pargs.args[nargs] =
> +            of_client_setprop(spapr,
> +                              be32_to_cpu(pargs.args[0]),
> +                              be32_to_cpu(pargs.args[1]),
> +                              be32_to_cpu(pargs.args[2]),
> +                              be32_to_cpu(pargs.args[3]));
> +    } else if (cmpserv("nextprop", 3, 1)) {
> +        pargs.args[nargs] =
> +            of_client_nextprop(spapr->fdt_blob,
> +                               be32_to_cpu(pargs.args[0]),
> +                               be32_to_cpu(pargs.args[1]),
> +                               be32_to_cpu(pargs.args[2]));
> +    } else if (cmpserv("peer", 1, 1)) {
> +        pargs.args[nargs] =
> +            of_client_peer(spapr->fdt_blob,
> +                           be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("child", 1, 1)) {
> +        pargs.args[nargs] =
> +            of_client_child(spapr->fdt_blob,
> +                            be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("parent", 1, 1)) {
> +        pargs.args[nargs] =
> +            of_client_parent(spapr->fdt_blob,
> +                             be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("open", 1, 1)) {
> +        pargs.args[nargs] = of_client_open(spapr, be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("close", 1, 0)) {
> +        of_client_close(spapr, be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("instance-to-package", 1, 1)) {
> +        pargs.args[nargs] =
> +            of_client_instance_to_package(spapr,
> +                                          be32_to_cpu(pargs.args[0]));
> +    } else if (cmpserv("package-to-path", 3, 1)) {
> +        pargs.args[nargs] =
> +            of_client_package_to_path(spapr->fdt_blob,
> +                                      be32_to_cpu(pargs.args[0]),
> +                                      be32_to_cpu(pargs.args[1]),
> +                                      be32_to_cpu(pargs.args[2]));
> +    } else if (cmpserv("instance-to-path", 3, 1)) {
> +        pargs.args[nargs] =
> +            of_client_instance_to_path(spapr,
> +                                       be32_to_cpu(pargs.args[0]),
> +                                       be32_to_cpu(pargs.args[1]),
> +                                       be32_to_cpu(pargs.args[2]));
> +    } else if (cmpserv("claim", 3, 1)) {
> +        pargs.args[nargs] =
> +            of_client_claim(spapr,
> +                            be32_to_cpu(pargs.args[0]),
> +                            be32_to_cpu(pargs.args[1]),
> +                            be32_to_cpu(pargs.args[2]));
> +    } else if (cmpserv("release", 2, 0)) {
> +        pargs.args[nargs] =
> +            of_client_release(spapr,
> +                              be32_to_cpu(pargs.args[0]),
> +                              be32_to_cpu(pargs.args[1]));
> +    } else if (cmpserv("call-method", 0, 0)) {
> +        pargs.args[nargs] =
> +            of_client_call_method(spapr,
> +                                  be32_to_cpu(pargs.args[0]),
> +                                  be32_to_cpu(pargs.args[1]),
> +                                  be32_to_cpu(pargs.args[2]),
> +                                  be32_to_cpu(pargs.args[3]),
> +                                  be32_to_cpu(pargs.args[4]),
> +                                  be32_to_cpu(pargs.args[5]),
> +                                  pargs.args + nargs + 1);
> +    } else if (cmpserv("interpret", 0, 0)) {
> +        pargs.args[nargs] =
> +            of_client_call_interpret(spapr,
> +                                     be32_to_cpu(pargs.args[0]),
> +                                     be32_to_cpu(pargs.args[1]),
> +                                     be32_to_cpu(pargs.args[2]),
> +                                     pargs.args + nargs + 1);
> +    } else if (cmpserv("milliseconds", 0, 1)) {
> +        pargs.args[nargs] = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> +    } else if (cmpserv("quiesce", 0, 0)) {
> +        of_client_quiesce(spapr);
> +    } else if (cmpserv("exit", 0, 0)) {
> +        error_report("Stopped as the VM requested \"exit\"");
> +        vm_stop(RUN_STATE_PAUSED); /* Or qemu_system_guest_panicked(NULL); ? */
> +    } else {
> +        trace_spapr_of_client_error_unknown_service(service, nargs, nret);
> +        pargs.args[nargs] = -1;
> +    }
> +
> +    for (i = 0; i < nret; ++i) {
> +        pargs.args[nargs + i] = be32_to_cpu(pargs.args[nargs + i]);
> +    }
> +
> +    cpu_physical_memory_write(of_client_args, &pargs,
> +                              sizeof(uint32_t) * (3 + nargs + nret));
> +
> +    return H_SUCCESS;
> +}
> +
> +static void of_instance_free(gpointer data)
> +{
> +    SpaprOfInstance *inst = (SpaprOfInstance *) data;
> +
> +    g_free(inst->params);
> +    g_free(inst->path);
> +    g_free(inst);
> +}
> +
> +void spapr_setup_of_client(SpaprMachineState *spapr, target_ulong *stack_ptr)
> +{
> +    if (spapr->claimed) {
> +        g_array_unref(spapr->claimed);
> +    }
> +    if (spapr->of_instances) {
> +        g_hash_table_unref(spapr->of_instances);
> +    }
> +
> +    spapr->claimed = g_array_new(false, false, sizeof(SpaprOfClaimed));
> +    spapr->of_instances = g_hash_table_new_full(g_direct_hash, g_direct_equal,
> +                                                NULL, of_instance_free);
> +
> +    *stack_ptr = of_client_claim(spapr, OF_STACK_ADDR, OF_STACK_SIZE,
> +                                 OF_STACK_SIZE);
> +    if (*stack_ptr == -1) {
> +        error_report("Memory allocation for stack failed");
> +        exit(1);
> +    }
> +    /*
> +     * Stack grows downwards and we also reserve here space for
> +     * the minimum stack frame.
> +     */
> +    *stack_ptr += OF_STACK_SIZE - 0x20;
> +
> +    if (spapr->kernel_size &&
> +        of_client_claim(spapr, spapr->kernel_addr,
> +                        spapr->kernel_size, 0) == -1) {
> +        error_report("Memory for kernel is in use");
> +        exit(1);
> +    }
> +
> +    if (spapr->initrd_size &&
> +        of_client_claim(spapr, spapr->initrd_base,
> +                        spapr->initrd_size, 0) == -1) {
> +        error_report("Memory for initramdisk is in use");
> +        exit(1);
> +    }
> +
> +    /*
> +     * We skip writing FDT as nothing expects it; OF client interface is
> +     * going to be used for reading the device tree.
> +     */
> +}
> +
> +static gint of_claimed_compare_func(gconstpointer a, gconstpointer b)
> +{
> +    return ((SpaprOfClaimed *)a)->start - ((SpaprOfClaimed *)b)->start;
> +}
> +
> +static void of_client_dt_memory_available(void *fdt, GArray *claimed,
> +                                          uint64_t base)
> +{
> +    int i, n, offset, proplen = 0;
> +    uint64_t *mem0_reg;
> +    struct { uint64_t start, size; } *avail;
> +
> +    if (!fdt || !claimed) {
> +        return;
> +    }
> +
> +    offset = fdt_path_offset(fdt, "/memory@0");
> +    _FDT(offset);
> +
> +    mem0_reg = (uint64_t *) fdt_getprop(fdt, offset, "reg", &proplen);
> +    if (!mem0_reg || proplen != 2 * sizeof(uint64_t)) {
> +        return;
> +    }
> +
> +    g_array_sort(claimed, of_claimed_compare_func);
> +    of_client_clamed_dump(claimed);
> +
> +    avail = g_malloc0(sizeof(uint64_t) * 2 * claimed->len);
> +    for (i = 0, n = 0; i < claimed->len; ++i) {
> +        SpaprOfClaimed c = g_array_index(claimed, SpaprOfClaimed, i);
> +
> +        avail[n].start = c.start + c.size;
> +        if (i < claimed->len - 1) {
> +            SpaprOfClaimed cn = g_array_index(claimed, SpaprOfClaimed, i + 1);
> +
> +            avail[n].size = cn.start - avail[n].start;
> +        } else {
> +            avail[n].size = be64_to_cpu(mem0_reg[1]) - avail[n].start;
> +        }
> +
> +        if (avail[n].size) {
> +#ifdef DEBUG
> +            error_printf("AVAIL %lx..%lx size=%ld\n", avail[n].start,
> +                         avail[n].start + avail[n].size, avail[n].size);
> +#endif
> +            avail[n].start = cpu_to_be64(avail[n].start);
> +            avail[n].size = cpu_to_be64(avail[n].size);
> +            ++n;
> +        }
> +    }
> +    _FDT((fdt_setprop(fdt, offset, "available", avail,
> +                      sizeof(uint64_t) * 2 * n)));
> +    g_free(avail);
> +}
> +
> +void spapr_of_client_dt(SpaprMachineState *spapr, void *fdt)
> +{
> +    uint32_t phandle;
> +    int i, offset, proplen = 0;
> +    const void *prop;
> +    bool found = false;
> +    GArray *phandles = g_array_new(false, false, sizeof(uint32_t));
> +
> +    /* Add options now, doing it at the end of this __func__ breaks it :-/ */
> +    offset = fdt_add_subnode(fdt, 0, "options");
> +    if (offset > 0) {
> +        struct winsize ws;
> +
> +        if (ioctl(1, TIOCGWINSZ, &ws) != -1) {
> +            _FDT(fdt_setprop_cell(fdt, offset, "screen-#columns", ws.ws_col));
> +            _FDT(fdt_setprop_cell(fdt, offset, "screen-#rows", ws.ws_row));
> +        }
> +        _FDT(fdt_setprop_cell(fdt, offset, "real-mode?", 1));
> +    }
> +
> +    /* Find all predefined phandles */
> +    for (offset = fdt_next_node(fdt, -1, NULL);
> +         offset >= 0;
> +         offset = fdt_next_node(fdt, offset, NULL)) {
> +        prop = fdt_getprop(fdt, offset, "phandle", &proplen);
> +        if (prop && proplen == sizeof(uint32_t)) {
> +            phandle = fdt32_ld(prop);
> +            g_array_append_val(phandles, phandle);
> +        }
> +    }
> +
> +    /* Assign phandles skipping the predefined ones */
> +    for (offset = fdt_next_node(fdt, -1, NULL), phandle = 1;
> +         offset >= 0;
> +         offset = fdt_next_node(fdt, offset, NULL), ++phandle) {
> +
> +        prop = fdt_getprop(fdt, offset, "phandle", &proplen);
> +        if (prop) {
> +            continue;
> +        }
> +        /* Check if the current phandle is not allocated already */
> +        for ( ; ; ++phandle) {
> +            for (i = 0, found = false; i < phandles->len; ++i) {
> +                if (phandle == g_array_index(phandles, uint32_t, i)) {
> +                    found = true;
> +                    break;
> +                }
> +            }
> +            if (!found) {
> +                break;
> +            }
> +        }
> +        _FDT(fdt_setprop_cell(fdt, offset, "phandle", phandle));
> +    }
> +    g_array_unref(phandles);
> +
> +    of_client_dt_memory_available(fdt, spapr->claimed, spapr->claimed_base);

Only uses claimed, so that's vof state again, not spapr machine state 
proper.

> +}
> +
> +void spapr_of_client_dt_finalize(SpaprMachineState *spapr)
> +{
> +    void *fdt = spapr->fdt_blob;
> +    char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
> +    int chosen = fdt_path_offset(fdt, "/chosen");
> +
> +    /*
> +     * SLOF-less setup requires an open instance of stdout for early
> +     * kernel printk. By now all phandles are settled so we can open
> +     * the default serial console.
> +     */
> +    if (stdout_path) {
> +        _FDT(fdt_setprop_cell(fdt, chosen, "stdout",
> +                              spapr_of_client_open(spapr, stdout_path)));
> +    }
> +}
> +
> +void spapr_of_client_machine_init(SpaprMachineState *spapr)
> +{
> +    spapr_register_hypercall(KVMPPC_H_OF_CLIENT, spapr_h_of_client);
> +}

These may be the only really spapr specific functions in this file, the 
rest could be called vof_of_client to make it more clear it's separate 
from spapr and have these 2-3 callbacks implemented by spapr otherwise 
keeping SpaprMachineState out of this file.

[...]

> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index dcc06d49b5a2..d913c5cc8390 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -71,6 +71,27 @@ spapr_rtas_ibm_configure_connector_invalid(uint32_t index) "DRC index: 0x%"PRIx3
> spapr_vio_h_reg_crq(uint64_t reg, uint64_t queue_addr, uint64_t queue_len) "CRQ for dev 0x%" PRIx64 " registered at 0x%" PRIx64 "/0x%" PRIx64
> spapr_vio_free_crq(uint32_t reg) "CRQ for dev 0x%" PRIx32 " freed"
>
> +# spapr_of_client.c
> +spapr_of_client_error_str_truncated(const char *s, int len) "%s truncated to %d"
> +spapr_of_client_error_param(const char *method, int nargscheck, int nretcheck, int nargs, int nret) "%s takes/returns %d/%d, not %d/%d"
> +spapr_of_client_error_unknown_service(const char *service, int nargs, int nret) "\"%s\" args=%d rets=%d"
> +spapr_of_client_error_unknown_method(const char *method) "\"%s\""
> +spapr_of_client_error_unknown_ihandle_close(uint32_t ih) "ih=0x%x"
> +spapr_of_client_error_unknown_path(const char *path) "\"%s\""
> +spapr_of_client_finddevice(const char *path, uint32_t ph) "\"%s\" => ph=0x%x"
> +spapr_of_client_canon(const char *path) "\"%s\""
> +spapr_of_client_claim(uint32_t virt, uint32_t size, uint32_t align, uint32_t ret) "virt=0x%x size=0x%x align=0x%x => 0x%x"
> +spapr_of_client_release(uint32_t virt, uint32_t size, uint32_t ret) "virt=0x%x size=0x%x => 0x%x"
> +spapr_of_client_method(uint32_t ihandle, const char *method, uint32_t param, uint32_t ret, uint32_t ret2) "ih=0x%x \"%s\"(0x%x) => 0x%x 0x%x"
> +spapr_of_client_getprop(uint32_t ph, const char *prop, uint32_t ret, const char *val) "ph=0x%x \"%s\" => len=%d [%s]"
> +spapr_of_client_getproplen(uint32_t ph, const char *prop, uint32_t ret) "ph=0x%x \"%s\" => len=%d"
> +spapr_of_client_setprop(uint32_t ph, const char *prop, const char *val, uint32_t ret) "ph=0x%x \"%s\" [%s] => len=%d"
> +spapr_of_client_open(const char *path, uint32_t ph, uint32_t ih) "%s ph=0x%x => ih=0x%x"
> +spapr_of_client_interpret(const char *cmd, uint32_t param1, uint32_t param2, uint32_t ret, uint32_t ret2) "[%s] 0x%x 0x%x => 0x%x 0x%x"
> +spapr_of_client_package_to_path(uint32_t ph, const char *tmp, uint32_t ret) "ph=0x%x => %s len=%d"
> +spapr_of_client_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, uint32_t ret) "ih=0x%x ph=0x%x => %s len=%d"
> +spapr_of_client_instance_to_package(uint32_t ih, uint32_t ph) "ih=0x%x => ph=0x%x"
> +
> # ppc.c
> ppc_tb_adjust(uint64_t offs1, uint64_t offs2, int64_t diff, int64_t seconds) "adjusted from 0x%"PRIx64" to 0x%"PRIx64", diff %"PRId64" (%"PRId64"s)"


Can you also call these trace_vof_* or similar to keep them distinct from 
spapr and make it easier to grep for what's spapr specific?

Regards,
BALATON Zoltan
--3866299591-325369001-1607341722=:44762--

