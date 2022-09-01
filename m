Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5C5A93F8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:11:45 +0200 (CEST)
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThAm-0005QU-0v
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgS4-0005NZ-2y; Thu, 01 Sep 2022 05:25:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgRy-0000ya-Ta; Thu, 01 Sep 2022 05:25:29 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2819BWeB006723;
 Thu, 1 Sep 2022 09:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=nYXxiSmLor69zmYVqjUv2e8Aai/QMNYHo4aV8Qa71BU=;
 b=Lq/Xco+I1t5ma/8DsNdX9PE9qOviwNeqz3ba8A2fbKZ9KfzxTxRhmYwffzd3DAEbSYy4
 W8/PF+/SNHfbp/G0O8+3ewAD1Sms0lFHMxwRdwe4/+9zW9jeKIHoivIB9e3fr7q/2/y/
 TVSSA9DUzkEiIaHPa1g5aq+FdPC9d0Yo23NnwTN/XwiAFjbNOGylzDDNasLTdVOSNSBm
 g1M4l+C/68zpW83t6FsZrmcTpYWNOsNpejIAwo5JA+ya2zmIzB7xWxsZ9kYdwcUfFzPE
 d53XkOaN8qwt1fFB2/iad3bi32aRH7Q2KanWv6llNR2dMwaAmWfkS0QGsus6G4cokcjt 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jasvw8d3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:25:25 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2819D2Jg015852;
 Thu, 1 Sep 2022 09:25:24 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jasvw8d2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:25:24 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2819LO2n023705;
 Thu, 1 Sep 2022 09:25:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3j7aw8vrkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:25:22 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2819PJq835258840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Sep 2022 09:25:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3B44A4040;
 Thu,  1 Sep 2022 09:25:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68346A4051;
 Thu,  1 Sep 2022 09:25:18 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.6.152]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Sep 2022 09:25:18 +0000 (GMT)
Message-ID: <b3db15dac7db1b979435f7e5f3e9415fbb207406.camel@linux.ibm.com>
Subject: Re: [PATCH v5 12/18] dump/dump: Add section string table support
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Date: Thu, 01 Sep 2022 11:25:18 +0200
In-Reply-To: <20220811121111.9878-13-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-13-frankja@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cpESrCbFUsFFjQxKiOtHqIUrFJngiTR3
X-Proofpoint-ORIG-GUID: 4QrlQguq8ai6DBDZt9JSmOrgbMiuc5vo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_05,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010040
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

On Thu, 2022-08-11 at 12:11 +0000, Janosch Frank wrote:
> As sections don't have a type like the notes do we need another way to
> determine their contents. The string table allows us to assign each
> section an identification string which architectures can then use to
> tag their sections with.
> 
> There will be no string table if the architecture doesn't add custom
> sections which are introduced in a following patch.

Why? Is there any harm in always having a (possibly empty) string
table? Can't put garbage into sh_name then but that's not relevant.
Seems like it would make the code a bit simpler.

I would also expect the string data to be written in this patch,
instead you do that in the next.
With that and Steffen's .shstrtab addressed:
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Some minor suggestions below.

> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 71 +++++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/dump.h |  4 +++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 31eb20108c..0d6dbf453a 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c

[...]

> @@ -393,17 +400,50 @@ static void prepare_elf_section_hdr_zero(DumpState *s)
>      }
>  }
>  
> +static void prepare_elf_section_hdr_string(DumpState *s, void *buff)
> +{
> +    Elf32_Shdr shdr32;
> +    Elf64_Shdr shdr64;

Could just = {} those and drop the memset below.

> +    int shdr_size;
> +    void *shdr;
> +
> +    if (dump_is_64bit(s)) {
> +        shdr_size = sizeof(Elf64_Shdr);
> +        memset(&shdr64, 0, shdr_size);
> +        shdr64.sh_type = SHT_STRTAB;
> +        shdr64.sh_offset = s->section_offset + s->elf_section_data_size;
> +        shdr64.sh_name = s->string_table_buf->len;
> +        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));

Could put the ".shstrtab" in a char[] variable.

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

[...]

> @@ -1844,6 +1903,18 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>          }
>      }
>  
> +    /*
> +     * calculate shdr_num and elf_section_data_size so we know the offsets and

What is the elf_section_data_size thing about?

> +     * sizes of all parts.
> +     *
> +     * If phdr_num overflowed we have at least one section header
> +     * More sections/hdrs can be added by the architectures
> +     */
> +    if (s->shdr_num > 1) {
> +        /* Reserve the string table */
> +        s->shdr_num += 1;
> +    }
> +
>      if (dump_is_64bit(s)) {
>          s->shdr_offset = sizeof(Elf64_Ehdr);
>          s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;

[...]

