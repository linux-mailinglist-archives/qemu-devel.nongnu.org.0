Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001445A94A6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:31:17 +0200 (CEST)
Received: from localhost ([::1]:47654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThTg-0007Eg-QM
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgXc-0001SS-Kz; Thu, 01 Sep 2022 05:31:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgXa-0001m6-3T; Thu, 01 Sep 2022 05:31:16 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28198VO4013577;
 Thu, 1 Sep 2022 09:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Se2amufn+kKWmdycr6fXM6bfwK+uh4lXMYtXrZeOhu4=;
 b=fLRsHRHuZZAqivunJV2W3FgCzquuRLgHoHP2Gs7+2/jFMQFSltxhU6n5u9qmPQl2pChw
 u8m4k/cgvlWBaVGxKzOt7TaRmY/UhkzdpKTWNepPdwdvkFdjEJSYmb75Gc8hRGZW5z4C
 CjuRRSxFsblZV4GwGvHozB+/pnRJil5XxqLyFGqJhEI9T6tNiuFqmf3LRB3CczxSJeYM
 ZJvlCU/sYdfV6YqjbyqS7N6ntJzilM8Dpnnl49MYYWRm/UFGcj9TxYCV1tQxSqPVV0JL
 9yYawFzhRlLrCq05OgJcxxRqLUIITR2FsM2IKrxrLdvOyBbQrajIREOQ2EjBFtNKC8Ko yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jas9a9pvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:31:12 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2819AMQx023796;
 Thu, 1 Sep 2022 09:31:11 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jas9a9pue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:31:11 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2819LlEn028816;
 Thu, 1 Sep 2022 09:31:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3j7aw96h53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:31:09 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2819V6gI40960308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Sep 2022 09:31:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89CA84203F;
 Thu,  1 Sep 2022 09:31:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C2DE42041;
 Thu,  1 Sep 2022 09:31:06 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.6.152]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Sep 2022 09:31:05 +0000 (GMT)
Message-ID: <05d89c9ac9dbfc5a3fedee1d75df2ec1d953ddbc.camel@linux.ibm.com>
Subject: Re: [PATCH v5 18/18] s390x: pv: Add dump support
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Date: Thu, 01 Sep 2022 11:31:05 +0200
In-Reply-To: <20220811121111.9878-19-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-19-frankja@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: borWmNtIAMNpiO_7KvhQju6fgQDZXy99
X-Proofpoint-GUID: NyXcD4AcV9uIYxZlUQ_3_MAeHB_1BRQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_06,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010040
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

On Thu, 2022-08-11 at 12:11 +0000, Janosch Frank wrote:
> Sometimes dumping a guest from the outside is the only way to get the
> data that is needed. This can be the case if a dumping mechanism like
> KDUMP hasn't been configured or data needs to be fetched at a specific
> point. Dumping a protected guest from the outside without help from
> fw/hw doesn't yield sufficient data to be useful. Hence we now
> introduce PV dump support.
> 
> The PV dump support works by integrating the firmware into the dump
> process. New Ultravisor calls are used to initiate the dump process,
> dump cpu data, dump memory state and lastly complete the dump process.
> The UV calls are exposed by KVM via the new KVM_PV_DUMP command and
> its subcommands. The guest's data is fully encrypted and can only be
> decrypted by the entity that owns the customer communication key for
> the dumped guest. Also dumping needs to be allowed via a flag in the
> SE header.
> 
> On the QEMU side of things we store the PV dump data in the newly
> introduced architecture ELF sections (storage state and completion
> data) and the cpu notes (for cpu dump data).
> 
> Users can use the zgetdump tool to convert the encrypted QEMU dump to an
> unencrypted one.

Does PV dump work when memory is being filtered? Are there any
constraints on the filter parameters, alignment or so?
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c              |  12 +-
>  include/sysemu/dump.h    |   5 +
>  target/s390x/arch_dump.c | 242 ++++++++++++++++++++++++++++++++++-----
>  3 files changed, 227 insertions(+), 32 deletions(-)

