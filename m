Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216F2459C3B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 07:19:58 +0100 (CET)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpP9p-0001u2-7p
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 01:19:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mpP4J-00056e-CQ; Tue, 23 Nov 2021 01:14:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mpP4G-0006b5-Ff; Tue, 23 Nov 2021 01:14:14 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AN4pXHS027951; 
 Tue, 23 Nov 2021 06:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lcNIutGac49os/br1UAol9528lYnsdNoZFdI2U/F5Ig=;
 b=to/cyVStoe+mJAxKRxn9XDZ5mwIvs2B1g4jV/K9EYN8AZkKEbbjL5PXnXYuHd35dGISE
 Twd0t3exXFpR7brvP/MaF004BT2yz/sXg5Bh03TeYa+kuSQ2Dsz9E7fZigwQS1oGcLo8
 hQKPcaLeuevqNqGoxvxSStKBGryfMmSxVN5qbzHz/Yxi5w/4uhH9KYXyQ5xw4l90Cupz
 odh5KMD1tcwQbmljGU4/Mbx+M7HfA07vsgY6psbd4pv7RR8rXhsb9OGU/WdOBH8RF7eO
 kPZ2rOth0hO9qAK3lp7T8JOSD3kbNQqBstWh2ZYS1fhGAKOxB0HPuON9+HjwZlGSCm6X lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgsn2h7fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 06:14:08 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AN605um034745;
 Tue, 23 Nov 2021 06:14:08 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgsn2h7f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 06:14:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AN6CqQI003056;
 Tue, 23 Nov 2021 06:14:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3cern9va3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 06:14:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AN6E2qb786966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 06:14:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BA1DA404D;
 Tue, 23 Nov 2021 06:14:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C06CA4057;
 Tue, 23 Nov 2021 06:14:02 +0000 (GMT)
Received: from [9.171.89.214] (unknown [9.171.89.214])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Nov 2021 06:14:02 +0000 (GMT)
Message-ID: <aefbdcd0-f65d-7c33-330f-141b1b57395b@de.ibm.com>
Date: Tue, 23 Nov 2021 07:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH] s390: kvm: reduce frequency of CPU syncs of diag318
 info
Content-Language: en-US
To: Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211122223307.101790-1-walling@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <20211122223307.101790-1-walling@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oI95gLWz4Two-L9jdUsuV0o07V6Bh_98
X-Proofpoint-ORIG-GUID: b4ilyhK1d0VLsu_cyxCglLuJAuQWeGma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_02,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230028
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
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
Cc: thuth@redhat.com, cohuck@redhat.com, frankja@linux.ibm.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Am 22.11.21 um 23:33 schrieb Collin Walling:
> DIAGNOSE 0318 is invoked only once during IPL. As such, the
> diag318 info will only change once initially and during resets.
> Let's only sync the register to convey the info to KVM if and
> only if the diag318 info has changed. Only set the dirty bit
> flag for diag318 whenever it must be updated.

Is this really necessary? In my logs the sync only happens for larger
changes (like reset) operations and then yes we log again.
But I think it is ok to see such a log entry in these rare events.
> 
> The migration handler will invoke the set_diag318 helper on
> post_load to ensure the info is set on the destination machine.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> ---
>   target/s390x/kvm/kvm.c |  5 -----
>   target/s390x/machine.c | 14 ++++++++++++++
>   2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 6acf14d5ec..6a141399f7 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -599,11 +599,6 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>           cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_ETOKEN;
>       }
>   
> -    if (can_sync_regs(cs, KVM_SYNC_DIAG318)) {
> -        cs->kvm_run->s.regs.diag318 = env->diag318_info;
> -        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
> -    }
> -
>       /* Finally the prefix */
>       if (can_sync_regs(cs, KVM_SYNC_PREFIX)) {
>           cs->kvm_run->s.regs.prefix = env->psa;
> diff --git a/target/s390x/machine.c b/target/s390x/machine.c
> index 37a076858c..a5d113ce3a 100644
> --- a/target/s390x/machine.c
> +++ b/target/s390x/machine.c
> @@ -234,6 +234,19 @@ const VMStateDescription vmstate_etoken = {
>       }
>   };
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
>   static bool diag318_needed(void *opaque)
>   {
>       return s390_has_feat(S390_FEAT_DIAG_318);
> @@ -243,6 +256,7 @@ const VMStateDescription vmstate_diag318 = {
>       .name = "cpu/diag318",
>       .version_id = 1,
>       .minimum_version_id = 1,
> +    .post_load = diag318_post_load,
>       .needed = diag318_needed,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT64(env.diag318_info, S390CPU),
> 

