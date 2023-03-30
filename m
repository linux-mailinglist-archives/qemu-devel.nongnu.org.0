Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAFF6D080E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:21:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pht8f-0007PY-3C; Thu, 30 Mar 2023 10:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pht8Z-0007PI-M7
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pht8X-0002KF-BM
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680186020;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ROgNs0yhC/aTmI+BBw71JzyvlKKsJZ8CjTqtQ2LB5Zk=;
 b=Svu6VFkxk50VC2vIYM0iD2EkniqCQ3yjGG9CHrSA1iyEo12zTvfx8RRAVD+c2LONRzfIwZ
 Iqn807gDkAOa43I5Spy+Cr2CX3Dvk72bwhBN22Qr326qKJIjWGdMH9VWW4iL7+D9reSWfS
 cc0SayADmVnD6QfOrH6ocm+ETY6qZEg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-pXSoxsQcMbWRACg-L3lJkQ-1; Thu, 30 Mar 2023 10:20:18 -0400
X-MC-Unique: pXSoxsQcMbWRACg-L3lJkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 471AE28237CD
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 14:20:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29FEA4020C92;
 Thu, 30 Mar 2023 14:20:16 +0000 (UTC)
Date: Thu, 30 Mar 2023 15:20:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v1 1/1] migration: Disable postcopy + multifd migration
Message-ID: <ZCWanp5hITk4HImX@redhat.com>
References: <20230327161518.2385074-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327161518.2385074-1-leobras@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 27, 2023 at 01:15:18PM -0300, Leonardo Bras wrote:
> Since the introduction of multifd, it's possible to perform a multifd
> migration and finish it using postcopy.
> 
> A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
> a successful use of this migration scenario, and now it should be
> working on most cases.
> 
> But since there is not enough testing/support nor any reported users for
> this scenario, we should disable this combination before it may cause any
> problems for users.

Clearly we don't have enough testing, but multifd+postcopy looks
like a clearly useful scenario that we should be supporting.

Every post-copy starts with at least one pre-copy iteration, and
using multifd for that will be important for big VMs where single
threaded pre-copy is going to be CPU bound. The greater amount we
can transfer in the pre-copy phase, the less page faults / latency
spikes postcopy is going to see.

In terms of migration usage, my personal recommendation to mgmt
apps would be that they should always enable the post-copy feature
when starting a migration. Even if they expect to try to get it to
complete using exclusively pre-copy in the common case, its useful
to have post-copy capability flag enabled, as a get out of jail
free card. ie if migration ends up getting stuck in non-convergance,
or they have a sudden need to urgently complete the migration it is
good to be able to flip to post-copy mode.

I'd suggest that we instead add a multifd+postcopy test case to
migration-test.c and tackle any bugs it exposes. By blocking it
unconditionally we ensure no one will exercise it to expose any
further bugs.

> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/migration.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index ae2025d9d8..c601964b0e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1356,6 +1356,11 @@ static bool migrate_caps_check(bool *cap_list,
>              error_setg(errp, "Postcopy is not compatible with ignore-shared");
>              return false;
>          }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
> +            error_setg(errp, "Postcopy is not yet compatible with multifd");
> +            return false;
> +        }
>      }
>  
>      if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
> -- 
> 2.40.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


