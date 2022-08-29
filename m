Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F965A557D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 22:21:48 +0200 (CEST)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSlGV-0008VQ-37
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 16:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oSlCz-0005Gt-5L; Mon, 29 Aug 2022 16:18:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oSlCx-0006rM-4s; Mon, 29 Aug 2022 16:18:08 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TKC0C4031950;
 Mon, 29 Aug 2022 20:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=qatiDzxC8LLCKv7kqQSO35+H76ynieu3u5eYO0WHzw4=;
 b=B7SUiGqNLmW03zCxVxHv2k6TYvyLvxnpQKBfh3fMAVmycUn2TUAQVICMF7XaX8S/cltm
 JMInfEmLp92FRCXYuLF3Z/fzYK1yCr9BSFS2137NFlJYHk+tipU8mvM/YW3KzwlsfAQ7
 VfSDgDbLw5BDt7y7a2E47/ityJJqwWIEK0phBH4maA1OviSfNhyvsXX7UtxPGLltAeRP
 Tq690Zc1KmhyxrAzVnxnplvHRxZLTShaQdmcfo2BoqMpy3WD9Aa+P/bD1KVH137ZN+aw
 8a7dS1r5/dlyohdD19489kuQ9UCNOmdbJh/M4sWvAnJRa5YW0lPH+xJmyNWiN9AucxL7 vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j949er5hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Aug 2022 20:18:03 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TKGYgV027324;
 Mon, 29 Aug 2022 20:18:02 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j949er5gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Aug 2022 20:18:02 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27TK5UwU009127;
 Mon, 29 Aug 2022 20:18:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3j7ahj2rje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Aug 2022 20:18:00 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27TKHvtS42074614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 20:17:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03A074C044;
 Mon, 29 Aug 2022 20:17:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BB774C040;
 Mon, 29 Aug 2022 20:17:56 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.52.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Aug 2022 20:17:56 +0000 (GMT)
Message-ID: <47bc40f30c49a6e55f435e25ec4fd0386deb798b.camel@linux.ibm.com>
Subject: Re: [PATCH v5 04/18] dump: Rework get_start_block
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Date: Mon, 29 Aug 2022 22:17:56 +0200
In-Reply-To: <20220811121111.9878-5-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-5-frankja@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FvLLtFaF1W37lf_YH9o0yEaE8uzVPJ29
X-Proofpoint-ORIG-GUID: D2hWGaq-13VIbc8NlC0VaEiqmSCY7Ez2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_09,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208290092
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
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

On Thu, 2022-08-11 at 12:10 +0000, Janosch Frank wrote:
> get_start_block() returns the start address of the first memory block
> or -1.
> 
> With the GuestPhysBlock iterator conversion we don't need to set the
> start address and can therefore remove that code and the "start"
> DumpState struct member. The only functionality left is the validation
> of the start block so it only makes sense to re-name the function to
> validate_start_block()

Nit, since you don't return an address anymore, I find retaining the -
1/0 return value instead of true/false weird.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
>  dump/dump.c           | 20 ++++++--------------
>  include/sysemu/dump.h |  2 --
>  2 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 340de5a1e7..e204912a89 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1500,30 +1500,22 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
>      }
>  }
>  
> -static ram_addr_t get_start_block(DumpState *s)
> +static int validate_start_block(DumpState *s)
>  {
>      GuestPhysBlock *block;
>  
>      if (!s->has_filter) {
> -        s->next_block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
>          return 0;
>      }
>  
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        /* This block is out of the range */
>          if (block->target_start >= s->begin + s->length ||
>              block->target_end <= s->begin) {
> -            /* This block is out of the range */
>              continue;
>          }
> -
> -        s->next_block = block;
> -        if (s->begin > block->target_start) {
> -            s->start = s->begin - block->target_start;
> -        } else {
> -            s->start = 0;
> -        }
> -        return s->start;
> -    }
> +        return 0;
> +   }
>  
>      return -1;
>  }
> @@ -1670,8 +1662,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>          goto cleanup;
>      }
>  
> -    s->start = get_start_block(s);
> -    if (s->start == -1) {
> +    /* Is the filter filtering everything? */
> +    if (validate_start_block(s) == -1) {
>          error_setg(errp, QERR_INVALID_PARAMETER, "begin");
>          goto cleanup;
>      }
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index ffc2ea1072..7fce1d4af6 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -166,8 +166,6 @@ typedef struct DumpState {
>      hwaddr memory_offset;
>      int fd;
>  
> -    GuestPhysBlock *next_block;
> -    ram_addr_t start;
>      bool has_filter;
>      int64_t begin;
>      int64_t length;


