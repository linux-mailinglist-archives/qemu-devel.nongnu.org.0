Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9B558EDFB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:13:11 +0200 (CEST)
Received: from localhost ([::1]:41280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmSM-0006pY-V4
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLlhb-0004mF-HM; Wed, 10 Aug 2022 09:24:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLlhZ-0005KQ-Te; Wed, 10 Aug 2022 09:24:51 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27AD5f4E003674;
 Wed, 10 Aug 2022 13:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=sUeOSJIqeJ0jxMBXWBHvr40IsWjDoedEux0qmbIeyEE=;
 b=MU+PccAtsQtE2yqOuLNhR3ZH9hzrrS+QadPMTr77s5TwIcpEM4p88ubD9wZrlA49l500
 so5U1uSBf9x8xM0OG53PXyfTx9MYwtX3eOfMpqLJlD4rpUyDk1P9F3JXDVIT2T2a/Goz
 bsuf3A+PLmLdU42eGaN9cG6plaz5ioW6CZb5gRyUSTlQNzAuCEKHGYFNAh3UlIljX5wv
 nGT1NsIMDYYNvIQ+i5qldBRwPtd7UrVXNkxX0fV9YW75Xxi91jHBC1CrMtfGbbcbyrur
 1R/xup4lUvrPum7uxOYbQtuxg/N+dCKuX+DZMO3z9bCWc75o3INcG1cvjtrXnqktSBqw Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvd4wgu5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:24:45 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27AD6xBo017099;
 Wed, 10 Aug 2022 13:24:45 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvd4wgu3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:24:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27ADKcjW029697;
 Wed, 10 Aug 2022 13:24:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3huww0rvr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:24:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27ADKsoS17891606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Aug 2022 13:20:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14C6711C052;
 Wed, 10 Aug 2022 13:23:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B8E411C04A;
 Wed, 10 Aug 2022 13:23:24 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Aug 2022 13:23:24 +0000 (GMT)
Date: Wed, 10 Aug 2022 15:22:56 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 2/3] softmmu/physmem: Remove the ifdef __linux__ 
 around the pagesize functions
Message-ID: <20220810152256.1b155e70@p-imbrenda>
In-Reply-To: <20220810125720.3849835-3-thuth@redhat.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
 <20220810125720.3849835-3-thuth@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lmyy3f0RsztAxuuzrl-d-xn_np7t9mgZ
X-Proofpoint-ORIG-GUID: j427zmgT3l_B7Jd4XLrS71ZOzt-p4o4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100041
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

On Wed, 10 Aug 2022 14:57:19 +0200
Thomas Huth <thuth@redhat.com> wrote:

> Now that host_memory_backend_pagesize() is not depending on the hugetlb
> memory path handling anymore, we can also remove the #ifdef and the
> TOCTTOU comment from the calling functions - the code should now work
> equally well on all host architectures.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  softmmu/physmem.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index dc3c3e5f2e..50231bab30 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1331,13 +1331,6 @@ GString *ram_block_format(void)
>      return buf;
>  }
>  
> -#ifdef __linux__
> -/*
> - * FIXME TOCTTOU: this iterates over memory backends' mem-path, which
> - * may or may not name the same files / on the same filesystem now as
> - * when we actually open and map them.  Iterate over the file
> - * descriptors instead, and use qemu_fd_getpagesize().
> - */
>  static int find_min_backend_pagesize(Object *obj, void *opaque)
>  {
>      long *hpsize_min = opaque;
> @@ -1391,16 +1384,6 @@ long qemu_maxrampagesize(void)
>      object_child_foreach(memdev_root, find_max_backend_pagesize, &pagesize);
>      return pagesize;
>  }
> -#else
> -long qemu_minrampagesize(void)
> -{
> -    return qemu_real_host_page_size();
> -}
> -long qemu_maxrampagesize(void)
> -{
> -    return qemu_real_host_page_size();
> -}
> -#endif
>  
>  #ifdef CONFIG_POSIX
>  static int64_t get_file_size(int fd)


