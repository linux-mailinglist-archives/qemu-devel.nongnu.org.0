Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FCE295D2F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 13:08:22 +0200 (CEST)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVYSC-00060z-NU
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 07:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kVYRO-0005KE-7H; Thu, 22 Oct 2020 07:07:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13742
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kVYRL-0002CW-Ea; Thu, 22 Oct 2020 07:07:29 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09MB2MDC004671; Thu, 22 Oct 2020 07:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GXIjyZEG5xa4moWW9hqgqjOsEgAaGfL0dDPevJZhZtk=;
 b=P9bek451L+l6siftdC38/1+Ei1bflNYVi9F7lrvbb7cpvIZIFe+0iMI/gRFESecUUT2y
 gBYIy4kfUcnbpi870Li5crInZd6tK/qcLRnksiuL/LlTafrr+5ZCAvYbBFwaIyzrlylZ
 MGL28MXsX17+E1FbXiPT8MWr0MDnNryStogam4he4hsPwD2WSjZ7c36tXWaC0KyDusOp
 RZCt+qYvFyMoZ4LNS689Ujdbbf6hZ4C9tyZvuXoR8ncAJrCdPyF0iN3M952NlwK5ihPM
 POnhXBUH0x0wO7oPATSanNhBMaTKuhTQ6HOziXQFe3qv1W3v8Rq2pym88haYi2/ixWX5 fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34ay4jqp76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 07:07:25 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09MB435Z012113;
 Thu, 22 Oct 2020 07:07:25 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34ay4jqp6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 07:07:24 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09MAvvmg031026;
 Thu, 22 Oct 2020 11:07:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 347r882sbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 11:07:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09MB7Kol28377448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 11:07:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03FE811C058;
 Thu, 22 Oct 2020 11:07:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8543411C04C;
 Thu, 22 Oct 2020 11:07:19 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.165.108])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Oct 2020 11:07:19 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] s390x: pv: Fix diag318 PV fencing
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20201022103135.126033-1-frankja@linux.ibm.com>
 <20201022103135.126033-3-frankja@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Message-ID: <eacf9b59-2337-d09a-8ca8-16544c1be5ec@de.ibm.com>
Date: Thu, 22 Oct 2020 13:07:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022103135.126033-3-frankja@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_06:2020-10-20,
 2020-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220071
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 06:31:44
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 walling@linux.ibm.com, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 mhartmay@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 22.10.20 12:31, Janosch Frank wrote:
> Diag318 fencing needs to be determined on the current VM PV state and
> not on the state that the VM has when we create the CPU model.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> Fixes: fabdada935 ("s390: guest support for diagnose 0x318")

I prefer v1 as it is more obvious what happens, but this looks fine as well
and as David prefers this let us go with this one.

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>  target/s390x/cpu_features.c | 5 +++++
>  target/s390x/cpu_features.h | 4 ++++
>  target/s390x/cpu_models.c   | 4 ++++
>  target/s390x/kvm.c          | 3 +--
>  4 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
> index 31ea8df246..42fe0bf4ca 100644
> --- a/target/s390x/cpu_features.c
> +++ b/target/s390x/cpu_features.c
> @@ -14,6 +14,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
>  #include "cpu_features.h"
> +#include "hw/s390x/pv.h"
>  
>  #define DEF_FEAT(_FEAT, _NAME, _TYPE, _BIT, _DESC) \
>      [S390_FEAT_##_FEAT] = {                        \
> @@ -105,6 +106,10 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
>          }
>          feat = find_next_bit(features, S390_FEAT_MAX, feat + 1);
>      }
> +
> +    if (type == S390_FEAT_TYPE_SCLP_FAC134 && s390_is_pv()) {
> +        clear_be_bit(s390_feat_def(S390_FEAT_DIAG_318)->bit, data);
> +    }
>  }
>  
>  void s390_add_from_feat_block(S390FeatBitmap features, S390FeatType type,
> diff --git a/target/s390x/cpu_features.h b/target/s390x/cpu_features.h
> index ef52ffce83..87463f064d 100644
> --- a/target/s390x/cpu_features.h
> +++ b/target/s390x/cpu_features.h
> @@ -81,6 +81,10 @@ const S390FeatGroupDef *s390_feat_group_def(S390FeatGroup group);
>  
>  #define BE_BIT_NR(BIT) (BIT ^ (BITS_PER_LONG - 1))
>  
> +static inline void clear_be_bit(unsigned int bit_nr, uint8_t *array)
> +{
> +    array[bit_nr / 8] &= ~(0x80 >> (bit_nr % 8));
> +}
>  static inline void set_be_bit(unsigned int bit_nr, uint8_t *array)
>  {
>      array[bit_nr / 8] |= 0x80 >> (bit_nr % 8);
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index ca484bfda7..461e0b8f4a 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -29,6 +29,7 @@
>  #include "hw/pci/pci.h"
>  #endif
>  #include "qapi/qapi-commands-machine-target.h"
> +#include "hw/s390x/pv.h"
>  
>  #define CPUDEF_INIT(_type, _gen, _ec_ga, _mha_pow, _hmfai, _name, _desc) \
>      {                                                                    \
> @@ -238,6 +239,9 @@ bool s390_has_feat(S390Feat feat)
>          }
>          return 0;
>      }
> +    if (feat == S390_FEAT_DIAG_318 && s390_is_pv()) {
> +        return false;
> +    }
>      return test_bit(feat, cpu->model->features);
>  }
>  
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index f13eff688c..baa070fdf7 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -2498,8 +2498,7 @@ void kvm_s390_get_host_cpu_model(S390CPUModel *model, Error **errp)
>       */
>      set_bit(S390_FEAT_EXTENDED_LENGTH_SCCB, model->features);
>  
> -    /* DIAGNOSE 0x318 is not supported under protected virtualization */
> -    if (!s390_is_pv() && kvm_check_extension(kvm_state, KVM_CAP_S390_DIAG318)) {
> +    if (kvm_check_extension(kvm_state, KVM_CAP_S390_DIAG318)) {
>          set_bit(S390_FEAT_DIAG_318, model->features);
>      }
>  
> 

