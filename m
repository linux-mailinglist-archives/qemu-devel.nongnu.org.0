Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40FB31292C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:07:44 +0100 (CET)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wtr-00078a-QW
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSL-0002He-Cf
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:17 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:56143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSJ-00065O-Qd
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:17 -0500
Received: by mail-pj1-x1036.google.com with SMTP id s24so7394145pjp.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAWykP8xawhD0n2LEjnvxt6U+It9ZnMCGaTxxtC6jn0=;
 b=Phli01Bxq6KD+pBdsGwXvjiRxxg49Nmd1gdPgGnsveVpNhPqc3McMLFEvdcgEuggJ9
 BGVqR7vy1tQ5RYWpCRLmoteeNKLrW4dSf8keB/oI1joXqqk7y2c8PjpdpeMO+JLzwQjk
 M/jc8PER7Kip0mQBV2NJp+SZg0SSGtHQivaeG/W57TfqiRweEO+57ZTqWdlRCnypFtuY
 PFSzwcKW63TdpREgWbw7qpAo95m/kBMlFURMnC5i8aixGrBBrEeg+7rOKTetVqYLg6nV
 JBbi0ctRukoij3RYFehLAZnltm8SCBCinvEjMnYtF5KCDeRNFu9jNEAHqzjxO+aflhyB
 nvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAWykP8xawhD0n2LEjnvxt6U+It9ZnMCGaTxxtC6jn0=;
 b=B3QaHepPPw6j4mf63T2ImTX4Vsu9zpG573lmaFsoXEW/N10+PhGuNzDCmLrih+tyf3
 c+kuqMS0h/7vEAMzP10G8LUZMrpMHDbUOF7PfJsbglgzYfV7k6BDIki5sYtTLpTtuLy4
 /0dKXC1CXpqkgXa6bLcs5zP21iDaV3Mnj6tqNEHWhXzr3WUGObr1UyYEiBRXp4ttzd0R
 +UzHxqGiyqulBL0CyoobNbD0lxCRHc0SRGkO/WSwe/vCitN4xvFGRTlBK34Dk1bYBHSx
 Z/z9YnqZkIcpnstyDhxm3KXJgmb6DO1dRtJEqnqllbGeR13d2oiqPNsI82jF2G77wLc8
 hHYQ==
X-Gm-Message-State: AOAM5316AWs6SYUnOYUu7+pWFnkiN+vfaX0CSlULtyX+nXtRxiHZneTa
 oo45DZJ9xsd8lWLeTZYOZ66Xt1yrVJkTMQ==
X-Google-Smtp-Source: ABdhPJxM/vLNKZgoXxXksLEYJjTQjEYZ2lZ+r57HdUM3VPGi8gaLkxzTCEJtBQVdpHoqpUphyrNq2g==
X-Received: by 2002:a17:902:b18c:b029:da:fc41:baf8 with SMTP id
 s12-20020a170902b18cb02900dafc41baf8mr14332449plr.58.1612751953587; 
 Sun, 07 Feb 2021 18:39:13 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 40/70] tcg/tci: Move call-return regs to end of
 tcg_target_reg_alloc_order
Date: Sun,  7 Feb 2021 18:37:22 -0800
Message-Id: <20210208023752.270606-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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


