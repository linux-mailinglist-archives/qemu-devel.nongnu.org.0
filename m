Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB6F48C394
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:54:01 +0100 (CET)
Received: from localhost ([::1]:59844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cCV-0006m0-SV
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:53:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvN-0007Jc-3J
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:17 -0500
Received: from [2a00:1450:4864:20::530] (port=43809
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvL-0004jL-GL
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:16 -0500
Received: by mail-ed1-x530.google.com with SMTP id m4so8626168edb.10
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UBnsjR4texEm+5rHnMsAcY5cLuRcQ4DtHBf5IhuHlXk=;
 b=ZIqIU3Sk+bmnKP7Y52Co6vV9S9hXkB2CUIz9O3LbAtefKmN9F6ciCU21jtM8M+L5ki
 xYxrdHPnnUA0WO7g7Y8nTEQ38eUX6HJ62pNtfMbZtPrupRfEfAjU9HTe+yvOd6oXzfkx
 RMWM+rc5/NEPsQQyHs14ADZLcWnCvPXp+T+L48UZjaXa7hq1K+fdGlPZktMI9zv+GBR3
 fKdm45aoegkadCt7Bk++IJhvF/xQDGS7y0YeNVAzUZsleXUyPgw4EiWEwpYbO1tKlUZA
 P63lfAhcBTpnFXFNLtRKzGuUZ2s94eUiaBvF0BSl1betgSVY7F4UycBTFCwtaNM/uMr+
 zltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UBnsjR4texEm+5rHnMsAcY5cLuRcQ4DtHBf5IhuHlXk=;
 b=uP/BQxjVZWe/zjgCvpPhkONOnj3FeO0580pRnaESOTE7rkLXLBDIgbRPhQTw6Q5WOS
 KZMYCYzyLZJ0LRjYC1F6KLDJJiHsZd+AFwZx9U8i3wIaZSjr1CZU1F53bcrHaltbCkEp
 cqIjsFypQ3AkopVOznDL0e9GPmiHaYrtZu+g+bBadJINCBrh/XvC7wZI8hMfC0dUpALF
 9O5V9Rs5mPdbufgqKnZE5uaUwMVl5Yw3yfSNmHh7u2RcCr7KU3dqnHa/9ajHPQIceEBt
 E9Bk00BgfhSTzGAg/oL/JT3sgu/jjzJXGniEqMsz/z+v71LlJfLz44/W64HExUIyTdlF
 BZZA==
X-Gm-Message-State: AOAM531Yz4APMp7g6CByhLMUgtY1RSpFwZyk99WBXNOqJwGoxUQtDKOb
 AdILk1lp03Qa8eFd5m5Paf0FqC72CC8oNQ==
X-Google-Smtp-Source: ABdhPJzXXhzi/BqysIfJSq7rGi4h+hbjf3SJaeMSlYTo2bY+s1ALi2MUBhNy32qosZsf0F3o9eMswg==
X-Received: by 2002:a05:6402:3496:: with SMTP id
 v22mr8737156edc.347.1641987374231; 
 Wed, 12 Jan 2022 03:36:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lv23sm4369201ejb.125.2022.01.12.03.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:36:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 940111FFD1;
 Wed, 12 Jan 2022 11:27:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 25/31] linux-user/elfload: add extra logging for hole finding
Date: Wed, 12 Jan 2022 11:27:16 +0000
Message-Id: <20220112112722.3641051-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The various approaches to finding memory holes are quite complicated
to follow especially at a distance. Improve the logging so we can see
exactly what method found the space for the guest memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20220105135009.1584676-26-alex.bennee@linaro.org>

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 329b2375ef..8ef0626eb0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2267,6 +2267,9 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     if (test != addr) {
         pgb_fail_in_use(image_name);
     }
+    qemu_log_mask(CPU_LOG_PAGE,
+                  "%s: base @ %p for " TARGET_ABI_FMT_ld " bytes\n",
+                  __func__, addr, guest_hiaddr - guest_loaddr);
 }
 
 /**
@@ -2309,6 +2312,9 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
             if (mmap_start != MAP_FAILED) {
                 munmap(mmap_start, guest_size);
                 if (mmap_start == (void *) align_start) {
+                    qemu_log_mask(CPU_LOG_PAGE,
+                                  "%s: base @ %p for %" PRIdPTR" bytes\n",
+                                  __func__, mmap_start + offset, guest_size);
                     return (uintptr_t) mmap_start + offset;
                 }
             }
@@ -2388,6 +2394,12 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     }
     free_self_maps(maps);
 
+    if (ret != -1) {
+        qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %" PRIxPTR
+                      " for %" PRIuPTR " bytes\n",
+                      __func__, ret, guest_size);
+    }
+
     return ret;
 }
 
@@ -2439,6 +2451,9 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
     }
 
     guest_base = addr;
+
+    qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %"PRIxPTR" for %" PRIuPTR" bytes\n",
+                  __func__, addr, hiaddr - loaddr);
 }
 
 static void pgb_dynamic(const char *image_name, long align)
@@ -2495,6 +2510,9 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
                      "using -R option)", reserved_va, test, strerror(errno));
         exit(EXIT_FAILURE);
     }
+
+    qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %p for %lu bytes\n",
+                  __func__, addr, reserved_va);
 }
 
 void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
-- 
2.30.2


