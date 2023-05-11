Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A7E6FED85
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:07:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1It-00072o-W7; Thu, 11 May 2023 04:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ik-0006e4-To
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:27 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IZ-0000x5-EW
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:26 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bcb4a81ceso14613694a12.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792314; x=1686384314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9OBWczxe5h53DTHTDxSKKonJLPbtryLCHBXLUcxswCo=;
 b=nP3eyBSWtMqwFJbFkMkh/+vp+qTyqHp4G/hcDnCFsiWCTH82TieP6Nsd5LOn7oKZtu
 hEGOxrrLjg7aGziFgfnOGmUqOqop8bbGjlS9XHpAueqTMnUzfadPp6gFZlDzenKgGH+r
 uhf3Ko9AxtcVM43lEsBoLbJHDzfNaHnvbfmW4GyNQ0D4Ju7/+3stmP3TD8OHd+2vvf5P
 3XqxzqNuzkEIB+tsWbmY5Bhq+FyAMz6K1hanQAweCGl28v9gxC1cmKvs1fUQwo0lF1dt
 uAnaHVWRoQAv59yfVX7J3SxT0zON1wS1yxj+6fulOEZUo2zL/wDVrD2RSpTGSUYwnNNf
 w04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792314; x=1686384314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9OBWczxe5h53DTHTDxSKKonJLPbtryLCHBXLUcxswCo=;
 b=fCqvdhByRmqaWKj6vWzhl8R/+Lf9z1j4608TnUM0/Q9UMGUM06klhCDhp+pW+Y0mQd
 asOJLws6kMBwguycJ7hkFiUoS8Xbs3vBGPd0fbmKL6DXbC8CE1BNG5KDY0PD+Cgmmi4A
 hum99ac/QTbRJ0zu6DOxFY12crGaR3lwKARq1EZdkb8Y6E1vBTgzNC3TjHXuL3xeOgCL
 VN9QoVaKB8O5ntRvSLMspCMf7pWfDSJ2tQYx4PaqcJjMzvVTKatGFJc0N+0GqfyApwOI
 qptb35o9ZkBuCNZpRkfDGnvcQwcfzlP0QVRxFO2GAP6iS5X0CIwpbUDHDa7YxKU43WLN
 QFvg==
X-Gm-Message-State: AC+VfDwAEsfDpy6y2uVnnH8H2av8KdNAYt48ObIwjFXQ0QPdyIVBKC4/
 FhYn9UWkPtohgVcgwmnyA7IrhlKrDnOGEkOfVhwdPQ==
X-Google-Smtp-Source: ACHHUZ4k2hMvspZaXrx8DTb15939ozrH40LK7h7bzwKbWBAeY6v6tJDmQqKZKNm1t1iBkm5jFoJhcQ==
X-Received: by 2002:a50:ed99:0:b0:50b:d5cd:612e with SMTP id
 h25-20020a50ed99000000b0050bd5cd612emr15383180edr.3.1683792314664; 
 Thu, 11 May 2023 01:05:14 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 36/53] tcg/ppc: Remove unused constraints A, B, C, D
Date: Thu, 11 May 2023 09:04:33 +0100
Message-Id: <20230511080450.860923-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1


