Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401AB40F9CD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:57:24 +0200 (CEST)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREMl-0006We-4y
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mRELa-0005au-FN; Fri, 17 Sep 2021 09:56:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mRELY-0000im-0D; Fri, 17 Sep 2021 09:56:10 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18HDEYYV008804; 
 Fri, 17 Sep 2021 09:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L/EMxKcX87MAVMCcsw5T7ZkhhsiSFRmeVUkyvw83yFM=;
 b=PPGLmvlzq+fAdEXsS3S93t8ct0+E9jxp9E6gnCMgRBvj5OwZjenn4O/4e2laNvY+RG/r
 jQ/XvsWFcYZittXBF8M0ovz/sYsFIZc6gCws9tROLMvlXWIV0oLsQeMYGTLi0uZ9+rhY
 EKqjeQNe2kei7XBsh4b/VwV6PgXIQwdtHG9EpHD1zIMWvdHBjsI/lmYaxIuRxgt7Hvnf
 dkwMNzoVr6YZoh30Vji1tAEBGOHOsu/ImWX4pvC8JP7u7adknuhmuJkDj3TatXXmGWBR
 h+cQS5sK0toOoOZJWaP5H/scil/FmzwExgz9HYVP3+GZbrsIkcTFJBs32tWESo7q+8IY 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4qjky633-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 09:56:02 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18HDkBSO005733;
 Fri, 17 Sep 2021 09:56:02 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4qjky62q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 09:56:02 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18HDqw4j030236;
 Fri, 17 Sep 2021 13:56:01 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3b0m3du503-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 13:56:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18HDu0xY49086734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 13:56:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CAA4112065;
 Fri, 17 Sep 2021 13:56:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A360112064;
 Fri, 17 Sep 2021 13:55:58 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com (unknown
 [9.211.123.240]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 17 Sep 2021 13:55:57 +0000 (GMT)
Subject: Re: [PATCH 1/1] s390x:clp: implementing CLP immediate commands
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1631880413-20655-1-git-send-email-pmorel@linux.ibm.com>
 <1631880413-20655-2-git-send-email-pmorel@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <73bc4780-b7a6-f522-30cd-7145417f2862@linux.ibm.com>
Date: Fri, 17 Sep 2021 09:55:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631880413-20655-2-git-send-email-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mdLl_KIJphn881s16BzQTgmKEGyKbkDM
X-Proofpoint-ORIG-GUID: jihy5sOkgH4MM1Cikmei3_PtvwLJaVwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_06,2021-09-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109170087
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.488,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, david@redhat.com, farman@linux.ibm.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 8:06 AM, Pierre Morel wrote:
> CLP immediate commands allow to query the Logical Processor
> available on the machine and to check for a specific one.
> 
> Let's add these commands.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-inst.c         | 33 ++++++++++++++++++++++++++++++++
>   include/hw/s390x/s390-pci-inst.h |  5 +++++
>   target/s390x/kvm/kvm.c           |  6 ++++++
>   3 files changed, 44 insertions(+)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 1c8ad91175..9fd0669591 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -156,6 +156,39 @@ out:
>       return rc;
>   }
>   
> +int clp_immediate_cmd(S390CPU *cpu, uint8_t r1, uint8_t r2, uint8_t i3,
> +                      uintptr_t ra)
> +{
> +    CPUS390XState *env = &cpu->env;
> +
> +    switch (r2) {
> +    case 0: /* Command Check */
> +        switch (i3 & 0x07) {
> +        case CLP_LPS_PCI: /* PCI */
> +            if (!s390_has_feat(S390_FEAT_ZPCI)) {
> +                setcc(cpu, 3);
> +                return 0;
> +            }
> +            /* fallthrough */
> +        case CLP_LPS_BASE: /* Base LP */

So at first look the code itself seems sane and I have no problem with 
implementing immediate clp, but tbh I find it a little weird to be 
handling base LP stuff directly in the PCI code.

With this patch, you're introducing immediate commands implicitly 
targeted at the base LP and circumstantially handling in them in PCI 
code, even when !S390_FEAT_ZPCI.  That seems wrong, we should ideally 
only be getting to PCI code for CLP related to PCI, no?

Granted, it's true that the existing kvm_clp_service_call always calls 
clp_service_call in PCI code today (if FEAT_ZPCI), but this function 
only handles PCI-related clp commands and bails out on any other command 
(really, it should probably be renamed zpci_clp_service_call and 
kvm_clp_service_call should only be calling it for normal clp with LPS==2)

I guess the trouble is there's no obvious other home to handle anything 
targeted at the base LP because we don't bother today?

> +            setcc(cpu, 0);
> +            return 0;
> +        }
> +        setcc(cpu, 3);
> +        return 0;
> +    case 1: /* Command Query */
> +        env->regs[r1] = CLP_QUERY_LP_BASE;
> +        if (s390_has_feat(S390_FEAT_ZPCI)) {
> +            env->regs[r1] |= CLP_QUERY_LP_BASE >> CLP_LPS_PCI;
> +        }
> +        setcc(cpu, 0);
> +        return 0;
> +    }
> +
> +    s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +    return 0;
> +}
> +
>   int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>   {
>       ClpReqHdr *reqh;
> diff --git a/include/hw/s390x/s390-pci-inst.h b/include/hw/s390x/s390-pci-inst.h
> index a55c448aad..07721b08da 100644
> --- a/include/hw/s390x/s390-pci-inst.h
> +++ b/include/hw/s390x/s390-pci-inst.h
> @@ -101,6 +101,11 @@ typedef struct ZpciFib {
>   int pci_dereg_irqs(S390PCIBusDevice *pbdev);
>   void pci_dereg_ioat(S390PCIIOMMU *iommu);
>   int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra);
> +#define CLP_LPS_BASE 0
> +#define CLP_LPS_PCI  2
> +#define CLP_QUERY_LP_BASE (1UL << 63)
> +int clp_immediate_cmd(S390CPU *cpu, uint8_t r1, uint8_t r2, uint8_t i3,
> +                      uintptr_t ra);
>   int pcilg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
>   int pcistg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
>   int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 0a5f2aced2..af1316372d 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -1345,7 +1345,13 @@ static uint64_t get_base_disp_rsy(S390CPU *cpu, struct kvm_run *run,
>   
>   static int kvm_clp_service_call(S390CPU *cpu, struct kvm_run *run)
>   {
> +    uint8_t r1 = (run->s390_sieic.ipb & 0x00f00000) >> 20;
>       uint8_t r2 = (run->s390_sieic.ipb & 0x000f0000) >> 16;
> +    uint8_t i3 = (run->s390_sieic.ipb & 0xff000000) >> 24;
> +
> +    if (i3 & 0x80) {
> +        return clp_immediate_cmd(cpu, r1, r2, i3, RA_IGNORED);
> +    }
>   
>       if (s390_has_feat(S390_FEAT_ZPCI)) {
>           return clp_service_call(cpu, r2, RA_IGNORED);
> 


