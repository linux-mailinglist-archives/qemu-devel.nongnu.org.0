Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E66E60D94D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:30:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtj-0004to-Qu; Tue, 25 Oct 2022 22:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVth-0004t8-Cn
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:01 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtf-0001AU-VG
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:01 -0400
Received: by mail-pj1-x1033.google.com with SMTP id m2so8713346pjr.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ckxXpvB+UzHhX2Kt++OpD5XHQD1pSGLuWje3pRHkgZA=;
 b=qyrLQh+Nxn9yseRBns42h+0Ji78k5h9kGM4iS8JoX2wzZOBXVpuShnwy3yUhNdHx3j
 NYhYiL8p/b+UkgTmE7bm/KI2w6QQ6BsQN4GJA4q0grV8kjg9dBAXLk7LShr02CVGnPIY
 /V58v/E/3mxe+XBOjbUFxwVD9zTcLRttXJOXb87sKTPG8JEuTIvEZVNP1qkD4NkV6mUS
 nJVViW03hzo9BpAsgLs+F3BIDY4CkdQerm6VZ5Pmmwp6s39kOqzZ+UALAD58s01fP/15
 y66JAixHDdL6GXZpOBTFeFVTnAgTKIEPqMYHH7QLPOzoVf7JT3v4lHEopR0Ior/y1iFF
 aONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ckxXpvB+UzHhX2Kt++OpD5XHQD1pSGLuWje3pRHkgZA=;
 b=4YLpwoTrlmsmWg86yzDUpQYJezPYL239SzuQNopJgZWLWA8pVlYFaYydxk8Sv9mfNB
 /mb2JE5Ww+UnJDZYop5cdbHwbCKRnvtenglwQVHJtZWUU4OEngw+fRO6ABu0KLdLM8Gn
 kcFTQTxl3E3BTaoxjD91hPMyRzrz5ro3PmvvK31qLCzPwot1boaTpqDoYZhc5HGLRng1
 /pme31cMpyXo7JoKmwTkcXDSzaSRUIUKL7HkmXUrhJfA6hYPLuETPMmYQck6lFq/Mrqx
 voWTsLTiFgk/syL64SnJ2VRn8gKafOC9rAnzBwrwbTVVFJU0eLXcPg0z2ImrJANtI/VP
 I1LQ==
X-Gm-Message-State: ACrzQf1ewtlse3FFv2m4hEGEfaVnXtAFZsjt7ua6OECrl07iz+448Pts
 UV5xCmdPcXwQr1HaTnk/rXFPMWMoWPxjKDKy
X-Google-Smtp-Source: AMsMyM5WQcjAOyBqg2+NdrCUVpMN+xlN3kstzSW/g39oETZFvTA3sz+qgOd8I/h4Njsdfm/I/Xu4xQ==
X-Received: by 2002:a17:902:d2cf:b0:17f:7b65:862f with SMTP id
 n15-20020a170902d2cf00b0017f7b65862fmr41353203plc.168.1666750318621; 
 Tue, 25 Oct 2022 19:11:58 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 12/47] accel/tcg: Move assert_no_pages_locked to internal.h
Date: Wed, 26 Oct 2022 12:10:41 +1000
Message-Id: <20221026021116.1988449-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

There are no users outside of accel/tcg; this function
does not need to be defined in exec-all.h.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h    | 5 +++++
 include/exec/exec-all.h | 8 --------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index a77b110b78..1a704ee14f 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -90,6 +90,11 @@ void do_assert_page_locked(const PageDesc *pd, const char *file, int line);
 void page_lock(PageDesc *pd);
 void page_unlock(PageDesc *pd);
 #endif
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_DEBUG_TCG)
+void assert_no_pages_locked(void);
+#else
+static inline void assert_no_pages_locked(void) { }
+#endif
 
 TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e5f8b224a5..b5bde1b56a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -642,14 +642,6 @@ extern __thread uintptr_t tci_tb_ptr;
    smaller than 4 bytes, so we don't worry about special-casing this.  */
 #define GETPC_ADJ   2
 
-#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_DEBUG_TCG)
-void assert_no_pages_locked(void);
-#else
-static inline void assert_no_pages_locked(void)
-{
-}
-#endif
-
 #if !defined(CONFIG_USER_ONLY)
 
 /**
-- 
2.34.1


