Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6056E97E9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:03:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVlr-0003iy-Bo; Thu, 20 Apr 2023 11:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVli-0003am-O7
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVlg-00046d-DF
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:18 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso21898195e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682002812; x=1684594812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyFxajlvcBm0zO8ecOyTw+g/FGP63C2N4hQK874T7uE=;
 b=HTYs4vJSqiZf24P3dYs9GLUX7rPDvrW5WPOqmxuqdPvG1fWKOrtAaxW5iPa7udORhs
 b9i5AjwGRydqtXyPWl9l1WyifmFPrE1TjXWuUekXG/SN8k/lsLQ5Uj5GcEUNUtVa9FW+
 0b80Zk0fBA+xDaqshTQPl1qF4IiqLtUXsrO4V53O6119qoWh1HLapzhtkRgyt2LuH3tE
 DdadlKzxFf6zVwSaYnm4y2xuq1F3vSsNQ/jO/RscfUNPcQiOe8Y/ge/BadjmQ/80jgi6
 2OphhvqWEvbM6/ygjcgKCfq2zVJiae0zpWjXYEg8QDUd1MjW3nPN8caRKzFc2nbHovN9
 cCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002812; x=1684594812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyFxajlvcBm0zO8ecOyTw+g/FGP63C2N4hQK874T7uE=;
 b=V/3DRkYzwz5miUNH1tFq0B0/srA9NYJA5uEfTXqcGGCVBYeAz1msR4rDqCzyZ+A9o4
 oMf0pY2unJYFVi7RNaRF4a+YkS1Z4QgFZJ9QmXYtabLyntKKTfOtdRYIt09sMI7QIfy3
 2y1/LkhuzNWs6NPF/zJssURcVmvgIN/6ZcncpEx87eJPWzFEq9U5UdICPZJJWvxLi9rZ
 F3y0eg+U1UTK8HjneLgIOHi95m5R0K8+RZR9xEwUJ/iTl2CDDZiFyVu7FuvTQwl1QHYz
 eO9fsELiCpBrOaUibGwDU9k7CTcYxnKQnFm6utOYdYv7nH/jU/dTxuQeDMjIT3yxIKLe
 vPsw==
X-Gm-Message-State: AAQBX9fSU651u0N8E/FcZUfzJBArfLuxxsqpy4wNEysispk6h3fJkikV
 YuTjthtay/ep7jk9Ciy9ha7hhQ==
X-Google-Smtp-Source: AKy350Zf0HBI8PleKU98EpZmncQ5J8QaEw/N2bJXT93n6nPi8P1kI+jayRRIWg+lBHLQrOK36lSrHQ==
X-Received: by 2002:adf:ce86:0:b0:2f0:2c3c:b858 with SMTP id
 r6-20020adfce86000000b002f02c3cb858mr4582129wrn.31.1682002812460; 
 Thu, 20 Apr 2023 08:00:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a5d6892000000b002f9bfac5baesm2167452wru.47.2023.04.20.08.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:00:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AAAB1FFBC;
 Thu, 20 Apr 2023 16:00:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 04/10] scripts/qapi: document the tool that generated the file
Date: Thu, 20 Apr 2023 16:00:03 +0100
Message-Id: <20230420150009.1675181-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420150009.1675181-1-alex.bennee@linaro.org>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This makes it a little easier for developers to find where things
where being generated.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/qapi/gen.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b5a8d03e8e..282f5091e3 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -161,7 +161,7 @@ def __init__(self, fname: str, blurb: str, pydoc: str):
 
     def _top(self) -> str:
         return mcgen('''
-/* AUTOMATICALLY GENERATED, DO NOT MODIFY */
+/* AUTOMATICALLY GENERATED by QAPIGenC, DO NOT MODIFY */
 
 /*
 %(blurb)s
@@ -194,7 +194,7 @@ def _bottom(self) -> str:
 
 class QAPIGenTrace(QAPIGen):
     def _top(self) -> str:
-        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n'
+        return super()._top() + '# AUTOMATICALLY GENERATED by QAPIGenTrace, DO NOT MODIFY\n\n'
 
 
 @contextmanager
-- 
2.39.2


