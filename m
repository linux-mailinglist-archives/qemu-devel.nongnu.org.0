Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD96DC8BA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 17:47:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pltiy-0005SJ-SV; Mon, 10 Apr 2023 11:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pltix-0005S9-7Q
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:46:31 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pltiv-0003B2-2Y
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:46:30 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33ACjvAw003211; Mon, 10 Apr 2023 15:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=kexfzPCu/mIbhi14BXzDFpgVXAZerqYoD2zEbcJHNSw=;
 b=qorrzqjS/1KX1faLGgrzc9OD7JEBMDkhtqfp8IAH1N+gTUL0Tz0cohFy7LJTDcSdazO5
 wqEl7fec2XTXZShK6+XHEpifiF/nQcJEhPzbNCfaInp8YetJ5iXEwCntbtgmjuQ2dtLg
 qiF8pRzqDgXkyP0qQsk7zbVjDfYJ1cZvPYb21lTvxqAIWNGI+hUc5TqMSIwgeQV7ws+h
 ffG+esBQWvcHSHM9OBmjU9u3Zwkx5UDO2yk+iHy2YxpC9rrndASzqf45IGnY8wT1Ifgb
 6h2ntc5nM/wqmH+4aXX+EMT68q48qHlq4wC1NAps9IeuBtsteM00Z5j7x0nBsjrit47J DQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0hc350f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Apr 2023 15:46:25 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33AENPNw038384; Mon, 10 Apr 2023 15:46:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3puw854m73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Apr 2023 15:46:24 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33AFkNh1021871;
 Mon, 10 Apr 2023 15:46:23 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3puw854m6f-1; Mon, 10 Apr 2023 15:46:23 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH] util/mmap: optimize qemu_ram_mmap() alignment
Date: Mon, 10 Apr 2023 08:46:23 -0700
Message-Id: <1681141583-87816-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_11,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100134
X-Proofpoint-GUID: dyCYF51uHFB8HwjIq6skQxdrcl_yzYde
X-Proofpoint-ORIG-GUID: dyCYF51uHFB8HwjIq6skQxdrcl_yzYde
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Guest RAM created with memory-backend-memfd is aligned to a
QEMU_VMALLOC_ALIGN=2M boundary, and memory-backend-memfd does not support
the "align" parameter to change the default.  This is sub-optimal on
aarch64 kernels with a 64 KB page size and 512 MB huge page size, as the
range will not be backed by huge pages.  Moreover, any shared allocation
using qemu_ram_mmap() will be sub-optimal on such a system if the align
parameter is less than 512 MB.

The kernel is smart enough to return a hugely aligned pointer for MAP_SHARED
mappings when /sys/kernel/mm/transparent_hugepage/shmem_enabled allows it.
However, the qemu function qemu_ram_mmap() mmap's twice to perform its own
alignment:

    guardptr = mmap(0, total, PROT_NONE, flags, ...
    flags |= shared ? MAP_SHARED : MAP_PRIVATE;
    ptr = mmap(guardptr + offset, size, prot, flags | map_sync_flags, ...

On the first call, flags has MAP_PRIVATE, hence the kernel does not apply
its shared memory policy, and returns a non-huge-aligned guardptr.

To fix, for shared mappings, pass MAP_SHARED to both mmap calls.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
---
 util/mmap-alloc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5ed7d29..37a0d1e 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -121,7 +121,7 @@ static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
  * Reserve a new memory region of the requested size to be used for mapping
  * from the given fd (if any).
  */
-static void *mmap_reserve(size_t size, int fd)
+static void *mmap_reserve(size_t size, int fd, int final_flags)
 {
     int flags = MAP_PRIVATE;
 
@@ -144,6 +144,7 @@ static void *mmap_reserve(size_t size, int fd)
 #else
     fd = -1;
     flags |= MAP_ANONYMOUS;
+    flags |= final_flags & MAP_SHARED;
 #endif
 
     return mmap(0, size, PROT_NONE, flags, fd, 0);
@@ -232,7 +233,7 @@ void *qemu_ram_mmap(int fd,
      */
     total = size + align;
 
-    guardptr = mmap_reserve(total, fd);
+    guardptr = mmap_reserve(total, fd, qemu_map_flags);
     if (guardptr == MAP_FAILED) {
         return MAP_FAILED;
     }
-- 
1.8.3.1


