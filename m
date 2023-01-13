Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECDF66A0C2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:31:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMH1-000292-Qh; Fri, 13 Jan 2023 10:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGz-00027J-H9
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:17 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGx-0006CN-Vs
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bk16so21433633wrb.11
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6DJtZKnE0X5ILJFWUs2yDx+gOQeyUHjuQj0hCzkqe8=;
 b=r44MOmYlEhgE5V3qKLlIt5LuVyDFdiCqZl+MNi801RCZjUpbPL+1GLr/q2lYRPelT+
 +0bXxJVsrzsxC1quEslxeb25+1y0KgAFdGST7/LJqwcPu62cMKXZoKtoHOVd6XSCUvau
 GyK9WyGZb0intAdIteZXB/eMgaFGDu4GU8TMNrBQtJSxP+VIrzXQ2NYZ200wbKGxB/oY
 asPkL6gULCGtHDXgXIiW9F/QX8YXndfW7X0E9aR4AXb8pwbc1+YImptyRoaL0hqufNdm
 GdwJ3ucddOucSf726Y07ZlDMty6mhX6dBB13ttxVI/jM/tyJ+FaxwphOLjO9EoV5MoZ0
 4tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6DJtZKnE0X5ILJFWUs2yDx+gOQeyUHjuQj0hCzkqe8=;
 b=qkqUxQzZIcQ2NtjtjkvZwBl90Ut5+vqtXlic9lTgprLGpeTWLrtBxgIMfMdEyY4XWN
 FCmWgzYpquBtSBRYE/VcpR8HwvzEHlnTqy4wq6op+UZ7oA9Lh+SLrEJmj1S+N1dH7rVc
 u5vmZarbKLxOsxS91Z/dbhLmp6914Cf2GsPTamH1fD4DJpS94quHsByC//fx5dFaUQnI
 NOz5xDPL+NdHDZBQ1vyuDBoDWrEzG3rtCbOSXmyY0Ktv+XX5fda6fsAF6PfAJCQFpxhU
 4ZZyA3WGrpKx1evKH0FvbJbzOH84y0xYLp8xBzZ/cchw1WceSLfGDelYHsOjuvlDBybi
 /v5w==
X-Gm-Message-State: AFqh2kp70LiFLkLLoTEkBt/3d5l5zJH56CSygfn0//CFoKoZZUEaqRqs
 tjowCmqguW4TBe4nO6DNonKy+ag0j1qwcNsJ
X-Google-Smtp-Source: AMrXdXsl0hMWi4W+dLMaRK8xq1qSTwIJp02G/p2R6i+ZAYfAQGDUNHt1FxCN1r8r88G/aljTBerR1Q==
X-Received: by 2002:a05:6000:60c:b0:242:40de:332 with SMTP id
 bn12-20020a056000060c00b0024240de0332mr58479032wrb.40.1673624835088; 
 Fri, 13 Jan 2023 07:47:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adff68e000000b002365730eae8sm19202385wrp.55.2023.01.13.07.47.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 21/46] hw/mips/malta: Use bootloader generator API for nanoMIPS
 CPUs (4/5)
Date: Fri, 13 Jan 2023 16:45:07 +0100
Message-Id: <20230113154532.49979-22-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Part 4/5: Convert GT64120 ISD base address setup

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221211204533.85359-10-philmd@linaro.org>
---
 hw/mips/malta.c | 40 +++++++---------------------------------
 1 file changed, 7 insertions(+), 33 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index f0ed32167f..e618513e35 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -689,46 +689,20 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     stw_p(p++, 0x80e7); stw_p(p++, NM_LO(loaderparams.ram_low_size));
                                 /* ori a3,a3,%lo(loaderparams.ram_low_size) */
 
-    /*
-     * Load BAR registers as done by YAMON:
-     */
-    stw_p(p++, 0xe040); stw_p(p++, 0x0681);
-                                /* lui t1, %hi(0xb4000000)      */
-
 #if TARGET_BIG_ENDIAN
 #define cpu_to_gt32 cpu_to_le32
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0be1);
-                                /* lui t0, %hi(0xdf000000)      */
-
-    /* 0x68 corresponds to GT_ISD (from hw/mips/gt64xxx_pci.c)  */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
-                                /* sw t0, 0x68(t1)              */
-
-    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
-                                /* lui t1, %hi(0xbbe00000)      */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0801);
-                                /* lui t0, %hi(0xc0000000)      */
 #else
 #define cpu_to_gt32 cpu_to_be32
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x00df);
-                                /* addiu[32] t0, $0, 0xdf       */
-
-    /* 0x68 corresponds to GT_ISD                               */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
-                                /* sw t0, 0x68(t1)              */
-
-    /* Use kseg2 remapped address 0x1be00000                    */
-    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
-                                /* lui t1, %hi(0xbbe00000)      */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x00c0);
-                                /* addiu[32] t0, $0, 0xc0       */
 #endif
     v = p;
 
+    /* setup MEM-to-PCI0 mapping as done by YAMON */
+
+    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
+    bl_gen_write_u32(&v, /* GT_ISD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
+                     cpu_to_gt32(0x1be00000 << 3));
+
     /* setup PCI0 io window to 0x18000000-0x181fffff */
     bl_gen_write_u32(&v, /* GT_PCI0IOLD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
-- 
2.38.1


