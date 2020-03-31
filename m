Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A472E198ABB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 05:58:12 +0200 (CEST)
Received: from localhost ([::1]:60032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ82V-0001Ui-Mt
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 23:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jJ7zU-0004YV-0v
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 23:55:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jJ7zS-00089v-T9
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 23:55:03 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43363)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jJ7zS-00089O-OA
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 23:55:02 -0400
Received: by mail-pf1-x443.google.com with SMTP id f206so9675129pfa.10
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 20:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1qFoEnRP59bn9KPnaesHADAuwvvkoBPpPEfqGhyETA0=;
 b=OlafZaellGbT6BelHaaY7Hnksc3El3TlCFFzxF7iGQz9ebDUUEo1MWlkoNOqChbqyq
 XWIZJvRbaJheVdDhJic9kyq2gH91jdty9V8/HiI9JnGIM6E7LhRet/UwlpV9o+0AsEJK
 YG4xmEykGTgVcbB5qv9A6RIroJv48pswz9QQ/S29NGjrfry9l65xyWAQ4JMFr72wW2fd
 qOQlhKzu8dhCcHLRVxb3swEepr45bkra5/gdtXtg6RXXgccadjsTTWNqTv6Mz3GNaxMg
 /6ngmXnXawcm/er9p52NPtMXmkTC1qWvgi3O2kU71D4XIUXHbmtAmwjBzJauti0VjdWf
 oOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qFoEnRP59bn9KPnaesHADAuwvvkoBPpPEfqGhyETA0=;
 b=UzXkn/ElV3ulEZsSiwo9KgP8iyvqLq9rtplPRWScNfDlEgsL0O1KtwZvp1HWmPYh8n
 Y/9sJtyWPpEbshHFkAR8Vb64EX7A15LKGjhR8UrsmerQLPLlYvLpo4KgQL4E3uuCEQcI
 8IDMKNzwT+DDEJ7EDv8ZuYax0jSqryjFIH/MzNAuc30/s6RivTBtIg+lAb+K9PHogRwR
 xSNNkg8+XtG2leB+JVb4UVPsfcDOaxn7aoxX2fqvvpaMe5l82zlG25PkgtbK07ELULNw
 WdRTUkAwbikFhhtKBX1nrBozoe1214jLlnu6iyvePpDbjZ7I9ipxMPuW8ZwgRTuS9iqD
 4vZQ==
X-Gm-Message-State: ANhLgQ3slD706KuqqZoGvWP0G+QS9gaLm8CT9TviaILsDdtm7ozEp4Pf
 5zQbIoZEBpiLMzLeC1j+ofFPktxxgbE=
X-Google-Smtp-Source: ADFU+vtrc/7fZbVtSnH0fPwg24JWIbvyBeQhAA/NZiU8HqeVfKvnZ6jfWYqXhlehVKB5edw1BNp/9w==
X-Received: by 2002:a63:3083:: with SMTP id
 w125mr16400144pgw.282.1585626901433; 
 Mon, 30 Mar 2020 20:55:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id h11sm11386174pfq.56.2020.03.30.20.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 20:55:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.0] tcg/i386: Fix INDEX_op_dup2_vec
Date: Mon, 30 Mar 2020 20:54:47 -0700
Message-Id: <20200331035456.6494-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200331035456.6494-1-richard.henderson@linaro.org>
References: <20200331035456.6494-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were only constructing the 64-bit element, and not
replicating the 64-bit element across the rest of the vector.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

This bug is visible running RISU for aarch64 on x86_32.


r~

---
 tcg/i386/tcg-target.inc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 223dba9c8c..7f61eeedd0 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -2855,9 +2855,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         goto gen_simd;
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_dup2_vec:
-        /* Constraints have already placed both 32-bit inputs in xmm regs.  */
-        insn = OPC_PUNPCKLDQ;
-        goto gen_simd;
+        /* First merge the two 32-bit inputs to a single 64-bit element. */
+        tcg_out_vex_modrm(s, OPC_PUNPCKLDQ, a0, a1, a2);
+        /* Then replicate the 64-bit elements across the rest of the vector. */
+        if (type != TCG_TYPE_V64) {
+            tcg_out_dup_vec(s, type, MO_64, a0, a0);
+        }
+        break;
 #endif
     case INDEX_op_abs_vec:
         insn = abs_insn[vece];
-- 
2.20.1


