Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1D135145
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 03:20:12 +0100 (CET)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipNQg-0001NP-Lg
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 21:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ipNO5-0007Ij-Bs
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 21:17:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ipNO2-0008Cy-KJ
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 21:17:29 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:51936)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ipNO2-0008Bg-DO
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 21:17:26 -0500
Received: by mail-pj1-x1044.google.com with SMTP id j11so444618pjs.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 18:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71biz+iT3vb9rCukTO9Hbb/aNJiPW+OOTq+eiVqnO3Q=;
 b=XNxmweGOHA/RLA6fhSbtVVdLqgWBVA9GRqD6bNfy8sb4NmE+CwRq5dXkN3tMXXXmk2
 ZR530tOfnnEHNMn0oU4kH5RrsyLmvfUtAgS+Bf8PcAqKF5yk6XdRqFcJjQncbLGPVe4o
 xYoKByrsHfWChuRk1XH8hXYLJcp1iqmuKwpM265kOpqqaU3VwprSq2xt13V9/tnv83CH
 REeYtVwAttLzKSJ8IsDWMfS+U1y2raz8iWySkCzcp24KN3sSfmtCg8hT1EucL5mo62Fo
 hMN+G14fEEx6DVYFb0F6xMTyT5jOMgRskKy/qPPNySZAt9mUjpLROmmS+DOeU2trw8Or
 QNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71biz+iT3vb9rCukTO9Hbb/aNJiPW+OOTq+eiVqnO3Q=;
 b=NpXwwCzfODsj9bwblxM89Gd7TCEu2KQ3HPeLlrwyz+UqZgzy76y8BMoad0oPJs/t5o
 YaKRK/3HmOwWgFQCbQ+avz/Oo5CXlyhJj4pSYXZ/umO4IGuwZknFxSjv8wWEaoWzmXnn
 khCgU0ouk9EMj0IlvOMKOmuTQsQVqjZii4NaL6gzSDaNq4RVU/ggWkmefOMbIgk5Zh5H
 K3wusw3DaSES9IUssYh+kYbB1dRjv3nGEtH8/Tr9DVh7Z+Trl6aEVS54hP6tNHQHOf8L
 ARXJRJBByRqfH5HJuVT00m6KR7NweSHpwVRS0s/232W8zPiOU4HxUU/qAuPSblb4JCw5
 jRtQ==
X-Gm-Message-State: APjAAAWfSjkqjqatbPdT4vzjYlxSvSxb96HFYAdldXA4rClbga5x4XI+
 14uBZAqKutYTJGmSWu6utijwpXe02rt4/w==
X-Google-Smtp-Source: APXvYqxUB6I4dLnNlmyzXcrrdNETIxDJEoKqxw4LpV8MQHpA8zEPJTpaCUA8iMbfHv6km2C5lgbvKQ==
X-Received: by 2002:a17:902:6906:: with SMTP id
 j6mr9065005plk.321.1578536245112; 
 Wed, 08 Jan 2020 18:17:25 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id n26sm5166715pgd.46.2020.01.08.18.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 18:17:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] vl: Only choose enabled accelerators in
 configure_accelerators
Date: Thu,  9 Jan 2020 13:17:10 +1100
Message-Id: <20200109021710.1219-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109021710.1219-1-richard.henderson@linaro.org>
References: <20200109021710.1219-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By choosing "tcg:kvm" when kvm is not enabled, we generate
an incorrect warning: "invalid accelerator kvm".

Presumably the inverse is also true with --disable-tcg.

Fixes: 28a0961757fc
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 vl.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/vl.c b/vl.c
index 887dbfbb5d..9b7651c80d 100644
--- a/vl.c
+++ b/vl.c
@@ -2759,11 +2759,10 @@ static void configure_accelerators(const char *progname)
 
         if (accel == NULL) {
             /* Select the default accelerator */
-            if (!accel_find("tcg") && !accel_find("kvm")) {
-                error_report("No accelerator selected and"
-                             " no default accelerator available");
-                exit(1);
-            } else {
+            bool have_tcg = accel_find("tcg");
+            bool have_kvm = accel_find("kvm");
+
+            if (have_tcg && have_kvm) {
                 int pnlen = strlen(progname);
                 if (pnlen >= 3 && g_str_equal(&progname[pnlen - 3], "kvm")) {
                     /* If the program name ends with "kvm", we prefer KVM */
@@ -2771,9 +2770,16 @@ static void configure_accelerators(const char *progname)
                 } else {
                     accel = "tcg:kvm";
                 }
+            } else if (have_kvm) {
+                accel = "kvm";
+            } else if (have_tcg) {
+                accel = "tcg";
+            } else {
+                error_report("No accelerator selected and"
+                             " no default accelerator available");
+                exit(1);
             }
         }
-
         accel_list = g_strsplit(accel, ":", 0);
 
         for (tmp = accel_list; *tmp; tmp++) {
-- 
2.20.1


