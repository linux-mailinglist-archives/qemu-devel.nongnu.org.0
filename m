Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C039C680591
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:25:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMec-0002Gb-Po; Mon, 30 Jan 2023 00:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMeZ-0002GO-Aw
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:24:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMeX-00034z-QC
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675056265;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zzW+R7rkCHgIANKKBPrNOqdLZmMpoigqndt4xngmKL4=;
 b=YBgPO+W01kBmbfzqdfMuxATz4dnd0f4jCpf0+jlS0qbPVgl7MEdjzIpPLTR+d5AgPj4Alr
 DE1Y/j2hwZBnam02CmYO0eGBN/HUxpiWgo7n49vyvHhh1b5HjTsKeig/4pNR0TEigH+zzE
 3zxi+S1+sJ9LMk8Lr3dRh+mv92VyT2k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-EOOxAQptPuaZdGQ82eCigg-1; Mon, 30 Jan 2023 00:24:23 -0500
X-MC-Unique: EOOxAQptPuaZdGQ82eCigg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o31-20020a05600c511f00b003dc53da325dso2153859wms.8
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zzW+R7rkCHgIANKKBPrNOqdLZmMpoigqndt4xngmKL4=;
 b=qVaEut6zuiC0TS6FhMtZArFJfFFQnT8gl0/y/Zr2FUCm286hf9REuV0YNGpFIDM21B
 mLrEYH6g3g9AHarpb8BWXs2fPNNbsdGazdjkFe28aZfFN8XdpCro/70APnK0xsU16XWL
 mJmJlqjgUJfkmmGxJMcK27v+GTiRwNlQgz191ujPQwLh+V4v00Nwb5uI9cNTxAOetnAc
 prgO3gr4cYFh59rftFTTLYMIUvfo/U0GULeWVw3yuJFY1dMjTFkvuAy7m/nLfkx9p6ZM
 6EB7Dtv+qIG+nbZStOCPMFc8z6uzOURDHtyYwLGz7aqND7fya8BwPstmGpJYBIzzXjwZ
 hGvw==
X-Gm-Message-State: AO0yUKVgTae5UQUZeOLkw93fnoOEiYrfLgm9pgIPB7Hj7k0NzpmyKn8A
 zIz2+oqFFMy0b8f492LOgp/gTuim0IJKocspXCgchXONcmpFDEGU7aqzTCVWDhdlcAC7R3JeELq
 Fgo+kV00MLzbYXjQ=
X-Received: by 2002:adf:eb04:0:b0:2bf:bc75:1730 with SMTP id
 s4-20020adfeb04000000b002bfbc751730mr14017732wrn.70.1675056262406; 
 Sun, 29 Jan 2023 21:24:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/aDfT2nWjDHo8TlmIXXVCdtg/ULYEzmgqerlJDgCeo3kWUfvta+eiUlF5drjarioia3x5xAg==
X-Received: by 2002:adf:eb04:0:b0:2bf:bc75:1730 with SMTP id
 s4-20020adfeb04000000b002bfbc751730mr14017718wrn.70.1675056262122; 
 Sun, 29 Jan 2023 21:24:22 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 f6-20020a5d50c6000000b002bfc24e1c55sm10803908wrt.78.2023.01.29.21.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:24:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 14/21] migration: Map hugetlbfs ramblocks twice, and
 pre-allocate
In-Reply-To: <20230117220914.2062125-15-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:07 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-15-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:24:20 +0100
Message-ID: <87edrciohn.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Add a RAMBlock.host_mirror for all the hugetlbfs backed guest memories.
> It'll be used to remap the same region twice and it'll be used to service
> page faults using UFFDIO_CONTINUE.
>
> To make sure all accesses to these ranges will generate minor page faults
> not missing page faults, we need to pre-allocate the files to make sure
> page cache exist start from the beginning.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

but what about this change

> ---
>  include/exec/ramblock.h |  7 +++++
>  migration/ram.c         | 59 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>
> diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
> index 3f31ce1591..c76683c3c8 100644
> --- a/include/exec/ramblock.h
> +++ b/include/exec/ramblock.h
> @@ -28,6 +28,13 @@ struct RAMBlock {
>      struct rcu_head rcu;
>      struct MemoryRegion *mr;
>      uint8_t *host;
> +    /*
> +     * This is only used for hugetlbfs ramblocks where doublemap is
> +     * enabled.  The pointer is managed by dest host migration code, and
> +     * should be NULL when migration is finished.  On src host, it should
> +     * always be NULL.
> +     */
> +    uint8_t *host_mirror;

I would consider here:

    uint8_t *host_doublemap;

as I have not a small name that means
    uint8_t *host_map_smaller_size_pages;

That explains why we need it.


>      uint8_t *colo_cache; /* For colo, VM's ram cache */
>      ram_addr_t offset;
>      ram_addr_t used_length;
> diff --git a/migration/ram.c b/migration/ram.c
> index 2ebf414f5f..37d7b3553a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3879,6 +3879,57 @@ void colo_release_ram_cache(void)
>      ram_state_cleanup(&ram_state);
>  }
>  
> +static int migrate_hugetlb_doublemap_init(void)
> +{
> +    RAMBlock *rb;
> +    void *addr;
> +    int ret;

Not initialized variables, remove the last two.

> +    if (!migrate_hugetlb_doublemap()) {
> +        return 0;
> +    }
> +

I would move the declaration of the RAMBlock here.

> +    RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
> +        if (qemu_ram_is_hugetlb(rb)) {
> +            /*
> +             * Firstly, we remap the same ramblock into another range of
> +             * virtual address, so that we can write to the pages without
> +             * touching the page tables that directly mapped for the guest.
> +             */
> +            addr = ramblock_file_map(rb);

               void *addr = ramblock_file_map(rb);

> +            if (addr == MAP_FAILED) {
> +                ret = -errno;
                   int ret = -errno;
> +                error_report("%s: Duplicate mapping for hugetlb ramblock '%s'"
> +                             "failed: %s", __func__, qemu_ram_get_idstr(rb),
> +                             strerror(errno));
> +                return ret;
> +            }
> +            rb->host_mirror = addr;
> +
> +            /*
> +             * We need to make sure we pre-allocate the range with
> +             * hugetlbfs pages before hand, so that all the page fault will
> +             * be trapped as MINOR faults always, rather than MISSING
> +             * faults in userfaultfd.
> +             */
> +            ret = qemu_madvise(addr, rb->mmap_length, QEMU_MADV_POPULATE_WRITE);

               int ret = qemu_madvise(addr, rb->mmap_length, QEMU_MADV_POPULATE_WRITE);

> +            if (ret) {
> +                error_report("Failed to populate hugetlb ramblock '%s': "
> +                             "%s", qemu_ram_get_idstr(rb), strerror(-ret));
> +                return ret;
> +            }
> +        }
> +    }
> +
> +    /*
> +     * When reach here, it means we've setup the mirror mapping for all the
> +     * hugetlbfs pages.  Hence when page fault happens, we'll be able to
> +     * resolve page faults using UFFDIO_CONTINUE for hugetlbfs pages, but
> +     * we'll keep using UFFDIO_COPY for anonymous pages.
> +     */
> +    return 0;
> +}


