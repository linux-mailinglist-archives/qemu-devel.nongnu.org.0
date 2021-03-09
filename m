Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A6B332E4C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:30:47 +0100 (CET)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJh82-0001vY-3g
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7i-0000Nz-9P
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:20 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:34906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7c-0002n8-5Q
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:17 -0500
Received: by mail-ot1-x331.google.com with SMTP id j22so7518307otp.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gqJnI67ZsQPzrPFFIP/tf6r9PpztXTYxjNrV84rekq4=;
 b=uumtE7RaWimHkpHQG3IuIYrCoycoH9N7U5i/2c1Ue/7SOqhIwiIss/2e/fDXGVRcsG
 rgrklQPMmdB750IVU0hnibtYaaMN5mNHPQenrObw9Y6TK/2esuV7xu9BWynwtDuDes7z
 GsCIGhf5JvuErBWURNSft+lmyHY8ZeN9PrsdDSeLTGVilcdFYj3DR3awNO4ix6URMvIi
 A2EPbnSUTZPLK5p3IMNngi/tFDXIiEifcPqBhsB411AtDcD9WK+z2q3NErlaKo9H06hb
 6wsWzzDuGQHPjDnaPZYABtXRk0rhPcEsf0/e+F4nipzYigbiXh85LqzMSFJV8Dzx4MHX
 nh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gqJnI67ZsQPzrPFFIP/tf6r9PpztXTYxjNrV84rekq4=;
 b=jTbMwNI5IBzZoHU9nGIryjU8SNBqTzgNcnHf/2cJz9FE4Cr8JhWj1/ysLYaOq15WVE
 YDhDiPSL8AZo8PJMU7LXJ4VBcAHIL73G/tWKbJOGOGt8O2Kl7NUJB/i2sjGyaF754FNO
 +UTld7gvdla7YtBKt/sEZJuT1Zs/yqoReUH5hOLzyCidHWhVEDs8oIYEQgMNGZTiVgWq
 C/rAIUGEFJgWKZqPawBEmqE7n/uHlp10ONe5hX5ktJ2b/mBiSPB/KncPTPrFcX7NFbaI
 1wFm0N6gK6rH8FhCTYi2qWy+PsMExMdY9w46FLX7jSgHuRx5ZeB1e0nNB5Csa9TIynp/
 LLmg==
X-Gm-Message-State: AOAM531jxPKJYZtINHWoOuWj19dFVScEU+z6p5FMJ/w8pWI9Qm8aMV3H
 x8ljHUI2zwvbfG7Y7fbBvK6BggcVzufwq1cG
X-Google-Smtp-Source: ABdhPJwCLobaDVUjYB0DCor6zzHix+e7cGm+ewY5uG84ut+siUx9idFcjcZ6SYUw4OHixoEc83xFtg==
X-Received: by 2002:a05:6830:802:: with SMTP id
 r2mr21007229ots.110.1615306931216; 
 Tue, 09 Mar 2021 08:22:11 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 50/78] target/arm: Split out formats for 2 vectors + 1 index
Date: Tue,  9 Mar 2021 08:20:13 -0800
Message-Id: <20210309162041.23124-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently only used by FMUL, but will shortly be used more.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 04ef38f148..eb5d4b052e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -67,6 +67,7 @@
 &rri_esz        rd rn imm esz
 &rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
+&rrx_esz        rd rn rm index esz
 &rpr_esz        rd pg rn esz
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
@@ -245,6 +246,14 @@
 @rpri_scatter_store ....... msz:2 ..    imm:5 ... pg:3 rn:5 rd:5 \
                     &rpri_scatter_store
 
+# Two registers and a scalar by index
+@rrx_h          ........ 0. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_22_19 esz=1
+@rrx_s          ........ 10 . index:2 rm:3 ...... rn:5 rd:5 \
+                &rrx_esz esz=2
+@rrx_d          ........ 11 . index:1 rm:4 ...... rn:5 rd:5 \
+                &rrx_esz esz=3
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -792,10 +801,9 @@ FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
 ### SVE FP Multiply Indexed Group
 
 # SVE floating-point multiply (indexed)
-FMUL_zzx        01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
-                index=%index3_22_19 esz=1
-FMUL_zzx        01100100 101 index:2 rm:3 001000 rn:5 rd:5      esz=2
-FMUL_zzx        01100100 111 index:1 rm:4 001000 rn:5 rd:5      esz=3
+FMUL_zzx        01100100 .. 1 ..... 001000 ..... .....   @rrx_h
+FMUL_zzx        01100100 .. 1 ..... 001000 ..... .....   @rrx_s
+FMUL_zzx        01100100 .. 1 ..... 001000 ..... .....   @rrx_d
 
 ### SVE FP Fast Reduction Group
 
-- 
2.25.1


