Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968572C2E25
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:12:56 +0100 (CET)
Received: from localhost ([::1]:60994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbs7-00039n-Lq
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khbbC-0005FY-Gs
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:55:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khbb9-0006eT-8b
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606236922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHktQ2s0Lc4hXosjsiWUCumwtXzQ1bYiJvGo26IHG04=;
 b=XosoFkE06cAKgxXAFB5FG7AD1533FfFUAnDaXLDO50uwZl2Pz0n3d46cgKNAh6/l1p+0Aq
 62qqrkuxjWoVbhqy7YrP4UPNGli5osyImGAS9DRlkB/REhxcrT3P/5ElqJmy3CyphRyi+R
 2d6te5zo8DGibHSpDkpfkP7EsZFznDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-T3T8DgRxMpaYvlUsfR9BFQ-1; Tue, 24 Nov 2020 11:55:20 -0500
X-MC-Unique: T3T8DgRxMpaYvlUsfR9BFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8A67107AD92;
 Tue, 24 Nov 2020 16:55:19 +0000 (UTC)
Received: from work-vm (ovpn-115-42.ams2.redhat.com [10.36.115.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7993189B4;
 Tue, 24 Nov 2020 16:55:14 +0000 (UTC)
Date: Tue, 24 Nov 2020 16:55:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 1/7] introduce 'track-writes-ram' migration capability
Message-ID: <20201124165511.GJ3366@work-vm>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-2-andrey.gruzdev@virtuozzo.com>
 <20201119185150.GF6538@xz-x1> <20201119190703.GG6538@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20201119190703.GG6538@xz-x1>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Thu, Nov 19, 2020 at 01:51:50PM -0500, Peter Xu wrote:
> > On Thu, Nov 19, 2020 at 03:59:34PM +0300, Andrey Gruzdev via wrote:
> > > Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> > > ---
> > >  migration/migration.c | 96 +++++++++++++++++++++++++++++++++++++++++++
> > >  migration/migration.h |  1 +
> > >  qapi/migration.json   |  7 +++-
> > >  3 files changed, 103 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index 87a9b59f83..ff0364dde0 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -56,6 +56,7 @@
> > >  #include "net/announce.h"
> > >  #include "qemu/queue.h"
> > >  #include "multifd.h"
> > > +#include "sysemu/cpus.h"
> > >  
> > >  #ifdef CONFIG_VFIO
> > >  #include "hw/vfio/vfio-common.h"
> > > @@ -1165,6 +1166,91 @@ static bool migrate_caps_check(bool *cap_list,
> > >          }
> > >      }
> > >  
> > > +    if (cap_list[MIGRATION_CAPABILITY_TRACK_WRITES_RAM]) {
> > > +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with postcopy-ram");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_DIRTY_BITMAPS]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with dirty-bitmaps");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with postcopy-blocktime");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with late-block-activate");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_RETURN_PATH]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with return-path");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
> > > +            error_setg(errp, "Track-writes is not compatible with multifd");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with pause-before-switchover");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_AUTO_CONVERGE]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with auto-converge");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_RELEASE_RAM]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with release-ram");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_RDMA_PIN_ALL]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with rdma-pin-all");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with compression");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with XBZLRE");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with x-colo");
> > > +            return false;
> > > +        }
> > > +
> > > +        if (cap_list[MIGRATION_CAPABILITY_VALIDATE_UUID]) {
> > > +            error_setg(errp,
> > > +                    "Track-writes is not compatible with validate-uuid");
> > > +            return false;
> > > +        }
> 
> Another thing forgot to mention - we can at least define an array for live
> snapshot now so we just loop over that one instead of copy-paste these lines...

Yes, I think we've already got a name lookup
(MigrationCapability_lookup - that's generated during build), so if you
just have an array of MigrationCapability's you should be able to loop
over them.

Dave

> > > +    }
> > > +
> > >      return true;
> > >  }
> > >  
> > > @@ -2490,6 +2576,15 @@ bool migrate_use_block_incremental(void)
> > >      return s->parameters.block_incremental;
> > >  }
> > >  
> > > +bool migrate_track_writes_ram(void)
> > > +{
> > > +    MigrationState *s;
> > > +
> > > +    s = migrate_get_current();
> > > +
> > > +    return s->enabled_capabilities[MIGRATION_CAPABILITY_TRACK_WRITES_RAM];
> > > +}
> > > +
> > >  /* migration thread support */
> > >  /*
> > >   * Something bad happened to the RP stream, mark an error
> > > @@ -3783,6 +3878,7 @@ static Property migration_properties[] = {
> > >      DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
> > >      DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
> > >      DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
> > > +    DEFINE_PROP_MIG_CAP("x-track-writes-ram", MIGRATION_CAPABILITY_TRACK_WRITES_RAM),
> > >  
> > >      DEFINE_PROP_END_OF_LIST(),
> > >  };
> > > diff --git a/migration/migration.h b/migration/migration.h
> > > index d096b77f74..339ae720e0 100644
> > > --- a/migration/migration.h
> > > +++ b/migration/migration.h
> > > @@ -341,6 +341,7 @@ int migrate_compress_wait_thread(void);
> > >  int migrate_decompress_threads(void);
> > >  bool migrate_use_events(void);
> > >  bool migrate_postcopy_blocktime(void);
> > > +bool migrate_track_writes_ram(void);
> > >  
> > >  /* Sending on the return path - generic and then for each message type */
> > >  void migrate_send_rp_shut(MigrationIncomingState *mis,
> > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > index 3c75820527..a28d8b7ee8 100644
> > > --- a/qapi/migration.json
> > > +++ b/qapi/migration.json
> > > @@ -442,6 +442,11 @@
> > >  # @validate-uuid: Send the UUID of the source to allow the destination
> > >  #                 to ensure it is the same. (since 4.2)
> > >  #
> > > +# @track-writes-ram: If enabled, the migration stream will be a snapshot
> > > +#                    of the VM exactly at the point when the migration
> > > +#                    procedure starts. The VM RAM is saved with running VM.
> > > +#                    (since 6.0)
> > > +#
> > 
> > The name is slightly confusing to me.  Could I ask why changed from previous
> > one?  "snapshot" sounds a very necessary keyword to me here and tells exactly
> > on what we do...  Because we can do quite a few things with "trace-writes-ram"
> > but not snapshotting, e.g., to calculate per-vm dirty rates.
> > 
> > -- 
> > Peter Xu
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


