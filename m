Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BAC5067DF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:40:23 +0200 (CEST)
Received: from localhost ([::1]:40780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkLN-0002ZJ-S3
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1d-0007UI-0G
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:20:01 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1b-0001Qc-1e
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:56 -0400
Received: by mail-ej1-x632.google.com with SMTP id bv19so31605691ejb.6
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=19yBPFT8fDkA88OxAXBAkM2RLEH19AEV2wzR+Tq5Ue0=;
 b=JHICkionZ8Hlnhxk0EdmX3iMP6rVF0P3LP9Bb7FeulKcjwXFJdAD5bY2AtQI3QZnz0
 OV2jGVOmKthQ2nY2XJIzzWvfwi+BRUyAArGG4ZsI865l7cjKPR0xuHexUMX38JyYppX0
 i9sb6j5bZwBxXnvvPkWVsM3W4WWyoFTvX8l7vpxJ8h7iLwaE0Bbar1kSfqWLD1HQSaJg
 gm/YhX27NJO4HewP/+hD7nsv0LGGjeAMAoLrx6Lu/AEh0ssj0Fi9cIxHwlbJG1M6wnH6
 fBUJkHiaPD3DzKLno3/QUSGHESUlE8gIexjXq+tFpaGIpweOKTNaKHJsPMiBn8LNP/ge
 7d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=19yBPFT8fDkA88OxAXBAkM2RLEH19AEV2wzR+Tq5Ue0=;
 b=j+C42a3Inrdb/LS8EKDiprsca/34z3V/oA3Dc1t3gfleaU+ZJlwbnsbxqwBxl/pTd9
 Xu+gxDX6CrWKZKfowzgzqzbsvBno36kytPayY0gfJAOCjInERFpX9CyH6bs6Ka+o7OYf
 0g8V4Kq6tyViSD/22vH9uBngPYAROrqFyhC291N0azKlWgRXDXfygM0I83OmqIgFTgKH
 XTNlP/B0uIzsECLXjFwZNEMJESFFm7qj4SRAhpk9o4kkwCP+0sjEGVwbT2zZV90kDNZt
 a+OqOoSHcARxeg5v0drJs/1h+WxppGhqaZ9hpvbnJg9SEJAnJ5ifi81UOO/D1Am8c9tJ
 hsyQ==
X-Gm-Message-State: AOAM532WIAIFZCveMNLuWuWWvPdpLt4q/JbZkfnl0P3e/2pYI37ZeyY5
 zl5hbOTGvr8D8zXp59jd/4ohig==
X-Google-Smtp-Source: ABdhPJxBw7FDquP4gAn55Qdg6xjGWDdHR1+hwxfJ97ibMyRThwsdeztlvFxsTlLJWh2+LNbqOseRFA==
X-Received: by 2002:a17:907:2ce3:b0:6ef:eadf:443b with SMTP id
 hz3-20020a1709072ce300b006efeadf443bmr706073ejc.288.1650359993675; 
 Tue, 19 Apr 2022 02:19:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a170906671200b006e05929e66csm5449973ejp.20.2022.04.19.02.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:19:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3D121FFCF;
 Tue, 19 Apr 2022 10:10:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 24/25] target/i386: fix byte swap issue with XMM register
 access
Date: Tue, 19 Apr 2022 10:10:19 +0100
Message-Id: <20220419091020.3008144-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 qemu-stable@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During the conversion to the gdb_get_reg128 helpers the high and low
parts of the XMM register where inadvertently swapped. This causes
reads of the register to report the incorrect value to gdb.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/971
Fixes: b7b8756a9c (target/i386: use gdb_get_reg helpers)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-stable@nongnu.org
---
 target/i386/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 098a2ad15a..c3a2cf6f28 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -129,8 +129,8 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         n -= IDX_XMM_REGS;
         if (n < CPU_NB_REGS32 || TARGET_LONG_BITS == 64) {
             return gdb_get_reg128(mem_buf,
-                                  env->xmm_regs[n].ZMM_Q(0),
-                                  env->xmm_regs[n].ZMM_Q(1));
+                                  env->xmm_regs[n].ZMM_Q(1),
+                                  env->xmm_regs[n].ZMM_Q(0));
         }
     } else {
         switch (n) {
-- 
2.30.2


