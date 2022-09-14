Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242D5B8CC5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:21:45 +0200 (CEST)
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYV8y-0008VZ-DI
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnu-0006TK-Kp
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:58 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUns-0002n4-RZ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:58 -0400
Received: by mail-wr1-x433.google.com with SMTP id g3so5533740wrq.13
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1f/7sfWBRdUlRKRIHXh6N9sBf3lAWvS8nOz1+E+gsL0=;
 b=jSBVLqQL3V+5NWbp9+BIBQbsaY9u/EVdTVsRhpJwYSFs8MH7mOYbVCmUhSwKFHAWsm
 6HsI9lyGhxcupfla2tze6WJUx4V0pGCjBQtv7gPkQ+jxCtFfiSr3CwIrwMdP4PIpC0+M
 hy/cYrSUt4mo9G9CZnw0eFOabDRbwyFNj6F7wCkmCZu9mqhcsppQ9htjUIoVVi9pc0LG
 6GIcj1OErv2OeSdwINx+Byg5RexIKkQqLhIb2pgQVO8ddLw8K/b8AgtN3In3fd1/fqvP
 Hb5sic2wKbTc61VwstRiHFzdeTaL66rpP4Nv5telrTJdWZxCJp8h52PPlDHNr8muqnhy
 fSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1f/7sfWBRdUlRKRIHXh6N9sBf3lAWvS8nOz1+E+gsL0=;
 b=kq/Hhz0PCrlGrkMVNiEjjTKZs67J12MN5to1iz+ftBhk4GkbRbbnlKL+VM2rJj92E7
 HW0z7ehTkKhV5y4KO0V4cXNYTqVUrTCvUost71WpcI0ZsTHL0ugG/4iQ/Y5+71IF2rpe
 9pXIoRNQvpZSYP35OvuNxStKtNXnSk7z68eKUZKFSgoGy6887utc520kdnG0FTKUzFAI
 wCHcnbFVHPJ4SgNa8qF/Acz+UBvXMy8zSD3GRPNSysFZStV++YZHdjFqFLCVhWxvg0Kn
 wo9nfgsk8s5b4nUDjJqEbpZkVuMhT51fIDt8KeLk7ORXQDU8P5KlzTVUmBe46/+6VuZm
 pdtA==
X-Gm-Message-State: ACgBeo3FawZ7BL14H6tkHvno5wO7In0TezP2Rj+c2ATXgHLpcuEpNcq7
 Jo3X1s6YPUYcekZT0iQK/BqSPQ==
X-Google-Smtp-Source: AA6agR51Y7+YqBQ0gMBYuflAjezKUf1oxIfYmyETTsoRUVvHJW8TowZ5CgTGFHcDKfbeLmntoVffyA==
X-Received: by 2002:adf:fb05:0:b0:228:6463:b15d with SMTP id
 c5-20020adffb05000000b002286463b15dmr22213594wrr.534.1663171195615; 
 Wed, 14 Sep 2022 08:59:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d6751000000b0021efc75914esm13523032wrw.79.2022.09.14.08.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E5D1E1FFBF;
 Wed, 14 Sep 2022 16:59:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 07/30] tests/avocado: reduce the default timeout to 120s
Date: Wed, 14 Sep 2022 16:59:27 +0100
Message-Id: <20220914155950.804707-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

We should be aiming to keep our tests under 2 minutes so lets reduce
the default timeout to that. Tests that we know take longer should
explicitly set a longer timeout.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220826172128.353798-3-alex.bennee@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 5f1d3e551c..910f3ba1ea 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -229,7 +229,7 @@ def exec_command_and_wait_for_pattern(test, command,
 class QemuBaseTest(avocado.Test):
 
     # default timeout for all tests, can be overridden
-    timeout = 900
+    timeout = 120
 
     def _get_unique_tag_val(self, tag_name):
         """
-- 
2.34.1


