Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F71443EBC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:55:52 +0100 (CET)
Received: from localhost ([::1]:50830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miC3j-0002B5-Ck
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBw1-0002qa-1M
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvW-00048l-UP
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsQ8hXBn7WkAri1/B/nJyK+EZjImeCKuGXRF/WepPqo=;
 b=XtryX7jmJKozKNkOoPm8VO2OIGVv5dZWtDcHphIT4JpEv9OXn7SIyYsQp5oR3lXCHblKgt
 XmCfmBlpuVJhHnn3+uDWnKAFeCrlFNPx91O2BbWbTw+C9hjPpT+lWfY6UgfYF1vLfq00IM
 oA90IRDDRGTCofAZACG5I+r9vWd8860=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-RfqhDxivPz2VHRkYGYHplw-1; Wed, 03 Nov 2021 04:46:16 -0400
X-MC-Unique: RfqhDxivPz2VHRkYGYHplw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so289396wms.7
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hsQ8hXBn7WkAri1/B/nJyK+EZjImeCKuGXRF/WepPqo=;
 b=uDeojjdzgWryAVgx3zf+UtlHAV9Uw1Gttejq7UvBL2RRIkXMIAYA7r7d/igAusqZWJ
 JRnzJe1RYBSvW1Gl5kGZgkZDniKF/WAjC9IS9MLvICnP28eOso/X9AMI8ocXIvZHewKt
 QZNqRSDNMNtLtbChVWXKV8JQFkMNXbT+lLYEAz5UbnlX98O/60aOps0c+YMaMVBaJY9r
 kt+7J6oDL56QuuUMIRDoXgbLtB3XXC0tqTVel3wG3NYXv+kpi5uttWpMgMjLu7XnUF5C
 KeFcAdU+C2cv64B6lLuKbAirebmEUJQX7LJbUd4tpum8NNb9FKqauDzogXw3SIgz6ODd
 VwjA==
X-Gm-Message-State: AOAM530gICt9L1SXLWGVyZgblTUGee3ZZWpuN5RpdlXZiqluzfXmwXpw
 s8S4zxq9pgjXp4/hqX2fUYhVbXKVui4Cjlf9WAZeKz5OIjXCX8++8cX+TiklVcKZei9djY2Hqqa
 RgVO/yhUHQsuC9bUq3V+sKcoFPOPvAhzn5GYJBkgfk9LW0JZ9vENDf0+cs4tWIjsWHdY=
X-Received: by 2002:adf:e54a:: with SMTP id z10mr43727617wrm.328.1635929174994; 
 Wed, 03 Nov 2021 01:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw00E5UDZhwc6Tbj13Lif2FxQzdCLYIQHzj/ixj0s1ag48c2KkhkAR3RvF4ZczpKOaFQIXfpw==
X-Received: by 2002:adf:e54a:: with SMTP id z10mr43727570wrm.328.1635929174550; 
 Wed, 03 Nov 2021 01:46:14 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id u19sm1325631wmm.5.2021.11.03.01.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] Fixed SVM hang when do failover before PVM crash
Date: Wed,  3 Nov 2021 09:46:00 +0100
Message-Id: <20211103084605.20027-7-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103084605.20027-1-quintela@redhat.com>
References: <20211103084605.20027-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

This patch fixed as follows:
    Thread 1 (Thread 0x7f34ee738d80 (LWP 11212)):
    #0 __pthread_clockjoin_ex (threadid=139847152957184, thread_return=0x7f30b1febf30, clockid=<optimized out>, abstime=<optimized out>, block=<optimized out>) at pthread_join_common.c:145
    #1 0x0000563401998e36 in qemu_thread_join (thread=0x563402d66610) at util/qemu-thread-posix.c:587
    #2 0x00005634017a79fa in process_incoming_migration_co (opaque=0x0) at migration/migration.c:502
    #3 0x00005634019b59c9 in coroutine_trampoline (i0=63395504, i1=22068) at util/coroutine-ucontext.c:115
    #4 0x00007f34ef860660 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91 from /lib/x86_64-linux-gnu/libc.so.6
    #5 0x00007f30b21ee730 in ?? ()
    #6 0x0000000000000000 in ?? ()

    Thread 13 (Thread 0x7f30b3dff700 (LWP 11747)):
    #0  __lll_lock_wait (futex=futex@entry=0x56340218ffa0 <qemu_global_mutex>, private=0) at lowlevellock.c:52
    #1  0x00007f34efa000a3 in _GI__pthread_mutex_lock (mutex=0x56340218ffa0 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
    #2  0x0000563401997f99 in qemu_mutex_lock_impl (mutex=0x56340218ffa0 <qemu_global_mutex>, file=0x563401b7a80e "migration/colo.c", line=806) at util/qemu-thread-posix.c:78
    #3  0x0000563401407144 in qemu_mutex_lock_iothread_impl (file=0x563401b7a80e "migration/colo.c", line=806) at /home/workspace/colo-qemu/cpus.c:1899
    #4  0x00005634017ba8e8 in colo_process_incoming_thread (opaque=0x563402d664c0) at migration/colo.c:806
    #5  0x0000563401998b72 in qemu_thread_start (args=0x5634039f8370) at util/qemu-thread-posix.c:519
    #6  0x00007f34ef9fd609 in start_thread (arg=<optimized out>) at pthread_create.c:477
    #7  0x00007f34ef924293 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

    The QEMU main thread is holding the lock:
    (gdb) p qemu_global_mutex
    $1 = {lock = {_data = {lock = 2, __count = 0, __owner = 11212, __nusers = 9, __kind = 0, __spins = 0, __elision = 0, __list = {_prev = 0x0, __next = 0x0}},
     __size = "\002\000\000\000\000\000\000\000\314+\000\000\t", '\000' <repeats 26 times>, __align = 2}, file = 0x563401c07e4b "util/main-loop.c", line = 240,
    initialized = true}

>From the call trace, we can see it is a deadlock bug. and the QEMU main thread holds the global mutex to wait until the COLO thread ends. and the colo thread
wants to acquire the global mutex, which will cause a deadlock. So, we should release the qemu_global_mutex before waiting colo thread ends.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 3fb856f6e1..abaf6f9e3d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -590,8 +590,10 @@ static void process_incoming_migration_co(void *opaque)
         mis->have_colo_incoming_thread = true;
         qemu_coroutine_yield();
 
+        qemu_mutex_unlock_iothread();
         /* Wait checkpoint incoming thread exit before free resource */
         qemu_thread_join(&mis->colo_incoming_thread);
+        qemu_mutex_lock_iothread();
         /* We hold the global iothread lock, so it is safe here */
         colo_release_ram_cache();
     }
-- 
2.33.1


