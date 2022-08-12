Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A2591551
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:12:06 +0200 (CEST)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZ8e-0000Nv-SJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4u-0003QE-RO
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:13 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4t-0006Va-8W
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:12 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so1618336pjl.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ztH2KdOZugDOiuPkZQawXgA4F56Gwh34Y3mDIuElS7Y=;
 b=XXDwF3AVpMkv2acj3kyGy1RnPg84VCWAWGHvrqC6qvu9DnJISxEvpc7OKYin+mayR4
 5Xh55GAKHxNLFCJj1a4Rq4Kepyi9N4ttsz68TX38P2GP1Hq1A3NXbnWzsN236Uw8xkMm
 e1sDS1RFcCNlrDHFL/gwZjEc2E81eWz7XV5JbiG7yy3lhrwXKcqe+Th/lN8jCfjFFtoK
 mV+Jvrttj3BvjFC8AHLuq81dSttBHw2WJ14O2PGSMN3Hu4FC/Jjy2Xcaka0x04EfOmWf
 1us2x7yLxkLv0yEyrwhEnfCauqdW6tJFol1XgMF61DRxWL0FoEPSaWO4kXRZ6lxzouNk
 Ir2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ztH2KdOZugDOiuPkZQawXgA4F56Gwh34Y3mDIuElS7Y=;
 b=CtmfhCT+DKFD5KkOMLPRfsZZ5d+ZA2BOqgDdhcY/1bukGqT8UsJRFPBIDTP3MfXuSP
 7fFm4IqhQnL4mrHLGShE3yQPFDYKpBiR3RDIlvhz7pAHXvnFHesJF8THHkI3gK5zJqdt
 PmtagARqZrNisUoQbzU4TIGEvKqoF3eREMzR9KxAlfM5ncyofEoolMTQL3vzKpNXv1t2
 0qe3I/jBOsi0jCI+VW1jpsvOoJ9gz7xu64VlhOvTLvbElGxfbKgyMth/nDko6iK/n8v+
 T2VbEPuv0VIWD/z2wQpJX3X66Df7Sypf9vD3uUBqiXr/7cX70ByOCNJwX48Mdqpd0xtu
 984w==
X-Gm-Message-State: ACgBeo16dnDjuE6s6DFZOU9YVh6SqjCagmZVI9g+NsGGr9NYCZYzgY+w
 ykwd0GWvX8htNan45AVzioyy/Tukx8KfTg==
X-Google-Smtp-Source: AA6agR7Spp+LdW1Jnks4sDtGkcE/6MxIvfz13niZN6Qop5uL3UdKkzf8k9KknaCGqSsQJkPMM42vAw==
X-Received: by 2002:a17:902:c1c4:b0:171:38ab:e761 with SMTP id
 c4-20020a170902c1c400b0017138abe761mr5345086plc.65.1660327689639; 
 Fri, 12 Aug 2022 11:08:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 01/21] linux-user/arm: Mark the commpage executable
Date: Fri, 12 Aug 2022 11:07:46 -0700
Message-Id: <20220812180806.2128593-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


