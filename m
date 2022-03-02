Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A189B4CA61B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:34:08 +0100 (CET)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPP7H-00017V-N5
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNsP-0005E7-1s
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNsM-0000li-Ln
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646223278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VaZuZ8bFsF328NsOd2E0d/VE38CabpDI2wPEAUKwOoE=;
 b=J6ZJZRf5CeZR9hyT1vNxKGv0GwQ5E8R2XG6HdvhKcfBVV4h93tdYm/v/4fT1P8MKggelgs
 m8NEyRkaqUDhfGqZ6j0DPkDvlYpOm0I4uR689k+5R0/KhqtZRNZSPp17xjoC7l0gDD0eYU
 bZ2nh3CUxA7z2JHpHpSpiXoMGbAWw20=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-uTtkOmklPPOB9I35JSsGRw-1; Wed, 02 Mar 2022 07:14:34 -0500
X-MC-Unique: uTtkOmklPPOB9I35JSsGRw-1
Received: by mail-wr1-f69.google.com with SMTP id
 c5-20020adffb05000000b001edbbefe96dso571472wrr.8
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VaZuZ8bFsF328NsOd2E0d/VE38CabpDI2wPEAUKwOoE=;
 b=UDB1zlsxkYvcKl6jUEqqSaCtvdrGrIl53Nak6QSWzNClsr4HuMlBxtR2M7YVVJqQK2
 5l8Vl03neu3t5NqMvuqSwKMAxUlDOtQNT4TzI/bEP2Eq+R8w0SgrgWU7n6bKvxQAhE2W
 B5glDzVpmqf08euNaKd56pNvOk0wCBglzzjC0kkZkoJlLxWyt9sW3ASiiz6GkGMtZmlr
 8hBokWK/e2vGfnxxc6y64PSqZW+KpaFKVZcqVbyijcwRjK7P6Ih0BsQu+a3v8K+mEXG1
 PgTnUwfDKv+xGu/gLOs4RSWEhkzv/YVeuQ+6yDrYKPRuanO6+wK19pOyB6y6xHerb3z/
 0a+A==
X-Gm-Message-State: AOAM533E9kr+1LWcMHKrVLT8VjtkZ0M3dDDNZXWnlQ9sm77AcDmsXiOJ
 Jhy0cJOvcYFxGZdZZNrUuKFnIe9YNWGEdbtMO95hAZwl672MAy5nD8u3daqyjdonoS4Gp96rqXQ
 xQ7c5ZFjh6Ctj+r4=
X-Received: by 2002:adf:f5c3:0:b0:1ed:c1da:9684 with SMTP id
 k3-20020adff5c3000000b001edc1da9684mr23102318wrp.245.1646223273052; 
 Wed, 02 Mar 2022 04:14:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4T5Yz0pZDk/1tkJpNamvdJ1lxQu1EBVFgXhfbPbJbKbS+bBlhk5OER1oAApzPPf36dOEU9A==
X-Received: by 2002:adf:f5c3:0:b0:1ed:c1da:9684 with SMTP id
 k3-20020adff5c3000000b001edc1da9684mr23102306wrp.245.1646223272753; 
 Wed, 02 Mar 2022 04:14:32 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 s17-20020adfdb11000000b001f02d5fea43sm2360222wri.98.2022.03.02.04.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:14:32 -0800 (PST)
Date: Wed, 2 Mar 2022 12:14:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 00/25] migration: Postcopy Preemption
Message-ID: <Yh9fpg0AMdL5sPXd@work-vm>
References: <20220301083925.33483-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> This is v2 of postcopy preempt series.  It can also be found here:
> 
>   https://github.com/xzpeter/qemu/tree/postcopy-preempt
> 
> RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
> V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com

I've queued some of this:

tests: Pass in MigrateStart** into test_migrate_start()
migration: Add migration_incoming_transport_cleanup()
migration: postcopy_pause_fault_thread() never fails
migration: Enlarge postcopy recovery to capture !-EIO too
migration: Move static var in ram_block_from_stream() into global
migration: Add postcopy_thread_create()
migration: Dump ramblock and offset too when non-same-page detected
migration: Introduce postcopy channels on dest node
migration: Tracepoint change in postcopy-run bottom half
migration: Finer grained tracepoints for POSTCOPY_LISTEN
migration: Dump sub-cmd name in loadvm_process_command tp

