Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B7C36F3B5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:34:10 +0200 (CEST)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI2j-0003p7-8j
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlc-0003Te-42
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:28 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlD-0007dw-Ju
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:27 -0400
Received: by mail-pg1-x530.google.com with SMTP id z16so7445994pga.1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cIQmdrbpw+tsZnl9LQMLZ+zBhw2wNBDZzMctIGQTbTU=;
 b=YMJFpGfp1Jv2yHm/4LYJlUZP5AGQIBVe2q8w5I540QTTiTk6opSsOMql79NMvGxWNg
 XWjwgaJsGam73PR6QKrfCxxYL3cAXS3z08dLZuiO35WnR7YxGjlqSE7zDH7quLq2odr2
 8hVoi14Aw/qdHA7wloWKt6K3JI6BhIJ0O1e2/KLyqp8v1Vf/ZA89HMMg/Q/fBzmFdO96
 36a/XKc93SNxZ/L8DtjL1ZtIdzGa4sSnmEZ9Z6pSVM/aLJEn6ea4+m2VgaN+NXgWab2Z
 1kJOXoF6EBC6NFLs22hmrYiUcXnOW/LRerj9BwPrhaqmNN0Bo3/sgOpBaYiVuXzrO4nV
 ZdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIQmdrbpw+tsZnl9LQMLZ+zBhw2wNBDZzMctIGQTbTU=;
 b=b+pwnfwCusPR9eIXQvXP8fIiLE0iddtNrJuyWM12IT9Zfmgy0G8qb0LUoQvUBqb0R5
 mCN2yp5qfrl4MdCm4ZBp0N19odcbvqqznovF6/qqFqHQYvYGaKXk7zFejn5IM2J2kKVc
 4lBr/56sfSOSKvv3AmaMFDulq15RHSJo2ZBlAkWG4bLVMWh/eFol0I8jrWt+V/zqCSDe
 GqFHIZkTGvrc7Nf8VjvSnjHd1YplfZlKJRN9QjRHlOR53Z0lfqKEgyIdf/eFEYc0y7Ld
 Jttc2GP/WUe6aPkNNGq5RZ+JkuaYlid/+Q/YRDnY49ILcb1iYmmO1lG/qRDcKbIBPc4/
 N0LA==
X-Gm-Message-State: AOAM530/3qwJY9m/ZZJdrxhj318kYw4776tIV65uN+mO8fG+OvX+Igwa
 rfJY/47pgfwm2FP07Pww2K280aV0iBFmnA==
X-Google-Smtp-Source: ABdhPJxXmnzP7lS2yVChnr1B7vn5UTx6IKb+pwmlbhcjP5o7INfGxn7EQU5AryFHRgPLVKa1NwaicQ==
X-Received: by 2002:a65:4889:: with SMTP id n9mr2305018pgs.91.1619745362261;
 Thu, 29 Apr 2021 18:16:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:16:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/30] target/ppc: Implement PNOP
Date: Thu, 29 Apr 2021 18:15:39 -0700
Message-Id: <20210430011543.1017113-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn32.decode                   |  2 ++
 target/ppc/insn64.decode                   | 11 +++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc |  5 +++++
 3 files changed, 18 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 52d9b355d4..2ed25c7e67 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -17,6 +17,8 @@
 # License along with this library; if not, see <http://www.gnu.org/licenses/>.
 #
 
+&empty
+
 &D              rt ra si
 @D              ...... rt:5 ra:5 si:s16                 &D
 
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index f4272df724..5a82ce375e 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -20,6 +20,8 @@
 # Many all of these instruction names would be prefixed by "P",
 # but we share code with the non-prefixed instruction.
 
+&empty          !extern
+
 # Format MLS:D and 8LS:D
 &PLS_D          rt ra si:int64_t r:bool  !extern
 %pls_si         32:s18 0:16
@@ -31,3 +33,12 @@
 
 ADDI            000001 10 0--.-- ..................     \
                 001110 ..... ..... ................     @PLS_D
+
+### Prefixed No-operation Instruction
+
+# TODO: diagnose the set of patterns that are illegal:
+# branches, rfebb, sync other than isync, or a service processor attention.
+# The Engineering Note allows us to either diagnose these as illegal,
+# or treat them all as no-op.
+NOP             000001 11 0000-- 000000000000000000     \
+                --------------------------------
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 7af1b3bcf5..96b8c38f60 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -55,3 +55,8 @@ static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
     }
     return true;
 }
+
+static bool trans_NOP(DisasContext *ctx, arg_NOP *a)
+{
+    return true;
+}
-- 
2.25.1


