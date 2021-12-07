Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2146BE00
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 15:42:18 +0100 (CET)
Received: from localhost ([::1]:53510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mubfd-00012W-8V
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 09:42:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mubdA-00073E-KP
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:39:44 -0500
Received: from [2607:f8b0:4864:20::430] (port=40482
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mubd7-0008FD-FV
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:39:43 -0500
Received: by mail-pf1-x430.google.com with SMTP id z6so13669521pfe.7
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 06:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j9AQf+EMNh25sGpRFeDuLbHKAtIHgBU0T0Ir0Qy/YmI=;
 b=M3pJBkb25WUaFgle39JS5f03cafIiQOOkIB7GHABOj4wsv6Wau9PFmS4k/QPIEzbUa
 zubU2VHZzPBCJlb/Ja9INCEemmbsJ45BDcbRkKzJNgpvf9iv5Y6dujnOn65z/WE9ALB+
 t0JBD5ybODKYeGiLhqmKmVWeno0fqRlRiG30xfzp8b7X0YA8j+j13+BVU6HseBD2stVy
 /3N2/FuZZXQWaubCXguTQ5M+0vCuW5l86YLryBFnGZynQ0IaQl7PtyMw9C7zg6rgR8VK
 pZY28EEb7URQHPrZMycwVLU4/nmHtIYPnK+B7JbjXn12z9jEnjpnfAuZGv9mOxRcHQjl
 iRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j9AQf+EMNh25sGpRFeDuLbHKAtIHgBU0T0Ir0Qy/YmI=;
 b=gKxO71oAD8cHyg+aweeN7W1WCwftf3iCTQUKiu+iVtwepXJPK2X0bgtKg5Ejvc/e3Q
 Kgxepib0oqVancJrgjALpaigXkVgdUOUz2SGC3Nv76wagiqeCNJBDVLBHVzGOFhzQPXE
 0FXR+EsYCCP8hDLzEopwb0c857fNFnQmeVJ9jB3u25NO5rcK3RfIWDmajn1/kHSxXmtM
 NCyl3Hhf/QqwAGiGUSDJUHuOfn46ARd1ELn5Srope1krQ24Ov7D3KXPhUOel66Om1e4i
 kNXbCz8TElawDB5lNkiWpHztKjSFFIDvCDGZ5JfoNJAVmapQ0Gn8qxFrlo3q+Vf5qwqa
 Dr4A==
X-Gm-Message-State: AOAM531NhhOsfciH4Ac4TMg5ZfzwALRI1vkVAs4WtobglHYQuNbCEExO
 RodQ37eRNWx1rsoegs73DhRXPD+LjDcBfA==
X-Google-Smtp-Source: ABdhPJxVj2WZoYtZebwfYjj4NHnu6FbOxGI4V/ZHIXPj6qojImqR39Ok3eYFOO0er3gK1P6ObVTZ7g==
X-Received: by 2002:a05:6a00:1946:b0:44d:8136:a4a4 with SMTP id
 s6-20020a056a00194600b0044d8136a4a4mr43396230pfk.46.1638887980052; 
 Tue, 07 Dec 2021 06:39:40 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w142sm16105490pfc.115.2021.12.07.06.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 06:39:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] tcg/arm: Reduce vector alignment requirement for NEON
Date: Tue,  7 Dec 2021 06:39:36 -0800
Message-Id: <20211207143936.258418-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207143936.258418-1-richard.henderson@linaro.org>
References: <20211207143936.258418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With arm32, the ABI gives us 8-byte alignment for the stack.
While it's possible to realign the stack to provide 16-byte alignment,
it's far easier to simply not encode 16-byte alignment in the
VLD1 and VST1 instructions that we emit.

Remove the assertion in temp_allocate_frame, limit natural alignment
to the provided stack alignment, and add a comment.

Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1999878
Reported-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912174925.200132-1-richard.henderson@linaro.org>
Message-Id: <20211206191335.230683-2-richard.henderson@linaro.org>
---
 tcg/tcg.c                |  8 +++++++-
 tcg/arm/tcg-target.c.inc | 13 +++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 57f17a4649..934aa8510b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3061,7 +3061,13 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
         g_assert_not_reached();
     }
 
-    assert(align <= TCG_TARGET_STACK_ALIGN);
+    /*
+     * Assume the stack is sufficiently aligned.
+     * This affects e.g. ARM NEON, where we have 8 byte stack alignment
+     * and do not require 16 byte vector alignment.  This seems slightly
+     * easier than fully parameterizing the above switch statement.
+     */
+    align = MIN(TCG_TARGET_STACK_ALIGN, align);
     off = ROUND_UP(s->current_frame_offset, align);
 
     /* If we've exhausted the stack frame, restart with a smaller TB. */
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 633b8a37ba..9d322cdba6 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2523,8 +2523,13 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
         tcg_out_vldst(s, INSN_VLD1 | 0x7d0, arg, arg1, arg2);
         return;
     case TCG_TYPE_V128:
-        /* regs 2; size 8; align 16 */
-        tcg_out_vldst(s, INSN_VLD1 | 0xae0, arg, arg1, arg2);
+        /*
+         * We have only 8-byte alignment for the stack per the ABI.
+         * Rather than dynamically re-align the stack, it's easier
+         * to simply not request alignment beyond that.  So:
+         * regs 2; size 8; align 8
+         */
+        tcg_out_vldst(s, INSN_VLD1 | 0xad0, arg, arg1, arg2);
         return;
     default:
         g_assert_not_reached();
@@ -2543,8 +2548,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
         tcg_out_vldst(s, INSN_VST1 | 0x7d0, arg, arg1, arg2);
         return;
     case TCG_TYPE_V128:
-        /* regs 2; size 8; align 16 */
-        tcg_out_vldst(s, INSN_VST1 | 0xae0, arg, arg1, arg2);
+        /* See tcg_out_ld re alignment: regs 2; size 8; align 8 */
+        tcg_out_vldst(s, INSN_VST1 | 0xad0, arg, arg1, arg2);
         return;
     default:
         g_assert_not_reached();
-- 
2.25.1


