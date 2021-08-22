Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5423F3D5C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 05:59:26 +0200 (CEST)
Received: from localhost ([::1]:49868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHedp-0007fJ-M8
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 23:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaH-0007ig-KO
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:45 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaG-0000bD-44
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:45 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so3615208pjw.2
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cY+r+qc1fo0mUajc1uVUA6DlV/7AqfXH+Cyy+hdjevk=;
 b=ItsZ1/5YzIOYxk/YudsBeBxuLVspEi7CUCnAIl08eYp0YOfTeDLHP9oiZO3YZMUPdw
 FfSruxRPTHxqFd1PfBZ6iGBO4qXMVLP2+RA86h+5HZbvJfrlklrEysKgyXUmtW4ZANeu
 yF6HD/ayAnX4ccMJZBPnKNDf7urhP7IZ9tUXuZH90uTwrLZ83nUcwM1w83PS0aKBDoFe
 d3YSSUOKJEn9rH/8VUoDY9/FkwLkLdpRUx0ezxDG9HtX1vf3nlxjpIMq7h+RkK3keoPB
 MAMu3EI3hjPNQumjrMOavT1X70oF5/uowCFayC3xNhcyU8Fr45NOxG5Nb9Wg/Jn+BGzf
 RvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cY+r+qc1fo0mUajc1uVUA6DlV/7AqfXH+Cyy+hdjevk=;
 b=halBYXMFbR7CwtX9FRB1V4JlQ1UKZ6L6GAZCLJJtR/yk/agVD7ZB41NC8K1h+rbwEl
 xM2LcEmgkubG/N3Nvf5gvDWWtKnImGSXj0b8AbzbOKJD8Ti7zgpVTiraq8/Ct0mRvSC6
 d7SVP4wnykyRzja2vgf9mNwKMtLKRB5GvBGaJpIviC7vHpnQ6pY2kDLcc1JgfWhz4lkp
 J+fZ5FFNaiLt+CxQQUdGTl5yB90lcNSMEZd9gzYKV90wHH3AYY7VHIW1kUHAH71GLS9y
 0XMYEP/AQpw10Ch2Pi6JsW892CRLmCyr4TCoyEoQgdROr3BPB3cYpvFiYXMKu0jxV2wh
 3h8w==
X-Gm-Message-State: AOAM533e3SG0dfr6MtG6hZKLrnBhHPDMoxZuscAd+1w1I1nANmKTsiY7
 yDQTTHaaq1g//WMxFAvUYuDNEg/K6ZI/7Q==
X-Google-Smtp-Source: ABdhPJyho90SPxm6QhovpritZPQE3a3DFXuZk19yWinn8CZfpxifLPNjdgqePeF8acGFer8Yt2UH9g==
X-Received: by 2002:a17:90a:116:: with SMTP id
 b22mr900846pjb.108.1629604542950; 
 Sat, 21 Aug 2021 20:55:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/30] linux-user: Provide new force_sigsegv_for_addr()
 function
Date: Sat, 21 Aug 2021 20:55:13 -0700
Message-Id: <20210822035537.283193-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most linux-user targets so far do not distinguish between SEGV_MAPERR
and SEGV_ACCERR.  This function will be used to fix that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal-common.h |  1 +
 linux-user/signal.c        | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 536c7ac2c2..9090bbb315 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -40,6 +40,7 @@ void tswap_siginfo(target_siginfo_t *tinfo,
 void set_sigmask(const sigset_t *set);
 void force_sig(int sig);
 void force_sigsegv(int oldsig);
+void force_sigsegv_for_addr(abi_ulong addr);
 void force_sig_fault(int sig, int code, abi_ulong addr);
 #if defined(TARGET_ARCH_HAS_SETUP_FRAME)
 void setup_frame(int sig, struct target_sigaction *ka,
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 5ea8e4584a..0bb369c888 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -663,6 +663,24 @@ void force_sig_fault(int sig, int code, abi_ulong addr)
     queue_signal(env, sig, QEMU_SI_FAULT, &info);
 }
 
+/*
+ * Force a synchronously taken SIGSEGV signal for @addr.
+ * Distinguish between SEGV_MAPERR and SEGV_ACCERR here,
+ * in preference to doing that for each target.
+ */
+void force_sigsegv_for_addr(abi_ulong addr)
+{
+    /*
+     * MAPERR indicates the page is not present at all.
+     * Otherwise, it must have been a permission problem.
+     */
+    int si_code = TARGET_SEGV_MAPERR;
+    if (page_get_flags(addr) & PAGE_VALID) {
+        si_code = TARGET_SEGV_ACCERR;
+    }
+    force_sig_fault(TARGET_SIGSEGV, si_code, addr);
+}
+
 /* Force a SIGSEGV if we couldn't write to memory trying to set
  * up the signal frame. oldsig is the signal we were trying to handle
  * at the point of failure.
-- 
2.25.1


