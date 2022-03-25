Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7BA4E7A88
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:57:26 +0100 (CET)
Received: from localhost ([::1]:54960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXq3p-0001MQ-FU
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:57:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzX-0001tz-UA
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:01 -0400
Received: from [2001:4860:4864:20::2d] (port=39517
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzU-0008Nl-Ga
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:52:58 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-deb9295679so1867059fac.6
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h84Ot6YbttCAVb4FAH99rqg1sJS9c+ZhMv9JcX0XF9Q=;
 b=CERlubgB5yLilj4KTod5YACYRlOduGiMt609oOuXSvcI0xg7ehgOwdV+QDo3eEoFDE
 CVodq+RizfzLT5hbVRYuwDYh8ELmJftBr7XslaIicbtSnrTD8B2Ht/l7S/TbwbH036VK
 +AjzfhkAuhXJZlMwwo9XlHURaJWWWS4StuQol2D3FGNr5dgbN4lV9uxX+phQVUzJqTLS
 mUf2cJXVPk6llLL92crfBjE9TiHie1/2XhBjdOpi7OEGoToA7x1PT+FXPCqmonoaaSLA
 kkAiLFN+yORJItE3ptG+zu624GbJJAzKRoAjSCDRbwXUT9353pkcjLwvvfadWdE/Cjf9
 Pxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h84Ot6YbttCAVb4FAH99rqg1sJS9c+ZhMv9JcX0XF9Q=;
 b=mkZ2upssMrtCsT4DxMBseN568i5hOcCX995NM+qJFCzfIIgLg3vzCYRECIRnpnYPS8
 dAeK/XYpL3rT/tl7mgY5IqrJTcQTEU3D/ApuADvpd2EqrjoM8xxIr+6IgwMIarHcDRd1
 EviZJyCJIMu5Z0fvgdbGhcVdv6OUfE/1IPZVz3UY85DsRAUOCdg1xQEvsIigb1iZ2gt6
 JN5OsPmQxUxNe2FwKRfVNIzmi0Zc6c4TeskO9j4k0R5R2I2SBi7vWy/1VclSvBnMcxqQ
 DmJlpGHdfqroCKNb+1fSaAaxIaf+qDIaNxEO8tM3/T7eu2ZL2xAjdxARATGo45NzOXN5
 kkJg==
X-Gm-Message-State: AOAM533IKiS51klNJn0hrqksx7gH1h12LjjFot5rV99ikWQBNkXVnxZi
 7CLt6tPCxg9K6qIvqKLeqEQndBbJyPhxcDhQo4I=
X-Google-Smtp-Source: ABdhPJy9pLUqxMyF8g36gEU4Xj4VQVdpvOMqc29VDxqz1qOLVsNyk6njFu5aAZk4guUXCZASY3ryxA==
X-Received: by 2002:a05:6870:f71d:b0:dd:a49b:60bd with SMTP id
 ej29-20020a056870f71d00b000dda49b60bdmr5680018oab.217.1648237975261; 
 Fri, 25 Mar 2022 12:52:55 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm2153730oab.35.2022.03.25.12.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:52:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] linux-user/nios2: Fix clone child return
Date: Fri, 25 Mar 2022 13:52:44 -0600
Message-Id: <20220325195250.386071-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325195250.386071-1-richard.henderson@linaro.org>
References: <20220325195250.386071-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The child side of clone needs to set the secondary
syscall return value, r7, to indicate syscall success.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/nios2/target_cpu.h b/linux-user/nios2/target_cpu.h
index 2d2008f002..830b4c0741 100644
--- a/linux-user/nios2/target_cpu.h
+++ b/linux-user/nios2/target_cpu.h
@@ -27,6 +27,7 @@ static inline void cpu_clone_regs_child(CPUNios2State *env, target_ulong newsp,
         env->regs[R_SP] = newsp;
     }
     env->regs[R_RET0] = 0;
+    env->regs[7] = 0;
 }
 
 static inline void cpu_clone_regs_parent(CPUNios2State *env, unsigned flags)
-- 
2.25.1


