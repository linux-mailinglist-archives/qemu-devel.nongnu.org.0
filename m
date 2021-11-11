Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7644D5BD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:21:43 +0100 (CET)
Received: from localhost ([::1]:60786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml89G-00033E-JZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:21:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7v7-00055U-Ln
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:05 -0500
Received: from [2a00:1450:4864:20::42f] (port=37576
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7v6-0001jz-0S
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b12so9159692wrh.4
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n/Lg6tRRaf0tebXMyPh4xLh7Yicv5KIZg8mfFnBTuXA=;
 b=Z8+vuNkQAYjTxmQ52CYnP07l42a1u4YnAPm9TyxAHUGrLUihx/MLWIXCtE33elYWcP
 s7SS66YTB1Ekd+Td3gBYSz+F+4TSi2ba5JzJHFJNnmpvzsNGQu9xrusgrMYyRDO/y7f5
 8Y90PVRKgc4M1xBAGgYrk+sqemjsMZ9QjqFe0dTIThBm7Q3IwEKXJdwqtUW30GP2n2R8
 Te7edOEj3eKo4ijZ/mQv1EbfOwYeX8YHu7v1lKzEYAn+SEYsfgy6AfSEblS075O2Ba7i
 11RaTtswMVoER1DvI0YuBgJH9rBdJ1TYilVugEXUrtBVC4wX//1InbhkIcZn/DFO/zUo
 tmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n/Lg6tRRaf0tebXMyPh4xLh7Yicv5KIZg8mfFnBTuXA=;
 b=utmZ945pgght6yqoziKorDN1kExCKGCN7WN8GLEfQIrHS8/MSNLpFUaS2oYqK/hdCA
 kbOceDqOJ6UuOLBr+KF6aiU8mH8iO0u5nDyLDju9MABtBGpIQ9L+s0BypGACqSAMrZUV
 NBMYMVFpoUXgasWGMvGihwJwGwKhhzSSioiJZuCTxJIjRut5EWJ70pMKtOwyiz0qBVmD
 uhfZ3jQ6mYqtsi+loDVyQ52jLcuayFOJHX2mVLu04BC6I1IaXUKGQY6ywNKr8bfPmn+F
 HwI4v7NfgaPlF6CIqgtgVUjlwVUFaok56t74kuDOolC7dOKZfx0T5SyK0gRpmZF+YtLy
 S04w==
X-Gm-Message-State: AOAM532yLHAUNGjjMe4ROSZAv4rt5+N/IgEV+pb8RoB7iSSmVVZXlmap
 FI/gRkBaJbEzkgySK5U03uUOiNnFnEj0BJjhOaw=
X-Google-Smtp-Source: ABdhPJy8ESNWTKehN3ACex3iKyOLn7uxn6IwfJe6fwJPV13iyvUo2NZqr3OUbSLFrn5iLaMClUu60Q==
X-Received: by 2002:adf:f0c8:: with SMTP id x8mr7522434wro.290.1636628822630; 
 Thu, 11 Nov 2021 03:07:02 -0800 (PST)
Received: from localhost.localdomain
 (10.red-95-125-227.dynamicip.rima-tde.net. [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id j8sm2536684wrh.16.2021.11.11.03.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 03:07:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] tcg: Document ctpop opcodes
Date: Thu, 11 Nov 2021 12:06:55 +0100
Message-Id: <20211111110656.237727-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111110656.237727-1-richard.henderson@linaro.org>
References: <20211111110656.237727-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: a768e4e99247
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/658
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/README | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tcg/README b/tcg/README
index c2e7762a37..bc15cc3b32 100644
--- a/tcg/README
+++ b/tcg/README
@@ -254,6 +254,12 @@ t0 = t1 ? clz(t1) : t2
 
 t0 = t1 ? ctz(t1) : t2
 
+* ctpop_i32/i64 t0, t1
+
+t0 = number of bits set in t1
+With "ctpop" short for "count population", matching
+the function name used in include/qemu/host-utils.h.
+
 ********* Shifts/Rotates
 
 * shl_i32/i64 t0, t1, t2
-- 
2.25.1


