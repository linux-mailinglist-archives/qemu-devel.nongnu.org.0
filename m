Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26543F0C53
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:01:04 +0200 (CEST)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRkF-0002XU-Vl
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6d-00011t-Mf
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:07 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6b-0000LU-U5
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so9583042pjb.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z5GHTABClhIJC54p0f9xKGIGp+EMnbq9v7YA+T66nys=;
 b=DyILv7BdUaD47x94obGb7QCrrBIDWQyobHzhqgSDis2t7+SKY1d670Oo7r04U/SeJ3
 xvrphrlnjDaKrMb5iaxEF3E7SIUvaSxeLHs70mIPAyybsZbGfezaYaFN/yyujeZgVQQC
 nM1p3RlYsmb//agNHTyqofBDW8MC3KPxxQE9I+Xo3P4DXI89sg/iwIgksJgqc6pG6vGS
 gMO/u2E2qvwrjmzlZ0oQ2H/o543OR5CnpWTlxdG8TfC66mqohwd8kAF4cuOm66UnFcbI
 eIeBvTp/d+hVZY4Yzu4n067B8ftGpBjW82O9LmRgzF6Ov7OY1FzEboqi8aIcZoZGItre
 IcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z5GHTABClhIJC54p0f9xKGIGp+EMnbq9v7YA+T66nys=;
 b=rChwpgSrHtP0e1sFexbErxO/ulXbMNai9OMlxNgPKqfo4SQJ8i4dRH7iB54ri8G0vO
 NH5vYSSS/qelZgG6LWQICRDAF1WUqT8yqF+vTGE8T03QUaVUB3Sdebjcf7MIm3jlH0hN
 IGMupPqwgG7EXQ7Eib1RyEynAjEqTVpLUx7vKRULJ7O6xZsO0TITZC7Au6DZgdKb+ET/
 DiEZH8DXYZjsb4plnW4JXKChzedbpVk6mMYSRnqVIEexEoGcmXgBE4MApxG8VRywy6Um
 pohA8+hTYNthk/mqcoGY344/1BnWWmCBSe10wm6I1hsovqcWDPCo/vImyQIbVTZ93j37
 DAmw==
X-Gm-Message-State: AOAM530wRN/I+VjLZb1Ha27rzTYArQpDGkTya7HghaTxLSNbUuxEqdhU
 qNN/ywqaCWy4C/DIBoJxWmfGMlRYugvGuA==
X-Google-Smtp-Source: ABdhPJxiriSVbIhhVfUyI/8/7z30MmleT2nfcZDIf5iudE6fBa+8ZoXGNWEXz6bsDQm9WBoYNp/p5w==
X-Received: by 2002:a17:90a:5583:: with SMTP id
 c3mr10683710pji.133.1629314404612; 
 Wed, 18 Aug 2021 12:20:04 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:20:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/66] target/hexagon: Implement cpu_mmu_index
Date: Wed, 18 Aug 2021 09:18:48 -1000
Message-Id: <20210818191920.390759-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is trivial for user-only, but still must be present.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 2855dd3881..bde538fd5c 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -144,6 +144,15 @@ static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, target_ulong *pc,
 #endif
 }
 
+static inline int cpu_mmu_index(CPUHexagonState *env, bool ifetch)
+{
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
+#error System mode not supported on Hexagon yet
+#endif
+}
+
 typedef struct CPUHexagonState CPUArchState;
 typedef HexagonCPU ArchCPU;
 
-- 
2.25.1


