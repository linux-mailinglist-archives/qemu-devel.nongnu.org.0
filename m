Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D759739D6D0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 10:12:43 +0200 (CEST)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqANG-0000Ul-Vm
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 04:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lqAM0-00089o-Ix; Mon, 07 Jun 2021 04:11:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lqALy-0005Nx-B7; Mon, 07 Jun 2021 04:11:24 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 157854oc113432; Mon, 7 Jun 2021 04:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XAAFz4RkHGi6fZ6W0G15z04/chvNvZNQwUzIWwLnx2s=;
 b=jkKTIbyth6M7q28oV8CuJ63MEo2ynBn55gyxxDklO2phfXvfH0PwB6XHgH6ACcqlHPlv
 sXwxoLKpBsU0bAzbATwODHQauChuDkA3001LOZf9NGSzryQBaibHIhVLb0xOjPRgBN/B
 VKl5FMFUW6deOvexQ3jaHQn1y72WJGEdCWG5/W/G8bGyCLBlrRrtU81ogxNt5xJZnhgb
 6tDH/iLUHnCETs9n+NvXNqHXDddA5zKNh7eTodxDmOwvMCQLUKZwxWPZt7FjpPn/ih7Q
 x1qY5kb00h/3279I2YpMdm2+0AOjfSA3K03DY5Ie1etyj/XBKwY2XsaXS5n7Woim9CNV cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391fd9gjtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 04:11:15 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15785MxL115208;
 Mon, 7 Jun 2021 04:11:15 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391fd9gjs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 04:11:15 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15788mHt017997;
 Mon, 7 Jun 2021 08:11:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3900w88dq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 08:11:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1578ARqV31261152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 08:10:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2823142047;
 Mon,  7 Jun 2021 08:11:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D50A242045;
 Mon,  7 Jun 2021 08:11:09 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.37.245])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Jun 2021 08:11:09 +0000 (GMT)
Subject: Re: [PATCH] s390x/kvm: remove unused gs handling
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210602125050.492500-1-cohuck@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <4784d0a9-8bb6-2b80-65b9-c00e2ca354ac@de.ibm.com>
Date: Mon, 7 Jun 2021 10:11:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602125050.492500-1-cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XwWYX3WUi3omtPszeZpH_ezb5vmj7B4z
X-Proofpoint-GUID: 5Ou_KThOpWYGdCv_eSitbaTFoQ0OM3UJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_07:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1011 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106070064
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02.06.21 14:50, Cornelia Huck wrote:
> With commit 0280b3eb7c05 ("s390x/kvm: use cpu model for gscb on
> compat machines"), we removed any calls to kvm_s390_get_gs()
> in favour of a different mechanism.
> 
> Let's remove the unused kvm_s390_get_gs(), and with it the now
> unneeded cap_gs as well.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>   target/s390x/kvm-stub.c  |  5 -----
>   target/s390x/kvm.c       | 10 +---------
>   target/s390x/kvm_s390x.h |  1 -
>   3 files changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/target/s390x/kvm-stub.c b/target/s390x/kvm-stub.c
> index 9970b5a8c705..8a308cfebb68 100644
> --- a/target/s390x/kvm-stub.c
> +++ b/target/s390x/kvm-stub.c
> @@ -49,11 +49,6 @@ int kvm_s390_get_ri(void)
>       return 0;
>   }
>   
> -int kvm_s390_get_gs(void)
> -{
> -    return 0;
> -}
> -
>   int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_low)
>   {
>       return -ENOSYS;
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index 4fb3bbfef506..23889245877a 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -154,7 +154,6 @@ static int cap_async_pf;
>   static int cap_mem_op;
>   static int cap_s390_irq;
>   static int cap_ri;
> -static int cap_gs;
>   static int cap_hpage_1m;
>   static int cap_vcpu_resets;
>   static int cap_protected;
> @@ -369,9 +368,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>           }
>       }
>       if (cpu_model_allowed()) {
> -        if (kvm_vm_enable_cap(s, KVM_CAP_S390_GS, 0) == 0) {
> -            cap_gs = 1;
> -        }
> +        kvm_vm_enable_cap(s, KVM_CAP_S390_GS, 0);
>       }
>   
>       /*
> @@ -2039,11 +2036,6 @@ int kvm_s390_get_ri(void)
>       return cap_ri;
>   }
>   
> -int kvm_s390_get_gs(void)
> -{
> -    return cap_gs;
> -}
> -
>   int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
>   {
>       struct kvm_mp_state mp_state = {};
> diff --git a/target/s390x/kvm_s390x.h b/target/s390x/kvm_s390x.h
> index 25bbe98b2514..05a5e1e6f46d 100644
> --- a/target/s390x/kvm_s390x.h
> +++ b/target/s390x/kvm_s390x.h
> @@ -27,7 +27,6 @@ void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
>   int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu);
>   int kvm_s390_get_hpage_1m(void);
>   int kvm_s390_get_ri(void);
> -int kvm_s390_get_gs(void);
>   int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_clock);
>   int kvm_s390_get_clock_ext(uint8_t *tod_high, uint64_t *tod_clock);
>   int kvm_s390_set_clock(uint8_t tod_high, uint64_t tod_clock);
> 

