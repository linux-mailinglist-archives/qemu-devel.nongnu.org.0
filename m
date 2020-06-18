Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C51FEA8E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 07:02:08 +0200 (CEST)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlmgh-0006Kh-A2
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 01:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCs-0003FY-Gz
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:31:18 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCn-0003J6-Om
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:31:18 -0400
Received: by mail-pl1-x62f.google.com with SMTP id j4so1917335plk.3
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fB7a+/Rpb0ifGeMz+aFNVR5YF+snSFI42vlkOdTuwbw=;
 b=OD8y3tLfGun4vR678UzxZaNCkvoRxGlO2gfTOZmf7qwDMztv+Fy2PYIJB9c7jdoOeZ
 WJpEoGfG5Ix3xNxtAXmXr/j95Cx0KhT/IMMXHoxckES1nmfj6hkzhnn1k28SX+JsXD/S
 uiI7/us+OwcEfjOUQkUmhkKECiHZyzw+M+YjhxGiF2CSxprBkitvkUOOU6ndPsa0vAUp
 1Wf0/VLFEWwAHIJxdwIdlU5bq7luEsP6PSRfp32KMENmYHAGdykYtNO9Jq/NesrcqGBb
 3ouRzlibkDvUOPSj39wkYAlPcwEkL6ZMSDFaMK0L8H6zaC4txvwkZrDEDjFf+X5DvHi1
 HcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fB7a+/Rpb0ifGeMz+aFNVR5YF+snSFI42vlkOdTuwbw=;
 b=fIcbwJxdNedgixYr/PfjwO8uxCWI7Dvjm292/Gob/MPMQkQynriH7i0KtUTczXJO55
 lKHPDu6Uly3H+ES4iRIh5ii6TdCHdyLfk9r2rBbNPp4VGWG3mvh6i/H60ElU3g76M4dk
 1dFPGFekVxonv1RzjUezKjiyBtd8R1l0rnVygyBSUONmMnlPQhWkLeJ1fJyqapQLUFK/
 n18YeETSpD3CFPOOacLOQNN92yss/9Vgh0Czz4BtpvW1LFZV7trgwanaW8wyyzpcRE2J
 3rR74IXAZxHt1AJcdv4aPmz57XQ1zRQqqeTbnfUoRU7cqQ4Zto2DFtvsTC458/4vu9cY
 NCTQ==
X-Gm-Message-State: AOAM533Peagq6M2D2R3k2w8MMAitfr2PW3D7/iP3/W4jzvOv0ARVjXjt
 XRpDIhm+CDw6jsAogT2Q+4TXJMCVfcU=
X-Google-Smtp-Source: ABdhPJzqDZao9vuiV3LIbzxGzMypuYd73HWN7LKGVXYCnhIS+8+zefxAM/uddvJY1Xaeog9DebgD+A==
X-Received: by 2002:a17:902:8d87:: with SMTP id
 v7mr2097827plo.73.1592454671918; 
 Wed, 17 Jun 2020 21:31:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o1sm974337pjf.17.2020.06.17.21.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 060/100] target/arm: Implement SVE2 scatter store insns
Date: Wed, 17 Jun 2020 21:26:04 -0700
Message-Id: <20200618042644.1685561-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal
store insns.

64-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)
* STNT1D (vector plus scalar)

32-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a375ce31f1..dc784dcabe 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1388,3 +1388,13 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
+
+### SVE2 Memory Store Group
+
+# SVE2 64-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE2 32-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 640b109166..7fa1e0d354 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5728,6 +5728,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     return true;
 }
 
+static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_ST1_zprz(s, a);
+}
+
 /*
  * Prefetches
  */
-- 
2.25.1


