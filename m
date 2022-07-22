Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5866C57E2C7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 16:01:17 +0200 (CEST)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEtDQ-0005kT-Gb
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 10:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oEr6E-000129-CP; Fri, 22 Jul 2022 07:45:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oEr6B-0001w1-5y; Fri, 22 Jul 2022 07:45:41 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26MBh5Vx023157;
 Fri, 22 Jul 2022 11:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n7lE10BHFOY2HlyGxMNAUpSacS9xaxMA8z7dhcMi0qc=;
 b=TqU1hcnFJg+5hb+YpHKWcD4InxyhPA+tlp6Q3aZJ/fQgb9KZR+Rpt3eiOyEJ1SDZt8bx
 Gxar5iYKSH0vNbnrGFlTpgzdafIUa/eLaZa7gxaXBpckc61FTEg/WyNIvfPu1/IdrWV6
 kxYEf+9Zwj0Ib7DKTNGgC1noQ+BF0uITOnoJrsyb3T+6vcv87pBu98vT7BcXHs72OMJJ
 U77WqrnrndJiqbLv7KvWaHjpuLzqN5ysId25KfFAfM/628ynNKh5Egi/u+CJgVvJmabo
 L4+NThOmHkrH4d49Z2M75KEccMlQpMSgrE5ejZUAkOqimgT1lZJNjmPPTUqbJmQa7nSg jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hfu8q02an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 11:45:34 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26MBhW7L023955;
 Fri, 22 Jul 2022 11:45:34 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hfu8q0297-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 11:45:33 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26MBL1dA007093;
 Fri, 22 Jul 2022 11:45:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3hbmy906tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 11:45:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26MBjSBd20709832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 11:45:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A5B5A4054;
 Fri, 22 Jul 2022 11:45:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5D20A405C;
 Fri, 22 Jul 2022 11:45:27 +0000 (GMT)
Received: from [9.145.179.185] (unknown [9.145.179.185])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Jul 2022 11:45:27 +0000 (GMT)
Message-ID: <089e1415-0022-3b86-2cf4-aa8e9788f7a7@linux.ibm.com>
Date: Fri, 22 Jul 2022 13:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 11/14] s390x: Add protected dump cap
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-12-frankja@linux.ibm.com>
From: Steffen Eiden <seiden@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220721132256.2171-12-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ckM2L-KwalDEFa24w3m4htoi5B5wUfvC
X-Proofpoint-ORIG-GUID: 6y8kPZFvZpZIo-6b-EXQ_Z3l5XCRnQl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_03,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxscore=0 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207220048
Received-SPF: pass client-ip=148.163.156.1; envelope-from=seiden@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 Jul 2022 09:50:44 -0400
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



On 7/21/22 15:22, Janosch Frank wrote:
> Add a protected dump capability for later feature checking.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
> ---
>   target/s390x/kvm/kvm.c       | 7 +++++++
>   target/s390x/kvm/kvm_s390x.h | 1 +
>   2 files changed, 8 insertions(+)
> 
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 7bd8db0e7b..cbd8c91424 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -157,6 +157,7 @@ static int cap_ri;
>   static int cap_hpage_1m;
>   static int cap_vcpu_resets;
>   static int cap_protected;
> +static int cap_protected_dump;
>   
>   static bool mem_op_storage_key_support;
>   
> @@ -362,6 +363,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
>       cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
>       cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
> +    cap_protected_dump = kvm_check_extension(s, KVM_CAP_S390_PROTECTED_DUMP);
>   
>       kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
>       kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
> @@ -2043,6 +2045,11 @@ int kvm_s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch,
>       return kvm_vm_ioctl(kvm_state, KVM_IOEVENTFD, &kick);
>   }
>   
> +int kvm_s390_get_protected_dump(void)
> +{
> +    return cap_protected_dump;
> +}
> +
>   int kvm_s390_get_ri(void)
>   {
>       return cap_ri;
> diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
> index 05a5e1e6f4..31a69f9ce2 100644
> --- a/target/s390x/kvm/kvm_s390x.h
> +++ b/target/s390x/kvm/kvm_s390x.h
> @@ -26,6 +26,7 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state);
>   void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
>   int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu);
>   int kvm_s390_get_hpage_1m(void);
> +int kvm_s390_get_protected_dump(void);
>   int kvm_s390_get_ri(void);
>   int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_clock);
>   int kvm_s390_get_clock_ext(uint8_t *tod_high, uint64_t *tod_clock);

