Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6FD311661
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:05:26 +0100 (CET)
Received: from localhost ([::1]:37326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AAI-0003mJ-2J
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2N-0001sM-O6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:15 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:43353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2M-0003IK-6l
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:15 -0500
Received: by mail-pf1-x42e.google.com with SMTP id q131so5280528pfq.10
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVyouWDBw9IpYjnxIdxk6Lk2rEB7Cry5s6L8ndOAdHg=;
 b=NkO1pt+1MRTqezkwqO97XXuqn444D0PMd05thLoRCojglKtPEZ6h3/rdr6vsHXPFBD
 ot8v7HnuGp0NHECUAEPlXDM4Pu862x6QDR4tv0S1nbz+0zQEsgl5ZJYL2y9FW/xU3DRi
 MqCBDbBjKnrUTyNpN4gTc2GL3aoVxDVe9sOqCgAushdkKXTpOQmiUlf7jQ/WI/taZmch
 HUD1viexHDGQaziuA0oTYUpYMZyqMtiyYm9U64531/sKK7Vb9xJW1ZLFBzJMs65uU3JJ
 VId5Lon3TPyN2j0sZ9uXuMTVfTFrJkUkl96y4p87+ek4zrghxejLnOEb9OEG8+t5HFpv
 bWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVyouWDBw9IpYjnxIdxk6Lk2rEB7Cry5s6L8ndOAdHg=;
 b=Ir6fntJoeRc/47eUAr8OkhOEBBEZVdu9a4Ibn+NWnShEDTH8u8aIHpDHGUImsrzGp8
 zSPq9BIcdpTEOI8q2jw3gNGhbT6CfaV/q2n48rZJ909WPXT2MRoR2hnpD/uL9Bo06hti
 5I63J/vyauiaknPpnkQmwPVekIZHhIZXlC6hElfR9+UU8qia2MPfGtuInT1Mh+E6CEoC
 Kg01uZGDUtFS6muMZQIYe/2KvNyh7BptdXfZjFCwHWZhhw7lrvSkeoIoKpRASFYzqdIZ
 YwugdWQBawbi0hxc5P9Nx0Ps/lJqIzQpeugY3oUPsc91AHKaLa669IjXG3wZpieIN8Ks
 tlYQ==
X-Gm-Message-State: AOAM5307ENB2oc6VCCxffGGA+08yC664JnjXn5F5i1m6d4I8lm+198eB
 FKRBES+x2UJNoebVQVvzqvMw0A0HaPZFAYjX
X-Google-Smtp-Source: ABdhPJwSP4hPEPTiTLhGdhz4DdbjB6tgUKUOkwDabmJEIu6LWi6B6OIW8Z93ZBXziIzAE8xhTOUF0w==
X-Received: by 2002:a63:f95b:: with SMTP id q27mr6622450pgk.82.1612565832983; 
 Fri, 05 Feb 2021 14:57:12 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/46] tcg/tci: Inline tci_write_reg16 into the only caller
Date: Fri,  5 Feb 2021 12:56:14 -1000
Message-Id: <20210205225650.1330794-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 740244cc54..005d2946c4 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -117,14 +117,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static void
-tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
-{
-    tci_write_reg(regs, index, value);
-}
-#endif
-
 static void
 tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)
 {
@@ -879,7 +871,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg16(regs, t0, *(uint16_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
             break;
         case INDEX_op_ld16s_i64:
             TODO();
-- 
2.25.1


