Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28E58EDCE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:02:48 +0200 (CEST)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmIJ-0006F9-Cg
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLlgQ-0002ya-V7; Wed, 10 Aug 2022 09:23:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLlgN-0005Eb-2A; Wed, 10 Aug 2022 09:23:38 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27AD7t53016938;
 Wed, 10 Aug 2022 13:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=D+uzEVYXVrAwnEUa2GdgarGsoU7BSyZmpJ7ziwGJmpY=;
 b=NuCNrTn5uaZ7FJogiNwTe7wdyFa/Xo7ls+65NwTDwYQhbQiLxZI+YaeTBL5LSbzT2W1C
 lsxJOtKISQt8E7trwD1Msc8SdY6xUdcIgvSKyP96o/fGo1jTwYbp4RmdL9lYBPB1uoAB
 sYe0mHEiPXoPKziyovF2st7Y0zJ5Up5JupB2+58R9jBXarQsm5ZTkHGEOvkVFYlDZKhX
 l3DFX5SOXFGobsR9ZWEGGGCeZm5x4987svL5HS0Nyw6wsOcmQGAfRmfFqDddJxKlaXHb
 3pCHLlMboGNuXqoDcDGQBBedovctqTmE1Mzr3neN9uyRoMCMJhqpoAYRnQrd0VgqvUVD pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv6dcwu6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:23:28 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27ADAKHO029045;
 Wed, 10 Aug 2022 13:23:28 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv6dcwu52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:23:27 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27ADKJ6m009876;
 Wed, 10 Aug 2022 13:23:25 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3huww18nbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:23:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27ADNNFs29491708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Aug 2022 13:23:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF0B411C04C;
 Wed, 10 Aug 2022 13:23:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76D3B11C04A;
 Wed, 10 Aug 2022 13:23:22 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Aug 2022 13:23:22 +0000 (GMT)
Date: Wed, 10 Aug 2022 15:15:44 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 1/3] backends/hostmem: Fix support of
 memory-backend-memfd in qemu_maxrampagesize()
Message-ID: <20220810151544.60955541@p-imbrenda>
In-Reply-To: <20220810125720.3849835-2-thuth@redhat.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
 <20220810125720.3849835-2-thuth@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yLu3_Mr0PmwDhA8sG7CE9O53UCs-7k6k
X-Proofpoint-GUID: LhlUVW-nyQaWLiQdu39FOt2iXtfGinym
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 mlxlogscore=945 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100037
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

On Wed, 10 Aug 2022 14:57:18 +0200
Thomas Huth <thuth@redhat.com> wrote:

> It is currently not possible yet to use "memory-backend-memfd" on s390x
> with hugepages enabled. This problem is caused by qemu_maxrampagesize()
> not taking memory-backend-memfd objects into account yet, so the code
> in s390_memory_init() fails to enable the huge page support there via
> s390_set_max_pagesize(). Fix it by generalizing the code, so that it
> looks at qemu_ram_pagesize(memdev->mr.ram_block) instead of re-trying
> to get the information from the filesystem.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2116496
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

more removed lines than added, I like it

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  backends/hostmem.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 624bb7ecd3..4428e06738 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -306,22 +306,12 @@ bool host_memory_backend_is_mapped(HostMemoryBackend *backend)
>      return backend->is_mapped;
>  }
>  
> -#ifdef __linux__
>  size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
>  {
> -    Object *obj = OBJECT(memdev);
> -    char *path = object_property_get_str(obj, "mem-path", NULL);
> -    size_t pagesize = qemu_mempath_getpagesize(path);
> -
> -    g_free(path);
> +    size_t pagesize = qemu_ram_pagesize(memdev->mr.ram_block);
> +    g_assert(pagesize >= qemu_real_host_page_size());
>      return pagesize;
>  }
> -#else
> -size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
> -{
> -    return qemu_real_host_page_size();
> -}
> -#endif
>  
>  static void
>  host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)


