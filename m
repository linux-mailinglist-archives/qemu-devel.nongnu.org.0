Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD995A8F19
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:04:00 +0200 (CEST)
Received: from localhost ([::1]:43390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeF5-0005wm-54
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3p-0005oY-H8
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:22 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3n-0003G6-SS
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:21 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c7so14347289wrp.11
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cnDX4PL0OXe9dOqXgYaSV2oqzwR9gOMv9I1pf97HvaI=;
 b=zL50RlddbX47dHMlS47xTJE7hK7f2JFYlGdgThDGU0uvA6HjRK/yuYHd4vq5Tk0drv
 53Nmd5h2AZNj35fTbXRfr9pC4y+xwOE2kPBCotGWMIGLqsnLkG8ebztXIYXDjlbFM9qk
 tYIjm4cPYhZDB9gMmzCvcWpXJqXASrHtBsZWU2flscxZJNB9KS/3x3+67raebdtDW/yX
 uK/H3YhXPvL3rgkIIen/Oe8bSekaU70D/01hBNqPZjmof6BaGolHzdLFQVdEHuBw9FcE
 Py6S0RrSAQUlv6eMkaH4IX1k+88Kk/Fb2kUU7u52kGQE/82zIe97YwFSviYK8LGf9LmU
 J0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cnDX4PL0OXe9dOqXgYaSV2oqzwR9gOMv9I1pf97HvaI=;
 b=Sc7+c1fqI1jGxfU+lORbqrpE5LYeSYW9VA9DFTRceWVxXlzmzqhItYHiy59dArx+Tg
 BCuWlrRs0hu5BKtsvpjpkngvq1ZXX9vyNPdRWjl4OSxIN66t+qHLAo24cev1I1FKNdTM
 hxFMvqvuWQ1G3sPK5JpZgqRcXU8etMvL1gakzGnnxV+WEcdARiwbFlqG4x+88F85k+xm
 LHaRThEqJBepBfWgAzm3BS5iVRAT2GBrYZS3OjOLr5Y1wDffwTKAkXGDeeRvWbKmhEFv
 EkMoDLu+hr2LQVL4uLjPFYp5FhOBwpOblrvQiBR9DLLV9o/Mh/ZEOOw4Zl4YXlvmpYQH
 I0AA==
X-Gm-Message-State: ACgBeo1eaEJN0U3CqahGuK82lFBtxVOzhpCfbdw2YwBeyeF58MqQFlb1
 38/scA0lm91KTbrSUmM8Sxo/+DGJWCm89zjz
X-Google-Smtp-Source: AA6agR6SMoWzz+itLwsLPbSqdBAnhet1LpqVKbk3v7eGZgWnqEWJt1eOfpXXhFCeoBNPfBYRt3YF/Q==
X-Received: by 2002:adf:e411:0:b0:226:d3f9:4a03 with SMTP id
 g17-20020adfe411000000b00226d3f94a03mr13322790wrm.673.1662015137710; 
 Wed, 31 Aug 2022 23:52:17 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 01/20] linux-user/arm: Mark the commpage executable
Date: Thu,  1 Sep 2022 07:51:47 +0100
Message-Id: <20220901065210.117081-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
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


