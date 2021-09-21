Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEDC412BC0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:29:52 +0200 (CEST)
Received: from localhost ([::1]:43490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVXb-0005HO-7p
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTa-0005X2-7I
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTY-0006Fq-Dj
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:41 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 p12-20020a17090adf8c00b0019c959bc795so1422505pjv.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5odl7lhVWYI7jQ2rZz9eXg1u6cFbGrkar9AkgXAJoU=;
 b=w8O98B47eQENsPbH5ljBc2gmCujldqAOdOuocESNcQXqOXu3Pu65laxfHkfTgkglGs
 pcqLuRmzHNxq8Y/Gp3STekFod37bSPTivEc5KXphCFZbuEAGr/+G896pDoEKpr6nW7wK
 oAiJw9gYtIR9TUo4+zGR+GUUZL/qeHKNx6v8OsiaVkDmfaR39z8fKqs9u+4q9k9dFVEh
 AYgWI6MbVh4pRDPUx2L94kTbfabc2OR7Y9cBk07DftjD+yD043GB5JRpIXVBoit0brUG
 7WPOmVv8cMfjOFSvP/w1EFs/yTRGhc2R6baDnunxbqGNorFX99pZEX67aR8uVQdaDZx+
 Qh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5odl7lhVWYI7jQ2rZz9eXg1u6cFbGrkar9AkgXAJoU=;
 b=tAiTuzg12MsgQ84tqtZciHsuv/idKg0ICBFz8xBIMklz6MttpB4Qx16OfYJWpYV96X
 kOHJbzAXnEuhMD5BrRrK9Z+Uz4nd56c9G7OHGWJW6HEOJVnYi5kMvADZBzk/a6zxu3Gv
 LmeVIbJA+SUcUaozFguyya8y4UlunJrZnBjOMSt7gdim4KcSNiIokBH9kmpWXbVDGE/T
 kOuRMk7OhhmGxc4+3lY7KhpmjQjVdStOrnp12IYMYrKkWef0Nx35m3nWk0LmWy3/k0kK
 I5/1ybRIYFzbK+z180I81m6vtKCS3MQXc8ROTsqZLJCyKtiYL7fyUNBB3DuTGEJQSRWE
 Ptig==
X-Gm-Message-State: AOAM532BvErUJ2lSiNQ0nJYJPYCFLZ71YMveO+tx0DjoXeddS/TIEcjU
 BG3lxnkEepof7IyQ8n2uHGq4LrubUXPxAQ==
X-Google-Smtp-Source: ABdhPJwwbF2I+Kpz6jSyOO2wuLI3hZ2+PYOiGlLgtPMfcjWTXJLSiQyyvTz5klgOf0gXZJPgFr1PfA==
X-Received: by 2002:a17:90a:311:: with SMTP id
 17mr2431398pje.121.1632191139162; 
 Mon, 20 Sep 2021 19:25:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm15297621pff.37.2021.09.20.19.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:25:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] tcg/mips: Allow JAL to be out of range in
 tcg_out_bswap_subr
Date: Mon, 20 Sep 2021 19:25:28 -0700
Message-Id: <20210921022534.365291-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921022534.365291-1-richard.henderson@linaro.org>
References: <20210921022534.365291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Weaning off of unique alignment requirements, so allow JAL
to not reach the target.  TCG_TMP1 is always available for
use as a scratch because it is clobbered by the subroutine
being called.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


