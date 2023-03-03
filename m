Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1037C6A9BC3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:30:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8HW-0005K4-Ob; Fri, 03 Mar 2023 11:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8HU-0005Je-69
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY8HS-00049i-5o
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677860952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ClTWnq2iK5IAmHwhRJBDQkvVrW+9OXdc24pftWVEDc=;
 b=J37CUL9Ys5NCEh0bSKFTIDN1Yg6ZSLKhZc5h22+nILOJFgxTVoUXQfi0axDIORn4HQXPe8
 +XXkIpqTqEZ80ediqjnA7SUqIMvGydD55aFDPRPrZnaQHUDPNTODnBX9TgbyqQYJtx+oa+
 lO6WoDeyrdpY7ghAQ2MFq7ac/nMU5c4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-fG3GYtKfM-mJQd6qu1M4Xg-1; Fri, 03 Mar 2023 11:29:11 -0500
X-MC-Unique: fG3GYtKfM-mJQd6qu1M4Xg-1
Received: by mail-wm1-f71.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so3067833wmj.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ClTWnq2iK5IAmHwhRJBDQkvVrW+9OXdc24pftWVEDc=;
 b=YNoCjMldeNkWb65UajgbbJsPqJhhA6olTJ6shdnsoI9Ayg8XWiNLotUC26SWuDLGme
 G38Wdmg6xlxp9ltE4HfOsmrnZHkTnjX0ku1eHYIKelIacrEgh3dIAf1hf2wqHfoGe9+x
 skpiygJki6jeD4DyikTQEbQrb3EJjxxJt4PRDrdjSPBRFbImLdqmyCZx9E5B33ddGBUO
 bzq038RzYEq43Vc7qcDdmp3lvxQeDTlCOZmjE40wPq0RirApNjzYzBniSBKWTW4ejVTQ
 fRhGB3yGSAtQMPVr1WKgQYAaa78Rzvr1+E2vQsmnmRx62IojYO6rNcbIPX3WZaTb1S96
 eYqA==
X-Gm-Message-State: AO0yUKWAqYmof0p3J5Wj05RzLDFUAjGEyw2D3OUgbvCNNeUPteYmaY3h
 XrC0e7bSSeShDdFFjZQpdUMM+w6WxzpZZSipf2LvwVkt74ZoiGL+9YxKI28O9/u8LvPeAnIIzSQ
 jUWnEqbzrf4RCdOY=
X-Received: by 2002:a05:600c:a49:b0:3eb:3692:644e with SMTP id
 c9-20020a05600c0a4900b003eb3692644emr2087451wmq.33.1677860950524; 
 Fri, 03 Mar 2023 08:29:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9QWZOwHxQXeMRtQnbDqRt9y22JP3+DugJ5kmgZGqVvaECi6Z4eW9j+gp446IvlDKrUgFMcQA==
X-Received: by 2002:a05:600c:a49:b0:3eb:3692:644e with SMTP id
 c9-20020a05600c0a4900b003eb3692644emr2087432wmq.33.1677860950154; 
 Fri, 03 Mar 2023 08:29:10 -0800 (PST)
Received: from [192.168.8.103] (tmo-099-97.customers.d1-online.com.
 [80.187.99.97]) by smtp.gmail.com with ESMTPSA id
 k21-20020a7bc415000000b003e206cc7237sm6363963wmi.24.2023.03.03.08.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 08:29:09 -0800 (PST)
Message-ID: <d374643a-3129-36cc-c92a-f81a4aff2d34@redhat.com>
Date: Fri, 3 Mar 2023 17:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: jrossi@linux.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Cc: frankja@linux.ibm.com, jjherne@linux.ibm.com,
 Eric Farman <farman@linux.ibm.com>
References: <20230221174548.1866861-1-jrossi@linux.ibm.com>
 <20230221174548.1866861-2-jrossi@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RESEND PATCH 1/1] pc-bios: Add support for List-Directed IPL
 from ECKD DASD
