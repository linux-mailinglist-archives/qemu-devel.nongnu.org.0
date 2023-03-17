Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B288B6BE2F8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd5JS-00072V-RY; Fri, 17 Mar 2023 04:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JP-00071y-Lx
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:43 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JN-0006TT-UL
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:43 -0400
Received: by mail-pl1-x62e.google.com with SMTP id ix20so4572256plb.3
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679041180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3N7ETY31dIiZEWsYXp+kYxAK9LnKSJagn3s6+DE/F+4=;
 b=IFPpNjMHV1ck7PnTn3vHG8VVtYPyG8+J9UuJwsXfkVC7ooCR5LHC1uJBePAhBXYWa2
 s1jvIL5MPghh3xn5ZwGNU9YZjmDith5CTGvkxzGH73idelxNDauzN+Bsxr3TlX2Wn86c
 27vjK2iQVjmcNdhjp4jfoYQr+xSTg2ztL9dfhzz9bq5kDLyhyAeLIR2HTSqmUoTyC1n8
 Bb5KxQ0jqYWdggqPyEKEYLhZEOtobriePAP7SEOWLFqrQRfhV+D9XiQlhWdUv9l4k693
 MWVn0AIRU0NQcw9zxAq4A71ZqTFhNtXaT4XaKoKhvA04+RkYJl0dV2E//nfab828z7Io
 VaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679041180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3N7ETY31dIiZEWsYXp+kYxAK9LnKSJagn3s6+DE/F+4=;
 b=Z2U9wRgd5tKt0aZnyT31mM1NyyUGAhiF7S0l8SeJCA1WfaRT9A1HscEEUp9ArjyZQE
 GGAiZrSGiAJbTBwhGZu3UfL1Xo/EgucDC3HG1I3THU1w3u1je/kOpEED2Hwf8ikspSgs
 AA7p3qMCtdFpJLlhaRq8AIRKbi2sSXmLs6gocusVN3wtd7TtaW8KfN5lmjgS1TvaiaxQ
 /0hhMchJm64GdOG/LpC9+us6kB+uq5wt5TpJOAjkZ4p3tEifdEksJelp5hY1ri2/asj2
 6eaCeRM+aP5OdCUAhFO40woGcUm5DHMRveWkUqZm0DVjAX2zWcKwB4ZEHQOXAuaKg7+5
 maMA==
X-Gm-Message-State: AO0yUKUuva14mT/S7jxl1NYWiCQjP0rqyhywcQe8xCuv+3DP7o3Gpreq
 a2Wu/iEq0MBYarsl17+IQ3nrgFCeCtrX6pE9/2o=
X-Google-Smtp-Source: AK7set/aDNHq18k+E9fQx6HGB0SlmUm11TixjXBx68hPi0WI+PS7o/9Nx4d3GU5Aj8DDkJ6AqZ2Drg==
X-Received: by 2002:a05:6a20:3d02:b0:d5:d300:adea with SMTP id
 y2-20020a056a203d0200b000d5d300adeamr2490439pzi.8.1679041180104; 
 Fri, 17 Mar 2023 01:19:40 -0700 (PDT)
Received: from MacBook-Pro.local.bytedance.net ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 p36-20020a631e64000000b0050be8e0b94csm873304pgm.90.2023.03.17.01.19.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:19:39 -0700 (PDT)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v8 6/6] memory: Introduce address_space_to_flatview_rcu()
Date: Fri, 17 Mar 2023 16:19:04 +0800
Message-Id: <20230317081904.24389-7-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
References: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62e.google.com
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

In last patch, we wrap vm_load with begin/commit, here we introduce
address_space_to_flatview_rcu() to avoid unnecessary enforce commit
during vm_load.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/exec/memory.h | 17 +++++++++++++++++
 softmmu/memory.c      |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index d6fd89db64..2bf702dc94 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1123,6 +1123,23 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
     return qatomic_rcu_read(&as->current_map);
 }
 
+/*
+ * We recommend using address_space_to_flatview() rather than this one.
+ * Note that if we use this during a memory region transaction, we may
+ * see obsolete flatviews. We must bear with an obsolete map until commit.
+ * And outside a memory region transaction, this is basically the same as
+ * address_space_to_flatview().
+ */
+static inline FlatView *address_space_to_flatview_rcu(AddressSpace *as)
+{
+    /*
+     * Before using any flatview, sanity check BQL or RCU is held.
+     */
+    assert(qemu_mutex_iothread_locked() || rcu_read_is_locked());
+
+    return qatomic_rcu_read(&as->current_map);
+}
+
 /**
  * typedef flatview_cb: callback for flatview_for_each_range()
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 6a8e8b4e71..33d14e967d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -815,7 +815,7 @@ FlatView *address_space_get_flatview(AddressSpace *as)
 
     RCU_READ_LOCK_GUARD();
     do {
-        view = address_space_to_flatview(as);
+        view = address_space_to_flatview_rcu(as);
         /* If somebody has replaced as->current_map concurrently,
          * flatview_ref returns false.
          */
-- 
2.20.1


