Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4BD55BE9D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:09:27 +0200 (CEST)
Received: from localhost ([::1]:57652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64Pd-000276-V2
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FG-0002pF-V0
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:38 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FF-0008K5-GG
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id n12so11007104pfq.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C3K2YfSefvABy7M7hq8Nd6JC/pCWOqgHqbPOWNo+9Kc=;
 b=xGRbtwywa3EOF4hpb7h/RnHnYgJcjofWu1Xb68m29btjPVX7grfIe3VrJPEZoBzLRK
 oRxI/DZ0KOOdneIKU48y10dyJRKlgxz+P8rgi7SL9HRwvu/6iYNfYIyJRqs2pYbEvGy1
 2hHz3/6aTv5aPwWlpuoVKCL/w/eZKHRsqGW4XW2k+chlSTtOuABMPb4iPEMk4EX31Z5Z
 7+N7K2qJlOOh/DvKtEVSwPLwSfk5sKeQj3VqPW+DgCkd5zR2sqEJ67WaYA+lzfUmPS87
 X56qlpCp/R6C7ItjJJjiFG6GyzPwuxo10y+SMWIdDbZ9EExqBCJQqZYwWBnbJmlwBD9s
 AZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C3K2YfSefvABy7M7hq8Nd6JC/pCWOqgHqbPOWNo+9Kc=;
 b=Vv++kdhfeOERFA07mcMnidDVIjiERWBHTHGQS2O09tkg1nDQzwLOnrOTn1y2OvmOFs
 dbMdi0a9rIeU+8JOiAEy0rcSEmvQQ9JxlkJahrYQTJr0wCsmbDgagIAUu1CHqbQnvf7q
 C3fHqxKYd3F6clGOET3FKQXFVEWYLE0Ed2hBY4jbUd0+1jfrnLGR2QfHAUMYXjfy2hgM
 5m7g+YAYJDAs6It6OUSaYWdgxEpJEmM5UfRGG/mzWDEzcf7i3NOZQM+AKaFxEB5ofLX5
 LlnKyHsYlll5V6YPoJJJpQVVYxjfuz/UnPlLGYY9sJ1p/X/1KFETvxBZbDxiouHCuFyC
 DkwA==
X-Gm-Message-State: AJIora9aUrNYwChpwCsYn8vr1JFRu9mRErgHjV5kib3tKg1KfCSfFlEa
 rxozpI8sR1oO6kV2Z4QwNGDwmlLeXzoFqg==
X-Google-Smtp-Source: AGRyM1sqaYP939LFMAfrQTkfDVIyykfLxoBoktD2E8UwWlYhEgUa8nRMHTaGNzunMYhp1Zm9VXwwjA==
X-Received: by 2002:a63:3ec6:0:b0:40d:27a:7847 with SMTP id
 l189-20020a633ec6000000b0040d027a7847mr15763180pga.606.1656392076221; 
 Mon, 27 Jun 2022 21:54:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 12/60] semihosting: Clean up common_semi_open_cb
Date: Tue, 28 Jun 2022 10:23:15 +0530
Message-Id: <20220628045403.508716-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use common_semi_cb to return results instead of calling
set_swi_errno and common_semi_set_ret directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index cc13fcb0ef..6414caa749 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -364,15 +364,13 @@ static int common_semi_open_guestfd;
 static void
 common_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    if (ret == (target_ulong)-1) {
-        errno = err;
-        set_swi_errno(cs, -1);
+    if (err) {
         dealloc_guestfd(common_semi_open_guestfd);
     } else {
         associate_guestfd(common_semi_open_guestfd, ret);
         ret = common_semi_open_guestfd;
     }
-    common_semi_set_ret(cs, ret);
+    common_semi_cb(cs, ret, err);
 }
 
 static target_ulong
-- 
2.34.1


