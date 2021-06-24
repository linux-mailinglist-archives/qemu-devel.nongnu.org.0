Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9BD3B3488
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 19:16:22 +0200 (CEST)
Received: from localhost ([::1]:55482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwSxh-0002HA-8Z
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 13:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwSwf-0001Yo-Mn
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwSwX-0004HD-7d
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624554907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=01fIM5ETtMMLB3KySviFxUDal6glEUNUnPb3gxNOr5I=;
 b=M9I5YaYNiWEgw/XR5j2WLTPt5v9u9CCBgQzdT2FNJLOoaCumCG1YxpdyZW0VYdckIfkirp
 MMPIQspMYbKT75Jn+fl5cLApJJk6UiiObTrFUUMxddStUOBmRonLypgRI2kMtQi/nsVW3G
 3d0AKB6wZpruOUAlN+y/RN6E9ZvRIzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-nckbcgbZNQKl-C1DMMjPYQ-1; Thu, 24 Jun 2021 13:15:06 -0400
X-MC-Unique: nckbcgbZNQKl-C1DMMjPYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9FC0804142;
 Thu, 24 Jun 2021 17:15:04 +0000 (UTC)
Received: from work-vm (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F2C5C230;
 Thu, 24 Jun 2021 17:14:42 +0000 (UTC)
Date: Thu, 24 Jun 2021 18:14:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v1 1/1] migration: Unregister yank if migration setup fails
Message-ID: <YNS9fwd/dNs5LJ/+@work-vm>
References: <20210622024236.600347-1-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622024236.600347-1-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Lukas Straub <lukasstraub2@web.de>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Leonardo Bras (leobras@redhat.com) wrote:
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
> 
> ---
>  migration/migration.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 4228635d18..ddcf9e1868 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -474,9 +474,13 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
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

My understanding is that testing *errp isn't allowed, because
it's legal to pass NULL to ignore errors, or legal to pass
&error_abort to mean that any error you do hit will cause the
process to assert; so you need to have something separate you can test.

Dave

>  }
>  
>  static void process_incoming_migration_bh(void *opaque)
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


