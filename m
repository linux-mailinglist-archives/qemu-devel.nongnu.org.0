Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBFA57E2A5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:57:50 +0200 (CEST)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEtA5-0001Wv-B0
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oEr6g-0001Ao-SJ; Fri, 22 Jul 2022 07:46:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oEr6e-00022U-Pp; Fri, 22 Jul 2022 07:46:10 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26MBBu07033633;
 Fri, 22 Jul 2022 11:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MM+v0ubzAH+ovQaztmAmKjWJntYEoV8h3YU2hfLv5zc=;
 b=IQ1oFw7jC/xykl4E74mrNAMLdEBNdN0RtlThTetPTB0l7Nc1tbG5oHfeQv0Ob1J9ApCj
 tm1pKEzuYkvRtHT18sSzGvkADPbmlEmkrXLW/a0dK53a73jG8KEYV5TxVN1VIHRCHeZ+
 +EEVSGOzdcXFDZxXVPmrdHc8ttOxCNb5o7VJELOAR7lhIXbx/6O6pZf/JaUIT0p4BDy0
 U7MDgavJKqRoZtSoACSNzFvRzbBTKBOYpacdwpHWx5p+CzoZN8u1B9wLv5ZvNhGgMGDG
 tQKXNlChKzYEQRT2v11z2CTlf3u2qsnSo6d3Og9MIbaqT1WIwRlzWR/JkEE7gxFt7ukP ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hftt60wd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 11:46:07 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26MBFBEH009239;
 Fri, 22 Jul 2022 11:46:06 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hftt60wc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 11:46:06 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26MBL310024849;
 Fri, 22 Jul 2022 11:46:04 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3hbmy906fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 11:46:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26MBiArP23658830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 11:44:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7E87A405F;
 Fri, 22 Jul 2022 11:46:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52B57A4054;
 Fri, 22 Jul 2022 11:46:00 +0000 (GMT)
Received: from [9.145.179.185] (unknown [9.145.179.185])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Jul 2022 11:46:00 +0000 (GMT)
Message-ID: <562c42b0-a9d3-82e9-7bdd-972ab1d26990@linux.ibm.com>
Date: Fri, 22 Jul 2022 13:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 12/14] s390x: Introduce PV query interface
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-13-frankja@linux.ibm.com>
From: Steffen Eiden <seiden@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220721132256.2171-13-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BjdmUKtbTRYln0ynm48LnJ3Il0ybOgmI
X-Proofpoint-ORIG-GUID: K-0IQ2ryXvITJ9Ow5ak597PwJ0fts3J_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_03,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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



