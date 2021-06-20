Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31AE3ADC88
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:23:45 +0200 (CEST)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luozo-00083E-Oz
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoy5-0005MI-Dv
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:57 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxv-0007xl-Bk
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:57 -0400
Received: by mail-pg1-x52a.google.com with SMTP id u190so7437885pgd.8
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h38+yrqYLEF8Qg/+ccdM2Tcru/YIUG4nfpAARgqgxf4=;
 b=AP0LLJU51LxHuc/m5L/E7Mg+gGEwsK2yIW6NfBRLfoOPq18EO8GinzG+epZmmLLpJR
 qJNbxe65lHW6hFAR4IGf6QtOUdBf9DwzS8wf2qaTfGjfb+99+1WXiDXhHv3gw6+Q1z7M
 3ml5nbVS8UDKzzxdM/yIvyZdevhdbteCtiLb7qbEOIxCpyDPocvWz7hIXknC1nedWUHJ
 NZ6xu+D0pNtrNoCewMeWtfMpGQPY9fTQ8cukHO38+MVJW+EH7ifdtB7hd9Mf7IQHVtzl
 YLlgJaYctV5A/20MqtbD7qo5lSjs/UV5HvEnHZp1dNmJh+zS/HB2UUJmmhrv/j/H4mvg
 iSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h38+yrqYLEF8Qg/+ccdM2Tcru/YIUG4nfpAARgqgxf4=;
 b=nrqFLIB8VglGYRR6Wqyk09Eo+xLjSdrn8mlxRMyLhWMVtE0y2uwTxeLiyVV6oZu08+
 5E7IytBb6VtPTJsS8LZxmQgTs3oShuOgMsinNTs77jWtsDIsQvO+hvzi79FYdHnbMA3L
 78eOcC9csrwzz/oTM4P2MNH9Bb6110ft9JEMFuFyljzDQ+aJaVl7m/MQ7gP2j1eT+sW+
 4x/ujcmGxa/mJVmxZ/5kdnQkfO8RY7hF31eIDDZrf+pXz4x6/27mNaRpCxaDSIV3/g7m
 Tbp2ibKZYA4Llhhg+sCwq2O2i1ef5x/bSMf2bwx0sUeZkf2cO2pULplzstgSI3D/4M77
 jcNA==
X-Gm-Message-State: AOAM531hIXAHpGL9IM9KFDeAEz+QTac9SiSBEDGqUz8ZUtWxd+NJw/xx
 4923s0xmtR6tLhxN6n0CD+t+fjeCrKM7jg==
X-Google-Smtp-Source: ABdhPJwadFdzq8IB90gvxruN9Mp771oE1cm8D18xvsAvnMhZAU/Lt20k5BgH0/2vQG1mx7R2g+sFzQ==
X-Received: by 2002:a63:1848:: with SMTP id 8mr17820014pgy.392.1624162905841; 
 Sat, 19 Jun 2021 21:21:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm11923156pfv.16.2021.06.19.21.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:21:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] target/cris: Remove DISAS_SWI
Date: Sat, 19 Jun 2021 21:21:36 -0700
Message-Id: <20210620042141.1235541-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620042141.1235541-1-richard.henderson@linaro.org>
References: <20210620042141.1235541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index f8b574b0b6..24dbae6d58 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -55,7 +55,6 @@
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
-#define DISAS_SWI     DISAS_TARGET_3
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3310,7 +3309,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                    to find the next TB */
             tcg_gen_exit_tb(NULL, 0);
             break;
-        case DISAS_SWI:
         case DISAS_NORETURN:
             /* nothing more to generate */
             break;
-- 
2.25.1


