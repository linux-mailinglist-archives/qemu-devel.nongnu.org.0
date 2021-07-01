Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5C3B94DF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 18:48:54 +0200 (CEST)
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyzrx-0007b6-FQ
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 12:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyzqd-0006uT-5H
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyzqZ-0002pA-LF
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625158045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uDVCD+JTQbHWXIlmZPqHqq5qNDm1kE52LkitZ1WAbXM=;
 b=UhL9rtvZmkYxKVDvAVg9wxko851FQhd07zzCw5Z/3utoc1ofq7Zr+KbO6ih21PJWMJPrBz
 7LPdxkmJLdZko4rrZuhL1bXqhjQyxkdihreWhnl+ZobGvnGek1eifOXIhQokIIfVL5/GCs
 f/Q+7IwmJKSfedlcXv/eyIu+wjHjPsU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-uP5wf5FLPb2UAnElB6BzYA-1; Thu, 01 Jul 2021 12:47:23 -0400
X-MC-Unique: uP5wf5FLPb2UAnElB6BzYA-1
Received: by mail-wr1-f71.google.com with SMTP id
 b3-20020a05600018a3b029011a84f85e1cso2832644wri.10
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 09:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uDVCD+JTQbHWXIlmZPqHqq5qNDm1kE52LkitZ1WAbXM=;
 b=FA2tEYGrp/6/B/8jA8rP7oSHB+TD8yLBiGyY6JMxtZi3u9b2c+MiQd2N9zJzSorWkg
 OD/pumTBtN2Vi5bIKWQ3Pm71QSq75oGnwySIDSNfKtuibfdAuP7FxVhaXX7dSBFE06JF
 AOT2JJMKVlu+nLVapUVs8JzbWu2Jk4bFDXUdY/awGxWWnAoLaLKVE9PN/V+fxC6ELqQg
 Tr/I+EmY0Yv4LeYXRjlzN48TLFr2nR2TwPPS3wCHiCHXpoA5mtVsaV0ILEMlftrhOpVy
 ZSp+gyrZfv4aC+tmLJFrA5Ie9BeqRZkurJC7zFD2tETjddUU0QKQB6z0xmR1/AfkDix3
 YuCw==
X-Gm-Message-State: AOAM530ZSTw1qrFEOFTwqYotc1/+ZhCWQVkmPU1OhX9aeZZyGbCkUn7q
 XSC3JmgGD30HEKKUukeLAjVQ8UYqNMBfP08W0p8EDkzRZ95PZeKZvWky7VV7hpNTin/emZNYrs8
 llO6gJ+gCRihZO7LqtkKm1sG64RvUQmsEnNXPseBvsr4kMvG5Sn9zJCcRHugBMfUDlNo=
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr716789wrp.131.1625158042029; 
 Thu, 01 Jul 2021 09:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf7Cuk+0a294rqYxjgvQPFelJSDhXcDwpo2kgJY1YYMg5cbcxAmPmQ4Eh+zdtGiDftLhBv3A==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr716766wrp.131.1625158041806; 
 Thu, 01 Jul 2021 09:47:21 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id 31sm565618wrs.79.2021.07.01.09.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 09:47:21 -0700 (PDT)
