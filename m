Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D345394D9C
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 20:11:32 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln3Qp-000853-0c
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 14:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ln3Pn-0007A6-SC; Sat, 29 May 2021 14:10:27 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ln3Pk-0001i2-Is; Sat, 29 May 2021 14:10:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9F1BB7457E5;
 Sat, 29 May 2021 20:10:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7A5387456E3; Sat, 29 May 2021 20:10:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 78D657456B4;
 Sat, 29 May 2021 20:10:17 +0200 (CEST)
Date: Sat, 29 May 2021 20:10:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <20210520090557.435689-1-aik@ozlabs.ru>
Message-ID: <2cc5c18e-b1fb-31d4-e6c-a5a66d62b65@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
> new file mode 100644
> index 000000000000..5e34d5402abf
> --- /dev/null
> +++ b/hw/ppc/spapr_vof.c
> @@ -0,0 +1,156 @@
> +/*
> + * SPAPR machine hooks to Virtual Open Firmware,
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include <sys/ioctl.h>
> +#include "qapi/error.h"
> +#include "hw/ppc/spapr.h"
> +#include "hw/ppc/spapr_vio.h"
> +#include "hw/ppc/fdt.h"
> +#include "sysemu/sysemu.h"
> +#include "qom/qom-qobject.h"
> +#include "trace.h"
> +
> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
> +#define OF_STACK_SIZE       0x8000

I found a reference explaining its value better than the comment above. 
Section 8.2.2 here:

https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html

says it should be at least 32k. This define should be in vof.h so I don't 
have to duplicate it in pegasos2.c. Or vof_init could allocate and claim 
the stack so board code doesn't have to do that either. Maybe taking a 
pointer argument for preferred stack address as input and could return 
the aligned address where the stack was allocated or just store stack_base 
in struct vof where tha board code could get it for adding to r1 on 
calling the guest code.

Regards,
BALATON Zoltan

