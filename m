Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C660444951
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 21:02:08 +0100 (CET)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miMSU-000813-Jv
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 16:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1miMRR-0007M2-0M
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:01:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1miMRO-0008Lz-9k
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635969656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KfpiBkdDqji9GhR351pfqWlyKnA/j+FFV5zy6Yi4O4E=;
 b=THlkZ8d6h/NQFM3b3U4RoERMWdjt5dntE4zoR8vWoaVMZB8BK04P2XvkThicySsb+7wp6N
 OopZ6DwZxIJ9xdtnoPUE9eloIjCH46iYHtmp26JAVURpvlzzglxj8sSMfEHyibOtXQ6e5U
 I+ro9GzMXOgtUEWWkhYkN2QAeO805wk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-udl7-m1lNl-d9m18SBGKTA-1; Wed, 03 Nov 2021 16:00:55 -0400
X-MC-Unique: udl7-m1lNl-d9m18SBGKTA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so1575572wmr.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 13:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KfpiBkdDqji9GhR351pfqWlyKnA/j+FFV5zy6Yi4O4E=;
 b=loK3X4l9LDGVL1ZnsN48pHBmwEdA6F+mk3Lqg+jMzxSs8Knhv0p/341In1BspxEyNy
 UUB3BBV88pdTfwtEtoIDHI++vZ+cp8GcVpw+2YZDWMqJtAgK50MTtZySq94KgUQZdFVk
 +9hd0XClojqKOFC48HZKayiuOcko8UXpD0KN5zyBPfpxXUa5GoE9NpNyDjLQanuDX5+A
 PaItGvPtFz6Gf+5HFWd8YOtQQGIGlTWUfP2IDKiXi7N6gHUaaxGZ8lYAx8l1GYc9UQyL
 MMnHtcnm1a4Pt2XKVPMgZynPLWFiaZBEHxJVFR3V/LgwFiEggcuskJ0+qEBnQMzP7ESm
 LQAw==
X-Gm-Message-State: AOAM5310TLhnJA2sP46rv6rpuYFQqbLFspDjLf3hbH6tcs4Oj4SJdBQ4
 ylN5XkFaooEiXyp2YRbVRJ0g+ncU+fTCIICaIeH6tgoFC7BLRclrzwwDBW8tG+xGWoGKTw2uXoD
 VHhARsMzSklBu+ac=
X-Received: by 2002:a1c:7313:: with SMTP id d19mr17506097wmb.183.1635969653843; 
 Wed, 03 Nov 2021 13:00:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs6m8zAiN7HeODf0AO/iwGeX7qu02izNWqIOgTUecwYTvLTJBLrwDq5+qxqcE9UZBMVjs3iw==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr17506069wmb.183.1635969653628; 
 Wed, 03 Nov 2021 13:00:53 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id e3sm2875096wrp.8.2021.11.03.13.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:00:52 -0700 (PDT)
Date: Wed, 3 Nov 2021 20:00:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] postocpy: Check that postocpy fd's are not NULL
Message-ID: <YYLqcx/Y9EqhZKhG@work-vm>
References: <20211103193129.23930-1-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211103193129.23930-1-quintela@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> If postcopy has finished, it frees the array.
> But vhost-user unregister it at cleanup time.

I must admit to being confused as the double migrate case vs migrate
once and shutdown. It might just be an ordering thing?

I notice that  'vhost_user_backend_cleanup' does:
    if (u->postcopy_fd.handler) {
        postcopy_unregister_shared_ufd(&u->postcopy_fd);
        close(u->postcopy_fd.fd);
        u->postcopy_fd.handler = NULL;
    }

where as the other caller, 'vhost_user_postcopy_end'
does:
    postcopy_unregister_shared_ufd(&u->postcopy_fd);
    close(u->postcopy_fd.fd);
    u->postcopy_fd.handler = NULL;


maybe it would be better to fix them to do the same if check?

(Also note 'post*o*cpy' typo in title, and probably worth a
  Fixes: c4f7538 ?)

Dave


> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/postcopy-ram.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index e721f69d0f..d18b5d05b2 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1457,6 +1457,10 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
>      MigrationIncomingState *mis = migration_incoming_get_current();
>      GArray *pcrfds = mis->postcopy_remote_fds;
>  
> +    if (!pcrfds) {
> +        /* migration has already finished and freed the array */
> +        return;
> +    }
>      for (i = 0; i < pcrfds->len; i++) {
>          struct PostCopyFD *cur = &g_array_index(pcrfds, struct PostCopyFD, i);
>          if (cur->fd == pcfd->fd) {
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


