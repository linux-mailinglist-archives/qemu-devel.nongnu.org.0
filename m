Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A73459F44
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 10:30:16 +0100 (CET)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpS7y-0000cL-Nt
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 04:30:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mpS6t-0008Hc-3r; Tue, 23 Nov 2021 04:29:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mpS6q-00008V-9k; Tue, 23 Nov 2021 04:29:06 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AN9HaK6012350; 
 Tue, 23 Nov 2021 09:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BYzPSo1eSbv/2r06L/yNu73K8ugAK0dHjs+2rCY16d0=;
 b=hzTltJ4ZD54BfY6zDq9TR+nGxFQgUGcFiZVgZNp/b1CTY29NsJfFs36ty7VVNOanzwSi
 YZNI3j89mKpeIgAiwrh9PJoF/UIgqFGjBQS6mRBWljdqIHHeE/uPKTHMX+mFYZHlW85H
 U59qGL1Kp95/jRQ9saV1ixxIeY0/3hglKtaydjWfEh9KgirsOr7h6+BtdRQs0u1dNVyH
 JrfU9K4eMqFCyI2pO+6aYGEQgxKEhS9Om0vP2NjDZkkFjPIymG/OCcbSOtqhA3HjCppb
 WGl7+Qm3A3+8qFT9Q8sNoNEcn1/BHQB1VeD9W/uo7eb/yCCBLthypaJ7wwIuvtWgucdE 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgwhhg5e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 09:29:01 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AN9OjCF018618;
 Tue, 23 Nov 2021 09:29:01 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgwhhg5dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 09:29:01 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AN9GsSb008124;
 Tue, 23 Nov 2021 09:28:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3cern9wwfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 09:28:58 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AN9Lkuc54526214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 09:21:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 713A24204B;
 Tue, 23 Nov 2021 09:28:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CEF942045;
 Tue, 23 Nov 2021 09:28:54 +0000 (GMT)
Received: from [9.171.17.161] (unknown [9.171.17.161])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Nov 2021 09:28:53 +0000 (GMT)
Message-ID: <f3effe3a-b164-0ce1-aea4-55cde62c2295@de.ibm.com>
Date: Tue, 23 Nov 2021 10:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] s390: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, thuth@redhat.com, qemu-stable@nongnu.org
References: <20211117152303.627969-1-walling@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <20211117152303.627969-1-walling@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w2L0mTV_IecEzjBppJxEgxB0FEUqhgYa
X-Proofpoint-ORIG-GUID: YkD19F3N394gA1G5fDYxlRsGj9AjLYTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_03,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230044
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
Cc: cohuck@redhat.com, frankja@linux.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.11.21 um 16:23 schrieb Collin Walling:
> The CPNC portion of the diag318 data is erroneously reset during an
> initial CPU reset caused by SIGP. Let's go ahead and relocate the
> diag318_info field within the CPUS390XState struct such that it is
> only zeroed during a clear reset. This way, the CPNC will be retained
> for each VCPU in the configuration after the diag318 instruction
> has been invoked.
> 
> The s390_machine_reset code already takes care of zeroing the diag318
> data on VM resets, which also cover resets caused by diag308.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>

Thomas, I think this is good to go. Will you take it via your tree?

> ---
> 
> Changelog:
> 
>      v4
>      - fixed up commit message and added r-b's
> 
>      v3
>      - reverted changes from previous versions
>      - simply relocate diag318_info in CPU State struct
>      - add comment in set_diag318 to explain resets
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

