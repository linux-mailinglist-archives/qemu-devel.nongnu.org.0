Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0853585533
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 20:58:26 +0200 (CEST)
Received: from localhost ([::1]:45160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHVBp-0004GB-Ho
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 14:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHVAA-0002MS-3x; Fri, 29 Jul 2022 14:56:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43552
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHVA6-0001Xa-DU; Fri, 29 Jul 2022 14:56:41 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26TIp1nM032677;
 Fri, 29 Jul 2022 18:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3BM1BMdrwcLLxNt+GF4eGuHI68x7faDGTM8/wbjCNwg=;
 b=jhwdZifJPEnTdBClEKnJdiOj7tK6WxiVRYRU4W75HqmUOf/ACcqf/M7LLI5NjYqYqYnU
 lT/QN/fc7k2QyI37v4V9bP41BSEYrzyJnRvLNehHDnq90xyqVYRGpgaLHzdNvJu3pAI/
 7qRjiGVQ2R4YBO5Jt9r414F4Wm+anEvl2g24Pj3fxHUuaFtVrJP+J8lyA7zENN833xID
 yt4lpag+DrFTkg9hoOdgAf+7dS2k1pn9vg8zLUHETQo2aqW4+Jx1/NkYLtF7/eIAlo41
 JrRpeLZmqJsIIhhbVRkg3pg+9gmsP96DYv5BKR/mIRWcPXOHl9osiXQjSgG5N2ImAscA TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmn6mr4kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 18:56:34 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26TIplC0004435;
 Fri, 29 Jul 2022 18:56:33 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmn6mr4kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 18:56:33 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26TIZMfs023647;
 Fri, 29 Jul 2022 18:56:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3hg945p04c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 18:56:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26TIuSPF23789884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jul 2022 18:56:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74942A404D;
 Fri, 29 Jul 2022 18:56:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE3FDA4051;
 Fri, 29 Jul 2022 18:56:27 +0000 (GMT)
Received: from [9.171.5.81] (unknown [9.171.5.81])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jul 2022 18:56:27 +0000 (GMT)
Message-ID: <d7605dd8-e9ae-6c48-c10c-dc2089775507@linux.ibm.com>
Date: Fri, 29 Jul 2022 20:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 10/17] dump: Swap segment and section header locations
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-11-frankja@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <20220726092248.128336-11-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eokn7DxH-Jh_Z64V4R5MsOovXM81wIm4
X-Proofpoint-ORIG-GUID: UQh3OrbBfnKwtpMUTbMuBb4ArKg5bkKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-29_19,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207290077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
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

You swapped the headers in patch 8, you just fixing up the elf header in this patch, right?
Also I don't understand the reason for swapping the headers.
And the comment diagram in dump_begin still reflects the old ordering.

On 7/26/22 11:22, Janosch Frank wrote:
> For the upcoming string table and arch section support we need to
> modify the elf layout a bit. Instead of the segments, i.e. the guest's
> memory contents, beeing the last area the section data will live at
> the end of the file. This will allow us to write the section data
> after all guest memory has been dumped which is important for the s390
> PV dump support.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 21 ++++++++++++---------
>  include/sysemu/dump.h |  1 +
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index a6bb7bfa21..3cf846d0a0 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -588,6 +588,9 @@ static void dump_begin(DumpState *s, Error **errp)
>       *   --------------
>       *   |  memory     |
>       *   --------------
> +     *   |  sectn data |
> +     *   --------------
> +
>       *
>       * we only know where the memory is saved after we write elf note into
>       * vmcore.
> @@ -1852,18 +1855,18 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>          }
>      }
>  
> +    tmp = (s->phdr_num == PN_XNUM) ? s->sh_info : s->phdr_num;

You don't need this, do you? s->phdr_num is the correct value, it's the value
in the elf header that gets adjusted.

>      if (dump_is_64bit(s)) {
> -        s->phdr_offset = sizeof(Elf64_Ehdr);
> -        s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
> -        s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
> -        s->memory_offset = s->note_offset + s->note_size;
> +        s->shdr_offset = sizeof(Elf64_Ehdr);
> +        s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
> +        s->note_offset = s->phdr_offset + sizeof(Elf64_Phdr) * tmp;
>      } else {
> -
> -        s->phdr_offset = sizeof(Elf32_Ehdr);
> -        s->shdr_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
> -        s->note_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
> -        s->memory_offset = s->note_offset + s->note_size;
> +        s->shdr_offset = sizeof(Elf32_Ehdr);
> +        s->phdr_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
> +        s->note_offset = s->phdr_offset + sizeof(Elf32_Phdr) * tmp;
>      }
> +    s->memory_offset = s->note_offset + s->note_size;
> +    s->section_offset = s->memory_offset + s->total_size;
>  
>      return;
>  
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 3937afe0f9..696e6c67d6 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -172,6 +172,7 @@ typedef struct DumpState {
>      hwaddr shdr_offset;
>      hwaddr phdr_offset;
>      hwaddr note_offset;
> +    hwaddr section_offset;
>  
>      void *elf_header;
>      void *elf_section_hdrs;


