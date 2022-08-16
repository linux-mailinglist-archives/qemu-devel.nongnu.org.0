Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0FA5963C0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:38:06 +0200 (CEST)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3K9-0002oK-Dp
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3GN-0004db-NL
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:11 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:42727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3GM-0004TD-1U
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:11 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so8181143oti.9
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ztH2KdOZugDOiuPkZQawXgA4F56Gwh34Y3mDIuElS7Y=;
 b=k/ox2S1M/Ib8Keo8gFKZVVAxPG0DOokverOMlR4uf+xFdItR/ln1QeR1QKAiHQfMkq
 aEm1lyanUkxj0tSBn2yDG0VFmqV+CRjeA6a7p37g3Ledt48kwt6pzE3PgjXnkNQob2uW
 DB3zp1W3hIEUN+zV1Z25vD09cP+4D/Cpis5QUPTkbqtH1OIeFk/kGHOTu4pnURLu7xhU
 lDiatEZlUXu89iEDSZzOF/Pf0fyK/eEld8Bl8YzHf0xk57GII8Cf2w57pBtxczDxkhbP
 56fGoRCja8hNPGN9+p5JkvbVeETCZHnPWfMpfgIYA+ZMavhQJWAcS9DpMouu2+lfm5Up
 c2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ztH2KdOZugDOiuPkZQawXgA4F56Gwh34Y3mDIuElS7Y=;
 b=CJfPjPfWMWuJSvK+u8Y/fxidlnilDEtqU0WAE9v1sb54Zz8igNRynq93V/cCiuhE65
 MoBWMngsIQh8sHCReighvWqQAgI7bGLJFc5edAKL8CgtKy8ARMfBzLP7cJXftxKX8h3t
 yi+8a/af45I6In/xUnZWF0Y5cHwsuDa4GnpUy5ZGC8jI4dF5T7MvWM1E6Yz6IfIJYM+M
 DNSHOebDg2xmYSJ4q7dFv9MdFXjTZi3D/Plge6TSDiW0t4iMEz3SArRwNb1t+tK1Zsr+
 DNqrJmeH0Vo+2v2rr5yDs3Y3+1agyXfxMO+tJh13Y753nUsovJEraCsSM9N/xgHSyeLs
 35Jg==
X-Gm-Message-State: ACgBeo3dJ0R5k2VJMvzrph6MxVIMjMOCbfvN1no3kGNlbdcw9IgNrM+h
 1FD6NEZCBHQX5UIzjbZ1BHZzfOTaI2jLMg==
X-Google-Smtp-Source: AA6agR5V9GoITawW1PJBmFeyfKc9ymSCLbIO8RBBz5Xs6LZ4Xvy4xoUW3j9Udb56NgpU4HBaCYluMg==
X-Received: by 2002:a9d:7d15:0:b0:636:de31:4cb4 with SMTP id
 v21-20020a9d7d15000000b00636de314cb4mr7960300otn.261.1660682048582; 
 Tue, 16 Aug 2022 13:34:08 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 01/33] linux-user/arm: Mark the commpage executable
Date: Tue, 16 Aug 2022 15:33:28 -0500
Message-Id: <20220816203400.161187-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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

We're about to start validating PAGE_EXEC, which means
that we've got to mark the commpage executable.  We had
been placing the commpage outside of reserved_va, which
was incorrect and lead to an abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/target_cpu.h | 4 ++--
 linux-user/elfload.c        | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux-user/arm/target_cpu.h b/linux-user/arm/target_cpu.h
index 709d19bc9e..89ba274cfc 100644
--- a/linux-user/arm/target_cpu.h
+++ b/linux-user/arm/target_cpu.h
@@ -34,9 +34,9 @@ static inline unsigned long arm_max_reserved_va(CPUState *cs)
     } else {
         /*
          * We need to be able to map the commpage.
-         * See validate_guest_space in linux-user/elfload.c.
+         * See init_guest_commpage in linux-user/elfload.c.
          */
-        return 0xffff0000ul;
+        return 0xfffffffful;
     }
 }
 #define MAX_RESERVED_VA  arm_max_reserved_va
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ce902dbd56..3e3dc02499 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -398,7 +398,8 @@ enum {
 
 static bool init_guest_commpage(void)
 {
-    void *want = g2h_untagged(HI_COMMPAGE & -qemu_host_page_size);
+    abi_ptr commpage = HI_COMMPAGE & -qemu_host_page_size;
+    void *want = g2h_untagged(commpage);
     void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
 
@@ -417,6 +418,9 @@ static bool init_guest_commpage(void)
         perror("Protecting guest commpage");
         exit(EXIT_FAILURE);
     }
+
+    page_set_flags(commpage, commpage + qemu_host_page_size,
+                   PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
 
-- 
2.34.1


