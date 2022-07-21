Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BB057CF2F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:33:48 +0200 (CEST)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEYBP-0001ud-9P
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEY9Y-0006hL-3D; Thu, 21 Jul 2022 11:31:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEY9V-0002bI-SK; Thu, 21 Jul 2022 11:31:51 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LFFwZc015528;
 Thu, 21 Jul 2022 15:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : from : to : cc : references : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=N0GqPSP0wOXKh2uZA6P1583+y4QZFKCA3H6aEUBspkE=;
 b=sJqWZM2C9x6qr18DNu729Uavxeh9whtnFqyVbKjMmZ4655gkiRpkYOBZ+49zojePZet6
 dSKuQ233Sg4PXIDhL++ZKy0MGc63hyKXfdfCg9ejNBSKLU0kOShK1iwNuJYDFsdXdKnh
 HzlM/BpbUumCUqJ8dGpUOskjjCGKOxCmY7zR2nBJqvdeMFzSFDxTf7BRpYV0mcykT6PH
 10H5EzFgPQLdSj38NyjEv5ibs4YhJu48o9VD0Sk2lBkwg75YQY6ZrXHWwp3rVRhpVLZw
 rzpXyvM8P1RD7HcbdzhCGALeA9eUFCOR9KuDeniVDpVlkSarkKu2GuUlyRnp35UbJLFr Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf9908ky4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 15:31:48 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LFHwZ5024809;
 Thu, 21 Jul 2022 15:31:47 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf9908kxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 15:31:47 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LFL7WX025347;
 Thu, 21 Jul 2022 15:31:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3hbmy8y9mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 15:31:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LFVgX023593428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 15:31:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A99C9A4054;
 Thu, 21 Jul 2022 15:31:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FB3EA405F;
 Thu, 21 Jul 2022 15:31:42 +0000 (GMT)
Received: from [9.145.177.237] (unknown [9.145.177.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 15:31:42 +0000 (GMT)
Message-ID: <8b9b547a-aba3-b5d0-2593-a7f4a9f8c942@linux.ibm.com>
Date: Thu, 21 Jul 2022 17:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-9-frankja@linux.ibm.com>
Subject: Re: [PATCH v3 08/14] dump/dump: Add section string table support
In-Reply-To: <20220721132256.2171-9-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2vYNl9DuYTnyEk9Dg9G0h8cNu7G1cg-c
X-Proofpoint-ORIG-GUID: HPWi9tch3Pk46KPr3T4AFaSyv_Us9m9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_18,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 mlxlogscore=783
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210060
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
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

On 7/21/22 15:22, Janosch Frank wrote:
> As sections don't have a type like the notes do we need another way to
> determine their contents. The string table allows us to assign each
> section an identification string which architectures can then use to
> tag their sections with.
> 
> There will be no string table if the architecture doesn't add custom
> sections which are introduced in a following patch.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   dump/dump.c           | 81 +++++++++++++++++++++++++++++++++++++++++--
>   include/sysemu/dump.h |  1 +
>   2 files changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 6f3274c5af..944217349a 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -99,6 +99,7 @@ static int dump_cleanup(DumpState *s)
>       close(s->fd);
>       g_free(s->guest_note);
>       g_free(s->elf_header);
> +    g_array_unref(s->string_table_buf);
>       s->guest_note = NULL;
>       if (s->resume) {
>           if (s->detached) {
> @@ -357,14 +358,47 @@ static size_t prepare_elf_section_hdr_zero(DumpState *s, void *buff)
>       return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
>   }
>   
> +static void write_elf_section_hdr_string(DumpState *s, void *buff)
> +{
> +    Elf32_Shdr shdr32;
> +    Elf64_Shdr shdr64;
> +    int shdr_size;
> +    void *shdr = buff;
> +
> +    if (dump_is_64bit(s)) {
> +        shdr_size = sizeof(Elf64_Shdr);
> +        memset(&shdr64, 0, shdr_size);
> +        shdr64.sh_type = SHT_STRTAB;
> +        shdr64.sh_offset = s->section_offset + s->elf_section_data_size;
> +        shdr64.sh_name = s->string_table_buf->len;
> +        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));
> +        shdr64.sh_size = s->string_table_buf->len;
> +        shdr = &shdr64;
> +    } else {
> +        shdr_size = sizeof(Elf32_Shdr);
> +        memset(&shdr32, 0, shdr_size);
> +        shdr32.sh_type = SHT_STRTAB;
> +        shdr32.sh_offset = s->section_offset + s->elf_section_data_size;
> +        shdr32.sh_name = s->string_table_buf->len;
> +        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));
> +        shdr32.sh_size = s->string_table_buf->len;
> +        shdr = &shdr32;
> +    }
> +
> +    memcpy(buff, shdr, shdr_size);
> +}
> +
>   static void prepare_elf_section_hdrs(DumpState *s)
>   {
>       uint8_t *buff_hdr;
> -    size_t len, sizeof_shdr;
> +    size_t len, size = 0, sizeof_shdr;
> +    Elf64_Ehdr *hdr64 = s->elf_header;
> +    Elf32_Ehdr *hdr32 = s->elf_header;
>   
>       /*
>        * Section ordering:
>        * - HDR zero (if needed)
> +     * - String table hdr
>        */
>       sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
>       len = sizeof_shdr * s->shdr_num;
> @@ -375,6 +409,22 @@ static void prepare_elf_section_hdrs(DumpState *s)
>       if (s->phdr_num == PN_XNUM) {
>               prepare_elf_section_hdr_zero(s, buff_hdr);
>       }
> +    buff_hdr += size;

If I'm not mistaken this line doesn't make sense at all.
It needs to be in the if and add sizeof_shdr so we can account for the 
zero header.

I.e.:
if (s->phdr_num == PN_XNUM) {
	prepare_elf_section_hdr_zero(s, buff_hdr);
	buff_hdr += sizeof_shdr;
}


Also size isn't really needed, we can directly add 
dump_arch_sections_write_hdr()'s return to buff_hdr in the next patch.

> +
> +    if (s->shdr_num < 2) {
> +        return;
> +    }
> +
> +    /*
> +     * String table needs to be last section since strings are added
> +     * via arch_sections_write_hdr().
> +     */
> +    write_elf_section_hdr_string(s, buff_hdr);
> +    if (dump_is_64bit(s)) {
> +        hdr64->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
> +    } else {
> +        hdr32->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
> +    }
>   }

