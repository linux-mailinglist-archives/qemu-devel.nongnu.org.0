Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7663D18DA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:16:50 +0200 (CEST)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6JaD-0002Jl-Ur
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6JZE-0001f7-Vb
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6JZB-0006qS-JB
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626902142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ssP2yabzkS6AI32fqzmnWjd/yQNY3iPKPlsPivrVzk0=;
 b=fjoyfXRXTy2E4PTRbUTnuZIb6oeC8S8IGtHmYPHQ89VO58R/WSQJuQqL28TljoxzqBhq1y
 FAQtLpFSReJ88KAq44hWw1qcBp/GRAFfrf4KguN6lSzwxExAMyWu2ksYFHFpC3wXEPRKoJ
 hDsrIW2DeTdYbjPVd+/rnXtmXjrcD24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-57iUWCR0Mhe6gt-yvFZ5eg-1; Wed, 21 Jul 2021 17:15:39 -0400
X-MC-Unique: 57iUWCR0Mhe6gt-yvFZ5eg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8647C83DC16;
 Wed, 21 Jul 2021 21:15:38 +0000 (UTC)
Received: from redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFACF5DAA5;
 Wed, 21 Jul 2021 21:15:29 +0000 (UTC)
Date: Wed, 21 Jul 2021 16:15:27 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 2/5] migration: Make from_dst_file accesses thread-safe
Message-ID: <20210721211527.w3cy2zej3s57hote@redhat.com>
References: <20210721193409.910462-1-peterx@redhat.com>
 <20210721193409.910462-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721193409.910462-3-peterx@redhat.com>
User-Agent: NeoMutt/20210205-624-3987b8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 03:34:06PM -0400, Peter Xu wrote:
> Accessing from_dst_file is potentially racy in current code base like below:
> 
>   if (s->from_dst_file)
>     do_something(s->from_dst_file);
> 
> Because from_dst_file can be reset right after the check in another
> thread (rp_thread).  One example is migrate_fd_cancel().
> 
> Use the same qemu_file_lock to protect it too, just like to_dst_file.
> 
> When it's safe to access without lock, comment it.
> 
> There's one special reference in migration_thread() that can be replaced by
> the newly introduced rp_thread_created flag.
> 
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 32 +++++++++++++++++++++++++-------
>  migration/migration.h |  8 +++++---
>  migration/ram.c       |  1 +
>  3 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 21b94f75a3..fa70400f98 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1879,10 +1879,12 @@ static void migrate_fd_cancel(MigrationState *s)
>      QEMUFile *f = migrate_get_current()->to_dst_file;
>      trace_migrate_fd_cancel();
>  
> +    qemu_mutex_lock(&s->qemu_file_lock);
>      if (s->rp_state.from_dst_file) {
>          /* shutdown the rp socket, so causing the rp thread to shutdown */
>          qemu_file_shutdown(s->rp_state.from_dst_file);
>      }
> +    qemu_mutex_unlock(&s->qemu_file_lock);

Worth using WITH_QEMU_LOCK_GUARD?

> @@ -2827,11 +2845,13 @@ out:
>               * Maybe there is something we can do: it looks like a
>               * network down issue, and we pause for a recovery.
>               */
> -            qemu_fclose(rp);
> -            ms->rp_state.from_dst_file = NULL;
> +            migration_release_from_dst_file(ms);
>              rp = NULL;
>              if (postcopy_pause_return_path_thread(ms)) {
> -                /* Reload rp, reset the rest */
> +                /*
> +                 * Reload rp, reset the rest.  Referencing it is save since

s/save/safe/

> +                 * it's reset only by us above, or when migration completes
> +                 */
>                  rp = ms->rp_state.from_dst_file;
>                  ms->rp_state.error = false;
>                  goto retry;

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


