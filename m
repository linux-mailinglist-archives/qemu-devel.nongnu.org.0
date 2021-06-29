Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31303B787F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:19:46 +0200 (CEST)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJGr-0000ns-O9
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItI-0008LV-Ry
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:29 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000t1-4v
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c15so17020pls.13
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NDbsMBGPa6/4ZsuEztiF+PhUKF/lepvzPP4S1PK622w=;
 b=V2JD17V/4VGr5L3FiC1cQ0e9TLeoTfzozFQ5MhySRU4s7beiEB/4nB87b65L6lAjaT
 ZxZbugJIu8lqEh1MbcjY6GXXX+wpSLZYcygIz0f3i04BjEsuwO+2MWYYAoUmJTpz6n0p
 yeUKgAtcXgIKFngtiVai+Ue8JAiTpXnOrfCQi9o/+JAL41WJYjUpYqOzsVA8EWQc8cEK
 3imrIb2BaPRrbFuE2FhfrB0epU9WcLJ+XADYNSl5wJECPeljfkoDkn3YFO32lKH1UyNQ
 Ubh94g9zkgh7XJP5ic61P2ekMqutjSx87XCoXAg/UreNDVj1xzcmUPObhbBMpN3UGayD
 nluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NDbsMBGPa6/4ZsuEztiF+PhUKF/lepvzPP4S1PK622w=;
 b=OMR6TAV4oRLu1+4jiI7CQRrv0QcIeGuTRz98qsrkCCzlRh9LXm8iilXpPE+5Y+gE5J
 Y9YztOYBw/pX3KalAh+chp5OaNxqgosBP+0raKWdwW5Bg7BZ4Rz+9xfPEzcRoUobbigd
 haH5dksNUDOGUuD9fhN+OjKpobw7FlfL9hozAjA5pwGmaeB3e+YwcT3aYb1B4rrpaiz+
 l/SOLAkwtTJNk+eR3veM8jlw94TjI++Gh5WzWbvmJ8tXOMBC+jiYKWYdpHzl+7C6M4f3
 mGfEOe5S+SrDDtK6Fdi3T24UTQvBRkdcfi6LM+GKDKGYDlOKa74CMqnb3ElGJ1K4WDIh
 sJzg==
X-Gm-Message-State: AOAM532yclpMJmA5HDwuD0HAIoSVBPGn8GeA01Pv/l5ZVghD7ott6bF5
 OjdQkf+/Y7qGEoLfIhzRQHEr05NTqDcYyw==
X-Google-Smtp-Source: ABdhPJyQcTc+MxiFQ8o2d9Ep1uOFHl6m11sR8OFYfTqlMFGzzUJV95JAF8DXpS49Z3EgCdCm2mAckQ==
X-Received: by 2002:a17:90a:cc08:: with SMTP id
 b8mr318462pju.128.1624992904127; 
 Tue, 29 Jun 2021 11:55:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/63] target/cris: Remove DISAS_SWI
Date: Tue, 29 Jun 2021 11:54:06 -0700
Message-Id: <20210629185455.3131172-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is unused.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index bed7a7ed10..8c1bad9564 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -56,7 +56,6 @@
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
 #define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
-#define DISAS_SWI     DISAS_TARGET_3
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3310,7 +3309,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                    to find the next TB */
             tcg_gen_exit_tb(NULL, 0);
             break;
-        case DISAS_SWI:
         case DISAS_TB_JUMP:
             /* nothing more to generate */
             break;
-- 
2.25.1


