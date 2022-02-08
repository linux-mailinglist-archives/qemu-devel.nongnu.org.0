Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04774AD4A9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:22:29 +0100 (CET)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMhg-0007Ux-41
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkn-0000Pb-AA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:35 -0500
Received: from [2607:f8b0:4864:20::1029] (port=44800
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKki-00018d-Re
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:31 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so1787201pjh.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xAVP1v46orjMrIoCb3miSswpoEMk3ZlxrVr6Eb87UTs=;
 b=oPgcIO/DwkUyxrpQmSuOGmDH6y+oLuV7gk7tfeZO0b9686Qhjwe6Xq45J9lKmfPSeA
 O9+VzvfBxZwAH1scxKlN6OkcIKPF3iqRqzmbRVU+ZYDS9VidcWQ8THp7J4WaPNl47cum
 W0wpJavwcYHIq/FYGDNe0iA2jzqMp0GB8zYhLBKttSLMW7qhPs/zNsev6Ih3FXgeZmC/
 hcCA/U8pWmyzwqm0rzjp90IcMe8qvuc8rCx+kVrpaRTJSfzzaznDqHA83Pz1d1PwjzgB
 RbUxlaawMq63p9eaxeJDpQ+8hAsHDCXtEE1HvP+MVaUewX1Ui1+eQCjLmXEkRxLHvKVg
 udGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xAVP1v46orjMrIoCb3miSswpoEMk3ZlxrVr6Eb87UTs=;
 b=zOL0PDPZLUEWA6kXVWUmrtMKhekSzfsY9vKo/QG9nLJCaphpApjcBghxmQ0Z6kM5uY
 FW1dv3i1PJFbOWxbwYgYwzhzeNaRNtB0Xcz+ej32Y8DuWh9PJ1AE1zbjpttnsh9v8YwM
 XKqxGWxsKVfYo7smBZHlm+kFgoTW4Va1jff9YRBN6x83SVLdDQlopBg5eqowpA91jr56
 Cf9ukQAQy5Low2O4H1GyHIAsOcVf1I4tZgKeRmQf2xoSNY0PqQwXYu0H/MS1oUPrHd+f
 3cdeTMl9HmtldZT/tg/cFKt78P912DN4QfeRxtTYVqHwo2YHXEZfPhE/rbRLZUXxXX9p
 2NNw==
X-Gm-Message-State: AOAM531g1mX8o448PbZFlJG7CNQxC5Shi5zyFns9L1cxoGtqXlVJdQl7
 T/CioOO3WqrMUnwWWGUnmBWvjbUfjqWIsg==
X-Google-Smtp-Source: ABdhPJx+EywqFySp9FIRwrJaLZczbA8a01abyR3ieNnxY/VfaH9M5l3oI8hWs5+QfJmS91a/6c9ssg==
X-Received: by 2002:a17:90b:3803:: with SMTP id
 mq3mr2906786pjb.95.1644304646768; 
 Mon, 07 Feb 2022 23:17:26 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id mi11sm1543422pjb.37.2022.02.07.23.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:17:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/8] tcg/sparc: Convert patch_reloc to return bool
Date: Tue,  8 Feb 2022 18:17:07 +1100
Message-Id: <20220208071710.320122-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071710.320122-1-richard.henderson@linaro.org>
References: <20220208071710.320122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 7ecd02a06f8, if patch_reloc fails we restart translation
with a smaller TB.  Sparc had its function signature changed,
but not the logic.  Replace assert with return false.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 088c680f37..ae809c9941 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -323,12 +323,16 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
 
     switch (type) {
     case R_SPARC_WDISP16:
-        assert(check_fit_ptr(pcrel >> 2, 16));
+        if (!check_fit_ptr(pcrel >> 2, 16)) {
+            return false;
+        }
         insn &= ~INSN_OFF16(-1);
         insn |= INSN_OFF16(pcrel);
         break;
     case R_SPARC_WDISP19:
-        assert(check_fit_ptr(pcrel >> 2, 19));
+        if (!check_fit_ptr(pcrel >> 2, 19)) {
+            return false;
+        }
         insn &= ~INSN_OFF19(-1);
         insn |= INSN_OFF19(pcrel);
         break;
-- 
2.25.1


