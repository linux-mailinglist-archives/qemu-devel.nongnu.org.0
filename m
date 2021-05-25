Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE131390CC3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:09:15 +0200 (CEST)
Received: from localhost ([::1]:55592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llgAk-00054I-Sl
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0Y-0002zV-CC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:42 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0M-0004rQ-KH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:42 -0400
Received: by mail-pl1-x633.google.com with SMTP id n8so11924359plf.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbiH4B8cDwF4+AJH0qZkvnuJ9P1hwbVxNhJbCa4tUSo=;
 b=r4QJTz9AFyAFUCVnt/zfvO0QbBvlQDBHQNDm2SKMjN9+YzS/H9TXk4TUdzRDTopo0x
 zr39DKYBzyybxcpTN5O/+vxHD+2bTwiPaQM/PwQUCp7XQLJJkF6TZ5bw3SYoROYfiQgt
 V/+F7Hnm/Y51bLOId4u0j2ltv8OgBgWAB2l+aEh31YLzG0AIkxaiuiTinBEekKIRUD93
 WkK2qH1bE3FR9MVphPee9Z5hxTiFNEDZ99JpPA5wa95hW10Ny6OJZutfZ33GWWdhQmLA
 zY81A9Q0oxSywYVmylcas5tC3UreGshOxzmsSzJTjCxwIoLPKeDLgOvRj+EJa4OG0Cw6
 cYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbiH4B8cDwF4+AJH0qZkvnuJ9P1hwbVxNhJbCa4tUSo=;
 b=iKIaFkkJ4QfK7Writ52yqVhBuaEZk7SO86yK1ygHL4J2t1L6jvaGry/ZPcnE7Bx1NK
 S9Orvi7Ui3ffrV7QsCFTOWXkW5tE2S7UPoE6TIw1EV5gkYCrB6iTpbZMDBMXIYMJhpx2
 v+Vd0vv2JjPL/ruYPwMf/IGXEPUVE6+8rxcZM9JcqT0baaYWlUIt+3CE6652rI/MHIpO
 ItCBjGJOWSh9j64l7DhSRUHXnAKjwT0r8NFJcIDz0EHiXsKejlPPIUQZnimstU2C/rDW
 dAMpouttVsexkbiaEN7Id/dz7Et99DHl0qCc+XYpIr/YrX6U/ss+jZt2TMUbQD4rdU7J
 qBBA==
X-Gm-Message-State: AOAM532Y5aHB6QDusDX+mFkS3Fa93eAZHI0Y+X0HXX7tmc02Q94Z6kuh
 Nv5hiVTOLxHWMeB8iNscxst4KmHENR9Ngw==
X-Google-Smtp-Source: ABdhPJxWCwSINp+HkCMfcQcBEkDm2KL4+Q7ghXHEy4jG/vEpjrCEfDljfUQB8AhKUpB4r27IF4qQRg==
X-Received: by 2002:a17:902:7792:b029:fc:e490:ff9f with SMTP id
 o18-20020a1709027792b02900fce490ff9fmr2428756pll.27.1621983506246; 
 Tue, 25 May 2021 15:58:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] target/arm: Enable BFloat16 extensions
Date: Tue, 25 May 2021 15:58:17 -0700
Message-Id: <20210525225817.400336-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disable BF16 again for !have_neon and !have_vfp during realize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c     | 3 +++
 target/arm/cpu64.c   | 3 +++
 target/arm/cpu_tcg.c | 1 +
 3 files changed, 7 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7aeb4b1381..cfc03c550b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1463,6 +1463,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.mvfr0;
@@ -1503,6 +1504,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         t = cpu->isar.id_aa64isar1;
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 0);
         t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
         cpu->isar.id_aa64isar1 = t;
 
@@ -1518,6 +1520,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, DP, 0);
         u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
         u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
         cpu->isar.id_isar6 = u;
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d561dc7acc..1c23187d1a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -661,6 +661,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
         t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
@@ -708,6 +709,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
         t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
@@ -731,6 +733,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         u = FIELD_DP32(u, ID_ISAR6, SB, 1);
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
         u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = u;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d3458335ed..c8a12bc2d6 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
         t = FIELD_DP32(t, ID_ISAR6, SB, 1);
         t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
         t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = t;
 
-- 
2.25.1


