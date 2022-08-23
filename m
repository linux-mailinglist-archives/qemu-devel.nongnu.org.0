Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02DF59DAB9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 12:39:30 +0200 (CEST)
Received: from localhost ([::1]:52756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQRJh-0001NY-RJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 06:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oQRHz-0007ND-Tv; Tue, 23 Aug 2022 06:37:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oQRHx-0008J8-QQ; Tue, 23 Aug 2022 06:37:43 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27N9mZRe017345;
 Tue, 23 Aug 2022 10:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YV81FuXkFUPVx5XeAOhUTpgSaWVE6t/KqWIJuGI57hg=;
 b=Qp+P99JSOaPOL1xyrNNRGrBSPVyNcPCWbeaFt6xm+ICwawZNs8fiKNJrLmsdRMuNeZzg
 u6+lMAwVBurp1iUmR8Q+pyZzuIuZCaovqVGWfzTcdf55hTVmA6+KPdj/zdVLbXYaHjYv
 MfzILCHi6uDAO2iaOZu5Cza+YAe5Ny548PDK75cEglTwFP+8xCDGNbmiHjAVdZqFtiRT
 PUSbkQOA0Nq4E8DaIPJEOg8nFcK7EHIZhzbStYRyi0x22y5hOI8cd9HcYXBtPLwb0hZh
 A6WSdA3Lf1BmXFV81HJChh2kceEsnHc7Z8V5AdXuedXjbKbB2lKrJuDH4kXZPZ1Tauvs yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j4vkbhk83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 10:37:29 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27N9mkBH017683;
 Tue, 23 Aug 2022 10:37:29 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j4vkbhk73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 10:37:29 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27NALrBI005314;
 Tue, 23 Aug 2022 10:37:26 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3j2q88tn5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 10:37:26 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27NAbOll16449956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Aug 2022 10:37:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F0C8A4054;
 Tue, 23 Aug 2022 10:37:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FA1FA405B;
 Tue, 23 Aug 2022 10:37:23 +0000 (GMT)
Received: from [9.171.41.156] (unknown [9.171.41.156])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Aug 2022 10:37:23 +0000 (GMT)
Message-ID: <8bc33d6b-5b79-72a4-0307-bf3aa3c2b0af@linux.ibm.com>
Date: Tue, 23 Aug 2022 12:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 1/2] ppc/pnv: consolidate pnv_parent_*_fixup()
 helpers
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220819094748.400578-1-danielhb413@gmail.com>
 <20220819094748.400578-2-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220819094748.400578-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GLklqFNA1_UiEdFqd2ubebcrPjNgCHn9
X-Proofpoint-ORIG-GUID: lsberxsPTjlCSWuhj6Rj4YFIJHn0kBE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_04,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> We have 2 helpers that amends the QOM and parent bus of a given object,
> repectively. These 2 helpers are called together, and not by accident.
> Due to QOM internals, doing an object_unparent() will result in the
> device being removed from its parent bus. This means that changing the
> QOM parent requires reassigning the parent bus again.
> 
> Create a single helper called pnv_parent_fixup(), documenting some of
> the QOM specifics that we're dealing with the unparenting/parenting
> mechanics, and handle both the QOM and the parent bus assignment.
> 
> Next patch will make use of this function to handle a case where we need
> to change the QOM parent while keeping the same parent bus assigned
> beforehand.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Thanks for the explanation.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   hw/pci-host/pnv_phb.c | 43 ++++++++++++++++++++++++++++---------------
>   1 file changed, 28 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 17d9960aa1..4ea33fb6ba 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -21,34 +21,45 @@
>   
>   
>   /*
> - * Set the QOM parent of an object child. If the device state
> - * associated with the child has an id, use it as QOM id. Otherwise
> - * use object_typename[index] as QOM id.
> + * Set the QOM parent and parent bus of an object child. If the device
> + * state associated with the child has an id, use it as QOM id.
> + * Otherwise use object_typename[index] as QOM id.
> + *
> + * This helper does both operations at the same time because seting
> + * a new QOM child will erase the bus parent of the device. This happens
> + * because object_unparent() will call object_property_del_child(),
> + * which in turn calls the property release callback prop->release if
> + * it's defined. In our case this callback is set to
> + * object_finalize_child_property(), which was assigned during the
> + * first object_property_add_child() call. This callback will end up
> + * calling device_unparent(), and this function removes the device
> + * from its parent bus.
> + *
> + * The QOM and parent bus to be set aren´t necessarily related, so
> + * let's receive both as arguments.
>    */
> -static void pnv_parent_qom_fixup(Object *parent, Object *child, int index)
> +static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
> +                             Object *child, int index,
> +                             Error **errp)
>   {
>       g_autofree char *default_id =
>           g_strdup_printf("%s[%d]", object_get_typename(child), index);
>       const char *dev_id = DEVICE(child)->id;
>   
>       if (child->parent == parent) {
> -        return;
> +        return true;
>       }
>   
>       object_ref(child);
>       object_unparent(child);
>       object_property_add_child(parent, dev_id ? dev_id : default_id, child);
>       object_unref(child);
> -}
> -
> -static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child,
> -                                 Error **errp)
> -{
> -    BusState *parent_bus = qdev_get_parent_bus(parent);
>   
> -    if (!qdev_set_parent_bus(child, parent_bus, errp)) {
> -        return;
> +    if (!qdev_set_parent_bus(DEVICE(child), parent_bus, errp)) {
> +        return false;
>       }
> +
> +    return true;
>   }
>   
>   /*
> @@ -101,8 +112,10 @@ static bool pnv_phb_user_device_init(PnvPHB *phb, Error **errp)
>        * correctly the device tree. pnv_xscom_dt() needs every
>        * PHB to be a child of the chip to build the DT correctly.
>        */
> -    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
> -    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb), errp);
> +    if (!pnv_parent_fixup(parent, qdev_get_parent_bus(DEVICE(chip)),
> +                          OBJECT(phb), phb->phb_id, errp)) {
> +        return false;
> +    }
>   
>       return true;
>   }

