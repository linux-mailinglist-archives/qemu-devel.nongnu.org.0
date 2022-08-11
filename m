Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF358FAB1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 12:32:23 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM5UE-00007J-7V
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 06:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oM5R1-0006Hx-1Z
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 06:29:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13702
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oM5Qy-0007mF-Fs
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 06:29:02 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B9hgFt006398;
 Thu, 11 Aug 2022 10:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VKtu0iYq8YjHmWuwykGMmvsXou9LPzODANlloWopSz8=;
 b=CyOa709R/WUd+1BQSmECDbeG2dnxMwBtU6FJblEAK/ktU/BA2n7sQba2I1Ep3YF/gElv
 ZVmyTesaF+hV30GjdMCmWeI1Tk390zMIfWWyqc5sJgf2XveA7K1oataJDcDjN5Jbiny7
 YXL2S/uEzkdxWnh10+hsLpl6DvPD+jjQGPHMrrE2JGrElMVTEqwyPsB8hYrGL1Hhe4yw
 o0E6XfvysMgslZhO6OLGHWwJN+Oy+q6abp5vKiK3rIT98ENG7bcQ+XAQ6Y+/EPfHOOh2
 xswpLZ6I0F2P3Ijf+ej+jmzCfT9LHFcjMgWzG0Y8wBTd+KntwSMpzqieZnXF0wYCfOhW RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvycxhc2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 10:28:58 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B9xDDX010526;
 Thu, 11 Aug 2022 10:28:57 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvycxhc27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 10:28:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BAKSbJ023432;
 Thu, 11 Aug 2022 10:28:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3huww2hw7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 10:28:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27BAQLna33816902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 10:26:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AABCEAE051;
 Thu, 11 Aug 2022 10:28:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D377AE04D;
 Thu, 11 Aug 2022 10:28:53 +0000 (GMT)
Received: from [9.171.43.253] (unknown [9.171.43.253])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 10:28:53 +0000 (GMT)
Message-ID: <f3e78c4b63827e4f32722bc471a7cfbf5d708f15.camel@linux.ibm.com>
Subject: [PING] [PATCH v2] linux-user: Passthrough MADV_DONTNEED for certain
 file mappings
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Date: Thu, 11 Aug 2022 12:28:53 +0200
In-Reply-To: <20220725125043.43048-1-iii@linux.ibm.com>
References: <20220725125043.43048-1-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fs6NN17Lk11nu22wPe9ez2f0em0gqBE8
X-Proofpoint-GUID: OerTSzH2m_Yur-O29lFzXkiehcmiqXU5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110028
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Mon, 2022-07-25 at 14:50 +0200, Ilya Leoshkevich wrote:
> This is a follow-up for commit 892a4f6a750a ("linux-user: Add partial
> support for MADV_DONTNEED"), which added passthrough for anonymous
> mappings. File mappings can be handled in a similar manner.
> 
> In order to do that, mark pages, for which mmap() was passed through,
> with PAGE_PASSTHROUGH, and then allow madvise() passthrough for these
> pages as well.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> v1:
> https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00112.html
> v1 -> v2: Fix PAGE_PASSTHROUGH value; make checks consistent with
>           page_set_flags() (Laurent).
> 
>  include/exec/cpu-all.h |  6 ++++++
>  linux-user/mmap.c      | 25 +++++++++++++++++++++----
>  2 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index f5bda2c3ca..2d29ba13c0 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -262,6 +262,12 @@ extern const TargetPageBits target_page;
>  #define PAGE_TARGET_1  0x0200
>  #define PAGE_TARGET_2  0x0400
>  
> +/*
> + * For linux-user, indicates that the page is mapped with the same
> semantics
> + * in both guest and host.
> + */
> +#define PAGE_PASSTHROUGH 0x0800
> +
>  #if defined(CONFIG_USER_ONLY)
>  void page_dump(FILE *f);
>  
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 4e7a6be6ee..79928e3ae5 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -424,7 +424,8 @@ abi_ulong mmap_find_vma(abi_ulong start,
> abi_ulong size, abi_ulong align)
>  abi_long target_mmap(abi_ulong start, abi_ulong len, int
> target_prot,
>                       int flags, int fd, abi_ulong offset)
>  {
> -    abi_ulong ret, end, real_start, real_end, retaddr, host_offset,
> host_len;
> +    abi_ulong ret, end, real_start, real_end, retaddr, host_offset,
> host_len,
> +              passthrough_start = -1, passthrough_end = -1;
>      int page_flags, host_prot;
>  
>      mmap_lock();
> @@ -537,6 +538,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong
> len, int target_prot,
>              host_start += offset - host_offset;
>          }
>          start = h2g(host_start);
> +        passthrough_start = start;
> +        passthrough_end = start + len;
>      } else {
>          if (start & ~TARGET_PAGE_MASK) {
>              errno = EINVAL;
> @@ -619,6 +622,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong
> len, int target_prot,
>                       host_prot, flags, fd, offset1);
>              if (p == MAP_FAILED)
>                  goto fail;
> +            passthrough_start = real_start;
> +            passthrough_end = real_end;
>          }
>      }
>   the_end1:
> @@ -626,7 +631,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong
> len, int target_prot,
>          page_flags |= PAGE_ANON;
>      }
>      page_flags |= PAGE_RESET;
> -    page_set_flags(start, start + len, page_flags);
> +    if (passthrough_start == passthrough_end) {
> +        page_set_flags(start, start + len, page_flags);
> +    } else {
> +        if (start < passthrough_start) {
> +            page_set_flags(start, passthrough_start, page_flags);
> +        }
> +        page_set_flags(passthrough_start, passthrough_end,
> +                       page_flags | PAGE_PASSTHROUGH);
> +        if (passthrough_end < start + len) {
> +            page_set_flags(passthrough_end, start + len,
> page_flags);
> +        }
> +    }
>   the_end:
>      trace_target_mmap_complete(start);
>      if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
> @@ -845,7 +861,7 @@ static bool
> can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
>      }
>  
>      for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
> -        if (!(page_get_flags(addr) & PAGE_ANON)) {
> +        if (!(page_get_flags(addr) & (PAGE_ANON |
> PAGE_PASSTHROUGH))) {
>              return false;
>          }
>      }
> @@ -888,7 +904,8 @@ abi_long target_madvise(abi_ulong start,
> abi_ulong len_in, int advice)
>       *
>       * This breaks MADV_DONTNEED, completely implementing which is
> quite
>       * complicated. However, there is one low-hanging fruit: host-
> page-aligned
> -     * anonymous mappings. In this case passthrough is safe, so do
> it.
> +     * anonymous mappings or mappings that are known to have the
> same semantics
> +     * in the host and the guest. In this case passthrough is safe,
> so do it.
>       */
>      mmap_lock();
>      if ((advice & MADV_DONTNEED) &&

Hi,

I know it's quite late, but since you are going to take the aarch64
MADV_DONTNEED patch, would it be reasonable to take this one as well?

Best regards,
Ilya

