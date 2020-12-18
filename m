Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EE42DE05F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:25:03 +0100 (CET)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqC0T-0006DV-Mq
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kqByw-0005Tl-CQ; Fri, 18 Dec 2020 04:23:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kqBys-0002Vs-Ts; Fri, 18 Dec 2020 04:23:26 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BI9BIgv072055; Fri, 18 Dec 2020 04:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7HYqrOKKUuNiGxNUL+9oT7OQ9kNlFaBRjW1PY/5A1cA=;
 b=ip57SPpVtXmeXp+HCgfYUtAAZ58i80wqkYtxCG0ftvhlEJ2I9o4MGUD/SL5rZBM6GhYM
 Wcaql1dGthg8cfHDaYD68JGmETq5JcT9CjV0f3NVk8UTuOxKY8NnjnIa4qZlxvj8PpK3
 qXVcm8z4jPS4P6jtdJAysa61bQPPkffDHOLUzh+7AKjYBhc90530I8QVkUvv9g6f70IW
 aEQ1TDhAERBlw6IGgM+KanVsao9+M8r4ZJhy2nBBxat/PeujWUOU+1XumcKdlgeuWcD3
 2VLr9KqgDywATe5N3+FUTrk7SGYX3YGDcyuaYwt0y3P/HskqRJiStTv7heOZh5CSkpmm Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gph5d2d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 04:23:05 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BI9DYJS076288;
 Fri, 18 Dec 2020 04:23:05 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gph5d2cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 04:23:04 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BI9HmoM019439;
 Fri, 18 Dec 2020 09:23:02 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 35cng866v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 09:23:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BI9Mxlt22872474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 09:22:59 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A85BF4C040;
 Fri, 18 Dec 2020 09:22:59 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 292D44C04E;
 Fri, 18 Dec 2020 09:22:59 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.2.183])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Dec 2020 09:22:59 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] s390x/pci: fix pcistb length
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com,
 thuth@redhat.com
References: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
 <1608243397-29428-2-git-send-email-mjrosato@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <e8c475ac-32e6-69a4-7ed6-6727f64cc61f@de.ibm.com>
Date: Fri, 18 Dec 2020 10:22:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1608243397-29428-2-git-send-email-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_05:2020-12-18,
 2020-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180061
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17.12.20 23:16, Matthew Rosato wrote:
> In pcistb_service_call, we are grabbing 8 bits from a guest register to
> indicate the length of the store operation -- but per the architecture
> the length is actually defined by 13 bits of the guest register.
> 
> Fixes: 863f6f52b7 ("s390: implement pci instructions")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  hw/s390x/s390-pci-inst.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index d9e1e29..e230293 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -755,7 +755,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>      int i;
>      uint32_t fh;
>      uint8_t pcias;
> -    uint8_t len;
> +    uint16_t len;
>      uint8_t buffer[128];
>  
>      if (env->psw.mask & PSW_MASK_PSTATE) {
> @@ -765,7 +765,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>  
>      fh = env->regs[r1] >> 32;
>      pcias = (env->regs[r1] >> 16) & 0xf;
> -    len = env->regs[r1] & 0xff;
> +    len = env->regs[r1] & 0x1fff;
>      offset = env->regs[r3];
>  
>      if (!(fh & FH_MASK_ENABLE)) {
> 

