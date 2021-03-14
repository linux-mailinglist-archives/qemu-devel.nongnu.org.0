Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FE633A8C2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:27:17 +0100 (CET)
Received: from localhost ([::1]:39048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLa8i-0006Te-1s
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLa7L-0005jE-2G
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:25:51 -0400
Received: from relay64.bu.edu ([128.197.228.104]:58897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLa7I-0001sx-7k
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:25:50 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 12ENPBeq002116
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 14 Mar 2021 19:25:14 -0400
Date: Sun, 14 Mar 2021 19:25:11 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] qtest/libqos/meson: Restrict architecture specific objects
Message-ID: <20210314232511.4ylyi3jnseec6jps@mozz.bu.edu>
References: <20210314225308.2582284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210314225308.2582284-1-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210314 2353, Philippe Mathieu-Daudé wrote:
> Various libqos files are architecture specific.
> Restrict the ARM/PPC/X86 units to their targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

I thought qos-test is reused for all the machines, and all the arch
checking is done at runtime. Also, are these variables actually defined
when building tests? There seem to be some link failures:

ninja -j`nproc` tests/qtest/qos-test
clang-11  -o tests/qtest/qos-test ...
/usr/bin/ld: tests/qtest/qos-test.p/virtio-blk-test.c.o: in function `pci_hotplug':
undefined reference to `qpci_unplug_acpi_device_test

-Alex

>  tests/qtest/libqos/meson.build | 51 ++++++++++++++++++++++------------
>  1 file changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
> index 1cddf5bdaa1..817c2cc2c20 100644
> --- a/tests/qtest/libqos/meson.build
> +++ b/tests/qtest/libqos/meson.build
> @@ -1,4 +1,8 @@
> -libqos_srcs = files('../libqtest.c',
> +libqos_ss = ss.source_set()
> +
> +libqos_ss.add(genh)
> +
> +libqos_ss.add(files('../libqtest.c',
>          'qgraph.c',
>          'qos_external.c',
>          'pci.c',
> @@ -6,18 +10,6 @@
>          'malloc.c',
>          'libqos.c',
>  
> -        # spapr
> -        'malloc-spapr.c',
> -        'libqos-spapr.c',
> -        'rtas.c',
> -        'pci-spapr.c',
> -
> -        # pc
> -        'pci-pc.c',
> -        'malloc-pc.c',
> -        'libqos-pc.c',
> -        'ahci.c',
> -
>          # usb
>          'usb.c',
>  
> @@ -39,7 +31,28 @@
>          'virtio-rng.c',
>          'virtio-scsi.c',
>          'virtio-serial.c',
> +))
>  
> +libqos_ss.add(when: 'TARGET_I386', if_true: files(
> +        'pci-pc.c',
> +        'malloc-pc.c',
> +        'libqos-pc.c',
> +
> +        'ahci.c',
> +
> +        # qgraph machines:
> +        'x86_64_pc-machine.c',
> +))
> +libqos_ss.add(when: 'TARGET_PPC64', if_true: files(
> +        'malloc-spapr.c',
> +        'libqos-spapr.c',
> +        'rtas.c',
> +        'pci-spapr.c',
> +
> +        # qgraph machines:
> +        'ppc64_pseries-machine.c',
> +))
> +libqos_ss.add(when: 'TARGET_ARM', if_true: files(
>          # qgraph machines:
>          'aarch64-xlnx-zcu102-machine.c',
>          'arm-imx25-pdk-machine.c',
> @@ -49,11 +62,15 @@
>          'arm-smdkc210-machine.c',
>          'arm-virt-machine.c',
>          'arm-xilinx-zynq-a9-machine.c',
> -        'ppc64_pseries-machine.c',
> -        'x86_64_pc-machine.c',
> -)
> +))
> +libqos_ss.add(when: 'TARGET_AARCH64', if_true: files(
> +        # qgraph machines:
> +        'aarch64-xlnx-zcu102-machine.c',
> +))
>  
> -libqos = static_library('qos', libqos_srcs + genh,
> +libqos_ss = libqos_ss.apply(config_host, strict: false)
> +
> +libqos = static_library('qos', libqos_ss.sources() + genh,
>                          name_suffix: 'fa',
>                          build_by_default: false)
>  
> -- 
> 2.26.2
> 

