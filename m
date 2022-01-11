Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A7148B3B7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:24:43 +0100 (CET)
Received: from localhost ([::1]:59936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Kt0-0003mw-EU
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:24:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfq-0005DC-4g
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:11 -0500
Received: from [2a00:1450:4864:20::42c] (port=44655
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfl-0007LC-GO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:05 -0500
Received: by mail-wr1-x42c.google.com with SMTP id k18so34173169wrg.11
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bD0PDqtOotm00lmQT/lZs8XVkkqOyVklOaZCqmm8ZmM=;
 b=F1eAfaZphieMMS6rwNRSadXE8oXaLTNK69dQf8YByZA/0xfinJyFTO4mtV8l+7RtGA
 +RwXEAQOq0F+jwLc7/U+CcScBu8+SaiVPW5C+thjq8f2dJtu09fdfYXchac4HJt3LNUW
 cKk8JldGCgR/J+Iv6Fh9MTtoUHpl4JEmzYoI5VdBQgJwjHPdcYXkPYFDJvLu3cSnCFdn
 k3jBTIS8/eKC5drfU0zkPY5vHB5o/3Ed62Wsi1CDs6IlL/rUUM2HLJFURBh+jWlDvB4H
 Tkd3PXjcqDI6O17E53WSce029r7oymx3rkdNSXO9wd5R5XyK+VoUqcBjtIl9iUEK7KBA
 sRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bD0PDqtOotm00lmQT/lZs8XVkkqOyVklOaZCqmm8ZmM=;
 b=Jew02HBwzk0onzpJ7MhVDHa80JF/6DefWcffOYePiE+DS/6Afs0kA3Rl4VszwZ3H6x
 b1qkTly6HGKYUmUMrfZbmHCwTW4aH8kyeJDvQRKznZ6reFA1nqLQAftwrkx3GjN/oaCr
 KfEZw5GoRzW4UJ78FZB15SLr3QFiVoNcBbGINBXOw3UeUY5lVPmHJTCI3+6eyB/RE+jL
 ACVy6j9vtFJM3m7m+mV6ov5ZljJsYH2bJ/cPoWeYxw2Bb0Z2o3kCQGOVhOrEffSRVkN3
 U592fWNtvujoP5JdtTbJ/oYeoNP6jkewZPUUczB+p6cMYwmWuRm1BJDNyGQoQdw9obvU
 aQGg==
X-Gm-Message-State: AOAM533smX6uxAHTDlr0+fFh+Cal3yBb8rkAqmR6dAAaIbYzUA9u2fbI
 iecnhTLBM0pzKDV/R23BaciMyQ==
X-Google-Smtp-Source: ABdhPJykDA7kA5IWu0h4RQX0vFDYTzyfOXYbLxTWO0HxsPRbZiE6YhSKnJFVYAUC568hZUoV+hYIaw==
X-Received: by 2002:a05:6000:1883:: with SMTP id
 a3mr4811662wri.565.1641921059907; 
 Tue, 11 Jan 2022 09:10:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/13] hw/intc/arm_gicv3_its: Range-check ICID before
 indexing into collection table
Date: Tue, 11 Jan 2022 17:10:48 +0000
Message-Id: <20220111171048.3545974-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In process_its_cmd(), we read an ICID out of the interrupt table
entry, and then use it as an index into the collection table.  Add a
check that it is within range for the collection table first.

This check is not strictly necessary, because:
 * we range check the ICID from the guest before writing it into
   the interrupt table entry, so the the only way to get an
   out of range ICID in process_its_cmd() is if a badly-behaved
   guest is writing directly to the interrupt table memory
 * the collection table is in guest memory, so QEMU won't fall
   over if we read off the end of it

However, it seems clearer to include the check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ef6c0f55ff9..b2f6a8c7f00 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -299,6 +299,13 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         return CMD_CONTINUE;
     }
 
+    if (icid >= s->ct.num_ids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
+                      __func__, icid);
+        return CMD_CONTINUE;
+    }
+
     cte_valid = get_cte(s, icid, &cte, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
-- 
2.25.1