On 7/21/22 15:22, Janosch Frank wrote:
> Introduce an interface over which we can get information about UV data.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
> ---
>   hw/s390x/pv.c              | 61 ++++++++++++++++++++++++++++++++++++++
>   hw/s390x/s390-virtio-ccw.c |  5 ++++
>   include/hw/s390x/pv.h      | 10 +++++++
>   3 files changed, 76 insertions(+)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 401b63d6cb..a5af4ddf46 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -20,6 +20,11 @@
>   #include "exec/confidential-guest-support.h"
>   #include "hw/s390x/ipl.h"
>   #include "hw/s390x/pv.h"
> +#include "target/s390x/kvm/kvm_s390x.h"
> +
> +static bool info_valid;
> +static struct kvm_s390_pv_info_vm info_vm;
> +static struct kvm_s390_pv_info_dump info_dump;
>   
>   static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
>   {
> @@ -56,6 +61,42 @@ static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
>       }                                  \
>   }
>   
> +int s390_pv_query_info(void)
> +{
> +    struct kvm_s390_pv_info info = {
> +        .header.id = KVM_PV_INFO_VM,
> +        .header.len_max = sizeof(info.header) + sizeof(info.vm),
> +    };
> +    int rc;
> +
> +    /* Info API's first user is dump so they are bundled */
> +    if (!kvm_s390_get_protected_dump()) {
> +        return 0;
> +    }
> +
> +    rc = s390_pv_cmd(KVM_PV_INFO, &info);
> +    if (rc) {
> +        error_report("KVM PV INFO cmd %x failed: %s",
> +                     info.header.id, strerror(rc));
> +        return rc;
> +    }
> +    memcpy(&info_vm, &info.vm, sizeof(info.vm));
> +
> +    info.header.id = KVM_PV_INFO_DUMP;
> +    info.header.len_max = sizeof(info.header) + sizeof(info.dump);
> +    rc = s390_pv_cmd(KVM_PV_INFO, &info);
> +    if (rc) {
> +        error_report("KVM PV INFO cmd %x failed: %s",
> +                     info.header.id, strerror(rc));
> +        return rc;
> +    }
> +
> +    memcpy(&info_dump, &info.dump, sizeof(info.dump));
> +    info_valid = true;
> +
> +    return rc;
> +}
> +
>   int s390_pv_vm_enable(void)
>   {
>       return s390_pv_cmd(KVM_PV_ENABLE, NULL);
> @@ -114,6 +155,26 @@ void s390_pv_inject_reset_error(CPUState *cs)
>       env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
>   }
>   
> +uint64_t kvm_s390_pv_dmp_get_size_cpu(void)
> +{
> +    return info_dump.dump_cpu_buffer_len;
> +}
> +
> +uint64_t kvm_s390_pv_dmp_get_size_complete(void)
> +{
> +    return info_dump.dump_config_finalize_len;
> +}
> +
> +uint64_t kvm_s390_pv_dmp_get_size_mem(void)
> +{
> +    return info_dump.dump_config_mem_buffer_per_1m;
> +}
> +
> +bool kvm_s390_pv_info_basic_valid(void)
> +{
> +    return info_valid;
> +}
> +
>   #define TYPE_S390_PV_GUEST "s390-pv-guest"
>   OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
>   
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index cc3097bfee..f9401e392b 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -366,6 +366,11 @@ static int s390_machine_protect(S390CcwMachineState *ms)
>   
>       ms->pv = true;
>   
> +    rc = s390_pv_query_info();
> +    if (rc) {
> +        goto out_err;
> +    }
> +
>       /* Set SE header and unpack */
>       rc = s390_ipl_prepare_pv_header();
>       if (rc) {
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 1f1f545bfc..6fa55bf70e 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -38,6 +38,7 @@ static inline bool s390_is_pv(void)
>       return ccw->pv;
>   }
>   
> +int s390_pv_query_info(void);
>   int s390_pv_vm_enable(void);
>   void s390_pv_vm_disable(void);
>   int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
> @@ -46,8 +47,13 @@ void s390_pv_prep_reset(void);
>   int s390_pv_verify(void);
>   void s390_pv_unshare(void);
>   void s390_pv_inject_reset_error(CPUState *cs);
> +uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
> +uint64_t kvm_s390_pv_dmp_get_size_mem(void);
> +uint64_t kvm_s390_pv_dmp_get_size_complete(void);
> +bool kvm_s390_pv_info_basic_valid(void);
>   #else /* CONFIG_KVM */
>   static inline bool s390_is_pv(void) { return false; }
> +static inline int s390_pv_query_info(void) { return 0; }
>   static inline int s390_pv_vm_enable(void) { return 0; }
>   static inline void s390_pv_vm_disable(void) {}
>   static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t length) { return 0; }
> @@ -56,6 +62,10 @@ static inline void s390_pv_prep_reset(void) {}
>   static inline int s390_pv_verify(void) { return 0; }
>   static inline void s390_pv_unshare(void) {}
>   static inline void s390_pv_inject_reset_error(CPUState *cs) {};
> +static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
> +static inline uint64_t kvm_s390_pv_dmp_get_size_mem(void) { return 0; }
> +static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { return 0; }
> +static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
>   #endif /* CONFIG_KVM */
>   
>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);

