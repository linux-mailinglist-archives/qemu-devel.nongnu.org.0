Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AA43446F1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:19:01 +0100 (CET)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLOW-0004mr-8T
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOL6J-0002XT-2R; Mon, 22 Mar 2021 10:00:11 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOL6F-0003dk-9D; Mon, 22 Mar 2021 10:00:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id k8so16963147wrc.3;
 Mon, 22 Mar 2021 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QqnRDcqbG8JtPoVsmIsAnMFqlbytcIG4xMZDFP2Crww=;
 b=e2TDJ62JDCm3/1KpDMe/uTguwtJpyEVQp+b5BzmsuHq3ln3VsvssFSgLEEfNgZaVGh
 sI++336GPAgdIuUgOTYRuJ6LsJMyoPOCaxtgTb0MluwyPWeFc8vK19jsfbuPskqEcTiN
 gQL5rL/zOpluMtG8+DF4MZuHha4kvf/g3AXE6Gdl62iEahcy3jSbmJfr1p48WcBXMx/U
 kCHJ/jaFIdGHxeBtR+Vm9sDc30uykeZnMQvVakmHKL3UcE17SuGySv8BblaQjn5CMRJc
 xaxBSaLZJLjf31mO9LINDEZ9JT9aNnnl4rXoR911VAf34rhNggqwr3mKcbOQTGefPYWK
 IgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QqnRDcqbG8JtPoVsmIsAnMFqlbytcIG4xMZDFP2Crww=;
 b=FJUV5Ek8p+U0oEBlHIZgT3NJu34xMuCnHj4JB8OLtgYDqwG4KvIrD6X8rkmRp13e51
 1ndxtGeXJE14CTdCwcvmTwd49mqCXIkto82QO+xT+TgMYkjXOQtPv3MvpkFo5eZfH0ps
 NRiPsMQ3hqfxYy+r8ORcVlfrYZEPe7RqXsFg0pu6v2yhwopUMj56EfRUxFvcyyEQDz+O
 u6caEgK3S+XmU6jYQ2YTXkR5G4EnT3kwxdly7HciLuC+QLdcVBW21EnOFqyPPszyE13t
 6gWjcSjvyvyEEdQRVtqZDwObtksMlgvxcnnLxuJwFdWSq43QxS7C6R4iVA9ejgVIonva
 GmBA==
X-Gm-Message-State: AOAM533EsDR0+BrgxgzMSuML0uqnEUjuLX0dwr/ty0f/uK1Tyed89WrZ
 7aRx8euKsgk9B/tEL0BpL3rJdSJKrBhHdg==
X-Google-Smtp-Source: ABdhPJxSV9Pw3D+cZyEEq1dzNnvjDsbkngwylNnN575P8K35hrcy1R+I9VFFeicdDFlZ3dDSU5IK6g==
X-Received: by 2002:adf:b1c9:: with SMTP id r9mr18844903wra.51.1616421604280; 
 Mon, 22 Mar 2021 07:00:04 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e13sm23252197wrg.72.2021.03.22.07.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:00:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] target/mips/mxu_translate.c: Fix array overrun for
 D16MIN/D16MAX
Date: Mon, 22 Mar 2021 14:59:56 +0100
Message-Id: <20210322135957.4108728-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322135957.4108728-1-f4bug@amsat.org>
References: <20210322135957.4108728-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-stable@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity reported (CID 1450831) an array overrun in
gen_mxu_D16MAX_D16MIN():

  1103     } else if (unlikely((XRb == 0) || (XRa == 0))) {
  ....
  1112         if (opc == OPC_MXU_D16MAX) {
  1113             tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
  1114         } else {
  1115             tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
  1116         }

>>> Overrunning array "mxu_gpr" of 15 8-byte elements at element
    index 4294967295 (byte offset 34359738367) using index "XRa - 1U"
    (which evaluates to 4294967295).

This happens because the code is confused about which of XRa, XRb and
XRc is the output, and which are the inputs.  XRa is the output, but
most of the conditions separating out different special cases are
written as if XRc is the output, with the result that we can end up
in the code path that assumes XRa is non-0 even when it is zero.

Fix the erroneous code, bringing it in to line with the structure
used in functions like gen_mxu_S32MAX_S32MIN() and
gen_mxu_Q8MAX_Q8MIN().

Fixes: CID 1450831
Fixes: bb84cbf38505bd1d8
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210316131353.4533-1-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mxu_translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/mxu_translate.c b/target/mips/mxu_translate.c
index afc008eeeef..fb0a811af6c 100644
--- a/target/mips/mxu_translate.c
+++ b/target/mips/mxu_translate.c
@@ -1095,12 +1095,12 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
 
     if (unlikely(pad != 0)) {
         /* opcode padding incorrect -> do nothing */
-    } else if (unlikely(XRc == 0)) {
+    } else if (unlikely(XRa == 0)) {
         /* destination is zero register -> do nothing */
-    } else if (unlikely((XRb == 0) && (XRa == 0))) {
+    } else if (unlikely((XRb == 0) && (XRc == 0))) {
         /* both operands zero registers -> just set destination to zero */
-        tcg_gen_movi_i32(mxu_gpr[XRc - 1], 0);
-    } else if (unlikely((XRb == 0) || (XRa == 0))) {
+        tcg_gen_movi_i32(mxu_gpr[XRa - 1], 0);
+    } else if (unlikely((XRb == 0) || (XRc == 0))) {
         /* exactly one operand is zero register - find which one is not...*/
         uint32_t XRx = XRb ? XRb : XRc;
         /* ...and do half-word-wise max/min with one operand 0 */
-- 
2.26.2


