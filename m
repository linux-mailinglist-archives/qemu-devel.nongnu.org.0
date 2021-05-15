Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B718381AFB
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 22:20:44 +0200 (CEST)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li0m8-0000Tm-WA
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 16:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0kt-0007aA-A1; Sat, 15 May 2021 16:19:23 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:14784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0ko-000819-PC; Sat, 15 May 2021 16:19:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8760B7456E3;
 Sat, 15 May 2021 22:19:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0FF1F745708; Sat, 15 May 2021 22:19:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0DBC57456B4;
 Sat, 15 May 2021 22:19:14 +0200 (CEST)
Date: Sat, 15 May 2021 22:19:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
In-Reply-To: <20210422125819.1122661-1-aik@ozlabs.ru>
Message-ID: <8ee8ae9-63f2-9633-1cf0-b4738c89f5fc@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:
> The PAPR platform describes an OS environment that's presented by
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
> 0..e60 - the initial firmware
> 8000..10000 - stack
> 400000.. - kernel
> 3ea0000.. - initramdisk
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
> The immediate benefit is much faster booting time which especially
> crucial with fully emulated early CPU bring up environments. Also this
> may come handy when/if GRUB-in-the-userspace sees light of the day.
>
> This separates VOF and sPAPR in a hope that VOF bits may be reused by
> other POWERPC boards which do not support pSeries.
>
> This is coded in assumption that later on we might be adding support for
> booting from QEMU backends (blockdev is the first candidate) without
> devices/drivers in between as OF1275 does not require that and
> it is quite easy to so.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
[...]
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 86d6f379d1c3..dcd2e5c80df4 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -28,6 +28,8 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
>   'spapr_rtas_ddw.c',
>   'spapr_numa.c',
>   'pef.c',
> +  'spapr_vof.c',
> +  'vof.c',
> ))
> ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
> ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(

It may be better to add a new CONFIG_VOF option to compile vof.c that I 
can then depend on in CONFIG_PEGASOS2 instead of having to add vof.c like 
it's added here. (If VOF is made independent of SPAPR then it deserves to 
have an own config option and the machines using it can depend on that.)

Regards,
BALATON Zoltan

