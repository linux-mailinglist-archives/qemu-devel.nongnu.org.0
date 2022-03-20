Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D242B4E1D3B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:46:56 +0100 (CET)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzdn-0001UH-Uw
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:46:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5y-0008WB-If
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:58 -0400
Received: from [2607:f8b0:4864:20::42b] (port=34765
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5x-0003Tr-4y
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:58 -0400
Received: by mail-pf1-x42b.google.com with SMTP id l8so13701577pfu.1
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HY6g2dz/onqNKInKBF8VriYCnDheK410T+QzLO/qQ+A=;
 b=N0LxrPCJhpe3LVEG3sfYUU6Sfg32w+gmviRiRSf53bK6jVUrGASP0styDXbxwEPg0W
 kGPL+QDxlIRrGpJPTBjMwbQucKRcq0ShycgbJ9ccBLUk3ak2Mbj+HvzXrW2K930bwzi7
 P0TgofFw0aLD0YovpLLdsYjIZmOCkIhXOMdedqXvUW6lLMJ+JJkIpcAI2Pbu0PtW+44h
 W/7rImjZlcuINyz3NPF+XYByzLcuAOPvtXEGLilYXC020NWFjIT/ZRI0WoAICGMNP21l
 uvKRJyRU64SKDS7rC1YB0yMvEU/kf9ExgnnO2IhUGjwPe9TDKjuYoHQpgIVO28AuAnxX
 /fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HY6g2dz/onqNKInKBF8VriYCnDheK410T+QzLO/qQ+A=;
 b=KecC2fq/i9/4+c+4MFf+CfBJzHWx7+9HVXdNMTNBQnKmHHcUs1WQJKecos/GLUqn/q
 HGirR3B0a5L6U4C2XpWuiA1ShmtCozrTn55EqlkZZL1q6NjZW9OZKnyErKmvMB+dNpdD
 ooUHNqZ4NVyGCsuqVsjFrD7rBZ61BnY1uPTJQcwQPYK2wwabmfTe0tyOHGn14QlO5JlR
 4qRy6wHfBIQwqBhnD2+V3wnZa3UOd5P+89DVczK5m+zioZ3DovZoAvjsROIGmVXF2TOZ
 r5KQqcKXjlRwUoeP6FdTaTf6OPvefI7iaGahI/x7CT7qzu60FbWy5NmznmN5yZWTerqO
 1qqw==
X-Gm-Message-State: AOAM532cKL+MPGnF5Xqj4lJZpvfU/QIKmHY8eNGxKP1KnPWEnr7wOr5D
 ontqu85ZwtAyAufDq/oKakziEq4L3w9gsQ==
X-Google-Smtp-Source: ABdhPJxv01Vc2tJxlHVT/Bt0gFP4+fPCClDwIyhGLZkuhD20ZGNyn8qbF8We/FVwfnOLvnixWFDudA==
X-Received: by 2002:a63:6645:0:b0:382:65eb:1215 with SMTP id
 a66-20020a636645000000b0038265eb1215mr3918995pgc.337.1647796315599; 
 Sun, 20 Mar 2022 10:11:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 21/36] include/exec/log: Do not reference QemuLogFile
 directly
Date: Sun, 20 Mar 2022 10:11:20 -0700
Message-Id: <20220320171135.2704502-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_log_lock/unlock instead of the raw rcu_read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/log.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index ad0a40cfeb..10d0e809d4 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -15,15 +15,10 @@
  */
 static inline void log_cpu_state(CPUState *cpu, int flags)
 {
-    QemuLogFile *logfile;
-
-    if (qemu_log_enabled()) {
-        rcu_read_lock();
-        logfile = qatomic_rcu_read(&qemu_logfile);
-        if (logfile) {
-            cpu_dump_state(cpu, logfile->fd, flags);
-        }
-        rcu_read_unlock();
+    FILE *f = qemu_log_lock();
+    if (f) {
+        cpu_dump_state(cpu, f, flags);
+        qemu_log_unlock(f);
     }
 }
 
-- 
2.25.1