[...]
>  
>  typedef struct NoteFuncDescStruct {
>      int contents_size;
> +    uint64_t (*note_size_func)(void); /* NULL for non-dynamic sized contents */
>      void (*note_contents_func)(Note *note, S390CPU *cpu, int id);
> +    bool pvonly;
>  } NoteFuncDesc;
>  
>  static const NoteFuncDesc note_core[] = {
> -    {sizeof_field(Note, contents.prstatus), s390x_write_elf64_prstatus},
> -    {sizeof_field(Note, contents.fpregset), s390x_write_elf64_fpregset},
> -    { 0, NULL}
> +    {sizeof_field(Note, contents.prstatus), NULL, s390x_write_elf64_prstatus, false},
> +    {sizeof_field(Note, contents.fpregset), NULL, s390x_write_elf64_fpregset, false},
> +    { 0, NULL, NULL}
>  };
>  
>  static const NoteFuncDesc note_linux[] = {
> -    {sizeof_field(Note, contents.prefix),   s390x_write_elf64_prefix},
> -    {sizeof_field(Note, contents.ctrs),     s390x_write_elf64_ctrs},
> -    {sizeof_field(Note, contents.timer),    s390x_write_elf64_timer},
> -    {sizeof_field(Note, contents.todcmp),   s390x_write_elf64_todcmp},
> -    {sizeof_field(Note, contents.todpreg),  s390x_write_elf64_todpreg},
> -    {sizeof_field(Note, contents.vregslo),  s390x_write_elf64_vregslo},
> -    {sizeof_field(Note, contents.vregshi),  s390x_write_elf64_vregshi},
> -    {sizeof_field(Note, contents.gscb),     s390x_write_elf64_gscb},
> -    { 0, NULL}
> +    {sizeof_field(Note, contents.prefix),   NULL, s390x_write_elf64_prefix,  false},
> +    {sizeof_field(Note, contents.ctrs),     NULL, s390x_write_elf64_ctrs,    false},
> +    {sizeof_field(Note, contents.timer),    NULL, s390x_write_elf64_timer,   false},
> +    {sizeof_field(Note, contents.todcmp),   NULL, s390x_write_elf64_todcmp,  false},
> +    {sizeof_field(Note, contents.todpreg),  NULL, s390x_write_elf64_todpreg, false},
> +    {sizeof_field(Note, contents.vregslo),  NULL, s390x_write_elf64_vregslo, false},
> +    {sizeof_field(Note, contents.vregshi),  NULL, s390x_write_elf64_vregshi, false},
> +    {sizeof_field(Note, contents.gscb),     NULL, s390x_write_elf64_gscb,    false},
> +    {0, kvm_s390_pv_dmp_get_size_cpu,       s390x_write_elf64_pv, true},
> +    { 0, NULL, NULL}
>  };
>  
>  static int s390x_write_elf64_notes(const char *note_name,
> @@ -207,22 +226,41 @@ static int s390x_write_elf64_notes(const char *note_name,
>                                         DumpState *s,
>                                         const NoteFuncDesc *funcs)
>  {
> -    Note note;
> +    Note note, *notep;
>      const NoteFuncDesc *nf;
> -    int note_size;
> +    int note_size, content_size;

Could make those size_t. I guess it's not necessary, but we're kind of
a dumb pipe for data from the ultravisor so there's something to be
said for not making assumptions.

>      int ret = -1;
>  
>      assert(strlen(note_name) < sizeof(note.name));
>  
>      for (nf = funcs; nf->note_contents_func; nf++) {
> -        memset(&note, 0, sizeof(note));
> -        note.hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
> -        note.hdr.n_descsz = cpu_to_be32(nf->contents_size);
> -        g_strlcpy(note.name, note_name, sizeof(note.name));
> -        (*nf->note_contents_func)(&note, cpu, id);
> +        notep = &note;
> +        if (nf->pvonly && !s390_is_pv()) {
> +            continue;
> +        }
>  
> -        note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
> -        ret = f(&note, note_size, s);
> +        content_size = nf->contents_size ? nf->contents_size : nf->note_size_func();

Your comment above says
/* NULL for non-dynamic sized contents */
So it makes sense to condition on that, i.e.
+        content_size = nf->contents_size_func ? nf->note_size_func() : nf->contents_size;
And it makes it consistent with the ifs below

> +        note_size = sizeof(note) - sizeof(notep->contents) + content_size;
> +
> +        /* Notes with dynamic sizes need to allocate a note */
> +        if (nf->note_size_func) {
> +            notep = g_malloc0(note_size);
> +        }
> +
> +        memset(notep, 0, sizeof(note));
> +
> +        /* Setup note header data */
> +        notep->hdr.n_descsz = cpu_to_be32(content_size);
> +        notep->hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
> +        g_strlcpy(notep->name, note_name, sizeof(notep->name));
> +
> +        /* Get contents and write them out */
> +        (*nf->note_contents_func)(notep, cpu, id);
> +        ret = f(notep, note_size, s);
> +
> +        if (nf->note_size_func) {
> +            g_free(notep);
> +        }
>  
>          if (ret < 0) {
>              return -1;
> @@ -247,12 +285,161 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>      return s390x_write_elf64_notes("LINUX", f, cpu, cpuid, s, note_linux);
>  }
>  
> +/* PV dump section size functions */
> +static uint64_t get_dump_stor_state_size_from_len(uint64_t len)
> +{
> +    return (len / (1 << 20)) * kvm_s390_pv_dmp_get_size_stor_state();
> +}
> +
> +static uint64_t get_size_stor_state(DumpState *s)
> +{
> +    return get_dump_stor_state_size_from_len(s->total_size);
> +}
> +
> +static uint64_t get_size_complete(DumpState *s)
> +{
> +    return kvm_s390_pv_dmp_get_size_complete();
> +}
> +
> +/* PV dump section data functions*/
> +static int get_data_complete(DumpState *s, uint8_t *buff)
> +{
> +    int rc;
> +
> +    if (!pv_dump_initialized) {
> +        return 0;
> +    }
> +    rc = kvm_s390_dump_complete(buff);
> +    if (!rc) {
> +            pv_dump_initialized = false;
> +    }
> +    return rc;
> +}
> +
> +static int dump_mem(DumpState *s, uint64_t gaddr, uint8_t *buff, uint64_t buff_len)

The DumpState arg is being ignored.

> +{
> +    /* We need the gaddr + len and something to write to */
> +    if (!pv_dump_initialized) {
> +        return 0;
> +    }
> +    return kvm_s390_dump_mem(gaddr, buff_len, buff);
> +}
> +
> +static int get_data_mem(DumpState *s, uint8_t *buff)
> +{
> +    int64_t memblock_size, memblock_start;
> +    GuestPhysBlock *block;
> +    uint64_t off;
> +
> +    QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        memblock_start = dump_filtered_memblock_start(block, s->filter_area_begin,
> +                                                      s->filter_area_length);
> +        if (memblock_start == -1) {
> +            continue;
> +        }
> +
> +        memblock_size = dump_filtered_memblock_size(block, s->filter_area_begin,
> +                                                    s->filter_area_length);
> +
> +        off = get_dump_stor_state_size_from_len(block->target_start);
> +        dump_mem(s, block->target_start, buff + off,
> +                 get_dump_stor_state_size_from_len(memblock_size));

This ignores the return value, if this is intentional a comment
explaining it would be nice.

> +    }
> +
> +    return 0;
> +}
> +
> +struct sections {
> +    uint64_t (*sections_size_func)(DumpState *s);
> +    int (*sections_contents_func)(DumpState *s, uint8_t *buff);
> +    char sctn_str[12];
> +} sections[] = {
> +    { get_size_stor_state, get_data_mem, "pv_mem_meta"},
> +    { get_size_complete, get_data_complete, "pv_compl"},
> +    {NULL , NULL, ""}
> +};

Could be static right?

> +
> +static uint64_t arch_sections_write_hdr(DumpState *s, uint8_t *buff)
> +{
> +    Elf64_Shdr *shdr = (void *)buff;
> +    struct sections *sctn = sections;
> +    uint64_t off = s->section_offset;
> +
> +    if (!s390_is_pv()) {
> +        return 0;
> +    }
> +
> +    for (; sctn->sections_size_func; off += shdr->sh_size, sctn++, shdr++) {
> +        memset(shdr, 0, sizeof(*shdr));

This isn't necessary since the header mem is zero allocated, but you
might not want to make guarantees about that. Maybe consider doing a
normal malloc and memsetting just the special 0 index section header in
dump.c.

> +        shdr->sh_type = SHT_PROGBITS;
> +        shdr->sh_offset = off;
> +        shdr->sh_size = sctn->sections_size_func(s);
> +        shdr->sh_name = s->string_table_buf->len;
> +        g_array_append_vals(s->string_table_buf, sctn->sctn_str, sizeof(sctn->sctn_str));
> +    }
> +
> +    return (uintptr_t)shdr - (uintptr_t)buff;
> +}
> +
> +
> +/* Add arch specific number of sections and their respective sizes */
> +static void arch_sections_add(DumpState *s)
> +{
> +    struct sections *sctn = sections;
> +
> +    /*
> +     * We only do a PV dump if we are running a PV guest, KVM supports
> +     * the dump API and we got valid dump length information.
> +     */
> +    if (!s390_is_pv() || !kvm_s390_get_protected_dump() ||
> +        !kvm_s390_pv_info_basic_valid()) {
> +        return;
> +    }
> +
> +    /*
> +     * Start the UV dump process by doing the initialize dump call via
> +     * KVM as the proxy.
> +     */
> +    if (!kvm_s390_dump_init()) {
> +            pv_dump_initialized = true;
> +    }
> +
> +    for (; sctn->sections_size_func; sctn++) {
> +        s->shdr_num += 1;
> +        s->elf_section_data_size += sctn->sections_size_func(s);
> +    }
> +
> +    /* We use the string table to identify the sections */
> +    s->string_table_usage = true;

In dump.c this value is being set if shdr_num > 0, so this seems
redundant.

> +}
> +
> +/*
> + * After the PV dump has been initialized, the CPU data has been
> + * fetched and memory has been dumped, we need to grab the tweak data
> + * and the completion data.
> + */
> +static void arch_sections_write(DumpState *s, uint8_t *buff)
> +{
> +    struct sections *sctn = sections;
> +
> +    /* shdr_num should only have been set > 1 if we are protected */
> +    assert(s390_is_pv());
> +
> +    for (; sctn->sections_size_func; sctn++) {
> +        sctn->sections_contents_func(s, buff);

As above with regards to ignoring return values.

> +        buff += sctn->sections_size_func(s);
> +    }
> +}
> +
>  int cpu_get_dump_info(ArchDumpInfo *info,
>                        const struct GuestPhysBlockList *guest_phys_blocks)
>  {
>      info->d_machine = EM_S390;
>      info->d_endian = ELFDATA2MSB;
>      info->d_class = ELFCLASS64;
> +    info->arch_sections_add_fn = *arch_sections_add;
> +    info->arch_sections_write_hdr_fn = *arch_sections_write_hdr;
> +    info->arch_sections_write_fn = *arch_sections_write;
>  
>      return 0;
>  }
> @@ -261,7 +448,7 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
>  {
>      int name_size = 8; /* "LINUX" or "CORE" + pad */
>      size_t elf_note_size = 0;
> -    int note_head_size;
> +    int note_head_size, content_size;
>      const NoteFuncDesc *nf;
>  
>      assert(class == ELFCLASS64);
> @@ -270,12 +457,15 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
>      note_head_size = sizeof(Elf64_Nhdr);
>  
>      for (nf = note_core; nf->note_contents_func; nf++) {
> -        elf_note_size = elf_note_size + note_head_size + name_size +
> -                        nf->contents_size;
> +        elf_note_size = elf_note_size + note_head_size + name_size + nf->contents_size;
>      }
>      for (nf = note_linux; nf->note_contents_func; nf++) {
> +        if (nf->pvonly && !s390_is_pv()) {
> +            continue;
> +        }
> +        content_size = nf->contents_size ? nf->contents_size : nf->note_size_func();
>          elf_note_size = elf_note_size + note_head_size + name_size +
> -                        nf->contents_size;
> +                        content_size;
>      }
>  
>      return (elf_note_size) * nr_cpus;


