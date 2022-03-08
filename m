Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D057A4D10F1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:27:30 +0100 (CET)
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUFl-0005ak-U1
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9K-0005GT-Nq
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:52 -0500
Received: from [2607:f8b0:4864:20::42e] (port=41630
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9G-0006TF-Ia
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:48 -0500
Received: by mail-pf1-x42e.google.com with SMTP id p8so16589076pfh.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76wSnhUATfCAoGFxfO7Xhn6x4qRTiWJIe9Ic10rBGB8=;
 b=UVKiBP+jhEDxZ8D1pAFjSY0HMxLfbCHXhJvEwiyDHhTpU0zMOvyvcDFGpyTJmt6q4u
 7T4IG0VQ/svablUOijRlLJ19SzK3vQgYQ0wmGg2+UdcithIFn1qKVUYSuhlWypxntxdL
 IWnhe3tF/xKQw45+lrgieha7I86OUzmnTIfm+S+vL7Xd0/olGOSQdLqsBXFlChP43hAA
 P/iO050pdq0+o09nE3hKoFM+Cj+7Do+wVPOTk8HnAWlnYE2qnL8Q9p51oze+vnS18YVs
 vMF8M3uDJR3s2RtmURqNk4yygcVuTzx/oWgCcwKvushU+7wBAk4CH4r71eEalpfJYzS9
 Px2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=76wSnhUATfCAoGFxfO7Xhn6x4qRTiWJIe9Ic10rBGB8=;
 b=zuPFA2vFUDWYaJu6IgD+P4oDHlYVE28KaG4f6bZkj19DCiKvq9xfxW6WAzY3xtnUaF
 mESC15kNSPA4RaZzi9WflOh7Wk4Pp8iVqiq1wlFJ4nrMNurxFef28Az7+pbfGRp6wcJ1
 yL5b9MZDLmjicBtqi+tsV3Mn+vXZNjD+o+nFX1eb18a+iKuREbo2fBSET6Up16JtK8lK
 PoKWUf8od6wNbjYNi+BpU9T9KMs/VW1J+hJX+SNhkKSxHL1L9q0tLkMbTO40U7S1K6O4
 cKU6kxu3Zc0t/l9L3Z0jbWHhaC41IACGBHk99XmrEGcAov4OqYYrYP6J19NO1oboljuO
 Fndg==
X-Gm-Message-State: AOAM532AmWLXw/7rKw2fXDhNCo5FBp5dztF2MmhKePwpQKaf/ohmYagR
 B5/2bvNdN54dQZi6HUemH3Ssv2Kctfjctw==
X-Google-Smtp-Source: ABdhPJxZCQ7mPE6lB9RhJ7zmpfOR2fxM3lyziPs2Dv21Xl1GI7Usf4nppMDk9lLhYYETWduReRoLGw==
X-Received: by 2002:aa7:9730:0:b0:4f6:d6ee:cc0b with SMTP id
 k16-20020aa79730000000b004f6d6eecc0bmr15275657pfg.41.1646724045342; 
 Mon, 07 Mar 2022 23:20:45 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/33] target/nios2: Drop CR_STATUS_EH from tb->flags
Date: Mon,  7 Mar 2022 21:19:55 -1000
Message-Id: <20220308072005.307955-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's nothing about EH that affects translation,
so there's no need to include it in tb->flags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f582e52aa4..2a5e070960 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -291,7 +291,7 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
 {
     *pc = env->pc;
     *cs_base = 0;
-    *flags = env->status & (CR_STATUS_EH | CR_STATUS_U);
+    *flags = env->status & CR_STATUS_U;
 }
 
 #endif /* NIOS2_CPU_H */
-- 
2.25.1


