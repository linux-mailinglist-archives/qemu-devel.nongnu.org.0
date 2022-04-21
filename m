Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0B450A201
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:19:55 +0200 (CEST)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXf0-0000h1-5O
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhXJa-00014o-9P
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhXJY-0007Lo-3E
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0jfOD+1WdIg/Tdx5NoQqfY33HpeUjX6PJd404zFxm4Q=;
 b=BOiVjOia4lhsYMnZYIgQx2NZ3+Fvjkf8PjUs+UaVTnjpFQaSH5ow/0qjmYYYoToQIHad4R
 l8SkjrdRxt+A7edEp8Yml/IjWY2i7Sxm5mVJLgNINYC0sVcw0BotTuI73XxdOuZpBpTr1F
 iZCtFH+n1I5XnFCFdHXxRj6p2+zxSFc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-O9yP3MWgNb2-XqQv4h8oSA-1; Thu, 21 Apr 2022 09:57:42 -0400
X-MC-Unique: O9yP3MWgNb2-XqQv4h8oSA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p21-20020a1c5455000000b0038ff4f1014fso2383836wmi.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 06:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0jfOD+1WdIg/Tdx5NoQqfY33HpeUjX6PJd404zFxm4Q=;
 b=GsEYUHF43mjs8AyV6PZsFpch2Lw+AeUmbbHjDkv7wGX5j/fnBp8ZiLQ4DIOxHymHHQ
 uNDrnpZp0NBImJ5asqlx3+0gOT74Vx5GsrfOmwA8kd+Q8i522u5K9SEPxBuLCNR4XYja
 ODvAFodcJN4XrCz0ChV7Vv6Lg3FOFDO8yMXWXiCEJ+JnTXjxDUKAX/EoaBskW12WjDa1
 SrwoG2KAaz4lFenmCnRG5FeqFjomlGVXRXlimQAyDs9ItBwkwxJFn+K3JP3wiYlQCBiF
 NKD+2jeAgtA3pDg/CI3SB3cCSqFLWn2Q3/tSvZfRxYu1r1Ol3GAHFc/vR40elhTWUxSR
 SNNQ==
X-Gm-Message-State: AOAM533fil+0VjLqn7/z12ZTWEHkYDd/97ox4WrQcj8KJVfPfAfdk8Jg
 wpGHlBxwejSgfB7g1B0Ohkd8KA/S/oAQxHfSfDN2/2mDl0dDjbFenJ+qFR5irvZyC4rxN+7fEHF
 eCBXouh89i/BU52Q=
X-Received: by 2002:a1c:218b:0:b0:38e:aa07:62a8 with SMTP id
 h133-20020a1c218b000000b0038eaa0762a8mr8785578wmh.172.1650549460962; 
 Thu, 21 Apr 2022 06:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdOX6390znTcYfUCocS4Uu6lWXX2W712d77Lpfj2sXdbsy/CsRqQSweOfDcXWgQhzqVwhCvA==
X-Received: by 2002:a1c:218b:0:b0:38e:aa07:62a8 with SMTP id
 h133-20020a1c218b000000b0038eaa0762a8mr8785555wmh.172.1650549460674; 
 Thu, 21 Apr 2022 06:57:40 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm2110429wma.21.2022.04.21.06.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 06:57:40 -0700 (PDT)
Date: Thu, 21 Apr 2022 14:57:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 00/19] migration: Postcopy Preemption
Message-ID: <YmFi0S36y+79HnzR@work-vm>
References: <20220331150857.74406-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331150857.74406-1-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> This is v4 of postcopy preempt series.  It can also be found here:
> 
>   https://github.com/xzpeter/qemu/tree/postcopy-preempt
> 
> RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
> V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
> V2:  https://lore.kernel.org/qemu-devel/20220301083925.33483-1-peterx@redhat.com
> V3:  https://lore.kernel.org/qemu-devel/20220330213908.26608-1-peterx@redhat.com

I've queued:
migration: Allow migrate-recover to run multiple times
migration: Move channel setup out of postcopy_try_recover()
migration: Export ram_load_postcopy()
migration: Move migrate_allow_multifd and helpers into migration.c
migration: Add pss.postcopy_requested status
migration: Drop multifd tls_hostname cache
migration: Postpone releasing MigrationState.hostname

> v4:
> - Fix a double-free on params.tls-creds when quitting qemu
> - Reorder patches to satisfy per-commit builds
> 
> v3:
> - Rebased to master since many patches landed
> - Fixed one bug on postcopy recovery when preempt enabled, this is only
>   found when I test with TLS+recovery, because TLS changed the timing.
> - Dropped patch:
>   "migration: Fail postcopy preempt with TLS for now"
> - Added patches for TLS:
>   - "migration: Postpone releasing MigrationState.hostname"
>   - "migration: Drop multifd tls_hostname cache"
>   - "migration: Enable TLS for preempt channel"
>   - "migration: Export tls-[creds|hostname|authz] params to cmdline too"
>   - "tests: Add postcopy tls migration test"
>   - "tests: Add postcopy tls recovery migration test"
> - Added two more tests to the preempt test patch (tls, tls+recovery)
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
> Please review, thanks.
> 
> Peter Xu (19):
>   migration: Postpone releasing MigrationState.hostname
>   migration: Drop multifd tls_hostname cache
>   migration: Add pss.postcopy_requested status
>   migration: Move migrate_allow_multifd and helpers into migration.c
>   migration: Export ram_load_postcopy()
>   migration: Move channel setup out of postcopy_try_recover()
>   migration: Allow migrate-recover to run multiple times
>   migration: Add postcopy-preempt capability
>   migration: Postcopy preemption preparation on channel creation
>   migration: Postcopy preemption enablement
>   migration: Postcopy recover with preempt enabled
>   migration: Create the postcopy preempt channel asynchronously
>   migration: Parameter x-postcopy-preempt-break-huge
>   migration: Add helpers to detect TLS capability
>   migration: Export tls-[creds|hostname|authz] params to cmdline too
>   migration: Enable TLS for preempt channel
>   tests: Add postcopy tls migration test
>   tests: Add postcopy tls recovery migration test
>   tests: Add postcopy preempt tests
> 
>  migration/channel.c          |  11 +-
>  migration/migration.c        | 218 ++++++++++++++++++++------
>  migration/migration.h        |  52 ++++++-
>  migration/multifd.c          |  36 +----
>  migration/multifd.h          |   4 -
>  migration/postcopy-ram.c     | 190 ++++++++++++++++++++++-
>  migration/postcopy-ram.h     |  11 ++
>  migration/qemu-file.c        |  27 ++++
>  migration/qemu-file.h        |   1 +
>  migration/ram.c              | 288 +++++++++++++++++++++++++++++++++--
>  migration/ram.h              |   3 +
>  migration/savevm.c           |  49 ++++--
>  migration/socket.c           |  22 ++-
>  migration/socket.h           |   1 +
>  migration/trace-events       |  15 +-
>  qapi/migration.json          |   8 +-
>  tests/qtest/migration-test.c | 113 ++++++++++++--
>  17 files changed, 918 insertions(+), 131 deletions(-)
> 
> -- 
> 2.32.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


