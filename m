Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE250BDAE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:55:41 +0200 (CEST)
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwZG-0002zP-EI
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWW-0008SW-J7
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:48 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWV-0007D9-6S
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:48 -0400
Received: by mail-pf1-x430.google.com with SMTP id y14so7761530pfe.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kt2BBU1GUjUG3/EJVuAysOFujg46su8Ylz5CGCHbv4o=;
 b=jStOSJ2bRLw+Zj+ZpMRSD7YK67WsZvHedr4I4mVJSyH7shW4Kh9gvW70GM78Wm6Wnb
 UHq6Q5iEVGO8ceQ9LOnOSqRreVZlTRO/zIW6T7X29dT1hOYpoMQIfEPlMBPDsDKMZvAh
 8GViVwK4w6TR6azlz0HPEzXnvFz3VpPecX3BXn9b4LEWP2bO5Cqw8mCk9mdMkag4pSd1
 XDxPeMCso4hENrObZAJB0VN6yUPlZX8dSp2QndsKJbab0Q8snRYE8TUDttfJxFHweIex
 Qbl0y03YBX+QfYFtX2AO6Bqq8MTUfHc2R92ICjUPR6WA3JGZ1llveVJyDxUq3ps8UFS4
 9w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kt2BBU1GUjUG3/EJVuAysOFujg46su8Ylz5CGCHbv4o=;
 b=pjYxIclAERyNcLchZjgLp9EgKwUKMHI2ViyuGRxv7cKHkXGSK8iDnpqhJ/7IrPmAnp
 e+bbuDs55AMWI/MnrMn0pJgcuJm9yMfYciAvbydiftgxaV2Psj019f24HVjJ0OQdae7P
 4cP95sBUwAXfd9yNlrIeRLxthsubav5/Pc4wccj8YRKRzgCdH6E/1PL+wr/qYPWsJGse
 pvuA00mCRI1EfxRHOmqAMYadZspeuW1GzF6NJyQ0S1B+O4Njor+u58iIWVuqLl91c8nH
 hRXkti/hZrx/CHTmjbFl6owpErUhFFk/TMqyglqMb/xlAEBljwzltiVyvcjSREhAuMsE
 H9zA==
X-Gm-Message-State: AOAM530gWQp3faxMyn1Yrb8cVlitK7TqEi+hmiFQ+W2jNoiKuPKRXX5r
 w/skzcyKnaK89IAWZjeytFUcu9NaQpiD1oo5
X-Google-Smtp-Source: ABdhPJyY5/4SZUrwqZ3eEGuS/RrXiiojB5R+fJIPFvozmwYmX0Yi90hVaTYUORTiDjek574JMhg5sg==
X-Received: by 2002:a63:c52:0:b0:3aa:2c45:67ba with SMTP id
 18-20020a630c52000000b003aa2c4567bamr4793812pgm.102.1650646365757; 
 Fri, 22 Apr 2022 09:52:45 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/68] linux-user/nios2: Fix clone child return
Date: Fri, 22 Apr 2022 09:51:32 -0700
Message-Id: <20220422165238.1971496-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The child side of clone needs to set the secondary
syscall return value, r7, to indicate syscall success.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-3-richard.henderson@linaro.org>
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
2.34.1


