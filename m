Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496EB6551B3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 15:56:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8jRm-0002ep-I5; Fri, 23 Dec 2022 09:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p8jRh-0002bx-Lr
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:54:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p8jRf-0002g3-53
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:54:49 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BNEhG4U024219; Fri, 23 Dec 2022 14:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3dNGDFEIqE7bBaE1Aj8aCxgOdL1Oa9r18kinZwMND6Q=;
 b=NIXiLVYWYykLI40Rl1fxB6nkaGiDWvlX2CwbYPzbaxkFxZCCi+LAnk5v4D1kuVQPBS62
 J109wZXWVGkTeHaMElpwbZck0mf9LTfpzxRRKjVz6wYkEaQk+3vL4pdBrTFD65JTyVd6
 bEYxf2TDop9Un8QmCDHPYhYumGRkbxKzaTPIuAWFYnN+PH7W2wRoAOh/3U1wQkmDnjbX
 kVcdnI7CeHO9+JZwdXPkDKE+seyGnzVSHtpn4pQf7VUWdzIMZ65FCYEV4bp26H9RMbrX
 fGND+QWhnweiBIP/28gT2VQDkMuB7HtOLLzXcNgwBC45IS8QFH2JZE4pZIhQnrEq8cKK 7w== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mnebag88t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 14:54:45 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMLGOpK006628;
 Fri, 23 Dec 2022 14:32:43 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3mh6yxp5qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 14:32:43 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BNEWfGI40304946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Dec 2022 14:32:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F31020049;
 Fri, 23 Dec 2022 14:32:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F94720040;
 Fri, 23 Dec 2022 14:32:40 +0000 (GMT)
Received: from heavy (unknown [9.171.46.120])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 23 Dec 2022 14:32:40 +0000 (GMT)
Date: Fri, 23 Dec 2022 15:32:39 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v2 07/14] accel/tcg: Use interval tree for user-only page
 tracking
Message-ID: <20221223143239.t47nod56iu7p4xbg@heavy>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
 <20221221050313.2950701-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20221221050313.2950701-8-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xkKlLqU7pGytUyyvlEp7k4ADRRBpr41J
X-Proofpoint-GUID: xkKlLqU7pGytUyyvlEp7k4ADRRBpr41J
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_06,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212230124
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Dec 20, 2022 at 09:03:06PM -0800, Richard Henderson wrote:
> Finish weaning user-only away from PageDesc.
> 
> Using an interval tree to track page permissions means that
> we can represent very large regions efficiently.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/290
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/967
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1214
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h           |   4 +-
>  accel/tcg/tb-maint.c           |  20 +-
>  accel/tcg/user-exec.c          | 615 ++++++++++++++++++++++-----------
>  tests/tcg/multiarch/test-vma.c |  22 ++
>  4 files changed, 451 insertions(+), 210 deletions(-)
>  create mode 100644 tests/tcg/multiarch/test-vma.c

Hi,

After staring at vma-pthread.c failures for some time, I finally
spotted a few lines here that look suspicious.

<skip>

