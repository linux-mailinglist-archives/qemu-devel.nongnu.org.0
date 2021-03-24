Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3862A3478E4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 13:54:15 +0100 (CET)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP31a-0000n1-5e
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 08:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP1ec-0007Ft-Fv; Wed, 24 Mar 2021 07:26:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP1eW-0008Af-Aa; Wed, 24 Mar 2021 07:26:24 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OB2v6E123397; Wed, 24 Mar 2021 07:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VwNiDdj8S9y/a6cRJfGxGG7JwH9AIVzRmjVY2K9IM4k=;
 b=aQLfgTa2bsQBbp1+YEcNhXimUV5llI7f54Kr5epyjScEBUDmIuS637Lx6dMslG5O+w8l
 S2enjCJDdPL5UExsvyk6QeJHmVHdvj04txQ3szmAfqTRWK4x0lpwTsxgEjATf6p2ZEGN
 3LonMq7zJBeqmxL102dhG+3LZy7ltoAqroMVsouklUkFb8J0qKGHHtYOhHaKJuIu+Ltl
 FwVvYtPzrNA8NwKa7GWjUB4bo+GRXDMUHq4niMviNxIx+VCoGCP11zGZd6ouV4UEPCw2
 X9Z8t7k3cDZygJljX1znqFqh1qyCAPDItYg2n7xczFYdxiafT4XMNUAz0SxKK5GInWEc lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37g0bmyq1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 07:26:17 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12OBJwNa044409;
 Wed, 24 Mar 2021 07:26:17 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37g0bmyq17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 07:26:17 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OBN4bC003224;
 Wed, 24 Mar 2021 11:26:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 37d9d8t7w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 11:26:14 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12OBPsFu28246428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 11:25:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60C174203F;
 Wed, 24 Mar 2021 11:26:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25AA242041;
 Wed, 24 Mar 2021 11:26:12 +0000 (GMT)
Received: from li-23497a81-5215-11cb-9bae-a81330ecc14b.ibm.com (unknown
 [9.171.94.33]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 11:26:12 +0000 (GMT)
Subject: Re: [PATCH 1/1] linux-user/s390x: Apply h2g to address of sigreturn
 stub
To: Laurent Vivier <laurent@vivier.eu>
References: <20210324085129.29684-1-krebbel@linux.ibm.com>
 <5070a253-cd95-59b0-dbdb-2eb549e9f61c@redhat.com>
 <b48b73ee-b27b-1e3d-3387-ce818e7b0c15@vivier.eu>
From: Andreas Krebbel <krebbel@linux.ibm.com>
Message-ID: <3d64f14f-58a4-7cc3-a069-f7ed1172d038@linux.ibm.com>
Date: Wed, 24 Mar 2021 12:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b48b73ee-b27b-1e3d-3387-ce818e7b0c15@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_08:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240085
Received-SPF: pass client-ip=148.163.156.1; envelope-from=krebbel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Mar 2021 08:50:04 -0400
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 11:28 AM, Laurent Vivier wrote:
> Le 24/03/2021 à 10:17, David Hildenbrand a écrit :
>> On 24.03.21 09:51, Andreas Krebbel wrote:
>>> The sigreturn SVC is put onto the stack by the emulation code.  Hence
>>> the address of it should not be subject to guest_base transformation
>>> when fetching it.
>>>
>>> The fix applies h2g to the address when writing it into the return
>>> address register to nullify the transformation applied to it later.
>>>
>>> Note: This only caused problems if Qemu has been built with
>>> --disable-pie (as it is in distros nowadays). Otherwise guest_base
>>> defaults to 0 hiding the actual problem.
>>>
>>> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
>>> ---
>>>   linux-user/s390x/signal.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
>>> index ecfa2a14a9..1412376958 100644
>>> --- a/linux-user/s390x/signal.c
>>> +++ b/linux-user/s390x/signal.c
>>> @@ -152,7 +152,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>>>           env->regs[14] = (unsigned long)
>>>                   ka->sa_restorer | PSW_ADDR_AMODE;
>>>       } else {
>>> -        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
>>> +        env->regs[14] = h2g(frame_addr + offsetof(sigframe, retcode))
>>>                           | PSW_ADDR_AMODE;
> 
> Well, it really doesn't sound good as frame_addr is a guest address (and sa_restorer is too)

I would expect the sa_restorer address to actually point into the guest code section.

> 
> Where is the code that does the g2h() you want to nullify?

That's on the code path which usually fetches instructions from memory. In cpu_lduw_code called via:

s390x_tr_translate_insn->translate_one->extract_insn->ld_code2->cpu_lduw_code


Btw. Power also uses h2g while setting up the trampoline address:

...
    save_user_regs(env, mctx);
    encode_trampoline(TARGET_NR_rt_sigreturn, trampptr);

    /* The kernel checks for the presence of a VDSO here.  We don't
       emulate a vdso, so use a sigreturn system call.  */
    env->lr = (target_ulong) h2g(trampptr);
...

> 
> Thanks,
> Laurent
> 

Andreas

