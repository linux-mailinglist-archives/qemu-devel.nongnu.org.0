Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6F449EEEE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 00:41:04 +0100 (CET)
Received: from localhost ([::1]:49558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDENy-00082D-Rf
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 18:41:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDEMJ-0007H4-QL
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:39:19 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:53415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDEMH-0002pY-5r
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:39:19 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CB3C27457EF;
 Fri, 28 Jan 2022 00:39:12 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9C8BF7456FE; Fri, 28 Jan 2022 00:39:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 98B1A7456E3;
 Fri, 28 Jan 2022 00:39:12 +0100 (CET)
Date: Fri, 28 Jan 2022 00:39:12 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] input/adb: Only include where needed
In-Reply-To: <20210705123721.65BDC745708@zero.eik.bme.hu>
Message-ID: <dc5e448d-e964-817d-013-6dea2be32a5d@eik.bme.hu>
References: <20210705123721.65BDC745708@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021, BALATON Zoltan wrote:
> The header hw/input/adb.h is included by some files that don't need
> it. Clean it up and include only where necessary.

When you're touching mos6522, I've also have this patch that cleans up 
includes that's somewhat related to mos6522 so you could consider it to be 
included in your series. I haven't checked but it should still apply. At 
least I got no problem with rebasing so at least with --3way should 
probably work but if not I can resend just let me know.

Regards,
BALATON Zoltan

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> hw/misc/macio/cuda.c         | 2 --
> hw/misc/macio/pmu.c          | 3 ---
> hw/misc/mos6522.c            | 1 -
> hw/ppc/mac.h                 | 2 --
> include/hw/misc/mac_via.h    | 1 +
> include/hw/misc/macio/cuda.h | 1 +
> include/hw/misc/macio/pmu.h  | 1 +
> include/hw/misc/mos6522.h    | 3 +--
> 8 files changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
> index edbd4186b2..584d81dc22 100644
> --- a/hw/misc/macio/cuda.c
> +++ b/hw/misc/macio/cuda.c
> @@ -28,8 +28,6 @@
> #include "hw/ppc/mac.h"
> #include "hw/qdev-properties.h"
> #include "migration/vmstate.h"
> -#include "hw/input/adb.h"
> -#include "hw/misc/mos6522.h"
> #include "hw/misc/macio/cuda.h"
> #include "qapi/error.h"
> #include "qemu/timer.h"
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index 71924d4768..eb746aee34 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -33,10 +33,7 @@
> #include "hw/ppc/mac.h"
> #include "hw/qdev-properties.h"
> #include "migration/vmstate.h"
> -#include "hw/input/adb.h"
> #include "hw/irq.h"
> -#include "hw/misc/mos6522.h"
> -#include "hw/misc/macio/gpio.h"
> #include "hw/misc/macio/pmu.h"
> #include "qapi/error.h"
> #include "qemu/timer.h"
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 1c57332b40..359bd64dea 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -25,7 +25,6 @@
>  */
>
> #include "qemu/osdep.h"
> -#include "hw/input/adb.h"
> #include "hw/irq.h"
> #include "hw/misc/mos6522.h"
> #include "hw/qdev-properties.h"
> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
> index 22c8408078..3fad371701 100644
> --- a/hw/ppc/mac.h
> +++ b/hw/ppc/mac.h
> @@ -30,8 +30,6 @@
> #include "exec/memory.h"
> #include "hw/boards.h"
> #include "hw/sysbus.h"
> -#include "hw/input/adb.h"
> -#include "hw/misc/mos6522.h"
> #include "hw/pci/pci_host.h"
> #include "hw/pci-host/uninorth.h"
> #include "qom/object.h"
> diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
> index 3058b30685..ada338eff1 100644
> --- a/include/hw/misc/mac_via.h
> +++ b/include/hw/misc/mac_via.h
> @@ -12,6 +12,7 @@
> #include "exec/memory.h"
> #include "hw/sysbus.h"
> #include "hw/misc/mos6522.h"
> +#include "hw/input/adb.h"
> #include "qom/object.h"
>
>
> diff --git a/include/hw/misc/macio/cuda.h b/include/hw/misc/macio/cuda.h
> index a71deec968..8a6678c749 100644
> --- a/include/hw/misc/macio/cuda.h
> +++ b/include/hw/misc/macio/cuda.h
> @@ -26,6 +26,7 @@
> #ifndef CUDA_H
> #define CUDA_H
>
> +#include "hw/input/adb.h"
> #include "hw/misc/mos6522.h"
> #include "qom/object.h"
>
> diff --git a/include/hw/misc/macio/pmu.h b/include/hw/misc/macio/pmu.h
> index 78237d99a2..306e59ba6e 100644
> --- a/include/hw/misc/macio/pmu.h
> +++ b/include/hw/misc/macio/pmu.h
> @@ -10,6 +10,7 @@
> #ifndef PMU_H
> #define PMU_H
>
> +#include "hw/input/adb.h"
> #include "hw/misc/mos6522.h"
> #include "hw/misc/macio/gpio.h"
> #include "qom/object.h"
> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
> index fc95d22b0f..862b3f5642 100644
> --- a/include/hw/misc/mos6522.h
> +++ b/include/hw/misc/mos6522.h
> @@ -27,9 +27,8 @@
> #ifndef MOS6522_H
> #define MOS6522_H
>
> -#include "exec/memory.h"
> +#include "exec/hwaddr.h"
> #include "hw/sysbus.h"
> -#include "hw/input/adb.h"
> #include "qom/object.h"
>
> /* Bits in ACR */
>

