Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DC2673762
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:50:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITQI-0001JB-Gy; Thu, 19 Jan 2023 06:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pITQG-0001ID-EP
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:49:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pITQD-0007gk-LE
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674128972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gXKBhQL1oyDDx1ruE2azlrsK+OKUgC5n4NqJsx1Hc+Q=;
 b=jHJPDYaemEFP2hZMHL6u5BZtoIj/L8xSEZ6A21QICsDgH+cCEIkaHQaK7e3XhAONUJPffi
 pudwaukintVN/JAEICA3Inn50WfZgS5t7OGKs0BWCfTsVDfJbL9UISx+NGJ6zgI5n3DhpI
 pwehkvMrh0J/c4eXwAhwl7Y1i3mtfNI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-BHNFMwnEMku_C5tnRQ0RnA-1; Thu, 19 Jan 2023 06:49:31 -0500
X-MC-Unique: BHNFMwnEMku_C5tnRQ0RnA-1
Received: by mail-wr1-f69.google.com with SMTP id
 t20-20020adfba54000000b002be0eb97f4fso304279wrg.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXKBhQL1oyDDx1ruE2azlrsK+OKUgC5n4NqJsx1Hc+Q=;
 b=3DTJGb9QDAzwfHi/7oB0s5WzmX3zqZSlBjgvfRrsMzZ7uP1wPgo7ZeFqd6/MTwqn8F
 Zj3H3VPcDOl39asFpsFTN9P0E2J4g57jspkdcxVrFN5cUHk610aa3QGGAdJNx7EAyiFB
 H8tAexBPKkZPaW8fbuDFWvN3klpujMsiYqf3v9jLBbBlRBBFkdrww8Hd12NIvVLWZGmB
 CAXVEfKPgCA7G/ir3NwrmUs/G3QKQve0NPCtfVUxWFFrsLEp9i2tSrINqsACc8wDeFcL
 14l6aiz1tPs6n5udyvDcYyMhzK3SAoThUziAIYMyyZpV6upBiptYDC8KlOzy7PGpZeBe
 aTUA==
X-Gm-Message-State: AFqh2kpLtqpSWGT/UuzSkwGGhgtsKv9hFazbpMvkv7YfHZ8RruKdLwcD
 W7VOmagnnpecExV1rDU2tbaf24ya0UNQvAI0RhAqU9lGhu7MX7X62jLbE1CjcuyFHNy7SsngG5h
 MP+o43ECjpfPpFuM=
X-Received: by 2002:a05:600c:995:b0:3da:f4f5:ad0e with SMTP id
 w21-20020a05600c099500b003daf4f5ad0emr9882102wmp.9.1674128970428; 
 Thu, 19 Jan 2023 03:49:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtyFX5XBDNN1mc+shz+DynLpyHcpR1+tXEmRLr388f/3Iq/9VIoedm3n4a4NV+D1lBcrxBsjA==
X-Received: by 2002:a05:600c:995:b0:3da:f4f5:ad0e with SMTP id
 w21-20020a05600c099500b003daf4f5ad0emr9882077wmp.9.1674128970208; 
 Thu, 19 Jan 2023 03:49:30 -0800 (PST)
Received: from redhat.com ([2.52.28.74]) by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c35c100b003db06493ee7sm4939784wmq.47.2023.01.19.03.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:49:29 -0800 (PST)
Date: Thu, 19 Jan 2023 06:49:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 dgilbert@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 00/19] Clean up includes
Message-ID: <20230119064833-mutt-send-email-mst@kernel.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Jan 19, 2023 at 07:59:40AM +0100, Markus Armbruster wrote:
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
> This series fixes violations of rule 2.  I may have split patches too
> aggressively.  Let me know if you want some squashed together.

series
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge.

