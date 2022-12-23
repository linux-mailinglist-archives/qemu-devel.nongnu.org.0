Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7F65515A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 15:25:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8ixg-0001hZ-PR; Fri, 23 Dec 2022 09:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8ixa-0001g9-LH
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:23:43 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8ixY-0000me-Ag
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:23:42 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d7so5089079pll.9
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 06:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TclGryZiOEctLPI49CtSoCWNEcsJRMvUbalqBdcMECA=;
 b=kQjB5wFCy7xFQpqH/t9MIkQ/O/dGCs8S3I3FhODKKAAzr6pGJhdJyhN/MWlrrvJ7Gw
 AEohhU/RmhWH9Oa6GVirjchc9dHjv4W5dbX+bvd2d5OmMEYbT48vXYVmFI/HHba8wBjc
 INT2RFgsESoTIzx5Z5z5yXRcYDzQaKVhNa+AHvSwidkbS29NVSPt+2STl7jMAAKMZhid
 mwcuAz8bqfewaRYiQZeT8sHsh2eVeG6nQN3LU+7GrGBSgIsQMOL2DfxpGcQEkNUoZzDc
 URRvRR1xwqBBwDqneFiXNuofmjRK1rM7s+ZSJSZZ/bhCe31Ds935of5jDkTBs++FCZRi
 /ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TclGryZiOEctLPI49CtSoCWNEcsJRMvUbalqBdcMECA=;
 b=ZAkaEG+2IDXSLadqVP+nsjrsBDFiV2UIaMzd1WWviEgvy20BAIHjifXWBnEJkH2XaV
 kXruQfxEZesUZprQPCWbkMqE3kM+aRTCp8cxmLZoNMdDFJ97AG/4MkregNm8XOIz2JM8
 EoA4rSdNx0QzndtaBVqZHpjL9GcVJQhgwPDzaLoLNZWyGLzYqeutB6ssJ6SHMNnkwuyc
 tlyY3ZdZfhguQz6vJzNj6bJkpPXuk4odERTnSp323s6BRFMIUx8fxoqruB1qW9+lRlrI
 PvRz+m7c8Rszb+6aOoW8t0w2pjXuOgj8gsuGJPZwC5b1/LT2QQHTfVu1VU9qfg4aHnia
 2Zww==
X-Gm-Message-State: AFqh2kpL/s4UPEzbJvtXMxmsiTmk7Gk43xulYm3pyRZGIrl2GSW7lrRs
 2DwRggau1Pv9KWRjElcfF5FwwL89VifsGRqd
X-Google-Smtp-Source: AMrXdXu5N4aM9/TIieyTI2aSQXmgHQ8p0byMWn/nYkX9OEh4N+U+CPla8M65DoDniyeqPFxfqen63A==
X-Received: by 2002:a17:90a:420b:b0:218:ff8e:5d6b with SMTP id
 o11-20020a17090a420b00b00218ff8e5d6bmr11370142pjg.16.1671805418925; 
 Fri, 23 Dec 2022 06:23:38 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a17090a6d9000b00223fa0148b8sm4751734pjk.41.2022.12.23.06.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 06:23:38 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v4 3/3] migration: reduce time of loading non-iterable vmstate
Date: Fri, 23 Dec 2022 22:23:07 +0800
Message-Id: <20221223142307.1614945-4-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
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
 migration/savevm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..19785e5a54 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2617,6 +2617,9 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis)
     uint8_t section_type;
     int ret = 0;
 
+    /* call memory_region_transaction_begin() before loading vmstate */
+    memory_region_transaction_begin();
+
 retry:
     while (true) {
         section_type = qemu_get_byte(f);
@@ -2684,6 +2687,10 @@ out:
             goto retry;
         }
     }
+
+    /* call memory_region_transaction_commit() after loading vmstate */
+    memory_region_transaction_commit();
+
     return ret;
 }
 
-- 
2.20.1


