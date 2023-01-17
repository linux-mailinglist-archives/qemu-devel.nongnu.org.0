Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE866D534
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 04:58:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHd68-0000Vd-Kq; Mon, 16 Jan 2023 22:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHd62-0000Rv-P6
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:57:14 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHd5w-0005dy-QB
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:57:12 -0500
Received: by mail-pl1-x62a.google.com with SMTP id y1so32268399plb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 19:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6MPxEUMXrC89FYEjdJ+17kvnFvsaHy/DYKnQJ+XOEw=;
 b=KKjEzz/4dd13/uDD9dlBwfeDYngrfh/knUixTMF1xclJe5anDN4uunnKoaQRc2NO7C
 q/Q8hz4T/SuEr86gzz7dg9uUpvbmvMtgs92+ZLBMUY1sUrb3ENmMxXtudic0xG71vX/W
 sN/yYFjV/sZjynbBQgPa1OlvegpjrhfLLbJ/R7UcN53D3vISIR8QAujRcnZ4rrS9V09J
 63GXVRB+w++L0kW00LFXkIT1OZSgDwVV1eSAFk/+Kcf6972y003QHkbMca9DCKFzBNb5
 PqTEuMjNJKS5coW/HF6bbt2ZF2xQrX2TLDMw+KuWpFCDzlCpq3gq0535+uF4aVcPrGVe
 5xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6MPxEUMXrC89FYEjdJ+17kvnFvsaHy/DYKnQJ+XOEw=;
 b=Zzu/aJxKLxzqxKDNSaUtdJeC7E18iHdNWFQ20aYgvM6kkjZboCO11EupuhC4sZU9tE
 9srZevzXcqcC6sVHNmvUv8X9C9C1tPSKu0EO2bF0u/7uLYf74R3cTxiTpybo0sdT/8dZ
 oFvP/xD58AOW4+3j2jxsPUHY4SNrixSWjxxXvWvYWPJ6v+t82kKa1wSBsj9a9AfK8Iow
 vpOCZHN9B3APl9DlKNO+U8/51RXK07L+rbtI7NnKxnHMo3n0wMFPjaCOYFuWSrhfAwm5
 Smt0zL1wUd9R4N7Gu6/7OwRNLrOfBQMKQTyJNa1SzfmEDyUC326rdjNiF1CcXSRvcikr
 SVbQ==
X-Gm-Message-State: AFqh2krNUJq1UrXeuXePwGlH8a0TeZ3PK5pkrX4SuBFkay02yNKR4mr8
 ZDUyGW6eviY53W1DOyCmOcpXByCg+U2BIWvf
X-Google-Smtp-Source: AMrXdXubepgvgKRZnYy8OzF720pFv0DwTqdaIlv1GBcm84ppDZ4pIWGFT3RBEvuhTTlMLh4t2sGv3A==
X-Received: by 2002:a17:902:bd85:b0:194:9984:8085 with SMTP id
 q5-20020a170902bd8500b0019499848085mr1770539pls.40.1673927826034; 
 Mon, 16 Jan 2023 19:57:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a1709027e8f00b001869079d083sm19991531pla.90.2023.01.16.19.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 19:57:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 1/3] tests/tcg: Use SIGKILL for timeout
Date: Mon, 16 Jan 2023 17:56:59 -1000
Message-Id: <20230117035701.168514-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117035701.168514-1-richard.henderson@linaro.org>
References: <20230117035701.168514-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There are some tests for which SIGTERM appears insufficient.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/Makefile.target | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 14bc013181..a3b0aaf8af 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -54,10 +54,10 @@ cc-option = if $(call cc-test, $1); then \
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifeq ($(filter %-softmmu, $(TARGET)),)
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
+run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2 > $1.out, \
 	TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 else
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2, \
+run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2, \
         TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 endif
 
-- 
2.34.1


