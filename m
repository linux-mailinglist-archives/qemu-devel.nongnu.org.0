Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3791DD73A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 21:29:53 +0200 (CEST)
Received: from localhost ([::1]:37524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbqt6-0005Pq-6m
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 15:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbqgO-0002uV-8U
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:16:44 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbqgN-0000UE-Cp
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:16:43 -0400
Received: by mail-wr1-x444.google.com with SMTP id x14so2391574wrp.2
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QclnVfbMD5AWwXuMc23KpxYEB+63sc4bwxzl9PH81Kc=;
 b=q00LdH/Qnak1rTF4RpgBiLsbS142SFQf+ZWd8cWg++WHG4YJ7eH7Vg5jX3+UWlUYI0
 OKrkRc4q9rmUZu0xMJjB+5rYV30FF/TLEZcLwqhqJRRVhCqRuEJeNKUDplkUHd48Hv+P
 Su1hDfkR0nwXN3jqf13f9s6MoFvRGrzusP75b27KHawaRiAUkqcjmCZ9qBI5jywqEK2L
 glhe35Iz6DacXUH5zHYjlwKBjcVlsxzVFecMTDmYNmtBzXvoJmIvUOaGBD1yrNi/qRLb
 zaRiFp+mknFT31F2FL4TeQse5sAkH7lxeCWkN3N8nuMniAh5zVsr8n9F6ImQviJvzj3+
 rPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QclnVfbMD5AWwXuMc23KpxYEB+63sc4bwxzl9PH81Kc=;
 b=C0S6isn4v8FwjXWXyqXH4o28CWpCUYHOsgOn211y2BIpobIHOdL552hMa80VN8CnjL
 9PftO47JM3SixhA2quympGAznOU56jz3zdn0UXUmbrwKwRhu0ngP4P2KSdRMTs2Qynyn
 0V1xpZIQ020Py0EfiN4n9FuTjhyV4gYZGvH5rhXHpT6CIA5fASiiZ3YEm9INv9AboD0Q
 WaDzUGZdAizpltgtnuJkO15iakavqlCSqQJ1VRFHIdqeyZb4dNi81NBeNKSAAS6qIya6
 Dv+KoOjrTu+VyVZ7mqtYAu0fZZLEf55T8Zmb8xWI/QxF43UoCZLQYMfkHHjNsKx8p9Qz
 ZaNw==
X-Gm-Message-State: AOAM533iCi+aUjYsn4O+AthkwrSZHFd4XATrb2iOywDDt5DXjM9uUtbc
 5oQsaYQ02gO2g6qfOipVlXmY3EcTKpUj0A==
X-Google-Smtp-Source: ABdhPJzdxCYqxF47TQzqlOXFAYSJwWyHrdv/VK8dDjTPMa1x5HdSVhgpKQwCQM+xdUwjsPReqaOdZg==
X-Received: by 2002:a5d:4e41:: with SMTP id r1mr92132wrt.420.1590088601733;
 Thu, 21 May 2020 12:16:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z124sm7335100wmg.20.2020.05.21.12.16.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:16:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/29] target/arm: Use tcg_gen_gvec_mov for clear_vec_high
Date: Thu, 21 May 2020 20:16:06 +0100
Message-Id: <20200521191610.10941-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200521191610.10941-1-peter.maydell@linaro.org>
References: <20200521191610.10941-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The 8-byte store for the end a !is_q operation can be
merged with the other stores.  Use a no-op vector move
to trigger the expand_clr portion of tcg_gen_gvec_mov.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200519212453.28494-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 991e451644c..4f6edb28927 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -496,14 +496,8 @@ static void clear_vec_high(DisasContext *s, bool is_q, int rd)
     unsigned ofs = fp_reg_offset(s, rd, MO_64);
     unsigned vsz = vec_full_reg_size(s);
 
-    if (!is_q) {
-        TCGv_i64 tcg_zero = tcg_const_i64(0);
-        tcg_gen_st_i64(tcg_zero, cpu_env, ofs + 8);
-        tcg_temp_free_i64(tcg_zero);
-    }
-    if (vsz > 16) {
-        tcg_gen_gvec_dup_imm(MO_64, ofs + 16, vsz - 16, vsz - 16, 0);
-    }
+    /* Nop move, with side effect of clearing the tail. */
+    tcg_gen_gvec_mov(MO_64, ofs, ofs, is_q ? 16 : 8, vsz);
 }
 
 void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v)
-- 
2.20.1


