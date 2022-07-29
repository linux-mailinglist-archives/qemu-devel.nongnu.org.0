Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F93158546C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:24:33 +0200 (CEST)
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTiy-00072k-MU
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHTgF-0002nE-OS; Fri, 29 Jul 2022 13:21:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHTgE-0003n5-5U; Fri, 29 Jul 2022 13:21:43 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26THBuWx037262;
 Fri, 29 Jul 2022 17:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7V0h3crUSe3b8vWHJCU2i1zltX6oeEODpIvCvYii/8c=;
 b=HN29/oPCXY/TDEQsoeLDJhhoKt1Md8+6LHAcmTSnTzyd3/gqJxzWcSVO3cH13PyI0kir
 qm1i8puhkaM7bJBe4ZfgebmQyALnqJnNEfJaRvs7JWUdiOanEDz0QpgWn85wS1MA099n
 53dpnuLgzQrb6p2uA8QcJ401VDfV4e4QiRxWCgdvvwXrWu3aRhQ9FLWFHYNnH7BPcWNZ
 CncIueoicHM936ugL5vya5gvwOEC+slh33Xsc+wB2tqnxvKxxzrHo4GL57bKOj+Z9or3
 RGGgEF7JkN6NQXe0CNAMqV1gEKmNRQo8OC/YfnBQaKG2jKOCnAQpI1U0c4LzCftQEYXB Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmkr0g81d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 17:21:40 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26THCPgD039786;
 Fri, 29 Jul 2022 17:21:39 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmkr0g80f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 17:21:39 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26TH62GK029161;
 Fri, 29 Jul 2022 17:21:37 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3hg96wqvy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 17:21:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26THJS7E28639670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jul 2022 17:19:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CDABA404D;
 Fri, 29 Jul 2022 17:21:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89686A4040;
 Fri, 29 Jul 2022 17:21:33 +0000 (GMT)
Received: from [9.171.5.81] (unknown [9.171.5.81])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jul 2022 17:21:33 +0000 (GMT)
Message-ID: <9bd3bbda-f6e2-4a1c-9ccb-637c0ff07500@linux.ibm.com>
Date: Fri, 29 Jul 2022 19:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 09/17] dump: Reorder struct DumpState
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-10-frankja@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <20220726092248.128336-10-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _kDRVbylfW5P_ZQYtZNRcySEflvAP6Av
X-Proofpoint-GUID: RgzmYa7WLNlyuuCr01zGKIb9g-q57ixM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-29_17,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207290074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/26/22 11:22, Janosch Frank wrote:
> Let's move ELF related members into one block and guest memory related
> ones into another to improve readability.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/sysemu/dump.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 686555f908..3937afe0f9 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -154,15 +154,8 @@ typedef struct DumpState {
>      GuestPhysBlockList guest_phys_blocks;
>      ArchDumpInfo dump_info;
>      MemoryMappingList list;
> -    uint32_t phdr_num;
> -    uint32_t shdr_num;
>      bool resume;
>      bool detached;
> -    ssize_t note_size;
> -    hwaddr shdr_offset;
> -    hwaddr phdr_offset;
> -    hwaddr section_offset;
> -    hwaddr note_offset;
>      hwaddr memory_offset;
>      int fd;
>  
> @@ -171,6 +164,15 @@ typedef struct DumpState {
>      int64_t begin;             /* Start address of the chunk we want to dump */
>      int64_t length;            /* Length of the dump we want to dump */
>  
> +    /* Elf dump related data */
> +    uint32_t phdr_num;
> +    uint32_t shdr_num;
> +    uint32_t sh_info;

Why is this ^ here?

> +    ssize_t note_size;
> +    hwaddr shdr_offset;
> +    hwaddr phdr_offset;
> +    hwaddr note_offset;
> +
>      void *elf_header;
>      void *elf_section_hdrs;
>      uint64_t elf_section_data_size;


