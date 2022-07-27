Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0AE5831FE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:28:35 +0200 (CEST)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGllq-0004Ul-Ac
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGlGn-0007lv-7R; Wed, 27 Jul 2022 13:56:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGlGl-0002rr-7p; Wed, 27 Jul 2022 13:56:28 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHr0JV005801;
 Wed, 27 Jul 2022 17:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YTYIh+ja8zYBHR7IYn20F2f2BXGzZY9uKeOhybMNg7g=;
 b=U99xeYNnVia07Os3DDgcni8wLjjA0ouBBx/0SN070gh9arC3TSjXI6BlbOmbCFNNPfQd
 JvJEUTtzpLoZ2hV8lpyEjp64j0PyZrPwNkezsCnBer4RxfKeDs3ckCQeCa8hpxXM6b14
 EMeh5u+SzDa2pUDR3ZUaKPTkbOCwtt+4Ii8uItQB7aIGgSKrylWCauXJMUREkzpEOYr3
 vzEx223C9ee+2P+YZI6I8pYQdHLeMkm5tLSW8QweF5q4MgI2ydbZmWt1J3timRdB+Z9F
 Mk7qDcOu0Rev1od2oYtsIRrFcnQcNhcufX/cs5XwoLKoRRbz50y4h3TVgQuToFT97ZMd CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka5482xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:56:22 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHIdqj003447;
 Wed, 27 Jul 2022 17:41:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9na8uhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:41:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHZojx029879;
 Wed, 27 Jul 2022 17:41:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tdb0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:41:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26RHdZLN19464524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:39:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 652CD11C052;
 Wed, 27 Jul 2022 17:41:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B23411C04A;
 Wed, 27 Jul 2022 17:41:36 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:41:36 +0000 (GMT)
Message-ID: <fdb9248c-1b25-ec59-1532-a2ce093edf96@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 05/12] ppc/pnv: turn PnvPHB4 into a PnvPHB backend
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-6-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-6-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UmjLJgurs__oFhfZBTPPqBQJrH17b9f0
X-Proofpoint-ORIG-GUID: 5ZkXQtPeEH3ibHZO-lJx88OnSltxcEYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207270074
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

> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 1df91971b8..b7273f386e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -672,7 +672,14 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>   static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
>   {
>       Monitor *mon = opaque;
> -    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
> +    PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
> +    PnvPHB4 *phb4;
> +
> +    if (!phb) {
> +        return 0;
> +    }
> +
> +    phb4 = (PnvPHB4 *)phb->backend;
>   
>       if (phb4) {
>           pnv_phb4_pic_print_info(phb4, mon);


The full code in pnv_chip_power9_pic_print_info_child() looks like this:

     PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
     PnvPHB4 *phb4;

     if (!phb) {
         return 0;
     }

     phb4 = (PnvPHB4 *)phb->backend;

     if (phb4) {
         pnv_phb4_pic_print_info(phb4, mon);
     }

Which is correct. However, if I want to nitpick, phb->backend is defined 
when the PnvPHB object is realized, so I don't think we can get here 
with the pointer being null, so we could remove the second if statement 
for readability. The reason I mention it is that we don't take that much 
care in the pnv_chip_power8_pic_print_info() function just above, so it 
looks a bit odd.

In any case:
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred




> @@ -2122,8 +2129,14 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>       PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
>       static const char compat[] = "qemu,powernv9\0ibm,powernv";
>   
> +    static GlobalProperty phb_compat[] = {
> +        { TYPE_PNV_PHB, "version", "4" },
> +    };
> +
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
> +
>       xfc->match_nvt = pnv_match_nvt;
>   
>       mc->alias = "powernv";
> @@ -2140,8 +2153,13 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
>       XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
>       static const char compat[] = "qemu,powernv10\0ibm,powernv";
>   
> +    static GlobalProperty phb_compat[] = {
> +        { TYPE_PNV_PHB, "version", "5" },
> +    };
> +
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power10_v2.0");
> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
>   
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 90843ac3a9..f22253358f 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -18,6 +18,7 @@
>   typedef struct PnvPhb4PecState PnvPhb4PecState;
>   typedef struct PnvPhb4PecStack PnvPhb4PecStack;
>   typedef struct PnvPHB4 PnvPHB4;
> +typedef struct PnvPHB PnvPHB;
>   typedef struct PnvChip PnvChip;
>   
>   /*
> @@ -78,7 +79,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
>   #define PCI_MMIO_TOTAL_SIZE        (0x1ull << 60)
>   
>   struct PnvPHB4 {
> -    PCIExpressHost parent_obj;
> +    DeviceState parent;
> +
> +    PnvPHB *phb_base;
>   
>       uint32_t chip_id;
>       uint32_t phb_id;

