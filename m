Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D6698AD1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:00:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTS-0003ZB-DE; Wed, 15 Feb 2023 21:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTQ-0003Yj-3J
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:16 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTO-0005nd-CX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:15 -0500
Received: by mail-pj1-x1032.google.com with SMTP id d2so546469pjd.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afuwZcabde7LyQSxeaM/6PWqvilPqwbhg0UKCcmEKIk=;
 b=AYiAC7SEBkMggu2by3pRAPL3RmibP0d/naZm0Lc+Rgh2sAaSpLRbR5+YbWZf5YWr9S
 S3tHp/bbnFJiFr/Hu6KIU/t931dqljsMmdY03QpoWCGs05u6SqA4FrD02c5aGmu+8lOA
 sByM4wcf0wKnJNmc0XGSaTuorLZbqzYVdfTkS7W6jsipTKLMHomm9g+H2B8P8uwabq7H
 psoH5hvMvwcLUYzzYHx0tdeAj/ZlCsMsl7eP5HhbB56P+qMdSdBNvyBgDvf04v6Hu36n
 42NtjUoPZfeddH+6JJJQ1V1mj28CHqZxbskYSe+RkY69PEIVjcqR/GWNkjlyupJtZkBj
 3COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=afuwZcabde7LyQSxeaM/6PWqvilPqwbhg0UKCcmEKIk=;
 b=dqac0tz0DjsskuzcyX78UjRmOScv7uOmJKrpgGQHi1sfbfq//SxdnyVcrxAOfJp1xc
 9lhJqsoRYPqklSqair55UhMK7RqdTfDm0KcShEYio5e1kyw9z8vBTAzJFe9XubQa6CFu
 +ZJjKGTJcL0ZCqxiAyMJafdru4Cf5MHh2TgAvDl0Ysl2VR4ZQDoQD3NaDJw/T+sNDfrS
 sXwCJpysZYjBQev8/koPFgbmb99DYT/kBNik7PZZQvg4QbeB7cLbfhCMdImv0v/dURbD
 JTJg3bR6f0q33K3IWFNtQj1va963biLvRndRhZE4upg23rGNIuyJmmcQ7sEMtuPSDkFd
 nxQg==
X-Gm-Message-State: AO0yUKVcYAxOqXdm5Exyw11q0m+SzNQy+pHaQULjhc7PQbiIY8mRuQbA
 CpzMGHjxhSW41lxy02fSQzyM+SduBB7KiUOEAJo=
X-Google-Smtp-Source: AK7set/y2LUSBAMOA+/uuZU1OvxMRV7htuVWK+P9EG/YGI4op4EqVCQeCXeFpTBOg3n3fYSz1Gu3iw==
X-Received: by 2002:a05:6a20:a1a5:b0:bc:ccea:a969 with SMTP id
 r37-20020a056a20a1a500b000bccceaa969mr3490714pzk.26.1676516293030; 
 Wed, 15 Feb 2023 18:58:13 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 23/30] tcg/i386: Introduce tcg_out_testi
Date: Wed, 15 Feb 2023 16:57:32 -1000
Message-Id: <20230216025739.1211680-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Split out a helper for choosing testb vs testl.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5547f47a26..a75fe91e86 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1729,6 +1729,23 @@ static void tcg_out_nopn(TCGContext *s, int n)
     tcg_out8(s, 0x90);
 }
 
+/* Test register R vs immediate bits I, setting Z flag for EQ/NE. */
+static void __attribute__((unused))
+tcg_out_testi(TCGContext *s, TCGReg r, uint32_t i)
+{
+    /*
+     * This is used for testing alignment, so we can usually use testb.
+     * For i686, we have to use testl for %esi/%edi.
+     */
+    if (i <= 0xff && (TCG_TARGET_REG_BITS == 64 || r < 4)) {
+        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, r);
+        tcg_out8(s, i);
+    } else {
+        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, r);
+        tcg_out32(s, i);
+    }
+}
+
 #if defined(CONFIG_SOFTMMU)
 /*
  * helper signature: helper_ld*_mmu(CPUState *env, target_ulong addr,
@@ -2056,18 +2073,7 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
     unsigned a_mask = (1 << a_bits) - 1;
     TCGLabelQemuLdst *label;
 
-    /*
-     * We are expecting a_bits to max out at 7, so we can usually use testb.
-     * For i686, we have to use testl for %esi/%edi.
-     */
-    if (a_mask <= 0xff && (TCG_TARGET_REG_BITS == 64 || addrlo < 4)) {
-        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, addrlo);
-        tcg_out8(s, a_mask);
-    } else {
-        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, addrlo);
-        tcg_out32(s, a_mask);
-    }
-
+    tcg_out_testi(s, addrlo, a_mask);
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
 
-- 
2.34.1


