Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A6583239
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:43:02 +0200 (CEST)
Received: from localhost ([::1]:48192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlzp-0006Eo-Hg
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oGlwV-0002xR-H8; Wed, 27 Jul 2022 14:39:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oGlwT-0000lh-Eo; Wed, 27 Jul 2022 14:39:35 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHqr3q005279;
 Wed, 27 Jul 2022 18:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Eowh/M3xA6K621mpTM5y+NL6Dq5xylwAH4HvVFDaOew=;
 b=Ag4aLh/05qGk4mxIAluF+RTTt3oABZHdRnVj86EX2JzFMptNvWyvn7T8ykYYXNcXQsI6
 dCHoze30zR758h/PlzAH0q19ga7hUlzQbagTqTF6e9kcOAdzuXU8TounNNGAaSIGsk9i
 pAPMkAzH3Zxcwvp49Pm4mzOgzkhKbXh9H2sf8QiM82enmK0J5VhcrmOULwjlqPv7wCY0
 PkfVZqa09T2GEN0i/IV4hOvoNXmVOIXbf0K/IKBkUT4VK32dh6siUPGXNHgdMoEimzwS
 OEMkZnVKslTMSoGgH0avThIJDzmjfOePUpbRv14pjgza9ICmKZZedugoBbMqtDaFHm2E tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka549exs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 18:39:29 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHsaEq015296;
 Wed, 27 Jul 2022 18:39:29 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka549ewe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 18:39:29 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RIKGjh024793;
 Wed, 27 Jul 2022 18:34:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3hg94ec30r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 18:34:26 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RIYNfh22610312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 18:34:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B5E911C04A;
 Wed, 27 Jul 2022 18:34:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DB7F11C04C;
 Wed, 27 Jul 2022 18:34:22 +0000 (GMT)
Received: from [9.171.26.130] (unknown [9.171.26.130])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 18:34:22 +0000 (GMT)
Message-ID: <3a097a3a-fd54-52c3-d28d-b702fc018c17@linux.ibm.com>
Date: Wed, 27 Jul 2022 20:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 03/17] dump: Convert GuestPhysBlock iterators and use
 the filter functions
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-4-frankja@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <20220726092248.128336-4-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ATG-zf1grGlrMgeWEckFRtovxAuvygM5
X-Proofpoint-ORIG-GUID: PpqLAGXOLokDYcwSPV-zdiW9fRQ5m_tH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_07,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207270079
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
> The iteration over the memblocks is hard to understand so it's about
> time to clean it up. Instead of manually grabbing the next memblock we
> can use QTAILQ_FOREACH to iterate over all memblocks.
> 
> Additionally we move the calculation of the offset and length out by
> using the dump_get_memblock_*() functions.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

> ---
>  dump/dump.c | 51 +++++++++++----------------------------------------
>  1 file changed, 11 insertions(+), 40 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 0fd7c76c1e..35b9833a00 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -628,56 +628,27 @@ int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start
>      return 0;
>  }
>  
> -static int get_next_block(DumpState *s, GuestPhysBlock *block)
> -{
> -    while (1) {
> -        block = QTAILQ_NEXT(block, next);
> -        if (!block) {
> -            /* no more block */
> -            return 1;
> -        }
> -
> -        s->start = 0;
> -        s->next_block = block;
> -        if (s->has_filter) {
> -            if (block->target_start >= s->begin + s->length ||
> -                block->target_end <= s->begin) {
> -                /* This block is out of the range */
> -                continue;
> -            }
> -
> -            if (s->begin > block->target_start) {
> -                s->start = s->begin - block->target_start;
> -            }
> -        }
> -
> -        return 0;
> -    }
> -}
> -
>  /* write all memory to vmcore */
>  static void dump_iterate(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
>      GuestPhysBlock *block;
> -    int64_t size;
> +    int64_t memblock_size, memblock_start;
>  
> -    do {
> -        block = s->next_block;
> -
> -        size = block->target_end - block->target_start;
> -        if (s->has_filter) {
> -            size -= s->start;
> -            if (s->begin + s->length < block->target_end) {
> -                size -= block->target_end - (s->begin + s->length);
> -            }
> +    QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        memblock_start = dump_get_memblock_start(block, s->begin, s->length);
> +        if (memblock_start == -1) {
> +            continue;
>          }
> -        write_memory(s, block, s->start, size, errp);
> +
> +        memblock_size = dump_get_memblock_size(block, s->begin, s->length);
> +
> +        /* Write the memory to file */
> +        write_memory(s, block, memblock_start, memblock_size, errp);
>          if (*errp) {
>              return;
>          }
> -
> -    } while (!get_next_block(s, block));
> +    }
>  }
>  
>  static void create_vmcore(DumpState *s, Error **errp)


