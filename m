Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD5A347A6B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:16:13 +0100 (CET)
Received: from localhost ([::1]:50480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4Iu-00052E-7y
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP4Hj-0004J6-K8; Wed, 24 Mar 2021 10:14:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP4Hh-0006PQ-9g; Wed, 24 Mar 2021 10:14:59 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OEDnOr125820; Wed, 24 Mar 2021 10:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VhYAibwvnP0uEWZfZSV6DuHcWhRvddljycU4lv67E2g=;
 b=I3dugFPqAPVGt+lMSdUOWfOf5+Iqaf8RStdfA4R66WMG6oNhR+PeI/twOpM2RpG5WWfn
 59ci3gFP181lU3BRWc1HY1upgxL4LXR5LeHStQR02Rmkdg8Qhql2iq+PLFB6vP6mIalD
 e0I+Snt7bELIVy5YL3CLzd68UbVOytLqGLFy7DG6Pw5JOGqz70i3TTJUc5Q+BHZSMiFM
 aq9pupo3UkweR+N/NKqOGQGxbyAml3o6ivtkooyA3/pxwErNM8xYYU+Ehvm9IHHO+Qu3
 AmpMnqBtHVbPtOmqm5lah+cT1Z5jtQj+RASqDsDRBFCXuAxAFInSUd2UwNGj6/csubcV Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37g70g80vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 10:14:55 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12OEEQCB127884;
 Wed, 24 Mar 2021 10:14:55 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37g70g80ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 10:14:54 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OED40S024777;
 Wed, 24 Mar 2021 14:14:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37d9bmme2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 14:14:52 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12OEEoH711403718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 14:14:50 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B92B42045;
 Wed, 24 Mar 2021 14:14:50 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B5CA42042;
 Wed, 24 Mar 2021 14:14:50 +0000 (GMT)
Received: from li-23497a81-5215-11cb-9bae-a81330ecc14b.ibm.com (unknown
 [9.171.94.33]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 14:14:50 +0000 (GMT)
Subject: Re: [PATCH 1/1] linux-user/s390x: Apply h2g to address of sigreturn
 stub
To: Laurent Vivier <laurent@vivier.eu>
References: <20210324085129.29684-1-krebbel@linux.ibm.com>
 <5070a253-cd95-59b0-dbdb-2eb549e9f61c@redhat.com>
 <b48b73ee-b27b-1e3d-3387-ce818e7b0c15@vivier.eu>
 <3d64f14f-58a4-7cc3-a069-f7ed1172d038@linux.ibm.com>
 <dfdad0d0-4b1c-d2e8-04c5-e6a2dbebe5b2@vivier.eu>
From: Andreas Krebbel <krebbel@linux.ibm.com>
Message-ID: <4fadf180-24d5-01f2-8345-14d52f098db4@linux.ibm.com>
Date: Wed, 24 Mar 2021 15:14:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dfdad0d0-4b1c-d2e8-04c5-e6a2dbebe5b2@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_10:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240107
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

On 3/24/21 2:06 PM, Laurent Vivier wrote:
> Le 24/03/2021 à 12:26, Andreas Krebbel a écrit :
>> On 3/24/21 11:28 AM, Laurent Vivier wrote:
>>> Le 24/03/2021 à 10:17, David Hildenbrand a écrit :
>>>> On 24.03.21 09:51, Andreas Krebbel wrote:
>>>>> The sigreturn SVC is put onto the stack by the emulation code.  Hence
>>>>> the address of it should not be subject to guest_base transformation
>>>>> when fetching it.
>>>>>
>>>>> The fix applies h2g to the address when writing it into the return
>>>>> address register to nullify the transformation applied to it later.
>>>>>
>>>>> Note: This only caused problems if Qemu has been built with
>>>>> --disable-pie (as it is in distros nowadays). Otherwise guest_base
>>>>> defaults to 0 hiding the actual problem.
>>>>>
>>>>> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
>>>>> ---
>>>>>   linux-user/s390x/signal.c | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
>>>>> index ecfa2a14a9..1412376958 100644
>>>>> --- a/linux-user/s390x/signal.c
>>>>> +++ b/linux-user/s390x/signal.c
>>>>> @@ -152,7 +152,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>>>>>           env->regs[14] = (unsigned long)
>>>>>                   ka->sa_restorer | PSW_ADDR_AMODE;
>>>>>       } else {
>>>>> -        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
>>>>> +        env->regs[14] = h2g(frame_addr + offsetof(sigframe, retcode))
>>>>>                           | PSW_ADDR_AMODE;
>>>
>>> Well, it really doesn't sound good as frame_addr is a guest address (and sa_restorer is too)
>>
>> I would expect the sa_restorer address to actually point into the guest code section.
> 
> yes, it does. like frame_addr. The host address is frame, see:
> 
>     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
>         goto give_sigsegv;
>     }
> 
> So frame = g2h(frame_addr)
> 
> This line put the address of the next instruction to execute (guest address space):
> 
> env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
>                         | PSW_ADDR_AMODE;
> 
> This line put at this address the NR_sigreturn syscall (but __put_user() uses host address):
> 
>         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
>                    (uint16_t *)(frame->retcode));
> 
> In theory:
> 
>     frame_addr + offsetof(sigframe, retcode) == h2g(frame->retcode)
> 
> So the next instruction executed after this function is the sigreturn() syscall.
> 
> I think the problem is elsewhere.
> 
> But I don't see what is the problem you are trying to solve.
> 
>>
>>>
>>> Where is the code that does the g2h() you want to nullify?
>>
>> That's on the code path which usually fetches instructions from memory. In cpu_lduw_code called via:
>>
>> s390x_tr_translate_insn->translate_one->extract_insn->ld_code2->cpu_lduw_code
> 
> cpu_lduw_code() takes a guest a address and needs to translate it to host address. We need the g2h()
> here because we have a guest address.
> 
>>
>>
>> Btw. Power also uses h2g while setting up the trampoline address:
>>
>> ...
>>     save_user_regs(env, mctx);
>>     encode_trampoline(TARGET_NR_rt_sigreturn, trampptr);
>>
>>     /* The kernel checks for the presence of a VDSO here.  We don't
>>        emulate a vdso, so use a sigreturn system call.  */
>>     env->lr = (target_ulong) h2g(trampptr);
>> ...
> 
> But here, it's correct because trampptr is an host address:
> 
>     trampptr = &rt_sf->trampoline[0];
> 
> Thanks,
> Laurent
> 

Unfortunately I've confused the two locations which do the trampoline setup in the discussion
setup_frame vs setup_rt_frame.

The part I actually needed to fix was in setup_rt_frame and there the fix is correct I think since
here we do use 'frame' which is the host address.

While doing that change I also stumbled upon the other location in setup_frame. There it is using
frame_addr for doing the same thing. There as you say adding h2g is wrong.

Here just the change which I think is needed:

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index ecfa2a14a9..7fba1c7999 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -213,7 +213,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
     } else {
-        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
+        env->regs[14] = (unsigned long) h2g(frame->retcode) | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    (uint16_t *)(frame->retcode));
     }


Andreas

