Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929844C19C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:51:54 +0100 (CET)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkn4z-0007s7-LQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:51:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1mkmvm-00080O-RI; Wed, 10 Nov 2021 07:42:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57822
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1mkmvh-0001zV-HP; Wed, 10 Nov 2021 07:42:21 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAIUKn008867; 
 Wed, 10 Nov 2021 12:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XTKYcE0z2wGc/7R+OAAu8T9gK4wfrSpkuxWfIVR86/U=;
 b=ne3dMw743Fjj8CYmZQK0X1pYGQ26Ybwrhcd/KAcKvuHKUmgaQ9LxRpocMh+6A/voD7v8
 VUpLprPu2KZUKPw3DVhg6f+1hwu0Ne4ZFGgYleTDm2pFx3Km6bBmj6or/Sj/tvRMkwpG
 0CErCV88+7Kzs7Y+2sb3dCYugXXDjNyK0kkPLMnbZNXgR1+tjBjIGtNEEZIWlceARoyq
 R+nXRqzFrFIi6etmF5kXeYEjepDpV/8eHAnk+LKqjHgstOvPjM+NJsnBwkc5cSQtr9cm
 EALtXhvJKwaBC/TzzPvZ5WusaIfpArtXYfz28skIUkpqjh7Ktl/yzHxgMdM4J1/oBrJE Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8c72tu25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 12:42:13 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AACeorc005917;
 Wed, 10 Nov 2021 12:42:13 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8c72tu18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 12:42:13 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AACX76x026828;
 Wed, 10 Nov 2021 12:42:11 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3c5hbahwwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 12:42:11 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AACZSFq64356684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 12:35:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F02D52052;
 Wed, 10 Nov 2021 12:42:07 +0000 (GMT)
Received: from [9.145.185.56] (unknown [9.145.185.56])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 316E852054;
 Wed, 10 Nov 2021 12:42:07 +0000 (GMT)
Message-ID: <695c3358-54e1-e7ea-76fc-14a2ca91eee1@linux.ibm.com>
Date: Wed, 10 Nov 2021 13:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] s390: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211109205602.99732-1-walling@linux.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <20211109205602.99732-1-walling@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iy5HS0m2zGVFEGTGOe-yiedo9QA6UCYB
X-Proofpoint-GUID: 0EB2qwo1vnyHG6i5zvjbPo0ickiY-NZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100064
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 21:56, Collin Walling wrote:
> The CPNC portion of the diag 318 data is erroneously reset during an
> initial CPU reset caused by SIGP. Let's go ahead and relocate the
> diag318_info field within the CPUS390XState struct such that it is
> only zeroed during a clear reset. This way, the CPNC will be retained
> for each VCPU in the configuration after the diag 318 instruction
> has been invoked.

I'd add something like:
The s390 machine reset code takes care of zeroing the diag318 data on VM 
resets which also cover resets caused by diag308.

> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---

Reviewed-by: Janosch Frank <frankja@linux.ibm.com>

> 
> Changelog:
> 
>      v2
>      - handler uses run_on_cpu again
>      - reworded commit message slightly
>      - added fixes and reported-by tags
> 
>      v3
>      - nixed code reduction changes
>      - added a comment to diag318 handler to briefly describe
>          when relevent data is zeroed
> 
> ---
>   target/s390x/cpu.h     | 4 ++--
>   target/s390x/kvm/kvm.c | 4 ++++
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 3153d053e9..88aace36ff 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -63,6 +63,8 @@ struct CPUS390XState {
>       uint64_t etoken;       /* etoken */
>       uint64_t etoken_extension; /* etoken extension */
>   
> +    uint64_t diag318_info;
> +
>       /* Fields up to this point are not cleared by initial CPU reset */
>       struct {} start_initial_reset_fields;
>   
> @@ -118,8 +120,6 @@ struct CPUS390XState {
>       uint16_t external_call_addr;
>       DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
>   
> -    uint64_t diag318_info;
> -
>   #if !defined(CONFIG_USER_ONLY)
>       uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
>       int tlb_fill_exc;        /* exception number seen during tlb_fill */
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 5b1fdb55c4..6acf14d5ec 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -1585,6 +1585,10 @@ void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
>           env->diag318_info = diag318_info;
>           cs->kvm_run->s.regs.diag318 = diag318_info;
>           cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
> +        /*
> +         * diag 318 info is zeroed during a clear reset and
> +         * diag 308 IPL subcodes.
> +         */
>       }
>   }
>   
> 


