Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4896A92FC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:48:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zi-00007i-TC; Fri, 03 Mar 2023 03:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zW-0008Nj-Cg
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:14 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zT-0007m8-W3
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:13 -0500
Received: by mail-pj1-x102e.google.com with SMTP id kb15so1814798pjb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832931;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6fyKisPdjjsilTntlaBwsWAkLGaTDh+b2bnlD1SK5I=;
 b=2c/B/xXbeDjVkEFRtJUhMazvt2HWeMfzrAuYb9BGrjAwNeQQRTPQ6yhf9UuhiaZgm1
 ywQ4OsQx/hBgQsM0ij1hWaYFzlNxEvKsnBUVaxsD58ljAV6ZyQscuUc9UN3RIamHLK2i
 v5XfiHwLiOqUvJAk2kaBWPlPxHSpW685G/WidwJsh4W4sXexL3Sh7a8O0J0EprFNa4zJ
 eobGitIrhZspi94kL0RvUAnMqilAyq3mPbZcmboFhTq5522ynB0YCSAjMrVAnHoRhAVK
 jYvWGK6kiNI+KdDU42IEsNo5Ey39TuuyOwPb54GVqPRW0d0t4pRbm8E0Xa/ShRRz//R6
 54Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832931;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6fyKisPdjjsilTntlaBwsWAkLGaTDh+b2bnlD1SK5I=;
 b=INjyPJSm4XiTxYfroXlTWCvgWWMToEEJSgwweup8NT5TBWwGQZPwRwVEJYqZaKHzH5
 9yDwq5ECITIpIhgnZpcw+H0NGCSWlMSKIhomUM1Va8b8AS8NfPldcDIZcD/Y7R6fA5h2
 yqfN8sdOZ9J+yEJgK2KFEye+orSzSJAGSWsVwufWKIyZV6naWQjveFF62cUqDdVwPEi4
 XHSVWxEYgWHQFnhp5Dz3SQZjVgH4LdyQK+moeX3k266gmBTtSRVWBW/bH9RcF4rzKYnM
 lQnxJiBeZ481vNXzf2T20EmTyyytmaclKd2VN1FUO8GELpy31/hzGO1mWwaFNalwHdOp
 idVQ==
X-Gm-Message-State: AO0yUKV1rPenfX0BAyTatMxWNEOLK/MPdLpoCIcEHrUUEbjgTl5t6b8N
 DCF6W3dKAIo8tgJC6224p4q9BA==
X-Google-Smtp-Source: AK7set+Tk4Fz9yLdiHMWciN4CxZbTktjDwfcyN1W1+inW8EeuBaJJO623cTOk+eouH5nwLroOkg80w==
X-Received: by 2002:a05:6a20:394b:b0:b8:c6ec:a269 with SMTP id
 r11-20020a056a20394b00b000b8c6eca269mr1696566pzg.16.1677832931244; 
 Fri, 03 Mar 2023 00:42:11 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 s26-20020a63215a000000b005034a57b963sm957276pgm.58.2023.03.03.00.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:10 -0800 (PST)
Subject: [PULL 40/59] target/riscv: Allow debugger to access sstc CSRs
Date: Fri,  3 Mar 2023 00:37:21 -0800
Message-Id: <20230303083740.12817-41-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bmeng@tinylab.org>

At present with a debugger attached sstc CSRs can only be accssed
when CPU is in M-mode, or configured correctly.

Fix it by adjusting their predicate() routine logic so that the
static config check comes before the run-time check, as well as
adding a debugger check.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230228104035.1879882-17-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a0e70f5ba0..020c3f524f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -952,6 +952,19 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
+        hmode_check = true;
+    }
+
+    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv == PRV_M) {
         return RISCV_EXCP_NONE;
     }
@@ -972,11 +985,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         }
     }
 
-    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
-        hmode_check = true;
-    }
-
-    return hmode_check ? hmode(env, csrno) : smode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 static RISCVException sstc_32(CPURISCVState *env, int csrno)
-- 
2.39.2


