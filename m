Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB08467B45F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 15:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKgis-0001nH-ES; Wed, 25 Jan 2023 09:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pKgir-0001n9-5f
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 09:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pKgip-0006XK-3m
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 09:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674656752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D1wSWaPlYQ00BrWZjKxB64IqvfgDEx7C9a3JlD004KQ=;
 b=QsgDlA98N2TcXX57Sc+MeNdRDdeiQ40QtmV+3c5vvqxhRVvhOlEog8+irordQgVFP3doik
 22zBysDBJ1cNJjUb+Qhk8No9HjWoxrEjSDRu542C/UfxhweluFr12pp9uH1dEoQSZ9qsAJ
 qXcgE9hugw/R2qSFB4V77+oh9uj453w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-rNYK4v4IMQ6CVSslXDwu6g-1; Wed, 25 Jan 2023 09:25:51 -0500
X-MC-Unique: rNYK4v4IMQ6CVSslXDwu6g-1
Received: by mail-wm1-f69.google.com with SMTP id
 12-20020a05600c228c00b003db09699216so604502wmf.1
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 06:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1wSWaPlYQ00BrWZjKxB64IqvfgDEx7C9a3JlD004KQ=;
 b=PmXLBpD2ZV+YsEeVjW+1VhshVoe5M9+ATW1sbyoQGkyCZQ7m0LnhSvAfbPUQ6MOm6O
 tR13d+2OveqmVpFF60o1PHzPHWTgd1+eToNaL6AGO8+GrHKxIdW6eH43v2+SuOhbVl27
 UXVE31sRIuy34C+/9+aPMS1AgMVUgTJ9g/LGHg90tSC2bfoSEZu/Oup6NULsF8Mvr8mz
 30C5BJKD9YiSGdGaVvP1Ln1GFn7qrVPOiMtbWMLC3KOLIM5R/iZBkFk9wSmoGboQn5ge
 ANJhynZPV2e2fofxq7lhP75QZo8zUB3t7s0MNVM9/Qv7EcRNQ/Tts0f+RRrWBSSFbWVJ
 VkSg==
X-Gm-Message-State: AFqh2kqsi1Lqi8yGbgd0v8FFThuVO02Jp9v4CETaK3herUeds758id2q
 9a2a/CR/fJzChRRgJRUaJBQyaGXNqDAaTXiuC8UvzYIR39twLRpjEIUjMIV6rfqvuOjr5Qt4Xxi
 njsP41YTFMfSC7z0=
X-Received: by 2002:a5d:4588:0:b0:2bb:f255:6bb4 with SMTP id
 p8-20020a5d4588000000b002bbf2556bb4mr21542066wrq.25.1674656750104; 
 Wed, 25 Jan 2023 06:25:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvItABFDviB2PescErMCQmX1pr7rnCsNxb12xlkuL533pe3Uf6034fB8l9w1USQ+hpieSrIew==
X-Received: by 2002:a5d:4588:0:b0:2bb:f255:6bb4 with SMTP id
 p8-20020a5d4588000000b002bbf2556bb4mr21542037wrq.25.1674656749629; 
 Wed, 25 Jan 2023 06:25:49 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d6842000000b002be5401ef5fsm4625316wrw.39.2023.01.25.06.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 06:25:49 -0800 (PST)
Date: Wed, 25 Jan 2023 14:25:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 14/21] migration: Map hugetlbfs ramblocks twice, and
 pre-allocate
Message-ID: <Y9E769Iag8YL5iQy@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-15-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-15-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Xu (peterx@redhat.com) wrote:
> Add a RAMBlock.host_mirror for all the hugetlbfs backed guest memories.
> It'll be used to remap the same region twice and it'll be used to service
> page faults using UFFDIO_CONTINUE.
> 
> To make sure all accesses to these ranges will generate minor page faults
> not missing page faults, we need to pre-allocate the files to make sure
> page cache exist start from the beginning.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

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
> +
> +    if (!migrate_hugetlb_doublemap()) {
> +        return 0;
> +    }
> +
> +    RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
> +        if (qemu_ram_is_hugetlb(rb)) {
> +            /*
> +             * Firstly, we remap the same ramblock into another range of
> +             * virtual address, so that we can write to the pages without
> +             * touching the page tables that directly mapped for the guest.
> +             */
> +            addr = ramblock_file_map(rb);
> +            if (addr == MAP_FAILED) {
> +                ret = -errno;
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
> +
>  /**
>   * ram_load_setup: Setup RAM for migration incoming side
>   *
> @@ -3893,6 +3944,10 @@ static int ram_load_setup(QEMUFile *f, void *opaque)
>          return -1;
>      }
>  
> +    if (migrate_hugetlb_doublemap_init()) {
> +        return -1;
> +    }
> +
>      xbzrle_load_setup();
>      ramblock_recv_map_init();
>  
> @@ -3913,6 +3968,10 @@ static int ram_load_cleanup(void *opaque)
>      RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
>          g_free(rb->receivedmap);
>          rb->receivedmap = NULL;
> +        if (rb->host_mirror) {
> +            munmap(rb->host_mirror, rb->mmap_length);
> +            rb->host_mirror = NULL;
> +        }
>      }
>  
>      return 0;
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


