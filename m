Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99536C54C1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 20:18:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf3wq-0004se-BR; Wed, 22 Mar 2023 15:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pf3wn-0004sQ-E4
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 15:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pf3wk-0005BV-8m
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 15:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679512587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qMFwL7TGqWc/veRLxSa3nJdvZC7C72widi9T+8INMC8=;
 b=JEfAeP5otCEm3aRp0t3UPQQ595llkmDyur8XDY1dsf5egJw9CasYsdlHFKKNFkXVX2mf3Z
 GX1lM7ukUUkVFAq835d5Mnip5OzCjB5rXBaelYVsycrqR1qsIl2+m3R04Ws2FAzUt8fcl0
 iB7BbZZ27gORSxO7YBZskG9/1ZE7Re8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-LtihlBPrNGWE1erNMGa6mQ-1; Wed, 22 Mar 2023 15:16:26 -0400
X-MC-Unique: LtihlBPrNGWE1erNMGa6mQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 a10-20020a0ccdca000000b005d70160fbb0so1657363qvn.21
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 12:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679512586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qMFwL7TGqWc/veRLxSa3nJdvZC7C72widi9T+8INMC8=;
 b=wH8yy3yaBhjzBt1NygXePqdzrQsoL7Y6xPb+xW9ZuYaGxIRemZOiA5lu+d5PCMIl0o
 jXBcq216fkYExCnRjoPBoAIrZuf9tXUAQJQExEM3FhnRDuoEToZkX8qOfN0uiixL3JHN
 9n25OkPWj+B20nvSerzFZi7SSUqpHemOBuhwbaRBuPTmZ4+sONd3PnXalONPAOPgNu3C
 gb+bh7dAGK9pBO91Og+jjANeYs0yNz9IfwazgNLBQaDgjxxREldTByXgahBFTwrdP1iI
 1mxukEmFctJ7CGKST49HosUh87+8GZnwgJSpR6mvUDozzyXL5ix0Oe22tv/7ece6U/Ib
 cHNg==
X-Gm-Message-State: AO0yUKXENNU/OB4sKUR8qO+Oytlllebk9DgflVePOhb1YupTUMvneMBC
 VZi9ila76dzyX9wQnx1/ALVYkSGtsGdrxyoZC0nUXst7uQnH2IlPeucah9A06lBCYUAbqxyQrbA
 CF7HfOuWcJ5MsBC8=
X-Received: by 2002:a05:622a:4cd:b0:3e2:4280:bc58 with SMTP id
 q13-20020a05622a04cd00b003e24280bc58mr11863815qtx.3.1679512585608; 
 Wed, 22 Mar 2023 12:16:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set+90Uxy/r0lzAJVcncf9dr5t33zkn5YuKJVuYwq5YPnHT8Qs6c6nohITzYM+3sQza3HratZFg==
X-Received: by 2002:a05:622a:4cd:b0:3e2:4280:bc58 with SMTP id
 q13-20020a05622a04cd00b003e24280bc58mr11863789qtx.3.1679512585218; 
 Wed, 22 Mar 2023 12:16:25 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 b126-20020ae9eb84000000b007468b183a65sm6167014qkg.30.2023.03.22.12.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 12:16:24 -0700 (PDT)
Date: Wed, 22 Mar 2023 15:16:23 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: s390 migration crash
Message-ID: <ZBtUBywZHTfNduFP@x1n>
References: <ZBoShWArKDPpX/D7@work-vm> <ZBpJdAbqmyqMNh4D@x1n>
 <ZBsLEjpb/0pdrDZG@work-vm> <ZBsYnMT2j6uMDQUd@x1n>
 <ZBtFV7NEGJ6DHz0a@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZBtFV7NEGJ6DHz0a@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Mar 22, 2023 at 06:13:43PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Wed, Mar 22, 2023 at 02:05:06PM +0000, Dr. David Alan Gilbert wrote:
