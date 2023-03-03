Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028586A956E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:40:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2pW-0001rA-2G; Fri, 03 Mar 2023 05:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pU-0001r1-Bq
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:40:00 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pS-0007yH-Px
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:40:00 -0500
Received: by mail-pg1-x531.google.com with SMTP id q189so1169906pga.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677839997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVlZ/xZyNlPE7qiZ1njM6/w0Wck5zKTu3W5xPbj3hMg=;
 b=JmBQGWWTMPEvPGeupLssiuhDTfAEK3V56Y+1T6+eYGhwXB7GJ0kLnqoSewJYz/zvDO
 6Mqg3T7VsVAJNBthVvmEBoKc8Xbz7kiPmTV+TS0zC12fGTTmG5ahy1yq1jk+B9DP69ZH
 Io7D9YfL0kjcamk3zS8UbQt3JMwrZPFn10q3H0uc3J3eZopApT/3PIS+QiHbAwmN2Bd3
 vLo0Hsv54aGseUJXhVbZDuHM9gSNMQ5VVe+oiLtU4fHhyhQ9YvzIfegF743m2GS9FWJ2
 b7cdd0oeh7iRobEHA6XjiVYt9sHYh4vjoOYXEPzfcnmnKCajC7kuZXv+6sM3g7E4zd8L
 vohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677839997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVlZ/xZyNlPE7qiZ1njM6/w0Wck5zKTu3W5xPbj3hMg=;
 b=ascErboYaojv9c3nHczOuWEBFRNtauvfrypEiYLZuD40J+niZwMB+nrv8Hjt+dOAXD
 t5fNSVzhmTJ0WDCYbATsOGrdpRW9YSc00Sq4Bbq1iMa0zcLjqgrIfhhAo3zR3E1quyzR
 ykfcsiyhE3InmqxUJcs1P/6r0qNbhM4zFKRtxEn15mwqdCbps5ckV7tZkFThP2J0o6gA
 +9gfxTyq0+tKGez02qDjOUanmrgToGG9bb9lOBCJe3izvjntAtR7pYX910xmMSSh7dAK
 NLmW4VeNpM6gb6/GmXH/7JM6Ep2UweY/XCUV43xBegx8EsBuuHEWrjA5DKeVEAZzmTxx
 8A7w==
X-Gm-Message-State: AO0yUKUN0kF6GMcAp70kSY5iVTY2QH2iGSERMnnj5fmzj+4CbGeFoSVB
 nH+5zED+zS05FKYCjCXQqv/ACGjrzlabSjGd
X-Google-Smtp-Source: AK7set+iquhi/AeSquBxg6Y2vZ/vECBOKZsqWihJ+pv3O8nNyT6OYLCojC5vNiTQ6MVj9IbS9/K+Iw==
X-Received: by 2002:a62:5243:0:b0:5dc:6dec:e9d0 with SMTP id
 g64-20020a625243000000b005dc6dece9d0mr1704783pfb.3.1677839997367; 
 Fri, 03 Mar 2023 02:39:57 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 6-20020aa79106000000b0059085684b54sm1316420pfh.140.2023.03.03.02.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:39:57 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v6 5/5] migration: Reduce time of loading non-iterable vmstate
Date: Fri,  3 Mar 2023 18:39:35 +0800
Message-Id: <20230303103935.370903-6-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
References: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
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
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 8 16-queue vhost-net device
  - 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		about 150 ms			  740+ ms
after		about 30 ms			  630+ ms

In test2, we keep the number of the device the same as test1, reduce the
number of queues per device:

Here are the test2 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 8 1-queue vhost-net device
  - 16 1-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		about 90 ms			 about 250 ms

after		about 25 ms			 about 160 ms

In test3, we keep the number of queues per device the same as test1, reduce
the number of devices:

Here are the test3 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 1 16-queue vhost-net device
  - 1 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		about 20 ms			 about 70 ms
after		about 11 ms			 about 60 ms

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


