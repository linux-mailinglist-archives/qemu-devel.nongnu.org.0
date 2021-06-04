Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A191239BAF7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 16:36:02 +0200 (CEST)
Received: from localhost ([::1]:58900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpAvZ-0000KG-GL
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 10:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpAuC-0007nI-7i; Fri, 04 Jun 2021 10:34:36 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpAu6-00044d-Ue; Fri, 04 Jun 2021 10:34:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7B973746340;
 Fri,  4 Jun 2021 16:34:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 206397462DB; Fri,  4 Jun 2021 16:34:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1E47174581E;
 Fri,  4 Jun 2021 16:34:27 +0200 (CEST)
Date: Fri, 4 Jun 2021 16:34:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <537a6990-4f18-746e-a1da-5dfa51f23dbd@eik.bme.hu>
Message-ID: <f6318832-54f7-8551-c631-7a9f6cb011c2@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <c13d557a-5feb-33ad-33ec-22a28cddb8d@eik.bme.hu> <YLnF/9H6aFzNhu5+@yekko>
 <537a6990-4f18-746e-a1da-5dfa51f23dbd@eik.bme.hu>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021, BALATON Zoltan wrote:
> On Fri, 4 Jun 2021, David Gibson wrote:
>> On Sun, May 30, 2021 at 07:33:01PM +0200, BALATON Zoltan wrote:
>>> Hello,
>>> 
>>> Two more problems I've found while testing with pegasos2 but I'm not sure
>>> how to fix them:
>>> 
>>> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
>>>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>>>> new file mode 100644
>>>> index 000000000000..a283b7d251a7
>>>> --- /dev/null
>>>> +++ b/hw/ppc/vof.c
>>>> @@ -0,0 +1,1021 @@
>>>> +/*
>>>> + * QEMU PowerPC Virtual Open Firmware.
>>>> + *
>>>> + * This implements client interface from OpenFirmware IEEE1275 on the 
>>>> QEMU
>>>> + * side to leave only a very basic firmware in the VM.
>>>> + *
>>>> + * Copyright (c) 2021 IBM Corporation.
>>>> + *
>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>> + */
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qemu-common.h"
>>>> +#include "qemu/timer.h"
>>>> +#include "qemu/range.h"
>>>> +#include "qemu/units.h"
>>>> +#include "qapi/error.h"
>>>> +#include <sys/ioctl.h>
>>>> +#include "exec/ram_addr.h"
>>>> +#include "exec/address-spaces.h"
>>>> +#include "hw/ppc/vof.h"
>>>> +#include "hw/ppc/fdt.h"
>>>> +#include "sysemu/runstate.h"
>>>> +#include "qom/qom-qobject.h"
>>>> +#include "trace.h"
>>>> +
>>>> +#include <libfdt.h>
>>>> +
>>>> +/*
>>>> + * OF 1275 "nextprop" description suggests is it 32 bytes max but
>>>> + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 chars 
>>>> long.
>>>> + */
>>>> +#define OF_PROPNAME_LEN_MAX 64
>>>> +
>>>> +#define VOF_MAX_PATH        256
>>>> +#define VOF_MAX_SETPROPLEN  2048
>>>> +#define VOF_MAX_METHODLEN   256
>>>> +#define VOF_MAX_FORTHCODE   256
>>>> +#define VOF_VTY_BUF_SIZE    256
>>>> +
>>>> +typedef struct {
>>>> +    uint64_t start;
>>>> +    uint64_t size;
>>>> +} OfClaimed;
>>>> +
>>>> +typedef struct {
>>>> +    char *path; /* the path used to open the instance */
>>>> +    uint32_t phandle;
>>>> +} OfInstance;
>>>> +
>>>> +#define VOF_MEM_READ(pa, buf, size) \
>>>> +    address_space_read_full(&address_space_memory, \
>>>> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
>>>> +#define VOF_MEM_WRITE(pa, buf, size) \
>>>> +    address_space_write(&address_space_memory, \
>>>> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
>>>> +
>>>> +static int readstr(hwaddr pa, char *buf, int size)
>>>> +{
>>>> +    if (VOF_MEM_READ(pa, buf, size) != MEMTX_OK) {
>>>> +        return -1;
>>>> +    }
>>>> +    if (strnlen(buf, size) == size) {
>>>> +        buf[size - 1] = '\0';
>>>> +        trace_vof_error_str_truncated(buf, size);
>>>> +        return -1;
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static bool cmpservice(const char *s, unsigned nargs, unsigned nret,
>>>> +                       const char *s1, unsigned nargscheck, unsigned 
>>>> nretcheck)
>>>> +{
>>>> +    if (strcmp(s, s1)) {
>>>> +        return false;
>>>> +    }
>>>> +    if ((nargscheck && (nargs != nargscheck)) ||
>>>> +        (nretcheck && (nret != nretcheck))) {
>>>> +        trace_vof_error_param(s, nargscheck, nretcheck, nargs, nret);
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>> +static void prop_format(char *tval, int tlen, const void *prop, int len)
>>>> +{
>>>> +    int i;
>>>> +    const unsigned char *c;
>>>> +    char *t;
>>>> +    const char bin[] = "...";
>>>> +
>>>> +    for (i = 0, c = prop; i < len; ++i, ++c) {
>>>> +        if (*c == '\0' && i == len - 1) {
>>>> +            strncpy(tval, prop, tlen - 1);
>>>> +            return;
>>>> +        }
>>>> +        if (*c < 0x20 || *c >= 0x80) {
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    for (i = 0, c = prop, t = tval; i < len; ++i, ++c) {
>>>> +        if (t >= tval + tlen - sizeof(bin) - 1 - 2 - 1) {
>>>> +            strcpy(t, bin);
>>>> +            return;
>>>> +        }
>>>> +        if (i && i % 4 == 0 && i != len - 1) {
>>>> +            strcat(t, " ");
>>>> +            ++t;
>>>> +        }
>>>> +        t += sprintf(t, "%02X", *c & 0xFF);
>>>> +    }
>>>> +}
>>>> +
>>>> +static int get_path(const void *fdt, int offset, char *buf, int len)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = fdt_get_path(fdt, offset, buf, len - 1);
>>>> +    if (ret < 0) {
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    buf[len - 1] = '\0';
>>>> +
>>>> +    return strlen(buf) + 1;
>>>> +}
>>>> +
>>>> +static int phandle_to_path(const void *fdt, uint32_t ph, char *buf, int 
>>>> len)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = fdt_node_offset_by_phandle(fdt, ph);
>>>> +    if (ret < 0) {
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    return get_path(fdt, ret, buf, len);
>>>> +}
>>>> +
>>>> +static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
>>>> +{
>>>> +    char fullnode[VOF_MAX_PATH];
>>>> +    uint32_t ret = -1;
>>>> +    int offset;
>>>> +
>>>> +    if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
>>>> +        return (uint32_t) ret;
>>>> +    }
>>>> +
>>>> +    offset = fdt_path_offset(fdt, fullnode);
>>>> +    if (offset >= 0) {
>>>> +        ret = fdt_get_phandle(fdt, offset);
>>>> +    }
>>>> +    trace_vof_finddevice(fullnode, ret);
>>>> +    return (uint32_t) ret;
>>>> +}
>>> 
>>> The Linux init function that runs on pegasos2 here:
>>> 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/powerpc/kernel/prom_init.c?h=v4.14.234#n2658
>>> 
>>> calls finddevice once with isa@c and next with isa@C (small and capital C)
>>> both of which works with the board firmware but with vof the comparison is
>>> case sensitive and one of these fails so I can't make it work. I don't 
>>> know
>>> if this is a problem in libfdt or the vof_finddevice above should do
>>> something else to get case insensitive comparison.
>> 
>> This is kind of a subtle incompatibility between the traditional OF
>> world and the flat tree world.  In traditional OF, the unit address
>> (bit after the @) doesn't exist as a string.  Instead when you do the
>> finddevice it will parse that address and compare it against the 'reg'
>> properties for each of the relevant nodes.  Since that's an integer
>> comparison, case doesn't enter into it.
>> 
>> But, how to parse (and write) addresses depends on the bus, so the
>> firmware has to understand each bus type and act accordingly.  That
>> doesn't really work in the world of minimal firmwares dor the flat
>> tree.  So instead, we just incorporate a pre-formatted unit address in
>> the flat tree directly.  Most of the time that works fine, but there
>> are some edge cases like the one you've hit.
>
> OK, thanks for the clarification, as said in previous message I think doing 
> case insesitive comparison just in the address part should work then we don't 
> have to implement reg parsing in VOF.
>
>>>> +static const void *getprop(const void *fdt, int nodeoff, const char 
>>>> *propname,
>>>> +                           int *proplen, bool *write0)
>>>> +{
>>>> +    const char *unit, *prop;
>>>> +
>>>> +    /*
>>>> +     * The "name" property is not actually stored as a property in the 
>>>> FDT,
>>>> +     * we emulate it by returning a pointer to the node's name and 
>>>> adjust
>>>> +     * proplen to include only the name but not the unit.
>>>> +     */
>>>> +    if (strcmp(propname, "name") == 0) {
>>>> +        prop = fdt_get_name(fdt, nodeoff, proplen);
>>>> +        if (!prop) {
>>>> +            *proplen = 0;
>>>> +            return NULL;
>>>> +        }
>>>> +
>>>> +        unit = memchr(prop, '@', *proplen);
>>>> +        if (unit) {
>>>> +            *proplen = unit - prop;
>>>> +        }
>>>> +        *proplen += 1;
>>>> +
>>>> +        /*
>>>> +         * Since it might be cut at "@" and there will be no trailing 
>>>> zero
>>>> +         * in the prop buffer, tell the caller to write zero at the end.
>>>> +         */
>>>> +        if (write0) {
>>>> +            *write0 = true;
>>>> +        }
>>>> +        return prop;
>>>> +    }
>>>> +
>>>> +    if (write0) {
>>>> +        *write0 = false;
>>>> +    }
>>>> +    return fdt_getprop(fdt, nodeoff, propname, proplen);
>>>> +}
>>> 
>>> MorphOS checks the name property of the root node ("/") to decide what
>>> platform it runs on so we may need to be able to set this property on /
>>> where it should return "bplan,Pegasos2", therefore the above maybe should 
>>> do
>>> getprop first and only generate name property if it's not set (or at least
>>> check if we're on the root node and allow setting name property there). 
>>> (On
>>> Macs the root node is named "device-tree" and this was before found to be
>>> needed for MorphOS.)
>> 
>> Ah.  Hrm.  Have to think about what to do about that.
>
> This is easy to fix, this seems to allow setting a name property or return a 
> default:
>
>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index b47bbd509d..746842593e 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -163,14 +163,14 @@ static uint32_t vof_finddevice(const void *fdt, 
> uint32_t nodeaddr)
> static const void *getprop(const void *fdt, int nodeoff, const char 
> *propname,
>                            int *proplen, bool *write0)
> {
> -    const char *unit, *prop;
> +    const char *unit, *prop = fdt_getprop(fdt, nodeoff, propname, proplen);
>
>     /*
>      * The "name" property is not actually stored as a property in the FDT,
>      * we emulate it by returning a pointer to the node's name and adjust
>      * proplen to include only the name but not the unit.
>      */
> -    if (strcmp(propname, "name") == 0) {
> +    if (!prop && strcmp(propname, "name") == 0) {
>         prop = fdt_get_name(fdt, nodeoff, proplen);
>         if (!prop) {
>             *proplen = 0;
> @@ -196,7 +196,7 @@ static const void *getprop(const void *fdt, int nodeoff, 
> const char *propname,
>     if (write0) {
>         *write0 = false;
>     }
> -    return fdt_getprop(fdt, nodeoff, propname, proplen);
> +    return prop;
> }
>
> This allows adding a name property to "/" different from the default but this 
> does not yet fix MorphOS booting with VOF on pegasos2. I think it tries to 
> query name on / and check if it's called "device-tree" in which case it 
> assumes Mac hardware otherwise it goes with pegasos2 so even if we return 
> nothing for name it would not matter in this case as we don't use VOF on Mac. 
> If we wanted that then this would become a problem so it could be fixed now 
> in advance just in case other guests may need it.
>
>>> Other than the above two problems, I've found that getting the device tree
>>> from vof returns it in reverse order compared to the board firmware if I 
>>> add
>>> it the expected order. This may or may not be a problem but to avoid it I
>>> can build the tree in reverse order then it comes out right so unless
>>> there's an easy fix this should not cause a problem but may worth a 
>>> comment
>>> somewhere.
>> 
>> The order of things in the device tree *should* never matter.  If it
>> does, that's definitely a client bug... but of course that doesn't
>> necessarily mean we won't have to work around it in practice.
>
> I don't know if it matters or not but having the device tree in the same 
> order as the firmware ROM helps with comparing it for debugging but I've 
> found I can solve this by building the tree in reverse order so no changes to 
> VOF is needed for this, just thought adding a comment somewhere may clarify 
> it but it's not really a problem.
>
> I still don't know what's MorphOS is missing, I've tried adding almost all 
> misssing properties, checked what hardware is init by the firmware and tried 
> to do the same in board reset code and even after that MorphOS still takes a 
> different route with VOF and crashes but boots with the board firmware. I'm 
> now thinking it may be either different memory organisation or the missing 
> name properties that are not returned by nextprop in VOF so they are only 
> appearing when explicitely queried whereas with the board firmware they are 
> present as properties. With the above patch I could explicitely set it on 
> nodes and test if that makes a difference.
>
> I got to this because adding more missing props or init more devices did not 
> make a difference so I'm guessing it may be something else then and the only 
> difference I can see compared to board firmware are the different memory 
> ranges in claimed (VOF puts itself to 0 for example); and the missing name 
> and additional phandle props in the device tree. MorphOS copies the whole 
> device tree on startup then later it uses this copy of the device tree after 
> shutting down OF with quiesce. I can imagine it may use some name props like 
> that on the cpu node without checking assuming it's always there and if we're 
> missing that it may cause a NULL dereference. I have no better idea what else 
> could be missing so I'll test this next. If it helps I can try to come up 
> with a patch to VOF to return these name props or allow setting them as 
> above.

Looks like it's the missing name props after all. Adding it to /memory and 
cpu makes it go further but probably needs more as it then does not find 
the boot device. Comparing with the device tree created by board firmware 
not all nodes seem to have a name property so maybe the board firmware 
also adds this to some nodes explicitely overriding the default so we 
should do the same in VOF for which the above patch is enough. Feel free 
to squash it into the next vof patch version or I can submit it afterwards 
as a separate patch whichever you prefer. Then I'll need to find out what 
other name props I need to set in board code for MorphOS. Linux does not 
seem to need any of the name props and boots without them. What I have now 
is good enough for Linux but if I can also fix MorphOS that would make it 
simpler to use because then one does not need the non-distributable 
firmware ROM which is the point of trying to use VOF here.

Regards,
BALATON Zoltan

