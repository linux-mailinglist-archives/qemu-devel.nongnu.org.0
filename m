Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36785351B9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 17:57:10 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuFrK-0003E6-3h
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 11:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nuFpB-0001bW-5c; Thu, 26 May 2022 11:54:57 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:26444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nuFp8-0001XS-E2; Thu, 26 May 2022 11:54:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 57E20747641;
 Thu, 26 May 2022 17:54:48 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 227AB74763E; Thu, 26 May 2022 17:54:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 211C77470B9;
 Thu, 26 May 2022 17:54:48 +0200 (CEST)
Date: Thu, 26 May 2022 17:54:48 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Francisco Iglesias <frasse.iglesias@gmail.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, 
 Cedric Le Goater <clg@kaod.org>
Subject: Re: [PULL v2 75/86] include/hw/pci/pcie_host: Correct
 PCIE_MMCFG_SIZE_MAX
In-Reply-To: <96abb644-4031-7d7f-db45-6376f8f74161@gmail.com>
Message-ID: <de56b35-c77-e979-b8bd-17c439f4b56d@eik.bme.hu>
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-76-mst@redhat.com>
 <96abb644-4031-7d7f-db45-6376f8f74161@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-155999784-1653580488=:28167"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-155999784-1653580488=:28167
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hello,

On Thu, 26 May 2022, Daniel Henrique Barboza wrote:
> Hi,
>
> This patch broke the boot of the sam460ex ppc machine:
>
> qemu-system-ppc -M sam460ex -kernel 
> ./buildroot/qemu_ppc_sam460ex-latest/vmlinux \
> -device virtio-net-pci,netdev=net0 -netdev user,id=net0 -serial mon:stdio \
> -nographic -snapshot
> qemu-system-ppc: ../hw/pci/pcie_host.c:97: pcie_host_mmcfg_init: Assertion 
> `size <= PCIE_MMCFG_SIZE_MAX' failed.

Thanks for noticing this. I usually only test it during the freeze. Wasn't 
there a test patch submitted by Philippe before? Isn't that yet merged or 
included in CI? That should catch these before breaking it.

> The reason is that it changed commit 58d5b22bbd5 ("ppc4xx: Add device 
> models found in PPC440 core SoCs")) in a way that it wasn't expected by 
> the board. The code seems to believe that, for a reason that isn't 
> stated in the 58d5b22bbd5 commit message, PCIE_MMCFG_SIZE_MAX must be 
> set to 1 << 29.
>
> I'm CCing BALATON Zoltan since he's the author of 58d5b22bbd5 and can 
> provide context of his initial change and why the board seems to rely on 
> it. qemu-ppc is being CCed for awareness of the sam460ex problem.

I'm afraid I don't remember but maybe I did not have a definitive answer 
even back then as the docs for this PCIe controller were not available so 
I've mostly worked from docs for similar SoCs and U-Boot and Linux sources 
so there were a lot of guessing. Maybe it's related to that the board maps 
peripheral addresses above 4GB as the first 4GB is reserved for memory? Or 
maybe there's some mixup between address spaces and the PCIe controller 
should have a separate address space that's mapped in the system? I did 
not have any knowledge about this back then and my understanding may still 
be lacking on how this should work.

> Zoltan, I wasn't able to amend to quickly amend the code in a way that I 
> could preserve the current PCIE_MMCFG_SIZE_MAX setting and make sam460ex 
> work again. Can you please take a look?

The PCIe controllers of the 460EX are implemented at the end of 
hw/ppc/ppc440_uc.c (a lot of these 4xx SoCs are sharing components and the 
code organisation is a bit messy). As the comment near it says it's not 
really fully tested and working. only good enough for firmware and OSes 
get past testing it. I think trying to attach any device to it probably 
would fail or I would be surprised if the OS could actually talk to it as 
there may be some missing parts. So I'm happy with any solution that keeps 
the current state of being able to boot the OSes running on it (some of 
which like AmigaOS and MorphOS are closed source though so I don't know 
what their drivers need; closest open source OS to them is AROS but not 
sure that's working on real hardware). Some advice from somebody more 
knowledgeable about PCIe emulation in QEMU would be welcome here.

Regards,
BALATON Zoltan

>
> Thanks,
>
>
> Daniel
>
>
>
> On 5/16/22 17:55, Michael S. Tsirkin wrote:
>> From: Francisco Iglesias <frasse.iglesias@gmail.com>
>> 
>> According to 7.2.2 in [1] bit 27 is the last bit that can be part of the
>> bus number, this makes the ECAM max size equal to '1 << 28'. This patch
>> restores back this value into the PCIE_MMCFG_SIZE_MAX define (which was
>> changed in commit 58d5b22bbd5 ("ppc4xx: Add device models found in PPC440
>> core SoCs")).
>> 
>> [1] PCI Express® Base Specification Revision 5.0 Version 1.0
>> 
>> Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
>> Message-Id: <20220411221836.17699-3-frasse.iglesias@gmail.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   include/hw/pci/pcie_host.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
>> index b3c8ce973c..82d92177da 100644
>> --- a/include/hw/pci/pcie_host.h
>> +++ b/include/hw/pci/pcie_host.h
>> @@ -65,7 +65,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
>>    * bit 12 - 14: function number
>>    * bit  0 - 11: offset in configuration space of a given device
>>    */
>> -#define PCIE_MMCFG_SIZE_MAX             (1ULL << 29)
>> +#define PCIE_MMCFG_SIZE_MAX             (1ULL << 28)
>>   #define PCIE_MMCFG_SIZE_MIN             (1ULL << 20)
>>   #define PCIE_MMCFG_BUS_BIT              20
>>   #define PCIE_MMCFG_BUS_MASK             0xff
>
>
--3866299591-155999784-1653580488=:28167--

