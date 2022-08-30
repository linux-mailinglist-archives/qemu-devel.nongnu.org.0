Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0165A71BC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 01:20:06 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTAWb-0001oc-Ve
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 19:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oTAUg-0000M1-HD
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 19:18:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oTAUe-0007Sp-LU
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 19:18:06 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UMohfG024045;
 Tue, 30 Aug 2022 23:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=QvakRvPVxvB8Yo4WEaXfNSCzHfQwvHGaBg8tWdpEnTk=;
 b=i0Vd6mSM/NNHPzjN+w0IV9/ggr7aIIK3e13Em08CQadq5t28gJQfZ0Ou3y3NJHOfL3ZK
 UcURzUgF3L1uz0MRPIGBvPU4iO1opihMZIc+KYgl83equnaLlgvH4SAV/orrE/5PjK8H
 UjtbSwErYyFOpmyKsdshQQZgKbL6tUqCe/1rAiO7vy4q/J6sl6S+cO9TBa/apamvYk6S
 i2JS6SQvBxmA/O0XhwZiWm3cuO1wjpyEV8Z53Sibh3n+rDCiSSE6L4HQtFtmCmQQXctA
 2swRoyJPbFyLcttuEMIhU1qdves1L/LeNpeHvS6VoGjUS1ozPRPDGYoyY/+QBA3bvNUM YQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9upxrjsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 23:18:01 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27UN6N2J032008;
 Tue, 30 Aug 2022 23:17:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3j7ahhu6h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 23:17:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27UNHuAb38076730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Aug 2022 23:17:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AD954C04A;
 Tue, 30 Aug 2022 23:17:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38C364C040;
 Tue, 30 Aug 2022 23:17:56 +0000 (GMT)
Received: from [9.171.5.135] (unknown [9.171.5.135])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Aug 2022 23:17:56 +0000 (GMT)
Message-ID: <570c2b334e7ad5a44bf8c163d82e5bac116e0f0e.camel@linux.ibm.com>
Subject: Re: [PATCH v7 05/20] linux-user: Clear translations and
 tb_jmp_cache on mprotect()
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
Date: Wed, 31 Aug 2022 01:17:56 +0200
In-Reply-To: <20220823220542.1993395-6-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
 <20220823220542.1993395-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ISFBsxZwAhFtT-_b91DzKkj4w_tHkGQX
X-Proofpoint-ORIG-GUID: ISFBsxZwAhFtT-_b91DzKkj4w_tHkGQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_12,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=984 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300104
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 2022-08-23 at 15:05 -0700, Richard Henderson wrote:
> From: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> Currently it's possible to execute pages that do not have PAGE_EXEC
> if there is an existing translation block. Fix by clearing
> tb_jmp_cache
> and invalidating TBs, which forces recheck of permission bits.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20220817150506.592862-2-iii@linux.ibm.com>
> [rth: Invalidate is required -- e.g. riscv fallthrough cross test]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> fixup mprotect
> ---
>  linux-user/mmap.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 048c4135af..e9dc8848be 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -115,6 +115,7 @@ int target_mprotect(abi_ulong start, abi_ulong
> len, int target_prot)
>  {
>      abi_ulong end, host_start, host_end, addr;
>      int prot1, ret, page_flags, host_prot;
> +    CPUState *cpu;
>  
>      trace_target_mprotect(start, len, target_prot);
>  
> @@ -177,7 +178,14 @@ int target_mprotect(abi_ulong start, abi_ulong
> len, int target_prot)
>              goto error;
>          }
>      }
> +
>      page_set_flags(start, start + len, page_flags);
> +    tb_invalidate_phys_range(start, start + len);
> +
> +    CPU_FOREACH(cpu) {
> +        cpu_tb_jmp_cache_clear(cpu);
> +    }
> +
>      mmap_unlock();
>      return 0;
>  error:

I think adding tb_invalidate_phys_range() obviates the need for
cpu_tb_jmp_cache_clear()? The lookup may still find an invalidated tb,
but it will have CF_INVALID set.

The following worked for me:

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index e9dc8848bed..b58e3eeb198 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -115,7 +115,6 @@ int target_mprotect(abi_ulong start, abi_ulong len,
int target_prot)
 {
     abi_ulong end, host_start, host_end, addr;
     int prot1, ret, page_flags, host_prot;
-    CPUState *cpu;
 
     trace_target_mprotect(start, len, target_prot);
 
@@ -182,10 +181,6 @@ int target_mprotect(abi_ulong start, abi_ulong
len, int target_prot)
     page_set_flags(start, start + len, page_flags);
     tb_invalidate_phys_range(start, start + len);
 
-    CPU_FOREACH(cpu) {
-        cpu_tb_jmp_cache_clear(cpu);
-    }
-
     mmap_unlock();
     return 0;
 error:


