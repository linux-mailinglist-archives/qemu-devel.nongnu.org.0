Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287BD46B7F3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:49:51 +0100 (CET)
Received: from localhost ([::1]:45444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muX6c-0000oI-8a
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:49:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muX4p-0008Bw-CE; Tue, 07 Dec 2021 04:47:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muX4f-00065g-Sd; Tue, 07 Dec 2021 04:47:58 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B78rODc013864; 
 Tue, 7 Dec 2021 09:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YoGQYLK7DbloLGGVLspDmJr+/QvryYM2jbAccdZOPaA=;
 b=MTnwmsoiYzEIUS3XE7qa0J2VKBqLfjzFe2JBsGAMZf7ZyrJBQPrnTCJFNQIKAC5vqx4Y
 9dDiq5Xz9S880Jyhd2ukw8DebKGQMpDc55gldIdOKIod2hMToLZUFh0ox4dQwZxnFvEJ
 7o27owhDahEHB+twUayE9ZFPF8zaBNLXWhmJHThdsp/HY/GwToemsOMyB62dqOq3tRIp
 i1drWX4uWCekRGdCEYBXTCYQyFJS5I6nLOdrvRGTAXi98IUiAk6EJnR2YkAujM0y3fhM
 kx0eh+7Bqmx9lkEJETgdQ6q2me5uBoHmdk02Jb8UycY+Sn7G2cNhCtcAw9qVMPDVs0j+ 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4ge8xkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:47:45 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79IvmH021494;
 Tue, 7 Dec 2021 09:47:44 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4ge8xkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:47:44 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B79bkuF029826;
 Tue, 7 Dec 2021 09:47:42 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3cqyy9ksgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:47:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B79lcn631654266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 09:47:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFF4411C050;
 Tue,  7 Dec 2021 09:47:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 852FB11C054;
 Tue,  7 Dec 2021 09:47:38 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 09:47:38 +0000 (GMT)
Message-ID: <72b4d947-2f6d-da3d-46f7-75e729643036@linux.ibm.com>
Date: Tue, 7 Dec 2021 10:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 04/14] ppc/pnv: Introduce support for user created PHB3
 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-5-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sfRRqfcLHAhxEZXJwyykgM1Kg7K6euLq
X-Proofpoint-GUID: 89D9643JlzvA4aPht_SFAXAhjqFw87I7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070056
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
> PHB3 devices and PCI devices can now be added to the powernv8 machine
> using :
> 
>    -device pnv-phb3,chip-id=0,index=1 \
>    -device nec-usb-xhci,bus=pci.1,addr=0x0
> 
> The 'index' property identifies the PHB3 in the chip. In case of user
> created devices, a lookup on 'chip-id' is required to assign the
> owning chip.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index de277c457838..d7fe92cb082d 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1097,14 +1097,14 @@ static void pnv_chip_power8_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
>   
> -    for (i = 0; i < pcc->num_phbs; i++) {
> +    if (defaults_enabled()) {
> +        chip->num_phbs = pcc->num_phbs;
> +    }
> +
> +    for (i = 0; i < chip->num_phbs; i++) {
>           object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
>       }
>   
> -    /*
> -     * Number of PHBs is the chip default
> -     */
> -    chip->num_phbs = pcc->num_phbs;
>   }


So if "-nodefaults" is mentioned on the command line, then 
chip->num_phbs is not set. It seems the intention is to have only the 
PHBs defined on the CLI, which is fine. However, I don't see where 
chip->num_phbs is incremented in that case.

   Fred



>   
>   static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
> @@ -1784,6 +1784,19 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
>       return NULL;
>   }
>   
> +PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
> +{
> +    int i;
> +
> +    for (i = 0; i < pnv->num_chips; i++) {
> +        PnvChip *chip = pnv->chips[i];
> +        if (chip->chip_id == chip_id) {
> +            return chip;
> +        }
> +    }
> +    return NULL;
> +}
> +
>   static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
> 

