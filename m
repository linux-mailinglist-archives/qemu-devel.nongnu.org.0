Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A2845420B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:46:46 +0100 (CET)
Received: from localhost ([::1]:33780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnFeX-0000zy-Ez
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:46:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mnFbm-0007wN-P9; Wed, 17 Nov 2021 02:43:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mnFbk-0003Bp-Ld; Wed, 17 Nov 2021 02:43:54 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH6hM7O017452; 
 Wed, 17 Nov 2021 07:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hckOv1+areWaBAWiA4vBDUxhaSTgxeH1WkEKfE6QxGs=;
 b=g3b26FFlxUOYKbzYCdVNn/0vawrnL+13cWVCoMzGUrRcR3zSNX7s9puXcn/qlIIZoDWU
 WPLk4J8mBtBR6hII+WgeD5K2XbMAJ/Rv0usbifK6VCfYL+Zp2RvF15esQrFcIWAVhHAO
 TEO1WXK7GADrcjgEsqCKoNDRJuiWv7jqH7bqZfdkhZZvNw0xmx5zrA1Ccd1rNm+OvRfJ
 SYEzqkZYxok9MMYCyGNI7eBpxn+f50dHh1yULGaxcd1oToCL4CDlldS499i7de1CX075
 hkDLCTr9GcF6NaGcymJPXdQ21XKz5r8ckwL71NGjLpt45OpZgk6RDILhbfst/8ET+RUT JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccvqgs6am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 07:43:46 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AH7G9Fm023061;
 Wed, 17 Nov 2021 07:43:46 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccvqgs6a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 07:43:46 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AH7gjH6020807;
 Wed, 17 Nov 2021 07:43:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3ca50a5p4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 07:43:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AH7ahkG59834768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 07:36:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63358AE053;
 Wed, 17 Nov 2021 07:43:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFC2EAE04D;
 Wed, 17 Nov 2021 07:43:39 +0000 (GMT)
Received: from [9.171.32.217] (unknown [9.171.32.217])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 07:43:39 +0000 (GMT)
Message-ID: <f82b3818-1b60-812c-6098-30aa7d434c6b@de.ibm.com>
Date: Wed, 17 Nov 2021 08:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] s390: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211109205602.99732-1-walling@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <20211109205602.99732-1-walling@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YfzLPb7LMqp56lCOnat5a7oboPpX6aES
X-Proofpoint-ORIG-GUID: JqbEnInnuLtHtkX3pTdU6EkyrqbQ5B_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111170034
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
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
Cc: Michael Roth <michael.roth@amd.com>, thuth@redhat.com, cohuck@redhat.com,
 frankja@linux.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.11.21 um 21:56 schrieb Collin Walling:
> The CPNC portion of the diag 318 data is erroneously reset during an
> initial CPU reset caused by SIGP. Let's go ahead and relocate the
> diag318_info field within the CPUS390XState struct such that it is
> only zeroed during a clear reset. This way, the CPNC will be retained
> for each VCPU in the configuration after the diag 318 instruction
> has been invoked.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>

Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>

maybe add cc stable just in case there will be one.
Can you resend with the final patch description and add Thomas as TO (not cc)
as this should probably go via Thomas tree.
> ---
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

