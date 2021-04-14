Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBA35F17D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:28:45 +0200 (CEST)
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWclI-0002d0-IP
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWcjs-000296-5h; Wed, 14 Apr 2021 06:27:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6152
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWcjn-0003wx-PB; Wed, 14 Apr 2021 06:27:14 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EA3l6C096091; Wed, 14 Apr 2021 06:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DMbIjxkYpy5R+qVHSQbeFX7P/oZrPGgyjNuAcnhP2WE=;
 b=gTo4h/575EJl11o7lKsQWin4YBR5tzhn1JUVZ6YbKkkQfhq5xp+oaBGF4ttVybOIREvt
 TELvHGn8WRebnHoW+o7HL6jpDsCrZKJ93SoN6EfUxGU0YPGUhA7H2ekHyAjYmKEBhbXx
 abF4rx/ebBoLq6kMieUEn0xDnhHZ94Hi42AkRneUj/HYf9a2+w4mZtpuujYjAznB/GRd
 R4+Q1+DMqxiEFs35gEyQiP5HN1kCQ4ktm9iZM7vYU20p5XkZCyJAAMtgv9Qd3SCagruY
 vWDdxTGlZ/OV7W7KD/8ER7m/ynnp21secNbYQK0u+8l3HhDX9lov5tOOmhPzaP8DMHH6 dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wvvy2vw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 06:27:08 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13EA53XA099942;
 Wed, 14 Apr 2021 06:27:08 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wvvy2vvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 06:27:08 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EAIwOI025746;
 Wed, 14 Apr 2021 10:27:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 37u3n89q5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 10:27:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13EAR4u863898034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 10:27:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29D54AE053;
 Wed, 14 Apr 2021 10:27:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8BDBAE045;
 Wed, 14 Apr 2021 10:27:03 +0000 (GMT)
Received: from sig-9-145-157-105.de.ibm.com (unknown [9.145.157.105])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 10:27:03 +0000 (GMT)
Message-ID: <710e154736b7e118ae12587a468a8c198cab028c.camel@linux.ibm.com>
Subject: Re: [PATCH v2] target/s390x: Fix translation exception on illegal
 instruction
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Date: Wed, 14 Apr 2021 12:27:03 +0200
In-Reply-To: <9ffa39db0e16efa173119d3b9746bb312e214d87.camel@linux.ibm.com>
References: <20210413165257.21426-1-iii@linux.ibm.com>
 <20210414103813.2595508b.cohuck@redhat.com>
 <9ffa39db0e16efa173119d3b9746bb312e214d87.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AJs9ZjUZPF7N7KUG5aF1wjsQZ9ZJfEjE
X-Proofpoint-ORIG-GUID: WAMcSr5YYIt385bY52mSjdWbEzZhkKuf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_06:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140070
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-04-14 at 11:19 +0200, Ilya Leoshkevich wrote:
> On Wed, 2021-04-14 at 10:38 +0200, Cornelia Huck wrote:
> > On Tue, 13 Apr 2021 18:52:57 +0200
> > Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> > 
> > > Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
> > > happens is:
> > > 
> > > * uretprobe maps a userspace page containing an invalid
> > > instruction.
> > > * uretprobe replaces the target function's return address with the
> > >   address of that page.
> > > * When tb_gen_code() is called on that page, tb->size ends up being
> > > 0
> > >   (because the page starts with the invalid instruction), which
> > > causes
> > >   virt_page2 to point to the previous page.
> > > * The previous page is not mapped, so this causes a spurious
> > >   translation exception.
> > > 
> > > The bug is that tb->size must never be 0: even if there is an
> > > illegal
> > > instruction, the instruction bytes that have been looked at must
> > > count
> > > towards tb->size. So adjust s390x's translate_one() to act this way
> > > for both illegal instructions and instructions that are known to
> > > generate exceptions.
> > > 
> > > Also add an assertion to tb_gen_code() in order to detect such
> > > situations in future.
> > > 
> > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > ---
> > > 
> > > v1: 
> > > https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
> > > v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size
> > > == 0
> > >           in tb_gen_code().
> > > 
> > >  accel/tcg/translate-all.c |  1 +
> > >  target/s390x/translate.c  | 16 +++++++++++-----
> > >  2 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > I assume this bug is not usually hit during normal usage, right? It's
> > probably not release critical, so I'll line it up for 6.1 instead.
> 
> Yes, I saw it only with uprobes, and then it leads only to a process
> crash, not to a kernel crash. Thanks!

Seems like the new assertion triggers on ARM:

https://gitlab.com/cohuck/qemu/-/jobs/1178409450

What are the rules in s390x-next-staging, can we amend the patch, or
only commit a follow-up? In either case, I think we'll need something
like this (untested):

--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9060,6 +9060,7 @@ static void
arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     unsigned int insn;
 
     if (arm_pre_translate_insn(dc)) {
+        dc->base.pc_next += 4;
         return;
     }


I'm currently trying to debug this in more detail and test the fix.


