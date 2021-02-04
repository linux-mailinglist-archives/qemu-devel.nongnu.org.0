Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E3E30EA04
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:15:08 +0100 (CET)
Received: from localhost ([::1]:55114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UAl-0005kO-34
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tia-00051e-4l
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:01 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiW-0003pe-43
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:59 -0500
Received: by mail-pj1-x1033.google.com with SMTP id my11so4243776pjb.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJmFss8croBP2fe7sUR8rqNmFHSeMIecdaY2so4F4z0=;
 b=p21AHYlEF2ucBz1JosZKGCJ6+4A/Xf83NilSNFh2f0bXJj/DfNQzzJLTYRTW0j1WX9
 riI9pbCXpS4geJoBhP+4PAzBxE7EZTrnp8TXkCR7VodDbatXOnEeJZid2b89QezcNYnf
 7B3VV3H0L1apGQEyQIAmFWRywXs41TFdUKCG9ULJU4TCTaR16iUz3h1NNZtrWDH5KNAT
 AWG0tFdNYVYtkbsrgd8xwhZ3iPlj3Inz4A3aJuUVaIVDQdje/+N5tpDTn5CZ9AVSwXsN
 psbfxoSaHNoVG+KpQCBtr0C1bvyaUDEX2kvkKpiRY22Y+IrnisQbdv7GrLQosFNjaG+f
 TvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJmFss8croBP2fe7sUR8rqNmFHSeMIecdaY2so4F4z0=;
 b=NFC4yzaP1uHR07487mTaG8fEGkdhX4mtDrtEgQ3wDvtl5vrn8FApO/WhUPAAMjwAd/
 1Aand+dg3e8zXHjADqYa8oEQl0BscyDQtX1Y1EPpTgTr6ez1IDhHLRxTUweH6Th4tmBQ
 H6Qy7O7I87WfIcsFkzcpcVRFIxV2eqmj22zTvUqFzKivJAFBtpuOySn3C3ves8Th0ncx
 6CUB5n5di5ZaGoL/byK4jfz5iHMQIzwYmgFVHJfIRAZbFEqraXM0jgnE18J3HyONKQgQ
 20OcicDwfBniCgAARxoHj+WkbFCh2PlQxDPzqMWCafvb/KhQAlnPwGMLlYBcJPcbjnDV
 dSOQ==
X-Gm-Message-State: AOAM531QItVBOuL96Qz8M9hlemjp2vEY+ZdrmnkTrG13Gh8a23tzwVhI
 ylbrEC0wgl4alXOQ1Yzenu83ckFcxyZbYar5
X-Google-Smtp-Source: ABdhPJwhV7LQbhENYFyXtxdyilAnzVbT7qtWM8A3aVCRW59Yvfh5j9Yl9b8FnefwLBVXnlOEVI/LIA==
X-Received: by 2002:a17:902:9a4a:b029:dc:435c:70ad with SMTP id
 x10-20020a1709029a4ab02900dc435c70admr5676762plv.77.1612403154013; 
 Wed, 03 Feb 2021 17:45:54 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/93] tcg/tci: Use g_assert_not_reached
Date: Wed,  3 Feb 2021 15:43:58 -1000
Message-Id: <20210204014509.882821-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


