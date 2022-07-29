Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CAC585454
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:18:50 +0200 (CEST)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTdR-0001zU-7E
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHTbA-0000Qt-4n; Fri, 29 Jul 2022 13:16:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHTb6-0001wy-Tx; Fri, 29 Jul 2022 13:16:26 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26TGJWKd001091;
 Fri, 29 Jul 2022 17:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vKczkBLitGCasoKJydOz2OcVrpRanODBYwI+51ABNDc=;
 b=aOvKEkzyrF++aQogx9jN0KkANi80+zveLKblkZmNGmILuVvdVOugCJslY7x/OUhIsHt1
 CfT2HEPuCKXEthPXdx/DCdG+aGN458hAPmscA8X311hOhZ7hu4nb12a7KbnpfuR9qj78
 ltLCQF+jjuZok/KRNwkw4sMPeG+jHJM2pmCxTS1d593Ss0MQ//Xah6YvschLRAN7BBiG
 6akPZ42Nw86hbfcDy/ESJa4IN8D1r6wDy281qTOm8YeJ4yhLUQ61mpPBum0eaoFPL15d
 4b6WKqTapOEh9bYrGb+WFG2HJ8AQbvrrJN0OwdjYr1TamxPS24IWOpHO55QSN2+WwZA6 Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmjymj1gp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 17:16:22 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26TGKRT1006173;
 Fri, 29 Jul 2022 17:16:22 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmjymj1fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 17:16:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26TH5Rir018942;
 Fri, 29 Jul 2022 17:16:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3hg98nfx81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 17:16:19 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26THGGGG15794544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jul 2022 17:16:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 474C9A4040;
 Fri, 29 Jul 2022 17:16:16 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2BFCA404D;
 Fri, 29 Jul 2022 17:16:15 +0000 (GMT)
Received: from [9.171.5.81] (unknown [9.171.5.81])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jul 2022 17:16:15 +0000 (GMT)
Message-ID: <50fc36a5-a9f7-777b-4dc5-936cb76c6475@linux.ibm.com>
Date: Fri, 29 Jul 2022 19:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 08/17] dump: Split write of section headers and data
 and add a prepare step
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-9-frankja@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <20220726092248.128336-9-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D0J_H1eqFJjgYrnUy4v-tBq2FOFgvbOE
X-Proofpoint-ORIG-GUID: pIU_9HnFQkVn5Y3ek5OQ-ZuvtRAiMzix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-29_17,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> By splitting the writing of the section headers and (future) section
> data we prepare for the addition of a string table section and
> architecture sections.
> 
> At the same time we move the writing of the section to the end of the
> dump process. This allows the upcoming architecture section code to
> add data after all of the common dump data has been written.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 112 ++++++++++++++++++++++++++++++++----------
>  include/sysemu/dump.h |   4 ++
>  2 files changed, 90 insertions(+), 26 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 8a7ce95610..a6bb7bfa21 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -342,30 +342,69 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
>      }
>  }
>  

[...]

> +
> +static void prepare_elf_section_hdrs(DumpState *s)
> +{
> +    size_t len, sizeof_shdr;
> +
> +    /*
> +     * Section ordering:
> +     * - HDR zero (if needed)
> +     */
> +    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> +    len = sizeof_shdr * s->shdr_num;
> +    s->elf_section_hdrs = g_malloc0(len);
> +
> +    /* Write special section first */
> +    if (s->phdr_num == PN_XNUM) {

Should be >= right?

> +        prepare_elf_section_hdr_zero(s);
> +    }
> +}
> +
[...]