Date: Thu, 1 Jul 2021 17:47:19 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peterx@redhat.com
Subject: Re: Failed pipeline for migration.next | qemu | 9c21e614
Message-ID: <YN3xl9Hppi+3XxCL@work-vm>
References: <60dddf17d0dc7_12297986117@gitlab-sidekiq-catchall-v1-64cdb99dd8-btlhb.mail>
MIME-Version: 1.0
In-Reply-To: <60dddf17d0dc7_12297986117@gitlab-sidekiq-catchall-v1-64cdb99dd8-btlhb.mail>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* GitLab (gitlab@mg.gitlab.com) wrote:
> 
> 
> Pipeline #330351156 has failed!
> 
> Project: qemu ( https://gitlab.com/dagrh/qemu )
> Branch: migration.next ( https://gitlab.com/dagrh/qemu/-/commits/migration.next )
> 
> Commit: 9c21e614 ( https://gitlab.com/dagrh/qemu/-/commit/9c21e61435e09a7a67f951a096b93183a7a5ad89 )
> Commit Message: migration/rdma: Use error_report to suppress er...
> Commit Author: Li Zhijian
> Committed by: Dr_ David Alan Gilbert ( https://gitlab.com/dagrh )
> 
> Pipeline #330351156 ( https://gitlab.com/dagrh/qemu/-/pipelines/330351156 ) triggered by Dr_ David Alan Gilbert ( https://gitlab.com/dagrh )
> had 2 failed jobs.
> 
> Job #1392645834 ( https://gitlab.com/dagrh/qemu/-/jobs/1392645834/raw )
> 
> Stage: build
> Name: build-disabled
> Job #1392645971 ( https://gitlab.com/dagrh/qemu/-/jobs/1392645971/raw )

Hmm,  that's:

Running test qtest-mips64/qom-test
Running test qtest-s390x/qom-test
Running test qtest-arm/npcm7xx_pwm-test
Running test qtest-i386/migration-test
../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from signal 11 (Segmentation fault) (core dumped)
ERROR qtest-i386/migration-test - too few tests run (expected 13, got 2)
make: *** [Makefile.mtest:72: run-test-7] Error 1

so perhaps that's a real migration-test failure running a 32bit qemu;
running the test on 32bit guest and making sure I had a /dev/kvm in my
32bit world (which I didn't in my pre-pull test), I see:

/i386/migration/fd_proto: [Detaching after fork from child process 201847]
[Detaching after fork from child process 201855]
qemu-system-i386: kvm_log_clear_one_slot: KVM_CLEAR_DIRTY_LOG failed, slot=0, start=0x0, size=0xa0, errno=-14
qemu-system-i386: kvm_log_clear: kvm log clear failed: mr=pc.ram offset=0 size=a0000
qemu-system-i386: check_section_footer: Read section footer failed: -5
Broken pipe
qemu-system-i386: load of migration failed: Invalid argument

Thread 1 "migration-test" received signal SIGABRT, Aborted.
0xf7fd2559 in __kernel_vsyscall ()
(gdb) where
#0  0xf7fd2559 in __kernel_vsyscall ()
#1  0xf7bb7382 in __libc_signal_restore_set (set=0xffffce9c) at ../sysdeps/unix/sysv/linux/internal-signals.h:84
#2  __GI_raise (sig=6) at ../sysdeps/unix/sysv/linux/raise.c:48
#3  0xf7ba12b6 in __GI_abort () at abort.c:79
#4  0x565603f5 in qmp_fd_receive (fd=4) at ../home/source/tests/qtest/libqtest.c:618
#5  0x5656044b in qtest_qmp_receive_dict (s=0x565cebe0) at ../home/source/tests/qtest/libqtest.c:646
#6  0x56560491 in qtest_qmp_receive (s=0x565cebe0) at ../home/source/tests/qtest/libqtest.c:634
#7  0x56560d1a in qtest_vqmp (s=0x565cebe0, fmt=0x56594f90 "{ 'execute': 'query-migrate' }", ap=0xffffd218 "") at ../home/source/tests/qtest/libqtest.c:747
#8  0x5655ec77 in wait_command (who=0x565cebe0, command=0x56594f90 "{ 'execute': 'query-migrate' }") at ../home/source/tests/qtest/migration-helpers.c:63
#9  0x5655ef1d in migrate_query (who=0x565cebe0) at ../home/source/tests/qtest/migration-helpers.c:107
#10 0x5655c79a in read_ram_property_int (who=<optimized out>, property=0x56594166 "dirty-sync-count") at ../home/source/tests/qtest/migration-test.c:176
#11 0x5655c851 in get_migration_pass (who=0x565cebe0) at ../home/source/tests/qtest/migration-test.c:215
#12 wait_for_migration_pass (who=0x565cebe0) at ../home/source/tests/qtest/migration-test.c:215
#13 0x5655e773 in test_migrate_fd_proto () at ../home/source/tests/qtest/migration-test.c:1038
#14 0xf7effbd7 in ?? () from /lib/i386-linux-gnu/libglib-2.0.so.0
#15 0xf7effa77 in ?? () from /lib/i386-linux-gnu/libglib-2.0.so.0
#16 0xf7effa77 in ?? () from /lib/i386-linux-gnu/libglib-2.0.so.0
#17 0xf7effec9 in g_test_run_suite () from /lib/i386-linux-gnu/libglib-2.0.so.0
#18 0xf7effeed in g_test_run () from /lib/i386-linux-gnu/libglib-2.0.so.0
#19 0x5655b424 in main (argc=<optimized out>, argv=<optimized out>) at ../home/source/tests/qtest/migration-test.c:1496

which hmm, doesn't look like a new test, I see kvm_log_clear has had a
fix to it's error handling in January from thuth, but perhaps that means
it's broken on 32bit on 64 for a while?


> Stage: test
> Name: check-python-tox

That one hmm I dunno, it's tox stuff.

Dave

> -- 
> You're receiving this email because of your account on gitlab.com.
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


