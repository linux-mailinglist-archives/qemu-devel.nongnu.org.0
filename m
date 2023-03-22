Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE706C5368
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 19:15:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2yA-0006tT-TD; Wed, 22 Mar 2023 14:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pf2y8-0006t5-7C
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:13:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pf2y6-0008Vd-2Y
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679508829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oPChBHUWJ+urTWumeUYPtHOzTHMTDedS+2urz4m3Pw0=;
 b=VHppwENi6OSdc7IaOMYTKgyuEtlsTO42+2jG00q1mGjrEVBbabCOdT6UtevJVY1V9+D9Hx
 QY3MyjvzWKCd1fD4Qhp/0P0916aLBL29fC/gTdRqey+4Ej3eNKJGsvpK4Z65oqxkvZpIK7
 hL8d0mKQlCKGfUTjhWidq5iQoFpbwa4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-9ongd82qOUeSM-WFAwYJOg-1; Wed, 22 Mar 2023 14:13:47 -0400
X-MC-Unique: 9ongd82qOUeSM-WFAwYJOg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o37-20020a05600c512500b003edd119ec9eso5718032wms.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 11:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679508826;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oPChBHUWJ+urTWumeUYPtHOzTHMTDedS+2urz4m3Pw0=;
 b=qFAL3GUOVHlS54X1qGphWoNZXRVPKMorv1GWoJrTMij9fGDq6vPRiIfc4abpMuaJdH
 3jwA7W0bunRulRXBupeibHnaKc3+3dirusMuk5YpbN4tOwrG8MZycFfkEqFl6sQj2PMi
 P+yaAKwQ5j27RsuDk+MU4EXIuwDA7tSFiysHf0pWNafhXliUCPVtrhEOfBtArcSljXTO
 CcIr90TJdE36IXdzWwbKAhARGd5ZAQ1/MQXwwKnqpJzq3somMEASJ9fv2SUm/ZXNZe/H
 02KqqGAMGpsd6sYHhxFsJk1+l5HgFzYc1kTFm/x7I2xLU8LVAGQFo/eZKximfXq+RR4+
 W27g==
X-Gm-Message-State: AAQBX9cqhX9fOU/SsLK2ZSMNvaYWGVoMhASblea/88GsQpqkFMnxk3QD
 JQoEFtXsOT/7sP7mJUYlXeR+nZ4riovWHwG9v/Pf/zUe5xOenMaFRkj1seU/9ZHQLfVwVzGciEc
 lNFcjhOkCvsUos3A=
X-Received: by 2002:adf:f391:0:b0:2cf:ee25:18ce with SMTP id
 m17-20020adff391000000b002cfee2518cemr584810wro.27.1679508826734; 
 Wed, 22 Mar 2023 11:13:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350aSZCpnsX2BYMti4f7zvZFRyubj/z2w6q4mMKUoo6m6xZNrBw4TdG8EQBcIWViAg+xEjXklQw==
X-Received: by 2002:adf:f391:0:b0:2cf:ee25:18ce with SMTP id
 m17-20020adff391000000b002cfee2518cemr584797wro.27.1679508826456; 
 Wed, 22 Mar 2023 11:13:46 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a5d4b07000000b002c56af32e8csm14274772wrq.35.2023.03.22.11.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 11:13:45 -0700 (PDT)
Date: Wed, 22 Mar 2023 18:13:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: s390 migration crash
Message-ID: <ZBtFV7NEGJ6DHz0a@work-vm>
References: <ZBoShWArKDPpX/D7@work-vm> <ZBpJdAbqmyqMNh4D@x1n>
 <ZBsLEjpb/0pdrDZG@work-vm> <ZBsYnMT2j6uMDQUd@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBsYnMT2j6uMDQUd@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Mar 22, 2023 at 02:05:06PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > On Tue, Mar 21, 2023 at 08:24:37PM +0000, Dr. David Alan Gilbert wrote:
> > > > Hi Peter's,
> > > >   Peter M pointed me to a seg in a migration test in CI; I can reproduce
> > > > it:
> > > >   * On an s390 host
> > > 
> > > How easy to reproduce?
> > 
> > Pretty much every time when run as:
> > make check -j 4
> > 
> > > >   * only as part of a make check - running migration-test by itself
> > > > doesn't trigger for me.
> > > >   * It looks like it's postcopy preempt
> > > > 
> > > > (gdb) bt full
> > > > #0  iov_size (iov=iov@entry=0x2aa00e60670, iov_cnt=<optimized out>) at ../util/iov.c:88
> > > >         len = 13517923312037845750
> > > >         i = 17305
> > > > #1  0x000002aa004d068c in qemu_fflush (f=0x2aa00e58630) at ../migration/qemu-file.c:307
> > > >         local_error = 0x0
> > > > #2  0x000002aa004d0e04 in qemu_fflush (f=<optimized out>) at ../migration/qemu-file.c:297
> > > > #3  0x000002aa00613962 in postcopy_preempt_shutdown_file (s=s@entry=0x2aa00d1b4e0) at ../migration/ram.c:4657
> > > > #4  0x000002aa004e12b4 in migration_completion (s=0x2aa00d1b4e0) at ../migration/migration.c:3469
> > > >         ret = <optimized out>
> > > >         current_active_state = 5
> > > >         must_precopy = 0
> > > >         can_postcopy = 0
> > > >         in_postcopy = true
> > > >         pending_size = 0
> > > >         __func__ = "migration_iteration_run"
> > > >         iter_state = <optimized out>
> > > >         s = 0x2aa00d1b4e0
> > > >         thread = <optimized out>
> > > >         setup_start = <optimized out>
> > > >         thr_error = <optimized out>
> > > >         urgent = <optimized out>
> > > > #5  migration_iteration_run (s=0x2aa00d1b4e0) at ../migration/migration.c:3882
> > > >         must_precopy = 0
> > > >         can_postcopy = 0
> > > >         in_postcopy = true
> > > >         pending_size = 0
> > > >         __func__ = "migration_iteration_run"
> > > >         iter_state = <optimized out>
> > > >         s = 0x2aa00d1b4e0
> > > >         thread = <optimized out>
> > > >         setup_start = <optimized out>
> > > >         thr_error = <optimized out>
> > > >         urgent = <optimized out>
> > > > #6  migration_thread (opaque=opaque@entry=0x2aa00d1b4e0) at ../migration/migration.c:4124
> > > >         iter_state = <optimized out>
> > > >         s = 0x2aa00d1b4e0
> > > > --Type <RET> for more, q to quit, c to continue without paging--
> > > >         thread = <optimized out>
> > > >         setup_start = <optimized out>
> > > >         thr_error = <optimized out>
> > > >         urgent = <optimized out>
> > > > #7  0x000002aa00819b8c in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> > > >         __cancel_buf = 
> > > >             {__cancel_jmp_buf = {{__cancel_jmp_buf = {{__gregs = {4396782422080, 4393751543808, 4397299389454, 4396844235904, 2929182727824, 2929182933488, 4396843986792, 4397299389455, 33679382915066768, 33678512846981306}, __fpregs = {4396774031360, 8392704, 2929182933488, 0, 4396782422272, 2929172491858, 4396774031360, 1}}}, __mask_was_saved = 0}}, __pad = {0x3ffb4a77a60, 0x0, 0x0, 0x0}}
> > > >         __cancel_routine = 0x2aa00819bf0 <qemu_thread_atexit_notify>
> > > >         __not_first_call = <optimized out>
> > > >         start_routine = 0x2aa004e08f0 <migration_thread>
> > > >         arg = 0x2aa00d1b4e0
> > > >         r = <optimized out>
> > > > #8  0x000003ffb7b1e2e6 in start_thread () at /lib64/libc.so.6
> > > > #9  0x000003ffb7aafdbe in thread_start () at /lib64/libc.so.6
> > > > 
> > > > It looks like it's in the preempt test:
> > > > 
> > > > (gdb) where
> > > > #0  0x000003ffb17a0126 in __pthread_kill_implementation () from /lib64/libc.so.6
> > > > #1  0x000003ffb1750890 in raise () from /lib64/libc.so.6
> > > > #2  0x000003ffb172a340 in abort () from /lib64/libc.so.6
> > > > #3  0x000002aa0041c130 in qtest_check_status (s=<optimized out>) at ../tests/qtest/libqtest.c:194
> > > > #4  0x000003ffb1a3b5de in g_hook_list_invoke () from /lib64/libglib-2.0.so.0
> > > > #5  <signal handler called>
> > > > #6  0x000003ffb17a0126 in __pthread_kill_implementation () from /lib64/libc.so.6
> > > > #7  0x000003ffb1750890 in raise () from /lib64/libc.so.6
> > > > #8  0x000003ffb172a340 in abort () from /lib64/libc.so.6
> > > > #9  0x000002aa00420318 in qmp_fd_receive (fd=<optimized out>) at ../tests/qtest/libqmp.c:80
> > > > #10 0x000002aa0041d5ee in qtest_qmp_receive_dict (s=0x2aa01eb2700) at ../tests/qtest/libqtest.c:713
> > > > #11 qtest_qmp_receive (s=0x2aa01eb2700) at ../tests/qtest/libqtest.c:701
> > > > #12 qtest_vqmp (s=s@entry=0x2aa01eb2700, fmt=fmt@entry=0x2aa00487100 "{ 'execute': 'query-migrate' }", ap=ap@entry=0x3ffc247cc68)
> > > >     at ../tests/qtest/libqtest.c:765
> > > > #13 0x000002aa00413f1e in wait_command (who=who@entry=0x2aa01eb2700, command=command@entry=0x2aa00487100 "{ 'execute': 'query-migrate' }")
> > > >     at ../tests/qtest/migration-helpers.c:73
> > > > #14 0x000002aa00414078 in migrate_query (who=who@entry=0x2aa01eb2700) at ../tests/qtest/migration-helpers.c:139
> > > > #15 migrate_query_status (who=who@entry=0x2aa01eb2700) at ../tests/qtest/migration-helpers.c:161
> > > > #16 0x000002aa00414480 in check_migration_status (ungoals=0x0, goal=0x2aa00495c7e "completed", who=0x2aa01eb2700) at ../tests/qtest/migration-helpers.c:177
> > > > #17 wait_for_migration_status (who=0x2aa01eb2700, goal=<optimized out>, ungoals=0x0) at ../tests/qtest/migration-helpers.c:202
> > > > #18 0x000002aa0041300e in migrate_postcopy_complete (from=from@entry=0x2aa01eb2700, to=to@entry=0x2aa01eb3000, args=args@entry=0x3ffc247cf48)
> > > >     at ../tests/qtest/migration-test.c:1137
> > > > #19 0x000002aa004131a4 in test_postcopy_common (args=0x3ffc247cf48) at ../tests/qtest/migration-test.c:1162
> > > > #20 test_postcopy_preempt () at ../tests/qtest/migration-test.c:1178
> > > > 
> > > > Looking at the iov and file it's garbage; so it makes me think this is
> > > > something like a flush on a closed file.
> > > 
> > > I didn't figure out how that could be closed, but I think there's indeed a
> > > possible race that the qemufile can be accessed by both the return path
> > > thread and the migration thread concurrently, while qemufile is not thread
> > > safe on that.
> > > 
> > > What postcopy_preempt_shutdown_file() does was: the src uses this EOS to
> > > kick the dest QEMU preempt thread out of the migration and shut it off.
> > > After some thought I think this is unnecessary complexity, since postcopy
> > > should end at the point where dest received all the data, then it sends a
> > > SHUT to src.  So potentially it's not good to have dest relying on anything
> > > from src to shutdown anything (the preempt thread here) because it's the
> > > dest qemu that makes the final decision to finish.  Ideally the preempt
> > > thread on dest should be able to shutdown itself.
> > > 
> > > The trick here is preempt thread will block at read() (aka, recvmsg()) at
> > > the channel at that time and the only way to kick it out from that is a
> > > shutdown() on dest.  I attached a patch did it.  I'm not 100% sure whether
> > > it'll already resolve our problem but worth trying.  This also made me
> > > notice we forgot to enable SHUTDOWN feature on tls server when I was
> > > running the patch 1 with qtest, so two patches needed.
> > 
> > Well, it seems to fix it:
> > 
> > Tested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > Will this break interaction with an old qemu that's still waiting for
> > the EOS?
> 
> Right.. when someone migrates from a 8.0+ QEMU (assuming this can land in
> this release) to 7.2 QEMU with postcopy+preempt enabled.

So why not carry on sending the EOS?

> I still see preempt full support only in 8.0; we did major rework in 8.0 to
> shift to the return path.  So maybe it's worth the risk?  I can also add a
> flag for this but it may add maintainance burden in general OTOH.

If you're saying the pre 8.0 never worked then I guess that's fine;
it's tricky from say a libvirt or higher level tool to know what it can
use.

Dave

> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