>  int page_get_flags(target_ulong address)
>  {
> -    PageDesc *p;
> +    PageFlagsNode *p = pageflags_find(address, address);
>  
> -    p = page_find(address >> TARGET_PAGE_BITS);
> -    if (!p) {
> +    /*
> +     * See util/interval-tree.c re lockless lookups: no false positives but
> +     * there are false negatives.  If we find nothing, retry with the mmap
> +     * lock acquired.
> +     */
> +    if (p) {
> +        return p->flags;
> +    }
> +    if (have_mmap_lock()) {
>          return 0;
>      }
> -    return p->flags;
> +
> +    mmap_lock();
> +    p = pageflags_find(address, address);
> +    mmap_unlock();

How does the code ensure that p is not freed here?

> +    return p ? p->flags : 0;
> +}

<skip>

>  int page_check_range(target_ulong start, target_ulong len, int flags)
>  {
> -    PageDesc *p;
> -    target_ulong end;
> -    target_ulong addr;
> -
> -    /*
> -     * This function should never be called with addresses outside the
> -     * guest address space.  If this assert fires, it probably indicates
> -     * a missing call to h2g_valid.
> -     */
> -    if (TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS) {
> -        assert(start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
> -    }
> +    target_ulong last;
>  
>      if (len == 0) {
> -        return 0;
> -    }
> -    if (start + len - 1 < start) {
> -        /* We've wrapped around.  */
> -        return -1;
> +        return 0;  /* trivial length */
>      }
>  
> -    /* must do before we loose bits in the next step */
> -    end = TARGET_PAGE_ALIGN(start + len);
> -    start = start & TARGET_PAGE_MASK;
> +    last = start + len - 1;
> +    if (last < start) {
> +        return -1; /* wrap around */
> +    }
> +
> +    while (true) {
> +        PageFlagsNode *p = pageflags_find(start, last);

We can end up here without mmap_lock if we come from the syscall code.
Do we need a retry like in page_get_flags()?
Or would it make sense to just take mmap_lock in lock_user()?

Speaking of which: does lock_user() actually guarantee that it's safe
to access the respective pages until unlock_user()? If yes, doesn't
this mean that mmap_lock must be held between the two? And if no, and
the SEGV handler is already supposed to gracefully handle SEGVs in
syscall.c, do we need to call access_ok_untagged() there at all?

> +        int missing;
>  
> -    for (addr = start, len = end - start;
> -         len != 0;
> -         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
> -        p = page_find(addr >> TARGET_PAGE_BITS);
>          if (!p) {
> -            return -1;
> +            return -1; /* entire region invalid */
>          }
> -        if (!(p->flags & PAGE_VALID)) {
> -            return -1;
> +        if (start < p->itree.start) {
> +            return -1; /* initial bytes invalid */
>          }
>  
> -        if ((flags & PAGE_READ) && !(p->flags & PAGE_READ)) {
> -            return -1;
> +        missing = flags & ~p->flags;
> +        if (missing & PAGE_READ) {
> +            return -1; /* page not readable */
>          }
> -        if (flags & PAGE_WRITE) {
> +        if (missing & PAGE_WRITE) {
>              if (!(p->flags & PAGE_WRITE_ORG)) {
> +                return -1; /* page not writable */
> +            }
> +            /* Asking about writable, but has been protected: undo. */
> +            if (!page_unprotect(start, 0)) {
>                  return -1;
>              }
> -            /* unprotect the page if it was put read-only because it
> -               contains translated code */
> -            if (!(p->flags & PAGE_WRITE)) {
> -                if (!page_unprotect(addr, 0)) {
> -                    return -1;
> -                }
> +            /* TODO: page_unprotect should take a range, not a single page. */
> +            if (last - start < TARGET_PAGE_SIZE) {
> +                return 0; /* ok */
>              }
> +            start += TARGET_PAGE_SIZE;
> +            continue;
>          }
> +
> +        if (last <= p->itree.last) {
> +            return 0; /* ok */
> +        }
> +        start = p->itree.last + 1;
>      }
> -    return 0;
>  }

<skip>

>  int page_unprotect(target_ulong address, uintptr_t pc)
>  {
> -    unsigned int prot;
> +    PageFlagsNode *p;
>      bool current_tb_invalidated;
> -    PageDesc *p;
> -    target_ulong host_start, host_end, addr;
>  
>      /*
>       * Technically this isn't safe inside a signal handler.  However we
> @@ -429,40 +627,54 @@ int page_unprotect(target_ulong address, uintptr_t pc)
>       */
>      mmap_lock();
>  
> -    p = page_find(address >> TARGET_PAGE_BITS);
> -    if (!p) {
> +    p = pageflags_find(address, address);
> +
> +    /* If this address was not really writable, nothing to do. */
> +    if (!p || !(p->flags & PAGE_WRITE_ORG)) {
>          mmap_unlock();
>          return 0;
>      }
>  
> -    /*
> -     * If the page was really writable, then we change its
> -     * protection back to writable.
> -     */
> -    if (p->flags & PAGE_WRITE_ORG) {
> -        current_tb_invalidated = false;
> -        if (p->flags & PAGE_WRITE) {
> -            /*
> -             * If the page is actually marked WRITE then assume this is because
> -             * this thread raced with another one which got here first and
> -             * set the page to PAGE_WRITE and did the TB invalidate for us.
> -             */
> +    current_tb_invalidated = false;
> +    if (p->flags & PAGE_WRITE) {
> +        /*
> +         * If the page is actually marked WRITE then assume this is because
> +         * this thread raced with another one which got here first and
> +         * set the page to PAGE_WRITE and did the TB invalidate for us.
> +         */
>  #ifdef TARGET_HAS_PRECISE_SMC
> -            TranslationBlock *current_tb = tcg_tb_lookup(pc);
> -            if (current_tb) {
> -                current_tb_invalidated = tb_cflags(current_tb) & CF_INVALID;
> -            }
> +        TranslationBlock *current_tb = tcg_tb_lookup(pc);
> +        if (current_tb) {
> +            current_tb_invalidated = tb_cflags(current_tb) & CF_INVALID;
> +        }
>  #endif
> +    } else {
> +        target_ulong start, len, i;
> +        int prot;
> +
> +        if (qemu_host_page_size <= TARGET_PAGE_SIZE) {
> +            start = address & TARGET_PAGE_MASK;
> +            len = TARGET_PAGE_SIZE;
> +            prot = p->flags | PAGE_WRITE;
> +            pageflags_set_clear(start, start + len - 1, PAGE_WRITE, 0);
> +            current_tb_invalidated = tb_invalidate_phys_page_unwind(start, pc);

When we come from page_check_range(), pc == 0 and the assertion in
tb_invalidate_phys_page_unwind() fires. Should we pass
current_cpu->cc->get_pc() to page_unprotect() instead of 0, so that
current_tb is resolved to the TB that invoked the syscall?

>          } else {
> -            host_start = address & qemu_host_page_mask;
> -            host_end = host_start + qemu_host_page_size;
> -
> +            start = address & qemu_host_page_mask;
> +            len = qemu_host_page_size;
>              prot = 0;
> -            for (addr = host_start; addr < host_end; addr += TARGET_PAGE_SIZE) {
> -                p = page_find(addr >> TARGET_PAGE_BITS);
> -                p->flags |= PAGE_WRITE;
> -                prot |= p->flags;
>  
> +            for (i = 0; i < len; i += TARGET_PAGE_SIZE) {
> +                target_ulong addr = start + i;
> +
> +                p = pageflags_find(addr, addr);
> +                if (p) {
> +                    prot |= p->flags;
> +                    if (p->flags & PAGE_WRITE_ORG) {
> +                        prot |= PAGE_WRITE;
> +                        pageflags_set_clear(addr, addr + TARGET_PAGE_SIZE - 1,
> +                                            PAGE_WRITE, 0);
> +                    }
> +                }
>                  /*
>                   * Since the content will be modified, we must invalidate
>                   * the corresponding translated code.
> @@ -470,15 +682,16 @@ int page_unprotect(target_ulong address, uintptr_t pc)
>                  current_tb_invalidated |=
>                      tb_invalidate_phys_page_unwind(addr, pc);
>              }
> -            mprotect((void *)g2h_untagged(host_start), qemu_host_page_size,
> -                     prot & PAGE_BITS);
>          }
> -        mmap_unlock();
> -        /* If current TB was invalidated return to main loop */
> -        return current_tb_invalidated ? 2 : 1;
> +        if (prot & PAGE_EXEC) {
> +            prot = (prot & ~PAGE_EXEC) | PAGE_READ;
> +        }
> +        mprotect((void *)g2h_untagged(start), len, prot & PAGE_BITS);
>      }
>      mmap_unlock();
> -    return 0;
> +
> +    /* If current TB was invalidated return to main loop */
> +    return current_tb_invalidated ? 2 : 1;
>  }

Best regards,
Ilya

