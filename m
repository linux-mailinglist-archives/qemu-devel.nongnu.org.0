Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EAB6A65E8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCf5-0001oV-JL; Tue, 28 Feb 2023 21:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCew-00018G-FP
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:38 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeu-0003Fc-Vw
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:38 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a2so2121238plm.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jO9J5Uj0jM0Y57wfqI1JL5b+bwRf/M4zfej3HsUyqb4=;
 b=OLSg28xpZC7hPpm11ROV/qu520akBLzSNBIltG9jD0rX7GU5714TRhtnUqFfWixluv
 y/gvPDanQhLh8KIGhg2EE1QiZtlCByUvQxBdxmDpvrrbr/cqvGh+8bxvh5mLYXMpWXT8
 DSu63DkQh2U607OAsPES6lqKfJ0igvZSuHtooOR1CcHp7UFI01jLZGMB8vDhzB8+ZWci
 HgV0cfjBSjboQnjoRWxA26qXJNc0xo4UiBkM8+eown6amdS3mRtuIi6U4nneFDrA4Nep
 K5cuxcKRpyTxd/GBwlWzC3D0lS+uI7/IlgH+eVQRKNUk1BCBbbAAs+6fR2q1vNjBIjMn
 euzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jO9J5Uj0jM0Y57wfqI1JL5b+bwRf/M4zfej3HsUyqb4=;
 b=LQb97p+LbBDZekZohshv1/F/OTqel9NDuOXKVIhWAxl5Yp8f21QYgGCSSAJvqm9x7a
 iPRtQ19s7K3U3Qg8h0ZWm3XlBLHGSIedfznULiVDcHhUI8YUtqRVGKmtVwA3V6oDOFkk
 iOcsJGWC38f7kGLkS8EsoH3LMUojLM7eznSG9HOlM/2wKEpJymzFVztB0EuH1u2GJtJg
 Da7+5qqEI0rnrvf9/pciYwsM2pibAS+GPIDQxzgOKBzJ/tcjFTRjG+K8f8y1PdSPRZtV
 L25qD2rWRGTW74oeNkO2Zn46gXcf/t/FCrnzg/+hF+W7XennCMsghKx6o8vDkSEOopfn
 DTRg==
X-Gm-Message-State: AO0yUKXLuxtgAJkUh5stjVMpsDa/tFRaw0JZr3GewZ8jJSNQdP1Q+MWC
 e07RKcK9h81VSqUnOKU+PA4401N8GYd8bXcK8zw=
X-Google-Smtp-Source: AK7set/rHP+cllSIhntXEu68mN9TPTKk7M77qqqzIAdmwvsMq8vaDxclT7UzzKHW9OBY89stSDGaQQ==
X-Received: by 2002:a17:902:ab49:b0:19c:e440:924c with SMTP id
 ij9-20020a170902ab4900b0019ce440924cmr4540266plb.47.1677639456268; 
 Tue, 28 Feb 2023 18:57:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 29/62] target/avr: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:10 -1000
Message-Id: <20230301025643.1227244-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-26-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index d0139804b9..a24c23c247 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -54,7 +54,8 @@ static void avr_cpu_synchronize_from_tb(CPUState *cs,
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
 
-    env->pc_w = tb_pc(tb) / 2; /* internally PC points to words */
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    env->pc_w = tb->pc / 2; /* internally PC points to words */
 }
 
 static void avr_restore_state_to_opc(CPUState *cs,
-- 
2.34.1


