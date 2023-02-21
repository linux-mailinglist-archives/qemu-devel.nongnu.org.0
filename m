Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84169EB3E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUc12-0005DQ-Ko; Tue, 21 Feb 2023 18:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0r-00058D-Qx
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:37 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0o-0002Z4-UP
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:33 -0500
Received: by mail-wr1-x435.google.com with SMTP id 6so5678449wrb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CnNTwGg0MOHmmdkp5WuNV0U9bN887LNmRf50zWb625Q=;
 b=eFs26vK4M22XELInBI1Ob4vSmuZr0/f7PbMlVb0mnYED47WCwhRVkt4YiYll3Rpp2d
 +ESy2XhVh2vQU8FJka3zULXRf7co5Rdx3hrFwQJJf+0jc29Rpwezhc/Bx8bR9K7rat1g
 gUxcLQTVN2h+GNGcWllaTp+jPu9qkQI1jjbPcN4xuXTy7IDTLfz0VSjN1sN51FIHDqFw
 frC0Q7JbbcA+FmFMSLTL/Eq3ARG+BMMerQXqQh1hXd6maPB+TAPNS7/t06zakYwRH3NP
 A7xqCBJ8QAa7z/zZHzEuMCgTHjkqmFhfqmWtSSSadDBxxcl8uFnHdwH0KMbcJBfJCUrl
 WkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CnNTwGg0MOHmmdkp5WuNV0U9bN887LNmRf50zWb625Q=;
 b=IZJaI+j6yfLPltBHVIHRkJoIo05f+Zlx/wEoW07teKDEbVaBIINPBFSYCPX8fvlZFH
 k8nUYaGCmprkUWA4e9j2zqJInpSZUo72mw6cfm03/UmELXNmh3Ao2o1uTttzMg7vFq4v
 sFJ025XfnvmFll8W36h3eD6kgnHUT0OcvzO4lj2rLDjjUycYH4Em4c/BDoOYaWHDlKUa
 fshW0NgidkFsOKjSJK8s4WD6rfEJo6UbQBILePUdx0KzoPhBL5T+OYrJsOzAxoqPWapg
 Bi2gE76wk5kpE/sZ+0fUrTlaOwUM/qEC7C2AfYPcLBWX62MrtUE9mspc079jBbkqRBpO
 8dvg==
X-Gm-Message-State: AO0yUKUppBGx+YgV7Zk4WBZbaOFdMSdkYXikkUURd4zKj1U1CZrydY/1
 nVVU5Y9oge381rQFVFlb15WaOYxpOyqWlAaQ
X-Google-Smtp-Source: AK7set9oSCOpO/fBHFKiMhmatK6QXnGTxefMrlxpf7joPRgd5WZ6r8IAO0ASwCtgTf7pdr5uv7fCmg==
X-Received: by 2002:a5d:4d50:0:b0:2c6:e7ff:8f17 with SMTP id
 a16-20020a5d4d50000000b002c6e7ff8f17mr5207912wru.25.1677021928899; 
 Tue, 21 Feb 2023 15:25:28 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adff949000000b002c56a7872f4sm7044564wrr.82.2023.02.21.15.25.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Feb 2023 15:25:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 1/5] target/ppc: fix warning with clang-15
Date: Wed, 22 Feb 2023 00:25:16 +0100
Message-Id: <20230221232520.14480-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221232520.14480-1-philmd@linaro.org>
References: <20230221232520.14480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

When compiling for windows-arm64 using clang-15, it reports a sometimes
uninitialized variable. This seems to be a false positive, as a default
case guards switch expressions, preventing to return an uninitialized
value, but clang seems unhappy with assert(0) definition.

Change code to g_assert_not_reached() fix the warning.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230221153006.20300-5-pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/dfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index cc024316d5..5967ea07a9 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -121,7 +121,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
         case 3: /* use FPSCR rounding mode */
             return;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     } else { /* r == 1 */
         switch (rmc & 3) {
@@ -138,7 +138,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
             rnd = DEC_ROUND_HALF_DOWN;
             break;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     }
     decContextSetRounding(&dfp->context, rnd);
-- 
2.38.1


