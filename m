Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945C583145
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:53:35 +0200 (CEST)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlDx-0004bo-VA
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl46-0005Hf-8t; Wed, 27 Jul 2022 13:43:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl43-0000ul-N9; Wed, 27 Jul 2022 13:43:21 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHfiFi013641;
 Wed, 27 Jul 2022 17:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pxTnHIhivDrPiccMS9fahelJtd8gkm19hQZnwutfoo0=;
 b=tTlzNWDbPRHd85IPjMOt8njiTwkpZ+/ewa53HTi6cMdm9xmqk3mDmG3RHxE9JK+QC9H3
 4cTNQccck4SlUbgDPse6sSfaFdDocRgfXDXFrjhpBhi+zlYVZiF0IF+L+3LWQ44bv1NC
 ByDx6xba2k6CJJtxCW+DnDdt0FjyxWp4C+O1roZJA5tAniFb1r14ZEHAfBrZssQLX8CT
 LbUp9OUM9KNE73tzury1nFkU0o1lxyxJf+rrXOsFMToxlTqjIqFer9KRBpHf1594kEAF
 uQhF6VIYn5uTiaED4lG9UMRQQ9BuxPq50Fo9lMJD+lShoGZUyX5brtd9wOffv5a9WJqr cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9mc8xdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:07 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHh7RS020560;
 Wed, 27 Jul 2022 17:43:07 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9mc8xda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:07 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHZ7Ec029615;
 Wed, 27 Jul 2022 17:43:04 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tdb1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:04 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RHh2Rm12517714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:43:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4214011C04C;
 Wed, 27 Jul 2022 17:43:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02C3411C04A;
 Wed, 27 Jul 2022 17:43:02 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:43:01 +0000 (GMT)
Message-ID: <01f7144d-2fc9-4244-d4ae-7a6d2eb1720a@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 07/12] ppc/pnv: remove pnv-phb3-root-port
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-8-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-8-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I2RB0koWx6waIdNQly-eY_fKhaA3UE7C
X-Proofpoint-GUID: B2L_njJOyRkyPOwowp-TphvFha_fVrVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
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



On 24/06/2022 10:49, Daniel Henrique Barboza wrote:
> The unified pnv-phb-root-port can be used in its place. There is no ABI
> breakage in doing so because no official QEMU release introduced user
> creatable pnv-phb3-root-port devices.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb.c          |  2 +-
>   hw/pci-host/pnv_phb3.c         | 42 ----------------------------------
>   hw/ppc/pnv.c                   |  1 +
>   include/hw/pci-host/pnv_phb3.h |  6 -----
>   4 files changed, 2 insertions(+), 49 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 5e61f85614..cdddc6a389 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -34,7 +34,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>       switch (phb->version) {
>       case 3:
>           phb_typename = g_strdup(TYPE_PNV_PHB3);
> -        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
>           break;
>       case 4:
>           phb_typename = g_strdup(TYPE_PNV_PHB4);
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index ad5d67a8e8..2966374008 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1122,51 +1122,9 @@ static const TypeInfo pnv_phb3_root_bus_info = {
>       .class_init = pnv_phb3_root_bus_class_init,
>   };
>   
> -static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
> -{
> -    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> -    PCIDevice *pci = PCI_DEVICE(dev);
> -    Error *local_err = NULL;
> -
> -    rpc->parent_realize(dev, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -    pci_config_set_interrupt_pin(pci->config, 0);
> -}
> -
> -static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> -    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
> -
> -    dc->desc     = "IBM PHB3 PCIE Root Port";
> -
> -    device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
> -                                    &rpc->parent_realize);
> -    dc->user_creatable = false;
> -
> -    k->vendor_id = PCI_VENDOR_ID_IBM;
> -    k->device_id = 0x03dc;
> -    k->revision  = 0;
> -
> -    rpc->exp_offset = 0x48;
> -    rpc->aer_offset = 0x100;
> -}
> -
> -static const TypeInfo pnv_phb3_root_port_info = {
> -    .name          = TYPE_PNV_PHB3_ROOT_PORT,
> -    .parent        = TYPE_PCIE_ROOT_PORT,
> -    .instance_size = sizeof(PnvPHB3RootPort),
> -    .class_init    = pnv_phb3_root_port_class_init,
> -};
> -
>   static void pnv_phb3_register_types(void)
>   {
>       type_register_static(&pnv_phb3_root_bus_info);
> -    type_register_static(&pnv_phb3_root_port_info);
>       type_register_static(&pnv_phb3_type_info);
>       type_register_static(&pnv_phb3_iommu_memory_region_info);
>   }
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index b7273f386e..d82c66ca6f 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -2108,6 +2108,7 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>   
>       static GlobalProperty phb_compat[] = {
>           { TYPE_PNV_PHB, "version", "3" },
> +        { TYPE_PNV_PHB_ROOT_PORT, "version", "3" },
>       };
>   
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index 3b9ff1096a..bff69201d9 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -108,12 +108,6 @@ struct PnvPBCQState {
>    */
>   #define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
>   
> -#define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
> -
> -typedef struct PnvPHB3RootPort {
> -    PCIESlot parent_obj;
> -} PnvPHB3RootPort;
> -
>   /*
>    * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)
>    */

