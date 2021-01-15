Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6FB2F8742
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:10:40 +0100 (CET)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WMh-0000Xg-H0
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHM-0003hh-8x
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:08 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHH-0004B0-Kd
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:08 -0500
Received: by mail-pg1-x532.google.com with SMTP id g15so6786792pgu.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AJz6X2z83sq9zu8I1AI+3znXcrPw6IHBtwUmYsbtlQE=;
 b=m5G9es3F82yLAPEDlobQ4CU27Q8q7rHQr4Fu34myWs0H9v4IRyC2y0Lqak0NQJRgiX
 Po6+L9a2lqKGXDDXB1ahV/oJ016ysm7jLdJI1EEYBcaKEdYKZIyF4ScNxLnaJ8hOQzbV
 zI5SnSSQVIey9xYVGInEJdHkpquEbimdPG+GCBAvfixuwoYonW0qJpch4GtPkYHxtxC+
 94L1FQtwl7D/srbnXNKWM8FQGiQ09b6wF1Tkg+ZZDcCt0DUdOLUgq05RMtfV7oGtPtjK
 R9+xTHA7hDw24AvvNGEiKNcqENyQxY9MXrsqx0KtXx/JYO6bmZnptp/kte4Kw5RCJRgJ
 3SHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJz6X2z83sq9zu8I1AI+3znXcrPw6IHBtwUmYsbtlQE=;
 b=OfJDKPAzeajgYhaKG2GgSU6WDtr5k8Jc85pL3YjlglukNpKoHG3yDTcOheOZZnAcNM
 pqgJVyodwC3TqBb+uTH/AydTujGmg/SDzpDqW0vFoiD/VNrxnVW8hIznOSS/NL860x5S
 IdIFqAlHzeCFW7zI3XdFUWHfRthWov/y/DhoCueZrpI1loNkTlxjB7xtBoZwZcJuoXvV
 VzBO/KjSRvB2gJFR9GTvxKMHt/VgsPgad8ODk1cwaxa4corBoXA/FJ7NWDxLCkwo/qLm
 ObNvZ1yGIuNeXTIgMTFzrU+kJ5+yMeTcfXEHLzTncyiTPrV0ijnSf87M11RHJlgHwyeF
 8qeA==
X-Gm-Message-State: AOAM5317QpxAskW63IvJJf0LFUmFPWknOlsk5XHzfdtnS4+HBBkslval
 S682wctrMxMqFd30MBz51W6OyeVv8osza+8R
X-Google-Smtp-Source: ABdhPJyS0c0X3ZDSJyN9mS0NA4tSl3/tkQv7S22GlPonNlNnY3/XIhSjiE+HtUguLRsl/OpeGMAwZw==
X-Received: by 2002:a63:5d53:: with SMTP id o19mr14666096pgm.39.1610744700980; 
 Fri, 15 Jan 2021 13:05:00 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.04.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/22] tcg/tci: Drop L and S constraints
Date: Fri, 15 Jan 2021 11:04:35 -1000
Message-Id: <20210115210456.1053477-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are identical to the 'r' constraint.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 15981265db..9c45f5f88f 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -46,11 +46,11 @@
 # define R64    "r"
 #endif
 #if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-# define L      "L", "L"
-# define S      "S", "S"
+# define L      "r", "r"
+# define S      "r", "r"
 #else
-# define L      "L"
-# define S      "S"
+# define L      "r"
+# define S      "r"
 #endif
 
 /* TODO: documentation. */
@@ -390,8 +390,6 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
 {
     switch (*ct_str++) {
     case 'r':
-    case 'L':                   /* qemu_ld constraint */
-    case 'S':                   /* qemu_st constraint */
         ct->regs = BIT(TCG_TARGET_NB_REGS) - 1;
         break;
     default:
-- 
2.25.1


