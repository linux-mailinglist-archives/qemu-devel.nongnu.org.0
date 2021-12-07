Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18B746B89E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:15:51 +0100 (CET)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXVl-0005ME-OU
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:15:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXSo-0002mi-Mo; Tue, 07 Dec 2021 05:12:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXSl-0004Km-AC; Tue, 07 Dec 2021 05:12:45 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B79qZHP010494; 
 Tue, 7 Dec 2021 10:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=83ood/QvcP2ZsmqeazUWHDPv9Xim+0Zn8lAT97a8qTA=;
 b=cpSd2TiIsRrpuCUwLd/pB9Euet5boWMiClga3FlGrZnEBhsBCNSqNUb4ZRLM9mEB0mQZ
 K6mJ2W3lgQnE5E3Re5WlU0/hp6zT7Xp7DDtaWtgQFxn0Jf1+IPz4L0rew0Kj1rdGBUBh
 6szZglqV495yyx7Np/ZPqr5jK+DN1IawHHByjet0Di2uj8GhM0ySS3vYbOWLXTkEfJEu
 /WKUEqaOD1q630NMAx/vsW4etSeR6DsSxFHVTbIRT0GZaP+D1S0sCM4/RE+uhuAPoUSr
 a64sn5lrIwGgfZh89713u+H/ZYtla1L5w/HQY3y66gb1bkN9JlgcSPTdO1viCxcm3+wh qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct5c88c5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:12:39 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79r422011838;
 Tue, 7 Dec 2021 10:12:38 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct5c88c56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:12:38 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7A3xbk023163;
 Tue, 7 Dec 2021 10:12:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3cqyy9c074-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:12:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B7ACXvS21364998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 10:12:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8A6411C052;
 Tue,  7 Dec 2021 10:12:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 467AC11C050;
 Tue,  7 Dec 2021 10:12:33 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 10:12:33 +0000 (GMT)
Message-ID: <0aeb2553-7044-08d3-c3ff-f416b3561cb7@linux.ibm.com>
Date: Tue, 7 Dec 2021 11:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 14/14] ppc/pnv: Introduce support for user created PHB4
 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-15-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-15-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DWLbxqsA3HlvGwrqLaTtOodPfHj_AiMf
X-Proofpoint-GUID: RJ0Ajkba0sp94QRmsBHtI4Sb_dsdhaYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070060
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/12/2021 15:42, Cédric Le Goater wrote:
> PHB4 devices and PCI devices can now be added to the powernv9 machine
> using:
> 
>    -device pnv-phb4-pec,chip-id=0,index=0
>    -device nec-usb-xhci,bus=pci.0,addr=0x0
> 
> In case of user created devices, a lookup on 'chip-id' is required to
> assign the owning chip.
> 
> To be noted, that the PEC PHB4 devices can add more than one PHB4
> devices:
> 
>    * PEC0 provides 1 PHB  (PHB0)
>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   hw/pci-host/pnv_phb4_pec.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 9b081d543057..4ee92f11945c 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -394,6 +394,17 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       char name[64];
>       int i;
>   
> +    /* User created devices */
> +    if (!pec->chip) {
> +        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +
> +        pec->chip = pnv_get_chip(pnv, pec->chip_id);
> +        if (!pec->chip) {
> +            error_setg(errp, "invalid chip id: %d", pec->chip_id);
> +            return;
> +        }
> +    }
> +
>       if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
>           error_setg(errp, "invalid PEC index: %d", pec->index);
>           return;
> @@ -401,6 +412,12 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>   
>       pec->num_stacks = pecc->num_stacks[pec->index];
>   
> +    /*
> +     * Reparent user created devices to the chip to build correctly
> +     * the device tree.
> +     */
> +    pnv_chip_parent_fixup(pec->chip, OBJECT(pec), pec->index);
> +
>       /* Create stacks */
>       for (i = 0; i < pec->num_stacks; i++) {
>           PnvPhb4PecStack *stack = &pec->stacks[i];
> @@ -516,7 +533,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>   
>       dc->realize = pnv_pec_realize;
>       device_class_set_props(dc, pnv_pec_properties);
> -    dc->user_creatable = false;
> +    dc->user_creatable = true;
>   
>       pecc->xscom_nest_base = pnv_pec_xscom_nest_base;
>       pecc->xscom_pci_base  = pnv_pec_xscom_pci_base;
> 

