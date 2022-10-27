Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57BC61013A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:11:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7mP-0002OF-3O; Thu, 27 Oct 2022 14:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kH-0001Ml-Cp
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kE-0003LO-Iw
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bs21so3687588wrb.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyN/JXPSm96DkOnQJxVbK9SbWLvZmz7ZHh9iXoxP/MY=;
 b=EX33OhJMpPa4lO94RuPeSLMmbG3QEpp3vV6Zm3KgBQVEdb1sTucP4wS7V4PEvSvkxJ
 Uwsco3xhPcwxxTcoQjPLqcYxfDLKjLQsfh3JBBao+aj8wRDsU+wqqJtjH44SkIvY8Nob
 SDLZRz6mexCqEiXraM+IBLw44+frYmiEAqzOu8uxJiDQy8xLSNNeK6LvGRngf6+0nJ6L
 NiQEvmN4Kc+Yl/0zEBWMYN7xKIiIPVJOXAPz5Z54dryJ+QSvYagZzwm9M17iHbEjM0ET
 /dT7A2NgiI76ZhFocBTQ+gCJwz+tHlK/FWazIKgo6ZIfkx9uDBDO4vWBnkfrP1FXGkbQ
 CDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kyN/JXPSm96DkOnQJxVbK9SbWLvZmz7ZHh9iXoxP/MY=;
 b=emziLdxTpyf763amd74lD9bGB2ooQNtTcQAYsESK99U8yaaZHLGuhXUybl+H16/02e
 o6wTMnxoNzjfbo53VHHk8hYqrRHQjkiHH6r7cVeMJ1KrNM2hWoqUz1nPnTiPafyYJpq/
 M8sV/DvgfWjuXK+zeCkWamXxA+3gNgl34VBEsC+r/slvvoeEnD8sY6lbkU2rQqKXwdr/
 qPnbblA2NFfqVWicFCzdastOPq12KttRXMg6Fa65U/AYWNG4+8OcbA+WKgW1BYgckp/A
 A+9fimSYWwhEZnfrcepbnvjL1omth9MWMuIgI3QOwop5Qzz3qerRMnmi4kSNc+N52SWs
 hp3g==
X-Gm-Message-State: ACrzQf0R6Px1HvSuXBQn+uhWkC9sSH/HTz1dXD1NWlZ2bRUeljUwOdpW
 1AeK4mdLloYUo+AhB+eiAvVBZcFvhZRKMQ==
X-Google-Smtp-Source: AMsMyM5rokAe0yjFsvoUXywdh8cPZdcDGahRTauWNFeSTfJAfJA5IC10ZvigssrKTR0PkczGTSx0mg==
X-Received: by 2002:a5d:47aa:0:b0:236:79cc:6d5f with SMTP id
 10-20020a5d47aa000000b0023679cc6d5fmr12425477wrb.391.1666895804900; 
 Thu, 27 Oct 2022 11:36:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h2-20020adfe982000000b002322bff5b3bsm2142249wrm.54.2022.10.27.11.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 357DD1FFC1;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 09/30] tests/tcg/nios2: Tweak 10m50-ghrd.ld
Date: Thu, 27 Oct 2022 19:36:15 +0100
Message-Id: <20221027183637.2772968-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

More closely follow the default linker script for nios2.
This magically fixes a problem resolving .got relocs from
the toolchain's libgcc.a.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1258
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221024035341.2971123-1-richard.henderson@linaro.org>
---
 tests/tcg/nios2/10m50-ghrd.ld | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/tcg/nios2/10m50-ghrd.ld b/tests/tcg/nios2/10m50-ghrd.ld
index 7db0d59ad7..71cdda450c 100644
--- a/tests/tcg/nios2/10m50-ghrd.ld
+++ b/tests/tcg/nios2/10m50-ghrd.ld
@@ -44,11 +44,15 @@ SECTIONS
     .data : ALIGN(4) {
         *(.shdata)
         *(.data .data.* .gnu.linkonce.d.*)
-        . = ALIGN(4);
-        _gp = ABSOLUTE(. + 0x8000);
-        *(.got.plt) *(.got)
-        *(.lit8)
-        *(.lit4)
+    } >ram :RAM
+
+    HIDDEN (_gp = ALIGN(16) + 0x7ff0);
+    PROVIDE_HIDDEN (gp = _gp);
+    .got : ALIGN(4) {
+        *(.got.plt) *(.igot.plt) *(.got) *(.igot)
+    } >ram :RAM
+
+    .sdata : ALIGN(4) {
         *(.sdata .sdata.* .gnu.linkonce.s.*)
     } >ram :RAM
 
-- 
2.34.1


