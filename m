Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BBC397643
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:12:57 +0200 (CEST)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo64e-0006o4-E9
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tV-0002Nw-On
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:29 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tU-0002ae-2V
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:25 -0400
Received: by mail-io1-xd2c.google.com with SMTP id b25so15646339iot.5
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HVx2cEUQ9ZpP9PZYmFmM1rD3PJzpFBQDc6WvDYs8Q98=;
 b=WL1U+923iSQ44NktD0hTfa56bhyXspiwtXKJo5bJKKV8RqT5mw1qt5XRLPIJ9i/1Bs
 G7pHtNDTDC6TaHSNptGF4wAzI/F8/JhkbqT3uNZUqcT1cIiif6Ekmn303E88tpSDOAux
 ywSWyAyjcjVi7BCsMFFXNl22NZn7pG2MladOGn9S9H6nMyxN+zAySNRW3wG08UD1FX2H
 qika+bqXNEMN/UL+NZRaYoGOtioC6mLl1aSfwGJm2dfOw3rpd7ZFXcPfo9/NZ1GlYS4b
 /lnMZTHPAw1Xwoq8Kle25D+VMUAtRENKD5VK5Gbb+qinO0EYsctdSNFaiz1SS9DmL1eA
 nFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HVx2cEUQ9ZpP9PZYmFmM1rD3PJzpFBQDc6WvDYs8Q98=;
 b=h4vRu6Vz85CO7FDIGi/7vdEZKuolhu1FtI+/FBCZudl3+S3wSZS1MMh/DukUapTcP1
 bhGuVqOg+otECWbBzrjHNKcsKEpUslo1zUlMzVXtN3hcH26oEIVfRC5yaKxyYFUbvG2d
 2ZVyqXxvAWiNL4niIHR1IIjkDzg2tW3Y3SfHvYzeQ9Tv8Kcmy30QrkNPhVcMRYn9C1gy
 rtbuCnHR51cVs/+Q4X8WOzHf2uISpXmbR4hZyy2uhqUsVhvn+eAM7eOEWwN7zi/Tyc76
 CGgNgdJmsTvpTLrw6dKFmM1pubaQOffEm2xYPvo0BKAC53KCCDxc88XkTIMPvykO3NRv
 J0sA==
X-Gm-Message-State: AOAM530y8cCcQsWbAXwECMeIKZLxAFi+eWCRJBxQRsU+6lX77vpvJe/P
 51XMkP6UCwASvr9p2YPc/h0J9mZe8xaPQOLS
X-Google-Smtp-Source: ABdhPJwGkW/5BJQf7F1qGTd+/J2wzTa8XV9cikiCfOuVP69ltQzIs8uxEfkeF3LS0qVVtfdmsHvhnQ==
X-Received: by 2002:a5d:9a97:: with SMTP id c23mr21721510iom.38.1622559683066; 
 Tue, 01 Jun 2021 08:01:23 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/27] tcg/tci: Move call-return regs to end of
 tcg_target_reg_alloc_order
Date: Tue,  1 Jun 2021 08:00:49 -0700
Message-Id: <20210601150106.12761-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the only call-clobbered regs for TCI, these should
receive the least priority.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index fb7c927fdf..288e945465 100644
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


