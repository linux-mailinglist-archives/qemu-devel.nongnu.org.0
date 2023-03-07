Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086B6AF786
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:25:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekx-0001st-BK; Tue, 07 Mar 2023 16:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekm-0001fx-S4
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:49 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekk-00082p-Jv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:48 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so13529193wrb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtnWHpJ0J82CiL6/W6Fvz5ov3Sls8L97cDEKSKbgjPo=;
 b=RUMI539T0AsnmggJxzLoN+dLSN9VSKgg/JIhuvUyCOPCpBYHuBwGT6xA/K6Kx5Ifax
 YMLAuVWCEw+W6DpZHxhZOz+4uS3fSBjBkc3YPipP+PKhmvhVF95e9i1QsN704biX+ylL
 SZyUoqsEuL8EATR39kTiKSEsUxzETtyqllUUSWXoM8n3gGQHLYPVZKG+elnvb0HLSekT
 qcb+C+0+qUEWQEcbiCB5YrsTZ6m4uiPHdRLoHFlvf4MPgKsG7F4VTZnaKdTeHo2wPmvx
 Y1tPb0Y3le/zoSFeaqKiuwmLpczqNXHPo8UNQtRkTP1jbfRNLiiKaQY7L+9uaX/DSA5L
 cBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TtnWHpJ0J82CiL6/W6Fvz5ov3Sls8L97cDEKSKbgjPo=;
 b=sGILtB2Oh4yHZTAsxrU19ARoqSIDDZm41E2q5As7LOb3tVMrxgK0AfcLsY4NMnifRf
 0smGatvv7lehllWNV8/viiCBNrB12YqZugOsro2u7RFLR0Xd9+Vf4+0k11XzvNzBqrtM
 7MdjfhjDQ/C5GEyNNJ7hS6sTkBuqEv86oOhNPkZGbZSbLYTt8uD7yro0MbnZ52fruvgJ
 5XAH723sBreMTiptZBGcKKQC34GdsZrgVwuBo0sqnErQO436bstJq4cdFfCSWiSMhIVy
 QjwiOFzPVvNCLOEgVGxZhqmYaKhzKhQNzPJX771Fphz0IrsOHbhNdSXAXUcZL6j/W02R
 xa/Q==
X-Gm-Message-State: AO0yUKUm0sAWY3PFKL979UHAMLH2JoPo0iLNL2rh1+iyl8CHlZo8NlOw
 xp4v3H5F9Rop64AFkuP2TnQL9g==
X-Google-Smtp-Source: AK7set+dXJDPekLF6FNBWY8XFAbkxaYMMJhCl1rB1curZJPurZq8j9JjwZ77dM999vmOTd7I5IRJDA==
X-Received: by 2002:adf:f445:0:b0:2c3:db9e:4b06 with SMTP id
 f5-20020adff445000000b002c3db9e4b06mr10947532wrp.45.1678224104987; 
 Tue, 07 Mar 2023 13:21:44 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i11-20020adffdcb000000b002c573cff730sm13588153wrs.68.2023.03.07.13.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4CF01FFC1;
 Tue,  7 Mar 2023 21:21:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 12/30] gdbstub: rationalise signal mapping in softmmu
Date: Tue,  7 Mar 2023 21:21:21 +0000
Message-Id: <20230307212139.883112-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

We don't really need a table for mapping two symbols.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-13-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-13-richard.henderson@linaro.org>

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index a6c196ade6..6796761fd9 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -506,20 +506,14 @@ enum {
     TARGET_SIGTRAP = 5
 };
 
-static int gdb_signal_table[] = {
-    -1,
-    -1,
-    TARGET_SIGINT,
-    -1,
-    -1,
-    TARGET_SIGTRAP
-};
-
 int gdb_signal_to_target(int sig)
 {
-    if (sig < ARRAY_SIZE(gdb_signal_table)) {
-        return gdb_signal_table[sig];
-    } else {
+    switch (sig) {
+    case 2:
+        return TARGET_SIGINT;
+    case 5:
+        return TARGET_SIGTRAP;
+    default:
         return -1;
     }
 }
-- 
2.39.2


