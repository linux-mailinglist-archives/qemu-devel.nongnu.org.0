Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7E50A783
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:56:21 +0200 (CEST)
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhb2S-0004cS-Ps
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeP-0000Kw-L9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:29 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeO-0002w8-4A
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:29 -0400
Received: by mail-pf1-x435.google.com with SMTP id l127so5627933pfl.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uMjdlRZKRqMc37bzmt8n/trfJ/doq01lE7A/5TWhGjQ=;
 b=SnsXwAjR8po/j1UyFsXKu3Td/TSMDzsa+zsZgQwW8hHzSvBz8Yk/M3HULwcPM/qP0i
 L0Be0F+386Zp07GW/tRxkhHe9rR7r22t5qrCRRW2mv4A45lIsz+/N/3e0jT3DA9DFte1
 1jCWDDFAdw9CTsV00xC1v4B3t3Pfxz+O14J9lATIgatgcxx3cIed19jj3akTgLo+c6Ch
 YDfHJ9+gQtVTmA+L5vMkuN3JgilEfQGvQruaGZ/jy8QKlP3AVYbmczzzdnpm6kVF48Ab
 w928ijZlw4U4HwB4jaWjp4cOIWXwzuEI/NLGPtWM6Pk5SxcbOkB9CNWvpfgNcGxTyA3t
 cyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uMjdlRZKRqMc37bzmt8n/trfJ/doq01lE7A/5TWhGjQ=;
 b=J2gtbstrDE6sr5HHcD18SRlg5Uk92J/q4U5ON5OBRLgOWA/jMxQLI12glw76BWBUqk
 4gpv6O/zAxxjrRg3Mr5E8svnfJN90ImlGNdSBuPmHhbQtavOn4R9hYv7mA8P/anNbnX7
 eHyhjnBpPNioI2kZo/b1yFz4pHoqcWjYfeIBRKwp/X9vRhbAeI843BOnwAMCyAh/9ZOY
 pKOE6BtqQmo13muS/O22HkQ1SDAVbPR+4P8kfoGbtwMCyArektK25AWJB+pOrnbms+Lu
 fBX9AA2yUv4CBX2dH5Ktgoqs1g9DiwWzBfANWrUmolZRc4n6sIibP8QHAi0PhiYSFhnG
 AusQ==
X-Gm-Message-State: AOAM533YX01/cViTBxu3JLjnZCw4GPCKvO5ebF1e4Mibc2SkmsLmr2Ym
 fc6IgwCCOKLpfbPQyz0qR6InaHDz1RSPPzKl
X-Google-Smtp-Source: ABdhPJxkXRGolI93QVXn3i/EzPAtkQLLH9H4pZXC39IQdueyWoATqvG2Tf5doTQyJRP0ttlZcrHEpQ==
X-Received: by 2002:a62:170b:0:b0:50a:6901:b633 with SMTP id
 11-20020a62170b000000b0050a6901b633mr729698pfx.34.1650562286785; 
 Thu, 21 Apr 2022 10:31:26 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm23557644pgc.50.2022.04.21.10.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:31:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] target/rx: Swap stack pointers on clrpsw/setpsw instruction
Date: Thu, 21 Apr 2022 10:31:11 -0700
Message-Id: <20220421173114.48357-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421173114.48357-1-richard.henderson@linaro.org>
References: <20220421173114.48357-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Tomoaki Kawada <i@yvt.jp>, Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We properly perform this swap in helper_set_psw for MVTC,
but we missed doing so for the CLRPSW/SETPSW of the U bit.

Reported-by: Tomoaki Kawada <i@yvt.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20220417165130.695085-5-richard.henderson@linaro.org>
---
 target/rx/translate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index bd4d110e8b..63c062993e 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2165,7 +2165,12 @@ static inline void clrsetpsw(DisasContext *ctx, int cb, int val)
             ctx->base.is_jmp = DISAS_UPDATE;
             break;
         case PSW_U:
-            tcg_gen_movi_i32(cpu_psw_u, val);
+            if (FIELD_EX32(ctx->tb_flags, PSW, U) != val) {
+                ctx->tb_flags = FIELD_DP32(ctx->tb_flags, PSW, U, val);
+                tcg_gen_movi_i32(cpu_psw_u, val);
+                tcg_gen_mov_i32(val ? cpu_isp : cpu_usp, cpu_sp);
+                tcg_gen_mov_i32(cpu_sp, val ? cpu_usp : cpu_isp);
+            }
             break;
         default:
             qemu_log_mask(LOG_GUEST_ERROR, "Invalid distination %d", cb);
-- 
2.34.1


