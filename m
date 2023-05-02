Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322856F429F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:22:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3e-0000cz-4e; Tue, 02 May 2023 07:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3c-0000cK-Om
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3Z-0003D0-Gn
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f315712406so164142545e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026425; x=1685618425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czFfn3mdhb3cc0K7eXA/dlkeA2fEfLq9sRo8IDRWWf8=;
 b=IRVd2Vwb0TdoBgUwmVtAFHzAS+H/1hph9EcoWK6yXDvJYJ3XoW+q2U80NJksO9bhJd
 DZ6Q4EIQ9HshCyn+5c7S+rbzHu42DWPn3sKzs3PBjpAoPm6k7zOCckN/Ji1MO9ZTiwp+
 nDVRjWnJVoj6sFI3BD+qGmeTIqaZRs9dYaY2EdDGhsu5bw+/iX7MLo5TDmhSmtPgXn/Z
 0f4Hw1RfpO2gxrXGNWfRLlknJFzIawEsP/8L7Yjlut9sK3hcd2CzCzEtz0mZ6znedNpk
 jtgtBCUmluIqt9fd50XMguUH8e6z9GHY1m95SEarfAkXBCqp8xaGw6sUKPzYn3XX6a92
 Dvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026425; x=1685618425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czFfn3mdhb3cc0K7eXA/dlkeA2fEfLq9sRo8IDRWWf8=;
 b=KNfDsEPkgL+JRETsEb2I0toKVVW/hNgvr1YOs8YUuiCP4MmOC9npo1oo3Cnlz/DMLD
 0Drc6G87x1dCoBdHBO4ym2m8em9wCloa3vrSGJp+mV6Lie/wz0crCNtlLuje/NZ6ykmU
 1aNOt7z08iJyDQRp5b7vO6C5DB488E1jupuX/IMjXRQ6mH0Xv+Wt825M5HRWmoufQZ54
 VgDoAn5V9Ew17zQtrzJEvJ1oOMtmPhTEur6k54xJXc82pTWkMsSrw+j21dMX641Rgl/g
 GUOFPTXfY7s6kIZAMTsK7cST9uh58bY4pN4dqFlJ5AhI7a7fu2r3arUwv57unfr6LkwJ
 Qf7Q==
X-Gm-Message-State: AC+VfDwgvs1IW0gQxPuR0nV1jdTbQN/ZcVKyItYH+8m8jgT2eGpzPPfY
 dvknkbkws+AceQ3fw9egZCpXWylJzRpSNRTplT+ltg==
X-Google-Smtp-Source: ACHHUZ4sAROn5F4sj65B8M1QfnrLHPx5m8Oondb1ARq/4R8UV0JBmWwg10JEPYJbstC2FACkbBCR6w==
X-Received: by 2002:adf:db4c:0:b0:306:31cb:25fb with SMTP id
 f12-20020adfdb4c000000b0030631cb25fbmr3214433wrj.17.1683026425307; 
 Tue, 02 May 2023 04:20:25 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PULL 01/12] softmmu: Tidy dirtylimit_dirty_ring_full_time
Date: Tue,  2 May 2023 12:20:12 +0100
Message-Id: <20230502112023.776823-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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


