Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603257A036
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:58:05 +0200 (CEST)
Received: from localhost ([::1]:47180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnjg-0001GQ-9g
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDncD-0001pV-Co
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDncA-0002Og-Cg
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658238615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uLQ5ouzX3BEWfAVdKLeeSVdONaTYFJR9g6190D/ANtc=;
 b=VdzSymTljRTM+S/Imq+aloPmC3qwZts0kXxoKi/jfR3EnFWfW1GFyW3vW7FqZHJZ//Bvtc
 GCncqpDpUEZmPDblQkohnsAAfGN5IxY6HmIwr3VRATq1ntrnPMEvZg7PZuxoEs8l85lazp
 cnWE/0Qid7Dz8s9QdPJ2FtIKPongvhA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-frOcr7IJP7WaczzGAVum6w-1; Tue, 19 Jul 2022 09:50:14 -0400
X-MC-Unique: frOcr7IJP7WaczzGAVum6w-1
Received: by mail-wm1-f69.google.com with SMTP id
 p2-20020a05600c1d8200b003a3262d9c51so487983wms.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uLQ5ouzX3BEWfAVdKLeeSVdONaTYFJR9g6190D/ANtc=;
 b=I+dqnphNN7uks4mnpvRWtINMaLFEFCbIY/FzIQKSdksdOrWA8fHZrDKi72SROEUJp0
 tMzEvFszsMZ3K6TSU9C5qf3bnmhuBJFgNVYKLBhr1e+JxYhRusygfk0YTQ3JkrB+H0aC
 f2wHr0Mn8O5qE72PZ2+j4+Y7CL6YkzYGOB1CdhOnyTBym2R+pXbHgO0wOf1ejI1hRXBy
 q/N/NQeXUsKU/FUfeUKsexSQ5MTU+L563OB0lroQyi8SL5PPqrd0mdrxlBSMY7cl6eyH
 Sj/6GbfEC7++6CdYpInZtsFghF0xVhSYDTcpk6vBsS+JMNMCTI3YZ+XHqdBFcKmgiPK/
 fT1g==
X-Gm-Message-State: AJIora8ir8v2OszWSb2DQNNkoZew6QhivRX22AZV6gyTKBfAoEBaxPZu
 DbVLn1ibIDh/GuZxd83/oTKRCgvG/4bL7o7G8aDf4QA9kaarFViBfQkEd2Kbn/d9h4lAcqpuVJi
 NQKlvwVWt2joRkGQ=
X-Received: by 2002:a7b:cb82:0:b0:39e:f9cf:12b7 with SMTP id
 m2-20020a7bcb82000000b0039ef9cf12b7mr37396756wmi.135.1658238612840; 
 Tue, 19 Jul 2022 06:50:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sXAYAUofFob6Cm1/Ss7VyUIhdfYNL212T2DdvGz60MaELI4LbnE2B2Idd9/IQhB9uQCCGIHg==
X-Received: by 2002:a7b:cb82:0:b0:39e:f9cf:12b7 with SMTP id
 m2-20020a7bcb82000000b0039ef9cf12b7mr37396737wmi.135.1658238612597; 
 Tue, 19 Jul 2022 06:50:12 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c511400b003a30fbde91dsm14026116wms.20.2022.07.19.06.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 06:50:12 -0700 (PDT)
Date: Tue, 19 Jul 2022 14:50:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v9 00/14] migration: Postcopy Preemption
Message-ID: <Yta2kWr1W5ht0qWR@work-vm>
References: <20220707185342.26794-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707185342.26794-1-peterx@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Based on:
>   [PATCH] tests: migration-test: Allow test to run without uffd
>   https://lore.kernel.org/qemu-devel/20220707184600.24164-1-peterx@redhat.com/
> 
> This is v8 of postcopy preempt series.  It can also be found here:
>   https://github.com/xzpeter/qemu/tree/postcopy-preempt
> 
> RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
> V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
> V2:  https://lore.kernel.org/qemu-devel/20220301083925.33483-1-peterx@redhat.com
> V3:  https://lore.kernel.org/qemu-devel/20220330213908.26608-1-peterx@redhat.com
> V4:  https://lore.kernel.org/qemu-devel/20220331150857.74406-1-peterx@redhat.com
> V5:  https://lore.kernel.org/qemu-devel/20220425233847.10393-1-peterx@redhat.com
> V6:  https://lore.kernel.org/qemu-devel/20220517195730.32312-1-peterx@redhat.com
> V7:  https://lore.kernel.org/qemu-devel/20220524221151.18225-1-peterx@redhat.com
> V8:  https://lore.kernel.org/qemu-devel/20220622204920.79061-1-peterx@redhat.com
> 
> v9:
> - Rebase upon latest master (plus the test fix above on "tests:
>   migration-test: Allow test to run without uffd")
> - Added missing R-bs in v7

Queued, took some minor rework in the tests

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
> Peter Xu (14):
>   migration: Add postcopy-preempt capability
>   migration: Postcopy preemption preparation on channel creation
>   migration: Postcopy preemption enablement
>   migration: Postcopy recover with preempt enabled
>   migration: Create the postcopy preempt channel asynchronously
>   migration: Add property x-postcopy-preempt-break-huge
>   migration: Add helpers to detect TLS capability
>   migration: Export tls-[creds|hostname|authz] params to cmdline too
>   migration: Enable TLS for preempt channel
>   migration: Respect postcopy request order in preemption mode
>   tests: Move MigrateCommon upper
>   tests: Add postcopy tls migration test
>   tests: Add postcopy tls recovery migration test
>   tests: Add postcopy preempt tests
> 
>  migration/channel.c          |   9 +-
>  migration/migration.c        | 134 ++++++++++++--
>  migration/migration.h        |  44 ++++-
>  migration/multifd.c          |   4 +-
>  migration/postcopy-ram.c     | 186 +++++++++++++++++++-
>  migration/postcopy-ram.h     |  11 ++
>  migration/qemu-file.c        |  27 +++
>  migration/qemu-file.h        |   1 +
>  migration/ram.c              | 326 +++++++++++++++++++++++++++++++++--
>  migration/ram.h              |   4 +-
>  migration/savevm.c           |  46 +++--
>  migration/socket.c           |  22 ++-
>  migration/socket.h           |   1 +
>  migration/tls.c              |   9 +
>  migration/tls.h              |   4 +
>  migration/trace-events       |  15 +-
>  qapi/migration.json          |   7 +-
>  tests/qtest/migration-test.c | 286 +++++++++++++++++++++---------
>  18 files changed, 990 insertions(+), 146 deletions(-)
> 
> -- 
> 2.32.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


