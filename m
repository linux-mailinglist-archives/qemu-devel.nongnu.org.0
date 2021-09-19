Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD4410917
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 03:59:19 +0200 (CEST)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRm6w-0006IG-3d
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 21:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm58-0003Qr-0t
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:26 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm56-00054H-Aq
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:25 -0400
Received: by mail-pf1-x436.google.com with SMTP id y8so12842888pfa.7
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RYlmbWVY0FQ8woJIB4qREInhH/6MUM19Eu5tv5fgj0s=;
 b=Rvj0cGCpV5kUfAmX4FzEIkonP3is5fEac7Z0WuAdN6cs8FdsY0isCPR5+nfa6Pez/W
 a9WMeYJYhAqXQSOuWDo4dU98lRmIq6f7cmDUYsMc/Uk5ohBhU3moSxZF1vSIwuWzokmx
 l0AcLuw+7cAZNLGlQiK5P1RSMRvp2ij6DYqWG2tjCeLR+/9POfTFYpqQeMF/UrXO7jVN
 1bQhqIPAnj/II2QnK39Mg9hO8QKnevBVAeUtwgwAHxqKpp4BXQifuhQiPcmDqu87VKEA
 4zR3QQase1ZHcOrwOAGIBlc12ac1mLPvzdqNtjtLLfW3wsJ8MCTJEpT0j3GpGilHHhwM
 VmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RYlmbWVY0FQ8woJIB4qREInhH/6MUM19Eu5tv5fgj0s=;
 b=NdmKPmyLUZ2rMcSW+gBCy/p+g9hSUkNkeWFXcEjgQPH4rJb4bu2Cl3xcj/w0IdUA2k
 doQ3goc0q3URgD4FeNKy8Kk6udw+CrIgdjkNayD2XwOcyCR6CDQQrbpl9Hq7iUjLm9Ik
 +OPoD+crO1lTusJuLVaB7m2SGZJF8Nmws3QTZfhPF5kK0QeAa9Ta0UxX6SEMZWu7DIxS
 TWrpAKFQqcAoL32rZfUU6yrxq+YRj8EI9qfqhHPVwJbjGRWyBt78wphKpZc6F+5rnHwy
 x7xMziWlBZHLPHWpiliKOXqxEULQPVBJWNV7/VCQYAzRNlCWWHCMRDOcIYcggJyI/LbO
 8/Gw==
X-Gm-Message-State: AOAM531GXl5RM5k/FvUSfeTMYIeIgPk4Xc6waptp0qeLHMChIftE2T9Z
 UjIokoGtD6JSZ3LN6YKmV6yy315ugel6fQ==
X-Google-Smtp-Source: ABdhPJw8Gls1Gv4sHOmxCyKSwrBg0ylOx0yAFUaptdrKddJVzusLnVHNzutncYO18COTANw0+sTT5w==
X-Received: by 2002:a65:508a:: with SMTP id r10mr17152551pgp.96.1632016643060; 
 Sat, 18 Sep 2021 18:57:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/25] linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
Date: Sat, 18 Sep 2021 18:56:57 -0700
Message-Id: <20210919015718.466207-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This si_code was changed in 4cc13e4f6d441, for linux 4.17.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 13ba9bc1d4..18698d9515 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -156,7 +156,7 @@ void cpu_loop(CPUAlphaState *env)
                     info.si_code = TARGET_FPE_FLTRES;
                     break;
                 case TARGET_GEN_ROPRAND:
-                    info.si_code = 0;
+                    info.si_code = TARGET_FPE_FLTUNK;
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-- 
2.25.1


