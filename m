Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D37591428
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 18:44:22 +0200 (CEST)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMXll-00030u-OL
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 12:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMXJt-0007PE-QN; Fri, 12 Aug 2022 12:15:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMXJq-0006Fn-CO; Fri, 12 Aug 2022 12:15:32 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CFhjtA010447;
 Fri, 12 Aug 2022 16:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=p/1MVhGjkpbRzkl9SAQ8FPPxmiJjq7C4VZ+LcDqHGvI=;
 b=EUByL/A8k2o2woPMmHQOSpT0pu/wzYwsUeyET4D2hLRjaGQJn2HtgtdQLwGztEzIbqwO
 I+XEajzJXrksLSpTi8cyUuNZpslulH0fwsj+AxZtVLkHglLAPYl1DmFrOxa+f02Oo+Rg
 SjSZbLvmBmFQxPJfNovJbM8WMdyzU2gyEufG5oKvWyeAHvCNkX8h0oO20XjtBEefRABS
 MkVet8m6FiYtXoN0l56vZNq3SXVnezo48xC4y1xni+/kHQmLbbWCqZ3dpyL4p/qgXGYe
 /5+/MliVrllu6FTKx3xg4YzivNA7eB4fnYvMDPaxtxqcB82grdDQ9Y2HFDY4XpVgkraH cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwsrprwkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 16:15:21 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CFpF1a011455;
 Fri, 12 Aug 2022 16:15:21 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwsrprwjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 16:15:21 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CG5QrA014617;
 Fri, 12 Aug 2022 16:15:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3huwvftjh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 16:15:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27CGFZdf28770672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 16:15:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F73D4C04A;
 Fri, 12 Aug 2022 16:15:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 332554C046;
 Fri, 12 Aug 2022 16:15:17 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 16:15:17 +0000 (GMT)
Message-ID: <d33990ec-a85f-2b86-91cd-9bea64a4b569@linux.ibm.com>
Date: Fri, 12 Aug 2022 18:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 06/11] ppc/pnv: enable user created pnv-phb for
 powernv8
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-7-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-7-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -A6WAGVoz7FXFNSZS2haT7dKJ_645mwd
X-Proofpoint-ORIG-GUID: h9StL7r1Gk8c3Rh5hc4EpnXs_fTdQr9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208120043
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
> The bulk of the work was already done by previous patches.
> 
> Use defaults_enabled() to determine whether we need to create the
> default devices or not.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


The QOM relationship for user-created root port is not ideal, but it's 
addressed in the last patch of the series.
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb.c |  9 +++++++--
>   hw/ppc/pnv.c          | 32 ++++++++++++++++++--------------
>   2 files changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 5dc44f45d1..1f53ff77c5 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -17,6 +17,7 @@
>   #include "hw/ppc/pnv.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> +#include "sysemu/sysemu.h"
>   
>   
>   /*
> @@ -166,6 +167,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>       }
>   
> +    if (phb->version == 3 && !defaults_enabled()) {
> +        return;
> +    }
> +
>       pnv_phb_attach_root_port(pci);
>   }
>   
> @@ -201,7 +206,7 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
>       dc->realize = pnv_phb_realize;
>       device_class_set_props(dc, pnv_phb_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> -    dc->user_creatable = false;
> +    dc->user_creatable = true;
>   }
>   
>   static void pnv_phb_root_port_reset(DeviceState *dev)
> @@ -292,7 +297,7 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
>       device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
>                                     &rpc->parent_reset);
>       dc->reset = &pnv_phb_root_port_reset;
> -    dc->user_creatable = false;
> +    dc->user_creatable = true;
>   
>       k->vendor_id = PCI_VENDOR_ID_IBM;
>       /* device_id will be written during realize() */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index e53e9e297d..e82d6522f0 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1178,20 +1178,22 @@ static void pnv_chip_power8_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
>   
> -    chip8->num_phbs = pcc->num_phbs;
> -
> -    for (i = 0; i < chip8->num_phbs; i++) {
> -        Object *phb = object_new(TYPE_PNV_PHB);
> -
> -        /*
> -         * We need the chip to parent the PHB to allow the DT
> -         * to build correctly (via pnv_xscom_dt()).
> -         *
> -         * TODO: the PHB should be parented by a PEC device that, at
> -         * this moment, is not modelled powernv8/phb3.
> -         */
> -        object_property_add_child(obj, "phb[*]", phb);
> -        chip8->phbs[i] = PNV_PHB(phb);
> +    if (defaults_enabled()) {
> +        chip8->num_phbs = pcc->num_phbs;
> +
> +        for (i = 0; i < chip8->num_phbs; i++) {
> +            Object *phb = object_new(TYPE_PNV_PHB);
> +
> +            /*
> +             * We need the chip to parent the PHB to allow the DT
> +             * to build correctly (via pnv_xscom_dt()).
> +             *
> +             * TODO: the PHB should be parented by a PEC device that, at
> +             * this moment, is not modelled powernv8/phb3.
> +             */
> +            object_property_add_child(obj, "phb[*]", phb);
> +            chip8->phbs[i] = PNV_PHB(phb);
> +        }
>       }
>   
>   }
> @@ -2130,6 +2132,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>   
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
> +
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
>   }
>   
>   static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)

