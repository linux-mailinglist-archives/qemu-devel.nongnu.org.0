Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338AF6F15A4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:35:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLRG-000277-6F; Fri, 28 Apr 2023 06:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psLRE-00026X-MW
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:34:52 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psLRC-0008Nh-TU
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:34:52 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94f1d0d2e03so1457845766b.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682678089; x=1685270089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4MZ5YwriW2UueUqI4cjUV26ay0Vpzwv+Cy5oHCSRXGc=;
 b=gjNfS+DVBZhYKozFb3x9corV06B+bKz2Vg6giYOTLcAZsHBK/d2be4O7WOZq4+PVXP
 tFhhAfgiyvLzEYWOnowIn1CxKlKP3In0U8kSi4m4Tx6Ike/T2gdPxFK+R/DGyUUUVcAF
 I22wLlhXEyrWSN6xmwGHqgSMSuIRgF4Wt6TZPI6nj5gLI/V8h3ntW5wTTb6qNb7t/24M
 lilz7UMR6NsXkROSNVsV7BWqCAnuB6SVI9a6UzAy+lLyxKtupublMoDVq9CPVtF+QV/I
 O94yNrRgDvyciyICaLf2aDamr1RooycFnhgOj8sgGNeeK3s5khvFRG89EQ0rw30HYbmC
 mbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682678089; x=1685270089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4MZ5YwriW2UueUqI4cjUV26ay0Vpzwv+Cy5oHCSRXGc=;
 b=XPEld34DeEp+tfWWm1L1xvCshwJQe60x2AYFJjzzT0aa2L8ghdQmhnsCRm6B9anlWQ
 IEVMzXdxzPtb4lSGEiM0K5ZBKtftlHFhi1yHoL2c32/09OghkPnbUbXizjMFwql+Afii
 77bOOrbAZ81MHkmGriL+KW4uY56DzJzdGrww71vOxrQuosF67iEX63yPtX2gcjs/RSak
 Dut2sqYMtcuS1KFFMAgXEsfF5GpoPocIn74o1UMVEOQps1gzxyWZ02V26ZOo68ZYFmJi
 SowFVduUOdOYwXamfwGOvUxs9CQF7cSDE+dLPXLc0sfR6U/fuMKLTxrEITyH4bfxN60Q
 7o9w==
X-Gm-Message-State: AC+VfDyGsWlUPK1DS4bvK668le/2FypCbS4mwmHqVpFvrlur11qT9z87
 vkr3SpDaORWoV3bog8yOZUji1NGvneqIijazycI+DQ==
X-Google-Smtp-Source: ACHHUZ7jLzoh7cFMmfzxE/2ufT+Oy4prDILGEbHtM3wpTKpwtF12uFh5l+XnFAI/q5XVrAA8o0O4LA==
X-Received: by 2002:a17:907:a40d:b0:94a:6cc0:aa09 with SMTP id
 sg13-20020a170907a40d00b0094a6cc0aa09mr4299558ejc.9.1682678089125; 
 Fri, 28 Apr 2023 03:34:49 -0700 (PDT)
Received: from stoup.. ([195.167.132.10]) by smtp.gmail.com with ESMTPSA id
 s1-20020a1709060c0100b0094f66176208sm11110495ejf.95.2023.04.28.03.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:34:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [PATCH] softmmu: Tidy dirtylimit_dirty_ring_full_time
Date: Fri, 28 Apr 2023 11:34:48 +0100
Message-Id: <20230428103448.3811208-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
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


