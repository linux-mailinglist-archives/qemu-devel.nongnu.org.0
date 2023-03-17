Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1B6BE2FD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:21:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd5JP-00071P-9T; Fri, 17 Mar 2023 04:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JL-00070a-Jk
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:39 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JJ-0006Sv-VN
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:39 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so4431019pjz.1
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679041176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AP9kMZ+IWsggIfpBp8YbbnkPCWJhhQYUg0buOuv8PNk=;
 b=gRAF9DZyS0JAjPLvmwqkHXrj3tHTnGGmdo7IthY2iFKoucar8b2TT5Nf2OD8/jW0m1
 aRkhWf3rBUWNgEBkotWeYgLDKT4b4SkTkg6nUr2m6gQNRUdIxLPIPA9je/ZEO1iGUNVx
 xIRkwNuhz7dq/Jrzc8PDYi80byHFMQfBwdGzpf1xKlVTw18OUwTVJ+guFyBpjycXvMdA
 94uxsizsh3xHafjH2DJhqXWb2J6cAh32AfuRqEIU1WJUZqNrulNCn15t5bNzbaFG+/uX
 QNmJv+Vs1IzqUEVSMzmMP2/OhXgERTS5GZAAWa7AIqC3PYsjo4hH/2zX/ZjVo0Lf3o7N
 trOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679041176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AP9kMZ+IWsggIfpBp8YbbnkPCWJhhQYUg0buOuv8PNk=;
 b=J8lynyInKCTh87YANmYZ7P/oeddLk3boVkU280uu3JBvCLLYdiWfMrjaL8I6FDGdSy
 iPYhOyu5omp15rET6m3k5/6tGw494d0GqzMuCaUbdSjBS0oeRTAOdvcmpIe1+QyURU6D
 7Bjt0sMcJvp7q1MK32WMiw0og4CTmtddBK32WKHUAo2Eqzew8fLFFkvYBvgYd98m/RCh
 suRRmY7UCLsuEh9U1D6AkhT+WXXsU7hu+lI7IuhmevbVW853cBEasEI6euWF2SJz3mmW
 sv3uJJSlyLfIQReYYVTXMYw6x3Ibwnm2CClIAztGvLhhEGnbgdjJsViIXO4NSqItbV1c
 fSpw==
X-Gm-Message-State: AO0yUKUiWISiZ7d3/LGwux1h3N+uKulQho08XFizQYQvbDnm9n6Hjbtq
 TTdX+o4XJt78mY9wn7aZluMnFwMz8lRdigL3lXI=
X-Google-Smtp-Source: AK7set9M7O2VuxnX/bIofmPuDuUcXRApeW7JjYibZetUIFAA9mTSZ58FB5k2KjW1QNawcBMh+huHQw==
X-Received: by 2002:a17:903:2306:b0:19a:b588:6fe2 with SMTP id
 d6-20020a170903230600b0019ab5886fe2mr2299083plh.13.1679041176339; 
 Fri, 17 Mar 2023 01:19:36 -0700 (PDT)
Received: from MacBook-Pro.local.bytedance.net ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 p36-20020a631e64000000b0050be8e0b94csm873304pgm.90.2023.03.17.01.19.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:19:35 -0700 (PDT)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v8 5/6] migration: Reduce time of loading non-iterable vmstate
Date: Fri, 17 Mar 2023 16:19:03 +0800
Message-Id: <20230317081904.24389-6-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
References: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

Note that the following test results are based on the application of the
next patch. Without the next patch, the improvement will be reduced.

Here are the test1 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8362 CPU
  - Mellanox Technologies MT28841
- VM
  - 32 CPUs 128GB RAM VM
  - 8 16-queue vhost-net device
  - 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		about 112 ms			  285 ms
after		about 20 ms			  194 ms

In test2, we keep the number of the device the same as test1, reduce the
number of queues per device:

Here are the test2 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8362 CPU
  - Mellanox Technologies MT28841
- VM
  - 32 CPUs 128GB RAM VM
  - 8 1-queue vhost-net device
  - 16 1-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		about 65 ms			 about 151 ms

after		about 19 ms			 about 100 ms

In test3, we keep the number of queues per device the same as test1, reduce
the number of devices:

Here are the test3 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8362 CPU
  - Mellanox Technologies MT28841
- VM
  - 32 CPUs 128GB RAM VM
  - 1 16-queue vhost-net device
  - 1 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		about 24 ms			 about 51 ms
after		about 9 ms			 about 36 ms

As we can see from the test results above, both the number of queues and
the number of devices have a great impact on the time of loading non-iterable
vmstate. The growth of the number of devices and queues will lead to more
mr commits, and the time consumption caused by the flatview reconstruction
will also increase.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 migration/savevm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index aa54a67fda..ecf7b27000 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2787,7 +2787,25 @@ int qemu_loadvm_state(QEMUFile *f)
 
     cpu_synchronize_all_pre_loadvm();
 
+    /*
+     * Call memory_region_transaction_begin() before loading vmstate.
+     * This call is paired with memory_region_transaction_commit() at
+     * the end of qemu_loadvm_state_main(), in order to pack all the
+     * changes to memory region during the period of loading
+     * non-iterable vmstate in a single memory transaction.
+     * This operation will reduce time of loading non-iterable vmstate
+     */
+    memory_region_transaction_begin();
+
     ret = qemu_loadvm_state_main(f, mis);
+
+    /*
+     * Call memory_region_transaction_commit() after loading vmstate.
+     * At this point, qemu actually completes all the previous memory
+     * region transactions.
+     */
+    memory_region_transaction_commit();
+
     qemu_event_set(&mis->main_thread_load_event);
 
     trace_qemu_loadvm_state_post_main(ret);
-- 
2.20.1


