Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A86A95AE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:58:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY36g-000728-8Y; Fri, 03 Mar 2023 05:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY36H-0006rr-EX
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:24 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY36F-00043a-Qc
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:21 -0500
Received: by mail-pg1-x531.google.com with SMTP id q23so1201763pgt.7
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677841038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1mu46Tlnl5UKUBS8hg1pN4oSgMp+Y6WnRUDWtPACnY=;
 b=TBod0AQt1EbahiJeDlDu6v2ypiNGP7HA+v3tVBP1fXicE5RF0e2FOtEUfEk7Eeun+3
 kUony4TLh8ytC/SQGVCRbLxZsX+vnTuYRyxWTJUpCU2Dy4IewqVTjnrMGt7S1qz0qgoN
 6lckw1TzHdYXvymzCiKL9+Jy8gXN1pIhoq4CdMj/Ix/kr7/wK+G0bupjGzDp60ejVTlr
 Tj3sVippOjFLXEx0ElQWrGTMW/fborlI8ZvZjwoyVYz3VBQRfMlyrfAkjSa8wdcK+YG3
 GB596jfCPRuHMV4k4I896zl7qjK4mFNbCdkfbv9O1KIm6YM/I5GdUxNtjdDGJ+FqOi6i
 /MYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677841038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1mu46Tlnl5UKUBS8hg1pN4oSgMp+Y6WnRUDWtPACnY=;
 b=PcyCJRI+juzMCEn0+VaB3qWELLLt7PQh6vVqbMsGHXmHIKfB1XZ7idUZykZQfQcL8A
 AU0AdXuVuLJ5uaLYCa+t3mtbBBtg1wmyoQVWwkzluj+beZ9Dk78xI0OKXO4QyiPQFDUV
 jg96thayCa/oF4ABIhioIJvYdMVBlbruT8M2FWP7Yo6OxIeo91LFn5258ODZbGegzMle
 bbWcQOaKqBNrznhaQFBOB2UfpqWhayKwmw6dM8c02uIkSjmL1Q+1bKKY+CW6IqbjGm8v
 D1xwnFuJRwnjBEs1Tdch1VpxjhvRAED0IRIrqokQnBhn6vufrP1bM645j4VhSVYJOV63
 3izw==
X-Gm-Message-State: AO0yUKXDDTipTF77YQxyJ7+rg1TFQolrHOWvZ2iUxCudiUbm9nmr+Pkr
 3jaRbim3iUWgcmTfPgAxjNrtOpwn6dY2PIzU
X-Google-Smtp-Source: AK7set+5fI0xmzV3N7clBXvwtmNnVuQ6sRUw3GpqOzk7F76/iu/RqbvWrZcrahQYkZNU+Z8pM/gM7Q==
X-Received: by 2002:a62:65c1:0:b0:60b:e13:a10b with SMTP id
 z184-20020a6265c1000000b0060b0e13a10bmr1472783pfb.3.1677841038303; 
 Fri, 03 Mar 2023 02:57:18 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a63a54f000000b004fadb547d0csm1248000pgu.61.2023.03.03.02.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:57:18 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH RESEND v6 5/5] migration: Reduce time of loading non-iterable
 vmstate
Date: Fri,  3 Mar 2023 18:56:55 +0800
Message-Id: <20230303105655.396446-6-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
after		about 44 ms			  208 ms

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

after		about 30 ms			 about 110 ms

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
after		about 12 ms			 about 38 ms

As we can see from the test results above, both the number of queues and
the number of devices have a great impact on the time of loading non-iterable
vmstate. The growth of the number of devices and queues will lead to more
mr commits, and the time consumption caused by the flatview reconstruction
will also increase.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 migration/savevm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index b5e6962bb6..3dd9daabd8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2770,6 +2770,7 @@ out:
             goto retry;
         }
     }
+
     return ret;
 }
 
@@ -2795,7 +2796,25 @@ int qemu_loadvm_state(QEMUFile *f)
 
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


