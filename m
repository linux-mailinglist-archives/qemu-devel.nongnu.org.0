Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADE4508F4E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:21:34 +0200 (CEST)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhExH-00046h-QK
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj5-0006BG-Je
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:51 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj4-0001MD-0E
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:51 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r83so2341744pgr.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7eEUo/lkzPtBSQrQRpI3Km3z9H0IRO1hS7ph/cOmoCs=;
 b=vycUFljyLFxkvYBOt1P+W6jDxDjm7ltxqewprzMoR0SlPsgGfYOt44dfrvcngxS5DT
 f0uKTdvDWy1DnnaNK8SDujKazln3gCzRhq1TOMQZ98WVkBWJmG6ifRz4yQo/iNATnYrE
 rQ+oZK2MbWAa1OSYIi3Svu8bw91AXgMJHAJgjZajQUD4Ii/TdSYPWyrOWF26sxoJO0ch
 HkYkG4GqfGs6wjuLoUoy8uOMDN8xzPW7H0EH63hNAHHYHG9fNFVbRFTKo+Fcnu6BJ2M5
 l2sobtOEB1HuhwIZzdNQgHY3HH/ZZFpM6ctZoloRT/fzp31hZJ33ZtjXjmJbXKB0VF1H
 12sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7eEUo/lkzPtBSQrQRpI3Km3z9H0IRO1hS7ph/cOmoCs=;
 b=it7OQyG6OX6Qm/Hkx1k1LQra4A4pAFA9jjS3tNBIvvr6ecw1nOCK36oE0QiIRtic41
 5nNessWKEh98EAjtAC9SqctUpJ+lqrYZgjJ/rex8OPqfZtxHd5oYGfnjmf27DQTJVND+
 cbwYm6/UZopUgMiFouCbUM23/4AYtGW7HEP8gQOJ7M1C9BoD6FQDc4ARg6faJSzcNvNy
 5vvok4kCNYnOLcxhIscsMNLbxkhmLsCY95ixzwZQnakWh13CoLG6pIjx5P+MV3TV0gZt
 HE/AzwgVQWtM22WbrsUzYYU51LwGMzWV26saHfs3ApsZHRuSrM/SWkBY3bmxyXobHxYj
 OVWg==
X-Gm-Message-State: AOAM5308MvdJZ71JHOHh1bpOc+S3KcrQbc0rg1mIQaMkd/ygxj0yrJiP
 JsTjiF9b7DjMZvDfWYN8nmcF/sX0FeFBbg==
X-Google-Smtp-Source: ABdhPJyOqPNJIPID8K3d67Gbidmclb/JtTIKhOnAEqSuz6c6qOp7ghl1roJOSratDk4CtEwTS/MT3g==
X-Received: by 2002:a63:d64d:0:b0:374:6edc:989c with SMTP id
 d13-20020a63d64d000000b003746edc989cmr20454636pgj.434.1650478008781; 
 Wed, 20 Apr 2022 11:06:48 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/39] bsd-user: Use qemu_set_log_filename_flags
Date: Wed, 20 Apr 2022 11:06:07 -0700
Message-Id: <20220420180618.1183855-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perform all logfile setup in one step.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-29-richard.henderson@linaro.org>
---
 bsd-user/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index ed26fc5acb..aa13eae7f3 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -405,16 +405,16 @@ int main(int argc, char **argv)
     }
 
     /* init debug */
-    qemu_set_log_filename(log_file, &error_fatal);
-    if (log_mask) {
-        int mask;
-
-        mask = qemu_str_to_log_mask(log_mask);
-        if (!mask) {
-            qemu_print_log_usage(stdout);
-            exit(1);
+    {
+        int mask = 0;
+        if (log_mask) {
+            mask = qemu_str_to_log_mask(log_mask);
+            if (!mask) {
+                qemu_print_log_usage(stdout);
+                exit(1);
+            }
         }
-        qemu_set_log(mask, &error_fatal);
+        qemu_set_log_filename_flags(log_file, mask, &error_fatal);
     }
 
     if (optind >= argc) {
-- 
2.34.1


