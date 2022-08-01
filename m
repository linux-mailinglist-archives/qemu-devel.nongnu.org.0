Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57F586F0D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:56:11 +0200 (CEST)
Received: from localhost ([::1]:52680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIYi9-0008Ti-D8
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIYXs-0008GI-Lb
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 12:45:37 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIYXq-0000cO-R6
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 12:45:32 -0400
Received: by mail-wr1-x432.google.com with SMTP id z12so4736507wrs.9
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Cl7CvDeKfnsPrPWI7EqBvRtwzsiGAx0pECme36wy5aU=;
 b=WUpMKlOPPjTlds5sT+kwA9nbwma0SeDlJlRose2qOyGUHC/hkXZgV7NlsTgOf5zaMZ
 9wz8+WoZ1eSX/il/h/vLAva3sqyIUCs6nZ7Aw8MYHtuaaObRfyIon4MgCtiJg6dY10Nl
 vKuVpsCJTBJ/L7bMG0Tu8/HaWUxKtrjN4619Wv4Q7z3F3Dtv88VHcx11G3GI7Y7QjZMS
 YdSZqHgxwfVdU+vqiTN5uYn1eZaUqEhIuekKhUhXFvE4YjW+jHIhcAJawkYWcOgEydxM
 sfFBETtYEXQpT9p+IrPi1xbGFRgODoc1+HFb/KiwgGiLzr3GlKzWXd9E6rB++paBDUac
 L8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Cl7CvDeKfnsPrPWI7EqBvRtwzsiGAx0pECme36wy5aU=;
 b=mCsO1QiMcsjdAlc5JO2dIOlKNEdyi6OAFGFfas5QyE5sdzKB0FyYv5GNBpbmdyya5G
 nJgtjXWmtzKAvCXlcWq0NdhH7kcRn/VI39sTsiRtPRaK/zUIiaQjXV0U6sfLdLhSGuOh
 KWroJFoYsl5lzRzyQCYkf7VQt8fC8IJFl/d4JFafsSyzBF3+pxNTRBVd7pmD3QDpMhte
 hTJowc6b30S4434QSVbzkuOYP+oSXGkYpzBQa/qlOV8AnrFaf1EnthsiC1rjhAdNV6aP
 K7ltKMjDGTJ/wA0hy6Ttzzvy4a/qycrNvFbaLuk/9pwfvxnnK8SkGO0zEexm/Ye2t0yc
 8a0Q==
X-Gm-Message-State: ACgBeo1HOeak8o1geoWD8uO0s7RpNJ/G3+laxLA4CT8f0HB50zqJoC8B
 zJkaggEUusODBJscG/XL2OYl4Id4WLMWWg==
X-Google-Smtp-Source: AA6agR4sPlogmVOHELwc2Kf8BOYsB0hOGnY5SmCCnDUC0yn51V/t9kKiQO3J2AtrLYO4S6EW/Ry1xA==
X-Received: by 2002:a5d:498c:0:b0:21f:765:235c with SMTP id
 r12-20020a5d498c000000b0021f0765235cmr10842566wrq.590.1659372328979; 
 Mon, 01 Aug 2022 09:45:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a5d6d4d000000b0021d7ad6b9fdsm12277769wri.57.2022.08.01.09.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 09:45:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH for-7.1] icount: Take iothread lock when running QEMU timers
Date: Mon,  1 Aug 2022 17:45:27 +0100
Message-Id: <20220801164527.3134765-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function icount_prepare_for_run() is called with the iothread
unlocked, but it can call icount_notify_aio_contexts() which will
run qemu timer handlers. Those are supposed to be run only with
the iothread lock held, so take the lock while we do that.

Since icount mode runs everything on a single thread anyway,
not holding the lock is likely mostly not going to introduce
races, but it can cause us to trip over assertions that we
do hold the lock, such as the one reported in issue 1130.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1130
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/tcg-accel-ops-icount.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 8f1dda4344c..84cc7421be8 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -109,7 +109,13 @@ void icount_prepare_for_run(CPUState *cpu)
     replay_mutex_lock();
 
     if (cpu->icount_budget == 0) {
+        /*
+         * We're called without the iothread lock, so must take it while
+         * we're calling timer handlers.
+         */
+        qemu_mutex_lock_iothread();
         icount_notify_aio_contexts();
+        qemu_mutex_unlock_iothread();
     }
 }
 
-- 
2.25.1


