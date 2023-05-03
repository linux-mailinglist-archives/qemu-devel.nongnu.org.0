Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF66F5193
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:31:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pD-0007VS-DE; Wed, 03 May 2023 03:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oq-0006nC-4R
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oj-0007Gw-24
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so46397395e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098543; x=1685690543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czFfn3mdhb3cc0K7eXA/dlkeA2fEfLq9sRo8IDRWWf8=;
 b=JtNtM5mU/Sx4s4CCdz34ODajSonIkcNUGY8EhUAksM0OX+y9BTiFv32nCtcHPeCWYW
 qqeixvAUYJWK+7W9v0KQQk916okscfAshKBzqMIp8row5ExnXjzKO2S1pCbXGPOfFp7h
 P69xs6o8lgtcoWDmVa7naZx63u2/m5d9nUab9sN+OjhbB7nFvM79OGpufdU6bipy2Ecw
 isXD+pId+JzLEtXfBzQOUkKSG8/+MbNjmPKEPAM4hB9nH3sxz00NsnH8zaQe1PDl24pH
 vhinJAG0w7/VFSylfkngvB1qziY1PsGQcH6ZVxQA6XI+1f8RFljXwQL3Ytz7zd+XYoy5
 RR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098543; x=1685690543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czFfn3mdhb3cc0K7eXA/dlkeA2fEfLq9sRo8IDRWWf8=;
 b=VE6Um6XVeLsBQdKn8Z4/a9nLAlgPeQVCh16Srdj5RYqD0HhngcNq5PN9+maqFrF3i3
 GZVNKV88ZKK4/HuShqQO46cQXbYNraPkASMiz+PtfNCQP17DXO0ig4iXqIjO+Sm8BWya
 m38tZGM7FJvwtQqmRPVxqYM21f3Co38utefK4P+8gEfDdMI9V1SSFI4IOHgicfqla0PD
 Kfby6jmIk4Wbo/8T8tTh3diN+mS2HNXRjauAZYlq4bvhEk524bnkKabIf9X9PDM8lrPa
 Ug7cQh/1B/+aSJ0k2qS4N/rzQQaA6ylGuYoX1bZFQW8gpdIGIZB2bVqXL+IxBEfBNUyb
 tG9w==
X-Gm-Message-State: AC+VfDwJo9ZMVFh9B8Fb1H7bGBqEKAD3zEhqo/VPubSBDfrDqoQDidgO
 mDKnshrtN5HuOBKyDvQ13EDmx/8CMOtsStDW2XKPJQ==
X-Google-Smtp-Source: ACHHUZ6DoNEgZHbXHVtfWZmIsNU85em8tZE7Fb2x8ZXxZEzqvenFPhNs7BqqiM6hfi9T9Zt3XWYAIg==
X-Received: by 2002:a05:600c:2183:b0:3f1:76d7:ae2b with SMTP id
 e3-20020a05600c218300b003f176d7ae2bmr14290163wme.13.1683098543097; 
 Wed, 03 May 2023 00:22:23 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL v2 01/12] softmmu: Tidy dirtylimit_dirty_ring_full_time
Date: Wed,  3 May 2023 08:20:46 +0100
Message-Id: <20230503072221.1746802-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Drop inline marker: let compiler decide.

Change return type to uint64_t: this matches the computation in the
return statement and the local variable assignment in the caller.

Rename local to dirty_ring_size_MB to fix typo.
Simplify conversion to MiB via qemu_target_page_bits and right shift.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/dirtylimit.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 82986c1499..71bf6dc7a4 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -232,18 +232,23 @@ bool dirtylimit_vcpu_index_valid(int cpu_index)
              cpu_index >= ms->smp.max_cpus);
 }
 
-static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
+static uint64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
 {
     static uint64_t max_dirtyrate;
-    uint32_t dirty_ring_size = kvm_dirty_ring_size();
-    uint64_t dirty_ring_size_meory_MB =
-        dirty_ring_size * qemu_target_page_size() >> 20;
+    unsigned target_page_bits = qemu_target_page_bits();
+    uint64_t dirty_ring_size_MB;
+
+    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
+    assert(target_page_bits < 20);
+
+    /* Convert ring size (pages) to MiB (2**20). */
+    dirty_ring_size_MB = kvm_dirty_ring_size() >> (20 - target_page_bits);
 
     if (max_dirtyrate < dirtyrate) {
         max_dirtyrate = dirtyrate;
     }
 
-    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
+    return dirty_ring_size_MB * 1000000 / max_dirtyrate;
 }
 
 static inline bool dirtylimit_done(uint64_t quota,
-- 
2.34.1


