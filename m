Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD8A5BE942
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:46:05 +0200 (CEST)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaeVg-00086G-Hx
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oabF0-0005hg-T8; Tue, 20 Sep 2022 07:16:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oabEy-0005lo-8Y; Tue, 20 Sep 2022 07:16:38 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KAwV0R025718;
 Tue, 20 Sep 2022 11:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=moLjvNTswJAw2yUdvre8SEjGe6n2rGy+BLHrL5/oSmk=;
 b=aL0oy6S/np/+E+JQg4txUyXjF58mwd+8Vq42LkGAkSBHMxKmEIuzUmYbQJ3gembL5Rq3
 IqIkQGkrFKJo7Lpg6uIWeUOGoUL4tf47gCLMbAdVMYCqWZOnYRJ+X8EcOwHeZwwNsj9f
 +HnIAtMsVvR9siOqSfaEnDBFxYezUsIUb1AVMBpPXxW/pQAcrtkjx0n0nHbMLnmQgvRy
 Mnt2o7Fto9CRjIhdDuvzQDzWa4j9NMQBFExHi6hCkuu9vYLm2zIZ7C6+3AooJxeH4V/B
 0Mz4IkOMFcPqKpkF7KSnosGZ3pWoSVbxQ7Ex86lcYXeRQc0xjJ8mj9wc74xM2N1L9Hvw YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqc8212k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 11:16:32 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KB0VFq000538;
 Tue, 20 Sep 2022 11:16:31 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqc8212hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 11:16:31 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28KB8wDK002404;
 Tue, 20 Sep 2022 11:16:29 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3jn5v8trvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 11:16:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28KBGRBe19988808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 11:16:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3467AE056;
 Tue, 20 Sep 2022 11:16:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61933AE04D;
 Tue, 20 Sep 2022 11:16:26 +0000 (GMT)
Received: from [9.171.67.151] (unknown [9.171.67.151])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Sep 2022 11:16:26 +0000 (GMT)
Message-ID: <64b4a1748f5f65a90117ddd5f32a4b00b87d208b.camel@linux.ibm.com>
Subject: Re: [PULL v3 00/20] tcg patch queue
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: stefanha@gmail.com, qemu-s390x <qemu-s390x@nongnu.org>
Date: Tue, 20 Sep 2022 13:16:25 +0200
In-Reply-To: <d64c7c75-8393-19ad-0ce1-950624ba01c3@redhat.com>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
 <d64c7c75-8393-19ad-0ce1-950624ba01c3@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rmXJzpvUwP9YQZIxd7NxEmCcLG5eHPoV
X-Proofpoint-ORIG-GUID: 8pCpOiJuIJ2cghAoEzl-KO0geU9WmdTZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_02,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209200064
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-09-20 at 12:27 +0200, Thomas Huth wrote:
> On 06/09/2022 10.37, Richard Henderson wrote:
> > v2: Fix incorretly resolved rebase conflict in patch 16.
> > v3: Work around clang preprocessor bug in patch 3.
> > 
> > 
> > r~
> > 
> > 
> > The following changes since commit
> > fd28528ece590dc709d1a893fce2ff2f68ddca70:
> > 
> >    Merge tag 'pull-or1k-20220904' of
> > https://github.com/stffrdhrn/qemu into staging (2022-09-05 18:01:02
> > -0400)
> > 
> > are available in the Git repository at:
> > 
> >    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220906
> > 
> > for you to fetch changes up to
> > 00c07344fa245b22e895b363320ba4cd0ec1088a:
> > 
> >    target/riscv: Make translator stop before the end of a page
> > (2022-09-06 08:04:26 +0100)
> > 
> > ----------------------------------------------------------------
> > Respect PROT_EXEC in user-only mode.
> > Fix s390x, i386 and riscv for translations crossing a page.
> > 
> > ----------------------------------------------------------------
> > Ilya Leoshkevich (4):
> >        linux-user: Clear translations on mprotect()
> >        accel/tcg: Introduce is_same_page()
> >        target/s390x: Make translator stop before the end of a page
> >        target/i386: Make translator stop before the end of a page
> > 
> > Richard Henderson (16):
> >        linux-user/arm: Mark the commpage executable
> >        linux-user/hppa: Allocate page zero as a commpage
> >        linux-user/x86_64: Allocate vsyscall page as a commpage
> >        linux-user: Honor PT_GNU_STACK
> >        tests/tcg/i386: Move smc_code2 to an executable section
> >        accel/tcg: Properly implement get_page_addr_code for user-
> > only
> >        accel/tcg: Unlock mmap_lock after longjmp
> >        accel/tcg: Make tb_htable_lookup static
> >        accel/tcg: Move qemu_ram_addr_from_host_nofail to physmem.c
> >        accel/tcg: Use probe_access_internal for softmmu
> > get_page_addr_code_hostp
> >        accel/tcg: Document the faulting lookup in tb_lookup_cmp
> >        accel/tcg: Remove translator_ldsw
> >        accel/tcg: Add pc and host_pc params to
> > gen_intermediate_code
> >        accel/tcg: Add fast path for translator_ld*
> >        target/riscv: Add MAX_INSN_LEN and insn_len
> >        target/riscv: Make translator stop before the end of a page
> 
>   Hi Richard!
> 
> Since your pull request has been merged, the Travis CI now constantly
> shows 
> a failure, see:
> 
>   https://app.travis-ci.com/gitlab/qemu-project/qemu/builds/255231855
> 
> The previous runs were all green, so I assume this has been
> introduced by 
> one of the patches in here. Could you please have a look?
> 
>   Thanks,
>    Thomas
> 

The reason seems to be that vstl instruction (used by libc's memcpy)
is not treated as a write for purposes of self-modifying-code
detection. This causes qemu to incorrectly forward SEGV to the guest
program.

I will prepare a patch.

