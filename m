Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65C591415
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 18:40:52 +0200 (CEST)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMXiN-00084V-Nd
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 12:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMXKi-0008Ih-2n; Fri, 12 Aug 2022 12:16:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMXKg-0006KI-Ir; Fri, 12 Aug 2022 12:16:23 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CG7iA0004444;
 Fri, 12 Aug 2022 16:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+TczRs0p9bZd4PDW2zrZLdrviZ8Zjv9PcHaWmNvuC+k=;
 b=bIq4mlp9xfKJXnqf5rC8uukHIaWUriOQkwLpXpIODDeGr+OyN1KPsKcYkYATQRa0JnT/
 kin6GKPFXfslugv8ydoL6VVWs26PJAVnu92tXOJdnBKEe46ecI+Mzet81SAlomeEymlc
 dwaJSj5yGkCpW/Jg7uICT5HRDn3lX1mI326sZQjj7PQUShZbhxuMuxWIAyKMdd3LhHxS
 lOnjmHKPgRTH8hS59Dy1X5+0xe3mw1h1UWTDE7NqROXYBbmeFH/JKixUExnH+9sLfWtO
 L+JDqOeCRSdEK/qYcsbeSbxoUDzVFS770MO5gJ1sWQOcpImpgFGvoWtk3wBARBWRbwqm yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwsuerj12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 16:16:14 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CG7upA005717;
 Fri, 12 Aug 2022 16:16:13 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwsuerj0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 16:16:13 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CG6QSB011118;
 Fri, 12 Aug 2022 16:16:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3hw3wfs81b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 16:16:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CGG9JL27656470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 16:16:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 747824C050;
 Fri, 12 Aug 2022 16:16:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E0434C046;
 Fri, 12 Aug 2022 16:16:09 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 16:16:09 +0000 (GMT)
Message-ID: <bd56dde3-7992-fe14-0ba0-13abf6fb2ac4@linux.ibm.com>
Date: Fri, 12 Aug 2022 18:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 08/11] ppc/pnv: enable user created pnv-phb for
 powernv9
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-9-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-9-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MLAq6l--mMoSPpIo54CeX7myn71GlZY_
X-Proofpoint-ORIG-GUID: psYom1_LKiSJXKXjvBzCNIKULBdUbAB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=658
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
> Enable pnv-phb user created devices for powernv9 now that we have
> everything in place.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Same comment as in patch 6 regarding the QOM relationship of the 
user-created root port.
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb.c      | 2 +-
>   hw/pci-host/pnv_phb4_pec.c | 6 ++++--
>   hw/ppc/pnv.c               | 2 ++
>   3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 1f53ff77c5..17d9960aa1 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -167,7 +167,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>       }
>   
> -    if (phb->version == 3 && !defaults_enabled()) {
> +    if (!defaults_enabled()) {
>           return;
>       }
>   
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 8dc363d69c..9871f462cd 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -146,8 +146,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       pec->num_phbs = pecc->num_phbs[pec->index];
>   
>       /* Create PHBs if running with defaults */
> -    for (i = 0; i < pec->num_phbs; i++) {
> -        pnv_pec_default_phb_realize(pec, i, errp);
> +    if (defaults_enabled()) {
> +        for (i = 0; i < pec->num_phbs; i++) {
> +            pnv_pec_default_phb_realize(pec, i, errp);
> +        }
>       }
>   
>       /* Initialize the XSCOM regions for the PEC registers */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 0644f45a1d..ec0558ed1c 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -2188,6 +2188,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
>       pmc->dt_power_mgt = pnv_dt_power_mgt;
> +
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
>   }
>   
>   static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)

