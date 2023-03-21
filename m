Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1176C3BBD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 21:25:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peiXK-0000cr-7l; Tue, 21 Mar 2023 16:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1peiXI-0000cU-5h
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:24:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1peiXG-0006Oz-5U
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679430283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=g2kbcRG/1aYNVAp9q4sdsYpOCa4KtQS9lIifXgmZ9/w=;
 b=Zqa5z621HVCTbOiMcd11koqvZI7kmLXjv86fqrU86X4RSlSbMYAC5bd9ZR9zGfPVEm3lNh
 JG5nl3dCDOpAPbU6F/FfNGlMSE28GXcZ6eDP0XHQn+UtPgD+8FcP5f82dYDkkcqS7straZ
 LkPNnnI2db9j7EZoKKa5krYNDEn4ouc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-Ohgbtc32MWm4LTc1feTtWA-1; Tue, 21 Mar 2023 16:24:41 -0400
X-MC-Unique: Ohgbtc32MWm4LTc1feTtWA-1
Received: by mail-wm1-f71.google.com with SMTP id
 u6-20020a05600c19c600b003ed7cb98a8dso5330783wmq.9
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 13:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679430280;
 h=user-agent:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g2kbcRG/1aYNVAp9q4sdsYpOCa4KtQS9lIifXgmZ9/w=;
 b=YWWhyUh0oHIjDv1myomq6reQKeqbwREiLoGcH7wY34/6TL1ZepqIDoKStMMHUElNbq
 ThnekGa6bMyBUhlr9cmvBwu06FQDK79tsOcCtnpQeLKxTcxRWIgYei8Ce1v4JF20RcDs
 WpJoOR0wUqw7ajEfYl/oqeg2NGHU3EMs83QOqUI5tRDpx4ux3V1UT/GeSZQegumNIcZS
 /rwEs6DACkJ5uR1SZouztR+XqNnYREvrjAVB2ELfTn00lRn6zNc3WgqxiE3LaKzF5gH/
 +RCkGodM5GsuDgJf6XFvVoVf2uvPxm34BPVHyH08Gt5CvMrDbgg7VXwS8dam8rRoecNT
 6RtQ==
X-Gm-Message-State: AO0yUKW1H2X+C9m5cXm5B3IZUsekFAmASXmDfx5u2aadog0eIQMRH2yX
 tWIq+Eob2lpDWmBQqnXeIKfbg8nQiguHAKsjl26Ip+IOnJ6USpsIlOusgzHsSOj12S6ETCqo+gn
 Oh7HAoWqdr8XGIsU=
X-Received: by 2002:a5d:4211:0:b0:2ce:a777:90c4 with SMTP id
 n17-20020a5d4211000000b002cea77790c4mr3434663wrq.31.1679430280262; 
 Tue, 21 Mar 2023 13:24:40 -0700 (PDT)
X-Google-Smtp-Source: AK7set/2nvykDdoDQ3h1rpsM5FIs7ySUQV2n0QDgb9fSyDAve1LengsFU/Pn7Q7V/EHrZjpMD6E+0w==
X-Received: by 2002:a5d:4211:0:b0:2ce:a777:90c4 with SMTP id
 n17-20020a5d4211000000b002cea77790c4mr3434647wrq.31.1679430279904; 
 Tue, 21 Mar 2023 13:24:39 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adfe8c5000000b002d748d46565sm5397062wrn.74.2023.03.21.13.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 13:24:39 -0700 (PDT)
Date: Tue, 21 Mar 2023 20:24:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: peterx@redhat.com, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Subject: s390 migration crash
Message-ID: <ZBoShWArKDPpX/D7@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

Hi Peter's,
  Peter M pointed me to a seg in a migration test in CI; I can reproduce
it:
  * On an s390 host
  * only as part of a make check - running migration-test by itself
doesn't trigger for me.
  * It looks like it's postcopy preempt

(gdb) bt full
#0  iov_size (iov=iov@entry=0x2aa00e60670, iov_cnt=<optimized out>) at ../util/iov.c:88
        len = 13517923312037845750
        i = 17305
#1  0x000002aa004d068c in qemu_fflush (f=0x2aa00e58630) at ../migration/qemu-file.c:307
        local_error = 0x0
#2  0x000002aa004d0e04 in qemu_fflush (f=<optimized out>) at ../migration/qemu-file.c:297
#3  0x000002aa00613962 in postcopy_preempt_shutdown_file (s=s@entry=0x2aa00d1b4e0) at ../migration/ram.c:4657
#4  0x000002aa004e12b4 in migration_completion (s=0x2aa00d1b4e0) at ../migration/migration.c:3469
        ret = <optimized out>
        current_active_state = 5
        must_precopy = 0
        can_postcopy = 0
        in_postcopy = true
        pending_size = 0
        __func__ = "migration_iteration_run"
        iter_state = <optimized out>
        s = 0x2aa00d1b4e0
        thread = <optimized out>
        setup_start = <optimized out>
        thr_error = <optimized out>
        urgent = <optimized out>
