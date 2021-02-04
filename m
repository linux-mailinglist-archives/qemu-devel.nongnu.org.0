Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB5C30FC1D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:02:05 +0100 (CET)
Received: from localhost ([::1]:52794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jtE-0007Mz-EW
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jHt-00060Z-8l
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:23:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7jHn-0007wG-Im
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612463002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRSX/JTzQYizxy4FBcP9Pl72nibHQ2Mo+zi0+j+Oq3s=;
 b=X5Aame1NCFhJm6FbflLMREnDY46qxOgI6YgvNaz/x2RkGCRUDcK6zUwo1AgYhe8Q9zJ8Vw
 vp3wFazBJDH3/SOXaC2n5ZECsuCxU5q05F+7wGNqe3Q1D9HH58ZdeTx9WhmoX4y1c51R2u
 pX80cVWOSCeN+obgXqUzNpkXZN+MmLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-P4aaKsfuOCy9N2hDjMH2CQ-1; Thu, 04 Feb 2021 13:23:21 -0500
X-MC-Unique: P4aaKsfuOCy9N2hDjMH2CQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E3011800D41;
 Thu,  4 Feb 2021 18:23:20 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 514BB5D9CD;
 Thu,  4 Feb 2021 18:23:18 +0000 (UTC)
Date: Thu, 4 Feb 2021 18:22:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 00/33] migration: capture error reports into Error object
Message-ID: <20210204182249.GO3039@work-vm>
References: <20210204171907.901471-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-1-berrange@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> Due to its long term heritage most of the migration code just invokes
> 'error_report' when problems hit. This was fine for HMP, since the
> messages get redirected from stderr, into the HMP console. It is not
> OK for QMP because the errors will not be fed back to the QMP client.
> 
> This wasn't a terrible real world problem with QMP so far because
> live migration happens in the background, so at least on the target side
> there is not a QMP command that needs to capture the incoming migration.
> It is a problem on the source side but it doesn't hit frequently as the
> source side has fewer failure scenarios. None the less on both sides it
> would be desirable if 'query-migrate' can report errors correctly.
> With the introduction of the load-snapshot QMP commands, the need for
> error reporting becomes more pressing.
> 
> Wiring up good error reporting is a large and difficult job, which
> this series does NOT complete. The focus here has been on converting
> all methods in savevm.c which have an 'int' return value capable of
> reporting errors. This covers most of the infrastructure for controlling
> the migration state serialization / protocol.
> 
> The remaining part that is missing error reporting are the callbacks in
> the VMStateDescription struct which can return failure codes, but have
> no "Error **errp" parameter. Thinking about how this might be dealt with
> in future, a big bang conversion is likely non-viable. We'll probably
> want to introduce a duplicate set of callbacks with the "Error **errp"
> parameter and convert impls in batches, eventually removing the
> original callbacks. I don't intend todo that myself in the immediate
> future.
> 
> IOW, this patch series probably solves 50% of the problem, but we
> still do need the rest to get ideal error reporting.
> 
> In doing this savevm conversion I noticed a bunch of places which
> see and then ignore errors. I only fixed one or two of them which
> were clearly dubious. Other places in savevm.c where it seemed it
> was probably ok to ignore errors, I've left using error_report()
> on the basis that those are really warnings. Perhaps they could
> be changed to warn_report() instead.
> 
> There are alot of patches here, but I felt it was easier to review
> for correctness if I converted 1 function at a time. The series
> does not neccessarily have to be reviewed/appied in 1 go.

After this series, what do my errors look like, and where do they end
up?
Do I get my nice backtrace shwoing that device failed, then that was
part of that one...

Dave

> Daniel P. Berrangé (33):
>   migration: push Error **errp into qemu_loadvm_state()
>   migration: push Error **errp into qemu_loadvm_state_header()
>   migration: push Error **errp into qemu_loadvm_state_setup()
>   migration: push Error **errp into qemu_load_device_state()
>   migration: push Error **errp into qemu_loadvm_state_main()
>   migration: push Error **errp into qemu_loadvm_section_start_full()
>   migration: push Error **errp into qemu_loadvm_section_part_end()
>   migration: push Error **errp into loadvm_process_command()
>   migration: push Error **errp into loadvm_handle_cmd_packaged()
>   migration: push Error **errp into loadvm_postcopy_handle_advise()
>   migration: push Error **errp into ram_postcopy_incoming_init()
>   migration: push Error **errp into loadvm_postcopy_handle_listen()
>   migration: push Error **errp into loadvm_postcopy_handle_run()
>   migration: push Error **errp into loadvm_postcopy_ram_handle_discard()
>   migration: make loadvm_postcopy_handle_resume() void
>   migration: push Error **errp into loadvm_handle_recv_bitmap()
>   migration: push Error **errp into loadvm_process_enable_colo()
>   migration: push Error **errp into colo_init_ram_cache()
>   migration: push Error **errp into check_section_footer()
>   migration: push Error **errp into global_state_store()
>   migration: remove error reporting from qemu_fopen_bdrv() callers
>   migration: push Error **errp into qemu_savevm_state_iterate()
>   migration: simplify some error reporting in save_snapshot()
>   migration: push Error **errp into qemu_savevm_state_setup()
>   migration: push Error **errp into qemu_savevm_state_complete_precopy()
>   migration: push Error **errp into
>     qemu_savevm_state_complete_precopy_non_iterable()
>   migration: push Error **errp into qemu_savevm_state_complete_precopy()
>   migration: push Error **errp into qemu_savevm_send_packaged()
>   migration: push Error **errp into qemu_savevm_live_state()
>   migration: push Error **errp into qemu_save_device_state()
>   migration: push Error **errp into qemu_savevm_state_resume_prepare()
>   migration: push Error **errp into postcopy_resume_handshake()
>   migration: push Error **errp into postcopy_do_resume()
> 
>  include/migration/colo.h                      |   2 +-
>  include/migration/global_state.h              |   2 +-
>  migration/colo.c                              |  12 +-
>  migration/global_state.c                      |   6 +-
>  migration/migration.c                         |  80 ++-
>  migration/postcopy-ram.c                      |   8 +-
>  migration/postcopy-ram.h                      |   2 +-
>  migration/ram.c                               |  17 +-
>  migration/ram.h                               |   4 +-
>  migration/savevm.c                            | 594 ++++++++++--------
>  migration/savevm.h                            |  23 +-
>  .../tests/internal-snapshots-qapi.out         |   3 +-
>  12 files changed, 427 insertions(+), 326 deletions(-)
> 
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