> v4:
> * PATCH 01-03: New
> * PATCH 04-15: Previous version redone with scripts/clean-includes,
>   	       result split up for review
> * PATCH 16-19: New
> 
> v3:
> * Rebased, old PATCH 1+2+4 are in master as commit
>   881e019770..f07ceffdf5
> * PATCH 1: Fix bsd-user
> 
> v2:
> * Rebased
> * PATCH 3: v1 posted separately
> * PATCH 4: New
> 
> [1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
> 
> Markus Armbruster (19):
>   scripts/clean-includes: Fully skip / ignore files
>   scripts/clean-includes: Don't claim duplicate headers found when not
>   scripts/clean-includes: Skip symbolic links
>   bsd-user: Clean up includes
>   crypto: Clean up includes
>   hw/cxl: Clean up includes
>   hw/input: Clean up includes
>   hw/tricore: Clean up includes
>   qga: Clean up includes
>   migration: Clean up includes
>   net: Clean up includes
>   target/hexagon: Clean up includes
>   riscv: Clean up includes
>   block: Clean up includes
>   accel: Clean up includes
>   Fix non-first inclusions of qemu/osdep.h
>   Don't include headers already included by qemu/osdep.h
>   9p: Drop superfluous include of linux/limits.h
>   Drop duplicate #include
> 
>  backends/tpm/tpm_ioctl.h          |  2 --
>  bsd-user/bsd-proc.h               |  4 ----
>  bsd-user/qemu.h                   |  1 -
>  crypto/block-luks-priv.h          |  1 -
>  fsdev/p9array.h                   |  2 --
>  include/block/graph-lock.h        |  1 -
>  include/block/write-threshold.h   |  2 --
>  include/hw/arm/fsl-imx6ul.h       |  1 -
>  include/hw/arm/fsl-imx7.h         |  1 -
>  include/hw/cxl/cxl_component.h    |  2 --
>  include/hw/cxl/cxl_host.h         |  1 -
>  include/hw/cxl/cxl_pci.h          |  1 -
>  include/hw/input/pl050.h          |  1 -
>  include/hw/misc/aspeed_lpc.h      |  2 --
>  include/hw/pci/pcie_doe.h         |  1 -
>  include/hw/tricore/triboard.h     |  1 -
>  include/qemu/async-teardown.h     |  2 --
>  include/qemu/dbus.h               |  1 -
>  include/qemu/host-utils.h         |  1 -
>  include/qemu/userfaultfd.h        |  1 -
>  include/sysemu/accel-blocker.h    |  1 -
>  include/sysemu/event-loop-base.h  |  1 -
>  net/vmnet_int.h                   |  1 -
>  qga/cutils.h                      |  2 --
>  target/hexagon/hex_arch_types.h   |  1 -
>  target/hexagon/mmvec/macros.h     |  1 -
>  target/riscv/pmu.h                |  1 -
>  accel/tcg/cpu-exec.c              |  1 -
>  audio/sndioaudio.c                |  2 +-
>  backends/hostmem-epc.c            |  2 +-
>  backends/tpm/tpm_emulator.c       |  1 -
>  block/export/vduse-blk.c          |  2 +-
>  block/qapi.c                      |  1 -
>  bsd-user/arm/signal.c             |  1 +
>  bsd-user/arm/target_arch_cpu.c    |  2 ++
>  bsd-user/freebsd/os-sys.c         |  1 +
>  bsd-user/i386/signal.c            |  1 +
>  bsd-user/i386/target_arch_cpu.c   |  3 +--
>  bsd-user/main.c                   |  4 +---
>  bsd-user/strace.c                 |  1 -
>  bsd-user/x86_64/signal.c          |  1 +
>  bsd-user/x86_64/target_arch_cpu.c |  3 +--
>  hw/9pfs/9p.c                      |  5 -----
>  hw/acpi/piix4.c                   |  1 -
>  hw/alpha/dp264.c                  |  1 -
>  hw/arm/virt.c                     |  1 -
>  hw/arm/xlnx-versal.c              |  1 -
>  hw/block/pflash_cfi01.c           |  1 -
>  hw/core/machine.c                 |  1 -
>  hw/display/virtio-gpu-udmabuf.c   |  1 -
>  hw/hppa/machine.c                 |  1 -
>  hw/hyperv/syndbg.c                |  2 +-
>  hw/i2c/pmbus_device.c             |  1 -
>  hw/i386/acpi-build.c              |  1 -
>  hw/input/tsc210x.c                |  1 -
>  hw/loongarch/acpi-build.c         |  1 -
>  hw/misc/macio/cuda.c              |  1 -
>  hw/misc/macio/pmu.c               |  1 -
>  hw/net/xilinx_axienet.c           |  1 -
>  hw/ppc/ppc405_uc.c                |  2 --
>  hw/ppc/ppc440_bamboo.c            |  1 -
>  hw/ppc/spapr_drc.c                |  1 -
>  hw/rdma/vmw/pvrdma_dev_ring.c     |  1 -
>  hw/remote/machine.c               |  1 -
>  hw/remote/proxy-memory-listener.c |  1 -
>  hw/remote/remote-obj.c            |  1 -
>  hw/rtc/mc146818rtc.c              |  1 -
>  hw/s390x/virtio-ccw-serial.c      |  1 -
>  hw/sensor/adm1272.c               |  1 -
>  hw/usb/dev-storage-bot.c          |  1 -
>  hw/usb/dev-storage-classic.c      |  1 -
>  migration/postcopy-ram.c          |  2 --
>  qga/commands-posix.c              |  1 -
>  qga/cutils.c                      |  3 ++-
>  softmmu/dirtylimit.c              |  1 -
>  softmmu/runstate.c                |  1 -
>  softmmu/vl.c                      |  3 ---
>  target/loongarch/translate.c      |  1 -
>  target/mips/tcg/translate.c       |  1 -
>  target/nios2/translate.c          |  2 --
>  tcg/tci.c                         |  1 -
>  tests/unit/test-cutils.c          |  1 -
>  tests/unit/test-seccomp.c         |  1 -
>  ui/gtk.c                          |  1 -
>  ui/udmabuf.c                      |  1 -
>  util/async-teardown.c             | 12 ++++--------
>  util/main-loop.c                  |  1 -
>  util/oslib-posix.c                |  6 ------
>  scripts/clean-includes            | 15 ++++++++++-----
>  89 files changed, 29 insertions(+), 123 deletions(-)
> 
> -- 
> 2.39.0


