Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA764B66C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 14:37:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p55RR-0000zy-Uw; Tue, 13 Dec 2022 08:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p55RO-0000ya-0L
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:35:26 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p55RM-0002yN-C3
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:35:25 -0500
Received: by mail-pl1-x62d.google.com with SMTP id w23so15609838ply.12
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 05:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0u/ggCD2dpzlHztgUVICOjgPHyTnEFx12/17GnxGqa0=;
 b=vy/hLU2+rTggSbyvOzwetXdX25lUFmfh3nH6NyG40cc6U70W4FzOqoSCuO0N0mWg0/
 rjiy5eqZnH9d3TGMVL3joUc5Uim8CcjxOk4yxCEj8nqJ5iwvNuwISB7VDL/86KjWa995
 9WXxMazcCDcMsYCvVjgSSplxHeWBXSZo3T3bleI3vCKfTAXCD4gwMZ+81rjaqww6cvAH
 qJQq2mfi2TyRjM8VpCgoBAS+oVhsew7ugLWAV0pNOJHOmTUWDxlV4cjiCzDOqz29noES
 WY8J6SN1qwgmUJf19CRGptUfulPm/gpCBicCjrClcVmw2C/nP0yC+cgbm/McLJbQAPlQ
 PZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0u/ggCD2dpzlHztgUVICOjgPHyTnEFx12/17GnxGqa0=;
 b=dy7YXXOoUsnhbfQERLFyhrNcSFoGo2s2N2C05KcXYwsevv5/CBTkhnV3fQJU5U2Pob
 mJmlGyjuYlXp9CvCZersWCvNkkKDaE3WrldDOtI8y/nYOL2mIRT0VkekpRHTtmiAWi/+
 oU3kLEVUcAM08h9U2U6QJWLWsUahDpeyN3hm7T/uKxXWDuCAls8Kwgms919ks4PaChHO
 926xgjShJHd0+mTWVuhniE5dsubtwhDPDQuxOJPPIomIq99CMAzX+sxTdG0ZlAluSpIM
 0+Ds5fJVG/Rn0hSw+dO1ZfFPTlB3ZMv/rECYdNJwUQMq0LsbyzYtBIC3z+4HAVeymVuM
 y0PQ==
X-Gm-Message-State: ANoB5pl2mB7OFZvQQCIgdRh6RlE6s5qPn6j8sKVb2yzs9zVq0uSExI7s
 sGlqIlVzGEOgFeqX24jZVfDQhSA3GXa8WTpt
X-Google-Smtp-Source: AA0mqf5WJkLFXWrDyCpAqWhxjX3cFqZ6ZL1Ck2T624d22z+S36cypve4YKXoDO/6KSF1ettDv+0nhg==
X-Received: by 2002:a17:902:cf03:b0:186:8568:be7e with SMTP id
 i3-20020a170902cf0300b001868568be7emr25173734plg.15.1670938522776; 
 Tue, 13 Dec 2022 05:35:22 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a170903229200b00182a9c27acfsm8440033plh.227.2022.12.13.05.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 05:35:22 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, mst@redhat.com,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v3 1/3] memory: add depth assert in address_space_to_flatview
Date: Tue, 13 Dec 2022 21:35:08 +0800
Message-Id: <20221213133510.1279488-2-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62d.google.com
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


