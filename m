Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D63311673
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:15:44 +0100 (CET)
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AKD-0007rN-UP
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2k-0002Mw-Ua
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:40 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2i-0003Si-M7
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:38 -0500
Received: by mail-pf1-x42d.google.com with SMTP id f63so5279713pfa.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJmFss8croBP2fe7sUR8rqNmFHSeMIecdaY2so4F4z0=;
 b=eRluxCym/LTibO4o6UQwsQrv+gNWVamQ0oAUBHzghfMBvAkPllOdG+41lNNDc/Heby
 vs/Pbz56SliKQG0LSKZRRaNxSkplTf4LlxNKlI3M2wSNo70cRL3thfTsMuBYNJJ3n4G+
 wlCtQCetIBPoA1NR7VIn65svK+gqoAl50alnema9MbLQSqleZWk1FygrDEWXgAK3Jvhh
 Lt6RzZhlYmII8gkUpRNpmeytvT3AJ5zJHF0JhKC3nNXUAnabKLkffNIUtfDEu1zmHUie
 g7Rt5+i4rLwM+2ltJKY1e1Sk+P/osUDnugelro4Uoqe+gekD551DUqUHEXQa1Jo9WLJX
 A5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJmFss8croBP2fe7sUR8rqNmFHSeMIecdaY2so4F4z0=;
 b=eDSsOombzdf0Yk6q34qzi7IMof9aHRHe9pcTd5JSoTvID8NJTj29qdx9kc2h0HB5CY
 BccRGYdSdI+8r2j+2Ms2sN3rsRvy3Z5QJaY5WgltvzSk76kR2567HzPx4RzwrHvRX6OD
 qTM2j7Lj9V6OZCon/6BhJQHNgAvIMa7iK704xPDbRbrGJI+hGJ8ZyDChxbbl+eMWkYc+
 j/4Tv4nGNyXDROH76vyS3VN4nF0es2PnKM7TwCParFau82arSyAEjUk1qu5Y5KSfOvoO
 Ncgs6Vif2GJ1oD8vPaSA/kpoDITaAWL03iycXd9WHzM1Dv7rMVc2E6ak7VrNTmZVJeTz
 Trkw==
X-Gm-Message-State: AOAM531cfEj1TsXmWm84ZTDVrE/VqX/92wtpmwKcQpXwCAOUyrWT+n6k
 ko8/S6XLzYMsqs6ZBFwExA/iBdsBg3ESalkQ
X-Google-Smtp-Source: ABdhPJy7cUGyoNiZOViPBmrDzVnUJEhbckaVKopFmtSSh7QJU50EYzJZyEIxe54H86akMAdw3IIHRQ==
X-Received: by 2002:aa7:9596:0:b029:1be:28cc:cfe8 with SMTP id
 z22-20020aa795960000b02901be28cccfe8mr6460463pfj.49.1612565854476; 
 Fri, 05 Feb 2021 14:57:34 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/46] tcg/tci: Use g_assert_not_reached
Date: Fri,  5 Feb 2021 12:56:26 -1000
Message-Id: <20210205225650.1330794-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Three TODO instances are never happen cases.
Other uses of tcg_abort are also indicating unreachable cases.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index eb70672efb..36d594672f 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -362,7 +362,7 @@ static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
         result = (u0 > u1);
         break;
     default:
-        TODO();
+        g_assert_not_reached();
     }
     return result;
 }
@@ -404,7 +404,7 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
         result = (u0 > u1);
         break;
     default:
-        TODO();
+        g_assert_not_reached();
     }
     return result;
 }
@@ -1114,7 +1114,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 tmp32 = qemu_ld_beul;
                 break;
             default:
-                tcg_abort();
+                g_assert_not_reached();
             }
             tci_write_reg(regs, t0, tmp32);
             break;
@@ -1163,7 +1163,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 tmp64 = qemu_ld_beq;
                 break;
             default:
-                tcg_abort();
+                g_assert_not_reached();
             }
             tci_write_reg(regs, t0, tmp64);
             if (TCG_TARGET_REG_BITS == 32) {
@@ -1191,7 +1191,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 qemu_st_bel(t0);
                 break;
             default:
-                tcg_abort();
+                g_assert_not_reached();
             }
             break;
         case INDEX_op_qemu_st_i64:
@@ -1221,7 +1221,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 qemu_st_beq(tmp64);
                 break;
             default:
-                tcg_abort();
+                g_assert_not_reached();
             }
             break;
         case INDEX_op_mb:
@@ -1229,8 +1229,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             smp_mb();
             break;
         default:
-            TODO();
-            break;
+            g_assert_not_reached();
         }
         tci_assert(tb_ptr == old_code_ptr + op_size);
     }
-- 
2.25.1


