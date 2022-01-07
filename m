Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B580487E61
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:39:13 +0100 (CET)
Received: from localhost ([::1]:51244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wx5-0005kR-RV
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:39:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqx-00058X-NM
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:51 -0500
Received: from [2607:f8b0:4864:20::42f] (port=40472
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqw-0007nw-01
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:51 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q3so6180557pfs.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QpRO123Bmcp8gnxHTNxvrG4cXevO8jcgrFEBPY0E1Yw=;
 b=Wo9hUcFNuFQ2N7daapWkP2NQmDxMr78MWiuVZEGQiYVDCaVVLJkGtFTWxFRx7nvXYG
 bL3AQC0c4UxbNi5mE9MhpWYpKdzMYhpXf7Ua00zdKUevpV9MbY0xUaF7Ok6MLnXbEMDd
 XivYDAqOx8/onjpDJZzO9HWe7/SD1rgCPIuQYRhV1JAtW1f5kbM6Faq/gqX5RzJQO8HR
 vF84YIvSwTvZBVXzQl94f7Xfgv4qxOQlUMkuuZCWT4yKuf1aGBzZXZFl2pSQP0iDAcR1
 CGNWDtxoj9waGsT38h4kBYxNLjI9YdWXd+VpMJOD/Kv7wXMLGieEwlA7fYQ0LcNedj57
 Fo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QpRO123Bmcp8gnxHTNxvrG4cXevO8jcgrFEBPY0E1Yw=;
 b=txVGtA8sDZKAilZz7QA0CKhWFjq78W9vtZr8feJmJhEqvXhxJ4f3E+Qgk2uZn8RgFo
 sT0/70gOHJFoC4p+YKSM21X3K2ltsA0fi0phD5DITm8ZoYiDnGEmYk+IfLj0r3Ei+3+g
 S5TNhZSdgvtzyV7f/+/SHOWjeooqHf3LK/ksoK/faA+6MrdkRA78uzkxTd4uFA6c9WYA
 +CTwx7KIYQYE8jJK8EMKJB+YKMD7s05IhQ647YiEk/jsKdTJN0ig8q3M0wWchHULXBNr
 nPpTTVl+Z7nErOr2ZwJILK7FLRv5QqJkN11DgjCtqByTblETBkmT2KHL9cvgsFYXrrue
 rN5A==
X-Gm-Message-State: AOAM530piDQGIdHGyDU/kOJ593TREj0uhC4kWnLxlBxHOl+EDyKtNBqt
 lwKEcrxkumWdfTTXRYYjP7otzq835qksmQ==
X-Google-Smtp-Source: ABdhPJx1ZYPfoVcUbiwIlAGfUXPCQCL5RgJOvy7WEDKV/jaZLsiZlhugHT4+10riT4SNzwGVG+82QQ==
X-Received: by 2002:a63:921a:: with SMTP id o26mr41303398pgd.312.1641591168818; 
 Fri, 07 Jan 2022 13:32:48 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/24] linux-user: Remove TARGET_NSIGFPE
Date: Fri,  7 Jan 2022 13:32:26 -0800
Message-Id: <20220107213243.212806-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This define is unused, and we have no similar define for
the other signal sub-codes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 18bed558fe..510a8c1ab5 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -688,7 +688,6 @@ typedef struct target_siginfo {
 #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
 #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
 #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
-#define TARGET_NSIGFPE         15
 
 /*
  * SIGSEGV si_codes
-- 
2.25.1


