Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D59C397626
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:09:47 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo61a-0007mS-5l
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5th-0002Px-87
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:39 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tW-0002bq-EF
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:31 -0400
Received: by mail-io1-xd29.google.com with SMTP id e17so15640667iol.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZAx9TvSQNM3qsvLQFMHbzkqCPVAz7mL5WVLxntL8Zaw=;
 b=lhAQhFUVunzF9XBHKpt+9OR5KGkWGoswO2W3E2C2OpPWHv/UUhKUw+UnQwzSt5cCaq
 +Kka9Dt/ZW711LZVaGw2MwKZjFfh8wTPgf+IWYuc0rCC/D1dVAzU8dWkOej8n/yOG8Yd
 1BtmOzwg2nrCLTFrllN1g1/uq2MUkx4oliB7YDpviIb+9NaJuHY2ccA4BIoXjwibCjBb
 OcBktCWhGxUmpedOpSME38BDM/GXN7UuiI1bcWpYl1HPaC8LKPJIFIqBaWY5zzY+M7O2
 qLRTG2jNIceJVfjwyxO5IXrFjV4iGf9WKFm2tYelz+gu7AD4mANHN4lfnCjQmN52rA0q
 7PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZAx9TvSQNM3qsvLQFMHbzkqCPVAz7mL5WVLxntL8Zaw=;
 b=J4ml9wM1iXmFKDhL7PpJhDRG7P2zJ/mRXCJ+CUyDcSh4RQgwQwia9r77xP9Oo+8Ajg
 fr6cjQhqeX5r1WZfr5IFkR2Ll1R/AB23P7HQrUSh+XUo+9CboEvV+AbYlcPGVhll2+nJ
 IgDKd3Bx8fVAjHmpTnYylh8J9RUwCjdfAq55evku4PMgOneg6GxOQm715Ph+0lHnLPfz
 me4ETrKkAoohF2XatbPvHgc2Y6apqNYY9iOBVChPsCyo0IQeTVqtDXgD5Jce1dsKA7E0
 UBcRA3IH2aIH7LllXptTbLfSt312/td6qJFeiLS3yMFV5MsBWJqeKVrX0ShjUwmhWrBf
 wDkw==
X-Gm-Message-State: AOAM530mNMky4dGJBVqlOs8A2MaQnCaR0/+SxH7KbPxgmixZ1G0MWFfy
 9nfZL1rsFHcm9QDndNWDPctiMQ3XTFPHJQhQ
X-Google-Smtp-Source: ABdhPJxQxMYNPiogP4eWODGtmpo7Qypo/2j35DTE4QP8e1WJOuspi8WIMl+EyQdiJWhzHkBf4h9noA==
X-Received: by 2002:a5d:8485:: with SMTP id t5mr21611351iom.89.1622559685216; 
 Tue, 01 Jun 2021 08:01:25 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/27] tcg/tci: Reserve r13 for a temporary
Date: Tue,  1 Jun 2021 08:00:51 -0700
Message-Id: <20210601150106.12761-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd29.google.com
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

We're about to adjust the offset range on host memory ops,
and the format of branches.  Both will require a temporary.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 1 +
 tcg/tci/tcg-target.c.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 4df10e2e83..1558a6e44e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -155,6 +155,7 @@ typedef enum {
     TCG_REG_R14,
     TCG_REG_R15,
 
+    TCG_REG_TMP = TCG_REG_R13,
     TCG_AREG0 = TCG_REG_R14,
     TCG_REG_CALL_STACK = TCG_REG_R15,
 } TCGReg;
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 9ab7916300..d80fec3488 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -822,6 +822,7 @@ static void tcg_target_init(TCGContext *s)
         MAKE_64BIT_MASK(TCG_REG_R0, 64 / TCG_TARGET_REG_BITS);
 
     s->reserved_regs = 0;
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
 
     /* The call arguments come first, followed by the temp storage. */
-- 
2.25.1


