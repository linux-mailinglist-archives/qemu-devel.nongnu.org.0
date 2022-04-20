Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2250867A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:57:08 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh81D-0001wc-TM
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh7mN-0001tD-1w
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:41:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh7mL-0008Bk-9M
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650451304;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynI0y+ecaTLvIs01CsQO5IU0amTF6yP7zGpRNyp9YTI=;
 b=EIaOz+39YLJGevTNZtWgaGH4kWhkIGhgqtoiADOw2GtgWKf8xjm6X8vU8YIWb0HAbuRPvz
 hHeMTXp1gFIqEZ63F+LiMPM291HHmofZTIlhc0uf41/XUM7LYk21rDeISb/XN4ue5xzABj
 8d0T7unR1b41/F+8NJkIx3nIliTSPpU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-nGpdyzB4P2eu6RRx9IP0Bw-1; Wed, 20 Apr 2022 06:41:43 -0400
X-MC-Unique: nGpdyzB4P2eu6RRx9IP0Bw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67C571C05129
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 10:41:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A52B12166B2D;
 Wed, 20 Apr 2022 10:41:32 +0000 (UTC)
Date: Wed, 20 Apr 2022 11:41:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 04/19] migration: Move migrate_allow_multifd and
 helpers into migration.c
Message-ID: <Yl/jWhsVaPp2OgPa@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-5-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331150857.74406-5-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:42AM -0400, Peter Xu wrote:
> This variable, along with its helpers, is used to detect whether multiple
> channel will be supported for migration.  In follow up patches, there'll be
> other capability that requires multi-channels.  Hence move it outside multifd
> specific code and make it public.  Meanwhile rename it from "multifd" to
> "multi_channels" to show its real meaning.

FWIW, I would generally suggest separating the rename from the code
movement into distinct patches.

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 22 +++++++++++++++++-----
>  migration/migration.h |  3 +++
>  migration/multifd.c   | 19 ++++---------------
>  migration/multifd.h   |  2 --
>  4 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 281d33326b..596d3d30b4 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -180,6 +180,18 @@ static int migration_maybe_pause(MigrationState *s,
>                                   int new_state);
>  static void migrate_fd_cancel(MigrationState *s);
>  
> +static bool migrate_allow_multi_channels = true;

This is a pre-existing thing, but I'm curious why we default this to
'true', when the first thing qemu_start_incoming_migration() and
qmp_migrate() do, is to set it to 'false' and then selectively
put it back to 'true'.


>  static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
>  {
>      uintptr_t a = (uintptr_t) ap, b = (uintptr_t) bp;
> @@ -469,12 +481,12 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
>  
> -    migrate_protocol_allow_multifd(false); /* reset it anyway */
> +    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>      if (strstart(uri, "tcp:", &p) ||
>          strstart(uri, "unix:", NULL) ||
>          strstart(uri, "vsock:", NULL)) {
> -        migrate_protocol_allow_multifd(true);
> +        migrate_protocol_allow_multi_channels(true);
>          socket_start_incoming_migration(p ? p : uri, errp);



> @@ -2324,11 +2336,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          }
>      }
>  
> -    migrate_protocol_allow_multifd(false);
> +    migrate_protocol_allow_multi_channels(false);
>      if (strstart(uri, "tcp:", &p) ||
>          strstart(uri, "unix:", NULL) ||
>          strstart(uri, "vsock:", NULL)) {
> -        migrate_protocol_allow_multifd(true);
> +        migrate_protocol_allow_multi_channels(true);
>          socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {

Regardless of comments above

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


