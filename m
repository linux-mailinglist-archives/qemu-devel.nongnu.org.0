Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257D63B76F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 02:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozplD-0000op-VZ; Mon, 28 Nov 2022 20:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ozpl5-0000oV-De; Mon, 28 Nov 2022 20:50:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ozpl3-0005PL-A0; Mon, 28 Nov 2022 20:50:03 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AT0atoM021053; Tue, 29 Nov 2022 01:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=8HjRkc3OmcoTsxOI+pYT2hFwR9IOvjRRuqELn4IMKEY=;
 b=l51B1bz8XN6l2CzhhOnBW/O/PPGTlQ1H6zQW3dKWdSKtuzUag0sVzkdP3/sQY6DprVXf
 iLu7S067Gr/pGEumwV04YT/Lk0rNT8yuXfCC1gdbdfuZ7Nn4hJmYtNBVcOZaXHqni+2z
 4ZKxBy1z2bvphsuc0aMGGwuv8tV8zZ+E411aX9F5/tBiJ+uRLrjVsWPO5Pl80UIqw0zW
 i+emoh+04zv7H6ECg2Vj33COx4HpkDUY5FWvdS/PgkHIc1ecBO5aP1G/IPCwbw7aZIkR
 lbFo0nqGouQ9LIk8iESO7pAjbsBGYps6Zy2ziA6Qh1awh/AUqHVVMNoE602pQYydhKzb cw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5303g2nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 01:49:57 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT1ZUUu005329;
 Tue, 29 Nov 2022 01:49:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3m3ae9adcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 01:49:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AT1hQaW8192716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Nov 2022 01:43:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76D0EAE04D;
 Tue, 29 Nov 2022 01:49:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A828AE045;
 Tue, 29 Nov 2022 01:49:52 +0000 (GMT)
Received: from heavy (unknown [9.171.30.50])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 29 Nov 2022 01:49:52 +0000 (GMT)
Date: Tue, 29 Nov 2022 02:49:50 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 12/26] target/s390x: Move masking of psw.addr to
 cpu_get_tb_cpu_state
Message-ID: <20221129014950.sjphj5ov2fcubuw3@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-13-richard.henderson@linaro.org>
 <20221103134213.6h2lcmwcs6hykirt@heavy>
 <a26b177e-6e5b-cc73-0b48-04b3c36eb028@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a26b177e-6e5b-cc73-0b48-04b3c36eb028@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ynZ0cYOexTpdRnRvhCk7a9RawgwjOgG-
X-Proofpoint-GUID: ynZ0cYOexTpdRnRvhCk7a9RawgwjOgG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_01,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=836 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290009
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Nov 05, 2022 at 09:27:07AM +1100, Richard Henderson wrote:
> On 11/4/22 00:42, Ilya Leoshkevich wrote:
> > On Wed, Oct 05, 2022 at 08:44:07PM -0700, Richard Henderson wrote:
> > > Masking after the fact in s390x_tr_init_disas_context
> > > provides incorrect information to tb_lookup.
> > > 
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> > >   target/s390x/cpu.h           | 13 +++++++------
> > >   target/s390x/tcg/translate.c |  6 ------
> > >   2 files changed, 7 insertions(+), 12 deletions(-)
> > 
> > How can we end up in a situation where this matters? E.g. if we are in
> > 64-bit mode and execute
> > 
> >      0xa12345678: sam31
> > 
> > we will get a specification exception, and cpu_get_tb_cpu_state() will
> > not run. And for valid 31-bit addresses masking should be a no-op.
> 
> Ah, true.  I was mislead by the presence of the code in
> s390x_tr_init_disas_context. Perhaps a tcg_debug_assert or just a comment?

An assert sounds good to me.
I tried the following diff with the attached test and it worked:

--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -390,7 +390,12 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
     }
     *pflags = flags;
     *cs_base = env->ex_value;
-    *pc = (flags & FLAG_MASK_64 ? env->psw.addr : env->psw.addr & 0x7fffffff);
+    if (!(flags & FLAG_MASK_32)) {
+        g_assert(env->psw.addr <= 0xffffff);
+    } else if (!(flags & FLAG_MASK_64)) {
+        g_assert(env->psw.addr <= 0x7fffffff);
+    }
+    *pc = env->psw.addr;
 }
 
 /* PER bits from control register 9 */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 24dc57a8816..a50453dd0d4 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6464,6 +6464,12 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
+    if (!(dc->base.tb->flags & FLAG_MASK_32)) {
+        tcg_debug_assert(dc->base.pc_first <= 0xffffff);
+    } else if (!(dc->base.tb->flags & FLAG_MASK_64)) {
+        tcg_debug_assert(dc->base.pc_first <= 0x7fffffff);
+    }
+
     dc->pc_save = dc->base.pc_first;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;

