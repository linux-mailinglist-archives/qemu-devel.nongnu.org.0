Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6D5F5F5C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:14:20 +0200 (CEST)
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHL1-0002kT-FS
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIE-0005Ll-Pv
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHID-0006wm-76
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:26 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f193so775413pgc.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XKi0KiOHBCUPDLzrT9NwRCd9j8+52HKhkr0TSVC/nhM=;
 b=Dc++RPn/lkSWr2vwfSJqXInovYLrJ9aoMh/0ptHmXE1Jd7RBHfGyfTRq6UDYIral5b
 fRCWCG2tOUeleFVoiUhog2MhR4RlSUeMKrbbXgx+ZH8w3C6mgmLWsRTlEJldOnkuKWXC
 K/Im9+Ef6UoaIMxim6Onrf+6wJjE/aiL2h6ZX9z7zl5s/NLeMlGtfeCyTZ88KCXJnvl1
 01D/g1x91Ln8H3pYOYDeHUu/8GZlvcuyDBEjodk1SOXXvr8HsQ9GncDz8rHw8G+nE1f2
 aa+27V1iVpk7AIHpy+zuGjEr/EFOsLqdUllBtd8mVs8zy+ZeXmu6sHxL0VdqIPXypHXf
 GH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XKi0KiOHBCUPDLzrT9NwRCd9j8+52HKhkr0TSVC/nhM=;
 b=GDISoJlvrcLOi53ttEBHHbA7YpRF1sdFl+HeLLL+C6udmfJPBxzz1gMTxPbd3g+OMf
 1YFxoJck6OiuQIkD7jOCQojvGExExQHWqy1ucq9EZyK2UDMxHXL+ZJf55GP60d0woWIF
 0GR3yp9YH3LiUyWa+GpVwvzOz8yD77bYyiijxxMEN2tTbxN4hY4vgYGbMNQmPXZ6XZP/
 mYsQITk99ZMdFncbsY0FAn6dlpj0peHtN6gfs/cBP1nYoKYK0kHehsIQbQJdHVb9aaCM
 OKOhxADI3bBqfDYajACdLGdFKhtNuvzaV/yornOxrsDgSTUChNEG2YdPnMl42DCXJEEM
 ylUA==
X-Gm-Message-State: ACrzQf1UXTMQUG1sgIm3EBXBFekO0WI1msVW2Gi28AS3xnahSMWzbaAK
 VC40vzfQOM/GqddQFh/HbV6Krztg9pfBmQ==
X-Google-Smtp-Source: AMsMyM4jHr2z9uXdljVY3l7vAbhKq3v3E0cvo0jSH+Qj/FwrWokZDAaL46AfcZQOxIYOlYVU93U80A==
X-Received: by 2002:a63:da12:0:b0:43a:18ce:f959 with SMTP id
 c18-20020a63da12000000b0043a18cef959mr2521841pgh.386.1665025882776; 
 Wed, 05 Oct 2022 20:11:22 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 06/24] accel/tcg: Move assert_no_pages_locked to internal.h
Date: Wed,  5 Oct 2022 20:10:55 -0700
Message-Id: <20221006031113.1139454-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are no users outside of accel/tcg; this function
does not need to be defined in exec-all.h.

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


