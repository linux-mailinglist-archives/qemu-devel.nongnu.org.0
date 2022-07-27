Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC38058326A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:52:22 +0200 (CEST)
Received: from localhost ([::1]:55778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGm8r-0003Zs-RV
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oGlzb-00064J-5m; Wed, 27 Jul 2022 14:42:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oGlzY-0001Jh-6d; Wed, 27 Jul 2022 14:42:46 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RILdJi015626;
 Wed, 27 Jul 2022 18:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tHuo98TE4IHOxWrEcoxJwRFupSvgpdzAe8iH2AdahUg=;
 b=ZX+VWoNYByF1Zr5z0izU9lKN3bEbmGg4r9DzybrqW8ty3JYvrnOBvLq0cU1Etzukkis1
 DP2hCAapPOnUhFVq4T2XBes8DEd4ZzsdqE56Vf5MpXj4QOziGnUqQ/8cAxTO/M9tibSQ
 fF0d2gm9AWXC2kX9zSOBgqjvRWPbW2NTW5mEvNWLZfUcWkiKa6YYR5Zzsy7OIvD/uk6W
 hNUgmsAxl4onoHAQ90y08jn2zypqtYXmcEbVHvJpb97Aif47BJrx+qZAitkHWyguv4FT
 bnGgMl73PPjrJVhSw2Ue/dhZswi6MNnuDXQVz1ELUyoaD282hF2E5IQMjtR8NlEH3KyH lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hkajv0n7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 18:42:42 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RIfXa8023170;
 Wed, 27 Jul 2022 18:42:41 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hkajv0n6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 18:42:41 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RIcG20018044;
 Wed, 27 Jul 2022 18:42:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3hg98fhv5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 18:42:39 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26RIgoGB24314208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 18:42:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A3F611C04C;
 Wed, 27 Jul 2022 18:42:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 851A911C04A;
 Wed, 27 Jul 2022 18:42:35 +0000 (GMT)
Received: from [9.171.26.130] (unknown [9.171.26.130])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 18:42:35 +0000 (GMT)
Message-ID: <1fe68eb2-3a5e-6452-8126-79609c06063e@linux.ibm.com>
Date: Wed, 27 Jul 2022 20:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 04/17] dump: Rework get_start_block
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-5-frankja@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <20220726092248.128336-5-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PTpvEIl9WOpWYmU93HTeuvOKTbiFHfpP
X-Proofpoint-ORIG-GUID: GY-X_G_JmxCzcp-SnZQZmAfFOOpCaSWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_07,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
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
> get_start_block() returns the start address of the first memory block
> or -1.
> 
> With the GuestPhysBlock iterator conversion we don't need to set the
> start address and can therefore remove that code. The only
> functionality left is the validation of the start block so it only
> makes sense to re-name the function to validate_start_block()
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

See suggenstions below.

> ---
>  dump/dump.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 35b9833a00..b59faf9941 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1498,30 +1498,22 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
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

If you change the dump_get_memblock_* functions to take the DumpState, you could do

bool has_unfiltered_mem(DumpState *s)
{
    GuestPhysBlock *block;

    QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
        if (dump_get_memblock_size(block, s) > 0) {
            return true;
        }
    }
    return false;
}

or you could do the same with the existing dump_get_memblock_size, add

    if (has_filter && !length) {
        error_setg(errp, QERR_INVALID_PARAMETER, "length");
        goto cleanup;
    }

to dump_init, encode has_filter in length as you're currently doing and get rid of s->has_filter entirely.

> @@ -1668,8 +1660,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
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