#5  migration_iteration_run (s=0x2aa00d1b4e0) at ../migration/migration.c:3882
        must_precopy = 0
        can_postcopy = 0
        in_postcopy = true
        pending_size = 0
        __func__ = "migration_iteration_run"
        iter_state = <optimized out>
        s = 0x2aa00d1b4e0
        thread = <optimized out>
        setup_start = <optimized out>
        thr_error = <optimized out>
        urgent = <optimized out>
#6  migration_thread (opaque=opaque@entry=0x2aa00d1b4e0) at ../migration/migration.c:4124
        iter_state = <optimized out>
        s = 0x2aa00d1b4e0
--Type <RET> for more, q to quit, c to continue without paging--
        thread = <optimized out>
        setup_start = <optimized out>
        thr_error = <optimized out>
        urgent = <optimized out>
#7  0x000002aa00819b8c in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
        __cancel_buf = 
            {__cancel_jmp_buf = {{__cancel_jmp_buf = {{__gregs = {4396782422080, 4393751543808, 4397299389454, 4396844235904, 2929182727824, 2929182933488, 4396843986792, 4397299389455, 33679382915066768, 33678512846981306}, __fpregs = {4396774031360, 8392704, 2929182933488, 0, 4396782422272, 2929172491858, 4396774031360, 1}}}, __mask_was_saved = 0}}, __pad = {0x3ffb4a77a60, 0x0, 0x0, 0x0}}
        __cancel_routine = 0x2aa00819bf0 <qemu_thread_atexit_notify>
        __not_first_call = <optimized out>
        start_routine = 0x2aa004e08f0 <migration_thread>
        arg = 0x2aa00d1b4e0
        r = <optimized out>
#8  0x000003ffb7b1e2e6 in start_thread () at /lib64/libc.so.6
#9  0x000003ffb7aafdbe in thread_start () at /lib64/libc.so.6

It looks like it's in the preempt test:

(gdb) where
#0  0x000003ffb17a0126 in __pthread_kill_implementation () from /lib64/libc.so.6
#1  0x000003ffb1750890 in raise () from /lib64/libc.so.6
#2  0x000003ffb172a340 in abort () from /lib64/libc.so.6
#3  0x000002aa0041c130 in qtest_check_status (s=<optimized out>) at ../tests/qtest/libqtest.c:194
#4  0x000003ffb1a3b5de in g_hook_list_invoke () from /lib64/libglib-2.0.so.0
#5  <signal handler called>
#6  0x000003ffb17a0126 in __pthread_kill_implementation () from /lib64/libc.so.6
#7  0x000003ffb1750890 in raise () from /lib64/libc.so.6
#8  0x000003ffb172a340 in abort () from /lib64/libc.so.6
#9  0x000002aa00420318 in qmp_fd_receive (fd=<optimized out>) at ../tests/qtest/libqmp.c:80
#10 0x000002aa0041d5ee in qtest_qmp_receive_dict (s=0x2aa01eb2700) at ../tests/qtest/libqtest.c:713
#11 qtest_qmp_receive (s=0x2aa01eb2700) at ../tests/qtest/libqtest.c:701
#12 qtest_vqmp (s=s@entry=0x2aa01eb2700, fmt=fmt@entry=0x2aa00487100 "{ 'execute': 'query-migrate' }", ap=ap@entry=0x3ffc247cc68)
    at ../tests/qtest/libqtest.c:765
#13 0x000002aa00413f1e in wait_command (who=who@entry=0x2aa01eb2700, command=command@entry=0x2aa00487100 "{ 'execute': 'query-migrate' }")
    at ../tests/qtest/migration-helpers.c:73
#14 0x000002aa00414078 in migrate_query (who=who@entry=0x2aa01eb2700) at ../tests/qtest/migration-helpers.c:139
#15 migrate_query_status (who=who@entry=0x2aa01eb2700) at ../tests/qtest/migration-helpers.c:161
#16 0x000002aa00414480 in check_migration_status (ungoals=0x0, goal=0x2aa00495c7e "completed", who=0x2aa01eb2700) at ../tests/qtest/migration-helpers.c:177
#17 wait_for_migration_status (who=0x2aa01eb2700, goal=<optimized out>, ungoals=0x0) at ../tests/qtest/migration-helpers.c:202
#18 0x000002aa0041300e in migrate_postcopy_complete (from=from@entry=0x2aa01eb2700, to=to@entry=0x2aa01eb3000, args=args@entry=0x3ffc247cf48)
    at ../tests/qtest/migration-test.c:1137
#19 0x000002aa004131a4 in test_postcopy_common (args=0x3ffc247cf48) at ../tests/qtest/migration-test.c:1162
#20 test_postcopy_preempt () at ../tests/qtest/migration-test.c:1178

Looking at the iov and file it's garbage; so it makes me think this is
something like a flush on a closed file.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


