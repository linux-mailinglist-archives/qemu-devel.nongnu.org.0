Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F8E661C22
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:52:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBx-0000sj-9T; Sun, 08 Jan 2023 20:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBv-0000s6-4E
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:11 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBt-0001aU-LZ
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:10 -0500
Received: by mail-pj1-x1032.google.com with SMTP id o13so3761222pjg.2
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=op0Rf4OXX9B+XJCysG6bOjZLlZA6usVvQUy5OnNEk0M=;
 b=obpYe50VjzdOvjlEFglcIoQJbuSpHUVNSPDAklEgvDunzjudmVywZtztfnASePXamn
 k8fRqpSbHCgZcBbLy/EbqXB4qu4J/QQBOErEXCsKvUsxVsaBJa/+P9XQnGxLCwtIg6Le
 uEScZataojyfD4WFutLHZkGIwyMCdr6p37cjZA1n8HoM34oKfny1fksYA63TzvWqjcaD
 Gr2F6q4lW/mW4WcljPWo9DoKDdXIQvSYxEetRuaLCNnFNP1GYBD78FgqAPuK75Y4F9RN
 E9DazRtqsD6NyPY70UKDPvPC7oX/aJO8dHNU5kbuc8aE2I6RKQS/pANCFSyEp4WsrLoS
 OwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=op0Rf4OXX9B+XJCysG6bOjZLlZA6usVvQUy5OnNEk0M=;
 b=iu9rLOoyyoeNHDI6oz2ULAUQ0Sy49UK0AT4iYP/7OKXt4QYnQyzCn+LN6J9/iD7kmp
 3caFxdrw6fwKtTqDVHyaVNlDvzim8mPoy3n6lVwQRt7mJDBCJJlEasKIAmXjE4AEdKhM
 f7ajBAvk2jCHl6gCk5uqT/gcs82ofnXklN+G6fcicyE2YijUHoJClCOjKNo1uItiAB/K
 Of7uW2SZE4/9PNK44HOtiC+8XYz5GkCn0CXqVM3gIWUmifBCOl0U5iCIqOWm0awb4OVE
 rGcUaS1I4yhXUP/ZrWyRnpq53nsxGEGu2GYeievgpM88eIsgtrohasbJPoLcVoQnl8Gt
 cnmQ==
X-Gm-Message-State: AFqh2kqOqyXwo6fdlYahkBEoxUo7PF+SM2sk8DktHLYcFOHi3ScfsvAt
 7rpLewMDAaFr1KV6ZtbUHNwG8GepUsk5GyRb
X-Google-Smtp-Source: AMrXdXtVit0O3szZPeWaLXWV8soAYXQE7pxHN+Itutt4wuCdEPitng+MK844kkzzWQXDQeU01ELrnQ==
X-Received: by 2002:a05:6a20:be26:b0:b0:3329:c395 with SMTP id
 ge38-20020a056a20be2600b000b03329c395mr78742554pzb.30.1673228588501; 
 Sun, 08 Jan 2023 17:43:08 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:43:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 21/22] tcg/riscv: Introduce OPC_NOP
Date: Sun,  8 Jan 2023 17:42:47 -0800
Message-Id: <20230109014248.2894281-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 136fe54d4b..82ca86431e 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -267,6 +267,7 @@ typedef enum {
 #endif
 
     OPC_FENCE = 0x0000000f,
+    OPC_NOP   = OPC_ADDI,   /* nop = addi r0,r0,0 */
 } RISCVInsn;
 
 /*
@@ -403,7 +404,7 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     int i;
     for (i = 0; i < count; ++i) {
-        p[i] = encode_i(OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
+        p[i] = OPC_NOP;
     }
 }
 
-- 
2.34.1


