Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E095536816
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:28:43 +0200 (CEST)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugZe-0002Ob-Bn
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nufP0-00086D-CB; Fri, 27 May 2022 15:13:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:11197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nufOt-0004Fm-ME; Fri, 27 May 2022 15:13:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1DA63746381;
 Fri, 27 May 2022 21:13:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C02D574637A; Fri, 27 May 2022 21:13:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BE93D746324;
 Fri, 27 May 2022 21:13:26 +0200 (CEST)
Date: Fri, 27 May 2022 21:13:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH] ppc: fix boot with sam460ex
In-Reply-To: <20220527065049-mutt-send-email-mst@kernel.org>
Message-ID: <2cdae0b2-e23-9a65-1786-b879b420e783@eik.bme.hu>
References: <20220526224229.95183-1-mst@redhat.com>
 <352916f8-efb1-c192-5fc-6df69b559a8@eik.bme.hu>
 <20220527065049-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
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

On Fri, 27 May 2022, Michael S. Tsirkin wrote:
> On Fri, May 27, 2022 at 12:46:57PM +0200, BALATON Zoltan wrote:
>> Hello,
>>
>> Some changes to commit message (patch is OK).
>
> Want to write the commit message for me then?

How about:

Recent changes to pcie_host corrected size of its internal region to match 
what it expects: only the low 28 bits are ever decoded. Previous code just 
ignored bit 29 (if size was 1 << 29) in the address which does not make 
much sense.  We are now asserting on size > 1 << 28 instead, but PPC 4xx 
actually allows guest to configure different sizes, and some firmwares 
seem to set it to 1 << 29.

This caused e.g. qemu-system-ppc -M sam460ex to exit with an assert when 
the guest writes a value to CFGMSK register when trying to map config 
space. This is done in the board firmware in ppc4xx_init_pcie_port() in 
roms/u-boot-sam460ex/arch/powerpc/cpu/ppc4xx/4xx_pcie.c

It's not clear what the proper fix should be but for now let's force the 
size to 256MB, so anything outside the expected address range is ignored.

>>> Fixes: commit 1f1a7b2269 ("include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX")
>>> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>
>>> Affected system is orphan so I guess I will merge the patch unless
>>> someone objects.
>>>
>>> hw/ppc/ppc440_uc.c | 8 ++++++++
>>> 1 file changed, 8 insertions(+)
>>>
>>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>>> index 993e3ba955..a1ecf6dd1c 100644
>>> --- a/hw/ppc/ppc440_uc.c
>>> +++ b/hw/ppc/ppc440_uc.c
>>> @@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
>>>     case PEGPL_CFGMSK:
>>>         s->cfg_mask = val;
>>>         size = ~(val & 0xfffffffe) + 1;
>>> +        /*
>>> +         * Firmware sets this register to E0000001. Why we are not sure,
>>> +         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
>>> +         * ignored.
>>> +         */
>>> +        if (size > PCIE_MMCFG_SIZE_MAX) {
>>> +            size = PCIE_MMCFG_SIZE_MAX;
>>> +        }
>>>         pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
>>>         break;
>>>     case PEGPL_MSGBAH:
>>>
>
>

