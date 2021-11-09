Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A444ADA4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:37:48 +0100 (CET)
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkQNm-0002GE-OR
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:37:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mkQL2-0007Pd-MY; Tue, 09 Nov 2021 07:34:56 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:31878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mkQKz-0000tk-Ip; Tue, 09 Nov 2021 07:34:56 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 969CD748F58;
 Tue,  9 Nov 2021 13:34:49 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 67C82748F57; Tue,  9 Nov 2021 13:34:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6608E746399;
 Tue,  9 Nov 2021 13:34:49 +0100 (CET)
Date: Tue, 9 Nov 2021 13:34:49 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 1/2] hw: m68k: virt: Add compat machine for 6.1
In-Reply-To: <20211109111517.996104-2-laurent@vivier.eu>
Message-ID: <9537b527-d33e-59d5-e196-e1e84fa01325@eik.bme.hu>
References: <20211109111517.996104-1-laurent@vivier.eu>
 <20211109111517.996104-2-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Nov 2021, Laurent Vivier wrote:
> Add the missing machine type for m68k/virt
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <20211106194158.4068596-2-laurent@vivier.eu>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
> hw/m68k/virt.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 4e8bce5aa6f7..0d9e3f83c169 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -304,7 +304,14 @@ type_init(virt_machine_register_types)
>     } \
>     type_init(machvirt_machine_##major##_##minor##_init);
>
> +static void virt_machine_6_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(6, 1, true)
> +
> static void virt_machine_6_0_options(MachineClass *mc)
> {
> +    virt_machine_6_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
> }
> -DEFINE_VIRT_MACHINE(6, 0, true)
> +DEFINE_VIRT_MACHINE(6, 0, false)

I don't understand how these compat machines work but if these are empty 
and essentially the same as the previous version why do we add a new 
version in every release? Wouldn't it be enough to add new version when 
there was an incompatible change? I mean, instead of listing machine and 
getting a lot of virt-6.1, virt-6.0, virt-5.2,... or so, we'd only get 
versions that are actually different such as virt-7.0, virt-5.2, virt-5.0 
(maybe they are called differently, just an example) with the versionless 
alias always pointing to the latest. Then when QEMU is updated one can see 
if there was any change so should update the VM or keep using the older 
versions. Or does it work like that and I'm missing it completely?

Regards,
BALATON Zoltan

