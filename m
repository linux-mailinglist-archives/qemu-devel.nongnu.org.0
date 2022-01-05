Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43844484D98
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 06:25:24 +0100 (CET)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4yna-0003Hg-ST
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 00:25:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ym1-0002Vg-Uk
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 00:23:45 -0500
Received: from [2607:f8b0:4864:20::1031] (port=54919
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4yly-0007ui-9S
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 00:23:44 -0500
Received: by mail-pj1-x1031.google.com with SMTP id jw3so33035480pjb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 21:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2NU64QEsz6R/k3U+kTGtVUwuUoMUWCNpIvdZLR5x1I=;
 b=setHeOfwFYmK4QA9xnwC7adB7UqIDnl5/bIGUl5pVmcZR4QzwWOJDACXBW5BbL4W36
 ktNqKfTwQz/O+WZ0GiwQnfTlH4JbAcbJvfSBwRS77XnXsL90trSrau92c9EuRNSRXCX0
 cKLD+h7p88oDCoFJo8VAJvomyvsYhlURCxsyF4uPHNk4h23Qjr1saw1NMpTs8Og9kou1
 3veWYTi1fyhLQFWDc5BeS+0dhrudwYD2qNuDAFd6AfqtEGZ6m3NI5yJSPmtBiEnQVaMG
 YxzTlz/jLzDj8NMcVUv7xfOJilWVKz/kf5JqlGBhdCZ27mNANYDn49K//R+ZCY5eP0F2
 nUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2NU64QEsz6R/k3U+kTGtVUwuUoMUWCNpIvdZLR5x1I=;
 b=vx/HQ7ZZnkEwvyIN1gP5xalR2YBU2d0CKMNjNNGrpkgWOz8SDZ1gNlLJOduqiDb+8h
 g5IuVneY6OJck+BlgVwsCbwNQGXFXJOOacp37w6yS3e5ikn2EEXLyWjj1k6uFkOIBoeD
 PZR/T5rjK7ZyEB/iQsdhJXBDFzVJWDj8vT6nItO4uy2rpEEHHkwE+MDSie3guku9B48g
 SVtN1P7fbA9PVMM3JNQaG1vNWkSsAiramT+G4Y+izX+tJEV4MclPuzaeFrtAak+8JOjD
 hyOf4DKhtrIWSJkWY1wtnCW88oNBiiBI0avP5wrYBgUF2lyYX7tG45YlxAFNP9/t/OMU
 qLHQ==
X-Gm-Message-State: AOAM530LZ1qIH0wX0FxBcNpMeDmccFv/f+pEkczwR4StSbWQU/UeovV1
 aSiTJ7gSV8QZ7I5Ph38YE5N8jHIV/paPLg==
X-Google-Smtp-Source: ABdhPJzhzjy2+FWOIlotA6Egx/zEya0i/cJiEg2OL81ZxqNJK/XoJLx+AkckgwGwbcl0/UGa8hy07A==
X-Received: by 2002:a17:90a:f196:: with SMTP id
 bv22mr2158887pjb.155.1641360220614; 
 Tue, 04 Jan 2022 21:23:40 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s14sm43785342pfk.171.2022.01.04.21.23.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 21:23:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] common-user: Really fix i386 calls to
 safe_syscall_set_errno_tail
Date: Tue,  4 Jan 2022 21:23:39 -0800
Message-Id: <20220105052339.677395-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Brown bag time: offset 0 from esp is the return address,
offset 4 is the first argument.

Fixes: d7478d4229f0 ("common-user: Fix tail calls to safe_syscall_set_errno_tail")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Ho hum.  I'm disappointed that our CI didn't catch this,
despite cross-i386-user.  And I'm disappointed that I
didn't run a full manual build on an i386 vm to catch
it myself.  I plan on committing this directly.

---
 common-user/host/i386/safe-syscall.inc.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index 9c45e56e480..db2ed098394 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -120,7 +120,7 @@ safe_syscall_end:
         pop     %ebp
         .cfi_adjust_cfa_offset -4
         .cfi_restore ebp
-        mov     %eax, (%esp)
+        mov     %eax, 4(%esp)
         jmp     safe_syscall_set_errno_tail
 
         .cfi_endproc
-- 
2.25.1


