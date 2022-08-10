Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6642858EDA8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:55:38 +0200 (CEST)
Received: from localhost ([::1]:42410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmBN-0004F0-34
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLlgQ-0002yZ-SN; Wed, 10 Aug 2022 09:23:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLlgO-0005Eo-SH; Wed, 10 Aug 2022 09:23:38 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27AD6v0g022737;
 Wed, 10 Aug 2022 13:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=pzKiDEfVnCvWJpj5fTYsbDYxLVG9YTPodbO7y4eECqE=;
 b=SJweF0+l7EXz4DHcJew9doe+Z/bHStjIWARlqtEmwJDnubF8afbuJemjetIE98+5N+wx
 UvGuFgUv745HqiUggqX9zMoPbgOdKSdzs7dTxjV7mqbUmJMFm05E0EiIW1H8IjhYRXZv
 VgBrr3WPc+QY1e958NhR9RU9LEjm2npquRsxmmFi5uCLdrkXTPWlfuIL+1kvv/s4HY7R
 cOQqQ1DOH4kBYtW4OoIu6oaVgmnysi5iBxCbjQBspMt5irw+W1/kKn9tgrKjmORRokIx
 hLkC3Z18GRfxX63sfWlEHSf/Rk2m1VhPI03zwSr7taP3LtNr5rs3pob1UMspsfZS3jSq Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv452g7rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:23:32 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27ADIKQL013884;
 Wed, 10 Aug 2022 13:23:31 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv452g7qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:23:31 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27ADKDbQ029269;
 Wed, 10 Aug 2022 13:23:29 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3huww0rvpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:23:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27ADNRas14746000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Aug 2022 13:23:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58EC311C04A;
 Wed, 10 Aug 2022 13:23:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3CFA11C04C;
 Wed, 10 Aug 2022 13:23:26 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Aug 2022 13:23:26 +0000 (GMT)
Date: Wed, 10 Aug 2022 15:16:53 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 3/3] util/mmap-alloc: Remove qemu_mempath_getpagesize()
Message-ID: <20220810151653.0bdef552@p-imbrenda>
In-Reply-To: <20220810125720.3849835-4-thuth@redhat.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
 <20220810125720.3849835-4-thuth@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9TvcoDvHDU4QnaooOtYlWF6jKrJ-bzy3
X-Proofpoint-GUID: 40iTqbs34PNM6G1gqIgcCzYAq8VrnRpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100038
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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

On Wed, 10 Aug 2022 14:57:20 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The last user of this function has just been removed, so we can
> drop this function now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  include/qemu/mmap-alloc.h |  2 --
>  util/mmap-alloc.c         | 31 -------------------------------
>  2 files changed, 33 deletions(-)
> 
> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
> index 5076695cc8..2825e231a7 100644
> --- a/include/qemu/mmap-alloc.h
> +++ b/include/qemu/mmap-alloc.h
> @@ -4,8 +4,6 @@
>  
>  size_t qemu_fd_getpagesize(int fd);
>  
> -size_t qemu_mempath_getpagesize(const char *mem_path);
> -
>  /**
>   * qemu_ram_mmap: mmap anonymous memory, the specified file or device.
>   *
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 5b90cb68ea..5ed7d29183 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -53,37 +53,6 @@ size_t qemu_fd_getpagesize(int fd)
>      return qemu_real_host_page_size();
>  }
>  
> -size_t qemu_mempath_getpagesize(const char *mem_path)
> -{
> -#ifdef CONFIG_LINUX
> -    struct statfs fs;
> -    int ret;
> -
> -    if (mem_path) {
> -        do {
> -            ret = statfs(mem_path, &fs);
> -        } while (ret != 0 && errno == EINTR);
> -
> -        if (ret != 0) {
> -            fprintf(stderr, "Couldn't statfs() memory path: %s\n",
> -                    strerror(errno));
> -            exit(1);
> -        }
> -
> -        if (fs.f_type == HUGETLBFS_MAGIC) {
> -            /* It's hugepage, return the huge page size */
> -            return fs.f_bsize;
> -        }
> -    }
> -#ifdef __sparc__
> -    /* SPARC Linux needs greater alignment than the pagesize */
> -    return QEMU_VMALLOC_ALIGN;
> -#endif
> -#endif
> -
> -    return qemu_real_host_page_size();
> -}
> -
>  #define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
>  static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
>  {


