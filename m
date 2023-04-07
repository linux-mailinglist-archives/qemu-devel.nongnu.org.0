Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175436DB3AC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 20:53:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkrBn-00053L-Qs; Fri, 07 Apr 2023 14:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBk-00052K-MY
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 14:51:57 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBh-00087V-GV
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 14:51:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id go23so2421044pjb.4
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 11:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680893512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zTH6CuxWrs3z8O8UOxqSLGt5vbpCwQ7b4HezyRm7T4A=;
 b=ITvzG9Z+LfxLtCWv+7OYOSLDXxlkY8q+kL4+VK9C+PMjZOajRxHU4m69Y/93/zgTup
 826AdLSBxO0ooW5RbEJipPGx+st8cOZEHSRuaWJirNUxt5yDWS279QDUvou1WwQsIQaC
 3fOg6ijoh06WxWF3BA2ohVHCPa1uiGhYEbSFKMlXcoqOzHaybMjQvtfHPSF673l2QUeY
 F8ZKrPG+GfbXvJfs+qCNtacBI/NRgPZogRzHv9rQq3Q9wekgeQoSrCny6GRA+RY033Ox
 CLyzS0IxHtaMwNL/nyKPnYCth8fzoJY15Atm0eZM/FUj53PdKqpyFIwmuveQeg59CdSx
 Gl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680893512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTH6CuxWrs3z8O8UOxqSLGt5vbpCwQ7b4HezyRm7T4A=;
 b=6r4ME0zVwR3ggXBJBSyguiTKKAISRV4xTCaMY4UQP/9xQsYDjELEEO7kd1KPRQgU32
 +IT6ls3347w0IanTed7Y/Ui+b25dwnsjrXj9H7xQmQGN8TFP5r6WucvF6MQFki/6L2gr
 9Ui5GtpBUXqEmfZHqapAU4jWr46pxgVMuB4WCj+PVRi6Hl4afFAgMZ9cg3e3wknE3nu4
 zzsNhj3Al3EQgWmAc7uENgcB/WuiUhcTsXwgMptAfUQ2VOmCpKBhiVGc3yOTgAPuWP8h
 Ji1Bk99BbDDzL8Ujfxtxzb8u4WtnIibg4lAgXvfoZ13i6EWG9OYRiqzu4P6Dgk/Y3Wq4
 ehMQ==
X-Gm-Message-State: AAQBX9ene9KA/JNAUBDEsO+KU7RgTvQ0P6F988+g+F+kUKBnV+c8l/AE
 1ZN4MJ0it6B3h/8geqK5iVAd8gWGMceu0wh5xfU=
X-Google-Smtp-Source: AKy350bDDPTjlpEiIVBvOISRYOUCe3WXip6wY1tBCvESh1QpW3ern3THmyHdLUCMWDTglv5MFGbYaw==
X-Received: by 2002:a17:90b:1802:b0:23f:9d83:ad76 with SMTP id
 lw2-20020a17090b180200b0023f9d83ad76mr3342835pjb.23.1680893511990; 
 Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a1709028d8400b0019c13d032d8sm3205796plo.253.2023.04.07.11.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Copy guarded bit in combine_cacheattrs
Date: Fri,  7 Apr 2023 11:51:49 -0700
Message-Id: <20230407185149.3253946-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407185149.3253946-1-richard.henderson@linaro.org>
References: <20230407185149.3253946-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

The guarded bit comes from the stage1 walk.

Fixes: Coverity CID 1507929
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 58a6de09bc..6d72950a79 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2576,6 +2576,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
 
     assert(!s1.is_s2_format);
     ret.is_s2_format = false;
+    ret.guarded = s1.guarded;
 
     if (s1.attrs == 0xf0) {
         tagged = true;
-- 
2.34.1


