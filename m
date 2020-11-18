Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608212B7F44
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:22:49 +0100 (CET)
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOMC-00035Q-E1
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kfOKJ-0001zt-2F; Wed, 18 Nov 2020 09:20:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kfOKG-0001IB-PK; Wed, 18 Nov 2020 09:20:50 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AIE48AZ067261; Wed, 18 Nov 2020 09:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NvwkW+BGpQoBgt5GXYyFEZHy1ZOTD+wzzbhon2PaErY=;
 b=VwHsg6BwPQmaDmEYQBzOm1cEiO8qLwV8XUNASTadq3zjLCd+QJeBRY9GNtCeyCDGX6RY
 hketjB4IUiURhOHVIW8KgXPq4Rq2RPHCV04Ds0kCF5vFRlYK3YkPv2a+sHMOAYCyIGDI
 ovu3OOFWJU3+H3Vw0qxSCzqQWDsdbCiat9DVVHKx93Q5s1VoT0lPFqe+wnJhuNQdOHcw
 9rrWPbaBu9haKAJqGFKYhh+2kn9N369avS231ipf7tXB28VV/BmS3RkW3ZmJQz5mUzcT
 +DKugetW/PwbWzteK2tcBBODDl5UKODT9SaOYdrdnsWF4grJmgG6JKMlBHrFjhOx800e Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34w4rgs6je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 09:20:45 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AIE4ZF9069136;
 Wed, 18 Nov 2020 09:20:44 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34w4rgs6hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 09:20:44 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AIEGOND003725;
 Wed, 18 Nov 2020 14:20:43 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 34t6v9ejqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 14:20:43 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AIEKgWx51380654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 14:20:42 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 804BE112062;
 Wed, 18 Nov 2020 14:20:42 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1674D112061;
 Wed, 18 Nov 2020 14:20:40 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.48.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Nov 2020 14:20:39 +0000 (GMT)
Subject: Re: [PATCH for-5.2 v3] s390x/pci: fix endianness issues
To: Cornelia Huck <cohuck@redhat.com>
References: <20201118104202.1301363-1-cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <39445c44-6f2c-e337-08fd-cde55f8be586@linux.ibm.com>
Date: Wed, 18 Nov 2020 09:20:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201118104202.1301363-1-cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_04:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011180099
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 09:20:46
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 5:42 AM, Cornelia Huck wrote:
> The zPCI group and function structures are big endian. However, we do
> not consistently store them as big endian locally, and are missing some
> conversions.
> 
> Let's just store the structures as host endian instead and convert to
> big endian when actually handling the instructions retrieving the data.
> 
> Also fix the layout of ClpReqQueryPciGrp: g is actually only 8 bit. This
> also fixes accesses on little endian hosts, and makes accesses on big
> endian hosts consistent.
> 
> Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
> Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v2->v3: added missing zpci_fn.flags copy, removed forgotten memcopy
> v1->v2: switched to keeping the internal structures as host-endian
> 
> Again, tested on x86 and s390x (tcg/kvm) with virtio-pci devices;
> testing vfio-pci devices would be good.

Thanks Connie, code looks good to me:

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

And I once again took this for a spin with vfio-pci, driving network and 
disk workloads using a fairly recent (5.10-rc3) kernel in host/guest.  I 
also rolled back the host to an older kernel to drive the default clp 
paths with vfio -- Everything works fine.  I also verified that a tcg 
guest on x86 using a virtio pci device can see it as expected (Lesson 
learned: I will make a point of testing against tcg moving forward).  I 
further double-checked the live pfgid / g values going to/from the guest 
in all 3 environments since this structure was changed; everything looks 
good.

So if you'd like:

Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>



