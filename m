Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B3544B0D8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:06:05 +0100 (CET)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkTdM-0005Am-6B
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:06:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mkTcB-0004Dz-L2; Tue, 09 Nov 2021 11:04:51 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:42413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mkTc9-0005xc-L9; Tue, 09 Nov 2021 11:04:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.5])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6FAC2205E7;
 Tue,  9 Nov 2021 16:04:39 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 9 Nov
 2021 17:04:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0038adbff4e-e9c1-4276-9202-87ec80fe263e,
 2FD3076085996E9ABB35C481E01F99311F47EFEF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <1419c2a2-8e19-d9d6-d9aa-b6b7abccfb99@kaod.org>
Date: Tue, 9 Nov 2021 17:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] pci-host: Allow extended config space access for PowerNV
 PHB4 model
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, Christophe Lombard
 <clombard@linux.vnet.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>, Ben Widawsky <ben.widawsky@intel.com>
References: <20211109145053.43524-1-clombard@linux.vnet.ibm.com>
 <67182075-8e5b-08ad-d17f-405b720a6fb5@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <67182075-8e5b-08ad-d17f-405b720a6fb5@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bb5bb547-fdb9-4fd4-9e0a-78e0884f6bfb
X-Ovh-Tracer-Id: 11247458595035188131
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeggdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegsvghnrdifihgurgifshhkhiesihhnthgvlhdrtghomh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.364,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/9/21 16:51, Frederic Barrat wrote:
> 
> 
> On 09/11/2021 15:50, Christophe Lombard wrote:
>> The PCIe extended configuration space on the device is not currently
>> accessible to the host. if by default,  it is still inaccessible for
>> conventional for PCIe buses, add the current flag
>> PCI_BUS_EXTENDED_CONFIG_SPACE on the root bus permits PCI-E extended
>> config space access.

For the record, this is coming from an experiment of plugging a
CXL device on a QEMU PowerNV POWER10 machine (baremetal). Only
minor changes (64 bits ops) were required to get it working.
  
I wonder where are with the CXL models ?

>> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
>> ---
> 
> 
> FWIW, looks good to me
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> 
> 
> 
>>   hw/pci-host/pnv_phb4.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 5c375a9f28..40b793201a 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1205,6 +1205,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>                                        &phb->pci_mmio, &phb->pci_io,
>>                                        0, 4, TYPE_PNV_PHB4_ROOT_BUS);
>>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>> +    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>>       /* Add a single Root port */
>>       qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
>>


