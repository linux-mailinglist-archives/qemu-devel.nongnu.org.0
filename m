Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A0591271
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:46:33 +0200 (CEST)
Received: from localhost ([::1]:59740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVvj-0006nf-L5
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMVqK-0000tx-Jm; Fri, 12 Aug 2022 10:40:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMVqI-00089n-VH; Fri, 12 Aug 2022 10:40:56 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CEZqVK001738;
 Fri, 12 Aug 2022 14:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WS8K4e7yqY2N6kRgvSOh5j4I7Fk+v0icba/tKt3lG3o=;
 b=ne1mghiuwnjjHYCLllYvGR1adcQRok+x5o+oeH5Zdr9n56r6fvZA48i8Ui+TrmHiIK58
 hh7Av5K34qEw3zVZ/s1086h8MEJvcJXYWiS71zhmAjqeQlGuKoTkdVElBwOpZCIDy4mE
 XDDfkeY0BZTO50Fq4d169cYPhjJ4tA2SGGjd/A+vkwSlry5LrXPxhiNn+l7UPvOAixHN
 VNUiNRhG8olIrDMDIDsmytQ9J4ys/JhcUw8Tebz1mx9GNBjxckz819l4skAnW9+JkXk0
 FTx/XH3htqJ6KgtVkggfS4QNFv0YPFuGJPT+mBiEdDDYZ3DdaQWqxPIoGiaznQKN+1M1 eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwrry0fb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:40:52 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CEZuHX002996;
 Fri, 12 Aug 2022 14:40:46 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwrry0eej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:40:45 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CEZd6w023688;
 Fri, 12 Aug 2022 14:40:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3huwvjjgv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:40:32 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CEeTFR25231694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 14:40:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFB8B4C046;
 Fri, 12 Aug 2022 14:40:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EB0C4C04A;
 Fri, 12 Aug 2022 14:40:29 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 14:40:29 +0000 (GMT)
Message-ID: <cb50baef-24ea-a812-e869-55425a666d87@linux.ibm.com>
Date: Fri, 12 Aug 2022 16:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 03/11] ppc/pnv: set root port chassis and slot
 using Bus properties
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-4-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wSUNiGOZNgoOkAUWWOra9p4-eb2-1A2T
X-Proofpoint-ORIG-GUID: EhRwkBmJqBHIz-XK6ZEDwQokvnZNjohc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_09,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208120040
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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



On 11/08/2022 18:39, Daniel Henrique Barboza wrote:
> For default root ports we have a way of accessing chassis and slot,
> before root_port_realize(), via pnv_phb_attach_root_port(). For the
> future user created root ports this won't be the case: we can't use
> this helper because we don't have access to the PHB phb-id/chip-id
> values.
> 
> In earlier patches we've added phb-id and chip-id to pnv-phb-root-bus
> objects. We're now able to use the bus to retrieve them. The bus is
> reachable for both user created and default devices, so we're changing
> all the code paths. This also allow us to validate these changes with
> the existing default devices.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index c47ed92462..826c0c144e 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -25,21 +25,19 @@
>    * QOM id. 'chip_id' is going to be used as PCIE chassis for the
>    * root port.
>    */
> -static void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
> +static void pnv_phb_attach_root_port(PCIHostState *pci)
>   {
>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
> -    g_autofree char *default_id = g_strdup_printf("%s[%d]",
> -                                                  TYPE_PNV_PHB_ROOT_PORT,
> -                                                  index);
>       const char *dev_id = DEVICE(root)->id;
> +    g_autofree char *default_id = NULL;
> +    int index;
> +
> +    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
> +    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
>   
>       object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
>                                 OBJECT(root));
>   
> -    /* Set unique chassis/slot values for the root port */
> -    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
> -    qdev_prop_set_uint16(DEVICE(root), "slot", index);
> -
>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>   }
>   
> @@ -93,7 +91,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>       }
>   
> -    pnv_phb_attach_root_port(pci, phb->phb_id, phb->chip_id);
> +    pnv_phb_attach_root_port(pci);
>   }
>   
>   static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
> @@ -162,9 +160,18 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
> +    PCIBus *bus = PCI_BUS(qdev_get_parent_bus(dev));
>       PCIDevice *pci = PCI_DEVICE(dev);
>       uint16_t device_id = 0;
>       Error *local_err = NULL;
> +    int chip_id, index;
> +
> +    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
> +    index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
> +
> +    /* Set unique chassis/slot values for the root port */
> +    qdev_prop_set_uint8(dev, "chassis", chip_id);
> +    qdev_prop_set_uint16(dev, "slot", index);
>   
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {

