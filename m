Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FE03B76C1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:56:37 +0200 (CEST)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyH2K-0001b5-Cq
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyGxK-0000e6-So
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyGxI-00035e-Qv
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624985484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hySFvONBxBA0+K2a9g92DjRTolj6lE62C4ncMtoCOPQ=;
 b=dE6oY75RfdGmyC/CwKw3vhfqDR0l7g9LXfOYvlQls73nPy8btxQJJaIb6yHYvTx9g9i37V
 U9OwBIPU/7iIVVjUoit99PFp4pWZxnOZYqWLbr/7iZOEu96+9eRl9jxLDk9JH3nM7NKv3D
 asbxIOGiXrKjk0M/tvedppoevx5XXcg=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-nFSuNImAN7SmM_XwXSxPSQ-1; Tue, 29 Jun 2021 12:51:20 -0400
X-MC-Unique: nFSuNImAN7SmM_XwXSxPSQ-1
Received: by mail-il1-f197.google.com with SMTP id
 p12-20020a92d28c0000b02901ee741987a7so8198356ilp.13
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 09:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hySFvONBxBA0+K2a9g92DjRTolj6lE62C4ncMtoCOPQ=;
 b=pBQE1pkjRzIXiPyqaHz6AtPkxvs65KzCiTp5icGoL53S1m+zVfaDIFeCAxx4Xt6HJ/
 0Wc/yZ9sLJivCkMYF+Wh9AuE5koTLeI8rPxpQ+10tBdSdQrZJwo10DSeeah7AAtX15gr
 Rf94yZWrtWO0kgdpfyfzduR8XKG3FGbUcFCXhrMdgDUkzCdViwixY5C7A5lDddTS4t7q
 VK2PIsbbCrjReDxFNk8GHRUKrx0R2pvTMXy9gZkIkFSWZ4v/pqOuu8mCLylA2D8ceBjx
 7oOvKnXYdVcIkMw/Bn7B+XsFrBcUWtK5v3eGG7D/lVWi/kcSU4/VwWBeRf61f57dSQd3
 WELg==
X-Gm-Message-State: AOAM533irA3nV3e2060dnW9WGl1g2mZLJVL5VsvuGQ4cJ2usRWZ1SYv3
 2hXJm/crR3G24kYCOSDxK63e7t0bfLtoBJJNPdUpern3vyRoeEIIs3zh6RMA4s8R+rEfDuUFuFw
 HKirIGggqDcNRmwE=
X-Received: by 2002:a02:aa8b:: with SMTP id u11mr3843537jai.133.1624985479735; 
 Tue, 29 Jun 2021 09:51:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZY6HwDzd7hx5bNDYrEK5s7VloDPf7arU1kjNMGMcPuqzDvK1hjSOdLNuvgKQ1DheE8YAMag==
X-Received: by 2002:a02:aa8b:: with SMTP id u11mr3843516jai.133.1624985479528; 
 Tue, 29 Jun 2021 09:51:19 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id t12sm2348773ioc.11.2021.06.29.09.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 09:51:18 -0700 (PDT)
Date: Tue, 29 Jun 2021 12:51:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v2 1/1] migration: Unregister yank if migration setup fails
Message-ID: <YNtPhdww6YwHq1CL@t490s>
References: <20210629050522.147057-1-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210629050522.147057-1-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: qemu-devel@nongnu.org, Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 02:05:23AM -0300, Leonardo Bras wrote:
> Currently, if a qemu instance is started with "-incoming defer" and
> an incorect parameter is passed to "migrate_incoming", it will print the
> expected error and reply with "duplicate yank instance" for any upcoming
> "migrate_incoming" command.
> 
> This renders current qemu process unusable, and requires a new qemu
> process to be started before accepting a migration.
> 
> This is caused by a yank_register_instance() that happens in
> qemu_start_incoming_migration() but is never reverted if any error
> happens.
> 
> Solves this by unregistering the instance if anything goes wrong
> in the function, allowing a new "migrate_incoming" command to be
> accepted.
> 
> Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1974366
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> ---
> Changes since v1:
>  - Add ERRP_GUARD() at the beginning of the function, so it deals with
>    errp passed as NULL, and does correct error propagation.
> ---
>  migration/migration.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 4228635d18..af0c72609f 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -454,6 +454,7 @@ void migrate_add_address(SocketAddress *address)
>  
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
> +    ERRP_GUARD();
>      const char *p = NULL;
>  
>      if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
> @@ -474,9 +475,13 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>      } else if (strstart(uri, "fd:", &p)) {
>          fd_start_incoming_migration(p, errp);
>      } else {
> -        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }
> +
> +    if (*errp) {
> +        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> +    }
> +
>  }
>  
>  static void process_incoming_migration_bh(void *opaque)
> -- 

Leo,

The patch looks great to me, thanks.

Though I found that maybe we need to fix it in another way due to some other
reason out of scope of this issue. The problem is today I encountered another
yank crashing qemu when trying to do postcopy recover twice.

The problem here is both initial incoming migration and postcopy recovery uses
qemu_start_incoming_migration(), while in qmp_migrate_recover() b5eea99ec2f5c
calls unregister before calling qemu_start_incoming_migration().  I believe it
wanted to mitigate the next call to yank_register_instance() to make it work,
but I think that's wrong...

Firstly, if during recover, we should keep the yank instance there, not
"quickly removing and adding it back".  Meanwhile, as I mentioned calling
qmp_migrate_recover() twice with b5eea99ec2f5c will directly crash the dest
qemu because the 1st call of qmp_migrate_recover() will unregister permanently
when channel failed to establish, then the 2nd call of qmp_migrate_recover()
crashes at yank_unregister_instance().

I'll post an alternative fix of this issue (plus another postcopy recovery fix)
to show better on what I meant.

Thanks,

-- 
Peter Xu


