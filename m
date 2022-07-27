Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4D5824D9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:53:12 +0200 (CEST)
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGef8-0006QG-NY
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oGebL-0003pj-Re; Wed, 27 Jul 2022 06:49:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oGebG-00088C-Gk; Wed, 27 Jul 2022 06:49:15 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RAXNii014052;
 Wed, 27 Jul 2022 10:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uISj3N+DAT1AZZhP2PznKMp6ecrbb109/lE2dIJF72A=;
 b=nDpI5+tgKsQ6fWLkv/Bbo7dbWkR68FuUimrHM1XKhAm1Fj3GNotj3XwA7bH39hgBEaLK
 DMCeD35nj/IYi/YbTWJLoNpQd6gUWxmywkDPaVHQFR9J7bU6whl0DRgupWWhYB1QkOgt
 J/gjXCNvAdIGC+5UDOYkuDEicOpRwDj1agE4roqEvXouoUAaeTreshNnx1rjlm2XhHzB
 fp+jIumyYRQSEqhRybhZxLqj/YeM/fG8rNtdHNoJ1cZEF+gTbAh5H16+Kq2QozIaTT5F
 frxdDqXP1oyxN6c7iHTH+Lu3jWZz6rhLaW1pqqzH0NiboIvTt+t1Fs2wyYsYE7suBs5w tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk3q68cu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 10:49:06 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RAY1WQ015734;
 Wed, 27 Jul 2022 10:49:06 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk3q68cte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 10:49:06 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RAc9LO003296;
 Wed, 27 Jul 2022 10:49:04 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3hg95ybr1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 10:49:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RAn15T25362930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 10:49:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6402542041;
 Wed, 27 Jul 2022 10:49:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E291C42042;
 Wed, 27 Jul 2022 10:49:00 +0000 (GMT)
Received: from [9.171.91.219] (unknown [9.171.91.219])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 10:49:00 +0000 (GMT)
Message-ID: <81d44cab-4b95-f072-84b3-64e937af19ed@linux.ibm.com>
Date: Wed, 27 Jul 2022 12:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Subject: Re: [PATCH v4 02/17] dump: Introduce GuestPhysBlock offset and length
 filter functions
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-3-frankja@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20220726092248.128336-3-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gZStRU-UofFhKHvbU8oNETemKB--zL_b
X-Proofpoint-GUID: OOdx2bQ6il-vovI6u0A76b1w0N1hwwDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_01,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207270041
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
> The iteration over the memblocks is hard to understand so it's about
> time to clean it up. Instead of manually grabbing the next memblock we
> can use QTAILQ_FOREACH to iterate over all memblocks.

This got out of sync with the patch, didn't it?
With that addressed:
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
See minor stuff below.
> 
> Additionally we move the calculation of the offset and length out by
> using the dump_get_memblock_*() functions.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 37 +++++++++++++++++++++++++++++++++++++
>  include/sysemu/dump.h |  5 +++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 0ed7cf9c7b..0fd7c76c1e 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -591,6 +591,43 @@ static void dump_begin(DumpState *s, Error **errp)
>      write_elf_notes(s, errp);
>  }
>  
> +int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t filter_area_start,
> +                               int64_t filter_area_length)> +{
> +    int64_t size, left, right;

I assume the int64_t everywhere are because DumpState.begin and .length are int64_t,
which is itself because the numbers are coming from a command?
There isn't any reason to have negative numbers for that command, is there?
Since the block->target_* are unsigned we'd get problems with negative numbers.
Ideally the the values should be checked up the stack and unsigned used in this function, IMO,
but it's not a big deal either.

> +
> +    /* No filter, return full size */
> +    if (!filter_area_length) {
> +        return block->target_end - block->target_start;
> +    }
> +
> +    /* calculate the overlapped region. */
> +    left = MAX(filter_area_start, block->target_start);
> +    right = MIN(filter_area_start + filter_area_length, block->target_end);
> +    size = right - left;
> +    size = size > 0 ? size : 0;
> +
> +    return size;
> +}
> +
> +int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start,
> +                                int64_t filter_area_length)
> +{
> +    if (filter_area_length) {
> +        /* return -1 if the block is not within filter area */
> +        if (block->target_start >= filter_area_start + filter_area_length ||
> +            block->target_end <= filter_area_start) {
> +            return -1;
> +        }
> +
> +        if (filter_area_start > block->target_start) {
> +            return filter_area_start - block->target_start;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static int get_next_block(DumpState *s, GuestPhysBlock *block)
>  {
>      while (1) {
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index ffc2ea1072..6ce3c24197 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -203,4 +203,9 @@ typedef struct DumpState {
>  uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
>  uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
>  uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
> +
> +int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t filter_area_start,
> +                               int64_t filter_area_length);
> +int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start,
> +                                int64_t filter_area_length);

I don't love the names of the functions, maybe dump_filtered_block_size, dump_filtered_block_offset?

>  #endif


