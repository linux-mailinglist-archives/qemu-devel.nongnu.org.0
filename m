Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D848ED74
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:54:38 +0100 (CET)
Received: from localhost ([::1]:60380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OuT-0002jP-VZ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:54:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Oe2-00087Z-P2
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:37:38 -0500
Received: from [2a00:1450:4864:20::42c] (port=46007
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Oe0-0000c8-Fo
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:37:38 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q8so16203933wra.12
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9oAiFDmRNiyFx5akgXGrz8fMLaOCHj0Qubxkn3ACL54=;
 b=oUH52jypv1ZTywTRXYBzZXthG7h05bVSWQse2I+ONsHk68CDPDAV4KmveWP7RdNmDN
 iW+AOLXmgcTvBCTSM7X3xhPV8KAnOUdDi2NBei9Y4yfQj7p0aw+CbaPBgekhMsm6Vu6d
 CR6BEn+nWW/DYorm1P1HXu8+i1dUc6TPA54zICzM+1XSEvzjLYgmJoktIcgUj2NiBCoE
 ta3fdf7loBo00LyETyBNX2q91AIJFPl3gMX/r96qhCFZM14m15gpdfFkTYXiHqTi6Kgh
 Lh+IihBdJY2LBJibjmST5yp4m/ZiuDH8dWixB9AU4ejrT+BXUJ0YclCNxfIQG//Cogsp
 yCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9oAiFDmRNiyFx5akgXGrz8fMLaOCHj0Qubxkn3ACL54=;
 b=EHZZ2xa0QdgYK6pCD5jCNX/muWjsEtJi6hR7SmO6rVJTyKIybCCiYIR13+8SiVHBfv
 zaJEWVCImuC8GkBS/pXFu67RDyB3QLn8HRr9nkGMOHDDEfGVayCyzpMg++hj9HCRumC3
 0zXzLuscT1aaafcT1rgCWq+8M4F69Se5WPnxepmNH79sCJWhZ/HMf/NV4aC5b5c7C/H0
 U8wCDIRZkChFkzvVakkHzud3ktDf4X0oJocPda8fOtXpOnrZuQORuO+BCDBBwPsYNNct
 rNC39TdY1Ck8clT/SVWxr8YrBsHVsWdqEC8YFZypOvn/QFv/T9NTmq+xo8adLb3wX24M
 KW2A==
X-Gm-Message-State: AOAM53018GOa9wy0kd8umdtkVBq806V/81l+EpzKSLL9cZ3T9/ttw5C6
 AbiP8BLJszLtGzCLjjUbaFyZuCNqj78z3Q==
X-Google-Smtp-Source: ABdhPJy0hmMEQvr5EA3pDR1CMD+r7j5yBkTDlAqhHk9xyTkApRHTKNNs5SXPGMmolcG4nNfzyAvcZA==
X-Received: by 2002:a05:6000:2cb:: with SMTP id
 o11mr3237552wry.187.1642174655246; 
 Fri, 14 Jan 2022 07:37:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v13sm6464141wro.90.2022.01.14.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 07:37:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] linux-user: Remove unnecessary 'aligned' attribute from
 TaskState
Date: Fri, 14 Jan 2022 15:37:30 +0000
Message-Id: <20220114153732.3767229-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114153732.3767229-1-peter.maydell@linaro.org>
References: <20220114153732.3767229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The linux-user struct TaskState has an 'aligned(16)' attribute.  When
the struct was first added in commit 851e67a1b46f in 2003, there was
a justification in a comment (still present in the source today):

/* NOTE: we force a big alignment so that the stack stored after is
   aligned too */

because the final field in the struct was "uint8_t stack[0];"
But that field was removed in commit 48e15fc2d in 2010 which
switched us to allocating the stack and the TaskState separately.
Because we allocate the structure with g_new0() rather than as
a local variable, the attribute made no difference to the alignment
of the structure anyway.

Remove the unnecessary attribute, and the corresponding comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 5c713fa8ab2..bd0559759ae 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -96,10 +96,6 @@ struct emulated_sigtable {
     target_siginfo_t info;
 };
 
-/*
- * NOTE: we force a big alignment so that the stack stored after is
- * aligned too
- */
 typedef struct TaskState {
     pid_t ts_tid;     /* tid (or pid) of this task */
 #ifdef TARGET_ARM
@@ -160,7 +156,7 @@ typedef struct TaskState {
 
     /* This thread's sigaltstack, if it has one */
     struct target_sigaltstack sigaltstack_used;
-} __attribute__((aligned(16))) TaskState;
+} TaskState;
 
 abi_long do_brk(abi_ulong new_brk);
 
-- 
2.25.1


