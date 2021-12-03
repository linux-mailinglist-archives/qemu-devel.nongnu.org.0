Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DAD467424
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:34:04 +0100 (CET)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4x9-0006nG-Gf
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4wD-000656-SA; Fri, 03 Dec 2021 04:33:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4wB-0004LZ-Jv; Fri, 03 Dec 2021 04:33:05 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B37rdgL011236; 
 Fri, 3 Dec 2021 09:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HR4mSbbkSDeCEnim5+MTDrMthk6CiKrG+L/FY2O/gRA=;
 b=NycxheFwCrPIIbFq56NOaVTHLvANF7WJl97IvjCbQ+Gz2XHIvPzw5GEGGCmkiynUlhv/
 Fp3Vg7KB4F6Svlm0dPD5pdxWCaZ4/s8XYLxEAwJRJcUf0spQynZGaCx1ddykStYCoJ4Q
 Xuy288VBeheKbH9rU57eFNsjeUCRoYCsyiXuXwhVkHcfij+rQztL/7SlEaYbCpLRl21/
 41dXfxjHziBag76Xy7LxMC4zPv1fJUPRyHzTRNMGfpcHGEA/IFFXJ8ZrVOlKFy3qxGP2
 RpNfaHXdKc6q/Kq2JdpMBiYz828EEa3GKofXhWEnDbfhvGOOX4/TcE1IRy9k6NquNy20 pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqf8f1rd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:33:02 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B39CaOb003676;
 Fri, 3 Dec 2021 09:33:01 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqf8f1rcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:33:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B39WsCO027406;
 Fri, 3 Dec 2021 09:32:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3ckcadc8rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:32:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B39POC227853284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 09:25:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12FA64C050;
 Fri,  3 Dec 2021 09:32:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80DD64C046;
 Fri,  3 Dec 2021 09:32:55 +0000 (GMT)
Received: from [9.171.47.125] (unknown [9.171.47.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 09:32:55 +0000 (GMT)
Message-ID: <b483e71b-1b53-248b-cad4-ad267c8bfdcd@linux.ibm.com>
Date: Fri, 3 Dec 2021 10:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] s390x/pci: add supported DT information to clp
 response
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-5-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20211202164110.326947-5-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8a6ybIH6Fr998gEHv4pLTspjDMCsEJ_C
X-Proofpoint-GUID: Un1oYkUQ5dDamxIdP2niOR67wDIlv2RI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_05,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030060
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
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
Cc: farman@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 17:41, Matthew Rosato wrote:
> The DTSM is a mask that specifies which I/O Address Translation designation
> types are supported.  A linux guest today does not look at this field but

Even Linux is the most used guest it is not the only one so may be not 
mention Linux here.

> could in the future; let's advertise what QEMU actually supports.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c         | 1 +
>   hw/s390x/s390-pci-vfio.c        | 1 +
>   include/hw/s390x/s390-pci-bus.h | 1 +
>   include/hw/s390x/s390-pci-clp.h | 3 ++-
>   4 files changed, 5 insertions(+), 1 deletion(-)
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

OK

>   }
>   
>   static void set_pbdev_info(S390PCIBusDevice *pbdev)
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index 2a153fa8c9..6f80a47e29 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -160,6 +160,7 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
>           resgrp->i = cap->noi;
>           resgrp->maxstbl = cap->maxstbl;
>           resgrp->version = cap->version;
> +        resgrp->dtsm = ZPCI_DTSM;

Is it safe for VFIO whith interpretation?
Shouldn't we extend the capability and use the host DTSM in this case?

...snip...

-- 
Pierre Morel
IBM Lab Boeblingen

