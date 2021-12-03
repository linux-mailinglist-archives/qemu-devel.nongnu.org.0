Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A524677A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:50:37 +0100 (CET)
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt81L-0004gU-Si
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:50:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt7yJ-0003Mz-ON; Fri, 03 Dec 2021 07:47:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt7yE-0006R0-Ic; Fri, 03 Dec 2021 07:47:25 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3Ce87Z031119; 
 Fri, 3 Dec 2021 12:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LxU1YQ+HYyRaFaF6WD5+bwrhreFaOG2J6vUUIOqBAM0=;
 b=m3D3EgGwRhKW0IuFEv/32bNVw8IghedZ6yR17how+3NR1GDRdctI9DLRlNiD5ULqMN1b
 Z1KEab8S4X7dsfAVO+4eykNUjtY1T/MlailqozFcUAVsMuIWmm5TJljNrDbu0RQozLLZ
 fb01/51suyBiF2WSsuAHiCWWP4mFCSz6zvI5ff7l7zM4XnNma3HJESiVN1bA4lJhoovg
 1YK8MznCCbucld7KJb9akNdAuuznxcznBrbMuJZ/K9IoZ/dtLVK62Bdr+uxAB3JggAIm
 DbyLf917FNKDPpi/02X5W7ZjYrXKXe91md8yk1tpkNI10fDYk1kAtjI9r080TbD2RbBj 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqgff3qdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:47:19 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3ChuJX028732;
 Fri, 3 Dec 2021 12:47:19 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqgff3qcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:47:19 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3CgSsM010626;
 Fri, 3 Dec 2021 12:47:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ckbxkwvum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:47:16 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3ClD2w25821562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 12:47:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC6EC4C050;
 Fri,  3 Dec 2021 12:47:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C10F4C040;
 Fri,  3 Dec 2021 12:47:12 +0000 (GMT)
Received: from [9.171.47.125] (unknown [9.171.47.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 12:47:12 +0000 (GMT)
Message-ID: <b42aa8c4-92e0-9f63-cd65-6a016610847a@linux.ibm.com>
Date: Fri, 3 Dec 2021 13:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/4] s390x/pci: add supported DT information to clp
 response
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211203123221.420101-1-mjrosato@linux.ibm.com>
 <20211203123221.420101-5-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20211203123221.420101-5-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hq68G8gYR4slbGw8zV3qO1ibRe7KvbXf
X-Proofpoint-ORIG-GUID: _OzF7UOshiiEvfOmF7KEn02UaXIJQ7Au
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_06,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030078
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
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
Cc: farman@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/3/21 13:32, Matthew Rosato wrote:
> The DTSM is a mask that specifies which I/O Address Translation designation
> types are supported.  Today QEMU only supports DT=1.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c         | 1 +
>   hw/s390x/s390-pci-inst.c        | 1 +
>   hw/s390x/s390-pci-vfio.c        | 1 +
>   include/hw/s390x/s390-pci-bus.h | 1 +
>   include/hw/s390x/s390-pci-clp.h | 3 ++-
>   5 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 1b51a72838..01b58ebc70 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -782,6 +782,7 @@ static void s390_pci_init_default_group(void)
>       resgrp->i = 128;
>       resgrp->maxstbl = 128;
>       resgrp->version = 0;
> +    resgrp->dtsm = ZPCI_DTSM;
>   }
>   
>   static void set_pbdev_info(S390PCIBusDevice *pbdev)
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 07bab85ce5..f3feba5d74 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -329,6 +329,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>           stw_p(&resgrp->i, group->zpci_group.i);
>           stw_p(&resgrp->maxstbl, group->zpci_group.maxstbl);
>           resgrp->version = group->zpci_group.version;
> +        resgrp->version = group->zpci_group.dtsm;

;) cut and past error

...snip...

-- 
Pierre Morel
IBM Lab Boeblingen

