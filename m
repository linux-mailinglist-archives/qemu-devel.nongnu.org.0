Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F046AE5ED
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:07:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZqL-0007Pd-F5; Tue, 07 Mar 2023 11:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZqI-0007OO-Sj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:07:10 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZqH-0002jL-3T
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:07:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id h14so12659853wru.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678205227;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0H/+Aloi1KiZg+ye6m8zoXqklBT/IfAyOTQ+13p4YMk=;
 b=BewN3PtsvMyJwYGyLWpl6bBq+SlhTspcjq9nuGvBobr+QVx8bTyP3XJ4xvE4aHNzuF
 oY2IhjwWimGjA9WqwI4DUlKDJG8RhHdwDQ+3+jeU5VOnDc0S/5uBxcj9hqUncUr8pTgX
 6S5rKNbzO5if6SxeS/FS/+21sQdVQog6/PXIn3uEP4E2EaY5cExY9GadQHeYW412aX2F
 bYyy9XI2BrkXgy/p5fBIZa4esns5VpvNcmHC8hh1IMd+AP8jPZYQunZj5hkx/c+Anm6k
 icV7Q0azz6RCP94vazUVzFIUo6oGnVTyu0dfRVe+RtmHJPvzYcT5s9BzWcfekz8dQy9J
 3ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678205227;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0H/+Aloi1KiZg+ye6m8zoXqklBT/IfAyOTQ+13p4YMk=;
 b=1RLTEp6dP+JrwG4O+gpvN2l5u0GvbtxRLdtxUImYkIFg3tlFy5iu1vdVJodanjRMJ3
 1b/dDIh972Njpk+OucnvN4kqtK+8wJWesvTxEmaFDjgWpkUoKzZZBVbbeoSq0G6lrQCm
 FmYUfr2Th7z7iTv4/iCNrWrY36rjRDIUrCfZs66lQzaAoI0lquJ5Z53svgEdh+hV+PUf
 bjoukpZ2VG4aenXmt5AqNLbRI1rwx7ASIhJCFQ7Gfm8FwE0WrTGrnpAqsqiLTm9fd3xP
 pM7iX6llTWDJrcTgZ8RhdAkGQHUuFmA4goUMTZOAmvNyrjp3psblr9kpItONy6BTv5mm
 aWag==
X-Gm-Message-State: AO0yUKVUsgNCbSPnnhEXBIirrdQAtsoM50AQ5aHOj35SIICnvxsFzMDo
 44rEb5IOapXTGSTPlVKYQ2Y=
X-Google-Smtp-Source: AK7set/hEKiuZhAKGXqh7OLuuCFpqLaIldCtdKFsHX1nROkJ2AzPbuOMO1Nn1rjJ9BWUmxmW2ZbrWQ==
X-Received: by 2002:a5d:4ecb:0:b0:2c7:17e0:54f5 with SMTP id
 s11-20020a5d4ecb000000b002c717e054f5mr8562529wrv.13.1678205227220; 
 Tue, 07 Mar 2023 08:07:07 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 j17-20020adff011000000b002c5a1bd527dsm12816184wro.96.2023.03.07.08.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:07:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ee8f307b-1e0a-6d6c-3edc-8f8262dcfe42@xen.org>
Date: Tue, 7 Mar 2023 16:07:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 21/25] hw/xen: Add emulated implementation of grant
 table operations
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-22-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-22-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This is limited to mapping a single grant at a time, because under Xen the
> pages are mapped *contiguously* into qemu's address space, and that's very
> hard to do when those pages actually come from anonymous mappings in qemu
> in the first place.
> 
> Eventually perhaps we can look at using shared mappings of actual objects
> for system RAM, and then we can make new mappings of the same backing
> store (be it deleted files, shmem, whatever). But for now let's stick to
> a page at a time.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c | 299 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 296 insertions(+), 3 deletions(-)
> 
[snip]
> +static uint64_t gnt_ref(XenGnttabState *s, grant_ref_t ref, int prot)
> +{
> +    uint16_t mask = GTF_type_mask | GTF_sub_page;
> +    grant_entry_v1_t gnt, *gnt_p;
> +    int retries = 0;
> +
> +    if (ref >= s->max_frames * ENTRIES_PER_FRAME_V1 ||
> +        s->map_track[ref] == UINT8_MAX) {
> +        return INVALID_GPA;
> +    }
> +
> +    if (prot & PROT_WRITE) {
> +        mask |= GTF_readonly;
> +    }
> +
> +    gnt_p = &s->entries.v1[ref];
> +
> +    /*
> +     * The guest can legitimately be changing the GTF_readonly flag. Allow

I'd call a guest playing with the ref after setting GTF_permit_access a 
buggy guest and not bother with the loop.

> +     * that, but don't let a malicious guest cause a livelock.
> +     */
> +    for (retries = 0; retries < 5; retries++) {
> +        uint16_t new_flags;
> +
> +        /* Read the entry before an atomic operation on its flags */
> +        gnt = *(volatile grant_entry_v1_t *)gnt_p;
> +
> +        if ((gnt.flags & mask) != GTF_permit_access ||
> +            gnt.domid != DOMID_QEMU) {
> +            return INVALID_GPA;
> +        }
> +
> +        new_flags = gnt.flags | GTF_reading;
> +        if (prot & PROT_WRITE) {
> +            new_flags |= GTF_writing;
> +        }
> +
> +        if (qatomic_cmpxchg(&gnt_p->flags, gnt.flags, new_flags) == gnt.flags) {

Xen actually does a cmpxchg on both the flags and the domid. We probably 
ought to fail to set the flags if the guest is playing with the domid 
but since we're single-tenant it doesn't *really* matter... just a 
nice-to-have. So...

Reviewed-by: Paul Durrant <paul@xen.org>


