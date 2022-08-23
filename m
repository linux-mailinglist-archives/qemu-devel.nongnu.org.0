Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4D59EEA3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:08:35 +0200 (CEST)
Received: from localhost ([::1]:54022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQc4Y-0005NH-MD
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1u-0008F2-9Y
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:50 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1r-0001Pe-Pk
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id e19so14035479pju.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cnDX4PL0OXe9dOqXgYaSV2oqzwR9gOMv9I1pf97HvaI=;
 b=P3dP9H9X4MUpMlciZ7pJLXK2q5GyptJMTUBs0K0LZCpaL9kIcQEoaRVkS3x7MAasxT
 ooqxIl5VGFItwx0BTKFXPSDd5mkh/uo2q24y5zUI2cvjIJ/K4OZht5oUT+YduHEDiXCz
 h5Rt7GeTZTrJ+jc2VQg+nSWjPXXigoOJ1QXTUiF71udI+epvD8ow8WFrhe1Y9V3Wu3f4
 7PcaelA7B+b6ZsBmbMH/iBuHi1Y1zhf3Qf1rJGtDvBr3l+az5bPhhwriOEsVYTA97IeO
 TJ9K8gKaOnRPlwsvPvmcQiaQ1ZU5ZCt3q0NUJrSEDDMSfVGkJ0XVQRS3sVn/IQhfzJPd
 vl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cnDX4PL0OXe9dOqXgYaSV2oqzwR9gOMv9I1pf97HvaI=;
 b=ETd86+6JNGkFT6LzsOjuAJGO7bFMMd4mUnGJ4fucUyfIkPUXMlPsra01m05clpw6hp
 GkVN9DqWhSOx7w/T9tq3inVTVtM/CGTJYjiVidndUkKvqaEav2RWOPzcgis0aUqvnun2
 vyBWg3Ob7N54Za7mpJ3kiinLHAkpZ+6wq47xPNoKAt4jfqblZsnpjobzbcN+dAT5V807
 AU+I2qsnkEhcleMkDDOfRKXFuxtwvh3Vo9sPZcIxq3gDFhEnOBR2R+6w2EAht5Z6KLAJ
 TAdRBA1KWTkcbmatI32NznftK/P0mnuthtfgfQpQYb9xKHjq42uti+Pl/ZF11mvKE4mX
 lsCw==
X-Gm-Message-State: ACgBeo3N3PXYhPz0wTMDeXS9Gsg/m4XoF2mK3hhDo6qeXofuYsySxDlJ
 8TzH0Papy1ZNHYZXyPAUxzm1RPeoNqax4w==
X-Google-Smtp-Source: AA6agR73jzZiO5Z4Gaia8xipM30UgPqxv7DgZTnZr2ueSdXWnkoaYe3veaxqDgZxCJ+14Uthd17HEA==
X-Received: by 2002:a17:902:e945:b0:16b:f802:1660 with SMTP id
 b5-20020a170902e94500b0016bf8021660mr26424870pll.7.1661292346479; 
 Tue, 23 Aug 2022 15:05:46 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	laurent@vivier.eu,
	alex.bennee@linaro.org
Subject: [PATCH v7 01/20] linux-user/arm: Mark the commpage executable
Date: Tue, 23 Aug 2022 15:05:23 -0700
Message-Id: <20220823220542.1993395-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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


