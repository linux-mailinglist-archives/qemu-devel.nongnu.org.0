Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4059E360811
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 13:16:18 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzyp-0002dT-5t
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 07:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWzxM-00020q-AI; Thu, 15 Apr 2021 07:14:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWzxK-0003Zg-Go; Thu, 15 Apr 2021 07:14:44 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FB3Bm5101100; Thu, 15 Apr 2021 07:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=k/erTxZI1F3EGWYBP9qe/S7ThYMd4KXyp7ZvOd7KNow=;
 b=Xw9OnjFdmMXoks5ZSVP0ZdwfLB1kQQ3fgVAS+DuxPlDO8t2WaxLCHQwAepO/Vn57jNe9
 pxn57lIZ1TtQGGsoeATGDF5Fb9U+L3A84gRoMLJVXykLpPY7VksmwJzO7/HkGt5uegHI
 zd9bh9x0K1mev/ACtXNsoS3mmYHCMvoVDgKVqQSB2pOoLiBoQMcM+txiRSv8tBAz/53A
 CMC/u5jQ4Yi99bbvjezPi9BmlucM7+PR4EyhsP0+RaCRdyURxr9scsA4oOzd3tKSkRiG
 lC3tlddjT61M28PMtkjyJDkAkToOKg1ib4t94jX8TIjWveRWv8dsP7vi/fFfO9nzTtga bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x46uyga2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 07:14:39 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FB3ocv102741;
 Thu, 15 Apr 2021 07:14:39 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x46uyg9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 07:14:39 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FBDVWU027964;
 Thu, 15 Apr 2021 11:14:37 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8bu4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 11:14:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FBEYPl25887148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 11:14:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB264A4065;
 Thu, 15 Apr 2021 11:14:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37BA9A4060;
 Thu, 15 Apr 2021 11:14:34 +0000 (GMT)
Received: from sig-9-145-157-105.de.ibm.com (unknown [9.145.157.105])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 11:14:34 +0000 (GMT)
Message-ID: <1a2533171ad48714c37b43c5df63bec3215ba69a.camel@linux.ibm.com>
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Max Filippov <jcmvbkbc@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>
Date: Thu, 15 Apr 2021 13:14:33 +0200
In-Reply-To: <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
 <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
 <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
 <cfae4bbd-3068-41f6-ec38-a27cf7381fee@linaro.org>
 <CAMo8BfJNcfAp_tJWHQziUQXxR8WykLcBGTKnHeWS=TtLYwTC=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jAQvVn17LHuO0RT-OERXR0V9TX8pqf5C
X-Proofpoint-ORIG-GUID: SSJmAiw2f5F6crWsfDUudz0mm4wonIYg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104150072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-04-14 at 18:23 -0700, Max Filippov wrote:
> On Wed, Apr 14, 2021 at 12:43 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> > 
> > On 4/14/21 11:03 AM, Max Filippov wrote:
> > > On Wed, Apr 14, 2021 at 9:51 AM Ilya Leoshkevich <
> > > iii@linux.ibm.com> wrote:
> > > > On Wed, 2021-04-14 at 16:48 +0200, David Hildenbrand wrote:
> > > > > Did you double-check the xtensa issue?
> > > > 
> > > > Oh, I'm sorry, I completely forgot about that one. I just ran the
> > > > test locally, and apparently it fails because of this new assert,
> > > > so
> > > > I'll have to write the 4th patch now. Thanks!
> > > 
> > > Just curious, what xtensa issue?
> > 
> > Returning from xtensa_tr_translate_insn with tb->size == 0.
> > 
> > Basically, dc->base.pc_next needs to be incremented even for illegal
> > instructions, preferably by the number of bytes consumed while
> > determining that
> > the insn is illegal.
> 
> I see a few places where target/xtensa may do that. E.g. it does that
> on entry
> to an exception handler to allow for debugging its first instruction.
> No guest code
> is consumed to make this decision, would size 1 work in that case?
> I'll take a look.

Returning 1 was my idea as well. Here is what seems to fix the failure
and what I'm currently testing locally:

--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -917,6 +917,8 @@ static void disas_xtensa_insn(CPUXtensaState *env,
DisasContext *dc)
                       "unknown instruction length (pc = %08x)\n",
                       dc->pc);
         gen_exception_cause(dc, ILLEGAL_INSTRUCTION_CAUSE);
+        dc->base.pc_next = dc->pc + 1;
+        dc->base.is_jmp = DISAS_NORETURN;
         return;
     }
 
@@ -1274,11 +1276,13 @@ static void
xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if ((tb_cflags(dc->base.tb) & CF_USE_ICOUNT)
         && (dc->base.tb->flags & XTENSA_TBFLAG_YIELD)) {
         gen_exception(dc, EXCP_YIELD);
+        dc->base.pc_next = dc->pc + 1;
         dc->base.is_jmp = DISAS_NORETURN;
         return;
     }
     if (dc->base.tb->flags & XTENSA_TBFLAG_EXCEPTION) {
         gen_exception(dc, EXCP_DEBUG);
+        dc->base.pc_next = dc->pc + 1;
         dc->base.is_jmp = DISAS_NORETURN;
         return;
     }



