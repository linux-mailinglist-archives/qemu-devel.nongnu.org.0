Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1DA3C353E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:42:08 +0200 (CEST)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F7H-0005Qd-Ry
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExQ-0005D9-5P
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:56 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExO-0002Gt-JY
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:55 -0400
Received: by mail-pl1-x62d.google.com with SMTP id p17so6109908plf.12
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gi4JUoURliPyWsKfGdialikoU/us1Pcocvv5cHbTgz8=;
 b=fJ8SxhNkAxMZ1QLGseq+NoCsfxA+jzRRa/QKazbivVmvhiych7F3hDK8yLAkoDPXe/
 1Wk/LTAQip0euRZo+Ta1dVIwG1/TYwrM07fPQeU1CyKQjeRcBDV3t5Y2tA1dBxOpVRV1
 nbRPF3zMNQIfS3LGf347GN/pg5ELv7DUJv6cu+oFSr8qSAEfzoFc0Qdg6hLC49/TN2Sy
 /x4nFhn6ceNmvAm2Op7zaWzLDGk/Gk1LzgSZDzyntm+ow8S52G3Jenvemdx5ODzTC/Uq
 SPH3VvnDGDjdiMLpamAo/bjcU7LfWOUGy8jGV0eQOhN6OhR8hGD2JigP2yqowi6BqfeQ
 h0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gi4JUoURliPyWsKfGdialikoU/us1Pcocvv5cHbTgz8=;
 b=eaxEVzukJ8WGmoyp7E+6BjYCtLz6LjCprkLvp8tlQX9RnqzXmXT7g8dRCAllbKDhME
 1eg7zZ7Czt0+amCwVekfjALxQ8cJrEF3dqKUFuU58Kbb5rUVhASNwoOQUe8Z/QRf9Cw7
 hmdWfeW37cqqvxi52aKB9WWTJo7nD/Kfh26oFHT8Jw3P19tabsKTepWBuO5Kw0P13FOV
 wDBBwzy7qDgbVY/bOcwiNE27F2d3OZl0ijCk3uLCi6Cgfjlg9/mUGEjvTWAYsMqAtNjL
 EV3Zv+e26mMg2kYgM9grTff5r6t4lZoq99s1eD+/aEJbP08PKpDfv2p8H/0n/TbBzbwi
 DdNA==
X-Gm-Message-State: AOAM531Muv4vQq+Bg68BjTyAxod6N/zOuc74gzhnOHXeBK9JTS7KJUNu
 2/a5D6PJvJ6jcX0iORqimgrJXpLOQWRc2Q==
X-Google-Smtp-Source: ABdhPJwbifQJPzm5MM0vArqPYyYxrFwEaCvdE3emkYlkBTTUEJCWdkiYSjC3PR01iK4sBCt7Un55lw==
X-Received: by 2002:a17:902:d694:b029:129:b8db:c815 with SMTP id
 v20-20020a170902d694b0290129b8dbc815mr19906297ply.74.1625931113307; 
 Sat, 10 Jul 2021 08:31:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/41] target/arm: Use translator_use_goto_tb for aarch32
Date: Sat, 10 Jul 2021 08:31:14 -0700
Message-Id: <20210710153143.1320521-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6d2867be1d..e1a8152598 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2578,16 +2578,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
     return 1;
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (s->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-           ((s->base.pc_next - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_ptr(void)
 {
     tcg_gen_lookup_and_goto_ptr();
@@ -2599,7 +2589,7 @@ static void gen_goto_ptr(void)
  */
 static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
 {
-    if (use_goto_tb(s, dest)) {
+    if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb(s->base.tb, n);
-- 
2.25.1


