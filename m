Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B46613C8
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 07:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEPVF-0001tQ-Rz; Sun, 08 Jan 2023 01:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEPVD-0001s6-GN
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 01:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEPVA-0003Je-8R
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 01:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673160590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qNGDwUtYWMQMmQOpmqEBoEHP4xA1cItNiHsnSACei78=;
 b=e67Ej8yG10IBfqjdPDxAyYZcNaGrgbyUBn1+wQOcwfFXKEYHh65u6nsVMpDzpsqJ07RRQH
 1N2b4gbvhtYvCfLT8DmbeEwIdtIKoJOj/XUq+8vOGP+G4NOtxacvbzGtKeVXGb2ryGvTmS
 YSfWEuZ3+1UbBmw27JV6l5cS+sPfsuc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-bxjmAKiFPqWsJXfd2Nn5vQ-1; Sun, 08 Jan 2023 01:49:48 -0500
X-MC-Unique: bxjmAKiFPqWsJXfd2Nn5vQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 o5-20020adfba05000000b0029064ccbe46so681879wrg.9
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 22:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNGDwUtYWMQMmQOpmqEBoEHP4xA1cItNiHsnSACei78=;
 b=uAVB1QKoUzKaI+ePgy/zflo5SR1JR3WuolUbrz2OK8GkxCAyriy4Elgupn/baFNspA
 eW2HdET6NyTJtg2yKBlVKWW5xQFZxWAOVjvNMfG9VHmZPHrXrLJqXyGi9eisZDYJzfn4
 bUOiZm2LpJ5NZswcz4I/GtU8PdoD6tgD7img2fOXF40QFLIV+Jmtrl94SX+7Nh7rwGs2
 EHufZ/KntC4MxPf/ulR6yS4CK4VVV/Lue6C3Bolt3U8FalLhZx7TvFKy3XAzJhCICN9u
 Sy940PV6XcNwE4MDCaCbkgXhH2xZUmWD/5jvAnIaWuy4axWQhvuHB9n2EqJNAq1km6bx
 qbuA==
X-Gm-Message-State: AFqh2koy0Gf+CTAA2473dBsvQnaLpF//fs127IfDnsGSKtu2GKI/iEC9
 hGS0g+Ad6U0A6UqUyOse+3ycRjMJIbTH7Ve0tIOR+yNsTrkrgyj1XLV/jgcO9/75W92h1lF8PS0
 a+INAPPRdf5uGcGw=
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id
 e15-20020a05600c4e4f00b003cf9d32db67mr42761801wmq.3.1673160587263; 
 Sat, 07 Jan 2023 22:49:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuIUYnVUO1jrkS42MSlDmqtbYjJf7wC+ahppzvv26T0eiHn/CICQD+ZHV6RArpTllYupDf8lA==
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id
 e15-20020a05600c4e4f00b003cf9d32db67mr42761774wmq.3.1673160587001; 
 Sat, 07 Jan 2023 22:49:47 -0800 (PST)
