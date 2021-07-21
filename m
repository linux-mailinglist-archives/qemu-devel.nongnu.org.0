Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FB23D0C25
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:13:42 +0200 (CEST)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69ET-00052Z-CQ
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m68wW-0006FN-IT
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:55:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m68wV-000390-0Z
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626861306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z9zEca0tuD5dfmrfFdn7TYMrXdeihdUK/GffEP1F3Po=;
 b=XnS2UCC43m+jhqVt9wPC5baiSbbs8f3IUjypmNII3TKukjUcUeTR+H6iiofYe2NIb7pG3H
 d8phnf2avOUMqPUtfeGXxNuwujiyNqzQFC6ymRiE4VVxwm5qRyRq40h47jmi55c1VopRlB
 MtPY0ZSR3xG7NnqHJUisdvN/Pys1N+U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-dksNCoXuMsKA-pBy-t_qDw-1; Wed, 21 Jul 2021 05:55:04 -0400
X-MC-Unique: dksNCoXuMsKA-pBy-t_qDw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k3-20020a5d52430000b0290138092aea94so774246wrc.20
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 02:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z9zEca0tuD5dfmrfFdn7TYMrXdeihdUK/GffEP1F3Po=;
 b=gA0rOT7KInutxpx5gEZY5fb1/b+z96xlO5jGUyrMooftyyYJe+PD8EWyK/+2S1x57G
 r/oGOo6Aw8L8Ztx/E3OU6R8ii9aTpZcd/ZqrA/pjmX1vGQVV8hNKzWbiAmjFJeIXRguW
 3MYjHZwA4M+cbTDddwK9fNAMhFVaui7ihjaEwVkE4RtWan1gshtbzzK22LrYhuciZvaF
 EtycutT3y0VYyv30loIfHk4+mLNv54xJtaO/xiRMhq4QRIFc5sGq6KC3lJEL9H3HY4ZP
 vT+DdrbsojsfHJ4aVkGSW22M2rfYf6onomwwCbKL+WeyYiBp5kgLGusQZ70IX9+j4Tvc
 mL5Q==
X-Gm-Message-State: AOAM531iTtwA8QB5cUZ9XD5RgkK5E/cx6HdBDR9LRq4ZegrEW+9AxH0x
 SJXUgofHrizwA4RSu8g6NZzu7kXrqAT80ToPv2iIDBhtC7/pKgcr2nG2kVn2AGaezp89wWgIHc7
 qZz9my6PBs5k7X4I=
X-Received: by 2002:a05:600c:b48:: with SMTP id
 k8mr3222493wmr.180.1626861303129; 
 Wed, 21 Jul 2021 02:55:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5Cp9KPAaiA5oMBThlvF5ZBudEewguNdWR2s/p76rwQQviTyWkMuIgJMxowoR2zMaZdsL3pQ==
X-Received: by 2002:a05:600c:b48:: with SMTP id
 k8mr3222462wmr.180.1626861302792; 
 Wed, 21 Jul 2021 02:55:02 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id w9sm22309231wmc.19.2021.07.21.02.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 02:55:02 -0700 (PDT)
Date: Wed, 21 Jul 2021 10:55:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 2/5] migration: Shutdown src in
 await_return_path_close_on_source()
Message-ID: <YPfu9N98PyTp7AKX@work-vm>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721012134.792845-3-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> We have a logic in await_return_path_close_on_source() that we will explicitly
> shutdown the socket when migration encounters errors.  However it could be racy
> because from_dst_file could have been reset right after checking it but before
> passing it to qemu_file_shutdown() by the rp_thread.
> 
> Fix it by shutdown() on the src file instead.  Since they must be a pair of
> qemu files, shutdown on either of them will work the same.
> 
> Since at it, drop the check for from_dst_file directly, which makes the
> behavior even more predictable.

So while the existing code maybe racy, I'm not sure that this change
keeps the semantics; the channel may well have dup()'d the fd's for the
two directions, and I'm not convinced that a shutdown() on one will
necessarily impact the other; and if the shutdown doesn't happen the
rp_thread might not exit, and we might block on the koin.

Why don't we solve this a different way - how about we move the:
    ms->rp_state.from_dst_file = NULL;
    qemu_fclose(rp);

out of the source_return_path_thread and put it in
await_return_path_close_on_source, immediately after the join?
Then we *know* that the the rp thread isn't messing with it.

Dave

> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 21b94f75a3..4f48cde796 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2882,12 +2882,15 @@ static int await_return_path_close_on_source(MigrationState *ms)
>       * rp_thread will exit, however if there's an error we need to cause
>       * it to exit.
>       */
> -    if (qemu_file_get_error(ms->to_dst_file) && ms->rp_state.from_dst_file) {
> +    if (qemu_file_get_error(ms->to_dst_file)) {
>          /*
>           * shutdown(2), if we have it, will cause it to unblock if it's stuck
> -         * waiting for the destination.
> +         * waiting for the destination.  We do shutdown on to_dst_file should
> +         * also shutdown the from_dst_file as they're in a pair. We explicilty
> +         * don't operate on from_dst_file because it's potentially racy
> +         * (rp_thread could have reset it in parallel).
>           */
> -        qemu_file_shutdown(ms->rp_state.from_dst_file);
> +        qemu_file_shutdown(ms->to_dst_file);
>          mark_source_rp_bad(ms);
>      }
>      trace_await_return_path_close_on_source_joining();
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


