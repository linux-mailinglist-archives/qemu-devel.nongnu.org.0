Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D184E8115
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:33:35 +0100 (CET)
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6Xu-0007G4-1J
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:33:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QL-0006hh-Mj
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:45 -0400
Received: from [2607:f8b0:4864:20::32d] (port=36779
 helo=mail-ot1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QI-0005KR-PY
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:43 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 y3-20020a056830070300b005cd9c4d03feso7463862ots.3
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h84Ot6YbttCAVb4FAH99rqg1sJS9c+ZhMv9JcX0XF9Q=;
 b=IrAnnaRQ0P++IPAx4ctp/wjX5atENOhpaTM0ZkIerw4ApgM5by22UbJWBxwYVXkdwd
 b3WHga6ZS+M+1fU+dtKjf8yqPVdIrPrA1/Wwkc6iceNInFzdqVlB5lmzuhOx6lTFZLtn
 4zZUyZlcoyKaFnARHdYKLzNmPIW3P7S8aNkdM88S0lrj2xFWVQ4CPSU9htqN2huLEhAO
 5QKRDF6WwP0O1DA4rdJ+Tm94maHynvJMTRw+x1XVeBLLiwGJr9EAecUwBLHzzTI5T3q8
 wzuX6Zy8zjfCisLM+GlB+ZdMGCsZjQWgesOlZ4VgUjnk01OcGd0wbKFri5eNfbi+vPB/
 TPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h84Ot6YbttCAVb4FAH99rqg1sJS9c+ZhMv9JcX0XF9Q=;
 b=CUb3qxHn07OvY8nJ8YSns66/7hdCfGfHfp1pmjZ0/qbqdyfds7Y7ht+6WHggcAiIS9
 W0IydEp86b5traWgEyAGq4rApvVxCaj5VBGg9D88H6DK97qKTccFplTU4d+G0wEmIDhC
 1BfIWbX8aOMPNx5WAnDaKwPLDffftEj2z/7AAcFawSsocIPaxir5Arl0o5mouyeBytRF
 FAwGSgtVVWxxei4gpgn1+Vws5mBqZ8N9nVrdA8m8QMV8CDXhGnDE/kGcIVKwh2v+kMUP
 fsbIufEXmnkEYBYf2rjF2mNHoezfkzEMjXrkEozzet4MQtU34zdJBGlKzLhuaS9iin3/
 oM7w==
X-Gm-Message-State: AOAM5339r/CCM1k+2rg/m35d0AUdsIndPY7NSsjBy448EKE0lTs6rnML
 /Pkyrvcb2YnBxAGXyMFvuTQDCpmp1PEXLMYU
X-Google-Smtp-Source: ABdhPJz5ZNohx2hM1HPNhA7YOPSZRTIH6zYyKJTrBRQO1LjIF0TV1VqdIsBaq74ufvHhKnR7AXa/Qg==
X-Received: by 2002:a9d:69c4:0:b0:5b2:3abb:612a with SMTP id
 v4-20020a9d69c4000000b005b23abb612amr6516463oto.319.1648301141787; 
 Sat, 26 Mar 2022 06:25:41 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] linux-user/nios2: Fix clone child return
Date: Sat, 26 Mar 2022 07:24:50 -0600
Message-Id: <20220326132534.543738-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org
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


