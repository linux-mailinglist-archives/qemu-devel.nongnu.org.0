Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E0946D0D7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 11:18:46 +0100 (CET)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muu28-0000Rf-Ot
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 05:18:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1muu0V-00088N-E3; Wed, 08 Dec 2021 05:17:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1muu0S-0004YY-VO; Wed, 08 Dec 2021 05:17:03 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B88nGBm022486; 
 Wed, 8 Dec 2021 10:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=M8PDivKcdJN2Yp2lCgAsBhNnQs7vfUr/BNt3MrSCH4c=;
 b=Y0kJOjSkUdOzZkgZac5ow8QwjwEY22MkwMzQyTyJUUMhXJvMwlXNd01FPMclsJPD5f4I
 EL+0TqZGu9H6bHmoI3bN4zGTVCSi1Ke9czGyOnDKbhwNfBJNPNjBIolvlT/JMB3zv60W
 GHRPxV8ZwSwChnT2x/kQV3MOtWG9IKc8Y5+9OIkJBJTLlCJPlNC25cnQ0WGSonGagfFE
 OF+FEDykg0A0UA/3bBQW08Cd9jJb9PzATAS1HzzZPxcuS1KumGeT1+zxIzXZedjt0oWA
 iZahEaoD0KTn1Ryp9QOfFT+WKKzx7QEOIOkAECNlJVeKp6grCYZpNtjSNB+slSG7z+0m wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctshahkfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 10:16:57 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8AGv9e024965;
 Wed, 8 Dec 2021 10:16:57 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctshahkex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 10:16:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8ABIAm018942;
 Wed, 8 Dec 2021 10:16:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3cqyyaxbu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 10:16:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8AGppC29819232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 10:16:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFA0411C052;
 Wed,  8 Dec 2021 10:16:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 250D711C04A;
 Wed,  8 Dec 2021 10:16:51 +0000 (GMT)
Received: from [9.171.54.177] (unknown [9.171.54.177])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 10:16:51 +0000 (GMT)
Message-ID: <77f66828-b947-da7a-fe8c-35b698eca841@linux.ibm.com>
Date: Wed, 8 Dec 2021 11:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 06/12] target/s390x: add zpci-interp to cpu models
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
 <20211207210425.150923-7-mjrosato@linux.ibm.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20211207210425.150923-7-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kG44lIBa6YBEc7WzY2nbGyTnVvnAEm4p
X-Proofpoint-GUID: vor7F_9QJqEJrSsqqFEhTUb5GLs1ABZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080065
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.12.21 um 22:04 schrieb Matthew Rosato:
> The zpci-interp feature is used to specify whether zPCI interpretation is
> to be used for this guest.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   target/s390x/cpu_features_def.h.inc | 1 +
>   target/s390x/gen-features.c         | 2 ++
>   target/s390x/kvm/kvm.c              | 1 +
>   3 files changed, 4 insertions(+)
> 
> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
> index e86662bb3b..4ade3182aa 100644
> --- a/target/s390x/cpu_features_def.h.inc
> +++ b/target/s390x/cpu_features_def.h.inc
> @@ -146,6 +146,7 @@ DEF_FEAT(SIE_CEI, "cei", SCLP_CPU, 43, "SIE: Conditional-external-interception f
>   DEF_FEAT(DAT_ENH_2, "dateh2", MISC, 0, "DAT-enhancement facility 2")
>   DEF_FEAT(CMM, "cmm", MISC, 0, "Collaborative-memory-management facility")
>   DEF_FEAT(AP, "ap", MISC, 0, "AP instructions installed")
> +DEF_FEAT(ZPCI_INTERP, "zpci-interp", MISC, 0, "zPCI interpretation")
>   
>   /* Features exposed via the PLO instruction. */
>   DEF_FEAT(PLO_CL, "plo-cl", PLO, 0, "PLO Compare and load (32 bit in general registers)")
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 7cb1a6ec10..7005d22415 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -554,6 +554,7 @@ static uint16_t full_GEN14_GA1[] = {
>       S390_FEAT_HPMA2,
>       S390_FEAT_SIE_KSS,
>       S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
> +    S390_FEAT_ZPCI_INTERP,
>   };
>   
>   #define full_GEN14_GA2 EmptyFeat
> @@ -650,6 +651,7 @@ static uint16_t default_GEN14_GA1[] = {
>       S390_FEAT_GROUP_MSA_EXT_8,
>       S390_FEAT_MULTIPLE_EPOCH,
>       S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
> +    S390_FEAT_ZPCI_INTERP,
>   };
>   

For the default model you need to be careful.
Is this in any way guest visible? then you definitely need to fence this
off for older QEMU versions so that when you migrate with older QEMUs
See the s390_cpudef_featoff_greater calls in  hw/s390x/s390-virtio-ccw.c

I know its more of a theoretical aspect, since PCI currently forbids migration
but we should try to have the cpu model consistent I guess.
>   #define default_GEN14_GA2 EmptyFeat
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 5b1fdb55c4..b13d78f988 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -2290,6 +2290,7 @@ static int kvm_to_feat[][2] = {
>       { KVM_S390_VM_CPU_FEAT_PFMFI, S390_FEAT_SIE_PFMFI},
>       { KVM_S390_VM_CPU_FEAT_SIGPIF, S390_FEAT_SIE_SIGPIF},
>       { KVM_S390_VM_CPU_FEAT_KSS, S390_FEAT_SIE_KSS},
> +    { KVM_S390_VM_CPU_FEAT_ZPCI_INTERP, S390_FEAT_ZPCI_INTERP },
>   };
>   
>   static int query_cpu_feat(S390FeatBitmap features)
> 

