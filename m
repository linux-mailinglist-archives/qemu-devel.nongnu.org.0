Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656D2B9A90
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:27:25 +0100 (CET)
Received: from localhost ([::1]:40166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfoeS-00085g-6L
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfoca-0007RB-0D
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfocX-0003Qq-SW
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605810324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T2w03y3/EgYQXv+eEjdvVmMXfx/E3ok/qS30SRUCBYs=;
 b=PxWQ5IBreMm5UDxii+po/FB0mfng2jMZzvuxVsSYcbW4KELJh1gY7ttgai25qmSgc6zTjH
 wlpMilg+mMkfpFmIUYMuSloD/atrSetimUB6DAHBHFztFxf0nWjFerIKaditpyBcRNkjBe
 w8u8ZDVEw0xbIqFUesgCd9khlHIZ8Yo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-ycl-erxdPJiqXC-vNu9zDw-1; Thu, 19 Nov 2020 13:25:19 -0500
X-MC-Unique: ycl-erxdPJiqXC-vNu9zDw-1
Received: by mail-qt1-f199.google.com with SMTP id w88so5381703qtd.4
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T2w03y3/EgYQXv+eEjdvVmMXfx/E3ok/qS30SRUCBYs=;
 b=uGSppfvJt8D0hlqr+8I6jPGz5MeDQUbwKwvyO+yYUvfXMtjlqvM0Hc9MtpNQqWTr3p
 uCcySFczP/XDAlUvGHuk7IqI034P5Wwr03sS0kB6ycndL51xXKEr1U6hZz83TKdRMVJp
 wRIAALVdDNVojoMJoVnmgh32FoazkTpT/69mP3FBETJK1+/BJjP3sSK5YZGv32A8mPjR
 PGh4/Lq0p6yvCoDKQxkEajmgxp8G9CM+eSbBO8Xr2+gThVcyYP5nDAanYkGXwJ+7lmJ6
 Svm/qOttoPnN1WvZ5IZi+F1a63ean3AN2gbl3+UfqgzOJZZ85k0Z5Nfy6xTG6a0O1dSn
 su9w==
X-Gm-Message-State: AOAM5311/kAp10f/TVmjDO0lml83pPMZnorGpmM/pYMa9G3hjAbpEYE4
 grzg8dlvGlf3x0QwqHXtiWY2v57qtbkA0yatalnFDbcsm+j29gucFmgerg9Exj5xxAmBsuj/OmT
 /wRWvWCErfXCbTiQ=
X-Received: by 2002:ac8:679a:: with SMTP id b26mr11717773qtp.79.1605810319110; 
 Thu, 19 Nov 2020 10:25:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6utFZtBwqjRXM8Qe7fYvKoge6J7pEIN/nJ88rf79IeCNwg9ddpUjrF8L6mDkL8lRFCjpuEg==
X-Received: by 2002:ac8:679a:: with SMTP id b26mr11717747qtp.79.1605810318845; 
 Thu, 19 Nov 2020 10:25:18 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id l46sm457879qta.44.2020.11.19.10.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 10:25:17 -0800 (PST)
Date: Thu, 19 Nov 2020 13:25:16 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
Message-ID: <20201119182516.GB6538@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 03:59:36PM +0300, Andrey Gruzdev via wrote:

[...]

> +/**
> + * ram_find_block_by_host_address: find RAM block containing host page
> + *
> + * Returns true if RAM block is found and pss->block/page are
> + * pointing to the given host page, false in case of an error
> + *
> + * @rs: current RAM state
> + * @pss: page-search-status structure
> + */
> +static bool ram_find_block_by_host_address(RAMState *rs, PageSearchStatus *pss,
> +        hwaddr page_address)
> +{
> +    bool found = false;
> +
> +    pss->block = rs->last_seen_block;
> +    do {
> +        if (page_address >= (hwaddr) pss->block->host &&
> +            (page_address + TARGET_PAGE_SIZE) <=
> +                    ((hwaddr) pss->block->host + pss->block->used_length)) {
> +            pss->page = (unsigned long)
> +                    ((page_address - (hwaddr) pss->block->host) >> TARGET_PAGE_BITS);
> +            found = true;
> +            break;
> +        }
> +
> +        pss->block = QLIST_NEXT_RCU(pss->block, next);
> +        if (!pss->block) {
> +            /* Hit the end of the list */
> +            pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
> +        }
> +    } while (pss->block != rs->last_seen_block);
> +
> +    rs->last_seen_block = pss->block;
> +    /*
> +     * Since we are in the same loop with ram_find_and_save_block(),
> +     * need to reset pss->complete_round after switching to
> +     * other block/page in pss.
> +     */
> +    pss->complete_round = false;
> +
> +    return found;
> +}

I forgot whether Denis and I have discussed this, but I'll try anyways... do
you think we can avoid touching PageSearchStatus at all?

PageSearchStatus is used to track a single migration iteration for precopy, so
that we scan from the 1st ramblock until the last one.  Then we finish one
iteration.

Snapshot is really something, imho, that can easily leverage this structure
without touching it - basically we want to do two things:

  - Do the 1st iteration of precopy (when ram_bulk_stage==true), and do that
    only.  We never need the 2nd, 3rd, ... iterations because we're snapshoting.

  - Leverage the postcopy queue mechanism so that when some page got written,
    queue that page.  We should have this queue higher priority than the
    precopy scanning mentioned above.

As long as we follow above rules, then after the above 1st round precopy, we're
simply done...  If that works, the whole logic of precopy and PageSearchStatus
does not need to be touched, iiuc.

[...]

> @@ -2086,7 +2191,8 @@ static void ram_state_reset(RAMState *rs)
>      rs->last_sent_block = NULL;
>      rs->last_page = 0;
>      rs->last_version = ram_list.version;
> -    rs->ram_bulk_stage = true;
> +    rs->ram_wt_enabled = migrate_track_writes_ram();

Maybe we don't need ram_wt_enabled, but just call migrate_track_writes_ram()
anywhere needed (actually, only in get_fault_page, once).

Thanks,

-- 
Peter Xu


