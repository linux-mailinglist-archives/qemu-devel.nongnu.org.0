Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5B847159D
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:20:29 +0100 (CET)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7v1-0007b5-EY
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:20:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mh-0004yY-5w
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:52 -0500
Received: from [2a00:1450:4864:20::42d] (port=47068
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7me-0006Ei-4n
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:50 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u1so20258090wru.13
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RWB1PQojSKR8xBPhbTN8F3p44SE2K4q7LWJViYpI6Y0=;
 b=ilCG5Jqiv8nW1ERNw5WJjav37DfZ8KG623Qr+kFFFfkuKJbmZ52UudOtqX9V5cUyP/
 wUPGwNZUo8iATtL+heOSI+Y+QlTNZRwiY/S8EKBeNa5yD5coUOVKdT98SpiYXDuPfvcG
 SlWd4qHtlgq0ZG50gpkgq1jtuyEWdOXLCfnBSMAKoaBVnNZAE8u9NCdTqm4Td2BMnTBJ
 GOTZTo9FzeRdnmOTjsi/3iuubD24QWLkWq7yLVh3dwnH7OHq9QrgvS6NYDtrw/fhiLsV
 mYxYUwHcff03f8FUnCWVBW6tXtcDYuiplod4n9NbtSiFVbXbWHP3wcQu9LRjN2+M35vO
 1s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RWB1PQojSKR8xBPhbTN8F3p44SE2K4q7LWJViYpI6Y0=;
 b=LNTQO9NeLIxGVMlTidUm3x70rvYSt9Pf7cHZhqU7koj3Crv3bqGQ6MwEbWMdrV8dPa
 MKB58r0cCYYHzyvY0Ug8ZtvgVyMtNAgmwS+sHntqDYJq0cXF6gaCIPFS0CgLQKcMAxxi
 UnuyEjx7AIxOKm9Dm1zFkSEPUwKwzZTlS0Z66Ciy51Ti23Q/XXKFaF5lX2yJkwtFWz9p
 usAuO5rNXOk9WkLie81sC1GEk1ECjL91w6+frVXiMwkW2+xlUM4Nwuk8OTmB+NGOqyD2
 ZuGXwREaGKo71cmfLK21AgmfWQKMvMqCP8hGhFAZH9LnzpgedYi/0YQWfio79DbjFxh9
 MSwg==
X-Gm-Message-State: AOAM533uwd/r+lQQtNVQG6y7l+ZbEUXgIeh8ScnHyFW7TV6LvBnzYcDe
 5UJywPhYe68T6w2BYKYCgXiDGA==
X-Google-Smtp-Source: ABdhPJxMbH1FvBAz8V67EMwQ3Soj3F4w4TKJq9mgE9+lPSeHXfdW6sVTXtM7+nG2I5nQ0wXIhMvCzA==
X-Received: by 2002:adf:c3cf:: with SMTP id d15mr6249900wrg.689.1639249906986; 
 Sat, 11 Dec 2021 11:11:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by
 (DTE.SIZE + 1)
Date: Sat, 11 Dec 2021 19:11:20 +0000
Message-Id: <20211211191135.1764649-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The DTE.SIZE field is 5 bits, which means that DTE.SIZE + 1
might in theory be 32. When calculating 1 << (DTE.SIZE + 1)
use 1ULL to ensure that we don't do this arithmetic at 32 bits
and shift the 1 off the end in this case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 7a217b00f89..d6637229479 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -258,7 +258,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -376,7 +376,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         return result;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
-    max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
-- 
2.25.1


