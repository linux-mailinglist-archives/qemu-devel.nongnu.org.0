Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7273C1B6D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 00:24:03 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1cR7-0004Cu-Vb
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 18:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1cPX-0003QL-4N; Thu, 08 Jul 2021 18:22:23 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1cPT-0005hN-RG; Thu, 08 Jul 2021 18:22:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0F1CF74570E;
 Fri,  9 Jul 2021 00:22:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DBF3E74570D; Fri,  9 Jul 2021 00:22:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DA730745708;
 Fri,  9 Jul 2021 00:22:15 +0200 (CEST)
Date: Fri, 9 Jul 2021 00:22:15 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v22] spapr: Implement Open Firmware client interface
In-Reply-To: <YOZlnOiCeeF4mwJO@yekko>
Message-ID: <a8ae3a91-6451-2543-89d-f5dd5fca9f2@eik.bme.hu>
References: <20210625055155.2252896-1-aik@ozlabs.ru> <YOZlnOiCeeF4mwJO@yekko>
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021, David Gibson wrote:
> On Fri, Jun 25, 2021 at 03:51:55PM +1000, Alexey Kardashevskiy wrote:
> [snip]
>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>> new file mode 100644
>> index 000000000000..a17fd9d2fe94
>> --- /dev/null
>> +++ b/hw/ppc/vof.c
> [snip]
>> +static int path_offset(const void *fdt, const char *path)
>> +{
>> +    g_autofree char *p = NULL;
>> +    char *at;
>> +
>> +    /*
>> +     * https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html#HDR16
>> +     *
>> +     * "Conversion from numeric representation to text representation shall use
>> +     * the lower case forms of the hexadecimal digits in the range a..f,
>> +     * suppressing leading zeros".
>
> Huh... that suggests that Zoltan's firmware which passes a caps hex
> and expects it to work is doing the wrong thing.  We still need to
> accomodate it, though.

It's Linux which passes both upper and lower case variants (and all that a 
few line apart in the same file). The Pegasos2 SmartFirmware displays 
these with upper case address parts but accepts both upper and lower case. 
Here's a device tree dump from the original board firmware:

https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2/attach/PegasosII_OFW-Tree.txt

Apple's OpenFirmware seems to have lower case addresses:

http://nandra.segv.jp/NetBSD/G4.dump-device-tree.txt

but maybe it also accepts upper case? I can't try that now.

This works for pegasos2 guests I've tried but maybe only because the only 
problematic query is /pci@80000000/ide@C,1. If something wanted to get 
/pci@C0000000/isa@C then that might fail but I think most devices are on 
/pci@80000000 so this problem is unlikely to happen. The most correct way 
would be to convert all parts between @ and / or \0 to lower case but 
either this or the changed version in v23 which does strrcht('@') works 
for the cases I have.

> [snip]
>> +
>> +static void vof_instantiate_rtas(Error **errp)
>> +{
>> +    error_setg(errp, "The firmware should have instantiated RTAS");
>
> Since this always fails...
>
>> +}
>> +
>> +static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t methodaddr,
>> +                                uint32_t ihandle, uint32_t param1,
>> +                                uint32_t param2, uint32_t param3,
>> +                                uint32_t param4, uint32_t *ret2)
>> +{
>> +    uint32_t ret = -1;
>> +    char method[VOF_MAX_METHODLEN] = "";
>> +    OfInstance *inst;
>> +
>> +    if (!ihandle) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    inst = (OfInstance *)g_hash_table_lookup(vof->of_instances,
>> +                                             GINT_TO_POINTER(ihandle));
>> +    if (!inst) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    if (readstr(methodaddr, method, sizeof(method))) {
>> +        goto trace_exit;
>> +    }
>> +
>> +    if (strcmp(inst->path, "/") == 0) {
>> +        if (strcmp(method, "ibm,client-architecture-support") == 0) {
>> +            Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
>> +
>> +            if (vmo) {
>> +                VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
>> +
>> +                g_assert(vmc->client_architecture_support);
>> +                ret = vmc->client_architecture_support(ms, first_cpu, param1);
>> +            }
>> +
>> +            *ret2 = 0;
>> +        }
>> +    } else if (strcmp(inst->path, "/rtas") == 0) {
>> +        if (strcmp(method, "instantiate-rtas") == 0) {
>
> ... why do you even need to handle it here?

This message has helped to catch problem with instantiate-rtas so it's 
useful to have here even if normally it would not get here. I don't 
remember what was the problem, maybe too small rtas-size or similar but 
getting a message instead of crashing did point to the problem.

Regards,
BALATON Zoltan

