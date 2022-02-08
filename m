Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053204AE086
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:16:34 +0100 (CET)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHV2X-0003zn-4B
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:16:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLn-0001MD-5c
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:15 -0500
Received: from [2607:f8b0:4864:20::42c] (port=38686
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLk-0000O8-FZ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:14 -0500
Received: by mail-pf1-x42c.google.com with SMTP id e28so19429579pfj.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ha1poJJsMbEmVT2TWrI2VeQn1cQITks/LrH1hi0Yo+M=;
 b=edHs5JyHYxayOIUJSq6aIrr8cAiscbGxtNNij27g8yjUVcWon3Vz4udruDuZjAQX/B
 xVC5HSXms6Z99jUHSAQ75gpX5LbnduO8f410/4Rjel6me50aquW+hnMVG2Tbkh01ulRk
 zcQtgjzn70apHocJX01pmzct0v6U+YsZ6ay0WzoBLplgCzYVui9y8wNsUnCCnyCpDGlp
 L/q8GZtZJ7xsmkQjHCPkhIp09ruZNkW1yN3mvHv7YWWvYDqDUW52n2cchSwdOfsbOPSl
 udadMCWo7/ozXOBbh+6uvXOLCSGwzdDEEu/EGi/odJasABdZGbeow/Ur8mJGKFC5o+j4
 OORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ha1poJJsMbEmVT2TWrI2VeQn1cQITks/LrH1hi0Yo+M=;
 b=LQj1291KFm1lsvjYNwsC+TPvDIR2m9+MPVFX15mRgiZLxqETtaaIza+TVVvpNGJzqx
 JoUemp8knqxn3rj0hKAbs24EKSWQ3nCC7aggVk1Vq+2wFouL16ZXqcVxJPRhlCH5rF+e
 MtENIPSlMTHFPQfrCC7SRB4sDHwfN3tSuId1W0B3EjBN7QPBtsnd/LaCjj0M7pQCa9Ki
 fGIM2nilDPbyJ30dH2cnHULEfdc/7R4MEspTx4sHuGTtseFfKKXoFXxkyzKvA0vs8i/N
 8ihfJDsJML/Czrc/MbTWYSaoyV4GPSUyAHod34uO0zmL2xVf5iBrv6TRU3B3ywSasXXH
 Dd9Q==
X-Gm-Message-State: AOAM533RM2+nqd30TZFP6oSgxI7XsoJ12F6/V5nNo6XdBQFLPPZRl/yA
 DADLoXWUdmMg9WdGk/Z4356ON91WuRg=
X-Google-Smtp-Source: ABdhPJzdfe3yio6xsl38g2VT8bjV2nvFoqpbqIt7KcLq1wGLGHsel6MhxV7V3ZG4MXMvZ8zR10mLJg==
X-Received: by 2002:a05:6a00:2350:: with SMTP id
 j16mr4887278pfj.78.1644333841523; 
 Tue, 08 Feb 2022 07:24:01 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id il18sm3304997pjb.27.2022.02.08.07.23.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:24:01 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 09/13] target: Use forward declared type instead of structure
 type
Date: Tue,  8 Feb 2022 16:22:39 +0100
Message-Id: <20220208152243.16452-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The CPU state is forward declared.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h | 14 +++++++-------
 target/xtensa/cpu.h    |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index f705d6bfa6..ac6e03e2f2 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -134,14 +134,14 @@ struct r4k_tlb_t {
 struct CPUMIPSTLBContext {
     uint32_t nb_tlb;
     uint32_t tlb_in_use;
-    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
+    int (*map_address)(CPUMIPSState *env, hwaddr *physical, int *prot,
                        target_ulong address, MMUAccessType access_type);
-    void (*helper_tlbwi)(struct CPUMIPSState *env);
-    void (*helper_tlbwr)(struct CPUMIPSState *env);
-    void (*helper_tlbp)(struct CPUMIPSState *env);
-    void (*helper_tlbr)(struct CPUMIPSState *env);
-    void (*helper_tlbinv)(struct CPUMIPSState *env);
-    void (*helper_tlbinvf)(struct CPUMIPSState *env);
+    void (*helper_tlbwi)(CPUMIPSState *env);
+    void (*helper_tlbwr)(CPUMIPSState *env);
+    void (*helper_tlbp)(CPUMIPSState *env);
+    void (*helper_tlbr)(CPUMIPSState *env);
+    void (*helper_tlbinv)(CPUMIPSState *env);
+    void (*helper_tlbinvf)(CPUMIPSState *env);
     union {
         struct {
             r4k_tlb_t tlb[MIPS_TLB_MAX];
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 02143f2f77..f2165b17e2 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -344,7 +344,7 @@ typedef struct XtensaGdbRegmap {
 } XtensaGdbRegmap;
 
 typedef struct XtensaCcompareTimer {
-    struct CPUXtensaState *env;
+    CPUXtensaState *env;
     QEMUTimer *timer;
 } XtensaCcompareTimer;
 
-- 
2.34.1


