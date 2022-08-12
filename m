Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F58B5913F0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 18:34:34 +0200 (CEST)
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMXcG-0004ZZ-SB
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 12:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMXHj-0005cN-EA; Fri, 12 Aug 2022 12:13:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMXHh-0005oy-21; Fri, 12 Aug 2022 12:13:19 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CG7lLG004589;
 Fri, 12 Aug 2022 16:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qwA7GaMaFB0fVkIPYwQ3U5RXALCodqSgeA1EGBYnqvI=;
 b=gMSI6dJBI3oWBq7GA4MRPY0izXXVpLsEllEKudCab0RidLKeg0SBX0ICWQxBL5Pq5L/d
 RrN0j2lQoPeHr7qvtjgB32nbwq9jf880e+gwAcDn/lZaZoE/5JvF5f0eMAgluEYlkXVS
 IYrtEl2u6e+EopQwqkms7CQDPAsfdCBUciBj2+BESQnac4P3m5URITfy7XGigma1W1hS
 yE4QEM5P/adWcdOeoiy+S8uOZP5nT7qEjTdbXIlJiJK1AbJx3b05sBsTqWgcP9ocSch+
 9JqaTczDxntAQhRm3Xx8LpXssSZq3ITGlYsu7iDT9cCcCBhMmg4pxZTRZlB3HEYyTLex YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwsuerfc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 16:13:14 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CGAU0v018352;
 Fri, 12 Aug 2022 16:13:13 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwsuerfb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 16:13:13 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CG5vjt010757;
 Fri, 12 Aug 2022 16:13:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3hw3wfs7xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 16:13:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CGD95026739142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 16:13:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DECF4C044;
 Fri, 12 Aug 2022 16:13:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D7684C040;
 Fri, 12 Aug 2022 16:13:09 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 16:13:09 +0000 (GMT)
Message-ID: <8eda639d-b041-df07-f759-c65ec2d85312@linux.ibm.com>
Date: Fri, 12 Aug 2022 18:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 11/11] ppc/pnv: fix QOM parenting of user
 creatable root ports
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-12-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-12-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NzZPG68eYlMaAJfZ04bMn0Q1yzc-PLFI
X-Proofpoint-ORIG-GUID: X-sNKh3k_4CFOgpvCVLyZYqgQ2XUya4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120043
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
> User creatable root ports are being parented by the 'peripheral' or the
> 'peripheral-anon' container. This happens because this is the regular
> QOM schema for sysbus devices that are added via the command line.
> 
> Let's make this QOM hierarchy similar to what we have with default root
> ports, i.e. the root port must be parented by the pnv-root-bus. To do
> that we change the qom and bus parent of the root port during
> root_port_realize(). The realize() is shared by the default root port
> code path, so we can remove the code inside pnv_phb_attach_root_port()
> that was adding the root port as a child of the bus as well.
> 
> While we're at it, change pnv_phb_attach_root_port() to receive a PCIBus
> instead of a PCIHostState to make it clear that the function does not
> make use of the PHB.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb.c | 35 +++++++++++++++--------------------
>   1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 17d9960aa1..65ed1f9eb4 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -51,27 +51,11 @@ static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child,
>       }
>   }
>   
> -/*
> - * Attach a root port device.
> - *
> - * 'index' will be used both as a PCIE slot value and to calculate
> - * QOM id. 'chip_id' is going to be used as PCIE chassis for the
> - * root port.
> - */
> -static void pnv_phb_attach_root_port(PCIHostState *pci)
> +static void pnv_phb_attach_root_port(PCIBus *bus)
>   {
>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
> -    const char *dev_id = DEVICE(root)->id;
> -    g_autofree char *default_id = NULL;
> -    int index;
> -
> -    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
> -    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
> -
> -    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
> -                              OBJECT(root));
>   
> -    pci_realize_and_unref(root, pci->bus, &error_fatal);
> +    pci_realize_and_unref(root, bus, &error_fatal);
>   }
>   
>   /*
> @@ -171,7 +155,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    pnv_phb_attach_root_port(pci);
> +    pnv_phb_attach_root_port(pci->bus);
>   }
>   
>   static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
> @@ -240,12 +224,18 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
> -    PCIBus *bus = PCI_BUS(qdev_get_parent_bus(dev));
> +    BusState *qbus = qdev_get_parent_bus(dev);
> +    PCIBus *bus = PCI_BUS(qbus);
>       PCIDevice *pci = PCI_DEVICE(dev);
>       uint16_t device_id = 0;
>       Error *local_err = NULL;
>       int chip_id, index;
>   
> +    /*
> +     * 'index' will be used both as a PCIE slot value and to calculate
> +     * QOM id. 'chip_id' is going to be used as PCIE chassis for the
> +     * root port.
> +     */
>       chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
>       index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
>   
> @@ -253,6 +243,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>       qdev_prop_set_uint8(dev, "chassis", chip_id);
>       qdev_prop_set_uint16(dev, "slot", index);
>   
> +    pnv_parent_qom_fixup(OBJECT(bus), OBJECT(dev), index);
> +    if (!qdev_set_parent_bus(dev, qbus, &error_fatal)) {


That line looks surprising at first, because we got qbus from 
qdev_get_parent_bus() just above, so it looks like a noop. I talked to 
Daniel about it: the device<->bus relationship is correct when entering 
the function but the call to pnv_parent_qom_fixup() interferes with the 
bus relationship, so it needs to be re-established.
Short of a better suggestion, it probably need a comment.

   Fred



> +        return;
> +    }
> +
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);

