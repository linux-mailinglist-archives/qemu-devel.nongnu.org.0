Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE63B099C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:55:51 +0200 (CEST)
Received: from localhost ([::1]:33752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvikg-0002LZ-TB
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidb-00052O-8L
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:31 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidX-0005K9-S3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:31 -0400
Received: by mail-pf1-x436.google.com with SMTP id t32so5383444pfg.2
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oqu6i/kvNHrYtHemRicmatPUkUSmc3yTCi7Ugc/TW74=;
 b=LWXY6JJg32ZFQ+dilKcSvw50uURtqpkCCXHyg7vL0EtxzMGh6DFMJworjN9T3Umlbf
 iAToMFrAfEgolkzkuT26JyoKFXbCeZDfCxhpdQnuNsXIIeNykSiY+xKaTVP+xqOL+H34
 XQOSA8gsOb1YCXuwJtv7v1+g3SI9IAOLEpPywUAhIOLBDYcMLqcQgYODY8LDJvnktzkv
 JxfKgp2T7dGCkRbl4Clvmy/8W2THzfyF82RnJ8TZCAM7OT8nivsdRzx8BXJf3IFSYEme
 1ixvb4lDoFTtWiNpo3+u2TZ1h5A3QAeE5nUMHWIAIDg8GEJ2ngqDHHllq7VzVbFBQcjs
 0F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oqu6i/kvNHrYtHemRicmatPUkUSmc3yTCi7Ugc/TW74=;
 b=BFaVgRkmckTWDvJLHg3JtUgKsaJ418R49ny6ZNEvfBMsvQtzweWE7RwRvyYB8hOsk8
 WJeYlcInYvCYrIZhscl5fwlOoxwwM1YRTpL8DfNtslGZCHZ/ybkS3zgZFp9yaoCRx4Xx
 Mn+nTP9dIjan4TMtRpDP77XeM+5jN8+6hOyXXR57z+oG95hceWLTQOZim13TwqHCPTaY
 SNrZrMt+xqIunYikSiM7ar3/fU1APS/+FfLjwPXowSrwDDvqnygoHR9ou8AD62uGJ0oc
 NG22Dwtfg+4mCc3knQ/XOsECMACwkJNSrrGCRHQiC/hsl3JyjADjbtRItxxjH/2vOAzj
 7S3g==
X-Gm-Message-State: AOAM533rzyIIaOmpfBX+EQQPefUIP5TLrSzGGkY0Dzzemx43hDE409i7
 mn2YOGlgWEpxNynjP1lkgOIq5+Qq4I1DyQ==
X-Google-Smtp-Source: ABdhPJxau3Yg7Eh1TjAI6Hky6Zxo2lfSUV2Ce67tRZXBwrcVFwuIHLy0Q1+RZel/1FeDQroL1L1aEQ==
X-Received: by 2002:a65:57cc:: with SMTP id q12mr4340294pgr.155.1624376906404; 
 Tue, 22 Jun 2021 08:48:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/15] target/cris: Mark helper_raise_exception noreturn
Date: Tue, 22 Jun 2021 08:48:12 -0700
Message-Id: <20210622154820.1978982-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/cris/helper.h b/target/cris/helper.h
index 20d21c4358..3abf608682 100644
--- a/target/cris/helper.h
+++ b/target/cris/helper.h
@@ -1,4 +1,4 @@
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_2(tlb_flush_pid, void, env, i32)
 DEF_HELPER_2(spc_write, void, env, i32)
 DEF_HELPER_1(rfe, void, env)
-- 
2.25.1


