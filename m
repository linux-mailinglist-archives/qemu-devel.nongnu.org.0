Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0B584B3B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 07:36:53 +0200 (CEST)
Received: from localhost ([::1]:35672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHIg8-0004mt-Pc
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 01:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oHIbu-0001n3-6H; Fri, 29 Jul 2022 01:32:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19432
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oHIbs-0005lO-AZ; Fri, 29 Jul 2022 01:32:29 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26T5LOMi016428;
 Fri, 29 Jul 2022 05:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0h/uSVWl+0NQbo+1m/QExo+eYOVEC4igRD1Yovn+gYE=;
 b=RxXOxg+hAPVZFW9ZZ8d/4F9xka93QYzJKeptoZb2+NycpfBUtU5nEUKXZT4zqrnY2LBQ
 QkQPFe8eeKU8qoFgj2TQpQJx+9VyHUSL8UAIftJtiv5cT+TiUqdEtwXDABjwmcau1A2p
 WomA2ibvqpWKb7n4/8EEF9S9N3BQjhtAFtkBLTtzpiLBuCEKJU9m0ZF3+cBK7QzXNa15
 FR1rr+GkIb9FL901f02yAwhfDSZXUMT5FbSkB2Kx64NpGkbP2dQKRN6Fc2vCW0qFQ3yk
 to+FCnHICC0R3q0fHf2v+bGcCOsj3guN7E1qA/iWpdc7MV5EugP/kmcEgBqGoBQw/k9v Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hm9b4g8wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 05:32:25 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26T5NSIH022343;
 Fri, 29 Jul 2022 05:32:25 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hm9b4g8w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 05:32:24 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26T5KNhJ007531;
 Fri, 29 Jul 2022 05:32:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3hg94ede1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 05:32:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26T5UFvg34210120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jul 2022 05:30:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4C9811C04A;
 Fri, 29 Jul 2022 05:32:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59F3B11C052;
 Fri, 29 Jul 2022 05:32:19 +0000 (GMT)
Received: from [9.145.84.114] (unknown [9.145.84.114])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jul 2022 05:32:19 +0000 (GMT)
Message-ID: <9bda4fb9-0435-d8fb-d85c-43b6eedf416d@linux.ibm.com>
Date: Thu, 28 Jul 2022 19:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 04/17] dump: Rework get_start_block
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 scgl@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-5-frankja@linux.ibm.com>
From: Steffen Eiden <seiden@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220726092248.128336-5-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ePclVHP49XU4THP80xymcEKsn9bZRAHz
X-Proofpoint-GUID: IBQIycd2HHy8FYDob7PPkvGhca2iHHPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207290018
Received-SPF: pass client-ip=148.163.158.5; envelope-from=seiden@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
> ---
>   dump/dump.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 35b9833a00..b59faf9941 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1498,30 +1498,22 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
>       }
>   }
>   
> -static ram_addr_t get_start_block(DumpState *s)
> +static int validate_start_block(DumpState *s)
>   {
>       GuestPhysBlock *block;
>   
>       if (!s->has_filter) {
> -        s->next_block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
>           return 0;
>       }
>   
>       QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        /* This block is out of the range */
>           if (block->target_start >= s->begin + s->length ||
>               block->target_end <= s->begin) {
> -            /* This block is out of the range */
>               continue;
>           }
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
>       return -1;
>   }
> @@ -1668,8 +1660,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>           goto cleanup;
>       }
>   
> -    s->start = get_start_block(s);
> -    if (s->start == -1) {
> +    /* Is the filter filtering everything? */
> +    if (validate_start_block(s) == -1) {
>           error_setg(errp, QERR_INVALID_PARAMETER, "begin");
>           goto cleanup;
>       }

