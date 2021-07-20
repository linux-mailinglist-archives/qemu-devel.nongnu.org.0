Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608473CF7F6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 12:34:32 +0200 (CEST)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5n54-0000AD-Nt
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 06:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m5n3t-0007tA-LJ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 06:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m5n3n-0008RS-8L
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 06:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626777188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZejzrgerdSWvxiyfFaDVI5jBMQmzwBwnZgw75mCJyUM=;
 b=DJF+3aamS+tPuxxW1ZmXm4rOpMDaA99uKFD1cSRZddbimboCDwgqjaWFCRfl0/Tcq/G05v
 pcFnpa3PTt3D5WjRQNjZ/yl+guFr4fGqznWxKCBX/gmG1ZxtkD5BiHcufzIiex2aCDLs7J
 3t6eyjffNsimLYNUtu0UBUYFTI5KqIU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-0__TTbRmMZaDWIqw1bCm3Q-1; Tue, 20 Jul 2021 06:33:07 -0400
X-MC-Unique: 0__TTbRmMZaDWIqw1bCm3Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 h11-20020adffa8b0000b029013a357d7bdcso10144402wrr.18
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 03:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZejzrgerdSWvxiyfFaDVI5jBMQmzwBwnZgw75mCJyUM=;
 b=jtClUQGFpxTGzm3or+JBDFF0pguAJbun/1rA+LDNscd7pMBE3/DPAgo9C3WsUGIFOV
 bHUFf6Oic5v2uLmJfwQYn7WTZa163STSmEmyoKPHbKHMEb/e0y/jW3kYap8WUfjygYc0
 xhcFm+1DFTn7yA31svsTsb6qIaDzm4utiYzcg27khT97UlHrm9TBvvrINsfWz9UnMl9b
 gHXpMUAddJPM6sAY4BqmMQ/rbvpcFAn9RqrqbCDxHgq5OMiZgoHg9YNBpBXPmHf+j7iE
 YLXChO0zyWxmh99GAcho0Av3H3x5FtEvzjeQpMkdp7aIBO9ngBSxmDW8GKu3DajP6vOi
 BVQQ==
X-Gm-Message-State: AOAM533llC8IchCFqq8C40kGOkSYO9ays3jmNB8hMfv4bRcJzs4M4FBo
 rSUHFe2skaKrcxJ9M4hlKPua0u/EmouaFE1Q84KovGRQTkB6iCFgxmUSHgZGy1VVHRlC2R8Ff66
 JB4GGBK8IjbfhDW0=
X-Received: by 2002:adf:8b1d:: with SMTP id n29mr35624377wra.291.1626777186736; 
 Tue, 20 Jul 2021 03:33:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx06oNGpR8lbPdvOBhUBnIPCS1spIEOCTqn5n12oileN7jA9wQ1SaCnwVsb+OXXAlsbLZ6veA==
X-Received: by 2002:adf:8b1d:: with SMTP id n29mr35624342wra.291.1626777186446; 
 Tue, 20 Jul 2021 03:33:06 -0700 (PDT)
Received: from work-vm (82-132-245-123.dab.02.net. [82.132.245.123])
 by smtp.gmail.com with ESMTPSA id w18sm1047690wrs.44.2021.07.20.03.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 03:33:03 -0700 (PDT)
Date: Tue, 20 Jul 2021 11:33:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, peterx@redhat.com
Subject: Re: random crash in migration-test, i386 guest, x86-64 host:
Message-ID: <YPamXAHwan/PPXLf@work-vm>
References: <CAFEAcA_byx5rCR7Y+yJrZ=K8oifdYEAza041W4yyA+wJkDpn6w@mail.gmail.com>
 <CAFEAcA-VYiFo4aiuOSnenObaLt5Y87dUdO1=amUm+j=2-EnSag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-VYiFo4aiuOSnenObaLt5Y87dUdO1=amUm+j=2-EnSag@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 19 Jul 2021 at 13:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Random crash in migration-tests:
> >
> > MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> > QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qem
> > u-for-merges/tests/dbus-vmstate-daemon.sh
> > QTEST_QEMU_BINARY=./qemu-system-i386
> > QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-
> > storage-daemon tests/qtest/migration-test --tap -k
> > PASS 1 qtest-i386/migration-test /i386/migration/bad_dest
> > PASS 2 qtest-i386/migration-test /i386/migration/fd_proto
> > PASS 3 qtest-i386/migration-test /i386/migration/validate_uuid
> > PASS 4 qtest-i386/migration-test /i386/migration/validate_uuid_error
> > PASS 5 qtest-i386/migration-test /i386/migration/validate_uuid_src_not_set
> > PASS 6 qtest-i386/migration-test /i386/migration/validate_uuid_dst_not_set
> > PASS 7 qtest-i386/migration-test /i386/migration/auto_converge
> > PASS 8 qtest-i386/migration-test /i386/migration/postcopy/unix
> > Broken pipe
> > ../../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from
> > signal 6 (Aborted) (core dumped)
> > ERROR qtest-i386/migration-test - too few tests run (expected 15, got 8)
> > Makefile.mtest:280: recipe for target 'run-test-33' failed
> > make: *** [run-test-33] Error 1
> 
> And again, different guest architecture, still x86-64 host:
> 
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qem
> u-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-aarch64
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qe
> mu-storage-daemon tests/qtest/migration-test --tap -k
> PASS 1 qtest-aarch64/migration-test /aarch64/migration/bad_dest
> PASS 2 qtest-aarch64/migration-test /aarch64/migration/fd_proto
> PASS 3 qtest-aarch64/migration-test /aarch64/migration/validate_uuid
> PASS 4 qtest-aarch64/migration-test /aarch64/migration/validate_uuid_error
> PASS 5 qtest-aarch64/migration-test /aarch64/migration/validate_uuid_src_not_set
> PASS 6 qtest-aarch64/migration-test /aarch64/migration/validate_uuid_dst_not_set
> PASS 7 qtest-aarch64/migration-test /aarch64/migration/auto_converge
> PASS 8 qtest-aarch64/migration-test /aarch64/migration/postcopy/unix
> Broken pipe
> ../../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from
> signal 6 (Aborted) (core dumped)
> ERROR qtest-aarch64/migration-test - too few tests run (expected 15, got 8)
> Makefile.mtest:264: recipe for target 'run-test-31' failed
> 
> -- PMM

