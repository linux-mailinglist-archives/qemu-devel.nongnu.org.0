Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E5320B46E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 17:23:46 +0200 (CEST)
Received: from localhost ([::1]:49910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joqCf-0007pZ-CE
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 11:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq43-0002GA-OH
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:14:51 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:50982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq40-0006Lk-09
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:14:51 -0400
Received: by mail-wm1-x344.google.com with SMTP id l17so9180738wmj.0
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lxJLokSSwLrc0Y70TKAH3hjExPU/swMhK4k3zquMN7k=;
 b=d52chu5vPUyG1Z1B5gVU1A93r7nvg5fqXx74TyrFQBbdhBtbS3EIcP7GiuHAsHcljX
 dJ/q3XDo1oYmpFy5K+oiZoAKpJnivFd4IlpPRioapzsyZ2OZPYKewJMblQZw1NziH49P
 Oh1pv2ACIwyXYfYFEtQAj+wMhGt8Bshd/qLiEV9kUodH99APvFfkBWDz17WTebI5pVwv
 8BaQ5dS4XI5/XjzmLvABIv0XvPzQyC9pvo9srEgsFc5gfxPKj1WliN8hqc1X1Z89tZXb
 ByQhmZZaH+ziidvQUqjRuGmWFcBoDeV6jWAJT/Fpxh0Sa9NGg8bs/G9Qp8IGj0Hiriij
 Ks4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lxJLokSSwLrc0Y70TKAH3hjExPU/swMhK4k3zquMN7k=;
 b=VLZe8F3SAIV97htvNEOKBjYTCflZ4N19HQFcpXxud0NwHgI21MNzs07c3uY3pt51bY
 BsxaZ72WaYjgTErVOkjiNWySodzOux407yDU5cN5xIPGcLIUDT7kBpDZW1AbibGBXFQs
 SPGifXiIsKtvtYy/YIcj2rI4EroRQejKOOZb4q1dzTLx9bQt/Gr9n4TzVsozEbrXVDBz
 ERCJdnuASpuO7fjabNM3LIvSn8eW4RwcJVegyMUM/sd7Fg+v+FhvahXZRJuniB2yqLqa
 OTB6ovzQ5gzqVjfoEfBCYm4uBzxQqMAFlwkbyh2AdjqnBA14NuFC6OKKDZ3w2ZlGni5U
 J3hw==
X-Gm-Message-State: AOAM531IZGNvTI0tLtT/SxmMLXQbjBrVs1R9ZEYbX6cVcX6nigkef0e9
 NxGqaNL/BuqU2A5xCz/r99Ygaxpp0M4hBw==
X-Google-Smtp-Source: ABdhPJyYkrv89QA3ynsxGMLOWEiUlDgQeAJjc5DzRmEZ1e97XH5BG2TaLjXsa0RWDTFJbk9WcgxKDQ==
X-Received: by 2002:a1c:b182:: with SMTP id a124mr3770187wmf.114.1593184486284; 
 Fri, 26 Jun 2020 08:14:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w13sm37838852wrr.67.2020.06.26.08.14.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:14:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/57] target/arm: Add DISAS_UPDATE_NOCHAIN
Date: Fri, 26 Jun 2020 16:13:45 +0100
Message-Id: <20200626151424.30117-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626151424.30117-1-peter.maydell@linaro.org>
References: <20200626151424.30117-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Add an option that writes back the PC, like DISAS_UPDATE_EXIT,
but does not exit back to the main loop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200626033144.790098-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h     | 2 ++
 target/arm/translate-a64.c | 3 +++
 target/arm/translate.c     | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d5edef2943f..6dfe24cedc0 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -173,6 +173,8 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * return from cpu_tb_exec.
  */
 #define DISAS_EXIT      DISAS_TARGET_9
+/* CPU state was modified dynamically; no need to exit, but do not chain. */
+#define DISAS_UPDATE_NOCHAIN  DISAS_TARGET_10
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e4795ae100c..027be7d8c29 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14298,6 +14298,9 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_EXIT:
             tcg_gen_exit_tb(NULL, 0);
             break;
+        case DISAS_UPDATE_NOCHAIN:
+            gen_a64_set_pc_im(dc->base.pc_next);
+            /* fall through */
         case DISAS_JUMP:
             tcg_gen_lookup_and_goto_ptr();
             break;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 146ff5ddc24..c39a929b938 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8874,6 +8874,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
         case DISAS_UPDATE_EXIT:
+        case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
@@ -8897,6 +8898,9 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->base.pc_next);
             break;
+        case DISAS_UPDATE_NOCHAIN:
+            gen_set_pc_im(dc, dc->base.pc_next);
+            /* fall through */
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
-- 
2.20.1


