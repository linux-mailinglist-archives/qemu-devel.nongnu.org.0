Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603964A542
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:51:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4m1J-0002K5-Do; Mon, 12 Dec 2022 11:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p4m0e-0002DE-3k
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:50:34 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p4m0c-000380-K7
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:50:31 -0500
Received: by mail-pl1-x630.google.com with SMTP id jl24so12659654plb.8
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJg5zSq9kdDfSLar49onFW0ftLsHi0KtswppGKlIvwI=;
 b=TDL8Y/CKGjF6zhHvVjWrt44P+M/z9U/ZmV2+yCq3sMXNSzzwZX06uuLrwJhoOymRD9
 WOxIssj+1+yp6np8uHYnc9JYKNzSqudKH/Z82fGMaTy3O+g3Argwg9EkUIUSG91D0X1L
 q1EiPVy4xJE8bZjkze2IlHtqleTSOF+Yq+pD9vDhNdQTYKH/2gzsDKyKW18+WSqtYY5U
 3eE11VoOVshl+HtHXZ1kiDMnf0RNYnrjtdVhAqc4Drutj+eA1TZo6cTdQqW47xJW4WXz
 xTnU2M0FdXi82pKeT7JepRYlAqvvdPZHUe7kX+1PhPzIKHDHCiM38xWhaxnpX900AjIT
 MXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJg5zSq9kdDfSLar49onFW0ftLsHi0KtswppGKlIvwI=;
 b=ZYhCJiR0rrEOkfvzWAq5Umh1uh4dNvYqlkFwjEEZp7/RaDFAtzSgMlxtrTXAe/5lSa
 nAVavbfUtCQ6zjFSAzbsLS+y6ZXf4cW//7b3CRXKGRSdM0shw13IWZnNGYDg6Xti3fRT
 d8Crn/7Djqtparx7DRk3ZHcTu5KV81A3+Ox9rtfwkohXLahElKZAxTSSgYtOdlN0AVtR
 W+zVjWO8hTgVxOhvRak1SGtwaY4hqbL6saJ8K97gFGGgkXEm4AkmPz8Iar0q7YjaTIAu
 Gf1lNLn4eMT432bbfDccCc/2JAFteKJLqnq44SAGXC3jUcz0WYxR0+kbepJXWoFF6nut
 CGqw==
X-Gm-Message-State: ANoB5pkPPNZrSRoW/1tfgaqhp2H9mjOb5EoKnBe8t8akF8zK73ZvebZH
 LRX1rdpzNMO9fcRUfCuuiKeiOvQ1CeIaVT36
X-Google-Smtp-Source: AA0mqf7/sLvMcCKZENMSJTjW6NapWh4CF2xdHQDbqU8cUjfiL5Y9DJ2uE+/33jtg2HCP8GryFSs1+A==
X-Received: by 2002:a17:903:240d:b0:185:441f:70b1 with SMTP id
 e13-20020a170903240d00b00185441f70b1mr17605959plo.54.1670863827708; 
 Mon, 12 Dec 2022 08:50:27 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a170902ea9500b0018f69009f3esm3012125plb.284.2022.12.12.08.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 08:50:27 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, peterx@redhat.com,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v2 3/3] migration: reduce time of loading non-iterable vmstate
Date: Tue, 13 Dec 2022 00:49:42 +0800
Message-Id: <20221212164942.3614611-4-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
References: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x630.google.com
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

Here are the test results:
test vm info:
- 32 CPUs 128GB RAM
- 8 16-queue vhost-net device
- 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate
before		about 210 ms
after		about 40 ms

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 migration/savevm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..68a7a99b79 100644
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
@@ -2684,6 +2687,16 @@ out:
             goto retry;
         }
     }
+
+    /*
+     * call memory_region_transaction_commit() after loading non-iterable
+     * vmstate, make sure the migration_enable_load_check_delay flag is
+     * true during commit.
+     */
+    migration_enable_load_check_delay = true;
+    memory_region_transaction_commit();
+    migration_enable_load_check_delay = false;
+
     return ret;
 }
 
-- 
2.20.1


