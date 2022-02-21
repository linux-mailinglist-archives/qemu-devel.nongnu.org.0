Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C734BDACD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:20:18 +0100 (CET)
Received: from localhost ([::1]:35114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBQ8-0007Vo-RN
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:20:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMBLf-0004uW-9M
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:15:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMBLY-0005VC-9X
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645460130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zVvrhhyKrjZfp8O0uWsz2+kDtS7GYCwstBUcS4GNa/w=;
 b=aoqX8pRGEfdlDMLjl5GfMFyJ+wIiTVgOu5Gz9jsO1WQeCePaAtdk9wOvOYz2QQRCHhYGCl
 m8je79q5/cmqTUUyy9f0mJrNHXNAZSPiXWKwnvmQE0JKMKk792t4vMtKQQl3JlrR2IulPC
 3osH8stUlRLsHHUIkvr3RLxR8FP+bsc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-AKXD177cM_WtkRZ9ZWCjLA-1; Mon, 21 Feb 2022 11:15:28 -0500
X-MC-Unique: AKXD177cM_WtkRZ9ZWCjLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay41-20020a05600c1e2900b0037c5168b3c4so8209118wmb.7
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 08:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zVvrhhyKrjZfp8O0uWsz2+kDtS7GYCwstBUcS4GNa/w=;
 b=0TOGKSH+3p+nZE0VS3BLYxB5BmMwIJiXdBgnluFxlYWhKrJo4hOYVJMAFRVI8MBvKh
 B97R9N5xmaB7uft/UYNTumvllp4WWrjygr3nfDtU++cgsZBwtFgLP2WZ5IQNysJzdB2e
 2LM2XImvfut6F8/SnVZeWayFBNqJyUpQQkM+hxudbfz9kYiy7o3gSbH59tuCSxLiAutd
 aYgT9KM+6qNFgddJ42ToS5Q6Ai8c/o1Hg9ZLhb0DwWJU9na2O38aoTW4XoZcP64Gsf4t
 o7o3nH4KmLdFDCFwBaf/w8PoZsb5sCroyNcJNUX0D5qwojVKi9Ox/YNUmlDsWrdvUZA0
 B8Fw==
X-Gm-Message-State: AOAM532D7+AHXjMNZjSPvPJlVIkBW2wBml3COzYseO+O5zBrDH+DfRLG
 GjHbfwM2rrCNUYGJl/9BYII+no/T/H4EOF/o9ZuPsVkJ+TBM5fhhWN32TTfD88GotxLl9kBW/Fy
 Pxm+oqiRTrFX9n9k=
X-Received: by 2002:a5d:45c1:0:b0:1e6:1141:309b with SMTP id
 b1-20020a5d45c1000000b001e61141309bmr16568547wrs.595.1645460127386; 
 Mon, 21 Feb 2022 08:15:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxintkvx6Rd97cqxrA23L6gTRSjoARsIk2HNUd+NscLqVddsaGol9ND7agSyAmt/vlgm+Cznw==
X-Received: by 2002:a5d:45c1:0:b0:1e6:1141:309b with SMTP id
 b1-20020a5d45c1000000b001e61141309bmr16568521wrs.595.1645460127127; 
 Mon, 21 Feb 2022 08:15:27 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t187sm8039579wma.22.2022.02.21.08.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:15:26 -0800 (PST)
Date: Mon, 21 Feb 2022 16:15:24 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 10/20] migration: Enlarge postcopy recovery to capture
 !-EIO too
Message-ID: <YhO6nJh3OLxOyLoO@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-11-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-11-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> We used to have quite a few places making sure -EIO happened and that's the
> only way to trigger postcopy recovery.  That's based on the assumption that
> we'll only return -EIO for channel issues.
> 
> It'll work in 99.99% cases but logically that won't cover some corner cases.
> One example is e.g. ram_block_from_stream() could fail with an interrupted
> network, then -EINVAL will be returned instead of -EIO.
> 
> I remembered Dave Gilbert pointed that out before, but somehow this is
> overlooked.  Neither did I encounter anything outside the -EIO error.
> 
> However we'd better touch that up before it triggers a rare VM data loss during
> live migrating.
> 
> To cover as much those cases as possible, remove the -EIO restriction on
> triggering the postcopy recovery, because even if it's not a channel failure,
> we can't do anything better than halting QEMU anyway - the corpse of the
> process may even be used by a good hand to dig out useful memory regions, or
> the admin could simply kill the process later on.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c    | 4 ++--
>  migration/postcopy-ram.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 6e4cc9cc87..67520d3105 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2877,7 +2877,7 @@ retry:
>  out:
>      res = qemu_file_get_error(rp);
>      if (res) {
> -        if (res == -EIO && migration_in_postcopy()) {
> +        if (res && migration_in_postcopy()) {
>              /*
>               * Maybe there is something we can do: it looks like a
>               * network down issue, and we pause for a recovery.
> @@ -3478,7 +3478,7 @@ static MigThrError migration_detect_error(MigrationState *s)
>          error_free(local_error);
>      }
>  
> -    if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret == -EIO) {
> +    if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret) {
>          /*
>           * For postcopy, we allow the network to be down for a
>           * while. After that, it can be continued by a
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index d3ec22e6de..6be510fea4 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1038,7 +1038,7 @@ retry:
>                                          msg.arg.pagefault.address);
>              if (ret) {
>                  /* May be network failure, try to wait for recovery */
> -                if (ret == -EIO && postcopy_pause_fault_thread(mis)) {
> +                if (postcopy_pause_fault_thread(mis)) {
>                      /* We got reconnected somehow, try to continue */
>                      goto retry;
>                  } else {
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


