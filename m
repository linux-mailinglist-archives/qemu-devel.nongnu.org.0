Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20AE46D90B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 17:57:33 +0100 (CET)
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0G4-00035u-Lu
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 11:57:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv0Eh-0001eo-2s
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:56:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv0Ea-0007ZG-Hf
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:56:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638982559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hBTLbHeY+mjC7BqPcjqvNwnfWBbNdpAaOUcQkjanvDA=;
 b=EpMOvbPArBIo/rln9YeVoi7MjKEYG3nK/HiUEjtJE26rJzZOtWNUNAxuljzpF8Xz67X8ZU
 fH5knonDNDwHkwOLFVuuTbhEr30SVfBtjD9va6RCw/KAZ6VzUfTuuDtjySXvfsqGP+EfwH
 s6papNiZMrQADpyxaO/a44gRa64mCbc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-QoIUjGmxNDCsLT2jTgk7og-1; Wed, 08 Dec 2021 11:55:57 -0500
X-MC-Unique: QoIUjGmxNDCsLT2jTgk7og-1
Received: by mail-wm1-f70.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso3293697wma.6
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 08:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hBTLbHeY+mjC7BqPcjqvNwnfWBbNdpAaOUcQkjanvDA=;
 b=faEhpJjtFh63WfWbDWMd0Jyvp5iLhxscXbnPpgYvISGvOThKrvGwWLBlxRX/lle9nw
 Ps0+wvE2FfkkPwlJ0idHS52kvigZndilsNa69KWZO5YW4ll0H0iRSKSDW3XOfGRWjBN+
 i5419RHEjGZpLvrCCsSnf/V0f0pRDy1rWbjGttExy0PW2bN5mzGWkaXSejQINyHJQEwx
 y6SybbiI6wGMp4DSYbkts9mo2vzE4vtlxDh4A0Qp2YALKmYC/oONSeq+JpswKKYspHax
 xx6b6kvpj8E7GgICUgJXoa1+74RJgEfVYGXienGZ4pqlGiLO8UfGfXt+N5F66aAmVmLW
 nYTQ==
X-Gm-Message-State: AOAM5335fPKEALOYtpYEZi7fgfvsYeBa1FYge99Y1Uk/2gxKj5EdsG7Y
 iY47/xxE3eAnxHGTRaA2+RflqQDDzhRb3O2Bn2JfsfcheeApxVW7xhZgM4WQnQMgmfE/atoC7HD
 naxt34DUhRXynClM=
X-Received: by 2002:adf:e68f:: with SMTP id r15mr59328141wrm.359.1638982556792; 
 Wed, 08 Dec 2021 08:55:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqJ0VbnvO2VnXSJg+o/AapfT5ipiaCI2GR6nXo8psx6aYMIZ7qBJ8t6+n6ccA0SgNxMtl68Q==
X-Received: by 2002:adf:e68f:: with SMTP id r15mr59328110wrm.359.1638982556563; 
 Wed, 08 Dec 2021 08:55:56 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o9sm3253467wrs.4.2021.12.08.08.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 08:55:56 -0800 (PST)
Date: Wed, 8 Dec 2021 16:55:54 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 3/7] migration: Drop postcopy_chunk_hostpages()
Message-ID: <YbDjmnW7uFKYvPAk@work-vm>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-4-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207115016.73195-4-peterx@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> This function calls three functions:
> 
>   - postcopy_discard_send_init(ms, block->idstr);
>   - postcopy_chunk_hostpages_pass(ms, block);
>   - postcopy_discard_send_finish(ms);
> 
> However only the 2nd function call is meaningful.  It's major role is to make
> sure dirty bits are applied in host-page-size granule, so there will be no
> partial dirty bits set for a whole host page if huge pages are used.
> 
> The 1st/3rd call are for latter when we want to send the disgard ranges.
> They're mostly no-op here besides some tracepoints (which are misleading!).
> 
> Drop them, then we can directly drop postcopy_chunk_hostpages() as a whole
> because we can call postcopy_chunk_hostpages_pass() directly.
> 
> There're still some nice comments above postcopy_chunk_hostpages() that explain
> what it does.  Copy it over to the caller's site.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yeh, I think originally the idea was to send some of the messages during
the chunking

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 33 +++++++--------------------------
>  1 file changed, 7 insertions(+), 26 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index fb8c1a887e..e3876181ab 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2576,30 +2576,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
>      }
>  }
>  
> -/**
> - * postcopy_chunk_hostpages: discard any partially sent host page
> - *
> - * Utility for the outgoing postcopy code.
> - *
> - * Discard any partially sent host-page size chunks, mark any partially
> - * dirty host-page size chunks as all dirty.  In this case the host-page
> - * is the host-page for the particular RAMBlock, i.e. it might be a huge page
> - *
> - * @ms: current migration state
> - * @block: block we want to work with
> - */
> -static void postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
> -{
> -    postcopy_discard_send_init(ms, block->idstr);
> -
> -    /*
> -     * Ensure that all partially dirty host pages are made fully dirty.
> -     */
> -    postcopy_chunk_hostpages_pass(ms, block);
> -
> -    postcopy_discard_send_finish(ms);
> -}
> -
>  /**
>   * ram_postcopy_send_discard_bitmap: transmit the discard bitmap
>   *
> @@ -2631,8 +2607,13 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
>      rs->last_page = 0;
>  
>      RAMBLOCK_FOREACH_NOT_IGNORED(block) {
> -        /* Deal with TPS != HPS and huge pages */
> -        postcopy_chunk_hostpages(ms, block);
> +        /*
> +         * Deal with TPS != HPS and huge pages.  It discard any partially sent
> +         * host-page size chunks, mark any partially dirty host-page size
> +         * chunks as all dirty.  In this case the host-page is the host-page
> +         * for the particular RAMBlock, i.e. it might be a huge page.
> +         */
> +        postcopy_chunk_hostpages_pass(ms, block);
>      }
>      trace_ram_postcopy_send_discard_bitmap();
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


