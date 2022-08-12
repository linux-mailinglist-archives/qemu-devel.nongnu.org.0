Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BE6591295
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 17:02:12 +0200 (CEST)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMWAt-0005Rz-B7
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 11:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMVyf-0001dR-T4; Fri, 12 Aug 2022 10:49:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMVyd-0000v1-6m; Fri, 12 Aug 2022 10:49:32 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CDgNNe030987;
 Fri, 12 Aug 2022 14:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xVp0tYfLTJAeC4u+4oAzZn9SqMwt8zogRW7ohAtBwHY=;
 b=cOdqv93Ni7B4EW/Y0/CbftR72z2+mqWs3otMV9f8cM0NVVpEopzxLnkBbKWnq7leRBh/
 43ApaRr1J9jIz2iuzTlTEPvIKv1ayFKU7yTR4XMjH9uOwi15eAf2jhpJO4SgB/ltGyQg
 gSEl7YQVSDGmGEe+koNqSW4RxMSK35LNS7kKa3Mxv7rfb72dhpLfgYU7DYKWp8KKK2zK
 37JpUn9/KGRmc3MT8iiYNObPkdtO4rrS+H21TAwS34zEUOWwsglDN8pldoXVhTQz5Vwk
 I4fSY0MsdtNNqT6z00Ybfwahk8G8yynQB8sCmW09xkXcr6wmgC9k09ElYzZCE2cnL/VL Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwqynjeg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:49:20 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CENqIJ029176;
 Fri, 12 Aug 2022 14:49:19 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwqynjeeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:49:19 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CEaoYQ017266;
 Fri, 12 Aug 2022 14:49:17 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3huww0tqf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:49:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CEnETN33030524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 14:49:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 703A94C046;
 Fri, 12 Aug 2022 14:49:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 330694C044;
 Fri, 12 Aug 2022 14:49:14 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 14:49:14 +0000 (GMT)
Message-ID: <21b47b75-c6ca-e3ea-2d79-314b1451cdc0@linux.ibm.com>
Date: Fri, 12 Aug 2022 16:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 04/11] ppc/pnv: add helpers for pnv-phb user
 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-5-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-5-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w0beWr5KxVeCQYrWt_d8V_ILouvfXOdB
X-Proofpoint-ORIG-GUID: hM2CKhiESorGZYlMtYldU-7t-Bmbm9S6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_09,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120040
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



On 11/08/2022 18:39, Daniel Henrique Barboza wrote:
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
> Another helper called pnv_chip_add_phb() was added to handle the
> particularities of each chip version when adding a new PHB.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Just a minor typo in a comment below.
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index f9e5a3d248..2deaac17f7 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -281,6 +281,26 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
>       g_free(reg);
>   }
>   
> +/*
> + * Adds a PnvPHB to the chip. Returns the parent obj of the
> + * PHB which varies with each version (phb version 3 is parented
> + * by the chip, version 4 and 4 are parented by the PEC


typo-----------------------------^

   Fred


> + * device).
> + *
> + * TODO: for version 3 we're still parenting the PHB with the
> + * chip. We should parent with a (so far not implemented)
> + * PHB3 PEC device.
> + */
> +Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
> +{
> +    if (phb->version == 3) {
> +        return OBJECT(chip);
> +    } else {
> +        /* phb4 support will be added later */
> +        return NULL;
> +    }
> +}
> +
>   static void pnv_chip_power8_dt_populate(PnvChip *chip, void *fdt)
>   {
>       static const char compat[] = "ibm,power8-xscom\0ibm,xscom";
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 033d907287..781d0acffa 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -231,6 +231,7 @@ struct PnvMachineState {
>   };
>   
>   PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
> +Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp);
>   
>   #define PNV_FDT_ADDR          0x01000000
>   #define PNV_TIMEBASE_FREQ     512000000ULL

