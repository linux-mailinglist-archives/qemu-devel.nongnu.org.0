Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B912D49A218
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:42:53 +0100 (CET)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCArE-0002ci-SB
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:42:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAeu-00024H-BH
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:08 -0500
Received: from [2607:f8b0:4864:20::12b] (port=43923
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAes-0001Y2-6h
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:07 -0500
Received: by mail-il1-x12b.google.com with SMTP id d3so15513358ilr.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WzkIKVsgbL3BkTFsfAwelEbf+OyNiGDSqNoHVUm1RWE=;
 b=SCXtFDXpljyUqYpZ8Zk61wxGCjAk0V4hUbVT+IMQZiCq4Gj3d4L1+fVGMjq6hgJv9s
 eMRVaL6KmL3osxIf07McrxU9nqyyBKSLz0hTUS9XWBeDg0c15J2zMkkcSj777obas7Ba
 pQZEC9Ob9nDQXr4Sc418SvPjhUq6nD+FgtJBcLPZhUSfT0eS0eLaTaVvVJ0ez24qAGD/
 a02EwAuhdvaXvJrW8reH4O/XEl+x8xXVgfBBa6p/r9+Cpo87OHGGhvBU4iVgwv3WiJPC
 d5m3hDv5ChYAMdpgB9/4um2Pg4QqfdPE8AAeCxWe/ZHT46fN0q7G/9JBAxPpGaH2Fzfg
 DP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WzkIKVsgbL3BkTFsfAwelEbf+OyNiGDSqNoHVUm1RWE=;
 b=6+xjLT8TRYYYUT3zrPuoodGNFLUW+tyFHhCQCqiuEYYya139ThYZkHHwi/fYAm/pDV
 DEC1NesDk+Sr/01b4g8i1EBEC7jng2c2QDl0dpEW8G0EnMB8C/20iqGNQc8ujnJnFYN/
 pq8GDmWvG/P68ziAl4bJqupEIxf5rAsRLqMyBodFBxR+2YCPBFG6HBGBdAs1dqSKdZ9Z
 7mv84ZMBkbRj2EteB67GrY7Vo0BlK7SogQ6rf182/uKXmNAP9V3izHkl5dfC5GTw1WFZ
 taSVxW3x+0xTrVWYeCgDWKwZZpi7axfxbRswNocw4su2Mt9N7JOxhjreO/c4nPiuM8Fr
 52KQ==
X-Gm-Message-State: AOAM530t9QJZl10OrCQdO8qY+54HJNZ6WN3TMsJOmxBCn71WzFYVht9P
 DpahGCywbwHjfedHWB2Dk+Lw4gb8vL55WA==
X-Google-Smtp-Source: ABdhPJx7RVpGRzwtrnXVzZqalnrWUtWFYKLFCfQTfZ9TkqGNKONK6wNLEWMw2PksJf5HGiSZujK3eA==
X-Received: by 2002:a05:6e02:144a:: with SMTP id
 p10mr10742457ilo.152.1643074204509; 
 Mon, 24 Jan 2022 17:30:04 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:03 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/40] bsd-user/signal.c: implement cpu_loop_exit_sigbus
Date: Mon, 24 Jan 2022 18:29:18 -0700
Message-Id: <20220125012947.14974-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First attempt at implementing cpu_loop_exit_sigbus, mostly copied from
linux-user version of this function.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 12de0e2dea4..844dfa19095 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -80,7 +80,13 @@ void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
 void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
                           MMUAccessType access_type, uintptr_t ra)
 {
-    qemu_log_mask(LOG_UNIMP, "No signal support for SIGBUS\n");
-    /* unreachable */
-    abort();
+    const struct TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+
+    if (tcg_ops->record_sigbus) {
+        tcg_ops->record_sigbus(cpu, addr, access_type, ra);
+    }
+
+    force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);
+    cpu->exception_index = EXCP_INTERRUPT;
+    cpu_loop_exit_restore(cpu, ra);
 }
-- 
2.33.1


