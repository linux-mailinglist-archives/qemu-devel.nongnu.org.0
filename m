Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBE443EAD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:52:40 +0100 (CET)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miC0d-0004MZ-VX
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvV-0001Jw-5d
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBuU-0003P0-8B
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3iYNe8nWxPJdzmtR1DHJj8zXxHknQ9MlqDPFS2quic=;
 b=gJr9EEqGkY8z5CcZ/fcb5ctF7ATjuQstfpHBgaVAm+RCQfd57vaT6+/XVQ5sTkpoUv+IJs
 nSOOHYrfTFTEPqO89kGiWpvhWAmnpulh8uvoI2kLnPg2IEBh9qhjpXtsjOpQpVB8NQtSVW
 5CWGtxJLadGUKn8aFc9J/PJRXeeoJF4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-9C5ZuVIyPbaazRFz5smb9Q-1; Wed, 03 Nov 2021 04:46:15 -0400
X-MC-Unique: 9C5ZuVIyPbaazRFz5smb9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so750824wmr.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I3iYNe8nWxPJdzmtR1DHJj8zXxHknQ9MlqDPFS2quic=;
 b=hf+lgTkRcTEavmX3CLqYHuhsn5W6p5nZ9/OlUatGySjCAPsEB/ZzGKwpBHHMUddg2h
 ESEul3PpZz9spgrkR65w982ove9B8MizC2o9pFl/lEnk7dRNQjUmXoyR7Vql9VAwCbTH
 t0wPM2cUmLhlGpjIrtPrgEOgj63QUgcHM9zpEPgvLq9M8VgrwMmq5faBoGQ/sCUJLMgn
 UZMAm31hWjSbbXoIGGVblOzZ2uU6dWtyGYxW4/fZXxyGPn+GpK9/159xWxJpPeBNYv7C
 t+nxFlC2HJvG0m6/eYwptNw+eSZy9NY5Qngj6TF430p7aTwSHrfFg/0zJjhCtmmLhBMv
 SO7g==
X-Gm-Message-State: AOAM532101dC/zDFTbeZQgYoClycro5UZDecWxXtfi/r7jfQDtQa1vwH
 lSgfvvZ3JAafUT9v1+tZZuflyxNVp55OTBHiGA/Te0p+Zl6WNjB8KemcBtici/ush/QE/DThFj7
 rk7O+gvYMCOyiAy0Glw5wH6XfDftupWu1QlCuSDQ1J0JDjjkKlHRCm6pkfwIqfJarT+A=
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr34071294wrq.17.1635929173597; 
 Wed, 03 Nov 2021 01:46:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcCNuK2660wzEqvrHTeB6rgFwxG2p6R+fYAjOaO0HxWjO+JjTZdk/pxcuZwyl7HrpuKnTvCg==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr34071267wrq.17.1635929173423; 
 Wed, 03 Nov 2021 01:46:13 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id r1sm5348673wmr.36.2021.11.03.01.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:12 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] Fixed qemu crash when guest power off in COLO mode
Date: Wed,  3 Nov 2021 09:45:59 +0100
Message-Id: <20211103084605.20027-6-quintela@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

This patch fixes the following:
qemu-system-x86_64: invalid runstate transition: 'shutdown' -> 'running'
Aborted (core dumped)
The gdb bt as following:
0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
1  0x00007faa3d613859 in __GI_abort () at abort.c:79
2  0x000055c5a21268fd in runstate_set (new_state=RUN_STATE_RUNNING) at vl.c:723
3  0x000055c5a1f8cae4 in vm_prepare_start () at /home/workspace/colo-qemu/cpus.c:2206
4  0x000055c5a1f8cb1b in vm_start () at /home/workspace/colo-qemu/cpus.c:2213
5  0x000055c5a2332bba in migration_iteration_finish (s=0x55c5a4658810) at migration/migration.c:3376
6  0x000055c5a2332f3b in migration_thread (opaque=0x55c5a4658810) at migration/migration.c:3527
7  0x000055c5a251d68a in qemu_thread_start (args=0x55c5a5491a70) at util/qemu-thread-posix.c:519
8  0x00007faa3d7e9609 in start_thread (arg=<optimized out>) at pthread_create.c:477
9  0x00007faa3d710293 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index edc0dac80a..3fb856f6e1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3626,7 +3626,9 @@ static void migration_iteration_finish(MigrationState *s)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_CANCELLING:
         if (s->vm_was_running) {
-            vm_start();
+            if (!runstate_check(RUN_STATE_SHUTDOWN)) {
+                vm_start();
+            }
         } else {
             if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
                 runstate_set(RUN_STATE_POSTMIGRATE);
-- 
2.33.1