Received: from redhat.com ([2.52.141.223]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003c6f8d30e40sm13207546wms.31.2023.01.07.22.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 22:49:46 -0800 (PST)
Date: Sun, 8 Jan 2023 01:49:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn,
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de,
 jasowang@redhat.com, vikram.garhwal@amd.com,
 francisco.iglesias@amd.com, clg@kaod.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de
Subject: Re: [PATCH v2 0/4] Clean up includes
Message-ID: <20230108014842-mutt-send-email-mst@kernel.org>
References: <20221222120813.727830-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222120813.727830-1-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Dec 22, 2022 at 01:08:09PM +0100, Markus Armbruster wrote:
> Back in 2016, we discussed[1] rules for headers, and these were
> generally liked:
> 
> 1. Have a carefully curated header that's included everywhere first.  We
>    got that already thanks to Peter: osdep.h.
> 
> 2. Headers should normally include everything they need beyond osdep.h.
>    If exceptions are needed for some reason, they must be documented in
>    the header.  If all that's needed from a header is typedefs, put
>    those into qemu/typedefs.h instead of including the header.
> 
> 3. Cyclic inclusion is forbidden.
> 
> This series fixes a number of rule violations.

I had to drop this for now due to failures on bsd in particular.
See Peter's answer to my pull.
Markus when you merge this feel free to use:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> It is based on
> 
>     [PATCH v2 0/4] hw/ppc: Clean up includes
>     [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
>     [PATCH v2 0/3] block: Clean up includes
>     [PATCH v3 0/5] coroutine: Clean up includes
> 
> With all of these applied, just three inclusion loops remain reachable
> from include/:
> 
>     target/microblaze/cpu.h target/microblaze/mmu.h
> 
>     target/nios2/cpu.h target/nios2/mmu.h
> 
>     target/riscv/cpu.h target/riscv/pmp.h
> 
> Breaking them would be nice, but I'm out of steam.
> 
> v2:
> * Rebased
> * PATCH 3: v1 posted separately
> * PATCH 4: New
> 
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
> 
> Based-on: <20221222104628.659681-1-armbru@redhat.com>
> 
> Markus Armbruster (4):
>   include/hw/virtio: Break inclusion loop
>   include: Include headers where needed
>   include: Don't include qemu/osdep.h
>   docs/devel: Rules on #include in headers
> 
>  docs/devel/style.rst                        | 7 +++++++
>  bsd-user/qemu.h                             | 1 -
>  crypto/block-luks-priv.h                    | 1 -
>  include/exec/plugin-gen.h                   | 1 +
>  include/hw/acpi/erst.h                      | 3 +++
>  include/hw/char/cmsdk-apb-uart.h            | 1 +
>  include/hw/char/goldfish_tty.h              | 1 +
>  include/hw/char/xilinx_uartlite.h           | 1 +
>  include/hw/cris/etraxfs.h                   | 1 +
>  include/hw/cxl/cxl_host.h                   | 1 -
>  include/hw/display/macfb.h                  | 3 ++-
>  include/hw/dma/sifive_pdma.h                | 2 ++
>  include/hw/i386/ioapic_internal.h           | 1 +
>  include/hw/i386/sgx-epc.h                   | 1 +
>  include/hw/input/pl050.h                    | 1 -
>  include/hw/intc/goldfish_pic.h              | 2 ++
>  include/hw/intc/loongarch_pch_msi.h         | 2 ++
>  include/hw/intc/loongarch_pch_pic.h         | 2 ++
>  include/hw/intc/nios2_vic.h                 | 2 ++
>  include/hw/misc/mchp_pfsoc_dmc.h            | 2 ++
>  include/hw/misc/mchp_pfsoc_ioscb.h          | 2 ++
>  include/hw/misc/mchp_pfsoc_sysreg.h         | 2 ++
>  include/hw/misc/pvpanic.h                   | 1 +
>  include/hw/misc/sifive_e_prci.h             | 3 ++-
>  include/hw/misc/sifive_u_otp.h              | 3 ++-
>  include/hw/misc/sifive_u_prci.h             | 3 ++-
>  include/hw/misc/virt_ctrl.h                 | 2 ++
>  include/hw/misc/xlnx-versal-pmc-iou-slcr.h  | 1 +
>  include/hw/net/lasi_82596.h                 | 2 +-
>  include/hw/net/xlnx-zynqmp-can.h            | 1 +
>  include/hw/ppc/pnv_psi.h                    | 2 +-
>  include/hw/riscv/boot_opensbi.h             | 2 ++
>  include/hw/riscv/microchip_pfsoc.h          | 3 +++
>  include/hw/riscv/numa.h                     | 1 +
>  include/hw/riscv/sifive_u.h                 | 2 ++
>  include/hw/riscv/spike.h                    | 2 +-
>  include/hw/riscv/virt.h                     | 2 +-
>  include/hw/ssi/sifive_spi.h                 | 3 +++
>  include/hw/timer/sse-timer.h                | 1 +
>  include/hw/tricore/triboard.h               | 1 -
>  include/hw/usb/hcd-dwc3.h                   | 1 +
>  include/hw/usb/hcd-musb.h                   | 2 ++
>  include/hw/usb/xlnx-usb-subsystem.h         | 2 ++
>  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 3 +++
>  include/hw/virtio/virtio-mmio.h             | 2 +-
>  include/hw/virtio/virtio.h                  | 1 -
>  include/qemu/plugin-memory.h                | 3 +++
>  include/qemu/userfaultfd.h                  | 1 -
>  include/sysemu/dirtyrate.h                  | 2 ++
>  include/sysemu/dump.h                       | 1 +
>  include/user/syscall-trace.h                | 1 +
>  net/vmnet_int.h                             | 1 -
>  qga/cutils.h                                | 1 -
>  target/hexagon/hex_arch_types.h             | 1 -
>  target/hexagon/mmvec/macros.h               | 1 -
>  target/riscv/pmu.h                          | 1 -
>  hw/virtio/virtio-qmp.c                      | 1 +
>  hw/virtio/virtio.c                          | 1 +
>  qga/cutils.c                                | 3 ++-
>  59 files changed, 82 insertions(+), 22 deletions(-)
> 
> -- 
> 2.38.1


