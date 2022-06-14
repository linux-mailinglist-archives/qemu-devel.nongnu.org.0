Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3757F54AD76
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:37:57 +0200 (CEST)
Received: from localhost ([::1]:52842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12zk-0001wL-AR
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12YU-00005T-3L; Tue, 14 Jun 2022 05:09:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58504
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o12YR-0003Ii-Mt; Tue, 14 Jun 2022 05:09:45 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E7HxPT030612;
 Tue, 14 Jun 2022 09:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dTQF7cOpivnQkGpijRZjqwQdoc9EeLptsuV9UnQIAsI=;
 b=gqoy+1mqapQaY1SgjW8tBT6pWYh+F6m+YbzYFXbWOZaqJ5iwv+dwNbtKQ5ZfZkFlMpSL
 ZxIGyOb25QQVPGpB4mnRrha/YTCkH5SMputRf5xBHuZ+YPz6gFHPHLSkVtH5npIuSI5h
 s47wbZQwagUybwGEMxFi8z575OtXBGouI8rF4SA13D2ZwTmjc4vZFumX9OoDmFvU0u2c
 SAScrB27F3abwKjbmFyerOv29qlxLPIkmaHAxC+t8HmngKuDCmSUXoP0vdy9bYNKLay2
 22Ef6QtpcIqNxIAXu3ny7F1c/Fr0jFZQ2/xeKXPh0QNGMkFzJ6jgx6YuBrvrd9OKmaCi Kw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpeevj379-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:09:31 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25E96ocq005494;
 Tue, 14 Jun 2022 09:09:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3gmjp9c3nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 09:09:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25E99RBO18743706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 09:09:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF178A405B;
 Tue, 14 Jun 2022 09:09:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B49A4A4054;
 Tue, 14 Jun 2022 09:09:26 +0000 (GMT)
Received: from [9.145.3.226] (unknown [9.145.3.226])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 09:09:26 +0000 (GMT)
Message-ID: <a4293bb3-a069-867e-2714-66a6ef4efb65@linux.ibm.com>
Date: Tue, 14 Jun 2022 11:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 02/11] ppc/pnv: attach phb3/phb4 root ports in QOM tree
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, mark.cave-ayland@ilande.co.uk
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-3-danielhb@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220613154456.359674-3-danielhb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L4Wdo_432gc9MqxY0l2v7yAp2ZvrRgvi
X-Proofpoint-GUID: L4Wdo_432gc9MqxY0l2v7yAp2ZvrRgvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140035
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 13/06/2022 17:44, Daniel Henrique Barboza wrote:
> At this moment we leave the pnv-phb3(4)-root-port unattached in QOM:
> 
>    /unattached (container)
> (...)
>      /device[2] (pnv-phb3-root-port)
>        /bus master container[0] (memory-region)
>        /bus master[0] (memory-region)
>        /pci_bridge_io[0] (memory-region)
>        /pci_bridge_io[1] (memory-region)
>        /pci_bridge_mem[0] (memory-region)
>        /pci_bridge_pci[0] (memory-region)
>        /pci_bridge_pref_mem[0] (memory-region)
>        /pci_bridge_vga_io_hi[0] (memory-region)
>        /pci_bridge_vga_io_lo[0] (memory-region)
>        /pci_bridge_vga_mem[0] (memory-region)
>        /pcie.0 (PCIE)
> 
> Let's make changes in pnv_phb_attach_root_port() to attach the created
> root ports to its corresponding PHB.
> 
> This is the result afterwards:
> 
>      /pnv-phb3[0] (pnv-phb3)
>        /lsi (ics)
>        /msi (phb3-msi)
>        /msi32[0] (memory-region)
>        /msi64[0] (memory-region)
>        /pbcq (pnv-pbcq)
>      (...)
>        /phb3_iommu[0] (pnv-phb3-iommu-memory-region)
>        /pnv-phb3-root.0 (pnv-phb3-root)
>          /pnv-phb3-root-port[0] (pnv-phb3-root-port)
>            /bus master container[0] (memory-region)
>            /bus master[0] (memory-region)
>            /pci_bridge_io[0] (memory-region)
>            /pci_bridge_io[1] (memory-region)
>            /pci_bridge_mem[0] (memory-region)
>            /pci_bridge_pci[0] (memory-region)
>            /pci_bridge_pref_mem[0] (memory-region)
>            /pci_bridge_vga_io_hi[0] (memory-region)
>            /pci_bridge_vga_io_lo[0] (memory-region)
>            /pci_bridge_vga_mem[0] (memory-region)
>            /pcie.0 (PCIE)
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---


I've always wondered if there was a good reason to have them detached. 
Glad to see there was none :-)

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb3.c | 2 +-
>   hw/pci-host/pnv_phb4.c | 2 +-
>   hw/ppc/pnv.c           | 7 ++++++-
>   include/hw/ppc/pnv.h   | 2 +-
>   4 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 26ac9b7123..4ba660f8b9 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1052,7 +1052,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>   
>       pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
>   
> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
> +    pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT, phb->phb_id);
>   }
>   
>   void pnv_phb3_update_regions(PnvPHB3 *phb)
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 23ad8de7ee..ffd9d8a947 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1585,7 +1585,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   
>       /* Add a single Root port if running with defaults */
> -    pnv_phb_attach_root_port(pci, pecc->rp_model);
> +    pnv_phb_attach_root_port(pci, pecc->rp_model, phb->phb_id);
>   
>       /* Setup XIVE Source */
>       if (phb->big_phb) {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 7c08a78d6c..40e0cbd84d 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1190,9 +1190,14 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
>   }
>   
>   /* Attach a root port device */
> -void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
> +void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index)
>   {
>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
> +    g_autofree char *default_id = g_strdup_printf("%s[%d]", name, index);
> +    const char *dev_id = DEVICE(root)->id;
> +
> +    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
> +                              OBJECT(root));
>   
>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>   }
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 86cb7d7f97..033890a23f 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -189,7 +189,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>                            TYPE_PNV_CHIP_POWER10)
>   
>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
> -void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
> +void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index);
>   
>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>   typedef struct PnvMachineClass PnvMachineClass;