In-Reply-To: <20230221174548.1866861-2-jrossi@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/02/2023 18.45, jrossi@linux.ibm.com wrote:
> From: Jared Rossi <jrossi@linux.ibm.com>
> 
> Check for a List Directed IPL Boot Record, which would supersede the CCW type
> entries.  If the record is valid, proceed to use the new style pointers
> and perform LD-IPL. Each block pointer is interpreted as either an LD-IPL
> pointer or a legacy CCW pointer depending on the type of IPL initiated.
> 
> In either case CCW- or LD-IPL is transparent to the user and will boot the same
> image regardless of which set of pointers is used. Because the interactive boot
> menu is only written with the old style pointers, the menu will be disabled for
> List Directed IPL from ECKD DASD.
> 
> If the LD-IPL fails, retry the IPL using the CCW type pointers.
> 
> If no LD-IPL boot record is found, simply perform CCW type IPL as usual.
> 
> Signed-off-by: Jared Rossi <jrossi@linux.ibm.com>
> 
> ---
>   pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---------
>   pc-bios/s390-ccw/bootmap.h |  30 ++++++-
>   2 files changed, 148 insertions(+), 39 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
> index 994e59c0b0..77229f93f3 100644
> --- a/pc-bios/s390-ccw/bootmap.c
> +++ b/pc-bios/s390-ccw/bootmap.c
> @@ -72,42 +72,74 @@ static inline void verify_boot_info(BootInfo *bip)
>                  "Bad block size in zIPL section of the 1st record.");
>   }
>   
> -static block_number_t eckd_block_num(EckdCHS *chs)
> +static void eckd_format_chs(ExtEckdBlockPtr *ptr,  bool ldipl,
> +                            uint64_t *c,
> +                            uint64_t *h,
> +                            uint64_t *s)
> +{
> +    if (ldipl) {
> +        *c = ptr->ldptr.chs.cylinder;
> +        *h = ptr->ldptr.chs.head;
> +        *s = ptr->ldptr.chs.sector;
> +    } else {
> +        *c = ptr->bptr.chs.cylinder;
> +        *h = ptr->bptr.chs.head;
> +        *s = ptr->bptr.chs.sector;
> +    }
> +}
> +
> +static block_number_t eckd_chs_to_block(uint64_t c, uint64_t h, uint64_t s)
>   {
>       const uint64_t sectors = virtio_get_sectors();
>       const uint64_t heads = virtio_get_heads();
> -    const uint64_t cylinder = chs->cylinder
> -                            + ((chs->head & 0xfff0) << 12);
> -    const uint64_t head = chs->head & 0x000f;
> +    const uint64_t cylinder = c + ((h & 0xfff0) << 12);
> +    const uint64_t head = h & 0x000f;
>       const block_number_t block = sectors * heads * cylinder
>                                  + sectors * head
> -                               + chs->sector
> -                               - 1; /* block nr starts with zero */
> +                               + s - 1; /* block nr starts with zero */
>       return block;
>   }
>   
> -static bool eckd_valid_address(BootMapPointer *p)
> +static block_number_t eckd_block_num(EckdCHS *chs)
>   {
> -    const uint64_t head = p->eckd.chs.head & 0x000f;
> +    return eckd_chs_to_block(chs->cylinder, chs->head, chs->sector);
> +}
> +
> +static block_number_t gen_eckd_block_num(ExtEckdBlockPtr *ptr, bool ldipl)
> +{
> +    uint64_t cyl, head, sec;
> +    eckd_format_chs(ptr, ldipl, &cyl, &head, &sec);
> +    return eckd_chs_to_block(cyl, head, sec);
> +}
>   
> +static bool eckd_valid_chs(uint64_t cyl, uint64_t head, uint64_t sector)
> +{
>       if (head >= virtio_get_heads()
> -        ||  p->eckd.chs.sector > virtio_get_sectors()
> -        ||  p->eckd.chs.sector <= 0) {
> +        || sector > virtio_get_sectors()
> +        || sector <= 0) {
>           return false;
>       }
>   
>       if (!virtio_guessed_disk_nature() &&
> -        eckd_block_num(&p->eckd.chs) >= virtio_get_blocks()) {
> +        eckd_chs_to_block(cyl, head, sector) >= virtio_get_blocks()) {
>           return false;
>       }
>   
>       return true;
>   }
>   
> -static block_number_t load_eckd_segments(block_number_t blk, uint64_t *address)
> +static bool eckd_valid_address(ExtEckdBlockPtr *ptr, bool ldipl)
> +{
> +    uint64_t cyl, head, sec;
> +    eckd_format_chs(ptr, ldipl, &cyl, &head, &sec);
> +    return eckd_valid_chs(cyl, head, sec);
> +}

It would have been nice to split the rework of eckd_block_num() and 
eckd_valid_address() into a separate patch first to ease review.

