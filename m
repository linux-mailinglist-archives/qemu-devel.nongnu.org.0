Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12D6A4D4C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:35:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl7y-0007Ba-7o; Mon, 27 Feb 2023 16:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7w-00079z-1T
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:44 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7u-0004H0-Fx
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:43 -0500
Received: by mail-pj1-x1035.google.com with SMTP id y2so7626102pjg.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVJHbUykgOVOv7t67KB4t0GKsC8KJ/J9KiSQxpR45pA=;
 b=agjmA4MTl6QPVFdtv+h+j/a+h+LOiOvFlHgEUAkFoXFsXKwQ3ZNynnfXHz7TIT0Gfc
 6beifMhdiXEqkRw616tE0MneXazpUZHaMWaepVleODSdcwE51eWvXhNhhA4JBHLCHIJO
 qS4N1U+tLBoxfZRFsU8b1rgTnXrromer0RKeXL7mWVNtJWvgfw80qIPfO6r94RiEytb5
 ooOT1Snvr5O/+uhs2ECK8uHcQ6z++lnGd1vi0hTjFnumEwIfwevMDSXuOJ6hSNAvvwL4
 BBzzcfIlH1z7yXi8k2AnKscKyiMzGbMHo+bQGZh8T9btUqPmPtwLT9vNQflp/Hvz53XO
 cX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FVJHbUykgOVOv7t67KB4t0GKsC8KJ/J9KiSQxpR45pA=;
 b=nyzh/sWk7e+XKeGlH+TT9loMIZQpCKyA/+1pYK1YelIcVGsI+vKQumayyFBewpV+kK
 TRHLF8SjjuXIoUJ09Vu6qYQ/S9kvszCakfhzReFiYG5h9vGkgJC3ymS6xMbIbw6CspGg
 NLlRI4LUGqCifqddggsx1fDou5+m9GL84CpT8VUnA071hUnsXDBkqR9esKphHvRuxHwd
 EEsoS6QHRVMsJPP3hEGjS8v3geYhAmpxAQCbItY2brunDiTOehxgNU+aaOodMOYw+52J
 9Vqkkt7wXheQ4ItdKEREt3Wr2nYMLwEqIFq3+6XJ6JTCjlcLav0QNG9wo1xmb0kIgcxi
 Wl1g==
X-Gm-Message-State: AO0yUKUZ5GgoWa115ZhnG3RqMU0C33FQT5iHCyDJnu4W6dowpXdoqTRM
 2ocF5M948AF7BBKAVQ2kSd4mQhcClU7CCGb2d18=
X-Google-Smtp-Source: AK7set+VASrc+xLSb4V9BV/bnejsijeW5VITEPZ/Qg0YKIzsW8TqbRWg9/yVwH6iAC+wcqLMiolneA==
X-Received: by 2002:a17:90b:390f:b0:236:9eef:e285 with SMTP id
 ob15-20020a17090b390f00b002369eefe285mr608537pjb.35.1677533621792; 
 Mon, 27 Feb 2023 13:33:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 06/14] target/arm: Hoist pred_width in
 arm_gen_dynamic_svereg_xml
Date: Mon, 27 Feb 2023 11:33:21 -1000
Message-Id: <20230227213329.793795-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 070ba20d99..895e19f084 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -283,6 +283,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
+    int pred_width = cpu->sve_max_vq * 16;
     int base_reg = orig_base_reg;
     int i;
 
@@ -319,13 +320,13 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
-                               i, cpu->sve_max_vq * 16, base_reg++);
+                               i, pred_width, base_reg++);
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
-                           cpu->sve_max_vq * 16, base_reg++);
+                           pred_width, base_reg++);
 
     /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
-- 
2.34.1