It looks like we've got another yank_unregister problem; Peter's patches
in the last pull did try and fix some, perhaps it just moved around:


/aarch64/migration/postcopy/recovery: Broken pipe
../qemu/tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
Aborted (core dumped)
 
Tue 2021-07-20 11:08:38 BST  1186997     0     0   6 present   /home/dgilbert/try/tests/qtest/migration-test
Tue 2021-07-20 11:08:38 BST  1187097     0     0   6 present   /home/dgilbert/try/qemu-system-aarch64
 
#4  0x000055a56d80593d in yank_unregister_instance (instance=instance@entry=0x7ffe5e32a9b0) at ../qemu/util/yank.c:107
#5  0x000055a56d0b4cdc in migrate_fd_cleanup (s=s@entry=0x55a570556400) at ../qemu/migration/migration.c:1830
#6  0x000055a56d0b4e09 in migrate_fd_cleanup_bh (opaque=0x55a570556400) at ../qemu/migration/migration.c:1846
#7  0x000055a56d7da9a6 in aio_bh_poll (ctx=ctx@entry=0x55a5703098d0) at ../qemu/util/async.c:169
#8  0x000055a56d7e09ce in aio_dispatch (ctx=0x55a5703098d0) at ../qemu/util/aio-posix.c:381
#9  0x000055a56d7da87e in aio_ctx_dispatch (source=<optimized out>, callback=<optimized out>, user_data=<optimized out>) at ../qemu/util/async.c:311
#10 0x00007f870018067d in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
#11 0x000055a56d7ec0a8 in glib_pollfds_poll () at ../qemu/util/main-loop.c:232
#12 0x000055a56d7ec0a8 in os_host_main_loop_wait (timeout=<optimized out>) at ../qemu/util/main-loop.c:255
#13 0x000055a56d7ec0a8 in main_loop_wait (nonblocking=nonblocking@entry=0) at ../qemu/util/main-loop.c:531
#14 0x000055a56d5b0411 in qemu_main_loop () at ../qemu/softmmu/runstate.c:726
#15 0x000055a56d02f05e in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../qemu/softmmu/main.c:50
 
 
---
#5  0x00007fa419a1f7ff in raise () from /lib64/libc.so.6
#6  0x00007fa419a09c35 in abort () from /lib64/libc.so.6
#7  0x000055c24aa8c3c9 in qmp_fd_receive (fd=4) at ../qemu/tests/qtest/libqtest.c:618
#8  0x000055c24aa8c408 in qtest_qmp_receive_dict (s=s@entry=0x55c24c692600) at ../qemu/tests/qtest/libqtest.c:646
#9  0x000055c24aa8c43e in qtest_qmp_receive (s=s@entry=0x55c24c692600) at ../qemu/tests/qtest/libqtest.c:634
#10 0x000055c24aa8cc32 in qtest_vqmp (s=s@entry=0x55c24c692600, fmt=<optimized out>, ap=ap@entry=0x7ffd15fd8130) at ../qemu/tests/qtest/libqtest.c:747
#11 0x000055c24aa8ac62 in wait_command (who=0x55c24c692600, who@entry=0x55c24c66e740,
    command=command@entry=0x55c24aabc508 "{ 'execute': 'query-migrate' }") at ../qemu/tests/qtest/migration-helpers.c:63
#12 0x000055c24aa8ad73 in migrate_query (who=who@entry=0x55c24c66e740) at ../qemu/tests/qtest/migration-helpers.c:116
#13 migrate_query_status (who=who@entry=0x55c24c692600) at ../qemu/tests/qtest/migration-helpers.c:116
#14 0x000055c24aa8afd2 in check_migration_status (ungoals=0x0, goal=0x55c24aac54ca "completed", who=0x55c24c692600)
    at ../qemu/tests/qtest/migration-helpers.c:156
#15 wait_for_migration_status (who=0x55c24c692600, goal=<optimized out>, ungoals=0x0) at ../qemu/tests/qtest/migration-helpers.c:156
#16 0x000055c24aa8953f in migrate_postcopy_complete (from=0x55c24c692600, to=0x55c24c6955c0) at ../qemu/tests/qtest/migration-test.c:697
 
695     static void migrate_postcopy_complete(QTestState *from, QTestState *to)
696     {
697         wait_for_migration_complete(from);

#17 0x000055c24aa897e4 in test_postcopy_recovery () at ../qemu/tests/qtest/migration-test.c:780
780         migrate_postcopy_complete(from, to);
781     }
 
#18 0x00007fa41a3c1a6a in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#19 0x00007fa41a3c1924 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#20 0x00007fa41a3c1924 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#21 0x00007fa41a3c1924 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#22 0x00007fa41a3c1d22 in g_test_run_suite () from /lib64/libglib-2.0.so.0
#23 0x00007fa41a3c1d45 in g_test_run () from /lib64/libglib-2.0.so.0
#24 0x000055c24aa87843 in main (argc=<optimized out>, argv=<optimized out>) at ../qemu/tests/qtest/migration-test.c:1494
 

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


