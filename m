Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D82E4673D2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:18:40 +0100 (CET)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4iF-0002Yw-58
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:18:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4gp-000161-SF; Fri, 03 Dec 2021 04:17:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4gn-0007Do-W0; Fri, 03 Dec 2021 04:17:11 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B39Gtoq031827; 
 Fri, 3 Dec 2021 09:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5edwId4trjj4dVq8v3w+WoA3r3RbfdT53maFfAPBbGg=;
 b=dNeJ2nLjz+gGL+zJK0oVnAFchczeIwxOAOEeE6ZBBoSwE3DQ72tsbmUZCXFTx3vZi8yl
 hqC1d6AwQmDi/D7fnHc3YuSRSE59fdFz62ev20JnNB0AmtAHnj39Wj8JSuRKJ4l9ujJA
 S0xxnlR/LMU3UBJB8ojEWpm1ygK/pN/LvuAQ0byoQxfj0wjyQwwOkulHbK247RtEbYEj
 kpzMNolgoYpiLuHZ7AJmiKT2ekmSl0yG8wFGr9kikN/hDaoWshfjhgYAU2cOfcswuf5H
 xMN7z4dDcU7ToDv3NxA/+rz4FDpxKaNU/V9444wU4X24wn5Rgi4He6qhnl/2VCsLlUE6 Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqgff006j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:17:07 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B39H6Hh032087;
 Fri, 3 Dec 2021 09:17:07 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqgff005y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:17:06 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B39CPJm023046;
 Fri, 3 Dec 2021 09:17:04 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3ckcaahfbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:17:04 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B39H13d25428378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 09:17:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 061204C044;
 Fri,  3 Dec 2021 09:17:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FAA04C05A;
 Fri,  3 Dec 2021 09:17:00 +0000 (GMT)
Received: from [9.171.47.125] (unknown [9.171.47.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 09:17:00 +0000 (GMT)
Message-ID: <d32d4aeb-b573-d63c-2f11-bc47b288a009@linux.ibm.com>
Date: Fri, 3 Dec 2021 10:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] s390x/pci: use the passthrough measurement update
 interval
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-4-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20211202164110.326947-4-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ezvltmUgkySMLHFDJewk7TnB0Xc37gsa
X-Proofpoint-ORIG-GUID: z-wlGOV_5dezLQYRrYusJA9XqN8RVs14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_05,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030057
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



On 12/2/21 17:41, Matthew Rosato wrote:
> We may have gotten a measurement update interval from the underlying host
> via vfio -- Use it to set the interval via which we update the function
> measurement block.
> 
> Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-inst.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 11b7f6bfa1..07bab85ce5 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -1046,7 +1046,7 @@ static void fmb_update(void *opaque)
>                         sizeof(pbdev->fmb.last_update))) {
>           return;
>       }
> -    timer_mod(pbdev->fmb_timer, t + DEFAULT_MUI);
> +    timer_mod(pbdev->fmb_timer, t + pbdev->pci_group->zpci_group.mui);
>   }
>   
>   int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
> @@ -1204,7 +1204,8 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
>           }
>           pbdev->fmb_addr = fmb_addr;
>           timer_mod(pbdev->fmb_timer,
> -                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + DEFAULT_MUI);
> +                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
> +                                    pbdev->pci_group->zpci_group.mui);
>           break;
>       }
>       default:
> 

Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>

-- 
Pierre Morel
IBM Lab Boeblingen

