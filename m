Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF18A64A540
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:51:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4m0l-0002F2-4T; Mon, 12 Dec 2022 11:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p4m0V-00027P-Ry
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:50:24 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p4m0T-0002y7-UI
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:50:23 -0500
Received: by mail-pj1-x1036.google.com with SMTP id u5so338307pjy.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0u/ggCD2dpzlHztgUVICOjgPHyTnEFx12/17GnxGqa0=;
 b=ch+4PeWlXRtcybXSgMcUtBhLUcnMOGnIb7H6NisLQXo9Dm1+7U7upvRGNYX8NF1f9p
 yUYJQoQVz/5aaczI6BUPfoSPe+R1GCo8CwmbhUCJWVR4eDivkkuxvoq7lNTkABuyMUCo
 cnwHXWUZZQ5XAQKC3fkOQvnifEQKjX2HSUHMM6qOMDVGUp3X85f1APVe8gfhSSfFekaq
 tS9ZIMGeSUlH1CIj2hXw115Zw/lFc9Hxco2mXmVLfJz+hGKqgUTOzcDlf6TowEZ5l2Co
 PlV6yfzBCIowJ2fLL+sVUf8MemcPGl2c6BGfeBkcU7XXBOFrn00NErbysI7UrQgf0VGd
 7BRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0u/ggCD2dpzlHztgUVICOjgPHyTnEFx12/17GnxGqa0=;
 b=ToYDU85PeYCGFpBD/XY4CdBxM6icxvr3IGosiL7MIPWz2sq6t9hC6S+pwQNa7OJsGC
 kI1zO8JTTIZhsV2odEUN0cSOIYV91JyKazdnpeXeC3As80QKoptlt/fUDwndxhV5HMjC
 f6VcJIWDmaPfP3Tm7VlvfRFBRzzVqWhJwiLXxJBgZK2bRvMzFG/rTYFsGIRFmhykS+60
 qUq3kX8EEpcWwT+4h9oyo/FaMEHh4LNHALy1Cw4EAfOn7V5FsdS8Oi9UJiie4UdLjqTQ
 hNDw/5+1Ak1jkvZyO6V0O9Cqmk9fK4qchGsdhFC+JhsiumJFEktFzV1wKdkNcf9HwwOw
 v3/Q==
X-Gm-Message-State: ANoB5pmhqWEnZJv27WE424VKwQdKYIO1CLa7wMJJCaEhxavsKpENdQnL
 ZQkPaHkupnfQEmxD/4i4KQ+eoSoC2BL6CRvi
X-Google-Smtp-Source: AA0mqf4z9maOoX5LlcSApKYQDLtCee9WRKcD7ieQ4yxFf9hQY5Mqmo54AWBVlXyHbxS0e2QTQgwQ/w==
X-Received: by 2002:a17:902:c3c3:b0:18d:6138:e4f6 with SMTP id
 j3-20020a170902c3c300b0018d6138e4f6mr13467483plj.29.1670863816390; 
 Mon, 12 Dec 2022 08:50:16 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a170902ea9500b0018f69009f3esm3012125plb.284.2022.12.12.08.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 08:50:16 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, peterx@redhat.com,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v2 1/3] memory: add depth assert in address_space_to_flatview
Date: Tue, 13 Dec 2022 00:49:40 +0800
Message-Id: <20221212164942.3614611-2-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
References: <20221212164942.3614611-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1036.google.com
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

Before using any flatview, sanity check we're not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/exec/memory.h | 9 +++++++++
 softmmu/memory.c      | 1 -
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..b43cd46084 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
     MemoryRegion *root;
 };
 
+static unsigned memory_region_transaction_depth;
+
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
+    /*
+     * Before using any flatview, sanity check we're not during a memory
+     * region transaction or the map can be invalid.  Note that this can
+     * also be called during commit phase of memory transaction, but that
+     * should also only happen when the depth decreases to 0 first.
+     */
+    assert(memory_region_transaction_depth == 0);
     return qatomic_rcu_read(&as->current_map);
 }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bc0be3f62c..f177c40cd8 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -37,7 +37,6 @@
 
 //#define DEBUG_UNASSIGNED
 
-static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
 unsigned int global_dirty_tracking;
-- 
2.20.1


