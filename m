Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364E40DECB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:57:46 +0200 (CEST)
Received: from localhost ([::1]:46694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtlh-00072q-J8
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLn-0001lW-Ia
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:59 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLf-0002eM-10
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:59 -0400
Received: by mail-pf1-x430.google.com with SMTP id q23so4149690pfs.9
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=boBYT/QiHeueJZHokksNQvqeAcOMVEQaXWz4csao3Kg=;
 b=TZpfsdUUSIg1OPfVjhAs+xnvlBPhlHTRlz0aqyDT+4B2+bpIcVg09ZIkUdOC9MWLdR
 LelQdWAK1nojTOzs7Z2FrQzo/cYJWXSF+YQgBvrdjuGzdb2CNN9T7D4oiMly0myFtBK+
 ytGSerNPIOEW34H4cRNSMLCkIdhS2VKt3ijNqvkLWTD+3DuYvUWUlHSHW7GCqLynbTlv
 eQ/jb3FCsflgGP4r8IVuYmgnqTiftv+BFBQK4+n+46Gq8l5DqBvLZ+mkrVYV9EQyUrsO
 C8RSiAJPE1TtVFvlvTOw3nsbXquOuU9gi8rcUueTxtvsmxlPMhQN7moyDdYk/NG4mwl9
 AubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=boBYT/QiHeueJZHokksNQvqeAcOMVEQaXWz4csao3Kg=;
 b=GZMX12+dVrTxZHc0sVhsqKYBeymPyZ1hL9tJbt1xm2RZ5mt+ID+kDNnTScpG7S9Wnz
 XzoLknexO3De/171i9xub2/RVpV35bML2WSE4WzwopVhDRJOCounX18NpLxcVv53OnsH
 1eEEEKm3anZtKHSikOWeyhKNmelPK0+XJVrJJLUoGjhpJDg1wv6ERmYfhW16PaDvtbFW
 A8fTF+KOKehVCwYE63E8KsenK/RUiYTHKlYgm+EEa3RhONezVdtJreFJp7oTfxNGvYIu
 7fUGlNv3YbL/d6XRHICMX/GgPk2la54+8T9hxgBtPwlIb8gDgBjofuFypdAg26g7sPnN
 XhIg==
X-Gm-Message-State: AOAM530qKY3gTVO14n50Q55VbcJ4xIsDCVvkEPhFNxZFBHVQ6e6I+/7K
 U7ow7bQTYQMILymM1ZTAtZc80uj6BUVrrg==
X-Google-Smtp-Source: ABdhPJwOnRr3RMQR+NrjcmoL/iDhM8I8uoueq6EpXmiB9VLHv2lXFj7yvaqE094zJsD3UUiWddz8AQ==
X-Received: by 2002:a63:c10b:: with SMTP id w11mr5553924pgf.228.1631806249237; 
 Thu, 16 Sep 2021 08:30:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/35] tcg/mips: Allow JAL to be out of range in
 tcg_out_bswap_subr
Date: Thu, 16 Sep 2021 08:30:23 -0700
Message-Id: <20210916153025.1944763-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Weaning off of unique alignment requirements, so allow JAL
to not reach the target.  TCG_TMP1 is always available for
use as a scratch because it is clobbered by the subroutine
being called.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 320795a637..3a40af8799 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -573,8 +573,10 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
 
 static void tcg_out_bswap_subr(TCGContext *s, const tcg_insn_unit *sub)
 {
-    bool ok = tcg_out_opc_jmp(s, OPC_JAL, sub);
-    tcg_debug_assert(ok);
+    if (!tcg_out_opc_jmp(s, OPC_JAL, sub)) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP1, (uintptr_t)sub);
+        tcg_out_opc_reg(s, OPC_JALR, TCG_REG_RA, TCG_TMP1, 0);
+    }
 }
 
 static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
-- 
2.25.1


