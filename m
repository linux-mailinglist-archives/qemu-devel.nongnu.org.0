Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FAC56026C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:20:27 +0200 (CEST)
Received: from localhost ([::1]:44370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6YYM-00026u-Ps
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@linux.ibm.com>)
 id 1o6RlJ-00088g-AZ; Wed, 29 Jun 2022 03:05:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@linux.ibm.com>)
 id 1o6RlF-0003fq-VD; Wed, 29 Jun 2022 03:05:21 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25T5qvFo030850;
 Wed, 29 Jun 2022 07:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=r1lNJUGLbGMfwZNf8zirvOwUj1iy00lLTAfbwkl/EGQ=;
 b=OH4smQSY7bMz89/6xlcq8k49FXxwa00Z7LI9nl7vccT9ocudhvv93eCdSDVu5EFZkbHO
 zFyqEZhucl20U1nIU7Bs3GbGzTrnJLritBhXVYUt+UIRFYKyQgGCJVf5mOv+5Pkb5KoK
 6CRXJF2c8jzhOIZMmxHUOmpsovBwFUzOpzUd0VprHnQ56L9FQ33hPM8H+gvatcFp0gMJ
 pKUxjDWag++tQwARr3RBVs0P1xuoUHdeEKFPvzwxWvyly2bJVi85WaLc/P6Kqazby8+8
 nFHhbwqybswAcfDB4+lJ2/zmRmFi0llNPDujdNWZZbyR1cusJz9JHp/f+WdOBT/HZTe6 fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h0gyragw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 07:05:04 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25T70GPk005165;
 Wed, 29 Jun 2022 07:05:03 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h0gyragms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 07:05:03 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25T6bBU7022224;
 Wed, 29 Jun 2022 07:04:56 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3gwsmhvgr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 07:04:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 25T750oR26739006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jun 2022 07:05:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9409A4040;
 Wed, 29 Jun 2022 07:04:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A7BCA4053;
 Wed, 29 Jun 2022 07:04:52 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 29 Jun 2022 07:04:52 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Janosch Frank <frankja@linux.ibm.com>, Liam Howlett
 <liam.howlett@oracle.com>, Heiko Carstens <hca@linux.ibm.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>,
 "maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yu Zhao
 <yuzhao@google.com>, Juergen Gross <jgross@suse.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Andreas Krebbel
 <krebbel@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Thomas
 Huth <thuth@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Subject: qemu-system-s390x hang in tcg (was: Re: [PATCH v8 23/70] mm/mmap:
 change do_brk_flags() to expand existing VMA and add do_brk_munmap())
References: <20220426150616.3937571-24-Liam.Howlett@oracle.com>
 <20220428201947.GA1912192@roeck-us.net>
 <20220429003841.cx7uenepca22qbdl@revolver>
 <20220428181621.636487e753422ad0faf09bd6@linux-foundation.org>
 <20220502001358.s2azy37zcc27vgdb@revolver>
 <20220501172412.50268e7b217d0963293e7314@linux-foundation.org>
 <Ym+v4lfU5IyxkGc4@osiris> <20220502133050.kuy2kjkzv6msokeb@revolver>
 <YnAn3FI9aVCi/xKd@osiris> <YnGHJ7oroqF+v1u+@osiris>
 <20220503215520.qpaukvjq55o7qwu3@revolver>
 <60a3bc3f-5cd6-79ac-a7a8-4ecc3d7fd3db@linux.ibm.com>
 <15f5f8d6-dc92-d491-d455-dd6b22b34bc3@redhat.com>
Date: Wed, 29 Jun 2022 09:04:52 +0200
In-Reply-To: <15f5f8d6-dc92-d491-d455-dd6b22b34bc3@redhat.com> (David
 Hildenbrand's message of "Wed, 4 May 2022 20:31:22 +0200")
Message-ID: <yt9d5ykkhrvv.fsf_-_@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ym4yJ76DVMZDDr4u98frPT-tSCAfVkQk
X-Proofpoint-GUID: cEayq-0bo4ZOoqhbBbHZRxj3DbkP2nEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_11,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=849 bulkscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206290024
Received-SPF: pass client-ip=148.163.156.1; envelope-from=svens@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Jun 2022 09:53:10 -0400
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

Hi,

David Hildenbrand <david@redhat.com> writes:

> On 04.05.22 09:37, Janosch Frank wrote:
>> I had a short look yesterday and the boot usually hangs in the raid6 
>> code. Disabling vector instructions didn't make a difference but a few 
>> interruptions via GDB solve the problem for some reason.
>> 
>> CCing David and Thomas for TCG
>> 
>
> I somehow recall that KASAN was always disabled under TCG, I might be
> wrong (I thought we'd get a message early during boot that the HW
> doesn't support KASAN).
>
> I recall that raid code is a heavy user of vector instructions.
>
> How can I reproduce? Compile upstream (or -next?) with kasan support and
> run it under TCG?

I spent some time looking into this. It's usually hanging in
s390vx8_gen_syndrome(). My first thought was that it is a problem with
the VX instructions, but turned out that it hangs even if i remove all
the code from s390vx8_gen_syndrome().

Tracing the execution of TB's, i see that the generated code is always
jumping between a few TB's, but never exiting the TB's to check for
interrupts (i.e. return to cpu_tb_exec(). I only see calls to
helper_lookup_tb_ptr to lookup the tb pointer for the next TB.

The raid6 code is waiting for some time to expire by reading jiffies,
but interrupts are never processed and therefore jiffies doesn't change.
So the raid6 code hangs forever.

As a test, i made a quick change to test:

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c997c2e8e0..35819fd5a7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -319,7 +319,8 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);

     cflags = curr_cflags(cpu);
-    if (check_for_breakpoints(cpu, pc, &cflags)) {
+    if (check_for_breakpoints(cpu, pc, &cflags) ||
+        unlikely(qatomic_read(&cpu->interrupt_request))) {
         cpu_loop_exit(cpu);
     }

And that makes the problem go away. But i'm not familiar with the TCG
internals, so i can't say whether the generated code is incorrect or
something else is wrong. I have tcg log files of a failing + working run
if someone wants to take a look. They are rather large so i would have to
upload them somewhere.

