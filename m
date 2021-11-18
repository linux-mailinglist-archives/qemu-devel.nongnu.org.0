Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B557455E94
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:51:04 +0100 (CET)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnikh-0001Gl-Bn
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:51:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnigQ-0002Xt-K4
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:46:38 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnigO-0006FV-H2
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:46:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.41])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 66E87CC6485C;
 Thu, 18 Nov 2021 15:46:35 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 15:46:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0069f9955c5-645f-4442-91aa-b2d0b147d8e1,
 4A6ABDF66DC85A3D00A6C17CB73E494911F6EB6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <e1ff1bfa-bdcb-3bec-f438-a1037de43324@kaod.org>
Date: Thu, 18 Nov 2021 15:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/3] pcie_aer: Don't trigger a LSI if none are defined
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20211116170133.724751-1-fbarrat@linux.ibm.com>
 <20211116170133.724751-4-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211116170133.724751-4-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f5bba50a-b6e1-414a-b418-ac22824019d2
X-Ovh-Tracer-Id: 7443042809473829795
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.084,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/16/21 18:01, Frederic Barrat wrote:
> Skip triggering an LSI when the AER root error status is updated if no
> LSI is defined for the device. We can have a root bridge with no LSI,
> MSI and MSI-X defined, for example on POWER systems.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



>   hw/pci/pcie_aer.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 27f9cc56af..e1a8a88c8c 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -774,7 +774,9 @@ void pcie_aer_root_write_config(PCIDevice *dev,
>       uint32_t root_cmd = pci_get_long(aer_cap + PCI_ERR_ROOT_COMMAND);
>       /* 6.2.4.1.2 Interrupt Generation */
>       if (!msix_enabled(dev) && !msi_enabled(dev)) {
> -        pci_set_irq(dev, !!(root_cmd & enabled_cmd));
> +        if (pci_intx(dev) != -1) {
> +            pci_set_irq(dev, !!(root_cmd & enabled_cmd));
> +        }
>           return;
>       }
>   
> 


