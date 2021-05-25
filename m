Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E9538F7A0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:41:11 +0200 (CEST)
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llM4E-00011B-D6
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXu-0007t4-Ia
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:47 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXd-00040r-8r
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id j12so21402660pgh.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TTEy8kE9jF34vkk9pbuNVU/WzIkyybKzFSfIHyfqAxE=;
 b=U9Pl1I9buOSt4dI/AIC1yQ9vQgLkUUIOLdXcPfGtIEKdAnCRi9iPDZWo8foGVjDHsm
 6ZFVUL8yooc6sXx3U1wAds9usnazcNWKDiKeqmbPM7dVDr0h0Rv6Tio+8ljA/sr6bJ+r
 QTJx2dcBd8/2gft+ZEU9PsZwvHxlGg9lHEqJkB8OYYnc35eF1vPyHlZqd9wce1bMhnsA
 f+iDvW6wxkU2WiPeb4VssTY3UAOmgksXi8uFy9jbs5eFhzAn8keyRdRP+OO2qW9d+tgS
 BSchvWNbxvVxUFASO+XzrewwbW1HEgBjkfUpS6hBYpZY6iddLvKgJNJSB5/40Bntoz0K
 XNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TTEy8kE9jF34vkk9pbuNVU/WzIkyybKzFSfIHyfqAxE=;
 b=PF5FL4N1wx1VDs2pPi5LfPfdpCS1wUVRRWS2OuA8ozhFVmo0J1V650AcyUTcOCFr/u
 vO+xRc1i2DmhmxBX+z87BXiIAJ4dGsvUKRpRSlVVMlpwAeHMpx0OvwOnnV3ohDnZkYWx
 lmazJIxAFubJUj68WMZyepEBCDKM+L0v1VkII9v1rVLQg3Eud5CnD659TybwQtcsa25K
 iD73cbeH57slCjoFkyi0cPcuL4Q5wlRLtRhCM4seoMKYDPjmXlsxImKvnncGssfT/TLC
 D4LMNKv1t/1CY7+BoFgl2gCc+oEckT60hkuS//ddlZTRl7mS4k9G4rpNwkLrvVSBo0ZZ
 U6Rw==
X-Gm-Message-State: AOAM533UWhLQ1n9w3Tu/ieXcm/vyLu/rNy6nekjjVFNw865ueidIZvHQ
 AFZoudbJl+2SJSonehw4IfUqIj8z6Bz5Uw==
X-Google-Smtp-Source: ABdhPJyvfUKkbD0DnxAvtTqtx60+cuuxqro7ZAnKQFKjouS58ZUNUvvoCvyyyUyG3VKxCIHiKWIw2w==
X-Received: by 2002:a65:420d:: with SMTP id c13mr16268095pgq.370.1621904847042; 
 Mon, 24 May 2021 18:07:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 44/92] target/arm: Implement SVE2 scatter store insns
Date: Mon, 24 May 2021 18:03:10 -0700
Message-Id: <20210525010358.152808-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7645587469..5cfe6df0d2 100644
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
index ba39ff84a5..ac43bb02be 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6167,6 +6167,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
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


