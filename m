Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9911F6A42
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 16:47:41 +0200 (CEST)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjOUW-00038q-T0
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 10:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSh-0001RC-Jw
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 10:45:47 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37017)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSf-0003mo-4m
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 10:45:46 -0400
Received: by mail-wm1-x342.google.com with SMTP id y20so5317861wmi.2
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uW0Xh6q78nHA2zqmzf0Ts38Qc+I7vV86qqdu/rr8SyE=;
 b=pKurPBR40UGOpb+1bTEFRCTPXWqhiExC/+Nj7KYLdc13oxToyutDhqoOTW04mIT1+P
 NAHsG+W7n+XB0OQB9ksDdj3fTvgDoE8ni+5zDPEZ10ukylksgIezIFhTYsy9aaCjflGm
 N3bJGiOoZQ7rY4KHhfUnfeiDduEwZzDYGCAy/9zlh2oZFjFtACtGDEseTye51sWzIjd2
 PnKWddmR3V3mHTv6gm/4zlBjsfpG3oigMrP2SZwkkbVv0VD6p+zDPVdFb1sHCPsduSUw
 Tn2fB0nj76tttoiucNXbBJAKJ1iC/0gWRI7XH+sxquzoUEqUx/S7EMIaMerSlZYtg2Up
 i3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uW0Xh6q78nHA2zqmzf0Ts38Qc+I7vV86qqdu/rr8SyE=;
 b=kSwlr7kueqz0vRBOQZKaGs4SgCCkHgfg5CLt14GrE0ETs9FG7FWX9oxZPhpXzMHuAQ
 XF9mhgDx+LB52uEKJ7A0Bmi5kUqi0O4kodn1HwSoOXRnr79DwzT/pSSSu+/zhuqA0ifD
 zrp60r+zy8Ba54jNNtiSNbmaNEm7/6yO/EefdLNCaYMNBFfZBSJVm6Bp2kZLnntDn7tE
 veWBfrUpbnVd0nj0RAPws2TvmxuyvZNJHIYlYRNSbyl92riDbyuVRd2/TcXouVO15ezT
 inVQXNInemar7i1QvrJ9YGPq1lsK4s8m30txuaNadVOWoTKvbSHITF2JmNjvTnxjCBsT
 jong==
X-Gm-Message-State: AOAM5329j83bOHKPY+/4pTvpEpo0jc42Udg1o3rCUgYCREHAWSGGH1Ev
 ro0KgbUforVivjd8U8in84466g==
X-Google-Smtp-Source: ABdhPJyB1G/HqZfQZMJ/A3Ds8zU7Llfq+J0a2KjTX4N8hYFBi4xTKj071rK9hjs3j1PqadwOupOlYA==
X-Received: by 2002:a1c:4189:: with SMTP id o131mr8155980wma.183.1591886735648; 
 Thu, 11 Jun 2020 07:45:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h18sm5271658wru.7.2020.06.11.07.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:45:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/10] target/arm: Add missing TCG temp free in
 do_2shift_env_64()
Date: Thu, 11 Jun 2020 15:45:21 +0100
Message-Id: <20200611144529.8873-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200611144529.8873-1-peter.maydell@linaro.org>
References: <20200611144529.8873-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 37bfce81b10450071 we accidentally introduced a leak of a TCG
temporary in do_2shift_env_64(); free it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
My test setup wasn't looking for temporary-leak warnings (they are
not as easy to get at as they used to be because they only appear
if you enable qemu_log tracing for some other purpose). This is the
only one that snuck through, though.
---
 target/arm/translate-neon.inc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 7c4888a80c9..f2c241a87e9 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1329,6 +1329,7 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
         neon_load_reg64(tmp, a->vm + pass);
         fn(tmp, cpu_env, tmp, constimm);
         neon_store_reg64(tmp, a->vd + pass);
+        tcg_temp_free_i64(tmp);
     }
     tcg_temp_free_i64(constimm);
     return true;
-- 
2.20.1


