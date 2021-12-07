Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B446B869
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:06:17 +0100 (CET)
Received: from localhost ([::1]:41680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXMW-0000ts-HV
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:06:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXKg-0007ch-AJ; Tue, 07 Dec 2021 05:04:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXKd-0002Sg-Gd; Tue, 07 Dec 2021 05:04:21 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B78I8is028665; 
 Tue, 7 Dec 2021 10:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hOVoBbILVEoaPo2Mvjd9Al2+ymQDWMR+KwQ3249NECg=;
 b=ss77vAgkccx9/s1xdSHEdSl/TtcJVqe7hqatJaYw2xMRodCAFT5MbgzTx1m9k3x/AFsM
 N+lff/mvkQdAUrVWjErZry0qC9H3Zssnj2dmHWAADEROltXbJfTg6Yn6cFRikXk5muEo
 jb/BRZWonr2gZNf/gbCvTEAH+qUZMztFv2uSwSPZ/tXFiBaAFr2vNzEpbxic5VDAPLNK
 CwvvF9h141K6AthFyaD4Gt7deW0kz0SR9KeJj9jOfqJzNI596/stfVPiy8169Tm4drJr
 lm1qgZenBh8sxSF1qFk3/3Hu3bL+IbZ103iMsQpmzq+UQmGr/61wsNxVhPjIh4/tHjDX NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct3ythy7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:04:09 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79u8RT028164;
 Tue, 7 Dec 2021 10:04:08 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct3ythy6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:04:08 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7A39df031295;
 Tue, 7 Dec 2021 10:04:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3cqyyamwdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:04:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B79uMYE26083784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 09:56:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E189611C058;
 Tue,  7 Dec 2021 10:04:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B033311C066;
 Tue,  7 Dec 2021 10:04:02 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 10:04:02 +0000 (GMT)
Message-ID: <dd7b9299-6d70-5f4c-993f-cc0a0fa24f62@linux.ibm.com>
Date: Tue, 7 Dec 2021 11:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 10/14] ppc/pnv: Introduce a num_stack class attribute
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-11-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-11-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: juKwuT-A2jZKQlPbzhI8Wonjj4ufXK0n
X-Proofpoint-ORIG-GUID: Of8vO4IOTaf-spoi6aSKyn9CC93uD0JI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
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
> Each PEC devices of the POWER9 chip has a predefined number of stacks,
> equivalent of a root port complex:
> 
>    PEC0 -> 1 stack
>    PEC1 -> 2 stacks
>    PEC2 -> 3 stacks
> 
> Introduce a class attribute to hold these values and remove the
> "num-stacks" property.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   include/hw/pci-host/pnv_phb4.h |  1 +
>   hw/pci-host/pnv_phb4_pec.c     | 17 ++++++++++++++++-
>   hw/ppc/pnv.c                   |  7 -------
>   3 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 8a585c9a42f7..60de3031a622 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -223,6 +223,7 @@ struct PnvPhb4PecClass {
>       int stk_compat_size;
>       uint64_t version;
>       uint64_t device_id;
> +    const uint32_t *num_stacks;
>   };
>   
>   #endif /* PCI_HOST_PNV_PHB4_H */
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index e9750c41c595..293909b5cb90 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -377,11 +377,19 @@ static void pnv_pec_instance_init(Object *obj)
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>       char name[64];
>       int i;
>   
>       assert(pec->system_memory);
>   
> +    if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
> +        error_setg(errp, "invalid PEC index: %d", pec->index);
> +        return;
> +    }
> +
> +    pec->num_stacks = pecc->num_stacks[pec->index];
> +
>       /* Create stacks */
>       for (i = 0; i < pec->num_stacks; i++) {
>           PnvPhb4PecStack *stack = &pec->stacks[i];
> @@ -460,7 +468,6 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>   
>   static Property pnv_pec_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
> -        DEFINE_PROP_UINT32("num-stacks", PnvPhb4PecState, num_stacks, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
>           DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
>                            PnvChip *),
> @@ -479,6 +486,13 @@ static uint32_t pnv_pec_xscom_nest_base(PnvPhb4PecState *pec)
>       return PNV9_XSCOM_PEC_NEST_BASE + 0x400 * pec->index;
>   }
>   
> +/*
> + * PEC0 -> 1 stack
> + * PEC1 -> 2 stacks
> + * PEC2 -> 3 stacks
> + */
> +static const uint32_t pnv_pec_num_stacks[] = { 1, 2, 3 };
> +
>   static void pnv_pec_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -503,6 +517,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->stk_compat_size = sizeof(stk_compat);
>       pecc->version = PNV_PHB4_VERSION;
>       pecc->device_id = PNV_PHB4_DEVICE_ID;
> +    pecc->num_stacks = pnv_pec_num_stacks;
>   }
>   
>   static const TypeInfo pnv_pec_type_info = {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 76b2f5468b38..957f0bdfaa6b 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1380,13 +1380,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>           uint32_t pec_pci_base;
>   
>           object_property_set_int(OBJECT(pec), "index", i, &error_fatal);
> -        /*
> -         * PEC0 -> 1 stack
> -         * PEC1 -> 2 stacks
> -         * PEC2 -> 3 stacks
> -         */
> -        object_property_set_int(OBJECT(pec), "num-stacks", i + 1,
> -                                &error_fatal);
>           object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
>                                   &error_fatal);
>           object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
> 

