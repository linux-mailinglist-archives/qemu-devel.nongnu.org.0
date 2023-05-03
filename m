Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F946F519A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:32:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rC-00040F-0A; Wed, 03 May 2023 03:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qD-00029o-FJ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:58 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qB-0001gi-QW
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso4443902f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098635; x=1685690635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bn32UeTcTojg78AN8kEXq0qc81p5M3HGZdXrMjG0H4E=;
 b=qwzcBZnzdKdFgU88IPyrxXEM3FY5Qx8XaOFJjcXpND7WDVHVow5ylq+MV6eRTjd10A
 sll1ko8SQM+lPT6k8tFzFMJtTRH4Ldxy9dhLWrVOrWspeA9A9U9XmRrxGnHTzAcstHeG
 GtRLWPAEgjxvNXU9hTZEvpvT4dxPZv09U2mAWcAV7mcc39pxYkEJZsgQ8vmPpNORdNb2
 Z5CWkHaYkVDChZP3hKlz8X6oqVK70eyO/8dudehnyOFYX4e/BA/h3b8Lm/483WRXdCpj
 N5nERtH98fJIMm3mjW5Ct/IonFUp7UBiF8DFzHoj+ZEdhVDa838HN0an5P0hDSN7/CWP
 kcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098635; x=1685690635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bn32UeTcTojg78AN8kEXq0qc81p5M3HGZdXrMjG0H4E=;
 b=Tqor9WDrZStiOHV5LvCFzcZu8Fpvem8MX3yrKERpaLzv+A8NhScff3VDJQuyfcZjzk
 DELRloBZHNc/tVUo5k1if+b9TzqUI/6N90aVd9UQUpb5LkyB9zzpX/YYBAwZY5qiMhfG
 2r0tZP/moYHS8R0eJHu9l5vMmqaW/+irHNgqMnBZOnNwwORPr2WX9ql52+E/sYkFwcTX
 QBU6I25iON89gcRrz0TP/QvDUD78WGbARjdFk6apWZ172Y3YsyfKZ4fJX/QKZZJT788K
 SYJlYUiAGna3o2yE8Se0yk1BK9xSwExzyIQWODUZoc31jQDD9WiSR2RIjqo3V/uieKtC
 5x1w==
X-Gm-Message-State: AC+VfDxaXJH/pvvck70rkDzF7ovtZBbXHBebH6yaYRn92tC1ido9Esl4
 +S3npHtn1SfHNPugZB8vNd6lHMJ32VgdlXdm/YK5wQ==
X-Google-Smtp-Source: ACHHUZ6xADklaSzernRegrrRQ/oeaRiFqAzUnGCIp4Af+vmdWxWKkGzDXA/ldZ6djsxEV7y12Hk7Rw==
X-Received: by 2002:adf:e2d0:0:b0:2f9:dfab:1b8c with SMTP id
 d16-20020adfe2d0000000b002f9dfab1b8cmr13445089wrj.50.1683098635133; 
 Wed, 03 May 2023 00:23:55 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 28/84] tcg/sparc64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Wed,  3 May 2023 08:22:35 +0100
Message-Id: <20230503072331.1747057-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
 tcg/sparc64/tcg-target.c.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 79ca667559..ccbf4a179c 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1026,6 +1026,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addr_reg, MemOpIdx oi,
                                            bool is_ld)
 {
+    TCGType addr_type = s->addr_type;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
@@ -1064,7 +1065,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_T3, ARITH_ADD);
 
     /* Load the tlb comparator and the addend. */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_T2, TCG_REG_T1, cmp_off);
+    tcg_out_ld(s, addr_type, TCG_REG_T2, TCG_REG_T1, cmp_off);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_T1, TCG_REG_T1, add_off);
     h->base = TCG_REG_T1;
 
@@ -1085,7 +1086,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->label_ptr[0] = s->code_ptr;
 
     /* bne,pn %[xi]cc, label0 */
-    cc = TARGET_LONG_BITS == 64 ? BPCC_XCC : BPCC_ICC;
+    cc = addr_type == TCG_TYPE_I32 ? BPCC_ICC : BPCC_XCC;
     tcg_out_bpcc0(s, COND_NE, BPCC_PN | cc, 0);
 #else
     if (a_bits != s_bits) {
@@ -1109,7 +1110,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 #endif
 
     /* If the guest address must be zero-extended, do in the delay slot.  */
-    if (TARGET_LONG_BITS == 32) {
+    if (addr_type == TCG_TYPE_I32) {
         tcg_out_ext32u(s, TCG_REG_T2, addr_reg);
         h->index = TCG_REG_T2;
     } else {
-- 
2.34.1


