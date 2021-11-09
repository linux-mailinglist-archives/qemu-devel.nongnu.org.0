Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AA44B0B2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 16:52:48 +0100 (CET)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkTQV-0007aC-Aa
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 10:52:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mkTP2-0006jy-UE; Tue, 09 Nov 2021 10:51:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mkTP1-0003bK-BP; Tue, 09 Nov 2021 10:51:16 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9FklLF023614; 
 Tue, 9 Nov 2021 15:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yLbaOjhJTc5KSFGXJ+NkMZ5Eyb43D1JlQka/2vF3EFU=;
 b=s2hMXQtqZp0wVmc+CdFWm+QUJhc18+KQy58kaX7zrLXzszwt6OYlPdu39xX5nYPSCUU4
 2gF/DEHiC0sNkVW1l0Tc/fSRz+z5z+GP9YUKu2pLhKy/ngmejM+35HfYV5IjE0Fb4klm
 Cka2v1+9W0GnEW6SLbZObHJBgkvkQ1kKREJpaNVofEBQgjf6NXGU2HMCopY4iw+1vwMM
 rsyDAiSCaOeG6Y7J9i3+Fl4n4JPjycr1irTnZWm1+n0b1tPZ4JtylbkuUcp3DxLmh0YD
 RHsqASgIhSx7AA9jHf7hL5Ku5C7LVRvuVitcV0YyKNA1E0x5FBMwtq8hkTRn9Ld/kxb4 eA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7ux983pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 15:51:10 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9Fm7xI011499;
 Tue, 9 Nov 2021 15:51:08 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3c5hb9g6uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 15:51:08 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9Fp52j47251874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 15:51:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B935F52050;
 Tue,  9 Nov 2021 15:51:05 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 757AC52054;
 Tue,  9 Nov 2021 15:51:05 +0000 (GMT)
Message-ID: <67182075-8e5b-08ad-d17f-405b720a6fb5@linux.ibm.com>
Date: Tue, 9 Nov 2021 16:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] pci-host: Allow extended config space access for PowerNV
 PHB4 model
Content-Language: en-US
To: Christophe Lombard <clombard@linux.vnet.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20211109145053.43524-1-clombard@linux.vnet.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211109145053.43524-1-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZEMs74N-1_QnqlMHB1oIubqYihUI3MtU
X-Proofpoint-GUID: ZEMs74N-1_QnqlMHB1oIubqYihUI3MtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 09/11/2021 15:50, Christophe Lombard wrote:
> The PCIe extended configuration space on the device is not currently
> accessible to the host. if by default,  it is still inaccessible for
> conventional for PCIe buses, add the current flag
> PCI_BUS_EXTENDED_CONFIG_SPACE on the root bus permits PCI-E extended
> config space access.
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---


FWIW, looks good to me
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   hw/pci-host/pnv_phb4.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 5c375a9f28..40b793201a 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1205,6 +1205,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>                                        &phb->pci_mmio, &phb->pci_io,
>                                        0, 4, TYPE_PNV_PHB4_ROOT_BUS);
>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
> +    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   
>       /* Add a single Root port */
>       qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
> 

