Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0626B3432
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 03:25:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paSRS-0005eM-IO; Thu, 09 Mar 2023 21:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSR6-0005dp-V2
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:48 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSR5-0001xN-9v
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:48 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so7210061pjb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 18:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678415086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wK7Kao4Ay8cM21jN0qeB4dy3IR6Pt8A2UW1ABAkymk=;
 b=RSSqqrdkAhMj8GRW/4evaDHHWulxsjHj9OkLePcvcjjCOhe+EOoQ5yilgRqeLh5rhF
 Ym4fq5znyJajPNGnMTDPcryaBIW0Bdb3ykQGK+dkbhRiSVgO6R+qnaeSS9ytASY/pLRc
 8HVCvA1jBo8biWYL1WCOIgNe4z0nc/EOEDqSo0Jhu0mE74GZBqPKIMhTyQY2heDk00MI
 u4wuEfLUzHkEtFm+X9afPUH5ep/926Rz1PpNQ6GN0fR7tgieJhG95RCf2xt57d+F3fy7
 nrq3wy2+UYr8OsF7JbThKe69IoPPvwQ9qU9iQgAfaGIxrgACV2V1589zDRsjXjpD1Grg
 ZLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678415086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9wK7Kao4Ay8cM21jN0qeB4dy3IR6Pt8A2UW1ABAkymk=;
 b=KvLK0Up67xNx7WJiZvk0CcThGb1rGrodobdhPF/sKGh+QxgRlaOdTcbqasNnjBg0d2
 AwrhBEcRcOCcngqzwvyphQILublXjw+MNhxqiE+mRg+NshWvnmw2ntHoCmvtn6tgsyBv
 Q8POQPiCgE/4qajYz+WiKdlifjY1EZhrIsiuDJTW5xO8aVJJR9D36gYrrZGAogtyLt96
 S2A8VrAo0UGqYDNJYjweavyKeQR+l3+lNFHw+Vaq0fqQn23h46QGhbHs38L1eBMb3B7z
 u6syTXJdkZVSPlbAqqv3rXVgRFBN2MaoDMfzYCCncNV+LWfR/sdbwqnZd0dPVDr6nowa
 qU0w==
X-Gm-Message-State: AO0yUKVDAjdfUhEl2JFVZTOXPu+DybrBWdGD+sHz8xXE0sT35UXUyc96
 bRl1pRpme0BKeoJA7w7bUIEyhkN0/HMB5xqywt8=
X-Google-Smtp-Source: AK7set94HUnUqNaVTMoWhtiZyScsxILPYf4FtqTnUCOp+HmMQBVC/NhjlxqRNqiXC23C+Mkd+P83dw==
X-Received: by 2002:a05:6a20:5489:b0:cc:120c:b259 with SMTP id
 i9-20020a056a20548900b000cc120cb259mr30209129pzk.39.1678415085774; 
 Thu, 09 Mar 2023 18:24:45 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 g7-20020aa78187000000b00571f66721aesm246081pfi.42.2023.03.09.18.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 18:24:45 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v7 5/6] migration: Reduce time of loading non-iterable vmstate
Date: Fri, 10 Mar 2023 10:24:24 +0800
Message-Id: <20230310022425.2992472-6-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1034.google.com
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
 migration/savevm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index aa54a67fda..9a7d3e40d6 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2762,6 +2762,7 @@ out:
             goto retry;
         }
     }
+
     return ret;
 }
 
@@ -2787,7 +2788,25 @@ int qemu_loadvm_state(QEMUFile *f)
 
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


