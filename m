Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEED2FEFF6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:17:03 +0100 (CET)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cdp-0002OV-BZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2cZ6-0000Po-0Z
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:12:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2cYz-0001el-K0
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:12:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611245520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p9lQU/4ErPD7pngCaskrdh1kc2NWELlWw0na/4po3Gg=;
 b=SVX9s9498gXw6P/uDo8V470PFBRumSQT8tuVIzsEhmkTRS+AUAMBAwUZa+EfHMVu4vz6DL
 v5JYnpYx5S99LIgppXCnRI6MrQGXPVr3v7+PnPPY3q6AiWKk5uWiJF9dPSrxO82tNnrg7I
 fmGJEzo9SYSBxBcnGNof5kZD3elI6MM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-e288AaBpPs67YMZjzBPR9g-1; Thu, 21 Jan 2021 11:11:55 -0500
X-MC-Unique: e288AaBpPs67YMZjzBPR9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 257EF806665;
 Thu, 21 Jan 2021 16:11:54 +0000 (UTC)
Received: from work-vm (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8092D5D749;
 Thu, 21 Jan 2021 16:11:48 +0000 (UTC)
Date: Thu, 21 Jan 2021 16:11:45 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v11 4/5] migration: implementation of background snapshot
 thread
Message-ID: <20210121161145.GI3072@work-vm>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <20210106152120.31279-5-andrey.gruzdev@virtuozzo.com>
 <20210119184931.GJ3008@work-vm>
 <a552fca2-b06e-feb7-997f-24d8341267e5@virtuozzo.com>
 <20210121095647.GC3072@work-vm>
 <d8ff9353-22fb-08b4-ec12-e5e6a13266d5@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d8ff9353-22fb-08b4-ec12-e5e6a13266d5@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> On 21.01.2021 12:56, Dr. David Alan Gilbert wrote:
> > * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> > > On 19.01.2021 21:49, Dr. David Alan Gilbert wrote:
> > > > * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> > > > > Introducing implementation of 'background' snapshot thread
> > > > > which in overall follows the logic of precopy migration
> > > > > while internally utilizes completely different mechanism
> > > > > to 'freeze' vmstate at the start of snapshot creation.
> > > > > 
> > > > > This mechanism is based on userfault_fd with wr-protection
> > > > > support and is Linux-specific.
> > > > I noticed there weren't any bdrv_ calls in here; I guess with a snapshot
> > > > you still have the source running so still have it accessing the disk;
> > > > do you do anything to try and wire the ram snapshotting up to disk
> > > > snapshotting?
> > > Block-related manipulations should be done externally, I think.
> > > So create backing images for RW nodes, then stop VM, switch block graph
> > > and start background snapshot. Something like create 'virsh snapshot-create-as'
> > > does, but in other sequence.
> > If you get a chance it would be great if you could put together an
> > example of doing the combination RAM+block; that way we find out if there's
> > anything silly missing.
> > 
> > Dave
> 
> Yep, I'll take a look at the QMP command sequences, how it should look
> like in our case and prepare an example, hope we are not missing something serious.
> At least we know that block setup data won't go to snapshot.
> I've also checked starting background snapshot from the stopped VM state -
> looks OK, VM resumes operation, snapshot is saved, no apparent problems.
> 
> Maybe it will take some time, since now I'm on task to create tool to store
> snapshots with RAM indexable by GPFNs, together with the rest of VMSTATE.

If you want to make it indexable, why not just do a simple write(2) call
for the whole of RAM rather than doing the thing like normal migration?

Dave

