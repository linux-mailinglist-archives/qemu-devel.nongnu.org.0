Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E9460D94B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:30:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtv-0004wq-0U; Tue, 25 Oct 2022 22:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtt-0004wV-EL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:13 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtq-0001Cl-Qv
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:12 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso996897pjg.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnT5+dpLTwN0CkZJHE3atGpGoan/sbArZdyzXxhv1mc=;
 b=vv9zT1+ZwaFK2G4sLMqNcH+SHmLthWCzV9G7PjabFA5ehZnDquHQ98J6ufrpdcgy84
 kgPgn3CEres2ISA99iM7ew/UxKPhASnPuAgNylTR/oyl0Jv/03ijciN4+IV3gGkT/7R7
 DCk14fEDiU7AjFRpLZOsuAC9wRj++UBv20NROoB/DdakYAiOZfT6oGZqPHbXC7vnxX0T
 MkNsYwLkS6hc1eZB056jb/15CIdhUZwo1Ch0tQV/nMhZ8Qohu+ucgDGEXJ0XIZSyB9gJ
 QXAZxqfyeRinqgrrws7+tEozebaEh3foRtwp28Gj6LdhACR6UDsFb/f70I2AM3iLWqSd
 VXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnT5+dpLTwN0CkZJHE3atGpGoan/sbArZdyzXxhv1mc=;
 b=V66mN2oUTZ3lEEZzUDq11ZFUOVZ2Uy33TpFQycWh0mRRV+PsLdCaBdJQ5o+DqhLSa0
 JaCssVFKyD+X7KsmcSvUwUll0RN65DQ8sEtzPRV5ea9YWkO+S+Nimt2Jthe/EqFOrd7V
 qKnExUEcPCB2pZ7FagFSppRRqd26ONCGIcugj46MNKf8y7FEdbfkZNlmXUYZyZ+DNT7x
 cN+d3XZgwZGjrPPBtBWUdZjcvuXEBFmyrYTOPibq2rUBCSfqjiZvZ1zIR0/DOHJvNyUf
 zoL8FkDvJb3NURrR4zqGddhegyJLKTyqFKDljQoTSB+0DZgKHHP2WkbGjuS8ChSNdz6m
 /WFQ==
X-Gm-Message-State: ACrzQf3hu64xVqTMm6wzQOF6X61+//e6czKWSO6x1RUuxkTGfLlvxbad
 quYemfA9XKwwUbe94ue7hhc+jczU9jKNNeqm
X-Google-Smtp-Source: AMsMyM7Z+eLKcAvc1EzEm/rBGFuTuCH7uWy6Ia4rP+22U9b3dTdyXdf930jI8LF2Q8HADpphfWDcig==
X-Received: by 2002:a17:90b:394:b0:212:19d7:9072 with SMTP id
 ga20-20020a17090b039400b0021219d79072mr1477820pjb.69.1666750329412; 
 Tue, 25 Oct 2022 19:12:09 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 16/47] accel/tcg: Rename tb_invalidate_phys_page
Date: Wed, 26 Oct 2022 12:10:45 +1000
Message-Id: <20221026021116.1988449-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rename to tb_invalidate_phys_page_unwind to emphasize that
we also detect invalidating the current TB, and also to free
up that name for other usage.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      | 2 +-
 accel/tcg/tb-maint.c      | 2 +-
 accel/tcg/translate-all.c | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 1a704ee14f..1227bb69bd 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -105,7 +105,7 @@ void tb_htable_init(void);
 void tb_reset_jump(TranslationBlock *tb, int n);
 TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
                                tb_page_addr_t phys_page2);
-bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc);
+bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc);
 int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                               uintptr_t searched_pc, bool reset_icount);
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 15ec2f741d..92170cbbc1 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -657,7 +657,7 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
  * TB (because it was modified by this store and the guest CPU has
  * precise-SMC semantics).
  */
-bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
+bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
 {
     TranslationBlock *tb;
     PageDesc *p;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bef4c56cff..aa8d213514 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1382,7 +1382,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
         if (!(p->flags & PAGE_WRITE) &&
             (flags & PAGE_WRITE) &&
             p->first_tb) {
-            tb_invalidate_phys_page(addr, 0);
+            tb_invalidate_phys_page_unwind(addr, 0);
         }
         if (reset_target_data) {
             g_free(p->target_data);
@@ -1580,7 +1580,8 @@ int page_unprotect(target_ulong address, uintptr_t pc)
 
                 /* and since the content will be modified, we must invalidate
                    the corresponding translated code. */
-                current_tb_invalidated |= tb_invalidate_phys_page(addr, pc);
+                current_tb_invalidated |=
+                    tb_invalidate_phys_page_unwind(addr, pc);
             }
             mprotect((void *)g2h_untagged(host_start), qemu_host_page_size,
                      prot & PAGE_BITS);
-- 
2.34.1