> +static block_number_t load_eckd_segments(block_number_t blk, bool ldipl,
> +                                         uint64_t *address)
>   {
>       block_number_t block_nr;
> -    int j, rc;
> +    int j, rc, count;
>       BootMapPointer *bprs = (void *)_bprs;
>       bool more_data;
>   
> @@ -117,7 +149,7 @@ static block_number_t load_eckd_segments(block_number_t blk, uint64_t *address)
>       do {
>           more_data = false;
>           for (j = 0;; j++) {
> -            block_nr = eckd_block_num(&bprs[j].xeckd.bptr.chs);
> +            block_nr = gen_eckd_block_num(&bprs[j].xeckd, ldipl);
>               if (is_null_block_number(block_nr)) { /* end of chunk */
>                   break;
>               }
> @@ -129,11 +161,26 @@ static block_number_t load_eckd_segments(block_number_t blk, uint64_t *address)
>                   break;
>               }
>   
> -            IPL_assert(block_size_ok(bprs[j].xeckd.bptr.size),
> +            /* List directed pointer does not store block size */
> +            IPL_assert(ldipl || block_size_ok(bprs[j].xeckd.bptr.size),
>                          "bad chunk block size");
> -            IPL_assert(eckd_valid_address(&bprs[j]), "bad chunk ECKD addr");
>   
> -            if ((bprs[j].xeckd.bptr.count == 0) && unused_space(&(bprs[j+1]),
> +            if (!eckd_valid_address(&bprs[j].xeckd, ldipl)) {
> +                /*
> +                 * If an invalid address is found during LD-IPL then break and
> +                 * retry as CCW
> +                 */
> +                IPL_assert(ldipl, "bad chunk ECKD addr");
> +                break;
> +            }
> +
> +            if (ldipl) {
> +                count = bprs[j].xeckd.ldptr.count;
> +            } else {
> +                count = bprs[j].xeckd.bptr.count;
> +            }
> +
> +            if ((count == 0) && unused_space(&(bprs[j + 1]),

I know this is pre-existing in the code, but I'd be fine if we'd drop the 
superfluous parantheses here while you're touching this line anyway.

>                   sizeof(EckdBlockPtr))) {
>                   /* This is a "continue" pointer.
>                    * This ptr should be the last one in the current
> @@ -149,11 +196,10 @@ static block_number_t load_eckd_segments(block_number_t blk, uint64_t *address)
>               /* Load (count+1) blocks of code at (block_nr)
>                * to memory (address).
>                */
> -            rc = virtio_read_many(block_nr, (void *)(*address),
> -                                  bprs[j].xeckd.bptr.count+1);
> +            rc = virtio_read_many(block_nr, (void *)(*address), count + 1);
>               IPL_assert(rc == 0, "code chunk read failed");
>   
> -            *address += (bprs[j].xeckd.bptr.count+1) * virtio_get_block_size();
> +            *address += (count + 1) * virtio_get_block_size();
>           }
>       } while (more_data);
>       return block_nr;
> @@ -237,8 +283,10 @@ static void run_eckd_boot_script(block_number_t bmt_block_nr,
>       uint64_t address;
>       BootMapTable *bmt = (void *)sec;
>       BootMapScript *bms = (void *)sec;
> +    /* The S1B block number is NULL_BLOCK_NR if and only if it's an LD-IPL */
> +    bool ldipl = (s1b_block_nr == NULL_BLOCK_NR);
>   
> -    if (menu_is_enabled_zipl()) {
> +    if (menu_is_enabled_zipl() && !ldipl) {
>           loadparm = eckd_get_boot_menu_index(s1b_block_nr);
>       }
>   
> @@ -249,7 +297,7 @@ static void run_eckd_boot_script(block_number_t bmt_block_nr,
>       memset(sec, FREE_SPACE_FILLER, sizeof(sec));
>       read_block(bmt_block_nr, sec, "Cannot read Boot Map Table");
>   
> -    block_nr = eckd_block_num(&bmt->entry[loadparm].xeckd.bptr.chs);
> +    block_nr = gen_eckd_block_num(&bmt->entry[loadparm].xeckd, ldipl);
>       IPL_assert(block_nr != -1, "Cannot find Boot Map Table Entry");
>   
>       memset(sec, FREE_SPACE_FILLER, sizeof(sec));
> @@ -264,13 +312,18 @@ static void run_eckd_boot_script(block_number_t bmt_block_nr,
>           }
>   
>           address = bms->entry[i].address.load_address;
> -        block_nr = eckd_block_num(&bms->entry[i].blkptr.xeckd.bptr.chs);
> +        block_nr = gen_eckd_block_num(&bms->entry[i].blkptr.xeckd, ldipl);
>   
>           do {
> -            block_nr = load_eckd_segments(block_nr, &address);
> +            block_nr = load_eckd_segments(block_nr, ldipl, &address);
>           } while (block_nr != -1);
>       }
>   
> +    if (ldipl && bms->entry[i].type != BOOT_SCRIPT_EXEC) {
> +        /* Abort LD-IPL and retry as CCW-IPL */
> +        return;
> +    }
> +
>       IPL_assert(bms->entry[i].type == BOOT_SCRIPT_EXEC,
>                  "Unknown script entry type");
>       write_reset_psw(bms->entry[i].address.load_address); /* no return */
> @@ -380,6 +433,23 @@ static void ipl_eckd_ldl(ECKD_IPL_mode_t mode)
>       /* no return */
>   }
>   
> +static block_number_t eckd_find_bmt(ExtEckdBlockPtr *ptr)
> +{
> +    block_number_t blockno;
> +    uint8_t tmp_sec[MAX_SECTOR_SIZE];

Don't we need some alignment for tmp_sec? Would it be possible to use the 
sec[] buffer for this instead?

(Hmm, we're also doing this in the zipl_run() function ... so it likely 
works ... still, it looks fragile to me)

> +    BootRecord *br;
> +
> +    blockno = gen_eckd_block_num(ptr, 0);
> +    read_block(blockno, tmp_sec, "Cannot read boot record");
> +    br = (BootRecord *)tmp_sec;
> +    if (!magic_match(br->magic, ZIPL_MAGIC)) {
> +        /* If the boot record is invalid, return and try CCW-IPL instead */
> +        return NULL_BLOCK_NR;
> +    }
> +
> +    return gen_eckd_block_num(&br->pgt.xeckd, 1);
> +}
> +
>   static void print_eckd_msg(void)
>   {
>       char msg[] = "Using ECKD scheme (block size *****), ";
> @@ -401,28 +471,43 @@ static void print_eckd_msg(void)
>   
>   static void ipl_eckd(void)
>   {
> -    XEckdMbr *mbr = (void *)sec;
> -    LDL_VTOC *vlbl = (void *)sec;
> +    IplVolumeLabel *vlbl = (void *)sec;
> +    LDL_VTOC *vtoc = (void *)sec;
> +    block_number_t ldipl_bmt; /* Boot Map Table for List-Directed IPL */
>   
>       print_eckd_msg();
>   
> -    /* Grab the MBR again */
> +    /* Block 2 can contain either the CDL VOL1 label or the LDL VTOC */
>       memset(sec, FREE_SPACE_FILLER, sizeof(sec));
> -    read_block(0, mbr, "Cannot read block 0 on DASD");
> +    read_block(2, vlbl, "Cannot read block 2");
>   
> -    if (magic_match(mbr->magic, IPL1_MAGIC)) {
> -        ipl_eckd_cdl();         /* only returns in case of error */
> -        return;
> +    /*
> +     * First check for a list-directed-format pointer which would
> +     * supersede the CCW pointer.
> +     */
> +    if (eckd_valid_address((ExtEckdBlockPtr *)&vlbl->f.br, 0)) {
> +        ldipl_bmt = eckd_find_bmt((ExtEckdBlockPtr *)&vlbl->f.br);
> +        if (ldipl_bmt) {
> +            sclp_print("List-Directed\n");
> +            /* LD-IPL does not use the S1B bock, just make it NULL */
> +            run_eckd_boot_script(ldipl_bmt, NULL_BLOCK_NR);
> +            /* Only return in error, retry as CCW-IPL */
> +            sclp_print("Retrying IPL ");
> +            print_eckd_msg();
> +        }
> +        memset(sec, FREE_SPACE_FILLER, sizeof(sec));
> +        read_block(2, vtoc, "Cannot read block 2");
>       }
>   
> -    /* LDL/CMS? */
> -    memset(sec, FREE_SPACE_FILLER, sizeof(sec));
> -    read_block(2, vlbl, "Cannot read block 2");
> +    /* Not list-directed */
> +    if (magic_match(vtoc->magic, VOL1_MAGIC)) {
> +        ipl_eckd_cdl(); /* may return in error */
> +    }
>   
> -    if (magic_match(vlbl->magic, CMS1_MAGIC)) {
> +    if (magic_match(vtoc->magic, CMS1_MAGIC)) {
>           ipl_eckd_ldl(ECKD_CMS); /* no return */
>       }
> -    if (magic_match(vlbl->magic, LNX1_MAGIC)) {
> +    if (magic_match(vtoc->magic, LNX1_MAGIC)) {
>           ipl_eckd_ldl(ECKD_LDL); /* no return */
>       }

  Thomas


