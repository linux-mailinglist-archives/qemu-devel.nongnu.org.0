Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56841FEFB
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 02:51:52 +0200 (CEST)
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWpjM-0004hE-1c
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 20:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWpfb-00013d-Qx
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 20:47:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWpfa-0006BD-Ee
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 20:47:59 -0400
Received: by mail-wm1-x32f.google.com with SMTP id s24so10132008wmh.4
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 17:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bo8NwHPIZJi76xNaPQPetSv6WEjzS6D8SX6zEURGAP0=;
 b=E8BxfYJSg/sFYsfi+SqSDmfGlKcf0ghBF20ztCcR3TrgfSTMXzPcy992MBnSmVIjQF
 PMSbOF+dn84rMtlYM4DXZKCFcwNZpeuY9gxz+IAH/nkavwxu7sVT8Hy8BGq3Xx1f2XQF
 3bc7NKD13c8Pxp+2HZFzpAy9GayvttuRxMZcy4bWRr+65GbjokogPgi2TXfsQy/rXXny
 EZGtWZ7DmnFR4CyNndBUDhFnKZ4bvaXl0o0BDI2eziwZJzSJ5eEkubmA9gi1agzkYR4/
 iztwNjdaTjP2boxYgjHnmiKEvFdYEx+6pWbcMwXOBto0tYkxv4CC7XqcUcMK2swhgu3g
 Pq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bo8NwHPIZJi76xNaPQPetSv6WEjzS6D8SX6zEURGAP0=;
 b=vZ2S004pAcfc0Nah4+rPhEYdlRDrbrFUI6SD1ntV0clViiHz0hOds2zS/vkn/J4L/s
 C2amguST0x07VkWxtQ76rGJItV3fGGzS/PgFhpKpdjmAqlwLDMWV52D0Fz5KGtEyHpK6
 nPVqhWAGaYum8f8RfPd60Dyf9M7H5hN+pKL3D5MqUAFcmRxNKtMTS7m0L56Ntio7cdnM
 mGfYY/HNQOIb68Z4zwTq+lw1L5BWwXkaNZRDfzyHWFGMzu/Tkd53Ni30M6/CzRyawztZ
 3BSYk3l72Qt0A5WCsh+cY20V5NRFj1AD0KiBz+AF60su6rYJ8XAnWTPdvSMJj6ObLESz
 VZHQ==
X-Gm-Message-State: AOAM533E3i0paWCpcX7Jcm77l5lWiuTLJsN7MTkaeAbShybDoEklxhux
 G1MjRzJfbaXYGVLBPtnyvvPuGXvomPE=
X-Google-Smtp-Source: ABdhPJw2OSdljxFzYr9fwciGkDrQZvmtoABBQWkHhR0V8mBm8QIVpa4VQiUn7L4XOFP8z8c1sq3Biw==
X-Received: by 2002:a1c:7508:: with SMTP id o8mr11485169wmc.104.1633222076854; 
 Sat, 02 Oct 2021 17:47:56 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 g78sm9101686wme.14.2021.10.02.17.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 17:47:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/hexagon: Remove unused TCG temporary from
 predicated loads
Date: Sun,  3 Oct 2021 02:47:49 +0200
Message-Id: <20211003004750.3608983-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003004750.3608983-1-f4bug@amsat.org>
References: <20211003004750.3608983-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gen_pred_cancel() function, introduced in commit a646e99cb90
(Hexagon macros) doesn't use the 'one' TCG temporary; remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/macros.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 094b8dabb5a..ae6663c09fe 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -190,7 +190,6 @@ static inline void gen_pred_cancel(TCGv pred, int slot_num)
     TCGv slot_mask = tcg_const_tl(1 << slot_num);
     TCGv tmp = tcg_temp_new();
     TCGv zero = tcg_const_tl(0);
-    TCGv one = tcg_const_tl(1);
     tcg_gen_or_tl(slot_mask, hex_slot_cancelled, slot_mask);
     tcg_gen_andi_tl(tmp, pred, 1);
     tcg_gen_movcond_tl(TCG_COND_EQ, hex_slot_cancelled, tmp, zero,
@@ -198,7 +197,6 @@ static inline void gen_pred_cancel(TCGv pred, int slot_num)
     tcg_temp_free(slot_mask);
     tcg_temp_free(tmp);
     tcg_temp_free(zero);
-    tcg_temp_free(one);
 }
 #define PRED_LOAD_CANCEL(PRED, EA) \
     gen_pred_cancel(PRED, insn->is_endloop ? 4 : insn->slot)
-- 
2.31.1


