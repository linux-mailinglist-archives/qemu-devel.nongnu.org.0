Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AC3395B14
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 15:08:46 +0200 (CEST)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnhev-00019W-Dn
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 09:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lnhdp-0000IL-2y; Mon, 31 May 2021 09:07:37 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:44692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lnhdl-0000ot-T3; Mon, 31 May 2021 09:07:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2A11E74639A;
 Mon, 31 May 2021 15:07:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EEDB6746397; Mon, 31 May 2021 15:07:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EDBC8746358;
 Mon, 31 May 2021 15:07:26 +0200 (CEST)
Date: Mon, 31 May 2021 15:07:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <c13d557a-5feb-33ad-33ec-22a28cddb8d@eik.bme.hu>
Message-ID: <7e71f593-c2b9-5c7-4dd0-2a189bee771@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <c13d557a-5feb-33ad-33ec-22a28cddb8d@eik.bme.hu>
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

On Sun, 30 May 2021, BALATON Zoltan wrote:
> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>> new file mode 100644
>> index 000000000000..a283b7d251a7
>> --- /dev/null
>> +++ b/hw/ppc/vof.c
>> @@ -0,0 +1,1021 @@
>> +/*
>> + * QEMU PowerPC Virtual Open Firmware.
>> + *
>> + * This implements client interface from OpenFirmware IEEE1275 on the QEMU
>> + * side to leave only a very basic firmware in the VM.
>> + *
>> + * Copyright (c) 2021 IBM Corporation.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +#include "qemu/timer.h"
>> +#include "qemu/range.h"
>> +#include "qemu/units.h"
>> +#include "qapi/error.h"
>> +#include <sys/ioctl.h>
>> +#include "exec/ram_addr.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/ppc/vof.h"
>> +#include "hw/ppc/fdt.h"
>> +#include "sysemu/runstate.h"
>> +#include "qom/qom-qobject.h"
>> +#include "trace.h"
>> +
>> +#include <libfdt.h>
>> +
>> +/*
>> + * OF 1275 "nextprop" description suggests is it 32 bytes max but
>> + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 chars 
>> long.
>> + */
>> +#define OF_PROPNAME_LEN_MAX 64
>> +
>> +#define VOF_MAX_PATH        256
>> +#define VOF_MAX_SETPROPLEN  2048
>> +#define VOF_MAX_METHODLEN   256
>> +#define VOF_MAX_FORTHCODE   256
>> +#define VOF_VTY_BUF_SIZE    256
>> +
>> +typedef struct {
>> +    uint64_t start;
>> +    uint64_t size;
>> +} OfClaimed;
>> +
>> +typedef struct {
>> +    char *path; /* the path used to open the instance */
>> +    uint32_t phandle;
>> +} OfInstance;
>> +
>> +#define VOF_MEM_READ(pa, buf, size) \
>> +    address_space_read_full(&address_space_memory, \
>> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
>> +#define VOF_MEM_WRITE(pa, buf, size) \
>> +    address_space_write(&address_space_memory, \
>> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
>> +
>> +static int readstr(hwaddr pa, char *buf, int size)
>> +{
>> +    if (VOF_MEM_READ(pa, buf, size) != MEMTX_OK) {
>> +        return -1;
>> +    }
>> +    if (strnlen(buf, size) == size) {
>> +        buf[size - 1] = '\0';
>> +        trace_vof_error_str_truncated(buf, size);
>> +        return -1;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static bool cmpservice(const char *s, unsigned nargs, unsigned nret,
>> +                       const char *s1, unsigned nargscheck, unsigned 
>> nretcheck)
>> +{
>> +    if (strcmp(s, s1)) {
>> +        return false;
>> +    }
>> +    if ((nargscheck && (nargs != nargscheck)) ||
>> +        (nretcheck && (nret != nretcheck))) {
>> +        trace_vof_error_param(s, nargscheck, nretcheck, nargs, nret);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static void prop_format(char *tval, int tlen, const void *prop, int len)
>> +{
>> +    int i;
>> +    const unsigned char *c;
>> +    char *t;
>> +    const char bin[] = "...";
>> +
>> +    for (i = 0, c = prop; i < len; ++i, ++c) {
>> +        if (*c == '\0' && i == len - 1) {
>> +            strncpy(tval, prop, tlen - 1);
>> +            return;
>> +        }
>> +        if (*c < 0x20 || *c >= 0x80) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    for (i = 0, c = prop, t = tval; i < len; ++i, ++c) {
>> +        if (t >= tval + tlen - sizeof(bin) - 1 - 2 - 1) {
>> +            strcpy(t, bin);
>> +            return;
>> +        }
>> +        if (i && i % 4 == 0 && i != len - 1) {
>> +            strcat(t, " ");
>> +            ++t;
>> +        }
>> +        t += sprintf(t, "%02X", *c & 0xFF);
>> +    }
>> +}
>> +
>> +static int get_path(const void *fdt, int offset, char *buf, int len)
>> +{
>> +    int ret;
>> +
>> +    ret = fdt_get_path(fdt, offset, buf, len - 1);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    buf[len - 1] = '\0';
>> +
>> +    return strlen(buf) + 1;
>> +}
>> +
>> +static int phandle_to_path(const void *fdt, uint32_t ph, char *buf, int 
>> len)
>> +{
>> +    int ret;
>> +
>> +    ret = fdt_node_offset_by_phandle(fdt, ph);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    return get_path(fdt, ret, buf, len);
>> +}
>> +
>> +static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
>> +{
>> +    char fullnode[VOF_MAX_PATH];
>> +    uint32_t ret = -1;
>> +    int offset;
>> +
>> +    if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
>> +        return (uint32_t) ret;
>> +    }
>> +
>> +    offset = fdt_path_offset(fdt, fullnode);
>> +    if (offset >= 0) {
>> +        ret = fdt_get_phandle(fdt, offset);
>> +    }
>> +    trace_vof_finddevice(fullnode, ret);
>> +    return (uint32_t) ret;
>> +}
>
> The Linux init function that runs on pegasos2 here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/powerpc/kernel/prom_init.c?h=v4.14.234#n2658
>
> calls finddevice once with isa@c and next with isa@C (small and capital C) 
> both of which works with the board firmware but with vof the comparison is 
> case sensitive and one of these fails so I can't make it work. I don't know 
> if this is a problem in libfdt or the vof_finddevice above should do 
> something else to get case insensitive comparison.

This fixes the issue with Linux but I'm not sure if there's any better 
solution or would it break anything else.

Regards,
BALATON Zoltan

>diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index a283b7d251..b47bbd509d 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -144,12 +144,15 @@ static uint32_t vof_finddevice(const void *fdt, 
uint32_t nodeaddr)
      char fullnode[VOF_MAX_PATH];
      uint32_t ret = -1;
      int offset;
+    gchar *p;

      if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
          return (uint32_t) ret;
      }

-    offset = fdt_path_offset(fdt, fullnode);
+    p = g_ascii_strdown(fullnode, -1);
+    offset = fdt_path_offset(fdt, p);
+    g_free(p);
      if (offset >= 0) {
          ret = fdt_get_phandle(fdt, offset);
      }

