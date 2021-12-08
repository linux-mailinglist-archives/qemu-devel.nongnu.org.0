Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C71D46D834
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 17:30:15 +0100 (CET)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muzpd-0003ka-83
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 11:30:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1muzo7-0002qI-La
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:28:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1muzo4-0006gJ-7m
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638980915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=je1zgyC3GRjFG+tIFEJoZpkrWsBvn2xCV45PTTr7+6E=;
 b=HTyys3w2Zc2VVICs2fq/l8bWi/7UQ08XRd75SsGm8JxjAqfqSjt3Z/OWBVEzXn61ByV8lv
 G27ZLJ4XwPN5MtEBkSZPHZlTl0nbr6W1U/hshcMbHBmfIGxe+bDJE5ti1eUGvqz7MR4ASd
 e8mzUwWtPgnBBGG9vmXNd6ZzoD2D0Ns=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-Skm8ROUtNd6xEzPv3TKIqQ-1; Wed, 08 Dec 2021 11:28:31 -0500
X-MC-Unique: Skm8ROUtNd6xEzPv3TKIqQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so555130wrd.1
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 08:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=je1zgyC3GRjFG+tIFEJoZpkrWsBvn2xCV45PTTr7+6E=;
 b=cV22rBQ9CrAY78778iIh39qlR0+TwhNRQRRTsL6fLV9nHlJHTwf/Lxw9GK3zDukUxz
 zcNbX2orUpaWGvJssc9U6Mz9WheSyyzfAGjnpyKlZwACsgQuuaCU0a8ubHo4odgn5fLW
 8AJoBl3Zb8OLaI8JSmdXsi9lu0NZLyo/tNyQZI8bbY3IsaShLYVyl6+aJk9kVUPT1v1c
 ElS2uWoyakT5ZsVa/GGha8o7vm6BmUDuWfaahZ5Q8jkDpaiF0EoefnDrIx6YPSQrnoa9
 iyarPz0EitrLuiR2IaTobQgwILi/ZWYVzhZ1kVRvjnqXZ8YKTw5Igh/EDK+fLM3unV8x
 hkVA==
X-Gm-Message-State: AOAM533XxJqzZiOCVvpdcPowbNST2KTnwPPyllosvSRY14DNI6ZrtEK0
 EuNc9TsWVRpm/kSpts75RK2a+okHQpUVfwOgWrdm4S64wY178qu3UAxvwMGhkhVCzWb6WiqFnwZ
 rLiQARBfrVThHnBI=
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr17924868wme.188.1638980910577; 
 Wed, 08 Dec 2021 08:28:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ5DslvwKdsRexO9xQJ6mmAk9UmpJozPLu43ewtNrNLDaDcdkQSI3h2R1TjIdVqpGkQvikkA==
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr17924841wme.188.1638980910303; 
 Wed, 08 Dec 2021 08:28:30 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z6sm4028401wmp.9.2021.12.08.08.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 08:28:29 -0800 (PST)
Date: Wed, 8 Dec 2021 16:28:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 2/7] migration: Don't return for postcopy_chunk_hostpages()
Message-ID: <YbDdKw8Pyn55agDw@work-vm>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207115016.73195-3-peterx@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> It always return zero, because it just can't go wrong so far.  Simplify the
> code with no functional change.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

OK, I was wondering if the discard_send_finish could fail, but I chased
it another 3 or 4 levels and nothing returns an error flag either.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 756ac800a7..fb8c1a887e 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2585,12 +2585,10 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
>   * dirty host-page size chunks as all dirty.  In this case the host-page
>   * is the host-page for the particular RAMBlock, i.e. it might be a huge page
>   *
> - * Returns zero on success
> - *
>   * @ms: current migration state
>   * @block: block we want to work with
>   */
> -static int postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
> +static void postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
>  {
>      postcopy_discard_send_init(ms, block->idstr);
>  
> @@ -2600,7 +2598,6 @@ static int postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
>      postcopy_chunk_hostpages_pass(ms, block);
>  
>      postcopy_discard_send_finish(ms);
> -    return 0;
>  }
>  
>  /**
> @@ -2622,7 +2619,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
>  {
>      RAMState *rs = ram_state;
>      RAMBlock *block;
> -    int ret;
>  
>      RCU_READ_LOCK_GUARD();
>  
> @@ -2636,10 +2632,7 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
>  
>      RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>          /* Deal with TPS != HPS and huge pages */
> -        ret = postcopy_chunk_hostpages(ms, block);
> -        if (ret) {
> -            return ret;
> -        }
> +        postcopy_chunk_hostpages(ms, block);
>      }
>      trace_ram_postcopy_send_discard_bitmap();
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