> 
> ---
>   hw/s390x/s390-pci-bus.c         | 10 +++++-----
>   hw/s390x/s390-pci-inst.c        | 16 ++++++++++++++--
>   hw/s390x/s390-pci-vfio.c        | 12 ++++++------
>   include/hw/s390x/s390-pci-clp.h |  8 ++++----
>   4 files changed, 29 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index e0dc20ce4a56..05f7460aec9b 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -777,11 +777,11 @@ static void s390_pci_init_default_group(void)
>       group = s390_group_create(ZPCI_DEFAULT_FN_GRP);
>       resgrp = &group->zpci_group;
>       resgrp->fr = 1;
> -    stq_p(&resgrp->dasm, 0);
> -    stq_p(&resgrp->msia, ZPCI_MSI_ADDR);
> -    stw_p(&resgrp->mui, DEFAULT_MUI);
> -    stw_p(&resgrp->i, 128);
> -    stw_p(&resgrp->maxstbl, 128);
> +    resgrp->dasm = 0;
> +    resgrp->msia = ZPCI_MSI_ADDR;
> +    resgrp->mui = DEFAULT_MUI;
> +    resgrp->i = 128;
> +    resgrp->maxstbl = 128;
>       resgrp->version = 0;
>   }
>   
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 58cd041d17fb..70bfd91bf70e 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -281,7 +281,13 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>               goto out;
>           }
>   
> -        memcpy(resquery, &pbdev->zpci_fn, sizeof(*resquery));
> +        stq_p(&resquery->sdma, pbdev->zpci_fn.sdma);
> +        stq_p(&resquery->edma, pbdev->zpci_fn.edma);
> +        stw_p(&resquery->pchid, pbdev->zpci_fn.pchid);
> +        resquery->flags = pbdev->zpci_fn.flags;
> +        resquery->pfgid = pbdev->zpci_fn.pfgid;
> +        stl_p(&resquery->fid, pbdev->zpci_fn.fid);
> +        stl_p(&resquery->uid, pbdev->zpci_fn.uid);
>   
>           for (i = 0; i < PCI_BAR_COUNT; i++) {
>               uint32_t data = pci_get_long(pbdev->pdev->config +
> @@ -312,7 +318,13 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>               stw_p(&resgrp->hdr.rsp, CLP_RC_QUERYPCIFG_PFGID);
>               goto out;
>           }
> -        memcpy(resgrp, &group->zpci_group, sizeof(ClpRspQueryPciGrp));
> +        resgrp->fr = group->zpci_group.fr;
> +        stq_p(&resgrp->dasm, group->zpci_group.dasm);
> +        stq_p(&resgrp->msia, group->zpci_group.msia);
> +        stw_p(&resgrp->mui, group->zpci_group.mui);
> +        stw_p(&resgrp->i, group->zpci_group.i);
> +        stw_p(&resgrp->maxstbl, group->zpci_group.maxstbl);
> +        resgrp->version = group->zpci_group.version;
>           stw_p(&resgrp->hdr.rsp, CLP_RC_OK);
>           break;
>       }
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index d5c78063b5bc..9296e1bb6efa 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -156,12 +156,12 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
>           if (cap->flags & VFIO_DEVICE_INFO_ZPCI_FLAG_REFRESH) {
>               resgrp->fr = 1;
>           }
> -        stq_p(&resgrp->dasm, cap->dasm);
> -        stq_p(&resgrp->msia, cap->msi_addr);
> -        stw_p(&resgrp->mui, cap->mui);
> -        stw_p(&resgrp->i, cap->noi);
> -        stw_p(&resgrp->maxstbl, cap->maxstbl);
> -        stb_p(&resgrp->version, cap->version);
> +        resgrp->dasm = cap->dasm;
> +        resgrp->msia = cap->msi_addr;
> +        resgrp->mui = cap->mui;
> +        resgrp->i = cap->noi;
> +        resgrp->maxstbl = cap->maxstbl;
> +        resgrp->version = cap->version;
>       }
>   }
>   
> diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-pci-clp.h
> index ea2b1378cd5a..96b8e3f1331b 100644
> --- a/include/hw/s390x/s390-pci-clp.h
> +++ b/include/hw/s390x/s390-pci-clp.h
> @@ -144,10 +144,10 @@ typedef struct ClpReqQueryPciGrp {
>       ClpReqHdr hdr;
>       uint32_t fmt;
>       uint64_t reserved1;
> -#define CLP_REQ_QPCIG_MASK_PFGID 0xff
> -    uint32_t g;
> -    uint32_t reserved2;
> -    uint64_t reserved3;
> +    uint8_t reserved2[3];
> +    uint8_t g;
> +    uint32_t reserved3;
> +    uint64_t reserved4;
>   } QEMU_PACKED ClpReqQueryPciGrp;
>   
>   /* Query PCI function group response */
> 


