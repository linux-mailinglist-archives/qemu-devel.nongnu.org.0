Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4BB30EA44
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:37:11 +0100 (CET)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UW6-0005XT-Gg
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjj-0006D9-AB
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:12 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tje-00049J-V4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:11 -0500
Received: by mail-pj1-x102a.google.com with SMTP id d2so820872pjs.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAWykP8xawhD0n2LEjnvxt6U+It9ZnMCGaTxxtC6jn0=;
 b=YGX1wPtCD2Ap8FPJxD1u9xl6GRm8bV1wPkAN/ScfYkHiHzeWPipbnbmzIPZjU6h+lB
 BwEs0JgZnBAbBOgvdkgEl/hCczUb4ouloF2Cmpfy4bxjhnkendyEnLrcvVI6OoHtQ55a
 uvm9Kwead7s8U+2JJLbZ+kYBSN1ViIFLHuB70KYYU9a1RuYkm4EXzTVoC+RtAGiGE7/J
 pRVNh2EcPEpsF4maDwVY50OYBwaHYVkHFQjPp+eS+5vllbYZn47l26TjIFA/hXPFhJX5
 fKeYFZUkZMtApMOab3kn6/14XbZArQrFqfMd5qfDArbd70FMWqllCF59g1oynGiBQ1jV
 tDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAWykP8xawhD0n2LEjnvxt6U+It9ZnMCGaTxxtC6jn0=;
 b=YH6DJlzYpnIAr77q3A/UHAJ/lhAEeCrFSD2SxOU1mQBQz6/dxgnlKXfY8sIZvu60zX
 ZbEnjkrZyAb4e24uEwMhp0ULK2h/5P4uxgX/RNPn/gknM6hOXl1LCwWZaHa0A94vIaUE
 s2eoUkBQUUh2RqjFfuo+cPNDxc8hJMAcXkRPAB4UUwwWhibn4Lj0CUbSwf4nDeXc+WIs
 XbXJ6F6fPm2Q7n7nU2LmrpjO8gYgcZGRgdaYC/DmCOjYck7hortXoXyS8gnESgGG3/X+
 MdigynzvOKXQFNYOFySzbjNS8iGYUv2E9VRLharZfP0SDhmfk+SlL1Bhhcf6DKhQVqXB
 IQ1w==
X-Gm-Message-State: AOAM533gjeQBkPYfH70E3hYUOXqc+jP1+UpFfMKQvjmz2DmG2knA0nmC
 2hT8wfDDeXZ3wUp0bY0wCYGL+KyqGDje2N5G
X-Google-Smtp-Source: ABdhPJwB9ct52ywpGtTNuKyVMpYwBcIrz7raZURjJonyAJ2urPxdZehjLNrx0gIlLc/+bZ2LBx5QQA==
X-Received: by 2002:a17:902:70c6:b029:df:d62a:8c69 with SMTP id
 l6-20020a17090270c6b02900dfd62a8c69mr5597285plt.20.1612403225526; 
 Wed, 03 Feb 2021 17:47:05 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 65/93] tcg/tci: Move call-return regs to end of
 tcg_target_reg_alloc_order
Date: Wed,  3 Feb 2021 15:44:41 -1000
Message-Id: <20210204014509.882821-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the only call-clobbered regs for TCI, these should
receive the least priority.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 4dae09deda..53edc50a3b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -170,8 +170,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 }
 
 static const int tcg_target_reg_alloc_order[] = {
-    TCG_REG_R0,
-    TCG_REG_R1,
     TCG_REG_R2,
     TCG_REG_R3,
     TCG_REG_R4,
@@ -186,6 +184,8 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_R15,
+    TCG_REG_R1,
+    TCG_REG_R0,
 };
 
 #if MAX_OPC_PARAM_IARGS != 6
-- 
2.25.1


