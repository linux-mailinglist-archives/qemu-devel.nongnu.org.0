Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9649E6AB48C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Li-0003EN-RT; Sun, 05 Mar 2023 21:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lg-0003Dq-Mu
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:12 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lf-000606-6v
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:12 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q23so4629574pgt.7
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ady9NqbXl1TpoUN6B9C30ttWlGK5vJamM2lGeKTFSb8=;
 b=pJr/lKqc+axnjxicbWBuYHrR/GJDNBUQM71S/dgLNVsOflmAU2RDypLqa2c1W1fLH1
 qQcCz9uzYPLDgay4U97n6hMNdz0F7twONfI1O2NgHRyOpRFM4miJkN1+4IL62PNDRt2v
 m7rFkWzB64KHW1VvjIN0VqwXcwf6hG0AyiTUxwYcInlOgAedR2l7Oos+TlkQVOZnJNZc
 nI8ENTSz7qGL8xkjOF+giYOQWp9jZKAY9B6o9YekLDuwneiI4EdBUGiSy9qRHlM31878
 ge9CtJNWg/5BeemlL+FI6I+E3o3fkny+B+AzVPXW4n5aFp52xUZhujKaxKsLe3eX9Nik
 IGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ady9NqbXl1TpoUN6B9C30ttWlGK5vJamM2lGeKTFSb8=;
 b=GxKtjRecosZTVDF8DuxouBzkocDpR2VX64dyqGmBmUlVak1ZbQWPqo2UmYG32E4eXt
 7+Q8N3D7M7mOHu5fPx7uU3O/P5/OL8HKGTeNxReVY8sMhBpUhNJHjxOac+ytHshUiBuC
 YbWKU615cSGed5j6KI2t4AJEb1rGuSfvKCBMxX9jLutOLMpPl7adm4zgbuy2bVYh2Inv
 NPJqtC1DkLL9zNBxHkRgfaOhLPvaacZvtKQvCC0JuboZgeokmvZaJ+jVO8GqMUMQGY5d
 I9VU22BG726Qk4W+uoYE1A3EghOoymg4LkGsra3ncuC3SdosDo13bIPcMaQbNo3bDluX
 jr1Q==
X-Gm-Message-State: AO0yUKUDLIThyf/zKiaifa+X5PtAkJ3y8tNOZoQ+iUIeKUGNMytzI2gd
 3b5gDfBjdAoTH7rQ4jCHUNxLx+cnz6RS7vYoR+EV0A==
X-Google-Smtp-Source: AK7set+Q9sQwf4oqmX0R+Q5/NLHSci0SkYRb/URgwVmaARfFBpCuO3M8r+WVCk0kwQzKRlHdHgMDCw==
X-Received: by 2002:a62:1814:0:b0:5ef:6f18:9d55 with SMTP id
 20-20020a621814000000b005ef6f189d55mr8221628pfy.28.1678068789480; 
 Sun, 05 Mar 2023 18:13:09 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] linux-user: Diagnose incorrect -R size
Date: Sun,  5 Mar 2023 18:12:59 -0800
Message-Id: <20230306021307.1879483-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Zero is the value for 'off', and should not be used with -R.
We have been enforcing host page alignment for the non-R
fallback of MAX_RESERVED_VA, but failing to enforce for -R.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4ff30ff980..f4dea25242 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -395,6 +395,16 @@ static void handle_arg_reserved_va(const char *arg)
         fprintf(stderr, "Unrecognised -R size suffix '%s'\n", p);
         exit(EXIT_FAILURE);
     }
+    if (reserved_va == 0) {
+        fprintf(stderr, "Invalid -R size value 0\n");
+        exit(EXIT_FAILURE);
+    }
+    /* Must be aligned with the host page size as it is used with mmap. */
+    if (reserved_va & qemu_host_page_mask) {
+        fprintf(stderr, "Invalid -R size value %lu: must be aligned mod %lu\n",
+		reserved_va, qemu_host_page_size);
+        exit(EXIT_FAILURE);
+    }
 }
 
 static void handle_arg_singlestep(const char *arg)
-- 
2.34.1


