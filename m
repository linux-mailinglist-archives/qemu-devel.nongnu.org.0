Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690FC58A9BC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:52:17 +0200 (CEST)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuwB-00042b-Fp
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oJum4-0003c6-1z; Fri, 05 Aug 2022 06:41:48 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oJum1-0003CR-JR; Fri, 05 Aug 2022 06:41:47 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2759jXcH022681;
 Fri, 5 Aug 2022 10:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AxHmVZhVTfqfmWEA3BsvellOPImDkcaCK1KknxlUYcA=;
 b=R2lTixQ2zD9mqjjGmcWPuKhmjq/go4XOH+aVp2Yc5HKJp7jsShdeYNOGJRSZUF2AXjKG
 +Z73FjMp9IbKxqV1KkPL1qZhKdJrUcVDWtKjeyNbxz6N0lA5ulhnnvhuK5KAMktMVgG3
 /0M7GdqMzqxB+eDoWhAGWwYfpYHLNzbrn4/vdkWuZRX0derXW+lv6NCNBmJf/BAyYyia
 zwv8amngdDewjlB7fYEj6iQRKwcApJMHwDyxKGa2cshJbMYzk8clTZ3/g5r5x2z4rRVr
 0oTKEnPjsxCbEAI8OEQlMxPNyxsYf/Fz9iJca5+2WO8p3JNcka39caUKySJjfsNGyA8Z 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs0uy1eg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 10:41:34 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275ARwtK022378;
 Fri, 5 Aug 2022 10:41:34 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs0uy1efg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 10:41:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275AZnA4027051;
 Fri, 5 Aug 2022 10:41:31 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3hmuwhya1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 10:41:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 275AfT0W29819358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 10:41:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F0AD11C050;
 Fri,  5 Aug 2022 10:41:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E5D811C04C;
 Fri,  5 Aug 2022 10:41:28 +0000 (GMT)
Received: from [9.171.39.100] (unknown [9.171.39.100])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 10:41:28 +0000 (GMT)
Message-ID: <f69358e3-cec5-196e-4b2f-342742b6c5b7@linux.ibm.com>
Date: Fri, 5 Aug 2022 12:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 04/10] ppc/pnv: add helpers for pnv-phb user
 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220803134459.2633902-1-danielhb413@gmail.com>
 <20220803134459.2633902-5-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220803134459.2633902-5-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d0EJy5osRLEC_zBr2ppDYYZ0UgMQJFQF
X-Proofpoint-GUID: Metw2KS_RV9XrxrV1_mmzRG-BS5xgjoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_03,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050052
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



On 03/08/2022 15:44, Daniel Henrique Barboza wrote:
> pnv_parent_qom_fixup() and pnv_parent_bus_fixup() are versions of the
> helpers that were reverted by commit 9c10d86fee "ppc/pnv: Remove
> user-created PHB{3,4,5} devices". They are needed to amend the QOM and
> bus hierarchies of user created pnv-phbs, matching them with default
> pnv-phbs.
> 
> A new helper pnv_phb_user_device_init() is created to handle
> user-created devices setup. We're going to call it inside
> pnv_phb_realize() in case we're realizing an user created device. This
> will centralize all user device realated in a single spot, leaving the
> realize functions of the phb3/phb4 backends untouched.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb.c | 69 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 826c0c144e..da779dc298 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -18,6 +18,37 @@
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
>   
> +
> +/*
> + * Set the QOM parent of an object child. If the device state
> + * associated with the child has an id, use it as QOM id. Otherwise
> + * use object_typename[index] as QOM id.
> + */
> +static void pnv_parent_qom_fixup(Object *parent, Object *child, int index)
> +{
> +    g_autofree char *default_id =
> +        g_strdup_printf("%s[%d]", object_get_typename(child), index);
> +    const char *dev_id = DEVICE(child)->id;
> +
> +    if (child->parent == parent) {
> +        return;
> +    }
> +
> +    object_ref(child);
> +    object_unparent(child);
> +    object_property_add_child(parent, dev_id ? dev_id : default_id, child);
> +    object_unref(child);
> +}
> +
> +static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
> +{
> +    BusState *parent_bus = qdev_get_parent_bus(parent);
> +
> +    if (!qdev_set_parent_bus(child, parent_bus, &error_fatal)) {
> +        return;
> +    }
> +}
> +
>   /*
>    * Attach a root port device.
>    *
> @@ -41,6 +72,36 @@ static void pnv_phb_attach_root_port(PCIHostState *pci)
>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>   }
>   
> +/*
> + * User created devices won't have the initial setup that default
> + * devices have. This setup consists of assigning a parent device
> + * (chip for PHB3, PEC for PHB4/5) that will be the QOM/bus parent
> + * of the PHB.
> + */
> +static void pnv_phb_user_device_init(PnvPHB *phb)
> +{
> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
> +    Object *parent = NULL;
> +
> +    if (!chip) {
> +        error_setg(&error_fatal, "invalid chip id: %d", phb->chip_id);
> +        return;
> +    }
> +
> +    /*
> +     * Reparent user created devices to the chip to build
> +     * correctly the device tree. pnv_xscom_dt() needs every
> +     * PHB to be a child of the chip to build the DT correctly.
> +     *
> +     * TODO: for version 3 we're still parenting the PHB with the
> +     * chip. We should parent with a (so far not implemented)
> +     * PHB3 PEC device.
> +     */
> +    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);


Here we reparent the phb to NULL. I can see in the following patches why 
it's done this way and the end result is ok. After this patch, we can't 
create a user device yet, so no harm can be done. But a (temporary) 
comment could save the reviewer a heart attack :-)

   Fred


> +    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb));
> +}
> +
>   static void pnv_phb_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB *phb = PNV_PHB(dev);
> @@ -74,6 +135,14 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>       object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
>       object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
>   
> +    /*
> +     * Handle user created devices. User devices will not have a
> +     * pointer to a chip (PHB3) and a PEC (PHB4/5).
> +     */
> +    if (!phb->chip && !phb->pec) {
> +        pnv_phb_user_device_init(phb);
> +    }
> +
>       if (phb->version == 3) {
>           object_property_set_link(phb->backend, "chip",
>                                    OBJECT(phb->chip), errp);

