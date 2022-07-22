Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4FB57E2A7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:58:21 +0200 (CEST)
Received: from localhost ([::1]:55136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEtAa-0002us-8w
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oEr7D-0001W9-6T; Fri, 22 Jul 2022 07:46:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oEr78-00028b-0r; Fri, 22 Jul 2022 07:46:39 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26MBgsG6022839;
 Fri, 22 Jul 2022 11:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Q2z7a1YSqEGZp5BSoaQ1w8IMEwv/pr9krRCI8pA/zxA=;
 b=buaKwIvYu2sXhMssC8dXKkOzLTN7ZlfENHbfvgbWIHLYWxan8X7+DQhsjZHxgNBory52
 06caiZY1itXvlZkeC6R6pgEouHkVhU12BADTmxToFj5A27V9snPl/Zw8E7u2m6a0Dk5H
 Ssz8FsdwooKht6CPlUpvIFVCxaMDAvqmnG+mc1EvZMLk5yyKBa7U24dDd1CCSJKvSf3q
 MxbLgoYIPQnBjfUVfAPVfA/Ok3dJ3JTxDXI/LmIojR0q9NHc+adTvIQfBua1fSAagwTy
 KxSdG+oHjsa79eknX/yaBgJE3TFmXqBJbGpUM8wC2jne2LyjRpAnE7cRrX32aDkRthU6 dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hfu8q03dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 11:46:36 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26MBhu96025073;
 Fri, 22 Jul 2022 11:46:35 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hfu8q03d2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 11:46:35 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26MBL6xj024855;
 Fri, 22 Jul 2022 11:46:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3hbmy906fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 11:46:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26MBkULA18678180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 11:46:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3197EA405B;
 Fri, 22 Jul 2022 11:46:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B66BFA4054;
 Fri, 22 Jul 2022 11:46:29 +0000 (GMT)
Received: from [9.145.179.185] (unknown [9.145.179.185])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Jul 2022 11:46:29 +0000 (GMT)
Message-ID: <e83eca2e-ac94-d2a5-5551-f347f3bc0a97@linux.ibm.com>
Date: Fri, 22 Jul 2022 13:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 13/14] s390x: Add KVM PV dump interface
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-14-frankja@linux.ibm.com>
From: Steffen Eiden <seiden@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220721132256.2171-14-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W5uz3Zcb5rz54_sldPxss0Y04P3oAW7M
X-Proofpoint-ORIG-GUID: 8sVRG_02FkDl1t9iE1kOJND54oA5IKhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_03,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0
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
X-Mailman-Approved-At: Fri, 22 Jul 2022 09:50:46 -0400
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

Hi Janosch,

looks good to me.
Have a look on my comments.

On 7/21/22 15:22, Janosch Frank wrote:
> Let's add a few bits of code which hide the new KVM PV dump API from
> us via new functions.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   hw/s390x/pv.c         | 51 +++++++++++++++++++++++++++++++++++++++++++
>   include/hw/s390x/pv.h |  8 +++++++
>   2 files changed, 59 insertions(+)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index a5af4ddf46..48591c387d 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -175,6 +175,57 @@ bool kvm_s390_pv_info_basic_valid(void)
>       return info_valid;
>   }
>   
> +static int s390_pv_dump_cmd(uint64_t subcmd, uint64_t uaddr, uint64_t gaddr,
> +                            uint64_t len)
> +{
> +    struct kvm_s390_pv_dmp dmp = {
> +        .subcmd = subcmd,
> +        .buff_addr = uaddr,
> +        .buff_len = len,
> +        .gaddr = gaddr,
> +    };
> +    int ret;
> +
> +    ret = s390_pv_cmd(KVM_PV_DUMP, (void *)&dmp);
> +    if (ret) {
> +        error_report("KVM DUMP command %ld failed", subcmd);
> +    }
> +    return ret;
> +}
> +
> +int kvm_s390_dump_cpu(S390CPU *cpu, void *buff)
> +{
> +    struct kvm_s390_pv_dmp dmp = {
> +        .subcmd = KVM_PV_DUMP_CPU,
> +        .buff_addr = (uint64_t)buff,
> +        .gaddr = 0,
> +        .buff_len = info_dump.dump_cpu_buffer_len,
> +    };
> +    struct kvm_pv_cmd pv = {
> +        .cmd = KVM_PV_DUMP,
> +        .data = (uint64_t)&dmp,
> +    };
> +
> +    return kvm_vcpu_ioctl(CPU(cpu), KVM_S390_PV_CPU_COMMAND, &pv);
> +}
> +
> +int kvm_s390_dump_init(void)
> +{
> +    return s390_pv_dump_cmd(KVM_PV_DUMP_INIT, 0, 0, 0);
> +}
> +
> +int kvm_s390_dump_mem(uint64_t gaddr, size_t len, void *dest)
> +{
> +    return s390_pv_dump_cmd(KVM_PV_DUMP_CONFIG_STATE, (uint64_t)dest,
> +                            gaddr, len);
> +}
Wouldn't be kvm_s390_dump_mem_state() a more precise name?
Or kvm_s390_dump_mem_meta, as the corresponding section in the dump
has that name (pv_mem_meta)

The current name may lead to the conclusion that this function dumps the
guests memory, which it does not.


> +
> +int kvm_s390_dump_finish(void *buff)
> +{
> +    return s390_pv_dump_cmd(KVM_PV_DUMP_COMPLETE, (uint64_t)buff, 0,
> +                            info_dump.dump_config_finalize_len);
> +}
IIRC this is the only place were you call "complete-dump"
"finish". In the next patch you call that function in
"get_data_complete()". This is the only reference to that function.

Why not simply call it kvm_s390_dump_complete() to reduce confusion?



> +
>   #define TYPE_S390_PV_GUEST "s390-pv-guest"
>   OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
>   
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 6fa55bf70e..f37021e189 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -51,6 +51,10 @@ uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
>   uint64_t kvm_s390_pv_dmp_get_size_mem(void);
>   uint64_t kvm_s390_pv_dmp_get_size_complete(void);
>   bool kvm_s390_pv_info_basic_valid(void);
> +int kvm_s390_dump_init(void);
> +int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
> +int kvm_s390_dump_mem(uint64_t addr, size_t len, void *dest);
> +int kvm_s390_dump_finish(void *buff);
>   #else /* CONFIG_KVM */
>   static inline bool s390_is_pv(void) { return false; }
>   static inline int s390_pv_query_info(void) { return 0; }
> @@ -66,6 +70,10 @@ static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
>   static inline uint64_t kvm_s390_pv_dmp_get_size_mem(void) { return 0; }
>   static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { return 0; }
>   static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
> +static inline int kvm_s390_dump_init(void) { return 0; }
> +static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff, size_t len) { return 0; }
> +static inline int kvm_s390_dump_mem(uint64_t addr, size_t len, void *dest) { return 0; }
> +static inline int kvm_s390_dump_finish(void *buff) { return 0; }
>   #endif /* CONFIG_KVM */
>   
>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);

