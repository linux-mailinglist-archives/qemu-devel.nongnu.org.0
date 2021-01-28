Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A413071F1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:51:49 +0100 (CET)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l531o-00073j-6Z
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b4-0006Ld-FT
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:11 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b2-0005nJ-8C
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:10 -0500
Received: by mail-pg1-x534.google.com with SMTP id c132so3808170pga.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J7kDIVNOxEBDaoT7WAnXMrsfZZNCOoe99UtUD6AohMg=;
 b=n3Uy2F0iX0ysJwox3KO+3boL7ptiP7v+yP9RhUnPyUW5GCECmze/AIsRo6sqFsBA4S
 pM7rlMFBPftfkWtlV1Wbei4QHIzr/ZopQO0stHHXEA5bmlIRNLma9UjrAtAinJ2nnmvl
 LVyQ+xnZad46mKvla5XQqTIu3J9emIYKVoBtaWilPDFsyUWHBCvHP7D92PH+/xeg7Rtg
 jdESjQOjczskv0rswioZAeO6Dy5fzwpf0Qs1N4WJ978uCSPQ/zxSuAJz/vFxjQ8YS1Gw
 4pJmjuInzOMlQdQSuwBH0W75KX0HucGwSrU/WGEbIzuZ2PTOGj5zTd/hkQ9cz0NV7hCt
 rpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J7kDIVNOxEBDaoT7WAnXMrsfZZNCOoe99UtUD6AohMg=;
 b=OBT7BMT5kgiZmx3rpAKEq342ndZ+nlnjNIjSMbVXKBYWa2hHwkTuaq7siroX+bndKd
 7zs2bbf5vjpgUCksbTUQiwM8lN84poDw+O+FsAdgYDYu2oanXXOpHYCJcJCwvT5hya7s
 eiHuGjp2qUOyTT/r6ZIxBtDok2oE2SdIliOp5GZUTzFzg/6C6akXOPQ6+ZzxNN8PWJjY
 D+RPr8IVOw+pIyMkOxZnJwwAoXDsxs6/raagqJicEQcT57nTya1GJMt/FhZnU8UNeXPp
 GLu8oF7DN2rJ+MqZ+Kyj8Awhf4Tpf+/FVTj6XzsIf7nYQgon0VDk994QcKVF3yBBs09L
 xTLw==
X-Gm-Message-State: AOAM530sizHit2bu2wYKoA0s+hjq0nQeN9M0yW6DHrCsPfxC2J+cBYGD
 sKyNFCmrxUlI3tfx87SgB7khivEXe6g9YiCw
X-Google-Smtp-Source: ABdhPJzflitRPzsoZMJnQ2GFEZXiBmMFjMGDE+E54gQ9Baa/uerjx0jgtSp6DL1frKWb29sCgcZ8ew==
X-Received: by 2002:a62:1a43:0:b029:1b9:6acc:f485 with SMTP id
 a64-20020a621a430000b02901b96accf485mr15125737pfa.42.1611822247040; 
 Thu, 28 Jan 2021 00:24:07 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:24:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/23] tcg/tci: Use g_assert_not_reached
Date: Wed, 27 Jan 2021 22:23:28 -1000
Message-Id: <20210128082331.196801-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Three TODO instances are never happen cases.
Other uses of tcg_abort are also indicating unreachable cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 66b90f8489..2ce67a8fd3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -360,7 +360,7 @@ static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
         result = (u0 > u1);
         break;
     default:
-        TODO();
+        g_assert_not_reached();
     }
     return result;
 }
@@ -402,7 +402,7 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
         result = (u0 > u1);
         break;
     default:
-        TODO();
+        g_assert_not_reached();
     }
     return result;
 }
@@ -1109,7 +1109,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 tmp32 = qemu_ld_beul;
                 break;
             default:
-                tcg_abort();
+                g_assert_not_reached();
             }
             tci_write_reg(regs, t0, tmp32);
             break;
@@ -1158,7 +1158,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 tmp64 = qemu_ld_beq;
                 break;
             default:
-                tcg_abort();
+                g_assert_not_reached();
             }
             tci_write_reg(regs, t0, tmp64);
             if (TCG_TARGET_REG_BITS == 32) {
@@ -1186,7 +1186,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 qemu_st_bel(t0);
                 break;
             default:
-                tcg_abort();
+                g_assert_not_reached();
             }
             break;
         case INDEX_op_qemu_st_i64:
@@ -1216,7 +1216,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 qemu_st_beq(tmp64);
                 break;
             default:
-                tcg_abort();
+                g_assert_not_reached();
             }
             break;
         case INDEX_op_mb:
@@ -1224,8 +1224,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


