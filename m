Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A0559DABD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 12:42:11 +0200 (CEST)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQRMI-0003g8-Bg
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 06:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oQRIB-0007hS-JH; Tue, 23 Aug 2022 06:37:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oQRI9-0008JX-P3; Tue, 23 Aug 2022 06:37:55 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NAVkbx027741;
 Tue, 23 Aug 2022 10:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QNSNDq7g9ZN5azXrtdLfMd30v1163CjqolqWAyDnbMU=;
 b=R/FLAXY434gdzbUGwyy/hxB0Q9m5B88X5a9oHuJkOJ4b/Fi9ctrFsTdZHnQ7o5EkTsM2
 9XeovmD25L3jY765MYLXjygOTD89FHDsVNH1dlwVFF7GA9AUm2qzHHFX4UJ0e1KvDb/u
 2mCRT8NGr+8xYOekOcEFieNIvRsA2X+JlrMXtQXKMdzpsqYjsVQC+2S/4p1A+KlkDbRb
 QmJHfH0dRJIACRVHOGH+rQfxlt1eUb3hCYew4En2T1hBtsA4AHLuJc8QE75pLEBDUy7c
 OIqsEb0LLYSLgJEndj6x+lt+Ve+FZi6czeg/Epap5eJmrWJo9k1Y1h9zhBD3g8SAhT4x vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j4w7k864h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 10:37:47 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27NAWwG3004082;
 Tue, 23 Aug 2022 10:37:47 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j4w7k862y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 10:37:47 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27NAL48H010902;
 Tue, 23 Aug 2022 10:37:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3j2q88umvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 10:37:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27NAc2CU35651926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Aug 2022 10:38:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FBA1A405C;
 Tue, 23 Aug 2022 10:37:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3276A405B;
 Tue, 23 Aug 2022 10:37:41 +0000 (GMT)
Received: from [9.171.41.156] (unknown [9.171.41.156])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Aug 2022 10:37:41 +0000 (GMT)
Message-ID: <1991eab7-d26b-1c82-0330-12cd5e2c8461@linux.ibm.com>
Date: Tue, 23 Aug 2022 12:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 2/2] ppc/pnv: fix QOM parenting of user
 creatable root ports
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220819094748.400578-1-danielhb413@gmail.com>
 <20220819094748.400578-3-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220819094748.400578-3-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gr2Hrulsk1JzN_8PKSAvg_BK4mnBXSyk
X-Proofpoint-ORIG-GUID: UXcy276HV7xoLQILZQGcJstb0AmmffLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_04,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230040
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



On 19/08/2022 11:47, Daniel Henrique Barboza wrote:
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
> After all that, remove pnv_phb_attach_root_port() and create the root
> port explictly in the 'default_enabled()' case of pnv_phb_realize().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   hw/pci-host/pnv_phb.c | 47 ++++++++++++++++++-------------------------
>   1 file changed, 20 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 4ea33fb6ba..7b11f1e8dd 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -62,29 +62,6 @@ static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
>       return true;
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
> -{
> -    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
> -    const char *dev_id = DEVICE(root)->id;
> -    g_autofree char *default_id = NULL;
> -    int index;
> -
> -    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
> -    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
> -
> -    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
> -                              OBJECT(root));
> -
> -    pci_realize_and_unref(root, pci->bus, &error_fatal);
> -}
> -
>   /*
>    * User created devices won't have the initial setup that default
>    * devices have. This setup consists of assigning a parent device
> @@ -180,11 +157,11 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>       }
>   
> -    if (!defaults_enabled()) {
> -        return;
> -    }
> +    if (defaults_enabled()) {
> +        PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
>   
> -    pnv_phb_attach_root_port(pci);
> +        pci_realize_and_unref(root, pci->bus, errp);
> +    }
>   }
>   
>   static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
> @@ -259,6 +236,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
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
> @@ -266,6 +248,17 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>       qdev_prop_set_uint8(dev, "chassis", chip_id);
>       qdev_prop_set_uint16(dev, "slot", index);
>   
> +    /*
> +     * User created root ports are QOM parented to one of
> +     * the peripheral containers but it's already at the right
> +     * parent bus. Change the QOM parent to be the same as the
> +     * parent bus it's already assigned to.
> +     */
> +    if (!pnv_parent_fixup(OBJECT(bus), BUS(bus), OBJECT(dev),
> +                          index, errp)) {
> +        return;
> +    }
> +
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);

