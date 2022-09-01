Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F205A9418
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:17:31 +0200 (CEST)
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThGM-0002n4-Lx
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgRA-0004VD-L5; Thu, 01 Sep 2022 05:24:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgR8-0000eA-3E; Thu, 01 Sep 2022 05:24:36 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2818oncJ026731;
 Thu, 1 Sep 2022 09:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Yy/1ph9BoeVFcbooCOeGXIbgm8SXzO8F747iLM9qwBk=;
 b=tTVeiUxHm7uWeJakxTnqfWxHsVt2AGTdr2r8yumPMpp3jlWOzrWAcFy8OyPGZpUfxFd7
 yuWrxTZqadS0nWiw+LRx8GCCbjIMs3AhHINoII8or6O8M93+45zKxRYQqyCpwJtzEpKo
 C4jXbg0VgKdF2YCS8Osb0EoUprOZdYXY80ZVJIu3atmBpC1diInuoI4vkbihr0ogrk+u
 ObB+c8YSDQZCa00/6n2nXxgpbNGowSz4cIA6cu+HK5UhGkX3ZuenpvlO5VMfXSuthm9X
 7VDPN7PDb7CeZ7ewQPsg3GjDBJqpNLW/LJwYtrLmXKK9fkbmCtg8NVhhD1KA6XSI655a cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jask9184a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:24:29 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2819KR4F029377;
 Thu, 1 Sep 2022 09:24:29 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jask9183h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:24:29 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2819MCmx017319;
 Thu, 1 Sep 2022 09:24:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3j7ahhvrtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:24:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2819OOEh39715256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Sep 2022 09:24:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA4A64C040;
 Thu,  1 Sep 2022 09:24:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E2AD4C044;
 Thu,  1 Sep 2022 09:24:23 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.6.152]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Sep 2022 09:24:23 +0000 (GMT)
Message-ID: <817a03b010d7ff90f7ef92a450dd84a0adabfabf.camel@linux.ibm.com>
Subject: Re: [PATCH v5 06/18] dump: Rework dump_calculate_size function
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Date: Thu, 01 Sep 2022 11:24:23 +0200
In-Reply-To: <20220811121111.9878-7-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-7-frankja@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KVtZtsrKH8BfEWNLyx_AFrYGDcF6Admy
X-Proofpoint-ORIG-GUID: NDhxlfizp7xTzlP62hJdg-G83sEVi-eG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_06,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010040
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Thu, 2022-08-11 at 12:10 +0000, Janosch Frank wrote:
> dump_calculate_size() sums up all the sizes of the guest memory
> blocks. Since we already have a function that calculates the size of a
> single memory block (dump_get_memblock_size()) we can simply iterate
> over the blocks and use the function instead of calculating the size
> ourselves.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

> ---
>  dump/dump.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index b043337bc7..d82cc46d7d 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1548,25 +1548,19 @@ bool qemu_system_dump_in_progress(void)
>      return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
>  }
>  
> -/* calculate total size of memory to be dumped (taking filter into
> - * acoount.) */
> +/*
> + * calculate total size of memory to be dumped (taking filter into
> + * account.)
> + */
>  static int64_t dump_calculate_size(DumpState *s)
>  {
>      GuestPhysBlock *block;
> -    int64_t size = 0, total = 0, left = 0, right = 0;
> +    int64_t total = 0;
>  
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> -        if (dump_has_filter(s)) {
> -            /* calculate the overlapped region. */
> -            left = MAX(s->filter_area_begin, block->target_start);
> -            right = MIN(s->filter_area_begin + s->filter_area_length, block->target_end);
> -            size = right - left;
> -            size = size > 0 ? size : 0;
> -        } else {
> -            /* count the whole region in */
> -            size = (block->target_end - block->target_start);
> -        }
> -        total += size;
> +        total += dump_filtered_memblock_size(block,
> +                                             s->filter_area_begin,
> +                                             s->filter_area_length);
>      }
>  
>      return total;


