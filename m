Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C344554C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:27:50 +0100 (CET)
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midiY-0006Mt-3O
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNz-0007UE-Rv
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:35 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:38617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNs-00012K-FD
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:35 -0400
Received: by mail-il1-x134.google.com with SMTP id f10so6289091ilu.5
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DBw1z07QxBjDRozLTIiFysXXDLukelVSqTbuJA83t5o=;
 b=b4pXlupF0hNesRscRiWHuUkJp9e7XtUZnQduNoSFm0j5gd/+pAuJ6iQZf8TTPtq/qW
 KvlBaGGnst7PV4mOWUR7suASWBNPhLdjF7GCyV7rYjZGUzgifkZqJEfcVh7VgnoYfnRG
 Xc/YPe36VAiPvyS+ubAEyGKvFM0xATq83Uie+3lnAUkZqj/bDAWEuK3/fWNC1cTHXCTh
 puonoiLjqMqM11nB3kvn8UI1yGbDS0usHZUGsNjqqxU2SR4C2YUYWsbgUkBGkqvbITXh
 3Az4aKvsbOkS1j8owljJBxrbLODiUkdz06lzVdLX1OBUy77eMSX7d24DQIlNzp5dHnf1
 gAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DBw1z07QxBjDRozLTIiFysXXDLukelVSqTbuJA83t5o=;
 b=jwafVOTYC7pe02xFuZJ/e1d9VbHPjRIX1OQ1bRz10dnzRGgpHysjdc+zTHpbnwGpK0
 L9XBQ69zdAaSF79yGQxcXqAEPS/o3WnbUz5IR4QQOrvnK8+7JOd+7w8jQCg9k7JzwbLM
 hLfOo4lZTioDX+bqf08qoVQZWkFnZA5yKmE7rXlMWv0m+apGysIs1OlAvW13P6cluYwn
 wPCgDgzuBhOt6ukwZi0Y/wrrB1DexH1AvsyO/F0giEJOr8sDh83EIC1nsug2lA879Dbs
 F6MsyWLPIkOUJYYDW8plmWWIke3odctBtCKFpVHJvGnzcIzjAVlg+SIE/endnlCfvHwE
 Uo+A==
X-Gm-Message-State: AOAM531roSrhQLbqX4XDnNzggXiOP/A5whTU/uyggAEMN1bkRfJ3hTuL
 2/CZE1yXvXWH4+69a3b2NaD2YUbGS7Fo2g==
X-Google-Smtp-Source: ABdhPJxeFs4iSeDpceBrluaHSxHdSusYFkNBP9DVPBbj14zdGE2qUnegKlN6/bD8oRn6Um2iHpLMCQ==
X-Received: by 2002:a92:c26d:: with SMTP id h13mr22659768ild.229.1636034787145; 
 Thu, 04 Nov 2021 07:06:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:26 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/29] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
Date: Thu,  4 Nov 2021 08:05:26 -0600
Message-Id: <20211104140536.42573-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 973183d99c..3aaced474b 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -54,4 +54,24 @@
 #define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
 #define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
 
+/*
+ * Floating point register state
+ */
+typedef struct target_mcontext_vfp {
+    abi_ullong  mcv_reg[32];
+    abi_ulong   mcv_fpscr;
+} target_mcontext_vfp_t;
+
+typedef struct target_mcontext {
+    uint32_t    __gregs[32];
+
+    /*
+     * Originally, rest of this structure was named __fpu, 35 * 4 bytes
+     * long, never accessed from kernel.
+     */
+    abi_long    mc_vfp_size;
+    abi_ptr     *mc_vfp_ptr;
+    abi_int     mc_spare[33];
+} target_mcontext_t;
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


