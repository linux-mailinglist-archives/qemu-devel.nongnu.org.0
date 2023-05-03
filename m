Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA806F5209
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:42:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qK-0002VX-KM; Wed, 03 May 2023 03:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qF-0002CP-3G
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qD-0001ki-22
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so2315055f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098634; x=1685690634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwjJKRWUw9nEGQx3sCz5f8VYPsSDuPiBiG7E3lZCbFg=;
 b=YQbsgfhdQXzs6UDhTOK3CrOXp5+8a95qsQ6dEfuWiioXxxAz69HACgGFiShDRaDwcg
 BjY3l0Yqiqn43Vt7ELFlRSP0ZB/vJotNZ6ogQypyZrnJ427bhI17DvYwHFPEG0PTNjLB
 h8o/vOFRkW2JBwZ/KlrZufCgFq6mwWF471QPbTRZX2Nf2zl+dYp6w3FECza4CEbP1C5U
 ZSEGdS79ZfGj2Dnnv8Bo1W6j5S0ksJlD3HhGgssNvK/cnJovRuX/KSoWzfQXnbCDg771
 riKCUCJgSxRnN4tP7zXXEbCem2BRyIZ5KuNv3DJQUBrVBmvuW8/ioEtd1g30dkRtjZft
 Q72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098634; x=1685690634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwjJKRWUw9nEGQx3sCz5f8VYPsSDuPiBiG7E3lZCbFg=;
 b=O/qwl1dmaGp6qGqwSrQrYC4kCb9uzrdCbJ2Jz8CnC/OeUg1cGTAs9DAQbOWvKNJu8J
 TAu35VNpSduAsmdSwFGqMlj6NpalqpDljF0qlfoehmX6swQab+8BKqRqhfYad5eF9YuC
 6mIzbjEoAMyjtnJUV439zeKPfg+DsqQWlEVQGYEUbpaug3QpZzTF58gBSLEJkUxE4rab
 3kDlIEVyAMdE2i1ZXFkFZrHDIpGG0bd1MLJ/N2OLkzk02Qs2JyE0CgiTGpu1auFHT6hc
 jTrtWpfSkynrvw8Nb46SXRLCQt4uBqk4Hq21WHxxEtZ/aMneFAj5x6Ye942MP36bPSmw
 eTtA==
X-Gm-Message-State: AC+VfDxcTPFE5e7kVK/A06r2U1lg0cioPdZloYzD4xH5qFwVqpJhllM2
 gTx6TjpCFgzQW2V6NtlUrvhgg2PlSrWutW+HrOT5og==
X-Google-Smtp-Source: ACHHUZ7po17WNzTqXkH56vLw4LCE+iPNVoj1StIIdNc1OdFzxvJ6tEA0QoWfVVT1PJsGGdymQiKicg==
X-Received: by 2002:adf:edc6:0:b0:2fa:2e64:7d10 with SMTP id
 v6-20020adfedc6000000b002fa2e647d10mr14002119wro.28.1683098634393; 
 Wed, 03 May 2023 00:23:54 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 27/84] tcg/s390x: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Wed,  3 May 2023 08:22:34 +0100
Message-Id: <20230503072331.1747057-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All uses replaced with TCGContext.addr_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 000c2f66db..77f7919880 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1747,6 +1747,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addr_reg, MemOpIdx oi,
                                            bool is_ld)
 {
+    TCGType addr_type = s->addr_type;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
     MemOp atom_u;
@@ -1790,7 +1791,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tgen_andi_risbg(s, TCG_REG_R0, addr_reg, tlb_mask);
     } else {
         tcg_out_insn(s, RX, LA, TCG_REG_R0, addr_reg, TCG_REG_NONE, a_off);
-        tgen_andi(s, TCG_TYPE_TL, TCG_REG_R0, tlb_mask);
+        tgen_andi(s, addr_type, TCG_REG_R0, tlb_mask);
     }
 
     if (is_ld) {
@@ -1798,7 +1799,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     } else {
         ofs = offsetof(CPUTLBEntry, addr_write);
     }
-    if (TARGET_LONG_BITS == 32) {
+    if (addr_type == TCG_TYPE_I32) {
         tcg_out_insn(s, RX, C, TCG_REG_R0, TCG_TMP0, TCG_REG_NONE, ofs);
     } else {
         tcg_out_insn(s, RXY, CG, TCG_REG_R0, TCG_TMP0, TCG_REG_NONE, ofs);
@@ -1811,7 +1812,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, RXY, LG, h->index, TCG_TMP0, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
-    if (TARGET_LONG_BITS == 32) {
+    if (addr_type == TCG_TYPE_I32) {
         tcg_out_insn(s, RRE, ALGFR, h->index, addr_reg);
         h->base = TCG_REG_NONE;
     } else {
@@ -1834,7 +1835,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     h->base = addr_reg;
-    if (TARGET_LONG_BITS == 32) {
+    if (addr_type == TCG_TYPE_I32) {
         tcg_out_ext32u(s, TCG_TMP0, addr_reg);
         h->base = TCG_TMP0;
     }
-- 
2.34.1