> > > * Peter Xu (peterx@redhat.com) wrote:
> > > > On Tue, Mar 21, 2023 at 08:24:37PM +0000, Dr. David Alan Gilbert wrote:
> > > > > Hi Peter's,
> > > > >   Peter M pointed me to a seg in a migration test in CI; I can reproduce
> > > > > it:
> > > > >   * On an s390 host
> > > > 
> > > > How easy to reproduce?
> > > 
> > > Pretty much every time when run as:
> > > make check -j 4
> > > 
> > > > >   * only as part of a make check - running migration-test by itself
> > > > > doesn't trigger for me.
> > > > >   * It looks like it's postcopy preempt
> > > > > 
> > > > > (gdb) bt full
> > > > > #0  iov_size (iov=iov@entry=0x2aa00e60670, iov_cnt=<optimized out>) at ../util/iov.c:88
> > > > >         len = 13517923312037845750
> > > > >         i = 17305
> > > > > #1  0x000002aa004d068c in qemu_fflush (f=0x2aa00e58630) at ../migration/qemu-file.c:307
> > > > >         local_error = 0x0
> > > > > #2  0x000002aa004d0e04 in qemu_fflush (f=<optimized out>) at ../migration/qemu-file.c:297
> > > > > #3  0x000002aa00613962 in postcopy_preempt_shutdown_file (s=s@entry=0x2aa00d1b4e0) at ../migration/ram.c:4657
> > > > > #4  0x000002aa004e12b4 in migration_completion (s=0x2aa00d1b4e0) at ../migration/migration.c:3469
> > > > >         ret = <optimized out>
> > > > >         current_active_state = 5
> > > > >         must_precopy = 0
> > > > >         can_postcopy = 0
> > > > >         in_postcopy = true
> > > > >         pending_size = 0
> > > > >         __func__ = "migration_iteration_run"
> > > > >         iter_state = <optimized out>
> > > > >         s = 0x2aa00d1b4e0
> > > > >         thread = <optimized out>
> > > > >         setup_start = <optimized out>
> > > > >         thr_error = <optimized out>
> > > > >         urgent = <optimized out>
> > > > > #5  migration_iteration_run (s=0x2aa00d1b4e0) at ../migration/migration.c:3882
> > > > >         must_precopy = 0
> > > > >         can_postcopy = 0
> > > > >         in_postcopy = true
> > > > >         pending_size = 0
> > > > >         __func__ = "migration_iteration_run"
> > > > >         iter_state = <optimized out>
> > > > >         s = 0x2aa00d1b4e0
> > > > >         thread = <optimized out>
> > > > >         setup_start = <optimized out>
> > > > >         thr_error = <optimized out>
> > > > >         urgent = <optimized out>
> > > > > #6  migration_thread (opaque=opaque@entry=0x2aa00d1b4e0) at ../migration/migration.c:4124
> > > > >         iter_state = <optimized out>
> > > > >         s = 0x2aa00d1b4e0
> > > > > --Type <RET> for more, q to quit, c to continue without paging--
> > > > >         thread = <optimized out>
> > > > >         setup_start = <optimized out>
> > > > >         thr_error = <optimized out>
> > > > >         urgent = <optimized out>
> > > > > #7  0x000002aa00819b8c in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> > > > >         __cancel_buf = 
> > > > >             {__cancel_jmp_buf = {{__cancel_jmp_buf = {{__gregs = {4396782422080, 4393751543808, 4397299389454, 4396844235904, 2929182727824, 2929182933488, 4396843986792, 4397299389455, 33679382915066768, 33678512846981306}, __fpregs = {4396774031360, 8392704, 2929182933488, 0, 4396782422272, 2929172491858, 4396774031360, 1}}}, __mask_was_saved = 0}}, __pad = {0x3ffb4a77a60, 0x0, 0x0, 0x0}}
> > > > >         __cancel_routine = 0x2aa00819bf0 <qemu_thread_atexit_notify>
> > > > >         __not_first_call = <optimized out>
> > > > >         start_routine = 0x2aa004e08f0 <migration_thread>
> > > > >         arg = 0x2aa00d1b4e0
> > > > >         r = <optimized out>
> > > > > #8  0x000003ffb7b1e2e6 in start_thread () at /lib64/libc.so.6
> > > > > #9  0x000003ffb7aafdbe in thread_start () at /lib64/libc.so.6
> > > > > 
> > > > > It looks like it's in the preempt test:
> > > > > 
> > > > > (gdb) where
> > > > > #0  0x000003ffb17a0126 in __pthread_kill_implementation () from /lib64/libc.so.6
> > > > > #1  0x000003ffb1750890 in raise () from /lib64/libc.so.6
> > > > > #2  0x000003ffb172a340 in abort () from /lib64/libc.so.6
> > > > > #3  0x000002aa0041c130 in qtest_check_status (s=<optimized out>) at ../tests/qtest/libqtest.c:194
> > > > > #4  0x000003ffb1a3b5de in g_hook_list_invoke () from /lib64/libglib-2.0.so.0
> > > > > #5  <signal handler called>
> > > > > #6  0x000003ffb17a0126 in __pthread_kill_implementation () from /lib64/libc.so.6
> > > > > #7  0x000003ffb1750890 in raise () from /lib64/libc.so.6
> > > > > #8  0x000003ffb172a340 in abort () from /lib64/libc.so.6
> > > > > #9  0x000002aa00420318 in qmp_fd_receive (fd=<optimized out>) at ../tests/qtest/libqmp.c:80
> > > > > #10 0x000002aa0041d5ee in qtest_qmp_receive_dict (s=0x2aa01eb2700) at ../tests/qtest/libqtest.c:713
> > > > > #11 qtest_qmp_receive (s=0x2aa01eb2700) at ../tests/qtest/libqtest.c:701
> > > > > #12 qtest_vqmp (s=s@entry=0x2aa01eb2700, fmt=fmt@entry=0x2aa00487100 "{ 'execute': 'query-migrate' }", ap=ap@entry=0x3ffc247cc68)
> > > > >     at ../tests/qtest/libqtest.c:765
> > > > > #13 0x000002aa00413f1e in wait_command (who=who@entry=0x2aa01eb2700, command=command@entry=0x2aa00487100 "{ 'execute': 'query-migrate' }")
> > > > >     at ../tests/qtest/migration-helpers.c:73
> > > > > #14 0x000002aa00414078 in migrate_query (who=who@entry=0x2aa01eb2700) at ../tests/qtest/migration-helpers.c:139
> > > > > #15 migrate_query_status (who=who@entry=0x2aa01eb2700) at ../tests/qtest/migration-helpers.c:161
> > > > > #16 0x000002aa00414480 in check_migration_status (ungoals=0x0, goal=0x2aa00495c7e "completed", who=0x2aa01eb2700) at ../tests/qtest/migration-helpers.c:177
> > > > > #17 wait_for_migration_status (who=0x2aa01eb2700, goal=<optimized out>, ungoals=0x0) at ../tests/qtest/migration-helpers.c:202
> > > > > #18 0x000002aa0041300e in migrate_postcopy_complete (from=from@entry=0x2aa01eb2700, to=to@entry=0x2aa01eb3000, args=args@entry=0x3ffc247cf48)
> > > > >     at ../tests/qtest/migration-test.c:1137
> > > > > #19 0x000002aa004131a4 in test_postcopy_common (args=0x3ffc247cf48) at ../tests/qtest/migration-test.c:1162
> > > > > #20 test_postcopy_preempt () at ../tests/qtest/migration-test.c:1178
> > > > > 
> > > > > Looking at the iov and file it's garbage; so it makes me think this is
> > > > > something like a flush on a closed file.
> > > > 
> > > > I didn't figure out how that could be closed, but I think there's indeed a
> > > > possible race that the qemufile can be accessed by both the return path
> > > > thread and the migration thread concurrently, while qemufile is not thread
> > > > safe on that.
> > > > 
> > > > What postcopy_preempt_shutdown_file() does was: the src uses this EOS to
> > > > kick the dest QEMU preempt thread out of the migration and shut it off.
> > > > After some thought I think this is unnecessary complexity, since postcopy
> > > > should end at the point where dest received all the data, then it sends a
> > > > SHUT to src.  So potentially it's not good to have dest relying on anything
> > > > from src to shutdown anything (the preempt thread here) because it's the
> > > > dest qemu that makes the final decision to finish.  Ideally the preempt
> > > > thread on dest should be able to shutdown itself.
> > > > 
> > > > The trick here is preempt thread will block at read() (aka, recvmsg()) at
> > > > the channel at that time and the only way to kick it out from that is a
> > > > shutdown() on dest.  I attached a patch did it.  I'm not 100% sure whether
> > > > it'll already resolve our problem but worth trying.  This also made me
> > > > notice we forgot to enable SHUTDOWN feature on tls server when I was
> > > > running the patch 1 with qtest, so two patches needed.
> > > 
> > > Well, it seems to fix it:
> > > 
> > > Tested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > 
> > > Will this break interaction with an old qemu that's still waiting for
> > > the EOS?
> > 
> > Right.. when someone migrates from a 8.0+ QEMU (assuming this can land in
> > this release) to 7.2 QEMU with postcopy+preempt enabled.
> 
> So why not carry on sending the EOS?

Because it's still racy to send it so potentially such a migration is buggy
and can crash?  Or maybe you meant we could serialize the sends (e.g. with
some locks) so we keep the send but avoid the crash (hopefully!).  Then the
lock will only be used on old qemu binaries.

> 
> > I still see preempt full support only in 8.0; we did major rework in 8.0 to
> > shift to the return path.  So maybe it's worth the risk?  I can also add a
> > flag for this but it may add maintainance burden in general OTOH.
> 
> If you're saying the pre 8.0 never worked then I guess that's fine;

I think pre-8.0 works too.  The rework shouldn't have changed that fact or
the stream protocol.

> it's tricky from say a libvirt or higher level tool to know what it can
> use.

Libvirt hasn't yet support preempt mode, but yeah it'll be a problem too in
the futhre.

So maybe I introduce a flag, send this EOS conditionally, but ignoring the
possibility of crash?

-- 
Peter Xu


