Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D346565515D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 15:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8ixi-0001hz-HD; Fri, 23 Dec 2022 09:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8ixX-0001fr-Lz
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:23:40 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8ixV-0000lu-QX
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:23:39 -0500
Received: by mail-pl1-x62e.google.com with SMTP id 4so5116509plj.3
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/oHzdOrXSbYFdgGl9jwSvJhvS7tn2pp+QhccB4A3yg=;
 b=nh1MZ+EgoI0u63LP3Zx0mQ+o3q6wfjclAMnskSld+g7nK12d3ubAOsdsG1Ma4NE/cW
 Pm05Wfq3fEXcvWrdbNPi+avBqxtqHC3uNXGgcBzJ/JpaaQimU4dJzGHMW5qWlZxzoQ6h
 1A+3z/1xQgKnYY9br8eAUo8HZxlu/GsN4TBgeYkk/XSji3XA9xtYA+ttD8rL6VrB6bD/
 TQdENYcnCTpZOzpAiADvCRUdYEfXWNiLjDDAdMo504O97Wvzx0gh7YdTVZQijSe2BY2H
 s5DKh6httFfjIjbMzt1qSABo3g3iYkhZXv5NvEmXW88dnBsWYClvc/VmqoGdjtw5GAGR
 LfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1/oHzdOrXSbYFdgGl9jwSvJhvS7tn2pp+QhccB4A3yg=;
 b=bmOeEf9FyXnZ8gehLnnEdfJwBehVLcR45jf/eV+aKcn8eiDytKp7uAfeBYzLsWYgx1
 E8E/QLaI9taafX3EhqeqvGA7rajCsz7EoRPFCUSqq3TAjOqnOQjQD1QB77CFJ5alDSqY
 6xXZj9gQ9FITTXG8AyGfxf5ZIlcFTK2CX13W/ICCEok1c5QP0s6yPsYtaCisAuqfnu6H
 v/GxWhZnAyhLSnT74JcCMJ8PhnNFbZCqExPacxQnMp5VOJVSHPx+eoZXrzsV8zs6Bnaa
 N+sIbfdcADAA53Bd+buWYVl6e5U5B0b9Ojj/O0SgWu+9sHM6zOubZbd1eCIj+gINNjrx
 dBFA==
X-Gm-Message-State: AFqh2kr3uBiQ1Wi1YkBnbBe8fFsJoGWFJHDvKxHYarKKIjOAz8VWjPhS
 Ii7iH1TKboDzuTyB4ghhVDSFuRmecCdZ2N9N
X-Google-Smtp-Source: AMrXdXsQRmDzWWbiFqoUzcQZ0B33gc+9jHEUIoZy4iMrePCJuQJi8Jqiy0muqP8Qi0BoLW0NDpiQzg==
X-Received: by 2002:a17:90a:7d0f:b0:219:7f29:3152 with SMTP id
 g15-20020a17090a7d0f00b002197f293152mr10641552pjl.39.1671805414778; 
 Fri, 23 Dec 2022 06:23:34 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a17090a6d9000b00223fa0148b8sm4751734pjk.41.2022.12.23.06.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 06:23:34 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
Date: Fri, 23 Dec 2022 22:23:06 +0800
Message-Id: <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
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

Before using any flatview, sanity check we're not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/exec/memory.h | 9 +++++++++
 softmmu/memory.c      | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..66c43b4862 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
     MemoryRegion *root;
 };
 
+int memory_region_transaction_get_depth(void);
+
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
+    /*
+     * Before using any flatview, sanity check we're not during a memory
+     * region transaction or the map can be invalid.  Note that this can
+     * also be called during commit phase of memory transaction, but that
+     * should also only happen when the depth decreases to 0 first.
+     */
+    assert(memory_region_transaction_get_depth() == 0 || rcu_read_locked());
     return qatomic_rcu_read(&as->current_map);
 }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bc0be3f62c..01192e2e5b 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1116,6 +1116,11 @@ void memory_region_transaction_commit(void)
    }
 }
 
+int memory_region_transaction_get_depth(void)
+{
+    return memory_region_transaction_depth;
+}
+
 static void memory_region_destructor_none(MemoryRegion *mr)
 {
 }
-- 
2.20.1


