Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551DB34E152
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 08:39:40 +0200 (CEST)
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR82N-00049j-04
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 02:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lR81P-0003dg-Ce; Tue, 30 Mar 2021 02:38:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lR81K-0007VV-6Z; Tue, 30 Mar 2021 02:38:37 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U6Xv6k164382; Tue, 30 Mar 2021 02:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4DnTYsILREm/Sbpp8IruIyNNTFYmzUEy6LVS1EX1QBE=;
 b=LowfMUjXdru8iiUpCft7gUdb9epOP6P96qDJJZCAlPXo7LXNaOMfIY+mwlboLb0BK1Nf
 2azhG5dYmmPf7lh8tczV0uHI+r9HPrBXnPcCuHmxUvY25a1Da08Z2B+R1199hcWkOMEy
 nGN6DVgehq2m+C7BIhk3ZMDVvtBwn0Cokj/DNFCYII5Mk/WnubqBsUOCNZ+TCsrMuMNW
 pZP6TLMgfCT/NgIovysp1Z9Xdn8s4WodimVJEnIFr4r54kvGairQc8XUux2fmcOXJotg
 nQAVa3qetP+a7j7bAD8YxoQUUq87L2kXam3C9FcUXYLtpIhEp9/AnwSCONMwuwahBM04 Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jj7vp173-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:38:18 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12U6YHsU166247;
 Tue, 30 Mar 2021 02:38:18 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jj7vp16b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:38:18 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12U6SeWk018146;
 Tue, 30 Mar 2021 06:38:16 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 37hvb819je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 06:38:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12U6br9t27722048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 06:37:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 134884204D;
 Tue, 30 Mar 2021 06:38:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27BC24203F;
 Tue, 30 Mar 2021 06:38:10 +0000 (GMT)
Received: from [9.85.83.77] (unknown [9.85.83.77])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Mar 2021 06:38:09 +0000 (GMT)
Subject: Re: [PATCH] ppc/spapr: Add support for implement support for
 H_SCM_HEALTH
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org,
 kvm-ppc@vger.kernel.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au, mst@redhat.com, imammedo@redhat.com,
 xiaoguangrong.eric@gmail.com
References: <20210329162259.536964-1-vaibhav@linux.ibm.com>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Message-ID: <ef44262e-907d-5200-022c-a26e16522ab0@linux.ibm.com>
Date: Tue, 30 Mar 2021 12:08:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20210329162259.536964-1-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E1fE2TWC7qJC6nqE31AlAdOeGZNhKriJ
X-Proofpoint-ORIG-GUID: eHKvyr-sBruLtfzkLYsdSeEpgLAPg-9E
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_02:2021-03-26,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2103250000 definitions=main-2103300045
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, bharata@linux.vnet.ibm.com,
 shivaprasadbhat@gmail.com, ehabkost@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vaibhav,

Some comments inline..

On 3/29/21 9:52 PM, Vaibhav Jain wrote:
> Add support for H_SCM_HEALTH hcall described at [1] for spapr
> nvdimms. This enables guest to detect the 'unarmed' status of a
> specific spapr nvdimm identified by its DRC and if its unarmed, mark
> the region backed by the nvdimm as read-only.
>
> The patch adds h_scm_health() to handle the H_SCM_HEALTH hcall which
> returns two 64-bit bitmaps (health bitmap, health bitmap mask) derived
> from 'struct nvdimm->unarmed' member.
>
> Linux kernel side changes to enable handling of 'unarmed' nvdimms for
> ppc64 are proposed at [2].
>
> References:
> [1] "Hypercall Op-codes (hcalls)"
>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/powerpc/papr_hcalls.rst
>
> [2] "powerpc/papr_scm: Mark nvdimm as unarmed if needed during probe"
>      https://lore.kernel.org/linux-nvdimm/20210329113103.476760-1-vaibhav@linux.ibm.com/
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>   hw/ppc/spapr_nvdimm.c  | 30 ++++++++++++++++++++++++++++++
>   include/hw/ppc/spapr.h |  4 ++--
>   2 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index b46c36917c..e38740036d 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -31,6 +31,13 @@
>   #include "qemu/range.h"
>   #include "hw/ppc/spapr_numa.h"
>   
> +/* DIMM health bitmap bitmap indicators */
> +/* SCM device is unable to persist memory contents */
> +#define PAPR_PMEM_UNARMED (1ULL << (63 - 0))
> +
> +/* Bits status indicators for health bitmap indicating unarmed dimm */
> +#define PAPR_PMEM_UNARMED_MASK (PAPR_PMEM_UNARMED)
> +
>   bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>                              uint64_t size, Error **errp)
>   {
> @@ -467,6 +474,28 @@ static target_ulong h_scm_unbind_all(PowerPCCPU *cpu, SpaprMachineState *spapr,
>       return H_SUCCESS;
>   }
>   
> +static target_ulong h_scm_health(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                                 target_ulong opcode, target_ulong *args)
> +{
> +    uint32_t drc_index = args[0];
> +    SpaprDrc *drc = spapr_drc_by_index(drc_index);
> +    NVDIMMDevice *nvdimm;
> +
> +    if (drc && spapr_drc_type(drc) != SPAPR_DR_CONNECTOR_TYPE_PMEM) {
> +        return H_PARAMETER;
> +    }
> +


Please check if drc->dev is not NULL too. DRCs are created in advance

and drc->dev may not be assigned if the device is not plugged yet.


> +    nvdimm = NVDIMM(drc->dev);
> +
> +    /* Check if the nvdimm is unarmed and send its status via health bitmaps */
> +    args[0] = nvdimm->unarmed ? PAPR_PMEM_UNARMED_MASK : 0;


Please use object_property_get_bool to fetch the unarmed value.


> +
> +    /* health bitmap mask same as the health bitmap */
> +    args[1] = args[0];
> +
> +    return H_SUCCESS;
> +}
> +
>   static void spapr_scm_register_types(void)
>   {

...


Thanks,

Shivaprasad