> v1->v2 changelog:
> - Picked up more r-bs from Dave
> - Rename both fault threads to drop "qemu/" prefix [Dave]
> - Further rework on postcopy recovery, to be able to detect qemufile errors
>   from either main channel or postcopy one [Dave]
> - shutdown() qemufile before close on src postcopy channel when postcopy is
>   paused [Dave]
> - In postcopy_preempt_new_channel(), explicitly set the new channel in
>   blocking state, even if it's the default [Dave]
> - Make RAMState.postcopy_channel unsigned int [Dave]
> - Added patches:
>   - "migration: Create the postcopy preempt channel asynchronously"
>   - "migration: Parameter x-postcopy-preempt-break-huge"
>   - "migration: Add helpers to detect TLS capability"
>   - "migration: Fail postcopy preempt with TLS"
>   - "tests: Pass in MigrateStart** into test_migrate_start()"
> 
> Abstract
> ========
> 
> This series added a new migration capability called "postcopy-preempt".  It can
> be enabled when postcopy is enabled, and it'll simply (but greatly) speed up
> postcopy page requests handling process.
> 
> Below are some initial postcopy page request latency measurements after the
> new series applied.
> 
> For each page size, I measured page request latency for three cases:
> 
>   (a) Vanilla:                the old postcopy
>   (b) Preempt no-break-huge:  preempt enabled, x-postcopy-preempt-break-huge=off
>   (c) Preempt full:           preempt enabled, x-postcopy-preempt-break-huge=on
>                               (this is the default option when preempt enabled)
> 
> Here x-postcopy-preempt-break-huge parameter is just added in v2 so as to
> conditionally disable the behavior to break sending a precopy huge page for
> debugging purpose.  So when it's off, postcopy will not preempt precopy
> sending a huge page, but still postcopy will use its own channel.
> 
> I tested it separately to give a rough idea on which part of the change
> helped how much of it.  The overall benefit should be the comparison
> between case (a) and (c).
> 
>   |-----------+---------+-----------------------+--------------|
>   | Page size | Vanilla | Preempt no-break-huge | Preempt full |
>   |-----------+---------+-----------------------+--------------|
>   | 4K        |   10.68 |               N/A [*] |         0.57 |
>   | 2M        |   10.58 |                  5.49 |         5.02 |
>   | 1G        | 2046.65 |               933.185 |      649.445 |
>   |-----------+---------+-----------------------+--------------|
>   [*]: This case is N/A because 4K page does not contain huge page at all
> 
> [1] https://github.com/xzpeter/small-stuffs/blob/master/tools/huge_vm/uffd-latency.bpf
> 
> TODO List
> =========
> 
> TLS support
> -----------
> 
> I only noticed its missing very recently.  Since soft freeze is coming, and
> obviously I'm still growing this series, so I tend to have the existing
> material discussed. Let's see if it can still catch the train for QEMU 7.0
> release (soft freeze on 2022-03-08)..
> 
> Avoid precopy write() blocks postcopy
> -------------------------------------
> 
> I didn't prove this, but I always think the write() syscalls being blocked
> for precopy pages can affect postcopy services.  If we can solve this
> problem then my wild guess is we can further reduce the average page
> latency.
> 
> Two solutions at least in mind: (1) we could have made the write side of
> the migration channel NON_BLOCK too, or (2) multi-threads on send side,
> just like multifd, but we may use lock to protect which page to send too
> (e.g., the core idea is we should _never_ rely anything on the main thread,
> multifd has that dependency on queuing pages only on main thread).
> 
> That can definitely be done and thought about later.
> 
> Multi-channel for preemption threads
> ------------------------------------
> 
> Currently the postcopy preempt feature use only one extra channel and one
> extra thread on dest (no new thread on src QEMU).  It should be mostly good
> enough for major use cases, but when the postcopy queue is long enough
> (e.g. hundreds of vCPUs faulted on different pages) logically we could
> still observe more delays in average.  Whether growing threads/channels can
> solve it is debatable, but sounds worthwhile a try.  That's yet another
> thing we can think about after this patchset lands.
> 
> Logically the design provides space for that - the receiving postcopy
> preempt thread can understand all ram-layer migration protocol, and for
> multi channel and multi threads we could simply grow that into multile
> threads handling the same protocol (with multiple PostcopyTmpPage).  The
> source needs more thoughts on synchronizations, though, but it shouldn't
> affect the whole protocol layer, so should be easy to keep compatible.
> 
> Patch Layout
> ============
> 
> Patch 1-3: Three leftover patches from patchset "[PATCH v3 0/8] migration:
> Postcopy cleanup on ram disgard" that I picked up here too.
> 
>   https://lore.kernel.org/qemu-devel/20211224065000.97572-1-peterx@redhat.com/
> 
>   migration: Dump sub-cmd name in loadvm_process_command tp
>   migration: Finer grained tracepoints for POSTCOPY_LISTEN
>   migration: Tracepoint change in postcopy-run bottom half
> 
> Patch 4-9: Original postcopy preempt RFC preparation patches (with slight
> modifications).
> 
>   migration: Introduce postcopy channels on dest node
>   migration: Dump ramblock and offset too when non-same-page detected
>   migration: Add postcopy_thread_create()
>   migration: Move static var in ram_block_from_stream() into global
>   migration: Add pss.postcopy_requested status
>   migration: Move migrate_allow_multifd and helpers into migration.c
> 
> Patch 10-15: Some newly added patches when working on postcopy recovery
> support.  After these patches migrate-recover command will allow re-entrance,
> which is a very nice side effect.
> 
>   migration: Enlarge postcopy recovery to capture !-EIO too
>   migration: postcopy_pause_fault_thread() never fails
>   migration: Export ram_load_postcopy()
>   migration: Move channel setup out of postcopy_try_recover()
>   migration: Add migration_incoming_transport_cleanup()
>   migration: Allow migrate-recover to run multiple times
> 
> Patch 16-19: The major work of postcopy preemption implementation is split into
> four patches as suggested by Dave.
> 
>   migration: Add postcopy-preempt capability
>   migration: Postcopy preemption preparation on channel creation
>   migration: Postcopy preemption enablement
>   migration: Postcopy recover with preempt enabled
> 
> Patch 20-23: Newly added patches in this v2 for different purposes.
>              Majorly some amendment on existing postcopy preempt.
> 
>   migration: Create the postcopy preempt channel asynchronously
>   migration: Parameter x-postcopy-preempt-break-huge
>   migration: Add helpers to detect TLS capability
>   migration: Fail postcopy preempt with TLS for now
> 
> Patch 24-25: Test cases (including one more patch for cleanup)
> 
>   tests: Add postcopy preempt test
>   tests: Pass in MigrateStart** into test_migrate_start()
> 
> Please review, thanks.
> 
> Peter Xu (25):
>   migration: Dump sub-cmd name in loadvm_process_command tp
>   migration: Finer grained tracepoints for POSTCOPY_LISTEN
>   migration: Tracepoint change in postcopy-run bottom half
>   migration: Introduce postcopy channels on dest node
>   migration: Dump ramblock and offset too when non-same-page detected
>   migration: Add postcopy_thread_create()
>   migration: Move static var in ram_block_from_stream() into global
>   migration: Add pss.postcopy_requested status
>   migration: Move migrate_allow_multifd and helpers into migration.c
>   migration: Enlarge postcopy recovery to capture !-EIO too
>   migration: postcopy_pause_fault_thread() never fails
>   migration: Export ram_load_postcopy()
>   migration: Move channel setup out of postcopy_try_recover()
>   migration: Add migration_incoming_transport_cleanup()
>   migration: Allow migrate-recover to run multiple times
>   migration: Add postcopy-preempt capability
>   migration: Postcopy preemption preparation on channel creation
>   migration: Postcopy preemption enablement
>   migration: Postcopy recover with preempt enabled
>   migration: Create the postcopy preempt channel asynchronously
>   migration: Parameter x-postcopy-preempt-break-huge
>   migration: Add helpers to detect TLS capability
>   migration: Fail postcopy preempt with TLS for now
>   tests: Add postcopy preempt test
>   tests: Pass in MigrateStart** into test_migrate_start()
> 
>  migration/channel.c          |  10 +-
>  migration/migration.c        | 235 ++++++++++++++++++++-----
>  migration/migration.h        |  98 ++++++++++-
>  migration/multifd.c          |  26 +--
>  migration/multifd.h          |   2 -
>  migration/postcopy-ram.c     | 244 +++++++++++++++++++++-----
>  migration/postcopy-ram.h     |  15 ++
>  migration/qemu-file.c        |  27 +++
>  migration/qemu-file.h        |   1 +
>  migration/ram.c              | 330 +++++++++++++++++++++++++++++++----
>  migration/ram.h              |   3 +
>  migration/savevm.c           |  70 ++++++--
>  migration/socket.c           |  22 ++-
>  migration/socket.h           |   1 +
>  migration/trace-events       |  19 +-
>  qapi/migration.json          |   8 +-
>  tests/qtest/migration-test.c |  68 ++++++--
>  17 files changed, 983 insertions(+), 196 deletions(-)
> 
> -- 
> 2.32.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


