Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E53313D2C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:21:52 +0100 (CET)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BAV-0007n2-Am
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oY-0003xp-4x
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:53 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oM-0003tG-AM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:45 -0500
Received: by mail-wm1-x335.google.com with SMTP id u14so12884428wmq.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6otRbMP+RBOCThfyzMD60/aGmiUs/GM+dCCZu0lPioY=;
 b=DxAruZKAc37QErLh8Ga7gA8Y0lDDqWlWJr+hDVdejFm5jvpnU7S1oJhycSjkj7fHDx
 DqwaK5vct8eGEOx3anH+V6yWeBpG7kxKJWtjAWv/uYfNWYE9tf9vz9URre/5KFoSrp/b
 B0dCW8GZaFCAP/fUy/+q+JJHUy+hIqnouoMIG8V5aGuc3xcH72ZWAOtt/Na1PHOYoRYl
 05j3YAn+q7Sdcis+0MNu8hH1sJYUUNHGsWc9uY+//pkXwke1z/ddwNviJ99A1MrZPB/y
 Wax07zDhKubKPB7UQKiWlYPS//0Rtgdfxjg0tfkuzWW/i4qtzo8MKgG3gVCiOMtQxVVu
 kLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6otRbMP+RBOCThfyzMD60/aGmiUs/GM+dCCZu0lPioY=;
 b=R8mCeisLmlXfFsH40zwaI1izLx1iPuS59UDUVY5MbFFEJTQauNGXI5/XDonMJTENga
 H9ps7riNLCvOuzHRg8lgYxizkYyiqf3EPJCf24kJ/tjql7oUAqhRYLk844g8wKyAwjSU
 VFKPB29WrboNd9zemRzLTvoDQiZcYmXW2BV3Us13um35ou5uJg/+botSdsa/SoW5j9fh
 HzVoWYGhODMfalXPR/UL6UIwrygA+V1l172UttUj13TUztG9oII8Cm9q8EBXkMUX5TNF
 GxwORY9SqnLWqJxGhDpflyLQDp/CcZ6VI4IRXAV7t8InHEanU9tiVOSZDtm22Vu3YHkW
 R/rQ==
X-Gm-Message-State: AOAM532xIsGBTpriiNwMZzDcW0nxFiFFtAuzzLVaOHR0RLIGdpRzbXpx
 162NtpKrf/ZfYWNWH1g43auqn7JlwQbgOg==
X-Google-Smtp-Source: ABdhPJw54s4ZmyiA0RRCcVoNnZuEcmP0Wt+jluPCrbCyFPWsmSv+rZ8x2raJtTPzLYzoMOHVI9RMrg==
X-Received: by 2002:a1c:9e4d:: with SMTP id h74mr14290952wme.103.1612784072674; 
 Mon, 08 Feb 2021 03:34:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a21sm16818134wmb.5.2021.02.08.03.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 03:34:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] target/sh4: Drop use of gdb_get_float32() and ldfl_p()
Date: Mon,  8 Feb 2021 11:34:24 +0000
Message-Id: <20210208113428.7181-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208113428.7181-1-peter.maydell@linaro.org>
References: <20210208113428.7181-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to make a distinction between 'float64'/'float32' types and
the 'uint64_t'/'uint32_t' types, requiring special conversion
operations to go between them.  We've now dropped this distinction as
unnecessary, and the 'float*' types remain primarily for
documentation purposes when used in places like the function
prototypes of TCG helper functions.

This means that there's no need for a special gdb_get_float32()
function to write a float32 value to the GDB protocol buffer; we can
just use gdb_get_reg32().

Similarly, for reading a value out of the GDB buffer into a float32
we can use ldl_p() and need not use ldfl_p().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sh4/gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/sh4/gdbstub.c b/target/sh4/gdbstub.c
index 34ad3ca0508..3488f68e326 100644
--- a/target/sh4/gdbstub.c
+++ b/target/sh4/gdbstub.c
@@ -58,9 +58,9 @@ int superh_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         return gdb_get_regl(mem_buf, env->fpscr);
     case 25 ... 40:
         if (env->fpscr & FPSCR_FR) {
-            return gdb_get_float32(mem_buf, env->fregs[n - 9]);
+            return gdb_get_reg32(mem_buf, env->fregs[n - 9]);
         }
-        return gdb_get_float32(mem_buf, env->fregs[n - 25]);
+        return gdb_get_reg32(mem_buf, env->fregs[n - 25]);
     case 41:
         return gdb_get_regl(mem_buf, env->ssr);
     case 42:
@@ -119,9 +119,9 @@ int superh_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         break;
     case 25 ... 40:
         if (env->fpscr & FPSCR_FR) {
-            env->fregs[n - 9] = ldfl_p(mem_buf);
+            env->fregs[n - 9] = ldl_p(mem_buf);
         } else {
-            env->fregs[n - 25] = ldfl_p(mem_buf);
+            env->fregs[n - 25] = ldl_p(mem_buf);
         }
         break;
     case 41:
-- 
2.20.1