> Based on QCOW2 format. Also it should support snapshot revert in postcopy mode.
> 
> Andrey
> 
> > > //
> > > 
> > > > > Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> > > > > Acked-by: Peter Xu <peterx@redhat.com>
> > > > > ---
> > > > >    migration/migration.c | 255 +++++++++++++++++++++++++++++++++++++++++-
> > > > >    migration/migration.h |   3 +
> > > > >    migration/ram.c       |   2 +
> > > > >    migration/savevm.c    |   1 -
> > > > >    migration/savevm.h    |   2 +
> > > > >    5 files changed, 260 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/migration/migration.c b/migration/migration.c
> > > > > index 2c2cb9ef01..0901a15ac5 100644
> > > > <snip>
> > > > 
> > > > > -    qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
> > > > > -                       QEMU_THREAD_JOINABLE);
> > > > > +
> > > > > +    if (migrate_background_snapshot()) {
> > > > > +        qemu_thread_create(&s->thread, "background_snapshot",
> > > > Unfortunately that wont work - there's a 14 character limit on
> > > > the thread name length; I guess we just shorten that to bg_snapshot
> > > Yep, missed that pthread_set_name_np() has a length limit)
> > > 
> > > > Other than that,
> > > > 
> > > > 
> > > > 
> > > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > > 
> > > > > +                bg_migration_thread, s, QEMU_THREAD_JOINABLE);
> > > > > +    } else {
> > > > > +        qemu_thread_create(&s->thread, "live_migration",
> > > > > +                migration_thread, s, QEMU_THREAD_JOINABLE);
> > > > > +    }
> > > > >        s->migration_thread_running = true;
> > > > >    }
> > > > > diff --git a/migration/migration.h b/migration/migration.h
> > > > > index f40338cfbf..0723955cd7 100644
> > > > > --- a/migration/migration.h
> > > > > +++ b/migration/migration.h
> > > > > @@ -20,6 +20,7 @@
> > > > >    #include "qemu/thread.h"
> > > > >    #include "qemu/coroutine_int.h"
> > > > >    #include "io/channel.h"
> > > > > +#include "io/channel-buffer.h"
> > > > >    #include "net/announce.h"
> > > > >    #include "qom/object.h"
> > > > > @@ -147,8 +148,10 @@ struct MigrationState {
> > > > >        /*< public >*/
> > > > >        QemuThread thread;
> > > > > +    QEMUBH *vm_start_bh;
> > > > >        QEMUBH *cleanup_bh;
> > > > >        QEMUFile *to_dst_file;
> > > > > +    QIOChannelBuffer *bioc;
> > > > >        /*
> > > > >         * Protects to_dst_file pointer.  We need to make sure we won't
> > > > >         * yield or hang during the critical section, since this lock will
> > > > > diff --git a/migration/ram.c b/migration/ram.c
> > > > > index 5707382db1..05fe0c8592 100644
> > > > > --- a/migration/ram.c
> > > > > +++ b/migration/ram.c
> > > > > @@ -1471,6 +1471,7 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
> > > > >        page_address = (void *) uffd_msg.arg.pagefault.address;
> > > > >        bs = qemu_ram_block_from_host(page_address, false, offset);
> > > > >        assert(bs && (bs->flags & RAM_UF_WRITEPROTECT) != 0);
> > > > > +
> > > > >        return bs;
> > > > >    }
> > > > >    #endif /* CONFIG_LINUX */
> > > > > @@ -1836,6 +1837,7 @@ static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
> > > > >            /* Un-protect memory range. */
> > > > >            res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
> > > > >                    false, false);
> > > > > +
> > > > >            /* We don't want to override existing error from ram_save_host_page(). */
> > > > >            if (res < 0 && *res_override >= 0) {
> > > > >                *res_override = res;
> > > > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > > > index 27e842812e..dd4ad0aaaf 100644
> > > > > --- a/migration/savevm.c
> > > > > +++ b/migration/savevm.c
> > > > > @@ -1354,7 +1354,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
> > > > >        return 0;
> > > > >    }
> > > > > -static
> > > > >    int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
> > > > >                                                        bool in_postcopy,
> > > > >                                                        bool inactivate_disks)
> > > > > diff --git a/migration/savevm.h b/migration/savevm.h
> > > > > index ba64a7e271..aaee2528ed 100644
> > > > > --- a/migration/savevm.h
> > > > > +++ b/migration/savevm.h
> > > > > @@ -64,5 +64,7 @@ int qemu_loadvm_state(QEMUFile *f);
> > > > >    void qemu_loadvm_state_cleanup(void);
> > > > >    int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
> > > > >    int qemu_load_device_state(QEMUFile *f);
> > > > > +int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
> > > > > +        bool in_postcopy, bool inactivate_disks);
> > > > >    #endif
> > > > > -- 
> > > > > 2.25.1
> > > > > 
> > > -- 
> > > Andrey Gruzdev, Principal Engineer
> > > Virtuozzo GmbH  +7-903-247-6397
> > >                  virtuzzo.com
> > > 
> -- 
> Andrey Gruzdev, Principal Engineer
> Virtuozzo GmbH  +7-903-247-6397
>                 virtuzzo.com
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


