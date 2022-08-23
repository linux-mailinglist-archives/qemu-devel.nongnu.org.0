Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7159E5FB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:28:37 +0200 (CEST)
Received: from localhost ([::1]:36078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQVpU-0005Oa-2b
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oQVmX-0001ZB-Et; Tue, 23 Aug 2022 11:25:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oQVmU-0000OE-RB; Tue, 23 Aug 2022 11:25:32 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NFKUTm035711;
 Tue, 23 Aug 2022 15:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iwwye3QC6nQAuABdBKLDCv4J3cnSajtOyWaSZoPfN7M=;
 b=UAx+IdAkQK3LtVyjjOb/Kv4TyCi2f9PZ7gFoz0d2WbqZb24HAb63qW417K+M9jK1MoXM
 yv5ufgKfJ9glz/dWYj6C9va/FNEn7utttACbwiVDmHwI1pLp1IcsLPS/HAdPQcury3Or
 0drXIf0FwUejw/h3uQtaKPAbwcZOpVE4oLyoZSplYrglG07Yzvlgj9K7VMEfzDdPhswc
 5iiLrA/3D84K3rv0Ydt4vVemRFX6YJVa9FmQ6jhEHqXEPpuTAlSnlwwgpAvQ3uv3hlQY
 63N9ahydOYB4HnIAcmRT2nB9vYuIgRxErnWp/Da6mmnBh7mNKsK3XbMHfMWGKRbYLeHc gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j51ep8420-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 15:25:24 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27NFKbma035855;
 Tue, 23 Aug 2022 15:25:24 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j51ep840q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 15:25:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27NF7H0a022296;
 Tue, 23 Aug 2022 15:25:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3j2q88v025-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 15:25:21 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27NFPIRo36045170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Aug 2022 15:25:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 720075204E;
 Tue, 23 Aug 2022 15:25:18 +0000 (GMT)
Received: from [9.145.6.90] (unknown [9.145.6.90])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 02BD352050;
 Tue, 23 Aug 2022 15:25:17 +0000 (GMT)
Message-ID: <3ebfdfb7-592e-1a96-3d34-dfcdcb9dc0a8@linux.ibm.com>
Date: Tue, 23 Aug 2022 17:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 17/18] s390x: Add KVM PV dump interface
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 scgl@linux.ibm.com
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-18-frankja@linux.ibm.com>
From: Steffen Eiden <seiden@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220811121111.9878-18-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K_8ZH0ibUF3LwoIFME_KKu3Y9HRhpPn_
X-Proofpoint-ORIG-GUID: FM4aTgJ809Xw9Fzya46zZOiJdm2vHYya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_05,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230062
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



On 8/11/22 14:11, Janosch Frank wrote:
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
> index 2b892b45e8..ce3b6ad3e9 100644
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

I suggest changing that into something like
  * kvm_s390_dump_mem_state
  * kvm_s390_dump_config_state

This would make the effect of that function more clear.
It is not dumping the memory, but getting (part of) the
necessary metadata to process the dump.

Additionally, I suggest to reflect the name changes in the next patch.
I mark all functions I find.
> +int kvm_s390_dump_mem(uint64_t gaddr, size_t len, void *dest)
> +{
> +    return s390_pv_dump_cmd(KVM_PV_DUMP_CONFIG_STATE, (uint64_t)dest,
> +                            gaddr, len);
> +}
> +
> +int kvm_s390_dump_complete(void *buff)
> +{
> +    return s390_pv_dump_cmd(KVM_PV_DUMP_COMPLETE, (uint64_t)buff, 0,
> +                            info_dump.dump_config_finalize_len);
> +}
> +
>   #define TYPE_S390_PV_GUEST "s390-pv-guest"
>   OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
>   
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 573259cf2b..02a6c06b9f 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -51,6 +51,10 @@ uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
>   uint64_t kvm_s390_pv_dmp_get_size_stor_state(void);
>   uint64_t kvm_s390_pv_dmp_get_size_complete(void);
>   bool kvm_s390_pv_info_basic_valid(void);
> +int kvm_s390_dump_init(void);
> +int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
> +int kvm_s390_dump_mem(uint64_t addr, size_t len, void *dest);
> +int kvm_s390_dump_complete(void *buff);
>   #else /* CONFIG_KVM */
>   static inline bool s390_is_pv(void) { return false; }
>   static inline int s390_pv_query_info(void) { return 0; }
> @@ -66,6 +70,10 @@ static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
>   static inline uint64_t kvm_s390_pv_dmp_get_size_stor_state(void) { return 0; }
>   static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { return 0; }
>   static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
> +static inline int kvm_s390_dump_init(void) { return 0; }
> +static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff, size_t len) { return 0; }
> +static inline int kvm_s390_dump_mem(uint64_t addr, size_t len, void *dest) { return 0; }
> +static inline int kvm_s390_dump_complete(void *buff) { return 0; }
>   #endif /* CONFIG_KVM */
>   
>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);

Beside that nit, LGTM.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>


