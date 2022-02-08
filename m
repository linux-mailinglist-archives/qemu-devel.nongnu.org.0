Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69764AD404
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:52:43 +0100 (CET)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMEs-0006gq-O9
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:52:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKgD-00079d-6J
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:49 -0500
Received: from [2607:f8b0:4864:20::102b] (port=42522
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKg9-0000RK-Rz
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:47 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so1784104pjb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uh058XUts6HPkXe97baHsy8/Ac7JrSk6cgbCWbIo3VY=;
 b=znbDpHVWPdPeOFwQq63atb1VJMFLiq6Njizswlg8axXVYQLQiNuF2D6I33hRhZm0u4
 AgWLKR0vHpq+HS3oqcakBvnl8ig4aThIjkhUetzqKKeKR7JWejK27LE3Oj8BR8B6woAD
 B77OfgJuYEG8Xkh9DEW80tQvxsYpajsdbLqKALNXXFBuqyl3WJMxxVaI5XqnlJh9acap
 EcjNKDrhUZr7OaSGCxwKPsi2Vg0Ug+a6Jeow10tCJZH6GWl9ySF2bTCaGru6WNtOvYSH
 91TA5EM7IMA22WEcufSNsT/bd5yR+rv1r4DW68S5MjUvSPEU7qlCRic7TXPrUuHFINed
 Gowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uh058XUts6HPkXe97baHsy8/Ac7JrSk6cgbCWbIo3VY=;
 b=6qihhCiUBVNBuC0Q314KPZJGqSRRb5Q5UWGMSMzCkz0ryGzinXRT+dVh8N0p9BC+3K
 dIIHpGoriCkCb5BnnGXHBH0Mw3Yv4cRLvRFK1bGVqzW5kv8nIz10jING/QfcHqv8aMOq
 GSZy0wsdCA8JGbeP5CNYFWnN89iKR2F7V7UsRF3OEn/vkfABulCWzpOkWvOHE4oDMNOn
 q+PE8qRmGaItjCZBMckOngSiWiknGMIBommnJuUUAk+AebHsQE4EpVk1ofTD1ZegKlqE
 BRhcOVcxxCLBaocaLlwGrDEpvQYL3YvySBKO9R4F+A8yDMHOHlOKWXA4f4DeqAHj+jBq
 TWew==
X-Gm-Message-State: AOAM530e8A108vffGHnzkKVYDG3GOpvERHXJnTSnG+BR6JHxyyy1bPEw
 TvVR5vuWht2Ejs0LmHqbOKF6axLLwz4gEA==
X-Google-Smtp-Source: ABdhPJwx36SQLKVTQZj2Nt+PwJH0Dm/NcAoIucrm1/IZro3A/SiONRSL++9lKYZ/XEgUM6QJRTSSJQ==
X-Received: by 2002:a17:90a:d343:: with SMTP id
 i3mr2961862pjx.104.1644304364242; 
 Mon, 07 Feb 2022 23:12:44 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id b12sm13908088pfm.154.2022.02.07.23.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:12:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] common-user/host/sparc64: Fix safe_syscall_base
Date: Tue,  8 Feb 2022 18:12:33 +1100
Message-Id: <20220208071237.319844-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071237.319844-1-richard.henderson@linaro.org>
References: <20220208071237.319844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the "retl" instead of "ret" instruction alias, since we
do not allocate a register window in this function.

Fix the offset to the first stacked parameter, which lies
beyond the register window save area.

Fixes: 95c021dac835 ("linux-user/host/sparc64: Add safe-syscall.inc.S")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 common-user/host/sparc64/safe-syscall.inc.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/common-user/host/sparc64/safe-syscall.inc.S b/common-user/host/sparc64/safe-syscall.inc.S
index a2f2b9c967..c7be8f2d25 100644
--- a/common-user/host/sparc64/safe-syscall.inc.S
+++ b/common-user/host/sparc64/safe-syscall.inc.S
@@ -24,7 +24,8 @@
         .type   safe_syscall_end, @function
 
 #define STACK_BIAS  2047
-#define PARAM(N)    STACK_BIAS + N*8
+#define WINDOW_SIZE 16 * 8
+#define PARAM(N)    STACK_BIAS + WINDOW_SIZE + N * 8
 
         /*
          * This is the entry point for making a system call. The calling
@@ -74,7 +75,7 @@ safe_syscall_end:
         /* code path for having successfully executed the syscall */
         bcs,pn  %xcc, 1f
          nop
-        ret
+        retl
          nop
 
         /* code path when we didn't execute the syscall */
-- 
2.25.1


