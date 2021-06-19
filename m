Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519643ADB4E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:26:11 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luffW-0005z0-CZ
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUj-0000j9-QB
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUi-0002GK-6a
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id k5so7550071pjj.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6t5cjIM/Jta9nl2/Scc7LjVmb2HvXKv6yCUdQdTGseM=;
 b=ddS4CFsly/DYmYNV+uZx6dgnVKuB1yIG89i0fXhpLAdCqMXGEuzJNx7WoyP2aliF57
 uH+mWB4tfXRCRZFNhaOBECV7EljrxxNaOdqo1O5cvGV/BoGGs6PgEonfSZkzx25FjVpF
 o9v6IY1mc2B6zTDKzK1sbdsMqS7SIKvR88dT+y6FL77A8O4mhQrIoB0zkZF7ETfnUnqL
 Y+j2TGAMGafKIZumerdHD59g8ABh7XdQu6kw+Exndgs5v/b8cc5HpE3in8ZEjhO9MEca
 bTzXUAMDi8q9jOgoscDbMUtO9i48kNu/btpNTtfkXIchhOzVU9f/eL7pwHmNRzfPERo2
 NiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6t5cjIM/Jta9nl2/Scc7LjVmb2HvXKv6yCUdQdTGseM=;
 b=MCNbxyd83NHeCJ+WiF8/AWYW5ivFCct/oHMKeE0EZwjgL1u+PkCugTcO2QtoLofat7
 f21jk1lIxLVhLwrDzfQTrBB7hJG/Yr4G18Xt6f1NzVG1W/Ls3Fo/5AOGLt9cDNY2BGxh
 iDFD/sonznhLxXFiGOW5YRlwhJeG5R5sYS5N+VP9i/zIDZYDTCreFieTizb5IscK6lwT
 K5fzOE6ffVU9uCSqaw0OjxpdEBupKEOFsdwC8eydvtktKc7qiYH5u7aCgDEm7abODf2C
 v/2gdA1PVy5GcqN876hn+rDY4WKJBv3LQzF4vJpOxZgmTBQ5id8jFsTIMJh/TFAg4Icq
 IgtA==
X-Gm-Message-State: AOAM531GXsrnp0j6XZKXiC8wMxtgUODlva53neC/YzJWHUVUNIZVDkVL
 zOUSUKwEK90ge65Vuf+3Zq7R3OcuaoN/LA==
X-Google-Smtp-Source: ABdhPJygN6AnGxms9lfC3zbA+mH2NkLeuwRR/vEf+J54QvFkd74ahRaljCGPAq1BxeK6YPh1ovYl9g==
X-Received: by 2002:a17:90a:3d47:: with SMTP id
 o7mr28864733pjf.68.1624126499110; 
 Sat, 19 Jun 2021 11:14:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] tcg/tci: Move call-return regs to end of
 tcg_target_reg_alloc_order
Date: Sat, 19 Jun 2021 11:14:29 -0700
Message-Id: <20210619181452.877683-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 8f3f9ef7d3..d54c01b9de 100644
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


