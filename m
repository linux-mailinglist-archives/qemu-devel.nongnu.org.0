Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95941C52F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:07:15 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZIo-00065i-2s
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZFB-0003iC-Li
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:03:30 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZF9-0004NQ-0c
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:03:29 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so2750135otv.4
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LyetlMXJuiaLe3ru8UBdniu3ZM3POgnzNt97yDI2Myc=;
 b=Ozjsagm9sGN3D+tKsv5km4XvUYnILhwzuoJPBYMzSGJmgpBm4rPWsVEe2eXLQ6HMgs
 zhm7G/xNMNt7gbM7Os5b531AA9JCpEyAExEdVEND31Zpvw021bMQIsaU9F3ABDtcA4+O
 +fbNelEiCIDCWaW6NDiR1BXTQsuKCWwDEkWpIIOQbJHfaatmVvJftItfzwo1mnxhufsM
 VjRFruTjwM9ZOQmlOIgCGRQq95l1/K6YcBw+8eJ/pUhlSHzkpCkGuK407zwQA0vbWfzN
 mFRDOrMz+N4ng3lO57Wnx3LPVrE2tKbj+GOSf/Dkj3nLh8fadwvYruXMoxmmFiSO4Xeq
 WVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LyetlMXJuiaLe3ru8UBdniu3ZM3POgnzNt97yDI2Myc=;
 b=xZOwV+rdj8tTNNghwUIbMTzxRhSjyHvK9gu1ZFyHggOUqyd55vJgjx+1yD/XKjRxPv
 +jnqEEA/PrXE2wFKj1kaRIA0TGebCZdWzDi5DsM8tEsWOp7bpaF6SbDPDRTG65RlBG30
 xPzlT7KiENScF7F5voDomHwDlvI3k8e/Dpd70k4gVRWXVVtTm9JM1UJh3Arvd/hVs3n9
 peil0uJzcgZWQMTAI/yuZsC84TJ4taUFMzraXgN/e2TFPB7XsCGQbobck8HSkaCydPtL
 vGgStFs93DTF6hmob73YuspqXf6IId7RiR2tp3+/Q75cfq14Z1ye3QLPBjQsXBHxjKhn
 uOFQ==
X-Gm-Message-State: AOAM533MAxnMqNXURVLO4o8hX93DzMG48DFS17AHLsFAJq/9lTf/GWwd
 A1LI9Drd8iqJurI+tjgizi1bJE2dJMd5xw==
X-Google-Smtp-Source: ABdhPJy8D30FHCfG00txPsB05K2Cs+P28l9Uq7OH/cTzrVJfq/gy8ERrJ/kipjLjHvUUMcc4dkTpmw==
X-Received: by 2002:a9d:719a:: with SMTP id o26mr10227193otj.278.1632920603924; 
 Wed, 29 Sep 2021 06:03:23 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id l8sm431715oii.57.2021.09.29.06.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:03:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/sh4: Use lookup_symbol in sh4_tr_disas_log
Date: Wed, 29 Sep 2021 09:03:16 -0400
Message-Id: <20210929130316.121330-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Cc: qemu-trivial@nongnu.org, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The correct thing to do has been present but commented
out since the initial commit of the sh4 translator.

Fixes: fdf9b3e831e
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index cf5fe9243d..d363050272 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2344,7 +2344,7 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 
 static void sh4_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
 {
-    qemu_log("IN:\n");  /* , lookup_symbol(dcbase->pc_first)); */
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
     log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
 }
 
-- 
2.25.1


