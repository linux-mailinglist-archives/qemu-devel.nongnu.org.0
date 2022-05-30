Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEC5385D8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:07:49 +0200 (CEST)
Received: from localhost ([::1]:38354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvhvn-0001D3-Sr
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nvhsE-0006Qa-5k; Mon, 30 May 2022 12:04:06 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nvhsA-0006Yg-FV; Mon, 30 May 2022 12:04:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9C103746334;
 Mon, 30 May 2022 18:03:56 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DC98B746324; Mon, 30 May 2022 18:03:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DB42D7462D3;
 Mon, 30 May 2022 18:03:55 +0200 (CEST)
Date: Mon, 30 May 2022 18:03:55 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH] ppc: fix boot with sam460ex
In-Reply-To: <397f565c-590b-bcf2-a647-a1e9a0de1218@kaod.org>
Message-ID: <8b17754c-47d0-5b28-4a11-577011285951@eik.bme.hu>
References: <20220526224229.95183-1-mst@redhat.com>
 <397f565c-590b-bcf2-a647-a1e9a0de1218@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-372598317-1653926564=:81612"
Content-ID: <f82eb4a9-4e40-c1c3-8c8-93e731def888@eik.bme.hu>
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

--3866299591-372598317-1653926564=:81612
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <4e9b0a8-5a5a-db29-328-dcb120644918@eik.bme.hu>

On Mon, 30 May 2022, Cédric Le Goater wrote:
> [ resend with a reply-all ]
>
> On 5/27/22 00:43, Michael S. Tsirkin wrote:
>> Recent changes to pcie_host corrected size of its internal region to
>> match what it expects - only the low 28 bits are ever decoded. Previous
>> code just ignored bit 29 (if size was 1 << 29) in the address which does
>> not make much sense.  We are now asserting on size > 1 << 28 instead,
>> but it so happened that ppc actually allows guest to configure as large
>> a size as it wants to, and current firmware set it to 1 << 29.
>> 
>> With just qemu-system-ppc -M sam460ex this triggers an assert which
>> seems to happen when the guest (board firmware?) writes a value to
>> CFGMSK reg:
>> 
>> (gdb) bt
>> 
>> This is done in the board firmware here:
>> 
>> https://git.qemu.org/?p=u-boot-sam460ex.git;a=blob;f=arch/powerpc/cpu/ppc4xx/4xx_pcie.c;h=13348be93dccc74c13ea043d6635a7f8ece4b5f0;hb=HEAD
>> 
>> when trying to map config space.
>> 
>> Note that what firmware does matches
>> https://www.hardware.com.br/comunidade/switch-cisco/1128380/
>> 
>> So it's not clear what the proper fix should be.
>> 
>> However, allowing guest to trigger an assert in qemu is not good practice 
>> anyway.
>> 
>> For now let's just force the mask to 256MB on guest write, this way
>> anything outside the expected address range is ignored.
>> 
>> Fixes: commit 1f1a7b2269 ("include/hw/pci/pcie_host: Correct 
>> PCIE_MMCFG_SIZE_MAX")
>> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>> 
>> Affected system is orphan so I guess I will merge the patch unless
>> someone objects.
>
> Fine with me.
>
> Acked-by: Cédric Le Goater <clg@kaod.org>
>
>
> On the orphan status,
>
> MAINTAINERS file says the sam460ex machine is maintained. I understand that

I'm maintaining sam460ex but I don't know much about other parts so don't 
want to take up all the PPC4xx emulation so only files I've written or 
made extensive changes so I know them are listed. Others are part of 
pre-existing PPC4xx emulation which may be orphan.

> these files :
>
>  hw/ppc/ppc440_uc.c
>  hw/ppc/ppc440.h
>  hw/ppc/ppc440_pcix.c

The ppc440_pcix is already listed, the rest aren't something I know much 
about so wouldn't volunteer to maintain those. They are shared with other 
PPC 4xx machines.

Regards,
BALATON Zoltan

>  hw/ppc/ppc4xx_devs.c
>  include/hw/ppc/ppc4xx.h
>
> and these
>
>  include/hw/i2c/ppc4xx_i2c.h
>  hw/i2c/ppc4xx_i2c.c
>  hw/intc/ppc-uic.c
>  include/hw/intc/ppc-uic.h
>
> should be under the same entry since sam460ex depends on it.
>
> The ppc440 support is a bit of a mess to be honest. We have two 440
> machines bamboo and sam460ex which have a lot in common a part from
> the PCI host bridge.
>
> Thanks,
>
> C.
>
>>
>>   hw/ppc/ppc440_uc.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>> 
>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>> index 993e3ba955..a1ecf6dd1c 100644
>> --- a/hw/ppc/ppc440_uc.c
>> +++ b/hw/ppc/ppc440_uc.c
>> @@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, 
>> uint32_t val)
>>       case PEGPL_CFGMSK:
>>           s->cfg_mask = val;
>>           size = ~(val & 0xfffffffe) + 1;
>> +        /*
>> +         * Firmware sets this register to E0000001. Why we are not sure,
>> +         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
>> +         * ignored.
>> +         */
>> +        if (size > PCIE_MMCFG_SIZE_MAX) {
>> +            size = PCIE_MMCFG_SIZE_MAX;
>> +        }
>>           pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, 
>> size);
>>           break;
>>       case PEGPL_MSGBAH:
>
>
--3866299591-372598317-1653926564=:81612--

