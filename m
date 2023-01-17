Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F80366DCF2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:56:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkYu-0000id-GX; Tue, 17 Jan 2023 06:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pHkYr-0000hH-9b
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:55:29 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pHkYp-0008Dl-Jo
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:55:28 -0500
Received: by mail-pg1-x536.google.com with SMTP id h192so21753611pgc.7
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zpXsPMWlC5EFkME77Z0xQ4jlbPMSa230wUSbV2lRrIk=;
 b=b4d/cvLZnKQL2vmHBucsYoTA2IL56KL6I1img+cCeCIz+bEFZl1csrwv3EgNpHwpba
 DWsB3hQ9GGP0QGU4gXWOuc/1DbwZpuftStS2+3JPHl1Wrf73Nf6KvAl+is6DvXIOe2/G
 QDvHIFOxpdqj6wILKw/iVpbUveWp5QAwcpxPYKOf75UydinL3TErUM93QgRRSktEY4R+
 S7eSzxMKQiRPJCY+5l21TA3+jKzqdVNcefRkaUUqNpFtTqMrg+fQXYoHyueE8dg8oXSC
 Wz7cX4qvCUYcI/NbnX8UXN9vxb43/mnQjhAJjfGfg7I6oI8lEeR6lsgG9uruiCxMtUYd
 svyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zpXsPMWlC5EFkME77Z0xQ4jlbPMSa230wUSbV2lRrIk=;
 b=a9G0MBpJH4VhnDy3RJFKeXyi4gv0wmQRelHIdB6Tt2jHYm4OkDWyeXJJZH2X7Tz8UT
 A4iDMlbjLnRf1nn7gI2bDR21pYkzF2xubJinVglaH/Y+Pf9dFHgPFJH5hPheuAWWx2Yp
 gKyu7Ijz7tDjnz5UveLyeqxM3cUfbn3mshqxcjlih7DYNGjGdgk1iboPNNCSw7M1bi4t
 fmjYqtDfcXbM1xMLWYl+egzXqtT0vKRGOxZLhxV2cT/h+Ei0gnV8CungtonE8sgAhFs0
 JkRttR3He6QEyHtWTLojtuNKkGiXQ7dVYUd3pqMkWkY0H+pjXopcMOdPapL/OVvrqLpG
 Prwg==
X-Gm-Message-State: AFqh2koHyQlY92B5IPcxaDb1Sdqz1qYP8MWjguFsNoOf84mEn4M/Gi1C
 1vhbmDU9QTd1b/r7+oJYw5jK7DIN78tpGkg7
X-Google-Smtp-Source: AMrXdXsyV1lUitd3w/D0G4eS+0oNQVOEWm5xGWtuu82MZtIIWCwPw58EASMPDcukpE9x5RLI5tSDrw==
X-Received: by 2002:a62:27c6:0:b0:58d:8ea0:ce31 with SMTP id
 n189-20020a6227c6000000b0058d8ea0ce31mr2864928pfn.27.1673956526112; 
 Tue, 17 Jan 2023 03:55:26 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 c196-20020a621ccd000000b0058a666aea32sm14003708pfc.147.2023.01.17.03.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:55:25 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v5 3/3] migration: reduce time of loading non-iterable vmstate
Date: Tue, 17 Jan 2023 19:55:11 +0800
Message-Id: <20230117115511.3215273-4-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 migration/savevm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..8ca6d396f4 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2617,6 +2617,16 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis)
     uint8_t section_type;
     int ret = 0;
 
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
 retry:
     while (true) {
         section_type = qemu_get_byte(f);
@@ -2684,6 +2694,14 @@ out:
             goto retry;
         }
     }
+
+    /*
+     * Call memory_region_transaction_commit() after loading vmstate.
+     * At this point, qemu actually completes all the previous memory
+     * region transactions.
+     */
+    memory_region_transaction_commit();
+
     return ret;
 }
 
-- 
2.20.1


