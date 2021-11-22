Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0504597D8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 23:45:40 +0100 (CET)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpI4A-0005WQ-Kg
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 17:45:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mpI1r-0004I2-8n; Mon, 22 Nov 2021 17:43:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mpI1o-0005b1-Vp; Mon, 22 Nov 2021 17:43:15 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMLlLRO010648; 
 Mon, 22 Nov 2021 22:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=w0K9N/oBW5UrXhMxYd9dcphTOUX/lT9QoTy6oZj7h/s=;
 b=fz6vRC0CldPoShySVTfxljJ6giRYiSz0XGOGgQjhmpLz+o1P9bvcaWKIR31tgktAd7NI
 bfwJs4eVdquhvAchfksSAfbiaSeN7vIArZzoz6jFCTsMOQ7YuU2aDUWqQwWlO4cGyLXh
 1EE7PKWY/4sHb7V+XCg45ZHxLvxsvsP9oMux59YzIn0dY5GrhSERHAaHkrYMEywr86fC
 pa45lM88RvUSC3u0xUOJJeC4GDtSYS2z5W6rQp9pJxufhLTBTOvtjctxhn/y7OvcILYN
 G3IPdeCZcRwimR3nYppJ2MJ0kLqEpEYbywipAZpGaC13mvW5WgqRiX8Q6YQUSQZ1ZCc8 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgke6gswm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 22:43:10 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AMMUFil028633;
 Mon, 22 Nov 2021 22:43:10 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgke6gswc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 22:43:10 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AMMavM5018635;
 Mon, 22 Nov 2021 22:43:09 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3cernat9pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 22:43:09 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AMMh7jJ29884894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 22:43:07 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86A0C6A04F;
 Mon, 22 Nov 2021 22:43:07 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0308B6A04D;
 Mon, 22 Nov 2021 22:43:06 +0000 (GMT)
Received: from [9.65.86.146] (unknown [9.65.86.146])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Nov 2021 22:43:06 +0000 (GMT)
Message-ID: <a21ab051-aa0a-895d-e0e7-4a23958b254c@linux.ibm.com>
Date: Mon, 22 Nov 2021 17:43:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] s390: kvm: reduce frequency of CPU syncs of diag318
 info
Content-Language: en-US
From: Collin Walling <walling@linux.ibm.com>
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211122223307.101790-1-walling@linux.ibm.com>
In-Reply-To: <20211122223307.101790-1-walling@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8qC8b7EI17QWLGS89GUM1RcwTP4kcX-I
X-Proofpoint-ORIG-GUID: 5jSFEehWNA4Vl30aw5p_9d9aaCc1Vzzt
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_08,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 frankja@linux.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 17:33, Collin Walling wrote:
> DIAGNOSE 0318 is invoked only once during IPL. As such, the
> diag318 info will only change once initially and during resets.
> Let's only sync the register to convey the info to KVM if and
> only if the diag318 info has changed. Only set the dirty bit
> flag for diag318 whenever it must be updated.
> 
> The migration handler will invoke the set_diag318 helper on
> post_load to ensure the info is set on the destination machine.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>

This is a long-overdue response to this thread:
https://www.spinics.net/lists/kvm/msg258071.html

> ---
>  target/s390x/kvm/kvm.c |  5 -----
>  target/s390x/machine.c | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 6acf14d5ec..6a141399f7 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -599,11 +599,6 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_ETOKEN;
>      }
>  
> -    if (can_sync_regs(cs, KVM_SYNC_DIAG318)) {
> -        cs->kvm_run->s.regs.diag318 = env->diag318_info;
> -        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
> -    }
> -
>      /* Finally the prefix */
>      if (can_sync_regs(cs, KVM_SYNC_PREFIX)) {
>          cs->kvm_run->s.regs.prefix = env->psa;
> diff --git a/target/s390x/machine.c b/target/s390x/machine.c
> index 37a076858c..a5d113ce3a 100644
> --- a/target/s390x/machine.c
> +++ b/target/s390x/machine.c
> @@ -234,6 +234,19 @@ const VMStateDescription vmstate_etoken = {
>      }
>  };
>  
> +static int diag318_post_load(void *opaque, int version_id)
> +{
> +    S390CPU *cpu = opaque;
> +    CPUState *cs = CPU(cpu);
> +    CPUS390XState *env = &S390_CPU(cs)->env;
> +
> +    if (kvm_enabled()) {
> +        kvm_s390_set_diag318(cs, env->diag318_info);
> +    }
> +
> +    return 0;
> +}
> +
>  static bool diag318_needed(void *opaque)
>  {
>      return s390_has_feat(S390_FEAT_DIAG_318);
> @@ -243,6 +256,7 @@ const VMStateDescription vmstate_diag318 = {
>      .name = "cpu/diag318",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .post_load = diag318_post_load,
>      .needed = diag318_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64(env.diag318_info, S390CPU),
> 


-- 
Regards,
Collin

Stay safe and stay healthy

