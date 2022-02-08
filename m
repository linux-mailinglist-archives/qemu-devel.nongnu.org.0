Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178D04AD273
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 08:44:17 +0100 (CET)
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLAd-0007O3-Jy
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 02:44:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKgK-0007Dg-05
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:13:00 -0500
Received: from [2607:f8b0:4864:20::636] (port=45812
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKgI-0000Sn-55
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:55 -0500
Received: by mail-pl1-x636.google.com with SMTP id w20so3859779plq.12
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xkQSSfw7Pzh/MwPufzIC/bP8BbJT214j9m8GQ4wb+68=;
 b=a7VmFXtfLaVD2u83SHaHUP5olYh09h1HNgHMuQ8rcR+CnzgGbwevYKk0RTL/ulOf50
 F5pj54fGV9ZCHBA5R6RT2sM6qteK4A7Vpl2i9/RqYyPWC3AWIzm3fo4Deqt4y38RM1SJ
 MXz9Hk/+RWz7JYM3bu60yP38Pfsc1cZrPyvly3Cr4ngAhVYRvTs2nIkuLv8n0H8DKfNc
 d4B4FsDN+KjEFPsEkr/uZLG6aZ2oYAmsKqtcI+yIcurk6u55cxp+nw1GTsjjk/4DA99g
 UzM6gj/Tp3fQncONjwedntKdVBPbSvDLV/8m+E77KoGxbzdHZ2M7KDsTpPkfeHorYwpu
 Bjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xkQSSfw7Pzh/MwPufzIC/bP8BbJT214j9m8GQ4wb+68=;
 b=DzySnvi9Q985P0CQecw3Pk/C/pf6OPNhSL+zFUYh0CA909tYnhJ37VPu0lBHyy8KUS
 aQKsjofKziU98cYPCU5QUUJFGF/FubgHoi4fqWbAZoqTt0WaAQS1EE1X7C8upgOuuHXX
 QylVrRfys6UqhkQD+RUBf7LdmQM+8SlWcyqJLZsIkXdjYnc/DaAAvk0wmyBgAaYJoMGZ
 uOFF9HRDfJWj/WuDxUFDjIiDA6Px3NoYOwP137x+2Me4KnOI8lJyTgM87mHaRm4+2HKj
 MbbIsRvv0+A4XcEA4uK5PAd8IrjnW8YYyMLdopc9ZJPuWzs3QOVv7dRQLVjos5bkbrZ1
 AV3A==
X-Gm-Message-State: AOAM531clnVgvv0f3Cy0vekqxU3CVzUbDzdfNgShQnv9zVc1VzE0VDxP
 4/leNI3ExcTwo820zq0UOTHruov4uD/Ueg==
X-Google-Smtp-Source: ABdhPJwHUDtjOkAEwiF/8V/FMoY6vjRkGg7w/vdM02Ot/pcDifUjcwJGeKa7opSNZitaWdED9j8vqA==
X-Received: by 2002:a17:902:6903:: with SMTP id
 j3mr3202041plk.23.1644304372837; 
 Mon, 07 Feb 2022 23:12:52 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id b12sm13908088pfm.154.2022.02.07.23.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:12:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] linux-user/include/host/sparc64: Fix host_sigcontext
Date: Tue,  8 Feb 2022 18:12:37 +1100
Message-Id: <20220208071237.319844-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071237.319844-1-richard.henderson@linaro.org>
References: <20220208071237.319844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sparc64 is unique on linux in *not* passing ucontext_t as
the third argument to a SA_SIGINFO handler.  It passes the
old struct sigcontext instead.t log

Fixes: 8b5bd461935b ("linux-user/host/sparc: Populate host_signal.h")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/include/host/sparc64/host-signal.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/linux-user/include/host/sparc64/host-signal.h b/linux-user/include/host/sparc64/host-signal.h
index f8a8a4908d..64957c2bca 100644
--- a/linux-user/include/host/sparc64/host-signal.h
+++ b/linux-user/include/host/sparc64/host-signal.h
@@ -11,22 +11,23 @@
 #ifndef SPARC64_HOST_SIGNAL_H
 #define SPARC64_HOST_SIGNAL_H
 
-/* FIXME: the third argument to a SA_SIGINFO handler is *not* ucontext_t. */
-typedef ucontext_t host_sigcontext;
+/* The third argument to a SA_SIGINFO handler is struct sigcontext.  */
+typedef struct sigcontext host_sigcontext;
 
-static inline uintptr_t host_signal_pc(host_sigcontext *uc)
+static inline uintptr_t host_signal_pc(host_sigcontext *sc)
 {
-    return uc->uc_mcontext.mc_gregs[MC_PC];
+    return sc->sigc_regs.tpc;
 }
 
-static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *sc, uintptr_t pc)
 {
-    uc->uc_mcontext.mc_gregs[MC_PC] = pc;
+    sc->sigc_regs.tpc = pc;
+    sc->sigc_regs.tnpc = pc + 4;
 }
 
-static inline void *host_signal_mask(host_sigcontext *uc)
+static inline void *host_signal_mask(host_sigcontext *sc)
 {
-    return &uc->uc_sigmask;
+    return &sc->sigc_mask;
 }
 
 static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
-- 
2.25.1


